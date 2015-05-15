.PHONY: all clean clean-all

RESOURCES=database.bib definitions.sty glossaries.tex misc/*.pdf
NONSOURCES=$(OUTPUT).pdf
OUTPUT=print
TEX=pdflatex
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
$(OUTPUT).pdf: $(OUTPUT).tex $(RESOURCES)
	@toolbox/test.sh pdflatex texindy biber makeglossaries
	$(TEX) $<
	# Prepare index, bibliography and glossaries
	texindy -I omega --language english $(OUTPUT).idx
	makeglossaries $(OUTPUT)
	$(TEX) $<
	biber $(OUTPUT)
	makeglossaries $(OUTPUT)
	$(TEX) $<
	$(TEX) $<

# This target removes auxiliary files.
clean:
	rm -f $(AUX)

# This target removes all non-source files.
implode: clean
	rm -f $(NONSOURCES)
