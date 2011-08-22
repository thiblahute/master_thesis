IMAGES = \
	images/collabora-logo.svg \
	images/frameByFrame.png \
	images/layers.png \
	images/open-source-video-editor-timeline.png \
	images/unlinked.png \
	images/keyframecurves.png \
	images/spiderDiagramFeaturesComparision.png \
	images/splited.png

DOCUMENT = Memoire_Thibault_Saunier.tex
INCLUDES =
STYLESHEET = template.sty

PDF_IMAGES = $(patsubst %.svg,%.pdf,$(IMAGES))

document: $(DOCUMENT) $(INCLUDES) $(STYLESHEET) $(PDF_IMAGES)
	rubber -d $<

%.pdf: %.svg
	inkscape -z -A $@ $<

clean:
	 rm -f *.{blg,bbl,toc,out,log,aux,pdf,dvi}

spell:
	aspell -l fr_FR -t -c $(DOCUMENT) --add-filter=tex

.PHONY: spell
