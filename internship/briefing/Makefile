all:
	pdflatex -shell-escape -synctex=1 -interaction=nonstopmode *.tex
	ls *.pdf

clean:
	rm -f *.log *.toc *.synctex.gz *.aux
	rm -f *.out *.bbl *.blg *.lof *.nav *.snm
	rm -f *.pdf
	rm -rf ./_minted*
