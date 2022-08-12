#!/bin/bash
#Gives numbers of failed prints per user
q -H -d, "SELECT \"Submitted By\", COUNT(\"Print Job Status\") as failedNum  FROM $1 WHERE \"Print Job Status\" = 'failed' OR \"Print Job Status\" = 'cancelled' ORDER BY \"failedNum\""
