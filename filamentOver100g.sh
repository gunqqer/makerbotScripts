#!/bin/bash
#Gives total usage of filament by user and only looks at prints that completed
#First arg is the csv file, no spaces at all anywhere or it will break
#Second arg is an optional date in the format YYYY-MM-DD. Leading zeros are required. If used, this will only take into account prints AFTER the given date
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
date=${2:-'2022-08-01'}

q -H -d, "SELECT \"Submitted By\", SUM(\"Total Estimated Material Usage\") FROM $1 WHERE \"Print Job Status\" = 'completed' AND datetime(\"Time Submitted\") > datetime('$date') GROUP BY \"Submitted By\" HAVING SUM(\"Total Estimated Material Usage\") > 100 ORDER BY \"Total Estimated Material Usage\""
