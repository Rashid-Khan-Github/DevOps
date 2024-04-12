#!/bin/bash

DATE=$(date +%F--%H:%M:%S)
USERID=$(id -u)
SCRIPT_NAME=$0
LOGDIR=/home/centos/installScLogs
LOGFILE=$LOGDIR/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if[ $USERID -ne 0 ]
then
    echo "Please run this script with root access..!"
    exit 1
fi

VALIDATE(){
    if [$1 -ne 0]
    then
        echo -e "Installing....$2 Failure $N"
        exit 1
    else
        echo -e "Installing...$2 Success $N"
    fi 
}

echo " $Y Please Enter the Username for Gmail : $N"
read USERNAME
echo "$Y Please enter your password : $N"
read -s PASSWORD


for i in $@
do
    yum list installed $i
    
    if [ $? -ne 0 ]
    then
        echo -e "$R $i is not installed on your system, begining Installation..! $N"
        yum install $i -y &>> $LOGFILE
        VALIDATE $? $i       


    else
        echo -e "$Y $i is already installed on your system $N"
    fi
        


