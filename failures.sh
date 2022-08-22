#!/bin/bash
#Gives numbers of failed prints per user
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

q -H -d, "SELECT \"Submitted By\", COUNT(\"Print Job Status\") as failedNum  FROM $1 WHERE \"Print Job Status\" = 'failed' OR \"Print Job Status\" = 'cancelled' ORDER BY \"failedNum\""
