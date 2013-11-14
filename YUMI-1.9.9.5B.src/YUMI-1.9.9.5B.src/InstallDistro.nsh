; ------------ Install Distros Macro -------------- 
;      CopyLeft Lance - Pendrivelinux.com

!include ReplaceInFile.nsh
Function FindConfig ; Set config path and file
  ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\liberte\boot\syslinux\syslinux.cfg" ; Liberte
  StrCpy $ConfigPath "liberte/boot/syslinux"
  StrCpy $CopyPath "liberte\boot\syslinux"
  StrCpy $ConfigFile "syslinux.cfg"    
  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\i386\loader\isolinux.cfg" ; OpenSuse based
  StrCpy $ConfigPath "boot/i386/loader"
  StrCpy $CopyPath "boot\i386\loader"
  StrCpy $ConfigFile "isolinux.cfg"    
  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\syslinux\syslinux.cfg"    
  StrCpy $ConfigPath "syslinux"
  StrCpy $CopyPath "syslinux"
  StrCpy $ConfigFile "syslinux.cfg"  
  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg" 
  StrCpy $ConfigPath "isolinux"
  StrCpy $CopyPath "isolinux"
  StrCpy $ConfigFile "isolinux.cfg" 
  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\syslinux.cfg"  ; AVG
  StrCpy $ConfigPath "isolinux"
  StrCpy $CopyPath "isolinux"
  StrCpy $ConfigFile "syslinux.cfg"   
  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\txt.cfg"  ; Probably Ubuntu based
  StrCpy $ConfigPath "isolinux"
  StrCpy $CopyPath "isolinux"
  StrCpy $ConfigFile "txt.cfg"
  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\text.cfg"   ; Probably Ubuntu based
  StrCpy $ConfigPath "isolinux"
  StrCpy $CopyPath "isolinux"
  StrCpy $ConfigFile "text.cfg"
  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\syslinux\txt.cfg"   
  StrCpy $ConfigPath "syslinux"
  StrCpy $CopyPath "syslinux"
  StrCpy $ConfigFile "txt.cfg"
  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\syslinux\text.cfg"   
  StrCpy $ConfigPath "syslinux"
  StrCpy $CopyPath "syslinux"
  StrCpy $ConfigFile "text.cfg"  
  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\system\isolinux\isolinux.cfg"  ; AOSS
  StrCpy $ConfigPath "system/isolinux"
  StrCpy $CopyPath "system\isolinux"
  StrCpy $ConfigFile "isolinux.cfg"    
  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux.cfg"  ; Probably Puppy based 
  StrCpy $ConfigPath ""
  StrCpy $CopyPath ""
  StrCpy $ConfigFile "isolinux.cfg"  
  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\syslinux.cfg" 
  StrCpy $ConfigPath ""
  StrCpy $CopyPath ""
  StrCpy $ConfigFile "syslinux.cfg"    
  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\slax\boot\syslinux.cfg"  ; Slax based 
  StrCpy $ConfigPath "slax/boot"
  StrCpy $CopyPath "slax\boot"
  StrCpy $ConfigFile "syslinux.cfg"    

  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\isolinux\isolinux.cfg"
  StrCpy $ConfigPath "boot/isolinux"
  StrCpy $CopyPath "boot\isolinux"
  StrCpy $ConfigFile "isolinux.cfg" 
  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\isolinux\syslinux.cfg"     
  StrCpy $ConfigPath "boot/isolinux"
  StrCpy $CopyPath "boot\isolinux"
  StrCpy $ConfigFile "syslinux.cfg"    
  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\syslinux\syslinux.cfg"     
  StrCpy $ConfigPath "boot/syslinux"
  StrCpy $CopyPath "boot\syslinux"
  StrCpy $ConfigFile "syslinux.cfg" 
  ${Else} 
   StrCpy $ConfigFile "NULL"
  ${EndIf}   
  ;MessageBox MB_OK "$ConfigPath/$ConfigFile"   
FunctionEnd

Function OldSysFix ; fix to force use of new syslinux... 
 DetailPrint "Checking if we need to replace vesamenu.c32, menu.c32, and chain.c32"   
  !insertmacro CallFindFiles $BootDir\multiboot\$JustISOName chain.c32 CBFUNC
  !insertmacro CallFindFiles $BootDir\multiboot\$JustISOName vesamenu.c32 CBFUNC
  !insertmacro CallFindFiles $BootDir\multiboot\$JustISOName menu.c32 CBFUNC
FunctionEnd

Function WriteStuff
 CreateDirectory "$BootDir\multiboot\$JustISOName\YUMI\" ; Create the YUMI Directory.. so we can copy the following config file to it.
 CopyFiles "$PLUGINSDIR\$Config2Use" "$BootDir\multiboot\$JustISOName\YUMI\$Config2Use" ; Copy the $Config2Use file to $JustISOName\YUMI folder for the distro (so we know where to remove entry) 
 DetailPrint "$DistroName ($JustISOName) and its menu entry were added!"
 
; Failure to find ConfigFile and was not added as a GRUB Boot ISO, so Remove and Delete   
  ${If} $ConfigFile == "NULL" ; Isolinux/Syslinux config file doesn't exist!
  ${AndIf} $Config2Use != "menu.lst" ; menu.lst = GRUB, so we shouldn't expect to find a syslinux config file!
    MessageBox MB_OK "YUMI couldn't find a configuration file.$\r$\nPlease report '$JustISO' not supported!$\r$\nYUMI will now remove this entry."   
    ${DeleteMenuEntry} "$BootDir\multiboot\menu\$Config2Use" "#start $JustISOName" "#end $JustISOName" ; Remove entry from config file... I.E. linux.cfg, system.cfg, etc
    StrCpy $DistroName "$JustISOName" ; So we can remove the following Installed.txt entry
    ${LineFind} "$BootDir\multiboot\Installed.txt" "$BootDir\multiboot\Installed.txt" "1:-1" "DeleteInstall" ; Remove the Installed.txt entry
    ${LineFind} "$BootDir\multiboot\Installed.txt" "$BootDir\multiboot\Installed.txt" "1:-1" "DeleteEmptyLine" ; Remove any left over empty lines from Installed.txt
    RMDir /R "$BootDir\multiboot\$JustISOName"  
    DetailPrint "$JustISOName and its menu entry were Removed!"  	
  ${EndIf}	
FunctionEnd

!macro Install_Distros 
; Initiate Plugins Directory for potential use
  SetShellVarContext all
  InitPluginsDir

; If distro is already installed, delete the entry, so we don't make a mess.
 ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\*.*"
 ${DeleteMenuEntry} "$BootDir\multiboot\menu\$Config2Use" "#start $DistroName" "#end $DistroName" ; Remove entry from config file... I.E. linux.cfg, system.cfg, etc
 ${EndIf}
 
; Write $JustISOName to Installed.txt 
 ${InstalledList} "$JustISOName" $R0 ; Write the ISO name to the Installed List "Installed.txt" file (so we can keep track of installs for removal)
 ${LineFind} "$BootDir\multiboot\Installed.txt" "$BootDir\multiboot\Installed.txt" "1:-1" "DeleteEmptyLine" ; Remove any left over empty lines

; Kaspersky Rescue Disk
 ${If} $DistroName == "Kaspersky Rescue Disk (Antivirus Scanner)" 
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -x![BOOT] -o"$BootDir\multiboot\$JustISOName\" -y'  
 File /oname=$PLUGINSDIR\kav.cfg "menu\kav.cfg"   
 CopyFiles "$PLUGINSDIR\kav.cfg" "$BootDir\multiboot\$JustISOName\syslinux\syslinux.cfg" 
 CopyFiles "$PLUGINSDIR\vesamenu.c32" "$BootDir\multiboot\$JustISOName\syslinux\vesamenu.c32"  
 !insertmacro ReplaceInFile "SLUG" "$JustISOName" "all" "all" "$BootDir\multiboot\$JustISOName\syslinux\syslinux.cfg" 
 Call FindConfig
 ${WriteToFile} "#start $JustISOName$\r$\nlabel $JustISOName$\r$\nMENU LABEL $JustISOName$\r$\nCONFIG /multiboot/$JustISOName/$ConfigPath/$ConfigFile$\r$\nAPPEND /multiboot/$JustISOName/$ConfigPath$\r$\n#end $JustISOName" $R0 

; FreeDOS (Balder img) 
 ${ElseIf} $DistroName == "FreeDOS (Balder img)"
 CopyFiles $ISOFile "$BootDir\multiboot\$JustISOName\$JustISO"
 ${WriteToFile} "#start $JustISOName$\r$\nlabel FreeDOS ($JustISOName)$\r$\nMENU LABEL FreeDOS ($JustISOName)$\r$\nMENU INDENT 1$\r$\nKERNEL /multiboot/memdisk$\r$\nAPPEND initrd=/multiboot/$JustISOName/$JustISO$\r$\n#end $JustISOName" $R0
 
; Memtest86+ (Memory Testing Tool)
 ${ElseIf} $DistroName == "Memtest86+ (Memory Testing Tool)"
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -x![BOOT] -o"$BootDir\multiboot\$JustISOName\" -y'  
 ${WriteToFile} "#start $JustISOName$\r$\nLABEL $JustISOName$\r$\nMENU LABEL $JustISOName$\r$\nMENU INDENT 1$\r$\nLINUX /multiboot/$JustISOName/$JustISOName.bin$\r$\n#end $JustISOName" $R0

