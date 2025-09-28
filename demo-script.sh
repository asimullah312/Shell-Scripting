#!/bin/bash

# This user creation part

create_user() {
    read -p "Enter the username: " username

    if id "$username" &>/dev/null; then
        echo "Error: User '$username' already exists."
        exit 1
    fi

    read -s -p "Enter the password: " password
    echo
    read -s -p "Re-enter the password: " password2
    echo

    if [ "$password" != "$password2" ]; then
        echo "Error: Passwords do not match."
        exit 1
    fi

    sudo useradd -m "$username"
    echo "$username:$password" | sudo chpasswd

    echo "User '$username' created successfully."
}

# Check for arguments
if [ "$1" = "-c" ]; then
    create_user
else
   
    exit
fi

