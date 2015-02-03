.PHONY: all clean clean-all

all: online.pdf print.pdf clean

online.pdf: main.tex online.tex database.bib glossaries.tex
	pdflatex online.tex
	texindy -I omega --language english online.idx
	biber online
	makeglossaries online
	pdflatex online.tex
	makeglossaries online
	pdflatex online.tex

print.pdf: main.tex print.tex database.bib glossaries.tex
	pdflatex print.tex
	texindy -I omega --language english print.idx
	biber print
	makeglossaries print
	pdflatex print.tex
	makeglossaries print
	pdflatex print.tex

clean:
	rm -f online.aux online.toc online.bbl online.blg online.ind online.idx online.out online.gl[gos] online.xdy online.lo[ftg] online.ac[rn] online.alg online.run.xml online.bcf
	rm -f print.aux print.toc print.bbl print.blg print.ind print.idx print.out print.gl[gos] print.xdy print.lo[ftg] print.ac[rn] print.alg print.run.xml print.bcf

clean-all: clean
	rm -f online.pdf
	rm -f print.pdf
