#!/bin/bash

#check root user or not
#if not root user exit the program and inform user to run with sudo access
#if root user install mysql

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR:: please run this with root access"
    exit 1
  
fi
yum install nginx -y
if [ $? -ne 0 ]
then
    echo "installation of nginx is error"
    exit 1
else
    echo "installation of nginx is success" 
fi

yum install postfix -y
if [ $? -ne 0 ]
then
    echo "installation of postfix is error"
    exit 1
else
    echo "installation of postfix is success" 
fi