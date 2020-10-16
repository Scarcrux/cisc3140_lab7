# Makefile for analysis report

.PHONY: all clean

start:
	pip install argparse matplotlib numpy
	curl http://files.grouplens.org/datasets/movielens/ml-latest-small.zip --output movies.zip
	unzip -j movies.zip
	tail -n +2 ratings.csv > ratings2.csv
	cat ratings2.csv | cut -d \, -f 3 > Ratings.csv
	git clone https://github.com/alan-turing-institute/IntroToMake
	mv IntroToMake/* .
	mv Ratings.csv data/

all: output/report.pdf

output/figure_1.png: data/Ratings.csv scripts/generate_histogram.py
	python scripts/generate_histogram.py -i data/Ratings.csv -o output/figure_1.png

output/figure_2.png: data/input_file_2.csv scripts/generate_histogram.py
	python scripts/generate_histogram.py -i data/input_file_2.csv -o output/figure_2.png

output/report.pdf: report/report.tex output/figure_1.png output/figure_2.png
	cd report/ && pdflatex report.tex && mv report.pdf ../output/report.pdf

clean:
	rm -rf IntroToMake
	rm -rf output
	rm -rf report
	rm -rf data
	rm -rf report
	rm -rf scripts
	rm -f movies.zip
	rm -f *.csv
	rm -f README.txt
	rm -f LICENSE
