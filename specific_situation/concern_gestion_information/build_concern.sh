#!/bin/bash

# Configuration
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$DIR/outputs"
CREDENTIALS_DIR="$DIR/credentials"

# File Names
CV_FR="Alexandro_Disla_CV_Concern_GestionInformation_FR"
CL_FR="Alexandro_Disla_LettreMotivation_Concern_GestionInformation_FR"
DOSSIER="Alexandro_Disla_Dossier_DP-CGI1210-2026"

echo "🚀 Build du dossier Concern Worldwide Haïti — Chargé.e Gestion de l'Information (DP/CGI1210/2026)..."

mkdir -p "$OUTPUT_DIR"

build_pdf() {
    local tex_file=$1
    local output_name=$2

    echo "📄 PDF : $(basename "$tex_file") -> $output_name.pdf"

    latexmk -pdf -silent -jobname="$output_name" "$tex_file" > /dev/null
    mv "${output_name}.pdf" "$OUTPUT_DIR/"

    latexmk -c -jobname="$output_name" "$tex_file" > /dev/null
}

build_word_and_md() {
    local md_file=$1
    local output_name=$2

    echo "📝 MD & Word : $(basename "$md_file") -> $output_name"

    cp "$md_file" "$OUTPUT_DIR/${output_name}.md"
    pandoc "$md_file" -o "$OUTPUT_DIR/${output_name}.docx"
}

# --- Exécution ---
#
# L'annonce ne demande que « CV et lettre de motivation ». L'attestation C.T.P.E.A part quand même :
# le poste exige un Bac+4, et le CV comme la lettre renvoient à la pièce jointe pour dire où en est
# le diplôme. Le script produit chaque pièce séparément ET un PDF unique qui les réunit.

cd "$DIR" || exit 1

build_pdf "$DIR/cover_letter_fr.tex" "$CL_FR"
build_pdf "$DIR/cv_fr.tex" "$CV_FR"

build_word_and_md "$DIR/cover_letter_fr.md" "$CL_FR"
build_word_and_md "$DIR/cv_fr.md" "$CV_FR"

# Assemblage du dossier en un seul PDF
# Ordre : Lettre -> CV -> pièces de credentials/ (triées par nom de fichier)
echo ""
echo "📎 Assemblage du dossier en un seul PDF..."

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

MERGE_LIST=(
    "$OUTPUT_DIR/${CL_FR}.pdf"
    "$OUTPUT_DIR/${CV_FR}.pdf"
)

HAS_ATTESTATION=0
if [ -d "$CREDENTIALS_DIR" ]; then
    while IFS= read -r cred; do
        # macOS livre bash 3.2, sans ${var,,} — minuscules via tr.
        cred_lower=$(printf '%s' "$cred" | tr '[:upper:]' '[:lower:]')
        case "$cred_lower" in
            *.pdf)
                MERGE_LIST+=("$cred")
                ;;
            *.jpg|*.jpeg|*.png)
                converted="$TMP_DIR/$(basename "${cred%.*}").pdf"
                echo "   🖼  Conversion de $(basename "$cred") en PDF"
                sips -s format pdf "$cred" --out "$converted" > /dev/null 2>&1
                MERGE_LIST+=("$converted")
                ;;
            *)
                continue
                ;;
        esac
        case "$cred_lower" in
            *attestation*|*ctpea*) HAS_ATTESTATION=1 ;;
        esac
    done < <(find "$CREDENTIALS_DIR" -maxdepth 1 -type f ! -name 'README.md' ! -name '.*' | sort)
fi

pdfunite "${MERGE_LIST[@]}" "$OUTPUT_DIR/${DOSSIER}.pdf"
echo "   ✅ $DOSSIER.pdf — $(pdfinfo "$OUTPUT_DIR/${DOSSIER}.pdf" | awk '/^Pages/ {print $2}') pages issues de ${#MERGE_LIST[@]} documents"

if [ "$HAS_ATTESTATION" -eq 0 ]; then
    echo ""
    echo "⚠️  ATTENTION : attestation C.T.P.E.A absente de credentials/."
    echo "   Le CV et la lettre y renvoient explicitement (« attestation officielle jointe »)."
fi

# Contrôle de pagination
CL_PAGES=$(pdfinfo "$OUTPUT_DIR/${CL_FR}.pdf" | awk '/^Pages/ {print $2}')
CV_PAGES=$(pdfinfo "$OUTPUT_DIR/${CV_FR}.pdf" | awk '/^Pages/ {print $2}')
echo ""
echo "📑 Lettre : $CL_PAGES page(s)   |   CV : $CV_PAGES page(s)"
if [ "$CL_PAGES" -gt 1 ]; then
    echo "⚠️  La lettre dépasse une page. Couper du texte ; ne jamais toucher au 'scale' de geometry."
fi

# Nettoyage final
echo ""
echo "🧹 Nettoyage des artefacts LaTeX restants..."
rm -f "$DIR"/*.fdb_latexmk "$DIR"/*.fls "$DIR"/*.synctex.gz "$DIR"/*.log "$DIR"/*.out "$DIR"/*.aux

echo ""
echo "✅ Build terminé. Envoi à recrutement.haiti@concern.net — objet imposé : DP/CGI1210/2026- Alexandro Disla"
echo "   Voir email_prep.md et emails.md."
ls -lh "$OUTPUT_DIR"