; Kon-Boot  
 ${ElseIf} $DistroName == "Kon-Boot Floppy Image"
 CreateDirectory "$EXEDIR\TEMPYUMI" ; Create the TEMPYUMI directory
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -pkon-boot -o"$EXEDIR\TEMPYUMI" -y' 
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$EXEDIR\TEMPYUMI\kon-boot1.1-free\FD0-konboot-v1.1-2in1.zip" -pkon-boot -ir!FD0-konboot-v1.1-2in1 -o"$EXEDIR\TEMPYUMI" -y' 
 CopyFiles $EXEDIR\TEMPYUMI\FD0-konboot-v1.1-2in1\FD0-konboot-v1.1-2in1.img "$BootDir\multiboot\konboot.img" 
 RMDir /R "$EXEDIR\TEMPYUMI"
 ${WriteToFile} "#start $JustISOName$\r$\nLABEL Kon-Boot ($JustISOName)$\r$\nMENU LABEL Kon-Boot ($JustISOName)$\r$\nMENU INDENT 1$\r$\nCONFIG /multiboot/menu/konboot.cfg$\r$\nAPPEND /multiboot/menu$\r$\n#end $JustISOName" $R0 
 File /oname=$PLUGINSDIR\konboot.cfg "Menu\konboot.cfg"  
 CopyFiles "$PLUGINSDIR\konboot.cfg" "$BootDir\multiboot\menu\konboot.cfg"

; Falcon 4 Boot CD
 ${ElseIf} $DistroName == "Falcon 4 Boot CD"
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -x![BOOT] -o"$BootDir\" -y' 
 ${WriteToFile} "#start $JustISOName$\r$\nLABEL Falcon 4 Boot CD ($JustISOName)$\r$\nMENU LABEL Falcon 4 Boot CD ($JustISOName)$\r$\nMENU INDENT 1$\r$\nCOM32 /multiboot/chain.c32 ntldr=/grldr$\r$\n#end $JustISOName" $R0
 
; Hiren's Boot CD 
 ${ElseIf} $DistroName == "Hiren's Boot CD" 
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -x![BOOT] -ir!HBCD -o"$BootDir\" -y' 
 ${WriteToFile} "#start $JustISOName$\r$\nLABEL Hiren's Boot CD ($JustISOName)$\r$\nMENU LABEL Hiren's Boot CD ($JustISOName)$\r$\nMENU INDENT 1$\r$\nCOM32 /HBCD/Boot/chain.c32 ntldr=/HBCD/grldr$\r$\n#end $JustISOName" $R0  

; Windows Defender Offline
 ${ElseIf} $DistroName == "Windows Defender Offline"
 CopyFiles $ISOFile "$BootDir\multiboot\ISOS\$JustISO" 
 ${WriteToFile} "#start $JustISOName$\r$\nLABEL Windows Defender Offline ($JustISOName)$\r$\nMENU LABEL Windows Defender Offline ($JustISOName)$\r$\nMENU INDENT 1$\r$\nLINUX /multiboot/grub.exe$\r$\nAPPEND --config-file=$\"ls /multiboot/ISOS/$JustISO || find --set-root /multiboot/ISOS/$JustISO;map --heads=0 --sectors-per-track=0 /multiboot/ISOS/$JustISO (0xff) || map --heads=0 --sectors-per-track=0 --mem /multiboot/ISOS/$JustISO (0xff);map --hook;chainloader (0xff)$\"$\r$\n#end $JustISOName" $R0

 ; Windows Vista/7/8
 ${ElseIf} $DistroName == "Windows Vista/7/8 Installer"
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -o"$BootDir\" -y -x![BOOT]*' 
 ${WriteToFile} "#start $JustISOName$\r$\nLABEL Windows Vista/7/8 Installer$\r$\nMENU LABEL Windows Vista/7/8 Installer$\r$\nMENU INDENT 1$\r$\nCOM32 /multiboot/chain.c32 fs ntldr=/bootmgr$\r$\n#end $JustISOName" $R0  

; Windows XP
 ${ElseIf} $DistroName == "Windows XP Installer" 
 CopyFiles $ISOFile "$BootDir\multiboot\ISOS\$JustISO"
 ${WriteToFile} "#start $JustISOName$\r$\ntitle Begin Install of Windows XP from $JustISO (Stage 1)$\r$\nfind --set-root /multiboot/ISOS/$JustISO$\r$\nmap (hd0) (hd1)$\r$\nmap (hd1) (hd0)$\r$\nmap --mem /multiboot/ISOS/firadisk.img (fd0)$\r$\nmap --mem /multiboot/ISOS/firadisk.img (fd1)$\r$\nmap --mem /multiboot/ISOS/$JustISO (0xff)$\r$\nmap --hook$\r$\nchainloader (0xff)/I386/SETUPLDR.BIN$\r$\n$\r$\ntitle Continue Windows XP Install from $JustISO (Stage 2)$\r$\nfind --set-root /multiboot/ISOS/$JustISO$\r$\nmap (hd0) (hd1)$\r$\nmap (hd1) (hd0)$\r$\nmap --mem /multiboot/ISOS/$JustISO (0xff)$\r$\nmap --hook$\r$\nchainloader (hd0)+1$\r$\n$\r$\ntitle Boot Windows XP - If fails, reboot with USB removed (Stage 3)$\r$\nmap (hd1) (hd0)$\r$\nmap (hd0) (hd1)$\r$\nroot (hd1,0)$\r$\nfind --set-root /ntldr$\r$\nchainloader /ntldr$\r$\n#end $JustISOName" $R0  
 File /oname=$PLUGINSDIR\firadisk.img "firadisk.img"  
 CopyFiles "$PLUGINSDIR\firadisk.img" "$BootDir\multiboot\ISOS\firadisk.img"   
 
; Unlisted ISOs
 ${ElseIf} $DistroName == "Try Unlisted ISO (GRUB)" 
 CopyFiles $ISOFile "$BootDir\multiboot\ISOS\$JustISO"
 ${WriteToFile} "#start $JustISOName$\r$\n#Modify the following entry if it does not boot$\r$\ntitle Boot $JustISO$\r$\nfind --set-root --ignore-floppies --ignore-cd /multiboot/ISOS/$JustISO$\r$\nmap --heads=0 --sectors-per-track=0 /multiboot/ISOS/$JustISO (hd32)$\r$\nmap --hook$\r$\nchainloader (hd32)$\r$\n#end $JustISOName" $R0 
 
 ${ElseIf} $DistroName == "Try Unlisted ISO (GRUB from RAM)" 
 CopyFiles $ISOFile "$BootDir\multiboot\ISOS\$JustISO"
 ${WriteToFile} "#start $JustISOName$\r$\n#Modify the following memory based entry if it does not boot$\r$\ntitle Boot $JustISO from Memory$\r$\nfind --set-root --ignore-floppies --ignore-cd /multiboot/ISOS/$JustISO$\r$\nmap --heads=0 --sectors-per-track=0 --mem /multiboot/ISOS/$JustISO (hd32)$\r$\nmap --hook$\r$\nroot (hd32)$\r$\nchainloader (hd32)$\r$\n#end $JustISOName" $R0
 
; Ultimate Boot CD (Diagnostics Tools)
 ${ElseIf} $DistroName == "Ultimate Boot CD (Diagnostics Tools)"  
 CopyFiles $ISOFile "$BootDir\multiboot\ISOS\$JustISO"
 ${WriteToFile} "#start $JustISOName$\r$\nlabel Ultimate Boot CD ($JustISOName)$\r$\nmenu label Ultimate Boot CD ($JustISOName)$\r$\nMENU INDENT 1$\r$\nKERNEL /multiboot/grub.exe$\r$\nAPPEND --config-file=/multiboot/menu/ubcd.lst$\r$\n#end $JustISOName" $R0   
 File /oname=$PLUGINSDIR\ubcd.lst "Menu\ubcd.lst"  
 CopyFiles "$PLUGINSDIR\ubcd.lst" "$BootDir\multiboot\menu\ubcd.lst" 
 !insertmacro ReplaceInFile "SLUG" "$JustISO" "all" "all" "$BootDir\multiboot\menu\ubcd.lst"  
  
 ${Else}
; Start Catch All Install Methods 
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -x![BOOT] -o"$BootDir\multiboot\$JustISOName\" -y'  
 Call FindConfig
 ${WriteToFile} "#start $JustISOName$\r$\nLABEL $JustISOName$\r$\nMENU LABEL $JustISOName$\r$\nCONFIG /multiboot/$JustISOName/$ConfigPath/$ConfigFile$\r$\nAPPEND /multiboot/$JustISOName/$ConfigPath$\r$\n#end $JustISOName" $R0 

