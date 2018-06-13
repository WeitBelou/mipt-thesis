all: build

python=python3
export python

.PHONY: build
build: out
	pdflatex -output-dir=out -interaction=nonstopmode -halt-on-error -shell-escape main.tex
	biber -output-directory=out main
	pdflatex -output-dir=out -interaction=nonstopmode -halt-on-error -shell-escape main.tex

out:
	mkdir out

.PHONY: clean
clean:
	rm -r out/*