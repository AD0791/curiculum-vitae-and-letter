#!/bin/bash

# Configuration
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$DIR/outputs"
CREDENTIALS_DIR="$DIR/credentials"

# File Names
# One unified CV covers both posts: same candidate, same institution, same inbox.
CV="Alexandro_Disla_CV_FAES_FR"
REFS="Alexandro_Disla_References_FAES"
ATT_FR="Alexandro_Disla_Attestation_Tekkod_FR"
ATT_EN="Alexandro_Disla_Attestation_Tekkod_EN"
DOSSIER="Alexandro_Disla_FAES_Dossier_Candidature"

echo "🚀 Starting build for FAES — Programme HA-J0005..."

mkdir -p "$OUTPUT_DIR"

# Function to build PDF from LaTeX
build_pdf() {
    local tex_file=$1
    local output_name=$2

    echo "📄 Building PDF: $(basename "$tex_file") -> $output_name.pdf"

    latexmk -pdf -silent -jobname="$output_name" "$tex_file" > /dev/null
    mv "${output_name}.pdf" "$OUTPUT_DIR/"

    latexmk -c -jobname="$output_name" "$tex_file" > /dev/null
}

# Function to build Word and MD from Markdown
build_word_and_md() {
    local md_file=$1
    local output_name=$2

    echo "📝 Processing MD & Word: $(basename "$md_file") -> $output_name"

    cp "$md_file" "$OUTPUT_DIR/${output_name}.md"
    pandoc "$md_file" -o "$OUTPUT_DIR/${output_name}.docx"
}

# --- Execution ---

# 1. Build PDFs from LaTeX
build_pdf "$DIR/cv_fr.tex"                 "$CV"
build_pdf "$DIR/references.tex"            "$REFS"
build_pdf "$DIR/attestation_tekkod_fr.tex" "$ATT_FR"
build_pdf "$DIR/attestation_tekkod_en.tex" "$ATT_EN"

# 2. Build Word and MD from Markdown
build_word_and_md "$DIR/cv_fr.md"                 "$CV"
build_word_and_md "$DIR/references.md"            "$REFS"
build_word_and_md "$DIR/attestation_tekkod_fr.md" "$ATT_FR"
build_word_and_md "$DIR/attestation_tekkod_en.md" "$ATT_EN"

# 3. Collect the supporting documents from credentials/, converting images to PDF.
#    Sorted by filename, so the 01_ / 02_ ... prefixes control the order.
echo "📎 Collecting supporting documents..."

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

CREDENTIALS=()
if [ -d "$CREDENTIALS_DIR" ]; then
    while IFS= read -r cred; do
        # macOS ships bash 3.2, which has no ${var,,} — lowercase via tr instead.
        cred_lower=$(printf '%s' "$cred" | tr '[:upper:]' '[:lower:]')
        case "$cred_lower" in
            *.pdf)
                CREDENTIALS+=("$cred")
                ;;
            *.jpg|*.jpeg|*.png)
                converted="$TMP_DIR/$(basename "${cred%.*}").pdf"
                echo "   🖼  Converting $(basename "$cred") to PDF"
                sips -s format pdf "$cred" --out "$converted" > /dev/null 2>&1
                CREDENTIALS+=("$converted")
                ;;
            *)
                continue
                ;;
        esac
    done < <(find "$CREDENTIALS_DIR" -maxdepth 1 -type f ! -name 'README.md' ! -name '.*' | sort)
fi

# 4. Assemble the single dossier, valid for both posts.
#    Order: CV -> Tekkod certificate (FR) -> references -> diploma.
#    The English certificate stays a standalone file: the FAES tender is francophone, and an
#    English duplicate inside the dossier adds noise rather than evidence.
echo "📦 Assembling the merged dossier..."

PARTS=("$OUTPUT_DIR/${CV}.pdf" "$OUTPUT_DIR/${ATT_FR}.pdf" "$OUTPUT_DIR/${REFS}.pdf" "${CREDENTIALS[@]}")

pdfunite "${PARTS[@]}" "$OUTPUT_DIR/${DOSSIER}.pdf"
echo "   ✅ $DOSSIER.pdf — $(pdfinfo "$OUTPUT_DIR/${DOSSIER}.pdf" | awk '/^Pages/ {print $2}') pages from ${#PARTS[@]} documents"

if [ "${#CREDENTIALS[@]}" -eq 0 ]; then
    echo ""
    echo "⚠️  ATTENTION : aucune pièce justificative trouvée dans credentials/."
    echo "   Le dossier contient le CV, l'attestation Tekkod et les références,"
    echo "   mais il manque la COPIE DU DIPLÔME CTPEA, exigée par les deux annonces."
    echo "   Voir credentials/README.md, puis relancer ce script."
else
    echo ""
    echo "ℹ️  ${#CREDENTIALS[@]} pièce(s) justificative(s) fusionnée(s)."
fi

echo ""
echo "📌 Rappel : l'attestation Tekkod ne porte pas de signature. Sa vérification repose sur"
echo "   M. Jean Evans Pierre (+1 857 492-1040). Assure-toi qu'il connaît le contenu exact"
echo "   du document AVANT l'envoi — voir le courriel prévu dans email_prep.md."

# Final Cleanup
echo ""
echo "🧹 Final cleanup of remaining LaTeX artifacts..."
rm -f "$DIR"/*.fdb_latexmk "$DIR"/*.fls "$DIR"/*.synctex.gz "$DIR"/*.log "$DIR"/*.out "$DIR"/*.aux

echo "✅ Build complete! Files available in: $OUTPUT_DIR"
ls -lh "$OUTPUT_DIR"
