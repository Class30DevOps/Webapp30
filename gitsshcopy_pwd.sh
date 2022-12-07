#!bin/bash

#author : C'est La Vie


read -p "To begin, enter the email address used to create your github account: " email
echo -e "\n\nUsing this email: $email\n\n"

cat ~/.ssh/id_rsa.pub

if [ $? = 0 ]
then
        echo -e "\n\nSSH keys are already present"

else

        echo -e "\n\nSSH keys not found.\n\nCreating ssh key using your email: $email\n\n"

        ssh-keygen -t rsa -b 4096 -C "$email"
	ssh-add ~/.ssh/id_rsa

        echo -e "SSH Key successfully generated\n\n"
fi

sshkey=`cat ~/.ssh/id_rsa.pub`

if [ $? = 0 ]
then
	read -p "Enter github username: " githubuser
	read -s -p "Enter github password for user $githubuser: " githubpass

	echo -e "\n\ncopying the key to Github account for $githubuser\n\n"

	curl -u "$githubuser:$githubpass" -X POST -d "{\"title\":\"`hostname`\",\"key\":\"$pub\"}" https://api.github.com/user/keys

        if [ $? = 0 ]
        then
                echo -e "\n\nSuccessfully copied the ssh_key to github"
        exit 0
        else
                echo -e "\n\nERROR!!! Failed to copy ssh_key to github. Debug\n\n"
        exit 1
        fi
else
        echo -e "\n\nERROR!!! Failure in generating ssh_key. Please debug\n\n"
exit 1
fi








