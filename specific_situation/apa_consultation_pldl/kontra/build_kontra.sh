#!/bin/bash
# Build des deux documents d'après l'acceptation d'APA, en kreyòl, thème APA, PDF + DOCX :
#   1. le contrat (2 pages max, champs PDF à remplir + deux champs de signature électronique) ;
#   2. l'exécution du projet (figures architecture API, environnements test/final, calendrier).

set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(dirname "$DIR")"
PROP_DIR="$ROOT/pwopozisyon"
FIG_DIR="$PROP_DIR/figures"
OUTPUT_DIR="$ROOT/outputs"
FIGURES=(fig_achitekti_api fig_anviwonman fig_kalandriye_v2)
mkdir -p "$OUTPUT_DIR"

# --- Figures (TikZ, xelatex) : PDF vectoriel pour le PDF, PNG 300 dpi pour le Word ---
cd "$FIG_DIR"
for fig in "${FIGURES[@]}"; do
    echo "🎨 Figure : $fig"
    xelatex -interaction=nonstopmode -halt-on-error "$fig.tex" > /dev/null \
        || { echo "❌ Échec de compilation : $fig.tex (voir $fig.log)"; exit 1; }
    pdftoppm -png -r 300 -singlefile "$fig.pdf" "$fig"
    rm -f "$fig.aux" "$fig.log"
done

# --- Documents ---
cd "$DIR"
# Le numéro de compte BUH ne va pas dans le dépôt public : il vit dans kont_bank.local (gitignoré)
# et remplace KONT_BUH dans une copie temporaire de kontra.md.
if [ ! -s kont_bank.local ]; then
    echo "❌ kontra/kont_bank.local manque : y mettre le numéro du compte BUH en dollars."; exit 1
fi
sed "s/KONT_BUH/$(tr -d '[:space:]' < kont_bank.local)/" kontra.md > .kontra_build.md
pandoc -o .default.docx --print-default-data-file reference.docx
# source:sortie:en-tête LaTeX propre:en-tête Word
for entry in ".kontra_build:APA_Kontra_Konsiltasyon_vf:kontra_header.tex:Kontra konsiltasyon · Zouti PL-DL yo sou CommCare" \
             "egzekisyon:APA_Egzekisyon_Pwoje:egzekisyon_header.tex:Egzekisyon pwojè a · Zouti PL-DL yo sou CommCare"; do
    IFS=: read -r src out htex head <<< "$entry"
    echo "📜 $src.md -> $out.pdf + .docx"
    pandoc "$src.md" -o "$OUTPUT_DIR/$out.pdf" --pdf-engine=xelatex \
        -H "$PROP_DIR/apa_header.tex" -H kontra_header.tex -H "$htex" \
        --lua-filter kontra_filters.lua --lua-filter "$PROP_DIR/apa_filters.lua"
    uv run --quiet --with python-docx python make_reference_docx.py \
        .default.docx ".ref_$src.docx" "$ROOT/assets/apa_logo.png" "$head"
    pandoc "$src.md" -o "$OUTPUT_DIR/$out.docx" --reference-doc=".ref_$src.docx" \
        --lua-filter kontra_filters.lua --resource-path=.
    rm -f ".ref_$src.docx"
done
rm -f .default.docx .kontra_build.md

# Contrat : champs texte alignés + deux champs de signature électronique.
uv run --quiet --with pyhanko --with pypdf python add_sig_fields.py "$OUTPUT_DIR/APA_Kontra_Konsiltasyon_vf.pdf"

# --- Vérifications ---
pages=$(pdfinfo "$OUTPUT_DIR/APA_Kontra_Konsiltasyon_vf.pdf" | awk '/^Pages:/ {print $2}')
if [ "$pages" -gt 2 ]; then
    echo "❌ APA_Kontra_Konsiltasyon_vf.pdf fait $pages pages (2 au maximum)."; exit 1
fi
echo "✅ APA_Kontra_Konsiltasyon_vf.pdf : $pages pages"
echo "ℹ️  APA_Egzekisyon_Pwoje.pdf : $(pdfinfo "$OUTPUT_DIR/APA_Egzekisyon_Pwoje.pdf" | awk '/^Pages:/ {print $2}') pages"