; For Ubuntu Desktop and derivatives
  ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\txt.cfg" ; Rename the following for isolinux txt.cfg
  !insertmacro ReplaceInFile "file=/cdrom/preseed/" "file=/cdrom/multiboot/$JustISOName/preseed/" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\txt.cfg"  
  !insertmacro ReplaceInFile "initrd=/casper/" "cdrom-detect/try-usb=true noprompt floppy.allowed_drive_mask=0 ignore_uuid live-media-path=/multiboot/$JustISOName/casper/ initrd=/multiboot/$JustISOName/casper/" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\txt.cfg"  
  !insertmacro ReplaceInFile "kernel /casper/" "kernel /multiboot/$JustISOName/casper/" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\txt.cfg"  
  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\text.cfg" ; Rename the following for isolinux text.cfg
  !insertmacro ReplaceInFile "file=/cdrom/preseed/" "file=/cdrom/multiboot/$JustISOName/preseed/" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\text.cfg"  
  !insertmacro ReplaceInFile "initrd=/casper/" "cdrom-detect/try-usb=true noprompt floppy.allowed_drive_mask=0 ignore_uuid live-media-path=/multiboot/$JustISOName/casper/ initrd=/multiboot/$JustISOName/casper/" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\text.cfg"  
  !insertmacro ReplaceInFile "kernel /casper/" "kernel /multiboot/$JustISOName/casper/" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\text.cfg"  
  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg" ; Rename the following for isolinux.cfg
  !insertmacro ReplaceInFile "file=/cdrom/preseed/" "file=/cdrom/multiboot/$JustISOName/preseed/" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg"  
  !insertmacro ReplaceInFile "initrd=/casper/" "cdrom-detect/try-usb=true noprompt floppy.allowed_drive_mask=0 ignore_uuid live-media-path=/multiboot/$JustISOName/casper/ initrd=/multiboot/$JustISOName/casper/" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg"  
  !insertmacro ReplaceInFile "kernel /casper/" "kernel /multiboot/$JustISOName/casper/" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg"    
  ${EndIf}
  ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\grub\loopback.cfg" ; Rename the following for grub loopback.cfg
  !insertmacro ReplaceInFile "file=/cdrom/preseed/" "file=/cdrom/multiboot/$JustISOName/preseed/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\grub\loopback.cfg"  
  !insertmacro ReplaceInFile "linux	/casper/" "linux /multiboot/$JustISOName/casper/ cdrom-detect/try-usb=true noprompt floppy.allowed_drive_mask=0 ignore_uuid live-media-path=/multiboot/$JustISOName/casper/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\grub\loopback.cfg"  
  !insertmacro ReplaceInFile "initrd /casper/" "initrd /multiboot/$JustISOName/casper/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\grub\loopback.cfg" 
  ${EndIf}

; For Ubuntu Server  
  ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\install\netboot\ubuntu-installer\i386\*.*"  
   ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\txt.cfg" ; Rename the following for isolinux txt.cfg
   !insertmacro ReplaceInFile "initrd=/install/" "cdrom-detect/try-usb=true noprompt initrd=/multiboot/$JustISOName/install/netboot/ubuntu-installer/i386/" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\txt.cfg"  
   !insertmacro ReplaceInFile "kernel /install/vmlinuz" "kernel /multiboot/$JustISOName/install/netboot/ubuntu-installer/i386/linux" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\txt.cfg"    
   ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\install\netboot\ubuntu-installer\i386\*.*"     
   ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\text.cfg" ; Rename the following for isolinux text.cfg  
   !insertmacro ReplaceInFile "initrd=/install/" "cdrom-detect/try-usb=true noprompt initrd=/multiboot/$JustISOName/install/netboot/ubuntu-installer/i386/" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\text.cfg"  
   !insertmacro ReplaceInFile "kernel /install/vmlinuz" "kernel /multiboot/$JustISOName/install/netboot/ubuntu-installer/i386/linux" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\text.cfg"   
   ; Ubuntu Server amd64
   ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\install\netboot\ubuntu-installer\amd64\*.*"  
   ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\txt.cfg" ; Rename the following for isolinux txt.cfg
   !insertmacro ReplaceInFile "initrd=/install/" "cdrom-detect/try-usb=true noprompt initrd=/multiboot/$JustISOName/install/netboot/ubuntu-installer/amd64/" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\txt.cfg"  
   !insertmacro ReplaceInFile "kernel /install/vmlinuz" "kernel /multiboot/$JustISOName/install/netboot/ubuntu-installer/amd64/linux" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\txt.cfg"    
   ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\install\netboot\ubuntu-installer\amd64\*.*"     
   ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\text.cfg" ; Rename the following for isolinux text.cfg  
   !insertmacro ReplaceInFile "initrd=/install/" "cdrom-detect/try-usb=true noprompt initrd=/multiboot/$JustISOName/install/netboot/ubuntu-installer/amd64/" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\text.cfg"  
   !insertmacro ReplaceInFile "kernel /install/vmlinuz" "kernel /multiboot/$JustISOName/install/netboot/ubuntu-installer/amd64/linux" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\text.cfg"    
  ${EndIf}  
  
; For Debian Based and derivatives
  ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\live.cfg" ; Rename the following for isolinux live.cfg
  !insertmacro ReplaceInFile "linux /live/" "linux /multiboot/$JustISOName/live/" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\live.cfg"  
  !insertmacro ReplaceInFile "initrd /live/" "initrd /multiboot/$JustISOName/live/" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\live.cfg" 
  !insertmacro ReplaceInFile "append boot=live" "append live-media-path=/multiboot/$JustISOName/live boot=live" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\live.cfg" 
  ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\install.cfg" ; Rename the following for isolinux install.cfg  
  !insertmacro ReplaceInFile "linux /install/" "linux /multiboot/$JustISOName/install/" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\install.cfg"  
  !insertmacro ReplaceInFile "initrd /install/" "initrd /multiboot/$JustISOName/install/" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\install.cfg"   
  ${EndIf}  
  
; For Fedora Based and derivatives
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg" 
   ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\LiveOS\livecd-iso-to-disk"  ; Probably Fedora based
   !insertmacro ReplaceInFile "root=live:CDLABEL=" "root=live:LABEL=MULTIBOOT live_dir=/multiboot/$JustISOName/LiveOS NULL=" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg"   
   ${EndIf} 

; For Puppy Based and derivatives
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux.cfg" 
   ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\help2.msg"  ; Probably Puppy based  
   !insertmacro ReplaceInFile "pmedia=cd" "psubdir=/multiboot/$JustISOName psubok=TRUE" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux.cfg"    
   ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux.cfg" 
   ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\help\help.msg"  ; Probably Puppy based 
   !insertmacro ReplaceInFile "append search" "append search psubdir=/multiboot/$JustISOName psubok=TRUE" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux.cfg"       
  ${EndIf} 
  
; For Clonezilla, and DRBL
  ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\syslinux\syslinux.cfg" ; Rename the following for syslinux syslinux.cfg
  !insertmacro ReplaceInFile "kernel /live" "kernel /multiboot/$JustISOName/live" "all" "all" "$BootDir\multiboot\$JustISOName\syslinux\syslinux.cfg"  
  !insertmacro ReplaceInFile "initrd=/live" "live-media-path=/multiboot/$JustISOName/live/ initrd=/multiboot/$JustISOName/live" "all" "all" "$BootDir\multiboot\$JustISOName\syslinux\syslinux.cfg"  
  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg" ; Rename the following for isolinux isolinux.cfg
  !insertmacro ReplaceInFile "kernel /live" "kernel /multiboot/$JustISOName/live" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg"  
  !insertmacro ReplaceInFile "initrd=/live" "live-media-path=/multiboot/$JustISOName/live/ initrd=/multiboot/$JustISOName/live" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg"  
  ${EndIf}
  
; Xpud
  ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\vesamenu.c32"
  ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\opt\media"  
  !insertmacro ReplaceInFile "KERNEL /boot/" "KERNEL /multiboot/$JustISOName/boot/" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile" 
  !insertmacro ReplaceInFile "/opt/media,/opt/scim" "/multiboot/$JustISOName/opt/media,/multiboot/$JustISOName/opt/scim" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile" 
  !insertmacro ReplaceInFile "DEFAULT /boot/" "DEFAULT /multiboot/$JustISOName/boot/" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"   
  !insertmacro ReplaceInFile "MENU BACKGROUND /boot/" "MENU BACKGROUND /multiboot/$JustISOName/boot/" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"  
  !insertmacro ReplaceInFile "APPEND initrd=/opt/media" "APPEND initrd=/multiboot/$JustISOName/opt/media" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"   
  ${EndIf}
  
; AntivirusLiveCD, Comodo
  ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\bzImage"  
  !insertmacro ReplaceInFile "kernel /boot/bzImage" "kernel /multiboot/$JustISOName/boot/bzImage" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile" 
  ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\initrd*" 
  ${OrIf} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\rootfs*"   
  !insertmacro ReplaceInFile "append initrd=/boot" "append initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"  
  ${EndIf} 
  
  ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\*.jpg" ; Fix background Image Paths
  ${OrIf} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\*.png"   
  !insertmacro ReplaceInFile "MENU BACKGROUND /boot" "MENU BACKGROUND /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"   
  ${EndIf} 
  
; AOSS
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\system\stage1"  
   !insertmacro ReplaceInFile "KERNEL /system" "KERNEL /multiboot/$JustISOName/system" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"  
   !insertmacro ReplaceInFile "initrd=/system" "initrd=/multiboot/$JustISOName/system" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"    
   !insertmacro ReplaceInFile "boot=cdrom" "boot=usb" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"    
   ${EndIf} 
   
