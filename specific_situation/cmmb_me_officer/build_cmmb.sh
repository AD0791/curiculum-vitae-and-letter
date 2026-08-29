#!/bin/bash

# Configuration
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$DIR/outputs"
CREDENTIALS_DIR="$DIR/credentials"

# File Names
RESUME_EN="Alexandro_Disla_Resume_CMMB_EN"
RESUME_FR="Alexandro_Disla_CV_CMMB_FR"
CL_EN="Alexandro_Disla_CoverLetter_CMMB_EN"
CL_FR="Alexandro_Disla_CoverLetter_CMMB_FR"
CREDENTIALS_PDF="Alexandro_Disla_Diplomas_Certificates"

echo "🚀 Starting build for CMMB Haiti — M&E Officer application..."

# Ensure output directory exists
mkdir -p "$OUTPUT_DIR"

# Function to build PDF from LaTeX
build_pdf() {
    local tex_file=$1
    local output_name=$2

    echo "📄 Building PDF: $(basename "$tex_file") -> $output_name.pdf"

    latexmk -pdf -silent -jobname="$output_name" "$tex_file" > /dev/null
    mv "${output_name}.pdf" "$OUTPUT_DIR/"

    # Clean up auxiliary files
    latexmk -c -jobname="$output_name" "$tex_file" > /dev/null
}

# Function to build Word and MD from Markdown
build_word_and_md() {
    local md_file=$1
    local output_name=$2

    echo "📝 Processing MD & Word: $(basename "$md_file") -> $output_name"

    # 1. Copy MD to output
    cp "$md_file" "$OUTPUT_DIR/${output_name}.md"

    # 2. Build Word (Docx) via Pandoc from MD (more reliable than LaTeX)
    pandoc "$md_file" -o "$OUTPUT_DIR/${output_name}.docx"
}

# --- Execution ---

# 1. Build PDFs from LaTeX (for high-quality professional versions)
build_pdf "$DIR/cover_letter.tex" "$CL_EN"
build_pdf "$DIR/resume_en.tex" "$RESUME_EN"
build_pdf "$DIR/cover_letter_fr.tex" "$CL_FR"
build_pdf "$DIR/resume_fr.tex" "$RESUME_FR"

# 2. Build Word and MD from Markdown (for compatibility and easy editing)
build_word_and_md "$DIR/cover_letter.md" "$CL_EN"
build_word_and_md "$DIR/resume_en.md" "$RESUME_EN"
build_word_and_md "$DIR/cover_letter_fr.md" "$CL_FR"
build_word_and_md "$DIR/resume_fr.md" "$RESUME_FR"

# 3. Assemble the diplomas-and-certificates PDF.
#    CMMB asks for "CV, Cover Letter, and copies of academic diplomas and certificates" as
#    three separate items, so — unlike the Samaritan's Purse build — only the supporting
#    documents are merged. The CV and the cover letter go out as their own attachments.
echo "📎 Assembling the diplomas and certificates PDF..."

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

MERGE_LIST=()

if [ -d "$CREDENTIALS_DIR" ]; then
    # Sorted by filename so the 01_ / 02_ ... prefixes control the order.
    while IFS= read -r cred; do
        # macOS ships bash 3.2, which has no ${var,,} — lowercase via tr instead.
        cred_lower=$(printf '%s' "$cred" | tr '[:upper:]' '[:lower:]')
        case "$cred_lower" in
            *.pdf)
                MERGE_LIST+=("$cred")
                ;;
            *.jpg|*.jpeg|*.png)
                converted="$TMP_DIR/$(basename "${cred%.*}").pdf"
                echo "   🖼  Converting $(basename "$cred") to PDF"
                sips -s format pdf "$cred" --out "$converted" > /dev/null 2>&1
                MERGE_LIST+=("$converted")
                ;;
            *)
                continue
                ;;
        esac
    done < <(find "$CREDENTIALS_DIR" -maxdepth 1 -type f ! -name 'README.md' ! -name '.*' | sort)
fi

if [ "${#MERGE_LIST[@]}" -eq 0 ]; then
    echo ""
    echo "⚠️  WARNING: no supporting documents found in credentials/."
    echo "   CMMB requires copies of academic diplomas and certificates alongside the CV and"
    echo "   cover letter. $CREDENTIALS_PDF.pdf was NOT produced."
    echo "   See credentials/README.md, then re-run this script."
elif [ "${#MERGE_LIST[@]}" -eq 1 ]; then
    cp "${MERGE_LIST[0]}" "$OUTPUT_DIR/${CREDENTIALS_PDF}.pdf"
    echo "   ✅ $CREDENTIALS_PDF.pdf — 1 document (nothing to merge)"
else
    pdfunite "${MERGE_LIST[@]}" "$OUTPUT_DIR/${CREDENTIALS_PDF}.pdf"
    echo "   ✅ $CREDENTIALS_PDF.pdf — $(pdfinfo "$OUTPUT_DIR/${CREDENTIALS_PDF}.pdf" | awk '/^Pages/ {print $2}') pages from ${#MERGE_LIST[@]} documents"
fi

# Final Cleanup
echo ""
echo "🧹 Final cleanup of remaining LaTeX artifacts..."
rm -f "$DIR"/*.fdb_latexmk "$DIR"/*.fls "$DIR"/*.synctex.gz "$DIR"/*.log "$DIR"/*.out "$DIR"/*.aux

echo ""
echo "✅ Build complete! Files available in: $OUTPUT_DIR"
echo ""
echo "📧 Send exactly three attachments (see email_prep.md):"
echo "   1. ${RESUME_EN}.pdf"
echo "   2. ${CL_EN}.pdf"
echo "   3. ${CREDENTIALS_PDF}.pdf"
echo "   The French pair is built and held in reserve — send only if asked."
echo ""
ls -lh "$OUTPUT_DIR"
