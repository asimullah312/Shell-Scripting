#/bin/bash


<<msg

this user creation part

msg
usernamestart=$1

#rf [ $1 = create ]; then


create_user () {

read -p "Enter the username: " username
if id "$username" &>/dev/null; then
        echo "Error: User '$username' already exists."
	exit 1
       
    fi



read -p "Enter the password: " password

read -p "Reenter the password: " password2

if [ "$password" != "$password2" ]; then
        echo "Erroe: Password do not matach"
	exit 1
        
fi

sudo useradd -m $username

echo "$username:$password" | sudo chpasswd


echo "user $username is created sussfully"

}


<<msg
this part is delete the user
msg


user_delete () {


read -p "Enter the username you want to be deleted: " username 

if id "$username" &>/dev/null; then
	sudo userdel $username
       echo "user $username deleted sucessfully"
else
  echo "user $username does not exist"	
fi


}



rest_passwd () {


read -p "Enter the username to reset password:" username

if id "$username" &>/dev/null; then
	echo "correct the  user $username  exist:"
else 
	echo "user $username is not exist:" 
	exit 1
      fi
read -p " enter the password: " password
read -p "enter the password again:" password2

if [ "$password" != "$password2" ]; then
	echo "error password not matach" 
	exit 1
fi

echo "$username:$password" |sudo chpasswd
echo "password updated sucessfully"

}

list_user () {
	awk -F: '{print $1, $3}' /etc/passwd
}

show_help () {
    echo "Usage: $0 "
    echo
    echo "Options:"
    echo "  -c, --create   Create a new user account"
    echo "  -d, --delete   Delete an existing user account"
    echo "  -r, --reset    Reset password of an existing user account"
    echo "  -l, --list     List all user accounts with their UIDs"
    echo "  -h, --help     Show this help message"
    echo
    exit 0
}


modify_user () {
read -p "Enter the username to modify" useranem
if id "$username" &./dev/null; then
	echo "what do you want to modify"
	echo "1. Username"
	echo "2. Home directory"
	echo "3.password"
	read -p "chose an opation " choice 
	if [ "$choice" = "1" ]; then
		read -p "enter the new username: " newusername
		sudo usermod -l $newusername $username
		echo "the username is updated $username to $newusername"
		exit 1
	fi
# Check if -h or --help is passed
if [ "$usernamestart" = -m ]; then
	modify_user
elif [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help

elif [ "$usernamestart" = "-c" ]; then
    create_user

elif [ "$usernamestart" = "-d" ]; then
        user_delete
elif [ "$usernamestart" = "-r" ]; then
        rest_passwd
elif [ "$usernamestart" = "-l" ]; then 
	list_user

fi