; TinyCore, + REVISIT WifiWay, + REVISIT Dr.Web
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\vmlinuz"  
   !insertmacro ReplaceInFile "kernel /boot" "kernel /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"  
   ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\initrd" 
   ${OrIf} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\initrd.gz"  
   ${OrIf} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\initrd.lz"     
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"  
   ${EndIf}
   
; WifiSlax ; Entry initially populated by Lance, completed and submitted by Geminis Demon 
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\menus\wifislax.cfg"  
   !insertmacro ReplaceInFile "/boot/" "/multiboot/$JustISOName/NULL/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\syslinux\syslinux.cfg" 
   !insertmacro ReplaceInFile "/NULL/" "/boot/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\syslinux\syslinux.cfg"     
   
   !insertmacro ReplaceInFile "/boot/" "/multiboot/$JustISOName/NULL/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\isolinux\isolinux.cfg" 
   !insertmacro ReplaceInFile "/NULL/" "/boot/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\isolinux\isolinux.cfg" 
   
   !insertmacro ReplaceInFile "/boot/" "/multiboot/$JustISOName/NULL/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\wifislax.cfg" 
   !insertmacro ReplaceInFile "/NULL/" "/boot/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\wifislax.cfg"  

   !insertmacro ReplaceInFile "/boot/" "/multiboot/$JustISOName/NULL/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\wifislax-english.cfg" 
   !insertmacro ReplaceInFile "/NULL/" "/boot/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\wifislax-english.cfg"   
   
   !insertmacro ReplaceInFile "/boot/" "/multiboot/$JustISOName/NULL/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\kernel-normal.cfg" 
   !insertmacro ReplaceInFile "/NULL/" "/boot/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\kernel-normal.cfg"
   !insertmacro ReplaceInFile "/vmlinuz" "/NULL from=multiboot/$JustISOName noauto" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\kernel-normal.cfg" 
   !insertmacro ReplaceInFile "/NULL" "/vmlinuz" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\kernel-normal.cfg"
   !insertmacro ReplaceInFile "changes=" "NULL=/multiboot/$JustISOName" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\kernel-normal.cfg" 
   !insertmacro ReplaceInFile "NULL=" "changes=" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\kernel-normal.cfg"
   
   !insertmacro ReplaceInFile "/boot/" "/multiboot/$JustISOName/NULL/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\english-kernel-normal.cfg"
   !insertmacro ReplaceInFile "/NULL/" "/boot/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\english-kernel-normal.cfg"
   !insertmacro ReplaceInFile "/vmlinuz" "/NULL from=multiboot/$JustISOName noauto" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\english-kernel-normal.cfg" 
   !insertmacro ReplaceInFile "/NULL" "/vmlinuz" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\english-kernel-normal.cfg"
   !insertmacro ReplaceInFile "changes=" "NULL=/multiboot/$JustISOName" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\english-kernel-normal.cfg" 
   !insertmacro ReplaceInFile "NULL=" "changes=" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\english-kernel-normal.cfg"

   !insertmacro ReplaceInFile "/boot/" "/multiboot/$JustISOName/NULL/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\kernel-pae.cfg" 
   !insertmacro ReplaceInFile "/NULL/" "/boot/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\kernel-pae.cfg"
   !insertmacro ReplaceInFile "/vmlinuz2" "/NULL from=multiboot/$JustISOName noauto" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\kernel-pae.cfg"
   !insertmacro ReplaceInFile "/NULL" "/vmlinuz2" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\kernel-pae.cfg"
   !insertmacro ReplaceInFile "changes=" "NULL=/multiboot/$JustISOName" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\kernel-pae.cfg"
   !insertmacro ReplaceInFile "NULL=" "changes=" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\kernel-pae.cfg"

   !insertmacro ReplaceInFile "/boot/" "/multiboot/$JustISOName/NULL/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\english-kernel-pae.cfg"
   !insertmacro ReplaceInFile "/NULL/" "/boot/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\english-kernel-pae.cfg"   
   !insertmacro ReplaceInFile "/vmlinuz2" "/NULL from=multiboot/$JustISOName noauto" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\english-kernel-pae.cfg"
   !insertmacro ReplaceInFile "/NULL" "/vmlinuz2" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\english-kernel-pae.cfg"
   !insertmacro ReplaceInFile "changes=" "NULL=/multiboot/$JustISOName" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\english-kernel-pae.cfg"
   !insertmacro ReplaceInFile "NULL=" "changes=" "all" "all" "$BootDir\multiboot\$JustISOName\boot\menus\english-kernel-pae.cfg"
   ${EndIf}
   
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\core.gz" ; TinyCore specific
   !insertmacro ReplaceInFile "initrd=/boot/core.gz" "initrd=/multiboot/$JustISOName/boot/core.gz" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"  
   !insertmacro ReplaceInFile "INITRD /boot/core.gz" "INITRD /multiboot/$JustISOName/boot/core.gz" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"     
   ${EndIf}
   
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\tinycore.gz" ; Partition Wizard, TinyCore specific
   !insertmacro ReplaceInFile "initrd=/boot/tinycore.gz" "initrd=/multiboot/$JustISOName/boot/tinycore.gz" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"  
   !insertmacro ReplaceInFile "INITRD /boot/tinycore.gz" "INITRD /multiboot/$JustISOName/boot/tinycore.gz" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"     
   ${EndIf}   
   
; F-Secure Rescue CD
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\isolinux\fsecure\linux"  
   !insertmacro ReplaceInFile "kernel fsecure" "kernel /multiboot/$JustISOName/boot/isolinux/fsecure" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"  
   !insertmacro ReplaceInFile "initrd=fsecure" "initrd=/multiboot/$JustISOName/boot/isolinux/fsecure" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile" 
   !insertmacro ReplaceInFile "fsecure/boot." "/multiboot/$JustISOName/boot/isolinux/fsecureNULL/boot." "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"  
   !insertmacro ReplaceInFile "fsecureNULL/boot." "fsecure/boot." "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"    
   !insertmacro ReplaceInFile "APPEND ramdisk_size" "APPEND noprompt knoppix_dir=/multiboot/$JustISOName/KNOPPIX ramdisk_size" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile" 
   ${EndIf}   

; GData
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\linux6"  
   !insertmacro ReplaceInFile "KERNEL /boot" "KERNEL /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"  
   !insertmacro ReplaceInFile "INITRD /boot" "INITRD /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile" 
   !insertmacro ReplaceInFile "APPEND boot=live" "APPEND live-media-path=/multiboot/$JustISOName/live boot=live" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"
   ${EndIf} 

; Liberte
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\liberte\boot\syslinux\syslinux.cfg"  
   !insertmacro ReplaceInFile "/liberte/boot/syslinux/" "" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"  
   !insertmacro ReplaceInFile "/liberte/boot/" "/multiboot/$JustISOName/liberte/boot/" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile" 
   !insertmacro ReplaceInFile "cdroot_hash=" "initrd=/multiboot/$JustISOName/liberte/boot/initrd-x86.xz loop=/multiboot/$JustISOName/liberte/boot/root-x86.sfs NULL=" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"   
   ${EndIf}    

; Panda Safe CD, Tails
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\$CopyPath\live.cfg"  
   !insertmacro ReplaceInFile "kernel /live" "kernel /multiboot/$JustISOName/live" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\live.cfg" 
   !insertmacro ReplaceInFile "initrd=/live" "initrd=/multiboot/$JustISOName/live" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\live.cfg" 
   !insertmacro ReplaceInFile "live-media=removable" "" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\live.cfg"    
   !insertmacro ReplaceInFile "append initrd=" "append noprompt live-media-path=/multiboot/$JustISOName/live initrd=" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\live.cfg"
   ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\$CopyPath\live486.cfg"  ; Tails Specific 486
   !insertmacro ReplaceInFile "kernel /live" "kernel /multiboot/$JustISOName/live" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\live486.cfg"  
   !insertmacro ReplaceInFile "initrd=/live" "initrd=/multiboot/$JustISOName/live" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\live486.cfg" 
   !insertmacro ReplaceInFile "live-media=removable" "" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\live486.cfg"   
   !insertmacro ReplaceInFile "append initrd=" "append noprompt live-media-path=/multiboot/$JustISOName/live initrd=" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\live486.cfg"
   ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\$CopyPath\live686.cfg"  ; Tails Specific
   !insertmacro ReplaceInFile "kernel /live" "kernel /multiboot/$JustISOName/live" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\live686.cfg"  
   !insertmacro ReplaceInFile "initrd=/live" "initrd=/multiboot/$JustISOName/live" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\live686.cfg" 
   !insertmacro ReplaceInFile "live-media=removable" "" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\live686.cfg"    
   !insertmacro ReplaceInFile "append initrd=" "append noprompt live-media-path=/multiboot/$JustISOName/live initrd=" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\live686.cfg"    
   ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\$CopyPath\isolinux.cfg"  
   !insertmacro ReplaceInFile "default /isolinux/vesamenu.c32" "default /multiboot/$JustISOName/isolinux/vesamenu.c32" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile" 
   ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\$CopyPath\splash.png"   
   !insertmacro ReplaceInFile "menu background /isolinux" "menu background /multiboot/$JustISOName/isolinux" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\stdmenu.cfg"   
   ${EndIf}  

