#!/bin/bash
#badname.sh
#Delete filenames in current directory containing bad characters.

for filename in *
do
    badname=`echo "$filename" | sed -n /[\+\{\;\"\\\=\?\~\(\)\<\>\&\*\|\$]/p`
#badname=`echo "$filename" | sed -n '/{+{;"\=?~()<>&*|$}/p'` also works
#Delete files containing above nasties
#
rm $badname 2>/dev/null
#
done

#Now, take care of files containing all manner of whitespace
find . -name "* *" -exec rm -f {} \;
#The path name of the file that "find" finds replaces the "{}"
#The '\' ensures that the ';' is interpreted literally, as end of command

exit 0

#-----------------------------------------------------------------
#Commands below this line will not execute because of "exit" command

#An alternative to the above script
find . -name '*[+{;"\\=?~()<>&*|$]*' -exec rm -f '{}' \;
