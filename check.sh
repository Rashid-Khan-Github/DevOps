#! /bin/bash

DATE=$(date +%F--%H:%M:%S)
USERID=$(id -u)
SCRIPT_NAME=$0
LOGDIR=/tmp
LOGFILE=$LOGDIR/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

DISK_USAGE=$(df -hT | grep -vE "tmpfs|Filesystem")
DISK_USAGE_THRESHOLD=1

MESSAGE=""
while IFS= read line
do 
    echo $line
    USAGE=$(echo $line | awk '{print $6}' | cut -d % -f 1)

    PARTITION=$(echo $line | awk '{print $1}')

done <<< $DISK_USAGE

echo -e " $R MESSAGE ALERT : $MESSAGE $N "