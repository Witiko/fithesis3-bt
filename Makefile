.PHONY: all complete clean clean-all

CHAPTERS=chapters/*.tex chapters/*/*.tex
SOURCES=database.bib definitions.sty glossaries.tex $(CHAPTERS)
NONSOURCES=$(OUTPUT).pdf online.pdf
OUTPUT=print
AUX=$(OUTPUT).aux $(OUTPUT).toc $(OUTPUT).bbl $(OUTPUT).blg $(OUTPUT).ind $(OUTPUT).idx $(OUTPUT).out $(OUTPUT).gl[gos] $(OUTPUT).xdy $(OUTPUT).lo[ftg] $(OUTPUT).ac[rn] $(OUTPUT).alg $(OUTPUT).run.xml $(OUTPUT).bcf $(OUTPUT)-blx.bib $(OUTPUT).mw $(OUTPUT).cb $(OUTPUT).cb2

all: $(OUTPUT).pdf clean
complete: all online.pdf

# This target creates an online version of
# the thesis without blank pages.
online.pdf: $(OUTPUT).pdf
	@toolbox/test.sh pdftk /usr/bin/perl
	toolbox/remove-empty.sh $< $@

# This target typesets the thesis.
$(OUTPUT).pdf: $(OUTPUT).tex $(SOURCES)
	@toolbox/test.sh pdflatex texindy biber makeglossaries
	pdflatex $<
	texindy -I omega --language english $(OUTPUT).idx
	biber $(OUTPUT)
	makeglossaries $(OUTPUT)
	pdflatex $<
	makeglossaries $(OUTPUT)
	pdflatex $<
	pdflatex $< # Necessary to correctly typeset changebars

# This target removes auxiliary files.
clean:
	rm -f $(AUX)

# This target removes all non-source files.
clean-all: clean
	rm -f $(NONSOURCES)
