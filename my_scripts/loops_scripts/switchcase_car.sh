#!/bin/bash-x


car="BMW|MERCEDES|TESLA|ROVER|TOYOTA"

echo -e "\nYour choices are $car\n\n"

echo -e "Type your choice of vehicle from $car\n\n"
read vehicle


eval "
case \$vehicle in 
	$car)

 	      echo \"You chose \$vehicle\";;
	   *)

	      echo \"Bad choice!\";;
esac
     "





