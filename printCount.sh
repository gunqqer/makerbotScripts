#!/bin/bash
#Gives numbers of prints per user, including failed and cancelled 
q -H -d, "SELECT \"Submitted By\", COUNT(\"*\") as count FROM $1 GROUP BY \"Submitted By\" ORDER BY \"count\" DESC" 
