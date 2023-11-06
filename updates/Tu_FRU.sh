#!/bin/bash

#### Requesting Variables ####

VAR1(){
read -p " Please enter the Chassis Seral Number  (10 Symbols) :" CSN 
}
VAR1
VAR1_A() {
A=`echo "$CSN" |tr -d '\n' | wc -c`
echo "$A"
if (( A == 10))
 then
   echo "OK"
   echo "./FRUTool_2.02S id=0 CSN=""$CSN"
 else 
   echo " Try again"
   VAR1
   VAR1_A
fi
}
VAR1_A

#read -p " Please enter the Chassis Type" CTY
#read -p " Please enter the Chassis Part Number " CPNN
#read -p " Please enter the Chassis Extra" CEX
#read -p " Please enter the Board Manufacturer " BMF
#read -p " Please enter the Board Product Name" BPN

VAR2(){
read -p " Please enter the Board Serial Number " BSN
}
VAR2
VAR2_A(){
B=`echo "$BSN" |tr -d '\n' | wc -c`
echo "$B"
if (( B == 10))
 then
   echo "OK"
   echo "./FRUTool_2.02S id=0 BSN=""$BSN"
 else
   echo " Try again"
   VAR2
   VAR2_A
fi
}
VAR2_A

#read -p " Please enter the Board Part Number" BPA
#read -p " Please enter the Product Manufacturer" PMF
#read -p " Please enter the Product Part Model Number" PPM

VAR3(){
read -p " Please enter the Product Serial Number " PSN
}
VAR3
VAR3_A(){
C=`echo "$PSN" |tr -d '\n' | wc -c`
echo "$C"
if (( C == 10))
 then
   echo "OK"
   echo "./FRUTool_2.02S id=0 PSN=""$PSN"
 else
   echo " Try again"
   VAR3
   VAR3_A
fi
}
VAR3_A

#read -p " Please enter the Product Name " PPN
#read -p " Please enter the Product Version" PPV
