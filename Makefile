.PHONY: all complete clean clean-all

CHAPTERS=chapters/*.tex
APPENDICES=appendices/*.tex
SOURCES=database.bib definitions.sty glossaries.tex $(CHAPTERS) $(APPENDICES)
OUTPUT=thesis
AUX=$(OUTPUT).aux $(OUTPUT).toc $(OUTPUT).bbl $(OUTPUT).blg $(OUTPUT).ind $(OUTPUT).idx $(OUTPUT).out $(OUTPUT).gl[gos] $(OUTPUT).xdy $(OUTPUT).lo[ftg] $(OUTPUT).ac[rn] $(OUTPUT).alg $(OUTPUT).run.xml $(OUTPUT).bcf $(OUTPUT)-blx.bib $(OUTPUT).cb $(OUTPUT).cb2

all: $(OUTPUT).pdf clean

$(OUTPUT).pdf: $(OUTPUT).tex $(SOURCES)
	pdflatex $<
	texindy -I omega --language english $(OUTPUT).idx
	biber $(OUTPUT)
	makeglossaries $(OUTPUT)
	pdflatex $<
	makeglossaries $(OUTPUT)
	pdflatex $<
	pdflatex $< # Necessary to correctly typeset changebars

clean:
	rm -f $(AUX)

clean-all: clean
	rm -f $(OUTPUT).pdf
