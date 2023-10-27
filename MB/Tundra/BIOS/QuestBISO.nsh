# FORCE_EFI_BOOT

cls
 echo "       " 
 echo "                 " 
 echo "                       Update the BIOS Firmware            " 
 echo "       " 
 echo "                 "
 echo "       " 
 echo "                 "
 echo "       " 
 echo "                 "
 echo "                Do you want to start update right now?    "
 echo "   "
 echo "                        1 - Yes         "
 echo "                        2 - No  (Back to menu)         "
 echo "           "
 echo "                 "
 echo "                 "
 echo "                 "
 echo "                 "
 echo "                 "
 
 .\choice.efi
 
if %lasterror% == 0x31 then
 .\flash.nsh
 cd \
endif

if %lasterror% == 0x32 then
 cd \
 startup.nsh
endif

:END