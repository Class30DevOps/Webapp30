#! /bin/bash


number=1
counter=0

until [ $number -ge 10 ]
do

	counter=$(( $counter + 1 ))
	echo "No. $counter count is : $number"
	number=$(( $number + 1 ))

done
