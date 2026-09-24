#!/bin/bash

# Configuration
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$DIR/outputs"

# File Names
CV_FR="Alexandro_Disla_CV_BRH_Recherche_FR"

echo "🚀 Build du CV co-chercheur économètre — proposition de recherche BRH..."

mkdir -p "$OUTPUT_DIR"
cd "$DIR" || exit 1

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

build_pdf "$DIR/cv_fr.tex" "$CV_FR"
build_word_and_md "$DIR/cv_fr.md" "$CV_FR"

# Nettoyage final
echo "🧹 Nettoyage des artefacts LaTeX restants..."
rm -f "$DIR"/*.fdb_latexmk "$DIR"/*.fls "$DIR"/*.synctex.gz "$DIR"/*.log "$DIR"/*.out "$DIR"/*.aux

echo "✅ Build terminé. Fichiers disponibles dans : $OUTPUT_DIR"
ls -lh "$OUTPUT_DIR"
