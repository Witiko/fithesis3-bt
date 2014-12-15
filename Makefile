all: main.pdf

main.pdf: main.tex main.toc
	pdflatex $<

main.toc: main.tex
	pdflatex $<

clean:
	rm main.aux main.log main.pdf main.toc
