#! /bin/bash

# Our Goal is to Install Mysql and Postfix on the linux server.

DATE=$(date +%F---%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "Installation Failed...!"
        exit 1
    else
        echo "Installation Successful...!"
    fi
}


USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR : Please run this script with a root permission"
    exit 1
fi

yum install mysql -y >> $LOGFILE
VALIDATE $? MySQL

yum install postfix -y >> $LOGFILE
VALIDATE $? POSTFIX