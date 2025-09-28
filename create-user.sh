#!/bin/bash

<<msg
creating user with the help of argument

msg

read -p "enter the user name:" username
read -s -p "enter the password:" password

sudo useradd -m  "$username"
echo -e "$password\n$password" |sudo passwd "$username"

~
echo "user "$username" created sucessfully"

sudo userdel "$username"

echo "user "$username" is deleted sucessfully"

cat /etc/passwd | grep $username



~
~
~
~
~
~

