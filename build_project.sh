#!/bin/env bash

# HowTo
context --result=howto_unterricht how_to/prd_unterricht.tex
context how_to/prd_aufgaben.tex

# mathe
context --result=mathe_unterricht mathe/prd_unterricht.tex
context mathe/prd_aufgaben.tex

# informatik
context --result=informatik_unterricht informatik/prd_unterricht.tex
context informatik/prd_aufgaben.tex

# physik
context --result=physik_unterricht physik/prd_unterricht.tex
context physik/prd_aufgaben.tex

# englisch
context --result=englisch_unterricht englisch/prd_unterricht.tex
context englisch/prd_aufgaben.tex

# politik
context --result=politik_unterricht politik/prd_unterricht.tex
context politik/prd_aufgaben.tex

mv *.pdf out/

context --purgeall

notify-send "Notizen fertig Compeliert"
