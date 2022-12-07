while read file1
do
	echo "$file1"
done < "${1:-/dev/stdin}"
