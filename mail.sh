#! /bin/bash

TO_ADDRESS=$1
SUBJECT=$2
BODY=$(echo "$3" | sed "s/[$/]//g")  # Removing char '/' from the string to avoid collision
echo "Escaped Content: $BODY"
TEAM_NAME=$4
ALERT_TYPE=$5

# echo "All Args : $@"

FINAL_MSG=$(sed -e "s/TEAM_NAME/DevOps Team/g" -e "s/ALERT_TYPE/MEMORY ALERT..!!/g" -e "s/MESSAGE/$BODY/" template.html)

echo "$FINAL_MSG" | mail -s "$(echo -e "$SUBJECT\nContent-Type: text/html")" "$TO_ADDRESS"