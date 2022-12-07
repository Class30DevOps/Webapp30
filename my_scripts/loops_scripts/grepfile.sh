#! /bin/bash

cat << word
This script will search for user input words in userinput directory or files
word

echo -e "\n\n\nEnter filename, dir_name or path to search text from\n\n"
read filename

if [[ -f $filename ]]
then

	echo -e "\n\nEnter the text to search\n\n"
	read grepvar

echo -e "\n"

	wdcnt=`grep -i -c $grepvar $filename`
	echo -e "$grepvar occurs $wdcnt times in $filename\n"

	grep -i -n $grepvar $filename

echo -e "\n"

else
	echo "\n$filename doesn't exist"
fi

