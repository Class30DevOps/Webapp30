#! /bin/bash


# This script will be used to add new users and update their password. 
# while loop flow control is being used to make sure username that is being created doesn't already exist in the system
# if username already exists, script returns a message for user to retry. User can add an infinate number of new usernames 
# user only has upto 5 attempts if they're trying to create a user that already exists. 




# tries variable will be used to set the loop limit
tries=0

count=1

# loop will run as long as tries variable is less than 5. This is setting the max number of incorrect attempts.
while [ $tries -lt 5 ]
do

	#setting username variable
        echo -e "\nCreating user # $count \nEnter the Username you want to create or press CTRL + Z anytime to quit \n"
        read username


	#setting variable to check if username already exists in the system. using -w for exact match.
	usercheck=`getent passwd {1000..60000} | cut -d: -f1 | grep -w $username`


	echo -e "\nYou entered $username.\nSystem is checking if this user already exists in the system.....\nValue returned by system check: $usercheck\n"

        #if usercheck returns a value. So, if the username entered doesn't matches our usercheck 
	if [ -n "$usercheck" ]

        then

	#then user already exists in system. Reset the loop and give user one less try to enter the right user. This will restart the loop.

        tries=$(( $tries + 1 ))
	clear

	echo -e "\n$username already exists in the system.\nYou have $(( 5 - $tries )) more \attempts\n"



                #This condition checks if usercheck is indeed null. If is null, then username doesn't exist so break out of the loop and run the elif statements
		if ! id -u "$usercheck" >/dev/null 2>&1
                then

                break   #break from the loop statement returns true.

                fi

	#if usercheck is null, meaning the username doesn't exist, run proceeding commands
	elif [ -z "$usercheck" ]
        then

        echo -e "\nAdding $user... In Progress...\n"
        sudo adduser $username

		#if adduser command is successful...
                if [ $? = 0 ]
                then

                        echo -e "\nConfirming user has been added.\nWait a few moments for the check to complete........\n"
                        sleep 5

                        echo -e "SUCCESS!!.\n$username has been created successfully.\n See confirmation below...\n"
                        echo -e "\n"
			getent passwd {1000..60000} | grep -w $username


			#reset the count var
			count=$(( $count + 1 ))


                        echo -e "\nEnter a preferred password for $username:\n"
                        read -s password

                        echo "$password" | sudo passwd $username --stdin


                                #if previous command runs without errors
				if [ $? = 0 ]
                                then

                                        echo -e "\npassword for $username has been updated successfully\n"
					sleep 5
					clear

                                else
                                        echo -e "\nError, user password has not been updated successfully\n"
                                fi

                else

		#flow control error for debugging
                echo -e "\nError, user hasn't been added\n"
                fi

        else
		#floow control for debugging
        echo -e "\nCheck script again for possible flow\n"

	fi
done
