#!/bin/bash

# Configuration
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$DIR/outputs"
CREDENTIALS_DIR="$DIR/credentials"

# File Names
CV_FR="Alexandro_Disla_CV_CRS_MEAL_FR"
CL_FR="Alexandro_Disla_LettreMotivation_CRS_MEAL_FR"
CREDENTIALS_PDF="Alexandro_Disla_Diplomes_CRS"

echo "🚀 Build du dossier Catholic Relief Services — Senior Project Officer MEAL (RAPID)..."

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
# CRS demande trois pièces envoyées par courriel — lettre de motivation, CV détaillé et copies
# de diplômes — en pièces jointes distinctes. Il n'y a donc PAS de PDF de dossier fusionné :
# seules les copies de diplômes sont réunies en un fichier, pour n'envoyer qu'une pièce jointe
# par catégorie.

build_pdf "$DIR/cover_letter_fr.tex" "$CL_FR"
build_pdf "$DIR/cv_fr.tex" "$CV_FR"

build_word_and_md "$DIR/cover_letter_fr.md" "$CL_FR"
build_word_and_md "$DIR/cv_fr.md" "$CV_FR"

# Assemblage des copies de diplômes
echo ""
echo "📎 Assemblage des copies de diplômes..."

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

MERGE_LIST=()
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
    done < <(find "$CREDENTIALS_DIR" -maxdepth 1 -type f ! -name 'README.md' ! -name '.*' | sort)
fi

if [ "${#MERGE_LIST[@]}" -eq 0 ]; then
    echo ""
    echo "⚠️  ATTENTION : aucune copie de diplôme trouvée dans credentials/."
    echo "   CRS exige « une lettre de motivation, un CV détaillé et des copies de diplômes »."
    echo "   Le CV et la lettre renvoient explicitement à l'attestation C.T.P.E.A jointe."
    echo "   Voir credentials/README.md, puis relancer ce script."
elif [ "${#MERGE_LIST[@]}" -eq 1 ]; then
    cp "${MERGE_LIST[0]}" "$OUTPUT_DIR/${CREDENTIALS_PDF}.pdf"
    echo "   ✅ $CREDENTIALS_PDF.pdf — 1 document (rien à fusionner)"
else
    pdfunite "${MERGE_LIST[@]}" "$OUTPUT_DIR/${CREDENTIALS_PDF}.pdf"
    echo "   ✅ $CREDENTIALS_PDF.pdf — $(pdfinfo "$OUTPUT_DIR/${CREDENTIALS_PDF}.pdf" | awk '/^Pages/ {print $2}') pages issues de ${#MERGE_LIST[@]} documents"
fi

# Contrôle de pagination
CL_PAGES=$(pdfinfo "$OUTPUT_DIR/${CL_FR}.pdf" | awk '/^Pages/ {print $2}')
CV_PAGES=$(pdfinfo "$OUTPUT_DIR/${CV_FR}.pdf" | awk '/^Pages/ {print $2}')
echo ""
echo "📑 Lettre : $CL_PAGES page(s)   |   CV : $CV_PAGES page(s)"
if [ "$CL_PAGES" -gt 1 ]; then
    echo "⚠️  La lettre dépasse une page. Couper du texte, ou passer 11pt -> 10pt."
    echo "   Ne jamais toucher au 'scale' de geometry pour forcer la pagination."
fi

# Nettoyage final
echo ""
echo "🧹 Nettoyage des artefacts LaTeX restants..."
rm -f "$DIR"/*.fdb_latexmk "$DIR"/*.fls "$DIR"/*.synctex.gz "$DIR"/*.log "$DIR"/*.out "$DIR"/*.aux

echo ""
echo "✅ Build terminé. RAPPEL : le courriel n'est que l'ÉTAPE 2."
echo "   Le formulaire en ligne doit être rempli AVANT, sinon le dossier est rejeté."
ls -lh "$OUTPUT_DIR"
