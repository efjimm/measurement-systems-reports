#!/bin/sh
guh() {
	gs -o "graph${1}.pdf" -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress "gout${1}.pdf"
	rm "gout${1}.pdf"
}

./make-graphs.gp
for i in $(seq 7); do
	guh $i &
done

pdfmom -et report.mom > report1.pdf
