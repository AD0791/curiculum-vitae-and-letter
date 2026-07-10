#!/bin/bash

# Configuration
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$DIR/outputs"

# Noms des Fichiers pour Parole & Action (PA)
RESUME_FR="Alexandro_Disla_CV_PA_FR"
CL_FR="Alexandro_Disla_Lettre_Motivation_PA_FR"

echo "🚀 Starting build for Parole & Action Haiti Application..."

# S'assurer que le dossier de sortie existe
mkdir -p "$OUTPUT_DIR"

# Fonction pour compiler le PDF depuis LaTeX
build_pdf() {
    local tex_file=$1
    local output_name=$2
    
    if [ -f "$tex_file" ]; then
        echo "📄 Building PDF: $tex_file -> $output_name.pdf"
        latexmk -pdf -silent -jobname="$output_name" "$tex_file" > /dev/null
        mv "${output_name}.pdf" "$OUTPUT_DIR/"
        latexmk -c -jobname="$output_name" "$tex_file" > /dev/null
    else
        echo "⚠️ Warning: $tex_file not found. Skipping PDF build."
    fi
}

# Fonction pour compiler le Word (DOCX) et copier le MD depuis le Markdown
build_word_and_md() {
    local md_file=$1
    local output_name=$2
    
    if [ -f "$md_file" ]; then
        echo "📝 Processing MD & Word: $md_file -> $output_name"
        cp "$md_file" "$OUTPUT_DIR/${output_name}.md"
        pandoc "$md_file" -o "$OUTPUT_DIR/${output_name}.docx"
    else
        echo "⚠️ Warning: $md_file not found. Skipping MD/Word build."
    fi
}

# --- Exécution ---

# 1. Compilation des PDFs (LaTeX)
build_pdf "$DIR/resume_fr.tex" "$RESUME_FR"
build_pdf "$DIR/cover_letter_pa_fr.tex" "$CL_FR"

# 2. Compilation des versions Word & Markdown
build_word_and_md "$DIR/resume_fr.md" "$RESUME_FR"
build_word_and_md "$DIR/cover_letter_pa_fr.md" "$CL_FR"

# Nettoyage final des fichiers auxiliaires LaTeX
echo "🧹 Final cleanup of remaining artifacts..."
rm -f *.fdb_latexmk *.fls *.synctex.gz *.log *.out *.aux

echo "✅ Build complete! Files available in: $OUTPUT_DIR"
ls -lh "$OUTPUT_DIR"
