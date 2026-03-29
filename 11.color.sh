#!/bin/bash

USERID=$(id -u) 
R="\e[31m" 
G="\e[32m"
Y="\e[33m" 
N="\e[0m"

if [ $USERID -ne 0 ]; then 
    echo -e "$R ERROR $N" 
    exit 1 #Fail other than zero
fi 


VALIDATE(){
    if [ $1 -ne 0 ]; then 
        echo -e "$R ERROR $2 $N" 
        exit 2 
    else 
        echo -e "$G Installing $2 success $N"
    fi
} 

dnf list installed mysql #Install if not found 
if [ $? -ne 0 ]; then 
    dnf install mysql -y 
    VALIDATE $? "mysql" 
else 
    echo "mysql already exist.... $Y Skipping $N" 
fi

dnf list installed Nginx #Install if not found 
if [ $? -ne 0 ]; then 
    dnf install nginx -y 
    VALIDATE $? "nginx" 
else 
    echo "nginx already exist.... $Y Skipping $N" 
fi

dnf list installed python3 #Install if not found 
if [ $? -ne 0 ]; then 
    dnf install python -y 
    VALIDATE $? "python" 
else 
    echo "python already exist.... $Y Skipping $N" 
fi