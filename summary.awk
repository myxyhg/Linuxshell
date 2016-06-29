#!/bin/awk
BEGIN {FS="\t+",n=3}
{
    gsub(",","",$n)
    gsub("/\/[0-9]+/","Month",$1)
    summary("SUM")
    summary($1)
}

$2 != "Salary" {summary("except Salary")}
function summary(c)
{
    if(MAX[c]+0 < $n+0) MAX[c]=$n
    if(MIN[c]+0 > $n+0) MIN[c]=$n
    COUNT[c]++
    TOTAL[c]+=$n
}

END{
    for(c in TOTAL)
    {
        printf "balance(%s)=%d\n",c,TOTAL[c]        
    }
}
