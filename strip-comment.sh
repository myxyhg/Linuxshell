#!/bin/bash
#strip-comment.sh: Strips out the comments (/*COMMENT*/) in a c program.

E_NOARGS=0
E_ARGERROR=66
E_WRONG_FILE_TYPE=67

if [ $# -eq "$E_NOARGS" ]
then
    echo "Usage: `basename $0` C-program-file" >&2  #Error msg to stderr
    exit $E_ARGERROR
fi

#Test for correct file type
type=`file $1 | awk '{ print $2,$3,$4,$5 }'`
#"file $1" echoes file type...
#Then awk removes the first field, the filename...
#Then the result is fed into the variable "type."
correct_type="ASCII C program text"

if [ "$type" != "$correct_type" ]
then
    echo
    echo "This script works on C program files only."
    echo
    exit $E_WRONG_FILE_TYPE
fi

#Rather cryptic sed script
sed '/^\/\*/d
    /.*\*\//d
    '$1

exit 0
