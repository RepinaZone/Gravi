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

#### Information about MotherBoard####

MPM=`dmidecode --type baseboard | grep "Product Name" | awk '{print $3}'`
MSN=`dmidecode --type baseboard | grep "Serial Number" | awk '{print $3}'`
#MBV=`dmidecode --type baseboard | grep  "Version" | awk '{print $2}'`
#TEST=`echo "HEELLOOOOO"`

#### Information about BIOS####

#BVEN=`dmidecode -t bios | grep "Vendor" | sed -e 's/-dev//'`
BVER=`dmidecode -t bios | grep "Version" | sed -e 's/-dev//'`
#BREL=`dmidecode -t bios | grep "Release" | awk '{print $2" "$3}' | sed -e 's/-dev//'`

#### Information about BMC ####

IP_BMC=`ipmitool lan print | grep "IP Address" | awk '{print $4}' | tr -d : | sed 's/   //'`
M1_BMC=`ipmitool raw 0x3a 0xa1 0x00`
M8_BMC=`ipmitool raw 0x3a 0xa1 0x01`
PN_BMC=`ipmitool fru | grep " Product Serial" | awk '{print $4}'`
PN_FRU=`echo "Graviton"`
PNU_FRU=`ipmitool fru print 3 | grep "Product Part Number" | awk '{print $3}'`
PV_FRU=`ipmitool fru print 3 | grep "Product Version" | awk '{print $3}' | sed 's/://'`
PS_FRU=`ipmitool fru print 3 | grep "Product Serial" | awk '{print $3}'`

#### PRINT #####

echo -e ${O1}"  _____________________________________________________"
echo -e ${O1}" |                                                     |"
echo -e ${O1}" |           Your server has these parameters :        |"
echo -e ${O1}" |_____________________________________________________|"
echo -e ${W} " " 
##### About MB ####
echo -ne  ${BL1} "	-----  MotherBoard Information  -----"
echo -e ${W}"   \n "
echo -ne "		MB Product Name :  $MPM"
echo -e " "
echo -ne "		MB Serial Number  :  $MSN" 
#echo -e " " 
#echo -ne "		MB Version  :   $MBV" 
echo -e "  \n "

#### About BIOS ####
echo -ne ${BL1} "	-----  BIOS Information  -----"
echo -e ${W}  "  \n  " 
#echo -ne "		BIOS Vendor :   $BVEN"
#echo -e " "
echo -ne "		BIOS Version :  $BVER"
echo -e " "
#echo -ne " 		BIOS Releade Date :    $BREL"
#echo -e " "
echo -e " \n "

#### About BMC ####

echo -ne ${BL1} "	-----  BMC Informaton  -----"
echo -e ${W} "	\n "
echo -ne "		IP Address BMC  :  \t\t\t$IP_BMC"
echo -e " " 
echo -ne "		Product Number :  $PN_BMC"
echo -e " "
echo -ne ${BL} "	MAC Address BMC "
echo -e ${W} " " 
echo -e " 		MAC  Lan 1   :  $M1_BMC"
echo -e " 		MAC  Lan 8   :  $M8_BMC"
echo -e "               "
echo -e "           Product Name     :  $PN_FRU"
echo -e "              "
echo -e "           Product Part Num.:  $PNU_FRU"
echo -e "               "
echo -e "           Product Version  :  $PV_FRU"
echo -e "               "
echo -e "           Product Serial   :  $PS_FRU"

#ipmitool lan print 8



### !!!!!!!!!!!!!!!!!!!!!!!!!!!! АНЯ СДЕЛАЙ ПЕРЕНАПРАВЛЕНИE !!!!!!!!!!!!!! ###
#### save this infirmantion in file ####

#touch $( date '+%Y-%m-%d_%H-%M' ) && << log_1.sh
