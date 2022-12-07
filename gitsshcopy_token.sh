#!bin/bash

#author : C'est La Vie


read -s -p "To begin, enter your github Personal Access Token, PAT: " token


cat ~/.ssh/id_rsa.pub

if [ $? = 0 ]
then
	echo -e "\n\nSSH keys are already present"

else

	echo -e "\n\nSSH keys not found.\n\nCreating ssh key using your PAT\n\n"

	ssh-keygen -t rsa 
	echo -e "SSH Key successfully generated\n\n"
fi

sshkey=`cat ~/.ssh/id_rsa.pub`

if [ $? = 0 ]
then

echo -e "\n\ncopying the key to Github account\n\n"

curl -X POST -H "Content-type: application/json" -d "{\"title\": \"SSHKEY\",\"key\": \"$sshkey\"}" "https://api.github.com/user/keys?access_token=$token"

	if [ $? = 0 ]
	then
		echo -e "\n\nSuccessfully copied the token to github"
	exit 0
	else
		echo -e "\n\nERROR!!! Failed to copy ssh_key to github. Debug\n\n"
	exit 1
	fi
else
	echo -e "\n\nERROR!!! Failure in generating ssh_key. Please debug\n\n"
exit 1
fi

