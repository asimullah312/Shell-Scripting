#!/bin/bash

# Check if arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <username> <password>"
    exit 1
fi

username="$1"
password="$2"

# Create user
sudo useradd -m "$username"

# Set password
echo "$username:$password" | sudo chpasswd

echo "User '$username' created successfully."

# Delete user
sudo userdel -r "$username"

echo "User '$username' deleted successfully."

