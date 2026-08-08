#!/usr/bin/env bash
# Build the IOM CFA2026/023 Web Content Developer cover letter.
# Requires latexmk + TeX Live (with moderncv and fontawesome5).
set -euo pipefail

cd "$(dirname "$0")"

latexmk -pdf -interaction=nonstopmode cover_letter.tex
mv -f cover_letter.pdf Alexandro_Disla_IOM_WebContentDeveloper_CoverLetter.pdf
latexmk -c

echo "Built: Alexandro_Disla_IOM_WebContentDeveloper_CoverLetter.pdf"
