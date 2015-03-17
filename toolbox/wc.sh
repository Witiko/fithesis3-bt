#!/bin/sh
# Prints the approximate word count of the thesis.
echo $(((`cat chapters/*.tex chapters/*/*.tex | wc -c | tail -n 1` + `pdf2txt print.pdf | wc -c`) / 2))
