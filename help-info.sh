#!/bin/bash
<<msg 
------------------------------
Function to show help info
------------------------------
msg
option=$1
show_help () {
    
    echo "Options:"
    echo "  -c   Create a new user"
    echo "  -d   Delete an existing user"
    echo "  -r   Reset user password"
    echo "  -l   List all users with UIDs"
    echo "  -h   Show this help message"
  
}
if [ "$option" = "-h" ]; then
    show_help
fi

