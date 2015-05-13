.PHONY: all complete clean clean-all

SOURCES=database.bib definitions.sty glossaries.tex
NONSOURCES=$(OUTPUT).pdf
OUTPUT=print
TEXOPTS=
AUX=$(OUTPUT).aux $(OUTPUT).toc $(OUTPUT).bbl $(OUTPUT).blg \
	$(OUTPUT).ind $(OUTPUT).idx $(OUTPUT).out $(OUTPUT).gl[gos] \
	$(OUTPUT).xdy $(OUTPUT).lo[ftg] $(OUTPUT).ac[rn] $(OUTPUT).alg \
	$(OUTPUT).run.xml $(OUTPUT).bcf $(OUTPUT)-blx.bib $(OUTPUT).mw \
	$(OUTPUT).cb $(OUTPUT).cb2 $(OUTPUT).ilg texput.log

# This target prepares the fithesis3 class
# and typesets the printed version of the
# thesis.
all:
	make $(OUTPUT).pdf clean

# This target typesets the thesis.
$(OUTPUT).pdf: $(OUTPUT).tex $(SOURCES)
	@toolbox/test.sh pdflatex texindy biber makeglossaries
	pdflatex $(TEXOPTS) $<
	# Prepare index, bibliography and glossaries
	texindy -I omega --language english $(OUTPUT).idx
	makeglossaries $(OUTPUT)
	pdflatex $(TEXOPTS) $<
	biber $(OUTPUT)
	makeglossaries $(OUTPUT)
	pdflatex $(TEXOPTS) $<
	pdflatex $(TEXOPTS) $< # Necessary to correctly typeset changebars

# This target removes auxiliary files.
clean:
	rm -f $(AUX)

# This target removes all non-source files.
clean-all: clean
	rm -f $(NONSOURCES)
