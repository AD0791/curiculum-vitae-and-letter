#!/bin/bash

# Configuration
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$DIR/outputs"
CREDENTIALS_DIR="$DIR/credentials"

# File Names
CL_FR="Alexandro_Disla_LettreMotivation_GOAL_FR"
CV_FR="Alexandro_Disla_CV_GOAL_FR"
REFS="Alexandro_Disla_References_GOAL"
DOSSIER="Alexandro_Disla_OfficierRedevabilite_GOAL"

echo "🚀 Build du dossier GOAL Haïti — Officier(ère) de Redevabilité..."

mkdir -p "$OUTPUT_DIR"

# Construit un PDF à partir d'une source LaTeX
build_pdf() {
    local tex_file=$1
    local output_name=$2

    echo "📄 PDF : $(basename "$tex_file") -> $output_name.pdf"

    latexmk -pdf -silent -jobname="$output_name" "$tex_file" > /dev/null
    mv "${output_name}.pdf" "$OUTPUT_DIR/"

    latexmk -c -jobname="$output_name" "$tex_file" > /dev/null
}

# Construit le DOCX et copie le MD à partir du jumeau Markdown
build_word_and_md() {
    local md_file=$1
    local output_name=$2

    echo "📝 MD & Word : $(basename "$md_file") -> $output_name"

    cp "$md_file" "$OUTPUT_DIR/${output_name}.md"
    pandoc "$md_file" -o "$OUTPUT_DIR/${output_name}.docx"
}

# --- Exécution ---
#
# GOAL demande par courriel : CV à jour, lettre de motivation, diplômes et/ou attestations
# d'études, et trois références professionnelles. Tout part en un seul PDF, dans cet ordre.

cd "$DIR" || exit 1

# 1. PDF depuis LaTeX
build_pdf "$DIR/cover_letter_fr.tex" "$CL_FR"
build_pdf "$DIR/cv_fr.tex" "$CV_FR"
build_pdf "$DIR/references.tex" "$REFS"

# 2. DOCX et MD depuis les jumeaux Markdown
build_word_and_md "$DIR/cover_letter_fr.md" "$CL_FR"
build_word_and_md "$DIR/cv_fr.md" "$CV_FR"
build_word_and_md "$DIR/references.md" "$REFS"

# 3. Assemblage du dossier en un seul PDF
#    Ordre : Lettre -> CV -> Références -> pièces (triées par nom de fichier)
echo "📎 Assemblage du dossier en un seul PDF..."

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

MERGE_LIST=(
    "$OUTPUT_DIR/${CL_FR}.pdf"
    "$OUTPUT_DIR/${CV_FR}.pdf"
    "$OUTPUT_DIR/${REFS}.pdf"
)

CREDENTIAL_COUNT=0
if [ -d "$CREDENTIALS_DIR" ]; then
    # Trié par nom de fichier : les préfixes 01_ / 02_ ... commandent l'ordre.
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
        CREDENTIAL_COUNT=$((CREDENTIAL_COUNT + 1))
    done < <(find "$CREDENTIALS_DIR" -maxdepth 1 -type f ! -name 'README.md' ! -name '.*' | sort)
fi

pdfunite "${MERGE_LIST[@]}" "$OUTPUT_DIR/${DOSSIER}.pdf"
echo "   ✅ $DOSSIER.pdf — $(pdfinfo "$OUTPUT_DIR/${DOSSIER}.pdf" | awk '/^Pages/ {print $2}') pages issues de ${#MERGE_LIST[@]} documents"

if [ "$CREDENTIAL_COUNT" -eq 0 ]; then
    echo ""
    echo "⚠️  ATTENTION : aucune pièce justificative trouvée dans credentials/."
    echo "   GOAL exige « des diplômes et ou des attestations d'études »."
    echo "   Le CV et la lettre renvoient explicitement à l'attestation C.T.P.E.A jointe."
    echo "   Voir credentials/README.md, puis relancer ce script."
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

echo "✅ Build terminé. Fichiers disponibles dans : $OUTPUT_DIR"
ls -lh "$OUTPUT_DIR"
