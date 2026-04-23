#!/bin/bash

# Configuration
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$DIR/outputs"
RESUME_EN="Alexandro_Disla_Resume_MercyCorps_EN"
RESUME_FR="Alexandro_Disla_CV_MercyCorps_FR"
CL_EN="Alexandro_Disla_CoverLetter_MercyCorps_EN"
CL_FR="Alexandro_Disla_CoverLetter_MercyCorps_FR"

echo "🚀 Starting build for Mercy Corps Haiti Application..."

# Function to build PDF and Word
build_doc() {
    local tex_file=$1
    local output_name=$2
    
    echo "📄 Processing $tex_file -> $output_name"
    
    # 1. Build PDF
    latexmk -pdf -jobname="$output_name" "$tex_file"
    mv "${output_name}.pdf" "$OUTPUT_DIR/"
    
    # 2. Build Word (Docx) via Pandoc
    # Note: We use a simplified version for pandoc to avoid complex latex issues in Word
    pandoc "$tex_file" -o "$OUTPUT_DIR/${output_name}.docx"
    
    # Clean up auxiliary files for this specific job
    latexmk -c -jobname="$output_name" "$tex_file"
}

# Ensure output directory exists
mkdir -p "$OUTPUT_DIR"

# Build Resumes
build_doc "$DIR/resume_en.tex" "$RESUME_EN"
build_doc "$DIR/resume_fr.tex" "$RESUME_FR"

# Build Cover Letters
build_doc "$DIR/cover_letter.tex" "$CL_EN"
build_doc "$DIR/cover_letter_fr.tex" "$CL_FR"

# Final Cleanup
echo "🧹 Final cleanup of remaining artifacts..."
rm -f *.fdb_latexmk *.fls *.synctex.gz *.log *.out *.aux

echo "✅ Build complete! Files available in: $OUTPUT_DIR"
ls -lh "$OUTPUT_DIR"
