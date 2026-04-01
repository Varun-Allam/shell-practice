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
echo "Script started execute at : $(date)" &>>$LOG_FILE

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

dnf list installed mysql &>>$LOG_FILE #Install if not found 
if [ $? -ne 0 ]; then 
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "mysql" 
else 
    echo -e "mysql already exist.... $Y Skipping $N" 
fi

dnf list installed Nginx &>>$LOG_FILE #Install if not found 
if [ $? -ne 0 ]; then 
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx" 
else 
    echo -e "nginx already exist.... $Y Skipping $N" 
fi

dnf list installed python3 &>>$LOG_FILE #Install if not found 
if [ $? -ne 0 ]; then 
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3" 
else 
    echo -e "python already exist.... $Y Skipping $N" 
fi