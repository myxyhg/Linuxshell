#!/bin/bash

# "subst.sh", a script that substitutes one pattern for
#+another in a file

ARGS=3     #script requires 3 arguments
E_BADARGS=65    #wrong number of arguments passed to script

if [ $# -ne "$ARGS" ]
then
    echo "Usage:`basename $0` old_pattern new_pattern filename"
    exit $E_BADARGS
fi

old_pattern=$1
new_pattern=$2

if [ -f "$3" ]
then
    file_name=$3
else
    echo "File \"$3\" does not exist."
    exit $E_BADARGS
fi

sed -e "s/$old_pattern/$new_pattern/g" $file_name

exit 0   #successful invocation of the script returns 0
