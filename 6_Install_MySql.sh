#! /bin/bash

VALIDATE(){
    if ($1 -ne 0)
    then
        echo "Installation Failed...!"
        exit 1
    else
        echo "Installation Successful...!"
    fi
}



USERID=$(id -u)

if ($USERID -ne 0)
then 
    echo "ERROR : Please run this script with a root permission"
    exit 1
fi

yum install mysql -y
VALIDATE $? MySQL

yum install postfix -y
VALIDATE $? POSTFIX