; Webconverger
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\live.cfg"  
   !insertmacro ReplaceInFile "kernel /live" "kernel /multiboot/$JustISOName/live" "all" "all" "$BootDir\multiboot\$JustISOName\boot\live.cfg"  
   !insertmacro ReplaceInFile "initrd=/live" "noprompt live-media-path=/multiboot/$JustISOName/live initrd=/multiboot/$JustISOName/live" "all" "all" "$BootDir\multiboot\$JustISOName\boot\live.cfg" 
   ${EndIf} 

; AntiX
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\antiX\vmlinuz"  
   !insertmacro ReplaceInFile "/antiX/vmlinuz" "/multiboot/$JustISOName/antiX/vmlinuz" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"  
   !insertmacro ReplaceInFile "INITRD /antiX" "INITRD /multiboot/$JustISOName/antiX" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile" 
   !insertmacro ReplaceInFile "APPEND quiet" "APPEND image_dir=/multiboot/$JustISOName/antiX" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"     
   ${EndIf}   
   
; Archlinux
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\arch\boot\syslinux\archiso.cfg"  
   !insertmacro ReplaceInFile "CONFIG /arch" "CONFIG /multiboot/$JustISOName/arch" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"  
   !insertmacro ReplaceInFile "APPEND /arch" "APPEND /multiboot/$JustISOName/arch" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile" 
   !insertmacro ReplaceInFile "archisobasedir=arch" "archisobasedir=/multiboot/$JustISOName/arch" "all" "all" "$BootDir\multiboot\$JustISOName\arch\boot\syslinux\archiso_pxe64.cfg"     
   !insertmacro ReplaceInFile "archisolabel=ARCH" "archisolabel=MULTIBOOT NULL=" "all" "all" "$BootDir\multiboot\$JustISOName\arch\boot\syslinux\archiso_pxe64.cfg"     
   !insertmacro ReplaceInFile "archisobasedir=arch" "archisobasedir=/multiboot/$JustISOName/arch" "all" "all" "$BootDir\multiboot\$JustISOName\arch\boot\syslinux\archiso_pxe32.cfg"     
   !insertmacro ReplaceInFile "archisolabel=ARCH" "archisolabel=MULTIBOOT NULL=" "all" "all" "$BootDir\multiboot\$JustISOName\arch\boot\syslinux\archiso_pxe32.cfg"  

   !insertmacro ReplaceInFile "archisobasedir=arch" "archisobasedir=/multiboot/$JustISOName/arch" "all" "all" "$BootDir\multiboot\$JustISOName\arch\boot\syslinux\archiso_sys64.cfg"     
   !insertmacro ReplaceInFile "archisolabel=ARCH" "archisolabel=MULTIBOOT NULL=" "all" "all" "$BootDir\multiboot\$JustISOName\arch\boot\syslinux\archiso_sys64.cfg"     
   !insertmacro ReplaceInFile "archisobasedir=arch" "archisobasedir=/multiboot/$JustISOName/arch" "all" "all" "$BootDir\multiboot\$JustISOName\arch\boot\syslinux\archiso_sys32.cfg"     
   !insertmacro ReplaceInFile "archisolabel=ARCH" "archisolabel=MULTIBOOT NULL=" "all" "all" "$BootDir\multiboot\$JustISOName\arch\boot\syslinux\archiso_sys32.cfg"     
   ${EndIf}   

; Slax
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\slax\boot\syslinux.cfg"  
   !insertmacro ReplaceInFile "/slax/boot/" "/multiboot/$JustISOName/slax/bootNULL" "all" "all" "$BootDir\multiboot\$JustISOName\slax\boot\syslinux.cfg"  
   !insertmacro ReplaceInFile "NULL" "/" "all" "all" "$BootDir\multiboot\$JustISOName\slax\boot\syslinux.cfg"   
   !insertmacro ReplaceInFile "APPEND vga=" "APPEND from=/multiboot/$JustISOName/slax changes=/multiboot/$JustISOName/slax vga=" "all" "all" "$BootDir\multiboot\$JustISOName\slax\boot\syslinux.cfg"
   ${EndIf}  

; Porteus
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\syslinux\porteus.cfg"  
   !insertmacro ReplaceInFile "APPEND initrd=" "APPEND from=/multiboot/$JustISOName initrd=" "all" "all" "$BootDir\multiboot\$JustISOName\boot\syslinux\porteus.cfg" 
   !insertmacro ReplaceInFile "changes=/porteus" "" "all" "all" "$BootDir\multiboot\$JustISOName\boot\syslinux\porteus.cfg" ;eventually use changes=/multiboot/$JustISOName/changes.dat
   ${EndIf} 

; Knoppix - tested on v6 and 7
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\isolinux\isolinux.cfg"  
   ${OrIf} ${FileExists} "$BootDir\multiboot\$JustISOName\KNOPPIX\KNOPPIX"    
   !insertmacro ReplaceInFile "APPEND lang=" "APPEND noprompt knoppix_dir=/multiboot/$JustISOName/KNOPPIX lang=" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile" 
   !insertmacro ReplaceInFile "APPEND ramdisk_size" "APPEND noprompt knoppix_dir=/multiboot/$JustISOName/KNOPPIX ramdisk_size" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"   
   ${EndIf}  
   
; Mandriva
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg"
   ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\LiveOS\*.*"   
   !insertmacro ReplaceInFile "append initrd=" "append live_dir=/multiboot/$JustISOName/LiveOS initrd=" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg" 
   !insertmacro ReplaceInFile "root=live:CDLABEL=" "root=live:LABEL=MULTIBOOT NULL=" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg"    
   ${EndIf}  

; !REVISIT BROKEN Mageia
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg"
   ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\loopbacks\distrib-lzma.sqfs"   
   !insertmacro ReplaceInFile "root=mgalive:LABEL=Mageia" "root=mgalive:LABEL=MULTIBOOT NULL=Mageia" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg"  
   !insertmacro ReplaceInFile "ui gfxboot.c32" "#ui NULL gfxboot.c32" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg" 
   !insertmacro ReplaceInFile "display /boot" "display /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg"
   !insertmacro ReplaceInFile "append initrd=/boot" "append initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg"  
   ${EndIf}     

; PCLinuxOS
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg" 
   ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\livecd.sqfs"    
   !insertmacro ReplaceInFile "append livecd=livecd" "append fromusb livecd=/multiboot/$JustISOName/livecd" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg" 
   !insertmacro ReplaceInFile "prompt" "#prompt" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg"   
   !insertmacro ReplaceInFile "ui gfxboot.com" "#ui gfxboot.com" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg"  
   !insertmacro ReplaceInFile "timeout" "#timeout" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg"    
   ${EndIf}     
   
; SlitaZ
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\isolinux\isolinux.cfg"
   ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\*slitaz"   
   !insertmacro ReplaceInFile "kernel /boot/isolinux" "kernel /multiboot/$JustISOName/boot/isolinux" "all" "all" "$BootDir\multiboot\$JustISOName\boot\isolinux\isolinux.cfg" 
   !insertmacro ReplaceInFile ",/boot" ",/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\boot\isolinux\isolinux.cfg"  
   !insertmacro ReplaceInFile "append /md5sum" "append /multiboot/$JustISOName/md5sum" "all" "all" "$BootDir\multiboot\$JustISOName\boot\isolinux\isolinux.cfg"
   !insertmacro ReplaceInFile "KERNEL /boot/gpxe" "KERNEL /multiboot/$JustISOName/boot/gpxe" "all" "all" "$BootDir\multiboot\$JustISOName\boot\isolinux\isolinux.cfg"   
   ${EndIf}     

; Easus Disk Copy, Panda Safe CD
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\$CopyPath\stdmenu.cfg" 
   !insertmacro ReplaceInFile "default /$CopyPath/" "default " "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile" 
   !insertmacro ReplaceInFile "menu background /$CopyPath/" "menu background " "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\stdmenu.cfg"  
   ${EndIf} 
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\bzImage"     
    ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\$CopyPath\live.cfg"    
    !insertmacro ReplaceInFile "kernel /bzImage" "kernel /multiboot/$JustISOName/bzImage" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\live.cfg"
    !insertmacro ReplaceInFile "initrd=/initrd" "initrd=/multiboot/$JustISOName/initrd" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\live.cfg"   
   ${EndIf} 
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\bzImage"     
    ${AndIf} ${FileExists} "$BootDir\multiboot\$JustISOName\$CopyPath\isolinux.cfg"    
    !insertmacro ReplaceInFile "kernel /bzImage" "kernel /multiboot/$JustISOName/bzImage" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\isolinux.cfg"
    !insertmacro ReplaceInFile "initrd=/initrd" "initrd=/multiboot/$JustISOName/initrd" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\isolinux.cfg"   
   ${EndIf} 
 	
	
