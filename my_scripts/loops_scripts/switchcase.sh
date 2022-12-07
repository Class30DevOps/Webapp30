#!/bin/bash

echo -e "\n\nWhat do you want to know? Choices are case sensitive: date, time, calendar\n\n"

read choice

case $choice in
date)
	echo -e "`date`\n\n";;
calendar)
	echo -e "`cal`\n\n";;
time)
	echo -e "`timedatectl`";;

*)
	echo -e "\aSOrry, Invalid choice. Try again later\n\n";;
esac



echo -e "\n\ncow, sheep, duck. Which do you prefer?\n\n"
read animal

	case $animal in 
	cow)
		echo "Here, Mooo!!";;
	sheep)
		echo "There a baa!!";;
	duck)
		echo "Everywhere a quack!!";;
	*)
		echo "Old MacDonald had a farm";;
	esac
