#!/bin/bash
#Gives total usage of filament by user and only looks at prints that completed
q -H -d, "SELECT \"Submitted By\", SUM(\"Total Estimated Material Usage\")  FROM $1 WHERE \"Print Job Status\" = 'completed' GROUP BY \"Submitted By\" ORDER BY \"Total Estimated Material Usage\""
