#!/bin/bash
#Gives total usage of filament by user and only looks at prints that completed
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
q -H -d, "SELECT \"Submitted By\", SUM(\"Total Estimated Material Usage\")  FROM $1 GROUP BY \"Submitted By\" ORDER BY \"Total Estimated Material Usage\" DESC"
