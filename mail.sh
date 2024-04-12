#! /bin/bash

TO_ADDRESS=$1
SUBJECT=$2
BODY=$3
TEAM_NAME=$4
ALERT_TYPE=$5

# echo "All Args : $@"

FINAL_MSG=$(sed -e "s/TEAM_NAME/DevOps Team/g" -e "s/ALERT_TYPE/MEMORY ALERT !!/g" -e "s/MESSAGE/$BODY/" template.html)

echo "$FINAL_MSG" | mail -s $(echo -e "$SUBJECT\nContent-Type: text/html") $TO_ADDRESS