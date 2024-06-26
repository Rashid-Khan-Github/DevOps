#! /bin/bash

APP_LOGDIR=/home/centos/app-logs
DATE=$(date +%F---%H:%M:%S)
LOGSDIR=/home/centos/shell-logs
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGDIR -name "*.log" -type f -mtime +5)

echo "Script Execution Started at $DATE" &>> $LOGFILE

while read line
do
    echo "Deleting $line"
    rm -rf $line
done <<< $FILES_TO_DELETE
