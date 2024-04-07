#! /bin/bash

USERID=$(id -u)

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGDIR=/home/centos/shell-logs
LOGFILE=$LOGDIR/$SCRIPT_NAME-$DATE.log


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#check whether the user is root -->

if [ $USERID -ne 0 ]
then
    echo -e "$R Error :: Please run this script with root access $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "Installing $2....$R Failure $N"
        exit 1
    else
        echo -e "Installing $2....$G Success $N"
    fi
}





# if this the user is root -->
#check if the pacakge is installed or not

for i in $@
do
    yum list installed $i
    if [ $? -ne 0 ]
    then 
        echo -e "$R $i is not installed, let's begin the installation $N"
        yum install $i -y >> $LOGFILE
        VALIDATE $? $i
    else
        echo -e "$Y $i is already installed on your machine $N"
    fi
done
