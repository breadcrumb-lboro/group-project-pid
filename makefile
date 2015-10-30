aux = $(shell find . | grep "\.aux")
toc = $(shell find . | grep "\.toc")
bbl = $(shell find . | grep "\.bbl")
blg = $(shell find . | grep "\.blg")
log = $(shell find . | grep "\.log")
lof = $(shell find . | grep "\.lof")
lot = $(shell find . | grep "\.lot")
bcf = $(shell find . | grep "\.bcf")
lol = $(shell find . | grep "\.lol")
pyg = $(shell find . | grep "\.pyg")
run_xml = $(shell find . | grep "\.run\.xml")
out = $(aux) $(toc) $(bbl) $(blg) $(log) $(lof) $(lot) $(run_xml) $(bcf) $(lol) $(pyg)

.PHONY: build

# build: report.tex
# 	pdflatex report.tex
# 	biber report
# 	pdflatex report.tex
# 	mkdir -p build
# 	cp -f report.pdf ./build/
# 	xdg-open ./build/report.pdf

build: report.tex
	lualatex -shell-escape report.tex
	biber report
	lualatex -shell-escape report.tex
	lualatex -shell-escape report.tex
	mkdir -p build
	cp -f report.pdf ./build/
	xdg-open ./build/report.pdf

clean:
	rm -f report.pdf
	rm -f $(out)

simple-build: build clean
