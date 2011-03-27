IMAGES = \
	images/collabora-logo.svg

DOCUMENT = thesis.tex
INCLUDES =
STYLESHEET = collabora.sty

PDF_IMAGES = $(patsubst %.svg,%.pdf,$(IMAGES))

document: $(DOCUMENT) $(INCLUDES) $(STYLESHEET) $(PDF_IMAGES)
	rubber -d $<

%.pdf: %.svg
	inkscape -z -A $@ $<

clean:
	 rm -f *.{blg,bbl,toc,out,log,aux,pdf,dvi}

spell:
	aspell -l en_GB -t -c $(DOCUMENT) --add-filter=tex

.PHONY: spell
