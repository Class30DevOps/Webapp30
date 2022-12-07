#!/bin/bash

# Displays disk usage per user in the specified directory
# Usage: ./scriptname [target-directory]

[ "x$1" == "x" ] && dirname="." || dirname="$1"
for uid in `cat /etc/passwd | sed -rn "s~^([^:]+):[^:]:[0-9]{4,}:.*$~\1~p"` ; do # List all usernames having UID>1000
    user_size=0
    for file in `find "$dirname" -type f -user "$uid" 2>/dev/null` ; do # List the folder's files that belongs to the current user, Ignore possible `find` errors.
        let user_size+=`stat -c '%s' $file` # Sum-up
        done
    [ $user_size -gt 0 ] && echo "USER=$uid, SIZE=$user_size" # Display the result if >0
    done

