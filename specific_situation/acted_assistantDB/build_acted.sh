#!/bin/bash

# Configuration
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$DIR/outputs"

# File Names
RESUME_EN="Alexandro_Disla_Resume_ACTED_EN"
RESUME_FR="Alexandro_Disla_CV_ACTED_FR"
CL_EN="Alexandro_Disla_CoverLetter_ACTED_EN"
CL_FR="Alexandro_Disla_CoverLetter_ACTED_FR"

echo "🚀 Starting build for ACTED Database Assistant Application..."

# Ensure output directory exists
mkdir -p "$OUTPUT_DIR"

# Function to build PDF from LaTeX
build_pdf() {
    local tex_file=$1
    local output_name=$2
    
    echo "📄 Building PDF: $tex_file -> $output_name.pdf"
    
    latexmk -pdf -silent -jobname="$output_name" "$tex_file" > /dev/null
    mv "${output_name}.pdf" "$OUTPUT_DIR/"
    
    # Clean up auxiliary files
    latexmk -c -jobname="$output_name" "$tex_file" > /dev/null
}

# Function to build Word and MD from Markdown
build_word_and_md() {
    local md_file=$1
    local output_name=$2
    
    echo "📝 Processing MD & Word: $md_file -> $output_name"
    
    # 1. Copy MD to output
    cp "$md_file" "$OUTPUT_DIR/${output_name}.md"
    
    # 2. Build Word (Docx) via Pandoc from MD (more reliable than LaTeX)
    pandoc "$md_file" -o "$OUTPUT_DIR/${output_name}.docx"
}

# --- Execution ---

# 1. Build PDFs from LaTeX (for high-quality professional versions)
build_pdf "$DIR/resume_en.tex" "$RESUME_EN"
build_pdf "$DIR/resume_fr.tex" "$RESUME_FR"
build_pdf "$DIR/cover_letter.tex" "$CL_EN"
build_pdf "$DIR/cover_letter_fr.tex" "$CL_FR"

# 2. Build Word and MD from Markdown (for compatibility and easy editing)
build_word_and_md "$DIR/resume_en.md" "$RESUME_EN"
build_word_and_md "$DIR/resume_fr.md" "$RESUME_FR"
build_word_and_md "$DIR/cover_letter.md" "$CL_EN"
build_word_and_md "$DIR/cover_letter_fr.md" "$CL_FR"

# Final Cleanup
echo "🧹 Final cleanup of remaining LaTeX artifacts..."
rm -f *.fdb_latexmk *.fls *.synctex.gz *.log *.out *.aux

echo "✅ Build complete! Files available in: $OUTPUT_DIR"
ls -lh "$OUTPUT_DIR"
