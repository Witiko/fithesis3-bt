.PHONY: all

NONSOURCES=$(OUTPUT).pdf
OUTPUT=article
TEX=pdflatex
AUX=$(OUTPUT).aux $(OUTPUT).toc $(OUTPUT).bbl $(OUTPUT).blg \
	$(OUTPUT).ind $(OUTPUT).idx $(OUTPUT).out $(OUTPUT).gl[gos] \
	$(OUTPUT).xdy $(OUTPUT).lo[ftg] $(OUTPUT).ac[rn] $(OUTPUT).alg \
	$(OUTPUT).run.xml $(OUTPUT).bcf $(OUTPUT)-blx.bib $(OUTPUT).mw \
	$(OUTPUT).cb $(OUTPUT).cb2 $(OUTPUT).ilg texput.log

# This target typesets the article.
all: $(OUTPUT).pdf clean
%.pdf: %.tex
	$(TEX) $<
	$(TEX) $<

# This target removes auxiliary files.
clean:
	rm -f $(AUX)

# This target removes all non-source files.
clean-all: clean
	rm -f $(NONSOURCES)