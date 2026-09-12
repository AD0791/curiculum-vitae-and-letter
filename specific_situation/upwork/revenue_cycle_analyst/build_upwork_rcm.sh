#!/bin/bash

# Configuration
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$DIR/outputs"

# File Names
RESUME_EN="Alexandro_Disla_Resume_RevenueCycleAnalyst_EN"
CL_EN="Alexandro_Disla_CoverLetter_RevenueCycleAnalyst_EN"
DOSSIER="Alexandro_Disla_FinancialRevenueCycleAnalyst"

echo "🚀 Build — Upwork : Financial & Revenue Cycle Analyst (U.S. psychiatric practice)..."

mkdir -p "$OUTPUT_DIR"

# Builds a PDF from a LaTeX source
build_pdf() {
    local tex_file=$1
    local output_name=$2

    echo "📄 PDF : $(basename "$tex_file") -> $output_name.pdf"

    latexmk -pdf -silent -jobname="$output_name" "$tex_file" > /dev/null
    mv "${output_name}.pdf" "$OUTPUT_DIR/"

    latexmk -c -jobname="$output_name" "$tex_file" > /dev/null
}

# Builds the DOCX and copies the MD from the Markdown twin
build_word_and_md() {
    local md_file=$1
    local output_name=$2

    echo "📝 MD & Word : $(basename "$md_file") -> $output_name"

    cp "$md_file" "$OUTPUT_DIR/${output_name}.md"
    pandoc "$md_file" -o "$OUTPUT_DIR/${output_name}.docx"
}

# --- Execution ---

# 1. PDFs from LaTeX. The advert is in English; there is no French twin for this post.
build_pdf "$DIR/cover_letter.tex" "$CL_EN"
build_pdf "$DIR/resume_en.tex" "$RESUME_EN"

# 2. DOCX and MD from the Markdown twins
build_word_and_md "$DIR/cover_letter.md" "$CL_EN"
build_word_and_md "$DIR/resume_en.md" "$RESUME_EN"

# 3. Single merged PDF, in case the client prefers one attachment
#    Order: cover letter -> CV
echo "📎 Assembling the single-file dossier..."

pdfunite \
    "$OUTPUT_DIR/${CL_EN}.pdf" \
    "$OUTPUT_DIR/${RESUME_EN}.pdf" \
    "$OUTPUT_DIR/${DOSSIER}.pdf"

echo "   ✅ $DOSSIER.pdf — $(pdfinfo "$OUTPUT_DIR/${DOSSIER}.pdf" | awk '/^Pages/ {print $2}') pages"

# No credentials/ directory here, by design.
# Upwork takes proposal attachments, not a scanned dossier, and nothing in the CV or the
# letter claims an enclosed credential — both say the C.T.P.E.A attestation is "available on
# request". The source file, if the client asks for it, is:
#   ../../../attestation_diplomes/AlexandroDISLA_CTPEA_AttestationTemp.pdf

echo ""
echo "⚠️  Before sending:"
echo "   1. Render and LOOK at the PDFs — a page count proves nothing:"
echo "      pdftoppm -png -r 80 \"$OUTPUT_DIR/${DOSSIER}.pdf\" /tmp/rcm && open /tmp/rcm-1.png"
echo "   2. The proposal text is in proposal.md — paste it raw, add no formatting."
echo "   3. Upwork caps the cover-letter field at 5,000 characters. Check it still fits."
echo "   4. NO CONTACT DETAILS — Upwork rejects a submission carrying a phone number, an"
echo "      email address or an outside link, attachments included. This must print nothing:"
echo "      pdftotext \"$OUTPUT_DIR/${DOSSIER}.pdf\" - | grep -nE 'https?://|@|\\+509'"

# Fail loudly rather than shipping a submission Upwork will refuse.
if pdftotext "$OUTPUT_DIR/${DOSSIER}.pdf" - | grep -qE 'https?://|@|\+509|4148-3700'; then
    echo ""
    echo "❌ STOP: the merged PDF contains contact details. Upwork will refuse it."
    echo "   Check the \\address / \\extrainfo block in resume_en.tex and cover_letter.tex."
    exit 1
fi

# Final clean-up
echo ""
echo "🧹 Cleaning leftover LaTeX artefacts..."
rm -f "$DIR"/*.fdb_latexmk "$DIR"/*.fls "$DIR"/*.synctex.gz "$DIR"/*.log "$DIR"/*.out "$DIR"/*.aux

echo "✅ Build complete. Files in: $OUTPUT_DIR"
ls -lh "$OUTPUT_DIR"
