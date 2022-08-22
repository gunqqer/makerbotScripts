#!/bin/bash
#Gives numbers of prints per user, including failed and cancelled 
if [[ -z "$1" ]];
then
	printf "\n$(tput setab 196)File name of the CSV is missing!$(tput sgr0)\n"
	exit 1
fi
if [[ $var = *" "* ]];
then
	printf "\n$(tput setab 196)File name of the CSV contains a space! Please rename the file and try again$(tput sgr0)\n"
	exit 1
fi

q -H -d, "SELECT \"Submitted By\", COUNT(\"*\") as count FROM $1 GROUP BY \"Submitted By\" ORDER BY \"count\" DESC" 
