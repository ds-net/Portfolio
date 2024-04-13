#!/bin/bash
clear
echo "File & Directory Search v1.0"
read -p "Enter a path or a filename with full path, or exit with 'Q': " path

if [ "$path" == "Q" ]; then
	echo "Exiting..."
	exit 0
fi

if [ -e "$path" ]; then
    if [ -f "$path" ]; then
        echo "File found!"
        sleep 0.5
        if [ -s "$path" ]; then
            echo "File contains data! Not empty!"
        else
            echo "File is empty. No data!"
        fi
    elif [ -d "$path" ]; then
        echo "Directory found!"
        sleep 0.5
        if [ -n "$(ls -A "$path")" ]; then
            echo "Directory contains data!"
            sleep 0.5
            echo "Listing contents..."
            sleep 0.5
            ls -l "$path"
        else
            echo "Directory is empty! Quitting..."
            exit 1
        fi
    else
        echo "Invalid path, quitting..."
        exit 1
    fi
else
    echo "Path does not exist, quitting..."
    exit 1
fi
