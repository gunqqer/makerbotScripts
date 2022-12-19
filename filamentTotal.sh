#!/bin/bash
#Gives total usage of filament and only looks at prints that completed
if [[ -z "$1" ]];
then
	printf "$(tput setab 196)File name of the CSV is missing!$(tput sgr0)\n"
	exit 1
fi
if [[ $1 = *" "* ]];
then
	printf "$(tput setab 196)File name of the CSV contains a space! Please rename the file and try again$(tput sgr0)\n"
	exit 1
fi
q -H -d, "SELECT SUM(\"Total Estimated Material Usage\")  FROM $1 WHERE \"Print Job Status\" = 'completed' ORDER BY \"Total Estimated Material Usage\" DESC"
