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
#read -p " Please enter the Board Serial Number " BSN
#read -p " Please enter the Board Part Number" BPA
#read -p " Please enter the Product Manufacturer" PMF
#read -p " Please enter the Product Part?Model Number" PPM
#read -p " Please enter the Product Serial Number " PSN
#read -p " Please enter the Product Name " PPN
#read -p " Please enter the Product Version" PPV
