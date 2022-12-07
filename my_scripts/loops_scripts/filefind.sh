echo -e "\n\nEnter a filename\n"
read filename

check=`sudo find / -name $filename | awk -F"/" '{print $NF}'`


#while [[ ! -f $filename ]]




while [ -z $check ]
do

	echo -e "\n\nFile not found. \aMake sure you entered the correct file name and Try Again!!"
	read filename
	check=`sudo find / -name $filename | awk -F"/" '{print $NF}'`

done

#if [[ -f $filename ]]
if [[ $check = $filename ]]
then

#location=`readlink -f $filename`
echo -e "\nfile found!!!\n\n"
#echo -e "$filename is located in `readlink -f $filename`"
echo -e "$filename is located in `readlink -f $check`"

fi