; GRML (system rescue)
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\$CopyPath\addon_10_grub2.cfg" 
   !insertmacro ReplaceInFile "kernel /boot/addons/mboot.c32 /boot/grub/grub.img" "kernel /multiboot/$JustISOName/boot/addons/mboot.c32 /multiboot/$JustISOName/boot/grub/grub.img" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\addon_10_grub2.cfg" 
   !insertmacro ReplaceInFile "kernel /boot" "kernel /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\addon_20_allinone.cfg"  
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\addon_20_allinone.cfg"
   !insertmacro ReplaceInFile "kernel /boot" "kernel /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\addon_25_gxpe.cfg"     
   !insertmacro ReplaceInFile "kernel /boot" "kernel /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\addon_30_dos.cfg"     
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\addon_30_dos.cfg" 
   !insertmacro ReplaceInFile "kernel /boot" "kernel /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\addon_35_bsd.cfg"  
   !insertmacro ReplaceInFile "kernel /boot" "kernel /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\addon_40_memtest.cfg"  
   !insertmacro ReplaceInFile "kernel /boot" "kernel /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\addon_45_hdt.cfg"  
   !insertmacro ReplaceInFile "pciids=/boot" "pciids=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\addon_45_hdt.cfg"    
   !insertmacro ReplaceInFile "kernel /boot" "kernel /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\hidden.cfg"  
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\hidden.cfg"  
   !insertmacro ReplaceInFile "live-media-path=/live" "live-media-path=/multiboot/$JustISOName/live" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\hidden.cfg"       
   !insertmacro ReplaceInFile "kernel /boot" "kernel /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml64_full_grml.cfg"  
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml64_full_grml.cfg"  
   !insertmacro ReplaceInFile "live-media-path=/live" "live-media-path=/multiboot/$JustISOName/live" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml64_full_grml.cfg"     
   !insertmacro ReplaceInFile "kernel /boot" "kernel /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml64_full_default.cfg"  
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml64_full_default.cfg"  
   !insertmacro ReplaceInFile "live-media-path=/live" "live-media-path=/multiboot/$JustISOName/live" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml64_full_default.cfg"  
   !insertmacro ReplaceInFile "kernel /boot" "kernel /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml32_full_default.cfg"  
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml32_full_default.cfg"  
   !insertmacro ReplaceInFile "live-media-path=/live" "live-media-path=/multiboot/$JustISOName/live" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml32_full_default.cfg"  
   !insertmacro ReplaceInFile "kernel /boot" "kernel /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml32_full_grml.cfg"  
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml32_full_grml.cfg"  
   !insertmacro ReplaceInFile "live-media-path=/live" "live-media-path=/multiboot/$JustISOName/live" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml32_full_grml.cfg"  
   !insertmacro ReplaceInFile "kernel /boot" "kernel /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml32_full_hidden.cfg"  
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml32_full_hidden.cfg"  
   !insertmacro ReplaceInFile "live-media-path=/live" "live-media-path=/multiboot/$JustISOName/live" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml32_full_hidden.cfg" 
   !insertmacro ReplaceInFile "bootid=" "ignore_bootid NULL=" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml32_full_grml.cfg"  
   !insertmacro ReplaceInFile "bootid=" "ignore_bootid NULL=" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml32_full_hidden.cfg"  
   !insertmacro ReplaceInFile "bootid=" "ignore_bootid NULL=" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml32_full_default.cfg"
   !insertmacro ReplaceInFile "bootid=" "ignore_bootid NULL=" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml64_full_grml.cfg"  
   !insertmacro ReplaceInFile "bootid=" "ignore_bootid NULL=" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml64_full_hidden.cfg"
   !insertmacro ReplaceInFile "bootid=" "ignore_bootid NULL=" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\grml64_full_default.cfg"   
    ${EndIf}  

; Ophcrack
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\$CopyPath\ophcrack.cfg" 
   !insertmacro ReplaceInFile "KERNEL /boot" "KERNEL /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\ophcrack.cfg" 
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\ophcrack.cfg" 
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\default.cfg" 
   !insertmacro ReplaceInFile "KERNEL /boot" "KERNEL /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\default.cfg"     
   !insertmacro ReplaceInFile "KERNEL /boot" "KERNEL /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\be.cfg" 
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\be.cfg" 
   !insertmacro ReplaceInFile "KERNEL /boot" "KERNEL /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\br.cfg" 
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\br.cfg"
   !insertmacro ReplaceInFile "KERNEL /boot" "KERNEL /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\ca.cfg" 
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\ca.cfg"  
   !insertmacro ReplaceInFile "KERNEL /boot" "KERNEL /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\ca.cfg" 
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\de.cfg"
   !insertmacro ReplaceInFile "KERNEL /boot" "KERNEL /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\de.cfg" 
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\de_CH.cfg" 
   !insertmacro ReplaceInFile "KERNEL /boot" "KERNEL /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\de_CH.cfg"    
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\en.cfg" 
   !insertmacro ReplaceInFile "KERNEL /boot" "KERNEL /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\en.cfg"       
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\es.cfg" 
   !insertmacro ReplaceInFile "KERNEL /boot" "KERNEL /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\es.cfg"  
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\fi.cfg" 
   !insertmacro ReplaceInFile "KERNEL /boot" "KERNEL /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\fi.cfg"  
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\fr.cfg" 
   !insertmacro ReplaceInFile "KERNEL /boot" "KERNEL /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\fr.cfg" 
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\fr_CH.cfg" 
   !insertmacro ReplaceInFile "KERNEL /boot" "KERNEL /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\fr_CH.cfg"   
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\hu.cfg" 
   !insertmacro ReplaceInFile "KERNEL /boot" "KERNEL /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\hu.cfg"    
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\it.cfg" 
   !insertmacro ReplaceInFile "KERNEL /boot" "KERNEL /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\it.cfg" 
   !insertmacro ReplaceInFile "initrd=/boot" "initrd=/multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\jp.cfg" 
   !insertmacro ReplaceInFile "KERNEL /boot" "KERNEL /multiboot/$JustISOName/boot" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\jp.cfg"    
   ${EndIf}  	
  
  Call OldSysFix  ; Check for and replace vesamenu.c32, menu.c32, chain.c32 if found
 ${EndIf} 
; End Catch All Install Methods
  
; Start Distro Specific 
 ${If} $JustISO == "ubuntu-13.10-server-i386.iso"
  ReadEnvStr $R0 COMSPEC ; grab commandline
  nsExec::Exec "$R0 /C Rename $BootDir\multiboot\$JustISOName\pool\main\l\linux\*.ude *.udeb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*.ude *.udeb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*.ude *.udeb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*.ude *.udeb" ; rename broken udeb files 
; Ubuntu Server 12.04 i386
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*precis*.udeb *precise1_i386.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*precise*.deb *precise1_i386.deb" ; rename broken udeb files    
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*precis*.deb *precise1_i386.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*precis*.udeb *precise1_i386.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\linux-headers-3.5.0-23_3.5.0-23.35~precise1_i386.deb linux-headers-3.5.0-23_3.5.0-23.35~precise1_all.deb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*precis*.udeb *precise1_i386.udeb" ; rename broken udeb files    
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\m\maas\python-maas-provisioningserver*.deb python-maas-provisioningserver_1.2+bzr1373+dfsg-0ubuntu1~12.04.1_all.deb" ; rename broken udeb files     
  
 ${ElseIf} $JustISO == "ubuntu-13.10-server-amd64.iso"
  ReadEnvStr $R0 COMSPEC ; grab commandline
  nsExec::Exec "$R0 /C Rename $BootDir\multiboot\$JustISOName\pool\main\l\linux\*.ude *.udeb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*.ude *.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-raring\*.ude *.udeb" ; rename broken udeb files     
  nsExec::Exec "$R0 /C Rename $BootDir\multiboot\$JustISOName\dists\precise\main\dist-upgrader\binary-amd64\*.ude *.udeb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*.ude *.udeb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*.ude *.udeb" ; rename broken udeb files 
; Ubuntu Server 12.04 amd64
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*precis*.udeb *precise1_amd64.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*precise*.deb *precise1_amd64.deb" ; rename broken udeb files    
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-raring\*precis*.udeb *precise1_amd64.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-raring\*precise*.deb *precise1_amd64.deb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*precis*.deb *precise1_amd64.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*precis*.udeb *precise1_amd64.udeb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\linux-headers-3.8.0-29_3.8.0-29.42~precise1_amd64.deb linux-headers-3.8.0-29_3.8.0-29.42~precise1_all.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\g\grub2-signed\grub-efi-amd64-signed_1.9~ubuntu12.04.4+1.99-21ubuntu3.10_amd.deb grub-efi-amd64-signed_1.9~ubuntu12.04.4+1.99-21ubuntu3.10_amd64.deb" ; rename broken udeb files   
  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*precis*.deb *precise1_amd64.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*precis*.udeb *precise1_amd64.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\linux-headers-3.5.0-23_3.5.0-23.35~precise1_amd64.deb linux-headers-3.5.0-23_3.5.0-23.35~precise1_all.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\g\grub2-signed\grub-efi-amd64-signed_1.9~ubuntu12.04.3+1.99-21ubuntu3.9_amd6.deb grub-efi-amd64-signed_1.9~ubuntu12.04.3+1.99-21ubuntu3.9_amd64.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\m\maas\python-maas-provisioningserver*.deb python-maas-provisioningserver_1.2+bzr1373+dfsg-0ubuntu1~12.04.1_all.deb" ; rename broken udeb files     

 ${ElseIf} $JustISO == "ubuntu-13.04-server-i386.iso"
 ${OrIf} $JustISO == "ubuntu-13.04.2-server-i386.iso"
 ${OrIf} $JustISO == "ubuntu-13.04.3-server-i386.iso" 
 ${OrIf} $JustISO == "ubuntu-13.04.4-server-i386.iso" 
  ReadEnvStr $R0 COMSPEC ; grab commandline
  nsExec::Exec "$R0 /C Rename $BootDir\multiboot\$JustISOName\pool\main\l\linux\*.ude *.udeb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*.ude *.udeb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*.ude *.udeb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*.ude *.udeb" ; rename broken udeb files 
