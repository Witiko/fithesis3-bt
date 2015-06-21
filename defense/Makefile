.PHONY: all clean implode
AUXFILES=*.aux *.log *.nav *.out *.pyg *.bbl\
  *.snm *.toc *.vrb *.run.xml *.bcf *.blg
OUTPUT=defense.pdf handout.pdf

# This target typesets the printed version of
# the thesis and removes the auxiliary files.
all: $(OUTPUT) clean

# This target typesets the presentation.
%.pdf: %.tex source.tex
	xelatex $<
	biber $(basename $<)
	xelatex $<

# This target removes auxiliary files.
clean:
	rm -f $(AUXFILES)

# This target removes all non-source files.
implode: clean
	rm -f $(OUTPUT)
