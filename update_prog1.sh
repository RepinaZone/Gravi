#!/bin/bash
####Colors####

#Red thin font#
R='\e[0;31m'
#Red bold font#
R1='\e[1;31;5m'
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
####Clear the window###

clear

#### Color funktions ####
### Green to white text###
ColorG(){
        echo -ne $G1$1$W
}
### Blue to white text ###
ColorB(){
        echo -ne $BL1$1$W
}
### Red to white text ###
ColorR(){
        echo -ne $R1$1$W
}
### Orange to white text ###
ColorO(){
        echo -ne $O1$1$W
}

button(){
         echo -e $R1" \n \n \n \n  "
         read -p "           Please press Enter to continue          "
         echo -e $W " "
}

KEK() {
 	echo -e "  \n \n \n \n \n \n \n \n \n \n \n \n \n \n   "
	echo "Я ВСЕ ОБНОВЛЯЮ. Я ВСЕ ОБНОВЛЯЮ.Я ВСЕ ОБНОВЛЯЮ.Я ВСЕ ОБНОВЛЯЮ.Я ВСЕ ОБНОВЛЯЮ.Я ВСЕ ОБНОВЛЯЮ.Я ВСЕ ОБНОВЛЯЮ.Я ВСЕ ОБНОВЛЯЮ.Я ВСЕ ОБНОВЛЯЮ.Я ВСЕ ОБНОВЛЯЮ.Я ВСЕ ОБНОВЛЯЮ.Я ВСЕ ОБНОВЛЯЮ." | lolcat
}
echo -ne $W " \n \n "
#### Creating the main menu ####
gen_menu() {
echo -ne "
           UPDATE  :
.................................................................

          ------------------------------------------- \n         | $(ColorG '1)')            Update BIOS                 | \n          -------------------------------------------
          ------------------------------------------- \n         | $(ColorG '2)')            Update BMC                  | \n          -------------------------------------------
          ------------------------------------------- \n         | $(ColorG '3)')      Update FRU Information            | \n          -------------------------------------------
          ------------------------------------------- \n         | $(ColorG '4)')            Update ALL                  | \n          -------------------------------------------
          ------------------------------------------- \n         | $(ColorG '5)')           Back to menu                 | \n          -------------------------------------------
          ------------------------------------------- \n         | $(ColorG '0)')              Exit                      | \n          -------------------------------------------
$(ColorB 'Choose an option :            ') "
        read a
        case $a in
          1) clear ;  button ; clear ; KEK ;;
          2) clear ; button ; clear ;  KEK ;;
	  3) clear ; button ; clear ;  ./Upd_Fru.sh ;;
	  4) clear ; button ; clear ;  KEK;;
	  5) clear ; button ; clear ; ./gen_menu.sh ;;
          0) clear ; exit 0;
        esac
}
gen_menu
