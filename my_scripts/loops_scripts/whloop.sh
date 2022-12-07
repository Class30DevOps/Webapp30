#! /bin/bash 

number=1
counter=0
while [ $number -le 10 ]
do

	#echo "$number"
	counter=$(( $counter + 1 ))
	echo "No. $counter count is : $number"
	number=$(( $number + 1 ))

 done
