#! /bin/bash

DATE=$(date +F%---%H:%M:%S)
SCRIPT_NAME=$0


for i in $@
do
    yum install $i -y
done
