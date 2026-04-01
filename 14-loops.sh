#!/bin/bash 

USERID=$(id -u) 
R="\e[31m" 
G="\e[32m"
Y="\e[33m" 
N="\e[0m"  


SCRIPT_NAME=$( echo $0 | cut -d '.' -f1 )
LOG_FILE="var/log/shell-script/$SCRIPT_NAME.log" 

mkdir -p $LOGS_FOLDER 
echo "Script started execute at : $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then 
    echo -e "$R ERROR $N" 
    exit 1 #Fail other than zero
fi 


VALIDATE(){
    if [ $1 -ne 0 ]; then 
        echo -e "$R ERROR $2 $N" | tee -a $LOG_FILE
        exit 2 
    else 
        echo -e "$G Installing $2 success $N" | tee -a $LOG_FILE
    fi
} 


for package in $@ 
do 
    #check package is already installed or not 
    dnf list installed $package &>>$LOG_FILE 
    #if exit is 0 already there 
    if [ $? -ne 0 ]; then 
        dnf install $package -y &>>$LOG_FILE 
        VALIDATE $? "$package"
    else 
        echo -e "$package already installed..$Y Skipping $N"
    fi
done