#!/bin/bash

#Colours
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

#Validations

DATE=$(date +%F)
LOGFILE_DIRECTORY=/tmp
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log

Disk_Usage=$(df -hT | grep -vE 'tmpfs|Filesystem')
Disk_Usage_threshold=1

#IFS= internal field seperator
while IFS= read line
do
    echo"output:$line"
done <<<$Disk_Usage
