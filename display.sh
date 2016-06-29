#!/bin/bash
#Display contents under /etc/passwd in screen
#display example: username=root,uid=0,gid=0,homedir=/root,shell=/bin/bash

while read LINE 
do
    NUM=1
    for name in username uid gid homedir shell
    do
        echo -n "$name="
        echo -n $(echo $LINE | cut -d: -f$NUM)
        echo -n ","
        NUM=$(($NUM+1))
        if [ $NUM -eq 2 ] || [ $NUM -eq 5 ]
        then
            NUM=$(( $NUM+1 ))
        fi
        sleep 1
    done
    echo
done </etc/passwd
