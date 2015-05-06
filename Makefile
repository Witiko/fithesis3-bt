.PHONY: all complete clean clean-all

SOURCES=database.bib definitions.sty glossaries.tex
NONSOURCES=$(OUTPUT).pdf online.pdf
OUTPUT=print
AUX=$(OUTPUT).aux $(OUTPUT).toc $(OUTPUT).bbl $(OUTPUT).blg \
	$(OUTPUT).ind $(OUTPUT).idx $(OUTPUT).out $(OUTPUT).gl[gos] \
	$(OUTPUT).xdy $(OUTPUT).lo[ftg] $(OUTPUT).ac[rn] $(OUTPUT).alg \
	$(OUTPUT).run.xml $(OUTPUT).bcf $(OUTPUT)-blx.bib $(OUTPUT).mw \
	$(OUTPUT).cb $(OUTPUT).cb2 texput.log

# This target prepares the fithesis3 class
# and typesets the printed version of the
# thesis.
all:
	cd fithesis3/fithesis3 && make all
	make $(OUTPUT).pdf clean

# This target performs the `all` pseudo-target
# and then also typesets the online version
# of the thesis.
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
	# Prepare index, bibliography and glossaries
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
