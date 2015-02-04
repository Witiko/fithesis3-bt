.PHONY: all complete clean clean-all

CHAPTERS=chapters/*.tex
APPENDICES=appendices/*.tex
SOURCES=database.bib main.tex definitions.sty glossaries.tex $(CHAPTERS) $(APPENDICES)
AUX=online.aux online.toc online.bbl online.blg online.ind online.idx online.out online.gl[gos] online.xdy online.lo[ftg] online.ac[rn] online.alg online.run.xml online.bcf online-blx.bib online.cb online.cb2 print.aux print.toc print.bbl print.blg print.ind print.idx print.out print.gl[gos] print.xdy print.lo[ftg] print.ac[rn] print.alg print.run.xml print.bcf print-blx.bib print.cb print.cb2
OUTPUT=print.pdf online.pdf

all: online.pdf clean
complete: print.pdf all

online.pdf: online.tex $(SOURCES)
	pdflatex online.tex
	texindy -I omega --language english online.idx
	biber online
	makeglossaries online
	pdflatex online.tex
	makeglossaries online
	pdflatex online.tex
	pdflatex online.tex # Necessary to correctly typeset changebars

print.pdf: print.tex $(SOURCES)
	pdflatex print.tex
	texindy -I omega --language english print.idx
	biber print
	makeglossaries print
	pdflatex print.tex
	makeglossaries print
	pdflatex print.tex
	pdflatex print.tex # Necessary to correctly typeset changebars

clean:
	rm -f $(AUX)

clean-all: clean
	rm -f $(OUTPUT)
