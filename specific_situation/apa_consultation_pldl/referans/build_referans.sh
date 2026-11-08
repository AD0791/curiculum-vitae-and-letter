#!/bin/bash
# Build de la page de références pour APA (kreyòl, thème APA), seule : PDF + DOCX dans outputs/.

set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(dirname "$DIR")"
OUT="$ROOT/outputs/Alexandro_Disla_Referans_APA"
cd "$DIR"

# Christ-Love Henry est déjà chez APA : jamais dans ces références.
if grep -qi 'henry' referans.md; then
    echo "❌ referans.md mentionne Christ-Love Henry."; exit 1
fi
if grep -q 'a konplete' referans.md; then
    echo "❌ referans.md : un contact est encore [a konplete]."; exit 1
fi

echo "📜 referans.md -> $(basename "$OUT").pdf + .docx"
mkdir -p "$ROOT/outputs"
pandoc referans.md -o "$OUT.pdf" --pdf-engine=xelatex \
    -H "$ROOT/pwopozisyon/apa_header.tex" -H referans_header.tex

pandoc -o .default.docx --print-default-data-file reference.docx
uv run --quiet --with python-docx python "$ROOT/kontra/make_reference_docx.py" \
    .default.docx .ref.docx "$ROOT/assets/apa_logo.png" "Referans pwofesyonèl · Alexandro Disla"
pandoc referans.md -o "$OUT.docx" --reference-doc=.ref.docx
rm -f .default.docx .ref.docx

pages=$(pdfinfo "$OUT.pdf" | awk '/^Pages:/ {print $2}')
if [ "$pages" -ne 1 ]; then
    echo "⚠️  $(basename "$OUT").pdf fait $pages pages (1 attendue)."; exit 1
fi
echo "✅ $(basename "$OUT").pdf : 1 page, + .docx"
