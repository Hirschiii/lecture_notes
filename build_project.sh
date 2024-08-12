#!/bin/bash

# TODO: mv files in right directory structur

export TEXMF="$TEXMF:$HOME/texmf:/usr/local/texlive/2024/texmf-dist"

subjects=("mathe" "informatik" "physik" "englisch" "politik" "deutsch" "wun")

types=("unterricht" "aufgaben" "presentation")

# Log file to store timestamps
LOG_FILE="modification.log"

# Initialize the log file if it doesn't exist
if [ ! -f "$LOG_FILE" ]; then
	touch "$LOG_FILE"
fi

# Function to retrieve the last logged timestamp for a path (file or directory)
get_logged_timestamp() {
	local path="$1"
	grep "^$path:" "$LOG_FILE" | cut -d':' -f2
}

# Function to update the log with the new timestamp for a path (file or directory)
update_log() {
	local path="$1"
	local new_timestamp="$2"

	# Remove the old entry if it exists
	echo "Try to delete: $path"
	sed -i "/^$path:/d" "$LOG_FILE"

	# Add the new entry
	echo "$path:$new_timestamp" >>"$LOG_FILE"
}

# Function to check and update a single file
check_file() {
	local file="$1"
	local current_timestamp=$(stat -c %Y "$file")
	local last_logged_timestamp=$(get_logged_timestamp "$file")

	if [ "$current_timestamp" != "$last_logged_timestamp" ]; then
		# Place your recompilation or processing command here
		update_log "$file" "$current_timestamp"

		return 0
	else
		return 1
	fi
}

# Function to check and update a directory
check_directory() {
	local dir="$1"
	local current_timestamp=$(stat -c %Y "$dir")
	local last_logged_timestamp=$(get_logged_timestamp "$dir")

	if [ "$current_timestamp" != "$last_logged_timestamp" ]; then
		# Place your directory processing command here
		update_log "$dir" "$current_timestamp"

		return 0

		# Optionally, check all files within the directory
		# for file in "$dir"/*; do
		# 	if [ -f "$file" ]; then
		# 		check_file "$file"
		# 	fi
		# done
	else
		return 1
	fi
}

move_file() {
	filename="${1}.pdf"
	subject=$2
	type=$3
	if [[ "$type" == "unterricht" ]]; then
		mkdir -p "out/${subject}/"
		mv $filename "out/${subject}/unterricht.pdf"
	else
		mkdir -p "out/${subject}/${type}"
		mv $filename "out/${subject}/${type}/"
	fi
}

compile_unterricht() {
	subject=$1
	filename="${subject}-unterricht"
	echo "Check dir: $subject"
	if check_directory "${subject}/unterricht/"; then
		echo "Compiling ${subject}"
		context --jobname="${subject}-unterricht" --mode="$subject" --result="$filename" prd_unterricht.tex &>/dev/null
		move_file $filename $subject "unterricht"
	fi
}

compile_aufgaben() {
	subject=$1
	filename=$2

	# Loop through each file in the directory
	find "$subject/aufgaben" -type f | while read -r file; do
		# Add your file processing commands here
		if [ -f "$file" ]; then
			basename=$(basename $file)
			basename="${basename%.*}"
			echo "chekc: $file"
			if check_file $file; then
				echo "Compiling ${file}"

				# context --jobname="${file}-aufgaben" --result="$basename" --arguments=file="${subject}/aufgaben/${file}" prd_aufgaben.tex &>/dev/null
				context --jobname="${file}-aufgaben" --result="$basename" --arguments=file="${file}" prd_aufgaben.tex &>/dev/null
			fi
			move_file $basename $subject "aufgaben"

			# Add your file processing commands here
		fi
	done
}

compile_presentation() {
	subject=$1
	filename=
	if check_if_build "$subject" "presentation"; then
		context --jobname="${subject}-presentation" --mode="$subject" --result="$filename" prd_unterricht.tex
	fi
}

for i in "${subjects[@]}"; do
	compile_unterricht "$i"
	compile_aufgaben "$i"
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
