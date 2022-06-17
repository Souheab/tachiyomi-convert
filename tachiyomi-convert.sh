#!/bin/bash

main() {
	if [ "$1" = "-r" ];then
		convert "$2" "-r"
	elif [ -d "$1" ]; then
		convert "$1"
	fi
}

convert() {
	abs_dir=$(readlink -m "$1")
	if [ "$2" = "-r" ]; then
		for i in "$abs_dir"/*/
			do
				echo $(basename "$i")
				zip -r "$(basename "$i").cbz" "$i" & done
		wait
	else
		zip -r $(basename "$abs_dir").cbz "$abs_dir"
	fi
}

rename() {
	find "$1" -type f -name "*_*" -exec bash -c 'f="$1"; g="${f/*_/}"; mv -- "$f" "$g"' _ '{}' \;
}



usage() {
	echo "Usage Still work in progress"		
}

main "$@"

bs() {
	for i in */
	do
		zip -r "${i%/}.cbz" "$i" & done
	wait
	mkdir CBZ
	mv *.cbz CBZ
	cd CBZ
	find . -type f -name "*_*" -exec bash -c 'f="$1"; g="${f/*_/}"; mv -- "$f" "$g"' _ '{}' \;
}

