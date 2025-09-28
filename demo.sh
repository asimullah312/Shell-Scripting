#!/bin/bash




read -p "Enter the username to reset password:" username

if id "$username" &>/dev/null; then
        echo "correct the  user $username  exist:"
else
        echo "user $username is not exist:"
        exit 1
      fi
read -p " enter the password: " password

echo "$username:$password" |sudo chpasswd
