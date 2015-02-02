.PHONY: all clean

all: metadata_parsed.csv

metadata_parsed.csv: metadata_zaverecne_prace.csv.gz
	zcat $< | ./parse.sh > $@

clean:
	rm -f metadata_parsed.csv
