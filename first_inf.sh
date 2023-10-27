#!/bin/bash
####Colors####

#Red thin font#
R='\e[0;31m'
#Red bold font#
R1='\e[1;31m'
# Orange thin font#
O='\e[0;33m'
# Orange bold font#
O1='\e[1;33m'
# Green thin font#
G='\e[0;32m'
# Green bold font#
G1='\e[1;32m'
# Blue thin font#
BL='\e[0;96m'
# Blue bold font#
BL1='\e[1;96m'
# White thin font#
W='\e[0m'
# White bold font#
W1='\e[1;0m'

#### Variables ####
NA="N/A"

#### Information about MotherBoard####

#MPM=`dmidecode --type baseboard | grep "Product Name" | awk '{print $3}'`
#MSN=`dmidecode --type baseboard | grep "Serial Number" | awk '{print $3}'`
#MBV=`dmidecode --type baseboard | grep  "Version" | awk '{print $2}'`

###Information about BIOS####

BVER=`dmidecode -t bios | grep "Version" | awk -F"Version: " '{print $2}'`
if [[ $BVER = '' ]] ; then BVER=$NA; fi
BREL=`dmidecode -t bios | grep "Release" | awk -F"Release Date: " '{print $2}'`
if [[ $PNU_FR = '' ]] ; then PNU_FRU=$NA; fi

#### Information about BMC ####

BMCVER=`ipmitool mc info | grep "Firmware Revision" | awk -F"Firmware Revision         : " '{print $2}'`
if [[ $BMCVER = '' ]] ; then BMCVER=$NA; fi
IP_BMC=`ipmitool lan print | grep "IP Address              :" | awk -F"IP Address              : " '{print $2}'`
if [[ $IP_BMC = '' ]] ; then IP_BMC=$NA; fi
M1_BMC=`ipmitool raw 0x3a 0xa1 0x00 | awk '{sub(/^[ \t]+/, ""); print }'`
if [[ $M1_BMC = '' ]] ; then M1_BMC=$NA; fi
M2_BMC=`ipmitool raw 0x3a 0xa1 0x01 | awk '{sub(/^[ \t]+/, ""); print }'`
if [[ $M2_BMC = '' ]] ; then M2_BMC=$NA; fi

FRU_PRINT=`ipmitool fru print | xxd -p -c 999999999`
PN_FRU=`echo $FRU_PRINT | xxd -r -p | grep "Product Name" | awk -F"Product Name          : " '{print $2}'`
if [[ $PN_FRU = '' ]] ; then PN_FRU=$NA; fi
PNU_FRU=`echo $FRU_PRINT | xxd -r -p | grep "Product Part Number" | awk -F"Product Part Number   : " '{print $2}'`
if [[ $PNU_FRU = '' ]] ; then PNU_FRU=$NA; fi
PS_FRU=`echo $FRU_PRINT | xxd -r -p | grep "Product Serial" | awk -F"Product Serial        : " '{print $2}'`
if [[ $PS_FRU = '' ]] ; then PS_FRU=$NA; fi
MP_FRU=`echo $FRU_PRINT | xxd -r -p | grep "Board Product" | awk -F"Board Product         : " '{print $2}'`
if [[ $MP_FRU = '' ]] ; then MP_FRU=$NA; fi
MS_FRU=`echo $FRU_PRINT | xxd -r -p | grep "Board Serial" | awk -F"Board Serial          : " '{print $2}'`
if [[ $MS_FRU = '' ]] ; then MS_FRU=$NA; fi
MMF_FRU=`echo $FRU_PRINT | xxd -r -p | grep "Board Mfg Date" | awk -F"Board Mfg Date        : " '{print $2}'`
if [[ $MMF_FRU = '' ]] ; then MMF_FRU=$NA; fi


#### PRINT #####

echo -e ${O1}"  _____________________________________________________"
echo -e ${O1}" |                                                     |"
echo -e ${O1}" |           Your server has these parameters :        |"
echo -e ${O1}" |_____________________________________________________|"
echo -e ${W} " "

#### About Product ####
echo -ne ${BL1} "	-----  Product Information  -----"
echo -e ${W}  "  \n  "
echo -e "	        Product Name      :  $PN_FRU"  
echo -e "	        Product Part Num. :  $PNU_FRU" 
echo -e "	        Product Serial    :  $PS_FRU" 
echo -e " \n "

##### About MB ####
echo -ne  ${BL1} "	-----  MotherBoard Information  -----"
echo -e ${W}  "   \n "
echo -e "		MotherBoard       :  $MP_FRU" 
echo -e "		Serial Number     :  $MS_FRU" 
echo -e "		Manufaction Date  :  $MMF_FRU"
echo -e "  \n "

#### About BIOS ####
echo -ne ${BL1} "	-----  BIOS Information  -----"
echo -e ${W}  "  \n  "
echo -e "		BIOS FW Version   :  $BVER"
echo -e " 		BIOS Releade Date :  $BREL"
echo -e " \n "

#### About BMC ####
echo -ne ${BL1} "	-----  BMC Informaton  -----"
echo -e ${W} "	\n "
echo -e "		BMC FW Version   :  $BMCVER" 
echo -e "		IP Address BMC   :  $IP_BMC"
echo -e " 		BMC MAC 1        :  $M1_BMC"
echo -e " 		BMC MAC 2        :  $M2_BMC"
echo -e " "
echo -e " "
echo -e " \n "

#### CHECK U'R PLATFORM MODEL"

clear

./Uniq.sh

#touch $( date '+%Y-%m-%d_%H-%M-%S' ) && << null.sh

#touch $( date '+%Y-%m-%d_%H-%M' ) && << log_1.sh

#### FILE FOR SAVED####

Sfile=$( date '+%Y-%m-%d_%H-%M' )
touch "$Sfile"
echo -e "Product Name      : $PN_FRU" >> "$Sfile"
echo -e "Product Part Num. : $PNU_FRU" >> "$Sfile" 
echo -e "Product Serial    : $PS_FRU" >>"$Sfile"
echo -e "MotherBoard       :  $MP_FRU" >> "$Sfile"
echo -e "Serial Number     :  $MS_FRU" >> "$Sfile"
echo -e "Manufaction Date  :  $MMF_FRU" >> "$Sfile"
echo -e "BMC FW Version    :  $BMCVER" >> "$Sfile"
echo -e "IP Address BMC    :  $IP_BMC" >> "$Sfile"
echo -e "BMC MAC 1         :  $M1_BMC" >> "$Sfile"
echo -e "BMC MAC 2         :  $M2_BMC" >> "$Sfile"


