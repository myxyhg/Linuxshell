#!/bin/bash

if [ -z "$1" ]
then
    Filename=name.data    #Default,if no filename specified
else
    Filename=$1
fi

line_count=`wc $Filename | awk '{ print $1 }'`
#Number of lines in target file

for name in `seq $line_count`  #Recall that "seq" prints sequence of numbers
do
    read name   #Reads from $Filename,rather than stdin
    echo $name
    if [ "$name" = Smith ]
    then
        break
    fi
done <"$Filename"  #Redirects stdin to file $Filename
exit 0
