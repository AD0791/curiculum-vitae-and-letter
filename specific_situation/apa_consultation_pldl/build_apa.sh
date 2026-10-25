#!/bin/bash
# Build du dossier de consultation Anseye Pou Ayiti (APA) — données PLDL / CommCare.
# Produit : le CV (PDF, DOCX, MD), les figures (PDF vectoriel + PNG 300 dpi) et les trois
# propositions techniques en créole (PDF + MD), puis vérifie pagination, secrets et CV.

set -euo pipefail

# Configuration
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$DIR/outputs"
PROP_DIR="$DIR/pwopozisyon"
FIG_DIR="$PROP_DIR/figures"
LOGO_DIR="$DIR/assets/logos"

# Noms de fichiers
CV_FR="Alexandro_Disla_CV_APA_FR"
PROPOSALS=(
    "v1_direksyon:APA_Pwopozisyon_Teknik_V1_Direksyon"
    "v2_teknik:APA_Pwopozisyon_Teknik_V2_Teknik"
    "v3_faz_pa_faz:APA_Pwopozisyon_Teknik_V3_Faz_pa_Faz"
)
FIGURES=(fig_flux fig_flux_v3 fig_senaryo fig_achitekti fig_pri fig_faz fig_prev_a fig_prev_b)
LOGOS=(aws_lambda aws_s3 aws_ecr aws_secrets aws_eventbridge aws_cloud bigquery google_cloud
       looker_studio google_sheets commcare_mark commcare_lockup playwright polars mysql php hostinger)

echo "🚀 Build du dossier APA — consultation données PLDL (CommCare → EDA → dachbòd)..."
mkdir -p "$OUTPUT_DIR"

# --- 1. CV (latexmk + jumeau Markdown → DOCX) ---
echo "📄 CV : cv_fr.tex -> $CV_FR.pdf"
cd "$DIR"
latexmk -pdf -silent -jobname="$CV_FR" cv_fr.tex > /dev/null
mv "${CV_FR}.pdf" "$OUTPUT_DIR/"
latexmk -c -jobname="$CV_FR" cv_fr.tex > /dev/null
echo "📝 MD & Word : cv_fr.md -> $CV_FR"
cp cv_fr.md "$OUTPUT_DIR/${CV_FR}.md"
pandoc cv_fr.md -o "$OUTPUT_DIR/${CV_FR}.docx"

# --- 2. Figures (TikZ autonome, xelatex) ---
for logo in "${LOGOS[@]}"; do
    if [ ! -f "$LOGO_DIR/$logo.png" ]; then
        echo "❌ Logo manquant : assets/logos/$logo.png (voir assets/logos/SOURCES.md)"; exit 1
    fi
done
cd "$FIG_DIR"
for fig in "${FIGURES[@]}"; do
    echo "🎨 Figure : $fig"
    xelatex -interaction=nonstopmode -halt-on-error "$fig.tex" > /dev/null \
        || { echo "❌ Échec de compilation : $fig.tex (voir $fig.log)"; exit 1; }
    pdftoppm -png -r 300 -singlefile "$fig.pdf" "$fig"
    rm -f "$fig.aux" "$fig.log"
done

# --- 3. Propositions (pandoc → xelatex ; le .md affiche les PNG, le PDF prend les figures vectorielles) ---
cd "$PROP_DIR"
for entry in "${PROPOSALS[@]}"; do
    src="${entry%%:*}"; out="${entry##*:}"
    echo "📑 Pwopozisyon : $src.md -> $out.pdf"
    pandoc "$src.md" -o "$OUTPUT_DIR/$out.pdf" --pdf-engine=xelatex \
        -H apa_header.tex --number-sections --lua-filter apa_filters.lua
    # Copie Markdown dans outputs/ : les chemins d'images sont réécrits pour rester valides.
    sed 's#](figures/#](../pwopozisyon/figures/#g' "$src.md" > "$OUTPUT_DIR/$out.md"
done

# --- 4. Vérifications ---
cd "$OUTPUT_DIR"
echo "🔎 Vérifications..."
FAIL=0

for entry in "${PROPOSALS[@]}"; do
    out="${entry##*:}"
    pages=$(pdfinfo "$out.pdf" | awk '/^Pages:/ {print $2}')
    if [ "$pages" -lt 2 ] || [ "$pages" -gt 3 ]; then
        echo "⚠️  $out.pdf fait $pages page(s) : la proposition doit tenir en 2 à 3 pages."; FAIL=1
    else
        echo "✅ $out.pdf : $pages pages"
    fi
done
cv_pages=$(pdfinfo "$CV_FR.pdf" | awk '/^Pages:/ {print $2}')
if [ "$cv_pages" -gt 2 ]; then
    echo "⚠️  $CV_FR.pdf fait $cv_pages pages (maximum 2)."; FAIL=1
else
    echo "✅ $CV_FR.pdf : $cv_pages pages"
fi

# Aucun identifiant interne ni secret d'APA ne doit apparaître dans ce qui est envoyé.
SECRET_PATTERN='srv536|u318819384|hstgr|master\.env|apa-s3-data-bucket|Treated_data_APA|password|modpas'
for f in *.pdf; do
    if pdftotext "$f" - | grep -qiE "$SECRET_PATTERN"; then
        echo "❌ Marqueur de secret trouvé dans $f"; exit 1
    fi
done
if grep -qiE "$SECRET_PATTERN" *.md; then
    echo "❌ Marqueur de secret trouvé dans un fichier .md de outputs/"; exit 1
fi
echo "✅ Aucun marqueur de secret dans outputs/"

# Le poste APA est retiré de ce CV : il ne doit pas réapparaître.
if pdftotext "$CV_FR.pdf" - | grep -qiE 'anseye|\bAPA\b'; then
    echo "❌ Le CV mentionne encore APA."; exit 1
fi
echo "✅ Le CV ne mentionne pas APA"

[ "$FAIL" -eq 0 ] && echo "🎉 Dossier prêt dans outputs/" || echo "⚠️  Dossier construit avec des avertissements."
echo "👀 Regarder chaque page avant envoi : pdftoppm -png -r 80 <fichier>.pdf apercu"
