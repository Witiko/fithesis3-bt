.PHONY: all clean implode
OUTPUT=defense
AUXFILES=$(OUTPUT).aux $(OUTPUT).log $(OUTPUT).nav \
				 $(OUTPUT).out $(OUTPUT).pyg $(OUTPUT).snm \
				 $(OUTPUT).toc $(OUTPUT).vrb

# This target typesets the printed version of
# the thesis and removes the auxiliary files.
all: $(OUTPUT).pdf clean

# This target typesets the presentation.
%.pdf: %.tex
	xelatex $<
	xelatex $<

# This target removes auxiliary files.
clean:
	rm -f $(AUXFILES)

# This target removes all non-source files.
implode: clean
	rm -f $(OUTPUT).pdf
