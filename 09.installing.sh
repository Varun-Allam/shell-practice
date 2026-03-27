#!/bin/bash

USERID=$(id -u) 

if [ $USERID -ne 0 ]; then 
    echo "ERROR" 
    exit 1 #Fail other than zero
fi 

dnf install mysql -y 

if [ $? -ne 0 ]; then 
    echo "ERROR" 
else 
    echo "Installing success"
fi