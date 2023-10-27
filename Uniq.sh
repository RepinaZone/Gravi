#!/bin/bash
#UNIQ_MB=`echo $FRU_PRINT | xxd -r -p | grep "Board Product" | awk -F"Board Product         : " '{print $2}'`
UNIQMB=`echo "TEST"`
#echo "$UNIQMB"


####ТУТ ДОЛЖНА БЫТЬ ТУНДРА  В ПЕРВОМ ЦИКЛЕ###
if (( UNIQMB == "TEST" ))
then
 cd updates && ./Tu_FRU.sh
 echo "U are THE BEST !!!!!!!!!! " |lolcat
elif (( UNIQMB == ARCTICA ))
then
 cd updates
elif (( UNIQMB ==  TAIGA ))
then 
 cd updates
fi
