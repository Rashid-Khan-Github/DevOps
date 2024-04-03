#! /bin/bash

echo "Enter any number to check"
NUM=$1
if [ NUM -gt 10 ]
then
    echo "$NUM is greater than 10"
else
    echo "$NUM is less than 10"
fi