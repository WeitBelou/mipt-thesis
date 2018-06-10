all: build

.PHONY: build
build: out
	pdflatex -output-dir=out -interaction=nonstopmode -halt-on-error main.tex

out:
	mkdir out
