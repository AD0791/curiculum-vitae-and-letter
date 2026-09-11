#!/bin/bash

# Configuration
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$DIR/outputs"

# File Names
CV_FR="Alexandro_Disla_CV_Panos_MEL_FR"
CL_FR="Alexandro_Disla_LettreMotivation_Panos_MEL_FR"

echo "🚀 Build du dossier Institut Panos — Responsable MEL/ACQ (AFGHS-PANOS)..."

mkdir -p "$OUTPUT_DIR"

# Construit un PDF à partir d'une source LaTeX
build_pdf() {
    local tex_file=$1
    local output_name=$2

    echo "📄 PDF : $(basename "$tex_file") -> $output_name.pdf"

    latexmk -pdf -silent -jobname="$output_name" "$tex_file" > /dev/null
    mv "${output_name}.pdf" "$OUTPUT_DIR/"

    latexmk -c -jobname="$output_name" "$tex_file" > /dev/null
}

# Construit le DOCX et copie le MD à partir du jumeau Markdown
build_word_and_md() {
    local md_file=$1
    local output_name=$2

    echo "📝 MD & Word : $(basename "$md_file") -> $output_name"

    cp "$md_file" "$OUTPUT_DIR/${output_name}.md"
    pandoc "$md_file" -o "$OUTPUT_DIR/${output_name}.docx"
}

# --- Exécution ---
#
# Panos ne demande que deux pièces — « CV et brève lettre de motivation » — envoyées par
# courriel. Pas de PDF fusionné, pas de credentials/ : l'annonce ne réclame ni diplôme ni
# pièce d'identité, et le dossier ne fabrique que ce qui est demandé.

build_pdf "$DIR/cover_letter_fr.tex" "$CL_FR"
build_pdf "$DIR/cv_fr.tex" "$CV_FR"

build_word_and_md "$DIR/cover_letter_fr.md" "$CL_FR"
build_word_and_md "$DIR/cv_fr.md" "$CV_FR"

# Contrôle de pagination : la lettre doit tenir sur une page, l'annonce la voulant « brève ».
CL_PAGES=$(pdfinfo "$OUTPUT_DIR/${CL_FR}.pdf" | awk '/^Pages/ {print $2}')
CV_PAGES=$(pdfinfo "$OUTPUT_DIR/${CV_FR}.pdf" | awk '/^Pages/ {print $2}')

echo ""
echo "📑 Lettre de motivation : $CL_PAGES page(s)   |   CV : $CV_PAGES page(s)"

if [ "$CL_PAGES" -gt 1 ]; then
    echo ""
    echo "⚠️  ATTENTION : la lettre dépasse une page alors que l'annonce demande une lettre"
    echo "   « brève ». Coupez du texte, ou passez de 11pt à 10pt — ne touchez jamais au"
    echo "   'scale' de geometry pour forcer la pagination."
fi

# Nettoyage final
echo ""
echo "🧹 Nettoyage des artefacts LaTeX restants..."
rm -f "$DIR"/*.fdb_latexmk "$DIR"/*.fls "$DIR"/*.synctex.gz "$DIR"/*.log "$DIR"/*.out "$DIR"/*.aux

echo ""
echo "✅ Build terminé. Deux pièces jointes à envoyer depuis : $OUTPUT_DIR"
echo "   1. ${CL_FR}.pdf"
echo "   2. ${CV_FR}.pdf"
ls -lh "$OUTPUT_DIR"
