#!/bin/bash
USERID=$(id -u)
VALIDATE(){
    if ( $1 -ne 0 )
    then
    echo "$2 .. FAILURE"
    else
    echo "$2 .. SUCCESS"
    fi 
}
if ( $USERID -ne 0 )
then
echo " ERROR: you must have sudo privilages to execute this script"
exit 1
fi
