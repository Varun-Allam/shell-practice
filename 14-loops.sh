#!/bin/bash 

USERID=$(id -u) 
R="\e[31m" 
G="\e[32m"
Y="\e[33m" 
N="\e[0m"  



LOGS_FOLDER="/var/log/shell-script" 
SCRIPT_NAME=$( echo $0 | cut -d '.' -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" 

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
    echo "package is : $package" 
done