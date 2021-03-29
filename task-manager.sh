#!/bin/bash
answer = ""
actions() {
	lslogins | grep -Pzo '.1000(.*\n)*'
	echo "Choose a user: "
	read USER
	u="$USER"

	top -u $u -n 1 -b > output-$u.txt
	echo "A text file has been created with the processes used with the name: output-$u.txt"

	echo "Do you want to look at another user? (y/n)"
	read answer
	while [[ $answer != "y" && $answer != "n" ]]; do
	echo "Enter 'y' to continue or 'n' to stop"
	read answer
	done
}

actions
while [[ $answer != "n" ]]; do
	actions
done

