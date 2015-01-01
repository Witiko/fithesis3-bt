all: main.pdf

main.pdf: main.tex main.toc main.bbl main.ind glossaries
	pdflatex $<
	pdflatex $<

# Index
%.ind: %.idx
		texindy -I omega --language english $<

%.idx: %.tex
		pdflatex $<

# Bibliography
%.bbl: %.aux
	bibtex $<

%.aux: %.tex database.bib
	pdflatex $<

# Table of contents
%.toc: %.tex
	pdflatex $<

# Glossaries
glossaries: glossaries.tex
	makeglossaries main

# Phony targets
clean:
	rm -f main.aux main.pdf main.toc main.bbl main.blg main.ind main.idx main.out main.gl[gos] main.xdy main.lo[ftg] main.ac[rn] main.alg

rebase: clean all
