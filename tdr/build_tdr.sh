#!/bin/bash

# Non fichye yo
FILE_NAME="tdr_analyst_data_dev"

echo "Kòmanse build TDR la an fòma DOCX..."

# Konvèsyon LaTeX vè DOCX ak pandoc
if command -v pandoc &> /dev/null
then
    pandoc "${FILE_NAME}.tex" -o "${FILE_NAME}.docx"
    echo "Build fini ak siksè: ${FILE_NAME}.docx"
else
    echo "Erè: pandoc pa enstale sou sistèm nan. Tanpri enstale l pou w ka fè konvèsyon an."
    exit 1
fi

# Netwayaj (si pdflatex te kouri oswa si gen rès fichye)
echo "Netwayaj fichye oksilyè yo..."
rm -f *.aux *.log *.out *.pdf *.fdb_latexmk *.fls *.synctex.gz

echo "Operasyon fini."
