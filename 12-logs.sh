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

LOGS_FOLDER="/var/log/shell-script" 

mkdir -p $LOGS_FOLDER