#!/bin/bash

set -x
echo -e "\nThis script takes 3 arguments. The first 2 numbers will be added and the third number will be subtracted\n"

echo "The result is: $(( $1 +$2 -$3 ))"

set +x

if [ $? = 0 ]
then
echo -e "\nThe calculation has been successfully completed\n"
else
echo -e "\nThere was an issue with the calculation, please debug\n"
fi


echo -e "\nThe script name is $0\nTotal number of arguments entered are $#\nThe process id is $$\nThe list of arguments are: $@"