; Ubuntu Server 12.04 i386
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*precis*.udeb *precise1_i386.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*precise*.deb *precise1_i386.deb" ; rename broken udeb files    
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*precis*.deb *precise1_i386.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*precis*.udeb *precise1_i386.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\linux-headers-3.5.0-23_3.5.0-23.35~precise1_i386.deb linux-headers-3.5.0-23_3.5.0-23.35~precise1_all.deb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*precis*.udeb *precise1_i386.udeb" ; rename broken udeb files    
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\m\maas\python-maas-provisioningserver*.deb python-maas-provisioningserver_1.2+bzr1373+dfsg-0ubuntu1~12.04.1_all.deb" ; rename broken udeb files     
  
 ${ElseIf} $JustISO == "ubuntu-13.04-server-i386.iso"
 ${OrIf} $JustISO == "ubuntu-13.04.2-server-i386.iso"
 ${OrIf} $JustISO == "ubuntu-13.04.3-server-i386.iso" 
 ${OrIf} $JustISO == "ubuntu-13.04.4-server-i386.iso" 
  ReadEnvStr $R0 COMSPEC ; grab commandline
  nsExec::Exec "$R0 /C Rename $BootDir\multiboot\$JustISOName\pool\main\l\linux\*.ude *.udeb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*.ude *.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-raring\*.ude *.udeb" ; rename broken udeb files     
  nsExec::Exec "$R0 /C Rename $BootDir\multiboot\$JustISOName\dists\precise\main\dist-upgrader\binary-amd64\*.ude *.udeb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*.ude *.udeb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*.ude *.udeb" ; rename broken udeb files 
; Ubuntu Server 12.04 amd64
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*precis*.udeb *precise1_amd64.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*precise*.deb *precise1_amd64.deb" ; rename broken udeb files    
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-raring\*precis*.udeb *precise1_amd64.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-raring\*precise*.deb *precise1_amd64.deb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*precis*.deb *precise1_amd64.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*precis*.udeb *precise1_amd64.udeb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\linux-headers-3.8.0-29_3.8.0-29.42~precise1_amd64.deb linux-headers-3.8.0-29_3.8.0-29.42~precise1_all.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\g\grub2-signed\grub-efi-amd64-signed_1.9~ubuntu12.04.4+1.99-21ubuntu3.10_amd.deb grub-efi-amd64-signed_1.9~ubuntu12.04.4+1.99-21ubuntu3.10_amd64.deb" ; rename broken udeb files   
  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*precis*.deb *precise1_amd64.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*precis*.udeb *precise1_amd64.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\linux-headers-3.5.0-23_3.5.0-23.35~precise1_amd64.deb linux-headers-3.5.0-23_3.5.0-23.35~precise1_all.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\g\grub2-signed\grub-efi-amd64-signed_1.9~ubuntu12.04.3+1.99-21ubuntu3.9_amd6.deb grub-efi-amd64-signed_1.9~ubuntu12.04.3+1.99-21ubuntu3.9_amd64.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\m\maas\python-maas-provisioningserver*.deb python-maas-provisioningserver_1.2+bzr1373+dfsg-0ubuntu1~12.04.1_all.deb" ; rename broken udeb files     

 ${ElseIf} $JustISO == "ubuntu-12.10-server-i386.iso"
  ReadEnvStr $R0 COMSPEC ; grab commandline
  nsExec::Exec "$R0 /C Rename $BootDir\multiboot\$JustISOName\pool\main\l\linux\*.ude *.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*.ude *.udeb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*.ude *.udeb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*.ude *.udeb" ; rename broken udeb files 
; Ubuntu Server 12.04 i386
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*precis*.udeb *precise1_i386.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*precise*.deb *precise1_i386.deb" ; rename broken udeb files    
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*precis*.deb *precise1_i386.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*precis*.udeb *precise1_i386.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\linux-headers-3.5.0-23_3.5.0-23.35~precise1_i386.deb linux-headers-3.5.0-23_3.5.0-23.35~precise1_all.deb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*precis*.udeb *precise1_i386.udeb" ; rename broken udeb files    
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\m\maas\python-maas-provisioningserver*.deb python-maas-provisioningserver_1.2+bzr1373+dfsg-0ubuntu1~12.04.1_all.deb" ; rename broken udeb files     
  
 ${ElseIf} $JustISO == "ubuntu-12.10-server-amd64.iso"
  ReadEnvStr $R0 COMSPEC ; grab commandline
  nsExec::Exec "$R0 /C Rename $BootDir\multiboot\$JustISOName\pool\main\l\linux\*.ude *.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*.ude *.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-raring\*.ude *.udeb" ; rename broken udeb files     
  nsExec::Exec "$R0 /C Rename $BootDir\multiboot\$JustISOName\dists\precise\main\dist-upgrader\binary-amd64\*.ude *.udeb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*.ude *.udeb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*.ude *.udeb" ; rename broken udeb files 
; Ubuntu Server 12.04 amd64
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*precis*.udeb *precise1_amd64.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*precise*.deb *precise1_amd64.deb" ; rename broken udeb files    
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-raring\*precis*.udeb *precise1_amd64.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-raring\*precise*.deb *precise1_amd64.deb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*precis*.deb *precise1_amd64.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*precis*.udeb *precise1_amd64.udeb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\linux-headers-3.8.0-29_3.8.0-29.42~precise1_amd64.deb linux-headers-3.8.0-29_3.8.0-29.42~precise1_all.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\g\grub2-signed\grub-efi-amd64-signed_1.9~ubuntu12.04.4+1.99-21ubuntu3.10_amd.deb grub-efi-amd64-signed_1.9~ubuntu12.04.4+1.99-21ubuntu3.10_amd64.deb" ; rename broken udeb files   
  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*precis*.deb *precise1_amd64.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*precis*.udeb *precise1_amd64.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\linux-headers-3.5.0-23_3.5.0-23.35~precise1_amd64.deb linux-headers-3.5.0-23_3.5.0-23.35~precise1_all.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\g\grub2-signed\grub-efi-amd64-signed_1.9~ubuntu12.04.3+1.99-21ubuntu3.9_amd6.deb grub-efi-amd64-signed_1.9~ubuntu12.04.3+1.99-21ubuntu3.9_amd64.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\m\maas\python-maas-provisioningserver*.deb python-maas-provisioningserver_1.2+bzr1373+dfsg-0ubuntu1~12.04.1_all.deb" ; rename broken udeb files      
  
 ${ElseIf} $JustISO == "ubuntu-12.04-server-i386.iso"
 ${OrIf} $JustISO == "ubuntu-12.04.2-server-i386.iso"
 ${OrIf} $JustISO == "ubuntu-12.04.3-server-i386.iso" 
 ${OrIf} $JustISO == "ubuntu-12.04.4-server-i386.iso" 
  ReadEnvStr $R0 COMSPEC ; grab commandline
  nsExec::Exec "$R0 /C Rename $BootDir\multiboot\$JustISOName\pool\main\l\linux\*.ude *.udeb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*.ude *.udeb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*.ude *.udeb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*.ude *.udeb" ; rename broken udeb files 
; Ubuntu Server 12.04 i386
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*precis*.udeb *precise1_i386.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*precise*.deb *precise1_i386.deb" ; rename broken udeb files    
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*precis*.deb *precise1_i386.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*precis*.udeb *precise1_i386.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\linux-headers-3.5.0-23_3.5.0-23.35~precise1_i386.deb linux-headers-3.5.0-23_3.5.0-23.35~precise1_all.deb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*precis*.udeb *precise1_i386.udeb" ; rename broken udeb files    
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\m\maas\python-maas-provisioningserver*.deb python-maas-provisioningserver_1.2+bzr1373+dfsg-0ubuntu1~12.04.1_all.deb" ; rename broken udeb files     
  
 ${ElseIf} $JustISO == "ubuntu-12.04-server-amd64.iso"
 ${OrIf} $JustISO == "ubuntu-12.04.2-server-amd64.iso"
 ${OrIf} $JustISO == "ubuntu-12.04.3-server-amd64.iso" 
 ${OrIf} $JustISO == "ubuntu-12.04.4-server-amd64.iso"
  ReadEnvStr $R0 COMSPEC ; grab commandline
  nsExec::Exec "$R0 /C Rename $BootDir\multiboot\$JustISOName\pool\main\l\linux\*.ude *.udeb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*.ude *.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-raring\*.ude *.udeb" ; rename broken udeb files     
  nsExec::Exec "$R0 /C Rename $BootDir\multiboot\$JustISOName\dists\precise\main\dist-upgrader\binary-amd64\*.ude *.udeb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*.ude *.udeb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*.ude *.udeb" ; rename broken udeb files 
