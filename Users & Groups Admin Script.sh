#!/bin/bash
clear
echo "Users & Groups Admin Script v1.1"
read -p "Pick an option: (1) - Create Group | (2) - Create User | (3) - Add existing user to a group | (4) Change user password | (5) Quit: " pick

if [ -z "$pick" ]; then
    echo "Error: Please provide a valid option."
    exit 1
fi

if ! [[ "$pick" =~ ^[1-5]$ ]]; then
    echo "Error: Invalid option. Please choose 1, 2, or 3."
    exit 1
fi

if [ $pick -eq 1 ]; then
	echo "--------------------"
	read -p "Enter new group name: " grp
	echo "Granting root priviliges..."
		if sudo groupadd "$grp"; then
		  echo "Group '$grp' created!"
		else
		  echo "Error: Group creation failed."
		  exit 1
		fi
	echo "--------------------"
elif [ $pick -eq 2 ]; then
	echo "--------------------"
	read -p "Enter new user name: " usr
	echo "Granting root priviliges..."
		if sudo useradd "$usr"; then
		  echo "User '$usr' created!"
		if sudo passwd -q "$usr"; then
		  echo "User creation complete."
		fi
		else
		  echo "Error: User creation failed."
		  exit 1
		fi
	echo "--------------------"
elif [ $pick -eq 3 ]; then
	echo "--------------------"
	read -p "Input Username: " usrn
	read -p "Input group name: " grpnm
	echo "Granting root priviliges..."
		if sudo usermod -aG "$grpnm" "$usrn"; then
		  echo "User '$usrn' have been added to the '$grpnm' group!"
		else
		  echo "Error: Adding user to group failed."
		  exit 1
		fi
	echo "--------------------"
elif [ $pick -eq 4 ]; then
	echo "--------------------"
	read -p "Username for password change:" $usrpw
		if sudo passwd $usrpw; then
		  echo "Done!"
		else
		  echo "Password update failed!"
		fi
	echo "--------------------"
elif [ $pick -eq 5 ]; then
	echo "--------------------"
	echo "Exiting..."
	exit 0
else
	echo "No such option, aborting..."
	exit 1
fi

echo "Exiting..."
