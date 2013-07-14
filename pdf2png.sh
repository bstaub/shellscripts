#!/bin/bash

find . -name "*.pdf" | while read file
do
	pdf_file=`echo $file | cut -f2 -d'/'`
        echo "Generiere pdf2png von PDF: $pdf_file"
	gs -o "$pdf_file.png" -sDEVICE=pngalpha -dLastPage=1 "$pdf_file"
done
