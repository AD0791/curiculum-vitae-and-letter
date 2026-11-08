"""Mete de chan siyati elektwonik (/Sig) nan kare siyati kontra a.

Kouri l ak : uv run --with pyhanko --with pypdf python add_sig_fields.py <kontra.pdf>
Filt kontra_filters.lua a mete yon mak blan (SIGMARK...) anba agoch chak kare ; script la li
pozisyon mak yo ak `pdftotext -bbox`, epi li mete chan an sou kare a. Konsa chan yo swiv paj la
menm si tèks la deplase.
Li monte chan tèks yo tou : ak xelatex, hyperref mete yo yon liy pi ba pase etikèt yo.
"""
import re
import subprocess
import sys

from pypdf import PdfReader, PdfWriter
from pypdf.generic import ArrayObject, FloatObject, NameObject
from pyhanko.pdf_utils.incremental_writer import IncrementalPdfFileWriter
from pyhanko.sign.fields import SigFieldSpec, append_signature_field

BOX_W = 5.4 / 2.54 * 72  # lajè kare a (5,4 cm) an pwen PDF
BOX_H = 1.3 / 2.54 * 72  # wotè kare a (1,3 cm)
TX_SHIFT = 11.0  # konbyen pwen pou monte chan tèks yo
MARKS = {"SIGMARKAPA": "SiyatiAPA", "SIGMARKKONSILTAN": "SiyatiKonsiltan"}

path = sys.argv[1]

# 1. Monte chan tèks yo pou yo aliye ak etikèt yo.
reader = PdfReader(path)
writer = PdfWriter(clone_from=reader)
for pg in writer.pages:
    for ref in pg.get("/Annots", []):
        annot = ref.get_object()
        if annot.get("/FT") == "/Tx":
            r = [float(v) for v in annot["/Rect"]]
            r[1] += TX_SHIFT
            r[3] += TX_SHIFT
            annot[NameObject("/Rect")] = ArrayObject(FloatObject(v) for v in r)
with open(path, "wb") as f:
    writer.write(f)

# 2. Chan siyati yo, sou kare yo.
bbox = subprocess.run(["pdftotext", "-bbox", path, "-"], capture_output=True, text=True,
                      check=True).stdout

specs, page, height = [], -1, 0.0
for line in bbox.splitlines():
    m = re.search(r'<page width="[\d.]+" height="([\d.]+)"', line)
    if m:
        page, height = page + 1, float(m.group(1))
        continue
    m = re.search(r'xMin="([\d.]+)" yMin="[\d.]+" xMax="[\d.]+" yMax="([\d.]+)">(SIGMARK\w+)<', line)
    if m and m.group(3) in MARKS:
        x, y_bottom = float(m.group(1)), height - float(m.group(2))
        specs.append(SigFieldSpec(sig_field_name=MARKS[m.group(3)], on_page=page,
                                  box=(int(x), int(y_bottom), int(x + BOX_W), int(y_bottom + BOX_H))))

if len(specs) != len(MARKS):
    sys.exit(f"❌ {len(specs)} mak siyati jwenn nan {path}, {len(MARKS)} te espere.")

with open(path, "rb") as f:
    writer = IncrementalPdfFileWriter(f)
    for spec in specs:
        append_signature_field(writer, spec)
    with open(path + ".tmp", "wb") as out:
        writer.write(out)
subprocess.run(["mv", path + ".tmp", path], check=True)
print(f"✍️  {len(specs)} chan siyati elektwonik ajoute")
