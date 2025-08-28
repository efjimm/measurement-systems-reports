#!/bin/sh
# PDF's rendered by GNUPlot can't be used in groff for some reason, but rerendering them with
# ghostscript fixes that.
rerender_pdf() {
	gs -o "temp-${1}" -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress "${1}"
	mv "temp-${1}" "${1}"
}

./make-graphs.gp
for path in graph-*.pdf; do
	rerender_pdf "${path}" &
done

pdfmom -et report.mom > report.pdf
