#!/bin/bash

# Configuration
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$DIR/outputs"
# Les pièces justificatives vivent dans le dossier central du dépôt, pas dans cette candidature :
# elles servent à toutes les candidatures et ne doivent exister qu'en un seul exemplaire.
CREDENTIALS_DIR="$DIR/../../attestation_diplomes"

# File Names
# One unified CV covers both posts: same candidate, same UGP, same inbox (ugp.mast@gmail.com).
# The cover letters differ, because each one names the post it applies to — so the dossier is
# assembled twice, once per post, around the same CV and the same supporting documents.
CV="Alexandro_Disla_CV_PSARA_FR"
CL_ANALYSTE="Alexandro_Disla_LettreMotivation_PSARA_Analyste"
CL_DEV="Alexandro_Disla_LettreMotivation_PSARA_Developpeur"
DOSSIER_ANALYSTE="Alexandro_Disla_PSARA_Data_Analyste"
DOSSIER_DEV="Alexandro_Disla_PSARA_Developpeur_Application_Web"

echo "🚀 Build du dossier UGP-MAST — Projet PSARA (Banque mondiale)..."
echo "   Échéance : 22 septembre 2026 · ugp.mast@gmail.com · un (1) seul fichier PDF par poste"
echo ""

mkdir -p "$OUTPUT_DIR"

# Function to build PDF from LaTeX
build_pdf() {
    local tex_file=$1
    local output_name=$2

    echo "📄 PDF : $(basename "$tex_file") -> $output_name.pdf"

    latexmk -pdf -silent -jobname="$output_name" "$tex_file" > /dev/null
    mv "${output_name}.pdf" "$OUTPUT_DIR/"

    latexmk -c -jobname="$output_name" "$tex_file" > /dev/null
}

# Function to build Word and MD from Markdown
build_word_and_md() {
    local md_file=$1
    local output_name=$2

    echo "📝 MD & Word : $(basename "$md_file") -> $output_name"

    cp "$md_file" "$OUTPUT_DIR/${output_name}.md"
    pandoc "$md_file" -o "$OUTPUT_DIR/${output_name}.docx"
}

# --- Execution ---

# 1. The unified CV, shared by both applications.
build_pdf "$DIR/cv_fr.tex" "$CV"
build_word_and_md "$DIR/cv_fr.md" "$CV"

# 2. The two cover letters, built only if present.
[ -f "$DIR/cover_letter_analyste_fr.tex" ] && build_pdf "$DIR/cover_letter_analyste_fr.tex" "$CL_ANALYSTE"
[ -f "$DIR/cover_letter_analyste_fr.md" ]  && build_word_and_md "$DIR/cover_letter_analyste_fr.md" "$CL_ANALYSTE"
[ -f "$DIR/cover_letter_developpeur_fr.tex" ] && build_pdf "$DIR/cover_letter_developpeur_fr.tex" "$CL_DEV"
[ -f "$DIR/cover_letter_developpeur_fr.md" ]  && build_word_and_md "$DIR/cover_letter_developpeur_fr.md" "$CL_DEV"

# 3. Collect the supporting documents from credentials/, converting images to PDF.
#    Sorted by filename, so the 01_ / 02_ ... prefixes control the order.
echo ""
echo "📎 Collecte des pièces justificatives..."

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
                echo "   🖼  Conversion de $(basename "$cred") en PDF"
                sips -s format pdf "$cred" --out "$converted" > /dev/null 2>&1
                CREDENTIALS+=("$converted")
                ;;
            *)
                continue
                ;;
        esac
    done < <(find "$CREDENTIALS_DIR" -maxdepth 1 -type f ! -name 'README.md' ! -name '.*' | sort)
fi

# 4. Assemble one dossier per post.
#    Both announcements ask for the same three items in a single PDF, in this order:
#    lettre de motivation -> curriculum vitae -> copie des attestations et diplômes.
assemble_dossier() {
    local letter_pdf="$OUTPUT_DIR/$1.pdf"
    local dossier_name=$2
    local label=$3

    if [ ! -f "$letter_pdf" ]; then
        echo "   ⏭  $label : lettre de motivation absente, dossier non assemblé."
        return
    fi

    local parts=("$letter_pdf" "$OUTPUT_DIR/${CV}.pdf" "${CREDENTIALS[@]}")
    pdfunite "${parts[@]}" "$OUTPUT_DIR/${dossier_name}.pdf"
    echo "   ✅ $dossier_name.pdf — $(pdfinfo "$OUTPUT_DIR/${dossier_name}.pdf" | awk '/^Pages/ {print $2}') pages, ${#parts[@]} documents"
}

echo ""
echo "📦 Assemblage des dossiers (un PDF unique par poste)..."
assemble_dossier "$CL_ANALYSTE" "$DOSSIER_ANALYSTE" "Data Analyste"
assemble_dossier "$CL_DEV"      "$DOSSIER_DEV"      "Développeur d'Applications Web"

if [ "${#CREDENTIALS[@]}" -eq 0 ]; then
    echo ""
    echo "⚠️  ATTENTION : aucune pièce justificative trouvée dans credentials/."
    echo "   Les deux annonces exigent la COPIE DES ATTESTATIONS ET DIPLÔMES dans le PDF unique."
    echo "   Voir credentials/README.md, puis relancer ce script."
else
    echo ""
    echo "ℹ️  ${#CREDENTIALS[@]} pièce(s) justificative(s) fusionnée(s) dans chaque dossier."
fi

# Final Cleanup
echo ""
echo "🧹 Nettoyage des artefacts LaTeX..."
rm -f "$DIR"/*.fdb_latexmk "$DIR"/*.fls "$DIR"/*.synctex.gz "$DIR"/*.log "$DIR"/*.out "$DIR"/*.aux

echo ""
echo "✅ Build terminé. Fichiers dans : $OUTPUT_DIR"
ls -lh "$OUTPUT_DIR"
