#!/bin/bash

echo "<!DOCTYPE html>" > index.html
echo "<html>" >> index.html
echo "<head>" >> index.html
echo "<title>Ebooks PDF</title>" >> index.html
echo "<meta charset='utf-8'>" >> index.html
echo "</head>" >> index.html
echo "<body>" >> index.html
echo "<table border='1'>" >> index.html
echo "<tr>" >> index.html
echo "<td>Name</td><td>Bild</td>" >> index.html
echo "</tr>" >> index.html
if [ ! -d "pics" ]; then
	mkdir pics
fi
find . -name "*.pdf" | while read file
do
	inputfile=`echo $file | cut -f2 -d'/'`
	pdf_file=`echo $inputfile | sed 's/\ö/oe/g' | sed 's/\ä/ae/g' | sed 's/\ü/ue/g'`
    	echo "Generiere pdf2png von PDF: $pdf_file"      
	gs -o "./pics/$pdf_file.png" -sDEVICE=pngalpha -r40 -dLastPage=1 "$pdf_file"	
echo "<tr>" >> index.html
echo "<td><a href='$pdf_file'>$pdf_file</a></td>" >> index.html
echo "<td><a href='$pdf_file'><img border='0' src='./pics/$pdf_file.png'></a></td>" >> index.html
echo "</tr>" >> index.html	
done
echo "</table>" >> index.html
echo "</body>" >> index.html
echo "</html>" >> index.html
