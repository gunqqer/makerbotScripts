#!/bin/bash
#Take makerbot's mildly annoying time format and turns it into something SQLite's datetime() function can parse. This script only does this for the Time Submitted field because the Time Complete may be N/A and it really isn't very useful
#Usage: ./timeConvert.sh < ./file.csv > ./outFile.csv
read -r; printf "$REPLY\n"
while IFS=$',' read -r c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11; do
	printf "$c0,$c1,$(date --utc +%Y-%m-%dT%H:%M:%S -d "$c2"),$c3,$c4,$c5,$c6,$c7,$c8,$c9,$c10,$c11\n"
done
