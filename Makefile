SVG=surveillance.svg\
	gnupg.svg\
	encryption.svg\
	decryption.svg\
	defense.svg\
	thanks.svg

PDF=$(foreach i,$(SVG:.svg=.pdf),img/$i)

.PRECIOUS: $(PDF)

# use to crop newly created svgfile on a wrong paperformat
SVGCROP=inkscape --verb=FitCanvasToDrawing --verb=FileSave --verb=FileClose

all: esd-workshop.pdf

img/%.pdf: img/%.svg
	inkscape -z $< -A $@

%.pdf: %.tex $(PDF)
	pdflatex $<
