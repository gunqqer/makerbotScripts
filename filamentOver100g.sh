#!/bin/bash
#Gives total usage of filament by user and only looks at prints that completed
q -H -d, "SELECT \"Submitted By\", SUM(\"Total Estimated Material Usage\") FROM $1 WHERE \"Print Job Status\" = 'completed' GROUP BY \"Submitted By\" HAVING SUM(\"Total Estimated Material Usage\") > 100 ORDER BY \"Total Estimated Material Usage\""
