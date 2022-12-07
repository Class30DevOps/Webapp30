#! /bin/sh

a=Thursday
b=Saturday
c=Sunday

echo -e "\vLive DevOps Lectures hold everyweek on $a, $b, $c\v"

#echo -e "Today's date is `date`\n"



echo -e "\vToday is `date | awk '{print $1}'`\v"


sleep 5
echo -e "\vTo \afind out the class time for a lecture day, please pick a day\v"

read lectureday


shopt -s nocasematch
if [ $a = $lectureday ]
then

echo -e "\vYou have selected $a. Live lectures begin at 1800 EST. Be on time!!\v"

elif [ $b = $lectureday ]
then

echo -e "\vYou have chosen $b. Live lectures start at 0800 EST. Make sure you wake up early!\v"


elif [ $c = $lectureday ] 
then

echo -e "\vYou have chosen $c. Live lectures start at 1500 EST.\v"


else
echo -e "\vWe don't have class on $lectureday. Please select either $a, $b, or $c\v"

fi 


