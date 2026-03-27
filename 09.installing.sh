#!/bin/bash

USERID=$(id -u) 

if [ $USERID -ne 0 ]; then 
    echo "ERROR" 
fi 

dnf install mysql -y 

if [ $? -ne 0 ]; then 
    echo "ERROR" 
else 
    echo "Installing success"
fi