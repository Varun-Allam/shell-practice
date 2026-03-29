#!/bin/bash

USERID=$(id -u) 

if [ $USERID -ne 0 ]; then 
    echo "ERROR" 
    exit 1 #Fail other than zero
fi 


VALIDATE(){
    if [ $1 -ne 0 ]; then 
        echo "ERROR $2" 
        exit 2 
    else 
        echo "Installing $2 success"
    fi
} 

dnf install mysql -y 
VALIDATE $? "mysql" 

dnf install nginx -y
VALIDATE $? "nginx" 

dnf install python -y 
VALIDATE $? "python" 