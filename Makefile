NAME=writeup

all: pdf html


pdf:
	pandoc -s -S --template=latex.template --latex-engine=xelatex --bibliography refs.bib --metadata link-citations=true --filter pandoc-citeproc $(NAME).md -o $(NAME).pdf

html:
	pandoc -s -S --bibliography refs.bib --metadata link-citations=true --filter pandoc-citeproc  $(NAME).md -o $(NAME).html
