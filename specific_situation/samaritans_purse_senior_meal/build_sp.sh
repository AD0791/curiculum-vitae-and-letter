#!/bin/bash

# Configuration
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$DIR/outputs"
CREDENTIALS_DIR="$DIR/credentials"

# File Names
RESUME_EN="Alexandro_Disla_Resume_SamaritansPurse_EN"
RESUME_FR="Alexandro_Disla_CV_SamaritansPurse_FR"
CL_EN="Alexandro_Disla_CoverLetter_SamaritansPurse_EN"
CL_FR="Alexandro_Disla_CoverLetter_SamaritansPurse_FR"
DOSSIER="Alexandro_Disla_SeniorMEALOfficer_Application"

echo "🚀 Starting build for Samaritan's Purse Haiti — Senior MEAL Officer application..."

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

# 3. Assemble the single-PDF dossier required by Samaritan's Purse
#    Order: CL EN -> Resume EN -> CL FR -> CV FR -> credentials (sorted by filename)
echo "📎 Assembling the single-PDF dossier..."

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

MERGE_LIST=(
    "$OUTPUT_DIR/${CL_EN}.pdf"
    "$OUTPUT_DIR/${RESUME_EN}.pdf"
    "$OUTPUT_DIR/${CL_FR}.pdf"
    "$OUTPUT_DIR/${RESUME_FR}.pdf"
)

CREDENTIAL_COUNT=0
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
        CREDENTIAL_COUNT=$((CREDENTIAL_COUNT + 1))
    done < <(find "$CREDENTIALS_DIR" -maxdepth 1 -type f ! -name 'README.md' ! -name '.*' | sort)
fi

pdfunite "${MERGE_LIST[@]}" "$OUTPUT_DIR/${DOSSIER}.pdf"
echo "   ✅ $DOSSIER.pdf — $(pdfinfo "$OUTPUT_DIR/${DOSSIER}.pdf" | awk '/^Pages/ {print $2}') pages from ${#MERGE_LIST[@]} documents"

if [ "$CREDENTIAL_COUNT" -eq 0 ]; then
    echo ""
    echo "⚠️  WARNING: no supporting documents found in credentials/."
    echo "   The dossier currently holds only the cover letters and CVs."
    echo "   Samaritan's Purse requires diplomas, certificates, NUI and NIF in the same PDF,"
    echo "   and states that incomplete applications will not be considered."
    echo "   See credentials/README.md, then re-run this script."
else
    echo ""
    echo "ℹ️  $CREDENTIAL_COUNT supporting document(s) merged. Open the PDF and confirm that the"
    echo "   NUI and NIF pages are actually present before sending."
fi

# Final Cleanup
echo ""
echo "🧹 Final cleanup of remaining LaTeX artifacts..."
rm -f "$DIR"/*.fdb_latexmk "$DIR"/*.fls "$DIR"/*.synctex.gz "$DIR"/*.log "$DIR"/*.out "$DIR"/*.aux

echo "✅ Build complete! Files available in: $OUTPUT_DIR"
ls -lh "$OUTPUT_DIR"
