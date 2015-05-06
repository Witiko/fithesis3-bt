#!/bin/sh
# Prints the approximate word count of the thesis / 1800.
echo $(((`cat print.tex | wc -c | tail -n 1` + `pdf2txt print.pdf |
wc -c`) / (2*1800)))
