#!/bin/bash
#This shell script used for to search max bytes file

a=0
for name in *.*
do
    b=$(ls -l $name | awk '{print $5}')
    if test $b -ge $a
    then
        a=$b
        namemax=$name
    fi
done
echo "the max file is $namemax"
