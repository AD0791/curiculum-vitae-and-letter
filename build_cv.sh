#!/bin/bash

# Build English Resume
echo "Building English Resume..."
latexmk -pdf -jobname=Alexandro_Disla_Resume_English alexandrodislaResume.tex

# Build French Resume
echo "Building French Resume..."
latexmk -pdf -jobname=Alexandro_Disla_Resume alexandro.disla_cv.tex

# Clean auxiliary files
echo "Cleaning up auxiliary files..."
latexmk -c -jobname=Alexandro_Disla_Resume_English alexandrodislaResume.tex
latexmk -c -jobname=Alexandro_Disla_Resume alexandro.disla_cv.tex

# Force remove remaining artifacts
rm -f *.fdb_latexmk *.fls *.synctex.gz *.log *.out *.aux

echo "Build complete. PDFs are ready."
