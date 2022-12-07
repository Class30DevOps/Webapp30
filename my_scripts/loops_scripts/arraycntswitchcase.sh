var="yes no"


# read -a is storing as an array into $var variable. Basically, it's creating an array called mylist from $var
read -a mylist <<< $var

echo "my array: ${mylist[@]}"
echo "Number of elements in the array: ${#mylist[@]}"

cnt=${#mylist[@]}

echo "Testing to see if this works: $cnt"

echo -e "\vChose between "yes" and "no""
read cnt

case $cnt in 
yes)
	echo "You  have chosen yes";;
no)
	echo "You  have chosen No";;
*)
	echo "Error! Try again";;
esac
