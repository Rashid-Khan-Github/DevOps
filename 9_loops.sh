#! /bin/bash

DATE=$(date +F%---%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME--$DATE.log

for i in $@
do
    yum install $i -y
done
