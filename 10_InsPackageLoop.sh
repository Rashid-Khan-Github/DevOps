#! /bin/bash

USERID=$(id -u)

R="\e[32m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R Error :: Please run this script with root access $N"
    exit 1
fi


for i in $@
do
    yum install $i -y
done
