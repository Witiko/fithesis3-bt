.PHONY: all clean clean-all

all: main.pdf clean

main.pdf: main.tex database.bib glossaries.tex
	pdflatex main.tex
	texindy -I omega --language english main.idx
	bibtex main.aux
	makeglossaries main
	pdflatex main.tex
	makeglossaries main
	pdflatex main.tex

clean:
	rm -f main.aux main.toc main.bbl main.blg main.ind main.idx main.out main.gl[gos] main.xdy main.lo[ftg] main.ac[rn] main.alg

clean-all: clean
	rm -f main.pdf
