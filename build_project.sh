#!/bin/env bash

# TODO: mv files in right directory structur

export TEXMF="/usr/share/texmf-dist:$HOME/texmf"

subjects=("mathe" "informatik" "physik" "englisch" "politik" "deutsch" "wun")

types=("unterricht" "aufgaben" "presentation")

check_if_build()
{
	subject=$1
	type=$2

	return 0
}

compile_aufgaben()
{
	subject=$1
	if check_if_build "$subject" "aufgaben"; then
		context --jobname="${subject}-aufgaben" --mode="$subject" --result="${subject}-aufgaben" prd_aufgaben.tex	
	fi
}

compile_unterricht()
{
	subject=$1
	if check_if_build "$subject" "unterricht"; then
		context --jobname="${subject}-unterricht" --mode="$subject" --result="${subject}-unterricht" prd_unterricht.tex	
	fi
}

compile_presentation()
{
	subject=$1
	if check_if_build "$subject" "presentation"; then
		context --jobname="${subject}-presentation" --mode="$subject" --result="${subject}-presentation" prd_unterricht.tex	
	fi
}

for i in "${subjects[@]}"; do
	compile_unterricht "$i"
	# compile_aufgaben(i)
	# compile_presentation(i)
done

# # HowTo
# context --result=howto_unterricht how_to/prd_unterricht.tex
# context how_to/prd_aufgaben.tex
#
# # mathe
# context --result=mathe_unterricht mathe/prd_unterricht.tex
# context mathe/prd_aufgaben.tex
#
# # informatik
# context --result=informatik_unterricht informatik/prd_unterricht.tex
# context informatik/prd_aufgaben.tex
#
# # physik
# context --result=physik_unterricht physik/prd_unterricht.tex
# context physik/prd_aufgaben.tex
#
# # englisch
# context --result=englisch_unterricht englisch/prd_unterricht.tex
# context englisch/prd_aufgaben.tex
#
# # politik
# context politik/prd_aufgaben.tex
# context --result=politik_unterricht politik/prd_unterricht.tex

# mv *.pdf out/
#
# context --purgeall

notify-send "Notizen fertig Compeliert"
