"""Fabrike apa_reference.docx : stil Word pandoc ap itilize pou modèl kontra a ak referans yo.

Kouri l ak : uv run --with python-docx python make_reference_docx.py <default.docx> <soti.docx> <logo.png> "<tèks antèt>"
<default.docx> soti nan : pandoc -o default.docx --print-default-data-file reference.docx
"""
import sys
import warnings

warnings.filterwarnings("ignore", category=UserWarning)

from docx import Document
from docx.enum.text import WD_TAB_ALIGNMENT
from docx.oxml import OxmlElement
from docx.oxml.ns import qn
from docx.shared import Cm, Pt, RGBColor

BLUE = RGBColor(0x3D, 0x61, 0xE9)
CORAL = RGBColor(0xFF, 0x48, 0x5E)
INK = RGBColor(0x1F, 0x29, 0x37)
GRAY = RGBColor(0x6B, 0x72, 0x80)

src, out, logo, head_text = sys.argv[1:5]
doc = Document(src)
styles = doc.styles


def font(style_name, name, size, color, bold=None):
    if style_name not in [s.name for s in styles]:
        return
    f = styles[style_name].font
    f.name = name
    f.size = Pt(size)
    f.color.rgb = color
    if bold is not None:
        f.bold = bold
    rfonts = styles[style_name].element.get_or_add_rPr().get_or_add_rFonts()
    for attr in ("w:ascii", "w:hAnsi", "w:cs", "w:eastAsia"):
        rfonts.set(qn(attr), name)
    # Polis tèm Word yo pase devan non polis la : retire yo.
    for attr in ("w:asciiTheme", "w:hAnsiTheme", "w:cstheme", "w:eastAsiaTheme"):
        rfonts.attrib.pop(qn(attr), None)


# Fira Sans ak Montserrat pa sou òdinatè APA yo : Word la itilize Arial, ak koulè APA yo.
BODY = HEAD = "Arial"
rpr_default = doc.styles.element.find(qn("w:docDefaults")).find(qn("w:rPrDefault")).find(qn("w:rPr"))
rfd = rpr_default.find(qn("w:rFonts"))
if rfd is not None:
    for attr in list(rfd.attrib):
        del rfd.attrib[attr]
    for attr in ("w:ascii", "w:hAnsi", "w:cs", "w:eastAsia"):
        rfd.set(qn(attr), BODY)

font("Normal", BODY, 10, INK)
for name in ("Body Text", "First Paragraph", "Compact", "Table"):
    font(name, BODY, 10, INK)
font("Title", HEAD, 20, INK, bold=True)
font("Subtitle", HEAD, 11, BLUE, bold=True)
font("Author", BODY, 9.5, GRAY)
font("Date", BODY, 9.5, GRAY)
font("Heading 1", HEAD, 12.5, BLUE, bold=True)
font("Heading 2", HEAD, 10.5, INK, bold=True)
font("Caption", BODY, 8.5, GRAY)
font("Image Caption", BODY, 8.5, GRAY)
font("Verbatim Char", "Courier New", 9, INK)

# Chan pou ranpli : fon jòn APA a
ph = styles.add_style("Chan pou ranpli", 2)  # 2 = CHARACTER
ph.font.name = BODY
shd = OxmlElement("w:shd")
shd.set(qn("w:val"), "clear")
shd.set(qn("w:color"), "auto")
shd.set(qn("w:fill"), "FEEB8F")
ph.element.get_or_add_rPr().append(shd)

# Tablo yo : liy ble pal, tèt tablo an gra
table = styles["Table"]
tblPr = table.element.find(qn("w:tblPr"))
if tblPr is None:
    tblPr = OxmlElement("w:tblPr")
    table.element.append(tblPr)
borders = OxmlElement("w:tblBorders")
for edge in ("top", "bottom", "insideH"):
    el = OxmlElement(f"w:{edge}")
    el.set(qn("w:val"), "single")
    el.set(qn("w:sz"), "4")
    el.set(qn("w:color"), "9EB0F4")
    borders.append(el)
tblPr.append(borders)

# Paj A4, maj 2 cm, logo nan antèt la, kontak nan pye paj la
for section in doc.sections:
    section.page_width, section.page_height = Cm(21), Cm(29.7)
    section.left_margin = section.right_margin = Cm(2)
    section.top_margin, section.bottom_margin = Cm(1.9), Cm(1.8)
    head = section.header.paragraphs[0]
    head.text = ""
    head.paragraph_format.tab_stops.add_tab_stop(Cm(17), WD_TAB_ALIGNMENT.RIGHT)
    head.add_run().add_picture(logo, height=Cm(0.75))
    r = head.add_run("\t" + head_text)
    r.font.size, r.font.color.rgb, r.font.name = Pt(8.5), GRAY, BODY
    foot = section.footer.paragraphs[0]
    foot.text = ""
    r = foot.add_run("Alexandro Disla · alexandrodisla@hotmail.com · (+509) 4148-3700")
    r.font.size, r.font.color.rgb, r.font.name = Pt(8.5), GRAY, BODY

doc.save(out)