; Ubuntu Server 12.04 amd64
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*precis*.udeb *precise1_amd64.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-quantal\*precise*.deb *precise1_amd64.deb" ; rename broken udeb files    
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-raring\*precis*.udeb *precise1_amd64.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-signed-lts-raring\*precise*.deb *precise1_amd64.deb" ; rename broken udeb files 
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*precis*.deb *precise1_amd64.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\*precis*.udeb *precise1_amd64.udeb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-raring\linux-headers-3.8.0-29_3.8.0-29.42~precise1_amd64.deb linux-headers-3.8.0-29_3.8.0-29.42~precise1_all.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\g\grub2-signed\grub-efi-amd64-signed_1.9~ubuntu12.04.4+1.99-21ubuntu3.10_amd.deb grub-efi-amd64-signed_1.9~ubuntu12.04.4+1.99-21ubuntu3.10_amd64.deb" ; rename broken udeb files   
  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*precis*.deb *precise1_amd64.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\*precis*.udeb *precise1_amd64.udeb" ; rename broken udeb files  
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\l\linux-lts-quantal\linux-headers-3.5.0-23_3.5.0-23.35~precise1_amd64.deb linux-headers-3.5.0-23_3.5.0-23.35~precise1_all.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\g\grub2-signed\grub-efi-amd64-signed_1.9~ubuntu12.04.3+1.99-21ubuntu3.9_amd6.deb grub-efi-amd64-signed_1.9~ubuntu12.04.3+1.99-21ubuntu3.9_amd64.deb" ; rename broken udeb files   
  nsExec::Exec "$R0 /C rename $BootDir\multiboot\$JustISOName\pool\main\m\maas\python-maas-provisioningserver*.deb python-maas-provisioningserver_1.2+bzr1373+dfsg-0ubuntu1~12.04.1_all.deb" ; rename broken udeb files     
   
; Parted Magic
 ${ElseIf} $DistroName == "Parted Magic (Partition Tools)" 
  !insertmacro ReplaceInFile "/boot/syslinux" "/multiboot/$JustISOName/boot/syslinux" "all" "all" "$BootDir\multiboot\$JustISOName\boot\syslinux\syslinux.cfg"  
  !insertmacro ReplaceInFile "/pmagic/bzImage" "/multiboot/$JustISOName/pmagic/bzImage" "all" "all" "$BootDir\multiboot\$JustISOName\boot\syslinux\syslinux.cfg"  
  !insertmacro ReplaceInFile "/pmagic/bzImage64" "/multiboot/$JustISOName/pmagic/bzImage64" "all" "all" "$BootDir\multiboot\$JustISOName\boot\syslinux\syslinux.cfg"  
  !insertmacro ReplaceInFile "/pmagic/initrd.img" "/multiboot/$JustISOName/pmagic/initrd.img" "all" "all" "$BootDir\multiboot\$JustISOName\boot\syslinux\syslinux.cfg"    
  !insertmacro ReplaceInFile "APPEND edd=" "APPEND directory=/multiboot/$JustISOName/ edd=" "all" "all" "$BootDir\multiboot\$JustISOName\boot\syslinux\syslinux.cfg"    
  !insertmacro ReplaceInFile "APPEND iso" "APPEND directory=/multiboot/$JustISOName/ iso" "all" "all" "$BootDir\multiboot\$JustISOName\boot\syslinux\syslinux.cfg"    
  !insertmacro ReplaceInFile "/boot/syslinux/reboot.c32" "/multiboot/$JustISOName/boot/syslinux/reboot.c32" "all" "all" "$BootDir\multiboot\$JustISOName\boot\syslinux\syslinux.cfg"    
  !insertmacro ReplaceInFile "/boot/ipxe/ipxe.krn" "/multiboot/$JustISOName/boot/ipxe/ipxe.krn" "all" "all" "$BootDir\multiboot\$JustISOName\boot\syslinux\syslinux.cfg"    
  !insertmacro ReplaceInFile "/boot/plpbt/plpbt.bin" "/multiboot/$JustISOName/boot/plpbt/plpbt.bin" "all" "all" "$BootDir\multiboot\$JustISOName\boot\syslinux\syslinux.cfg"    
  !insertmacro ReplaceInFile "INITRD /boot/" "INITRD /multiboot/$JustISOName/boot/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\syslinux\syslinux.cfg"    
  !insertmacro ReplaceInFile "LINUX /boot/" "LINUX /multiboot/$JustISOName/boot/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\syslinux\syslinux.cfg"    
  !insertmacro ReplaceInFile "COM32 /boot/" "COM32 /multiboot/$JustISOName/boot/" "all" "all" "$BootDir\multiboot\$JustISOName\boot\syslinux\syslinux.cfg"  

; System Rescue CD
 ${ElseIf} $DistroName == "System Rescue CD" 
  !insertmacro ReplaceInFile "INITRD initram.igz" "INITRD NULL initram.igz$\r$\nAPPEND subdir=multiboot/$JustISOName" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"    
  !insertmacro ReplaceInFile "INITRD NULL initram.igz" "INITRD initram.igz" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"   
  !insertmacro ReplaceInFile "APPEND docache" "APPEND subdir=multiboot/$JustISOName docache" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"   
  !insertmacro ReplaceInFile "APPEND nomodeset" "APPEND subdir=multiboot/$JustISOName nomodeset" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"   
  !insertmacro ReplaceInFile "APPEND video=800x600" "APPEND subdir=multiboot/$JustISOName video=800x600" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile" 
  !insertmacro ReplaceInFile "APPEND video=800x600" "APPEND subdir=multiboot/$JustISOName video=800x600" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile" 
  !insertmacro ReplaceInFile "APPEND root=auto" "APPEND subdir=multiboot/$JustISOName root=auto" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile" 
  !insertmacro ReplaceInFile "APPEND dostartx" "APPEND subdir=multiboot/$JustISOName dostartx" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile" 
  !insertmacro ReplaceInFile "kernel /bootdisk" "kernel /multiboot/$JustISOName/bootdisk" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile" 
  !insertmacro ReplaceInFile "kernel /ntpasswd" "kernel /multiboot/$JustISOName/ntpasswd" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"  
  !insertmacro ReplaceInFile "/ntpasswd/initrd.cgz,/ntpasswd/scsi.cgz" "/multiboot/$JustISOName/ntpasswd/initrd.cgz,/multiboot/$JustISOName/ntpasswd/scsi.cgz" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"  
  !insertmacro ReplaceInFile "initrd=/bootdisk" "initrd=/multiboot/$JustISOName/bootdisk" "all" "all" "$BootDir\multiboot\$JustISOName\$CopyPath\$ConfigFile"  
 
; Ophcrack
 ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\$CopyPath\ophcrack.cfg"  
  CopyFiles "$BootDir\multiboot\$JustISOName\tables\*.*" "$BootDir\tables\"
 ${EndIf} 
 
; OpenSuse/BlehOS  
   ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\i386\loader\isolinux.cfg"       
   !insertmacro ReplaceInFile "ui gfxboot" "#ui NULL gfxboot" "all" "all" "$BootDir\multiboot\$JustISOName\boot\i386\loader\isolinux.cfg"     
  ${EndIf}   
  
; For OpenSuSe like compilations!
 ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\grub\mbrid" 
  StrCpy $ConfigFile == "syslinux.cfg" ; Make sure it isn't NULL  
  StrCpy $SUSEDIR "$JustISOName" 
  Call MBRID  
 ${EndIf}   

; Enable Casper  
 ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\casper\filesystem.squashfs" ; Must be Ubuntu Based
  ${AndIf} $Persistence == "casper" ; Casper
  ${AndIf} $Casper != "0" ; Casper Slider (Size) was not Null
  ; Add Boot Code Persistent
  ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\txt.cfg" ; Rename the following for isolinux txt.cfg
  !insertmacro ReplaceInFile "cdrom-detect/try-usb=true noprompt" "cdrom-detect/try-usb=true persistent persistent-path=/multiboot/$JustISOName noprompt" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\txt.cfg"  
  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\text.cfg" ; Rename the following for isolinux text.cfg
  !insertmacro ReplaceInFile "cdrom-detect/try-usb=true noprompt" "cdrom-detect/try-usb=true persistent persistent-path=/multiboot/$JustISOName noprompt" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\text.cfg"  
  ${ElseIf} ${FileExists} "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg" ; Rename the following for isolinux.cfg
  !insertmacro ReplaceInFile "cdrom-detect/try-usb=true noprompt" "cdrom-detect/try-usb=true persistent persistent-path=/multiboot/$JustISOName noprompt" "all" "all" "$BootDir\multiboot\$JustISOName\isolinux\isolinux.cfg"    
  ${EndIf}
  ${If} ${FileExists} "$BootDir\multiboot\$JustISOName\boot\grub\loopback.cfg" ; Rename the following for grub loopback.cfg
  !insertmacro ReplaceInFile "cdrom-detect/try-usb=true noprompt" "cdrom-detect/try-usb=true persistent persistent-path=/multiboot/$JustISOName noprompt" "all" "all" "$BootDir\multiboot\$JustISOName\boot\grub\loopback.cfg"  
  ${EndIf} 
  ; Create Casper-rw file
   Call CasperScript  
 ${EndIf}
 
Call WriteStuff

!macroend