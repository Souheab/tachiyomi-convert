for i in */
do
	zip -r "${i%/}.cbz" "$i" & done
wait
mkdir CBZ
mv *.cbz CBZ
cd CBZ
find . -type f -name "*_*" -exec bash -c 'f="$1"; g="${f/*_/}"; mv -- "$f" "$g"' _ '{}' \;
