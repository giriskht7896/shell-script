#$/bin/bash
DATE=$(date +%F)
USERID=$(id -u)
LOGSDIR=/tmp/shellscript-logs
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: run this command with root access $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo -e "$R installing $2 failure"
        exit 1
    else
        echo -e "$G installing $2 success"
    fi
}

for i in $@
do
    yum list installed $i &>>$LOGFILE
    if  [ $? -ne 0 ]
    then 
        echo " $i not installed, LETS INSTALL"
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else
        echo -e "$Y  $i already installed"
    fi

done
