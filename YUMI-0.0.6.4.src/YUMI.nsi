; YUMI (Your Universal Multiboot Installer) Copyright ©2012 Lance http://www.pendrivelinux.com (See YUMI-Copying.txt and YUMI-Readme.txt for more information, Credits, and Licensing)
; 7-Zip Copyright ©1991-2012 Igor Pavlovis http://7-zip.org (unmodified binaries were used)
; Syslinux ©1994-2012 H. Peter Anvin http://syslinux.zytor.com (unmodified binary used)
; grub.exe Grub4DOS © the Gna! people http://www.gnu.org/software/grub (unmodified binary used) : Official Grub4DOS link: http://gna.org/projects/grub4dos/
; Fat32format.exe © Tom Thornhill Ridgecorp Consultants http://www.ridgecrop.demon.co.uk (unmodified binary used)
; NSIS Installer ©1995-2012 Contributors http://nsis.sourceforge.net - Install NSIS to compile this script. http://nsis.sourceforge.net/Download

!define NAME "YUMI"
!define FILENAME "YUMI"
!define VERSION "0.0.6.4"
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\nsis1-install.ico"

; MoreInfo Plugin - Adds Version Tab fields to Properties. Plugin created by onad http://nsis.sourceforge.net/MoreInfo_plug-in
VIProductVersion "${VERSION}"
VIAddVersionKey CompanyName "pendrivelinux.com"
VIAddVersionKey LegalCopyright "Copyright ©2010-2012 Lance Pendrivelinux.com"
VIAddVersionKey FileVersion "${VERSION}"
VIAddVersionKey FileDescription "Automated Universal MultiBoot UFD Creation Tool"
VIAddVersionKey License "GPL Version 2"

Name "${NAME} ${VERSION}"
OutFile "${FILENAME}-${VERSION}.exe"
RequestExecutionLevel admin ;highest
SetCompressor LZMA
CRCCheck On
XPStyle on
ShowInstDetails show
BrandingText "${NAME} ${VERSION}"
CompletedText "All Finished, Process is Complete!"
InstallButtonText "Create"

!include WordFunc.nsh
!include nsDialogs.nsh
!include MUI2.nsh
!include FileFunc.nsh
!include LogicLib.nsh
;!include TextFunc.nsh
!AddPluginDir "plugins"

; Variables
Var FileFormat
Var Format 
Var FormatMe
Var BlockSize
Var Dialog
Var LabelDrivePage
Var Distro
Var DistroName
Var ISOFileName
Var DestDriveTxt
Var DestDrive
Var BootDir
Var LinuxDistroSelection
Var LabelISOSelection
Var ISOFileTxt
Var TheISO
Var IsoFile
Var ISOSelection
Var ISOTest
Var SizeOfDistro
Var DestDisk
Var DownloadISO
Var DownloadMe
Var Link
Var Links
Var Auth
Var DownLink
Var LocalSelection
Var PathName
Var Letters
Var Config2Use
Var SomeFileExt
Var SomeFile2Check
Var AllDriveOption
Var DisplayAll
Var DistroLink
Var Homepage
Var OfficialSite
Var OfficialName
Var NameThatISO
Var OnlyVal
Var Uninstaller
Var Removal
Var InUnStall
Var SUSEDIR

!include DiskVoodoo.nsh ; DiskVoodoo Script created by Lance http://www.pendrivelinux.com

; Interface settings
!define MUI_FINISHPAGE_NOAUTOCLOSE
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "usb-logo-nsis.bmp" 
!define MUI_HEADERIMAGE_BITMAP_NOSTRETCH
!define MUI_HEADERIMAGE_RIGHT

; License Agreement Page
!define MUI_TEXT_LICENSE_SUBTITLE $(License_Subtitle)
!define MUI_LICENSEPAGE_TEXT_TOP $(License_Text_Top)
!define MUI_LICENSEPAGE_TEXT_BOTTOM $(License_Text_Bottom)
!define MUI_PAGE_CUSTOMFUNCTION_PRE License_PreFunction
!insertmacro MUI_PAGE_LICENSE "YUMI-Copying.txt"

; Distro Selection Page
Page custom SelectionsPage

; Install Files Page
!define MUI_INSTFILESPAGE_COLORS "00FF00 000000" ;Green and Black
!define MUI_INSTFILESPAGE_FINISHHEADER_TEXT $(Finish_Install)
!define MUI_TEXT_INSTALLING_TITLE $(Install_Title)
!define MUI_TEXT_INSTALLING_SUBTITLE $(Install_SubTitle)
!define MUI_TEXT_FINISH_SUBTITLE $(Install_Finish_Sucess)
!define MUI_PAGE_CUSTOMFUNCTION_PRE InstFiles_PreFunction
!insertmacro MUI_PAGE_INSTFILES

; Finish page
!define MUI_FINISHPAGE_TITLE $(Finish_Title)
!define MUI_FINISHPAGE_TEXT $(Finish_Text)
!define MUI_FINISHPAGE_LINK $(Finish_Link)
!define MUI_FINISHPAGE_LINK_LOCATION "http://www.pendrivelinux.com/boot-multiple-iso-from-usb-multiboot-usb/"
!define MUI_WELCOMEFINISHPAGE_BITMAP "finish.bmp"
!define MUI_PAGE_CUSTOMFUNCTION_PRE Finish_PreFunction
!insertmacro MUI_PAGE_FINISH

; English Language files
!insertmacro MUI_LANGUAGE "English" ; first language is the default language
LangString License_Subtitle ${LANG_ENGLISH} "Please review the license terms before proceeding"
LangString License_Text_Top ${LANG_ENGLISH} "The software within this program falls under the following Licenses."
LangString License_Text_Bottom ${LANG_ENGLISH} "You must accept the terms of this License agreement to run this ${NAME}. If you agree, Click I Agree to Continue."
LangString SelectDist_Title ${LANG_ENGLISH} "Drive Selection and Distro Options Page"
LangString SelectDist_Subtitle ${LANG_ENGLISH} "Choose your Flash Drive, and a Distro, ISO/ZIP file.$\r$\nAdditional Distributions can be added each time this tool is run."
LangString DrivePage_Text ${LANG_ENGLISH} "Step 1: Select the drive letter of your USB device."
LangString Distro_Text ${LANG_ENGLISH} "Step 2: Select a Distribution from the following Box to put on your USB."
LangString IsoPage_Text ${LANG_ENGLISH} "Step 3: Select the $FileFormat (Name must be the same as above)."
LangString IsoPage_Title ${LANG_ENGLISH} "Select Your $FileFormat"
LangString IsoFile ${LANG_ENGLISH} "$FileFormat file|$ISOFileName" ;$ISOFileName variable previously *.iso
LangString Extract ${LANG_ENGLISH} "Extracting the $FileFormat: The progress bar will not move until finished. Please be patient..."
LangString CreateSysConfig ${LANG_ENGLISH} "Creating configuration files for $DestDrive"
LangString ExecuteSyslinux ${LANG_ENGLISH} "Executing syslinux on $BootDir"
LangString SkipSyslinux ${LANG_ENGLISH} "Good Syslinux Exists..."
LangString WarningSyslinux ${LANG_ENGLISH} "An error ($R8) occurred while executing syslinux.$\r$\nYour USB drive won't be bootable..."
LangString Install_Title ${LANG_ENGLISH} "$InUnStall $ISOFileName"
LangString Install_SubTitle ${LANG_ENGLISH} "Please wait while we $InUnStall $DistroName on $Letters"
LangString Install_Finish_Sucess ${LANG_ENGLISH} "${NAME} sucessfully $InUnStalled $DistroName on $Letters"
LangString Finish_Install ${LANG_ENGLISH} "$InUnStallation is Complete."
LangString Finish_Title ${LANG_ENGLISH} "${NAME} has completed the $InUnStallation."
LangString Finish_Text ${LANG_ENGLISH} "Your Selections have been $InUnStalled on your USB drive.$\r$\n$\r$\nFeel Free to run this tool again to $InUnStall more Distros.$\r$\n$\r$\nYUMI will keep track of selections you have already $InUnStalled."
LangString Finish_Link ${LANG_ENGLISH} "Visit the YUMI Tutorial Page"

; WriteToFile Function originally written by Afrow UK http://nsis.sourceforge.net/Simple_write_text_to_file, modified by Lance to populate .cfg file with what the user chose!
Function WriteToFile
 Exch $R0 ;file to write to
 Exch
 Exch $1 ;text to write
 FileOpen $R0 '$BootDir\multiboot\menu\$Config2Use' a 
 FileSeek $R0 0 END
 FileWrite $R0 '$\r$\n$1$\r$\n'
 FileClose $R0
 Pop $1
 Pop $R0
FunctionEnd
!macro WriteToFile String File
 Push "${String}"
 Push "${File}"
 Call WriteToFile
!macroend  
!define WriteToFile "!insertmacro WriteToFile"

Function WriteToSysFile
 Exch $R0 ;file to write to
 Exch
 Exch $1 ;text to write
 FileOpen $R0 '$BootDir\multiboot\syslinux.cfg' a 
 FileSeek $R0 0 END
 FileWrite $R0 '$\r$\n$1$\r$\n'
 FileClose $R0
 Pop $1
 Pop $R0
FunctionEnd
!macro WriteToSysFile String File
 Push "${String}"
 Push "${File}"
 Call WriteToSysFile
!macroend  
!define WriteToSysFile "!insertmacro WriteToSysFile"

!include FileNames.nsh
Function SomeFiles ; Distro2Check (Name of the Distro), ISO2Check (file to check for on the drive)
    !insertmacro FileNames "--- Debian Live 32/64 Bit ---" " "
	!insertmacro FileNames " " " "
 !insertmacro FileNames "Debian Live 6.0.4 Gnome 32bit" multiboot\debian\live\vmlinuz 
 !insertmacro FileNames "Debian Live 6.0.4 KDE 32bit" multiboot\debiankde\live\vmlinuz 
 !insertmacro FileNames "Debian Live 6.0.4 LXDE 32bit" multiboot\debianlxde\live\vmlinuz 
 !insertmacro FileNames "Debian Live 6.0.4 XFCE 32bit" multiboot\debianxfce\live\vmlinuz 
 !insertmacro FileNames "Debian Live 6.0.4 Gnome 64bit" multiboot\debian64\live\vmlinuz 
 !insertmacro FileNames "Debian Live 6.0.4 KDE 64bit" multiboot\debiankde64\live\vmlinuz 
 !insertmacro FileNames "Debian Live 6.0.4 LXDE 64bit" multiboot\debianlxde64\live\vmlinuz 
 !insertmacro FileNames "Debian Live 6.0.4 XFCE 64bit" multiboot\debianxfce64\live\vmlinuz  
; !insertmacro FileNames "Debian Net Installer 6.0.4 32bit" multiboot\debianinst\install.386\vmlinuz  
 
	!insertmacro FileNames " " " " 
    !insertmacro FileNames "--- Fedora 32/64 Bit ---" " "
	!insertmacro FileNames " " " "
	
 !insertmacro FileNames "Fedora 17 GNOME 32bit" multiboot\fedora17\isolinux\vmlinuz0 
 !insertmacro FileNames "Fedora 17 KDE 32bit" multiboot\fedoraKDE17\isolinux\vmlinuz0
 !insertmacro FileNames "Fedora 17 LXDE 32bit" multiboot\fedoraLXDE17\isolinux\vmlinuz0 
 !insertmacro FileNames "Fedora 17 XFCE 32bit" multiboot\fedoraXFCE17\isolinux\vmlinuz0 
 !insertmacro FileNames "Fedora 17 GNOME 64bit" multiboot\fedora6417\isolinux\vmlinuz0 
 !insertmacro FileNames "Fedora 17 KDE 64bit" multiboot\fedoraKDE6417\isolinux\vmlinuz0    
 !insertmacro FileNames "Fedora 17 LXDE 64bit" multiboot\fedoraLXDE6417\isolinux\vmlinuz0
 !insertmacro FileNames "Fedora 17 XFCE 64bit" multiboot\fedoraXFCE6417\isolinux\vmlinuz0  
 
 !insertmacro FileNames "Fedora 16 GNOME 32bit" multiboot\fedora16\isolinux\vmlinuz0 
 !insertmacro FileNames "Fedora 16 KDE 32bit" multiboot\fedoraKDE16\isolinux\vmlinuz0
 !insertmacro FileNames "Fedora 16 LXDE 32bit" multiboot\fedoraLXDE16\isolinux\vmlinuz0 
 !insertmacro FileNames "Fedora 16 XFCE 32bit" multiboot\fedoraXFCE16\isolinux\vmlinuz0 
 !insertmacro FileNames "Fedora 16 GNOME 64bit" multiboot\fedora6416\isolinux\vmlinuz0 
 !insertmacro FileNames "Fedora 16 KDE 64bit" multiboot\fedoraKDE6416\isolinux\vmlinuz0    
 !insertmacro FileNames "Fedora 16 LXDE 64bit" multiboot\fedoraLXDE6416\isolinux\vmlinuz0
 !insertmacro FileNames "Fedora 16 XFCE 64bit" multiboot\fedoraXFCE6416\isolinux\vmlinuz0  
 
 !insertmacro FileNames "Fedora 15 GNOME 32bit" multiboot\fedora\isolinux\vmlinuz0 
 !insertmacro FileNames "Fedora 15 KDE 32bit" multiboot\fedoraKDE\isolinux\vmlinuz0
 !insertmacro FileNames "Fedora 15 LXDE 32bit" multiboot\fedoraLXDE\isolinux\vmlinuz0 
 !insertmacro FileNames "Fedora 15 XFCE 32bit" multiboot\fedoraXFCE\isolinux\vmlinuz0 
 !insertmacro FileNames "Fedora 15 GNOME 64bit" multiboot\fedora64\isolinux\vmlinuz0 
 !insertmacro FileNames "Fedora 15 KDE 64bit" multiboot\fedoraKDE64\isolinux\vmlinuz0    
 !insertmacro FileNames "Fedora 15 LXDE 64bit" multiboot\fedoraLXDE64\isolinux\vmlinuz0
 !insertmacro FileNames "Fedora 15 XFCE 64bit" multiboot\fedoraXFCE64\isolinux\vmlinuz0  
 
    !insertmacro FileNames " " " "
    !insertmacro FileNames "--- Linux Mint 32/64 Bit ---" " "
	!insertmacro FileNames " " " "  
 !insertmacro FileNames "Linux Mint 13 Mate 32bit" multiboot\mintmate1332\casper\vmlinuz  
 !insertmacro FileNames "Linux Mint 13 Mate 64bit" multiboot\mintmate1364\casper\vmlinuz 	
 !insertmacro FileNames "Linux Mint 13 Cinnamon 32bit" multiboot\mintcin1332\casper\vmlinuz  
 !insertmacro FileNames "Linux Mint 13 Cinnamon 64bit" multiboot\mintcin1364\casper\vmlinuz 
 !insertmacro FileNames "Linux Mint 12 Gnome 32bit" multiboot\mint1232\casper\vmlinuz  
 !insertmacro FileNames "Linux Mint 12 Gnome 64bit" multiboot\mint1264\casper\vmlinuz   
 !insertmacro FileNames "Linux Mint 12 KDE 32bit" multiboot\mint1232KDE\casper\vmlinuz  
 !insertmacro FileNames "Linux Mint 12 KDE 64bit" multiboot\mint1264KDE\casper\vmlinuz 
 !insertmacro FileNames "Linux Mint 12 LXDE 32bit" multiboot\mint1232LXDE\casper\vmlinuz  
 !insertmacro FileNames "LMDE 201204 Mate/Cinnamon 32bit" multiboot\mintdeb\casper\vmlinuz  
 !insertmacro FileNames "LMDE 201204 Mate/Cinnamon 64bit" multiboot\mintdeb64\casper\vmlinuz   
 !insertmacro FileNames "LMDE 201204 XFCE 32bit" multiboot\mintxfce\casper\vmlinuz  
 !insertmacro FileNames "LMDE 201204 XFCE 64bit" multiboot\mintxfce64\casper\vmlinuz    
 !insertmacro FileNames "Linux Mint 11 32bit" multiboot\mint1132\casper\vmlinuz  
 !insertmacro FileNames "Linux Mint 11 64bit" multiboot\mint1164\casper\vmlinuz 
 ; !insertmacro FileNames "Linux Mint 10" multiboot\mint\casper\vmlinuz  

    !insertmacro FileNames " " " "
    !insertmacro FileNames "--- OpenSUSE Live 32/64 Bit ---" " " 
	!insertmacro FileNames " " " "

 !insertmacro FileNames "OpenSUSE 12.1 GNOME i686" multiboot\opensuse12\boot\syslinux\initrd
 !insertmacro FileNames "OpenSUSE 12.1 GNOME x64" multiboot\opensuse6412\boot\syslinux\initrd 
 !insertmacro FileNames "OpenSUSE 12.1 KDE i686" multiboot\opensuseKDE12\boot\syslinux\initrd 
 !insertmacro FileNames "OpenSUSE 12.1 KDE x64" multiboot\opensuseKDE6412\boot\syslinux\initrd  
 
 !insertmacro FileNames "OpenSUSE 11.4 GNOME i686" multiboot\opensuse\openSUSE-gnome-11.4-livecd-gnome-read-only.i686-2.8.0	
 !insertmacro FileNames "OpenSUSE 11.4 GNOME x64" multiboot\opensuse64\boot\syslinux\initrd 
 !insertmacro FileNames "OpenSUSE 11.4 KDE i686" multiboot\opensuseKDE\boot\syslinux\initrd 
 !insertmacro FileNames "OpenSUSE 11.4 KDE x64" multiboot\opensuseKDE64\boot\syslinux\initrd  
 
   !insertmacro FileNames " " " "
   !insertmacro FileNames "--- Ubuntu 32/64 Bit ---" " "
   !insertmacro FileNames " " " "
   
 !insertmacro FileNames "Ubuntu 12.04" multiboot\ubuntu1204\casper\vmlinuz 
 !insertmacro FileNames "Ubuntu 12.04 DVD" multiboot\ubuntu1204dvd\casper\vmlinuz   
 !insertmacro FileNames "Edubuntu 12.04" multiboot\edubuntu1204\casper\vmlinuz  
 !insertmacro FileNames "Kubuntu 12.04" multiboot\kubuntu1204\casper\vmlinuz 
 !insertmacro FileNames "Kubuntu 12.04 DVD" multiboot\kubuntu1204dvd\casper\vmlinuz 
 !insertmacro FileNames "Lubuntu 12.04" multiboot\lubuntu1204\casper\vmlinuz 
 !insertmacro FileNames "Xubuntu 12.04" multiboot\xubuntu1204\casper\vmlinuz
 !insertmacro FileNames "Mythbuntu 12.04" multiboot\mythbuntu1204\casper\vmlinuz
 !insertmacro FileNames "Ubuntu Server 12.04" multiboot\ubuntuserv1204\install\vmlinuz 
 !insertmacro FileNames "Ubuntu Studio 12.04" multiboot\ubuntustud1204\casper\vmlinuz  
 !insertmacro FileNames "Ubuntu 12.04 amd64" multiboot\ubuntu120464\casper\vmlinuz   
 !insertmacro FileNames "Ubuntu 12.04 DVD amd64" multiboot\ubuntu1204dvd64\casper\vmlinuz  
 !insertmacro FileNames "Edubuntu 12.04 amd64" multiboot\edubuntu120464\casper\vmlinuz   
 !insertmacro FileNames "Kubuntu 12.04 amd64" multiboot\kubuntu120464\casper\vmlinuz
 !insertmacro FileNames "Kubuntu 12.04 DVD amd64" multiboot\kubuntu1204dvd64\casper\vmlinuz 
 !insertmacro FileNames "Lubuntu 12.04 amd64" multiboot\lubuntu120464\casper\vmlinuz 
 !insertmacro FileNames "Xubuntu 12.04 amd64" multiboot\xubuntu120464\casper\vmlinuz  
 !insertmacro FileNames "Mythbuntu 12.04 amd64" multiboot\mythbuntu120464\casper\vmlinuz  
 !insertmacro FileNames "Ubuntu Server 12.04 amd64" multiboot\ubuntuserv120464\install\vmlinuz
 !insertmacro FileNames "Ubuntu Studio 12.04 amd64" multiboot\ubuntustud120464\casper\vmlinuz   
 
 !insertmacro FileNames "Ubuntu 11.10" multiboot\ubuntu1110\casper\vmlinuz 
 !insertmacro FileNames "Edubuntu 11.10" multiboot\edubuntu1110\casper\vmlinuz 
 !insertmacro FileNames "Kubuntu 11.10" multiboot\kubuntu1110\casper\vmlinuz 
 !insertmacro FileNames "Lubuntu 11.10" multiboot\lubuntu1110\casper\vmlinuz 
 !insertmacro FileNames "Xubuntu 11.10" multiboot\xubuntu1110\casper\vmlinuz 
 !insertmacro FileNames "Ubuntu Server 11.10" multiboot\ubuntuserv1110\install\vmlinuz  
 
 !insertmacro FileNames "Ubuntu 11.10 amd64" multiboot\ubuntu111064\casper\vmlinuz 
 !insertmacro FileNames "Kubuntu 11.10 amd64" multiboot\kubuntu111064\casper\vmlinuz 
 !insertmacro FileNames "Lubuntu 11.10 amd64" multiboot\lubuntu111064\casper\vmlinuz 
 !insertmacro FileNames "Xubuntu 11.10 amd64" multiboot\xubuntu111064\casper\vmlinuz   
   
 !insertmacro FileNames "Ubuntu 11.04" multiboot\ubuntu1104\casper\vmlinuz 
 !insertmacro FileNames "Edubuntu 11.04" multiboot\edubuntu1104\casper\vmlinuz 
 !insertmacro FileNames "Kubuntu 11.04" multiboot\kubuntu1104\casper\vmlinuz 
 !insertmacro FileNames "Lubuntu 11.04" multiboot\lubuntu1104\casper\vmlinuz 
 !insertmacro FileNames "Xubuntu 11.04" multiboot\xubuntu1104\casper\vmlinuz 

 !insertmacro FileNames "Ubuntu 11.04 x64" multiboot\ubuntu1104x64\casper\vmlinuz  
 !insertmacro FileNames "Kubuntu 11.04 x64" multiboot\kubuntu1104x64\casper\vmlinuz 
 !insertmacro FileNames "Xubuntu 11.04 x64" multiboot\xubuntu1104x64\casper\vmlinuz
 
 !insertmacro FileNames "Ubuntu 10.10" multiboot\ubuntu\casper\vmlinuz 
 !insertmacro FileNames "Edubuntu 10.10" multiboot\edubuntu\casper\vmlinuz  
 !insertmacro FileNames "Kubuntu 10.10" multiboot\kubuntu\casper\vmlinuz 
 !insertmacro FileNames "Lubuntu 10.10" multiboot\lubuntu\casper\vmlinuz
 !insertmacro FileNames "Xubuntu 10.10" multiboot\xubuntu\casper\vmlinuz  
 
 !insertmacro FileNames "Ubuntu 10.04" multiboot\ubuntu1004\casper\vmlinuz  
 !insertmacro FileNames "Kubuntu 10.04" multiboot\kubuntu1004\casper\vmlinuz 
 !insertmacro FileNames "Xubuntu 10.04" multiboot\xubuntu1004\casper\vmlinuz  
 !insertmacro FileNames "Ubuntu 10.04 x64" multiboot\ubuntu1004x64\casper\vmlinuz  
 !insertmacro FileNames "Kubuntu 10.04 x64" multiboot\kubuntu1004x64\casper\vmlinuz 
 !insertmacro FileNames "Xubuntu 10.04 x64" multiboot\xubuntu1004x64\casper\vmlinuz  
; REVISIT !insertmacro FileNames "Ubuntu Rescue Remix (System Rescue)" multiboot\URR\casper\vmlinuz 
	
    !insertmacro FileNames " " " "
    !insertmacro FileNames "--- Other Distros Alphabetical ---" " "
	!insertmacro FileNames " " " "
	
 !insertmacro FileNames "Archlinux" multiboot\archlinux\arch\boot\i686\archiso.img	
 !insertmacro FileNames "Bodhi" multiboot\bodhi\casper\vmlinuz	
 !insertmacro FileNames "CAELinux (Computer Aided Engineering)" multiboot\caelinux\casper\vmlinuz	 
 !insertmacro FileNames "CentOS" multiboot\centos\LiveOS\squashfs.img 
 !insertmacro FileNames "CentOS 64bit" multiboot\centos64\LiveOS\squashfs.img   
 !insertmacro FileNames "Crunchbang 10" multiboot\crunchbang\live\vmlinuz1    
 !insertmacro FileNames "Damn Small Linux (DSL)" multiboot\dsl\boot\isolinux\linux24 
; !insertmacro FileNames "Dreamlinux" multiboot\dreamlinux\boot\vmlinuz 
; REVISIT !insertmacro FileNames "Dreamlinux" multiboot\dreamlinux\boot\vmlinuz  
 !insertmacro FileNames "Fuduntu" multiboot\fuduntu\isolinux\vmlinuz0
 !insertmacro FileNames "gpxe (Net Bootable Distros)" multiboot\gpxe.lkrn
 !insertmacro FileNames "KNOPPIX 6.7.1 CD" multiboot\knoppix6\KNOPPIX  
 !insertmacro FileNames "KNOPPIX 7 DVD" multiboot\knoppix\KNOPPIX  
 !insertmacro FileNames "Mandriva 2011" multiboot\mandriva\LiveOS\squashfs.img 
 !insertmacro FileNames "Netrunner" multiboot\netrunner\casper\vmlinuz 
 !insertmacro FileNames "OSGeo Live" multiboot\osgeo\casper\vmlinuz 
; REVISIT NOT READY !insertmacro FileNames "MultiCore" multiboot\multicore\boot\microcore.gz 
 !insertmacro FileNames "PCLinuxOS" multiboot\pclos\isolinux\vmlinuz 
 !insertmacro FileNames "Peppermint One" multiboot\pmint\casper\vmlinuz  
 !insertmacro FileNames "Peppermint Two" multiboot\pmint2\casper\vmlinuz  
 !insertmacro FileNames "Pear Linux" multiboot\pear\casper\vmlinuz  
 !insertmacro FileNames "Pinguy OS 11" multiboot\pinguy\casper\vmlinuz 
 !insertmacro FileNames "Porteus" multiboot\porteus\boot\vmlinuz 
 !insertmacro FileNames "Puppy Linux (Another Tiny Distro)" multiboot\puppy\vmlinuz 
 !insertmacro FileNames "Racy Puppy Linux" multiboot\racypuppy\vmlinuz 
 !insertmacro FileNames "Slacko Puppy 5.3" multiboot\slacko53\vmlinuz  
 !insertmacro FileNames "Wary Puppy Linux" multiboot\warypuppy\vmlinuz 
; !insertmacro FileNames "Fatdog64 (64bit Puppy Linux)" multiboot\fatdog64\vmlinuz 
; !insertmacro FileNames "Samurai-WTF" multiboot\samurai\casper\vmlinuz  
 !insertmacro FileNames "SalineOS" multiboot\saline\live\vmlinuz  
 !insertmacro FileNames "Semplice Linux" multiboot\semplice\live\vmlinuz  
 !insertmacro FileNames "SLAX (Tiny Slackware Based Distro)" multiboot\Slax612\boot\vmlinuz    
 !insertmacro FileNames "Slitaz (Another Tiny Distro)" multiboot\slitaz\boot\rootfs1.gz
 !insertmacro FileNames "Sn0wL1nuX 11" multiboot\snowlinux\casper\vmlinuz
 !insertmacro FileNames "Sn0wL1nuX 11 64bit" multiboot\snowlinux64\casper\vmlinuz
 !insertmacro FileNames "Sugar on a Stick" multiboot\sos\isolinux\vmlinuz0 
 !insertmacro FileNames "System Rescue CD" multiboot\systemrescuecd\isolinux\rescuecd 
 !insertmacro FileNames "Tails (Anonymous Browsing)" multiboot\tails\live\vmlinuz 
 !insertmacro FileNames "Liberte (Anonymous Browsing)" multiboot\liberte\liberte\boot\syslinux\syslinux.cfg  
 !insertmacro FileNames "Terralinux" multiboot\terralinux\casper\vmlinuz  
 !insertmacro FileNames "TinyCore (A Tiny Linux Distribution)" multiboot\tinycore\boot\core.gz
 !insertmacro FileNames "Ultimate Edition 3" multiboot\ultimateed\casper\vmlinuz
 !insertmacro FileNames "WifiWay 3.4" multiboot\wifiway34\boot\vmlinuz  
 !insertmacro FileNames "WifiWay 2" multiboot\wifiway\boot\vmlinuz 
 !insertmacro FileNames "XBMC" multiboot\xbmc\live\vmlinuz  
 !insertmacro FileNames "XBMCbuntu" multiboot\xbmcbuntu\casper\vmlinuz   
 !insertmacro FileNames "YlmF OS (Looks like Windows)" multiboot\YLMF\casper\vmlinuz 
 !insertmacro FileNames "Zorin OS" multiboot\zorin\casper\vmlinuz  
  
   !insertmacro FileNames " "  " " 
   !insertmacro FileNames "------------ NetBook Distributions ------------"  " "	
   !insertmacro FileNames " "  " "   
   
 !insertmacro FileNames "EasyPeasy (NetBook Distro)" multiboot\easypeasy\casper\vmlinuz 	
; REVISIT !insertmacro FileNames "EEEBuntu (NetBook Distro)" multiboot\eeebuntu\casper\vmlinuz 	
 !insertmacro FileNames "Jolicloud (NetBook Distro)" multiboot\jolicloud\casper\vmlinuz 
 !insertmacro FileNames "Ubuntu Netbook Remix 10.10" multiboot\netbookubuntu\casper\vmlinuz 	
 !insertmacro FileNames "xPUD (Netbook Distro)" multiboot\xpud\boot\xpud
 
   !insertmacro FileNames " "  " " 
   !insertmacro FileNames "--------------- Antivirus Tools ---------------"  " " 
   !insertmacro FileNames " "  " "   
   
 !insertmacro FileNames "Acronis Antimalware CD" multiboot\acronis\casper\vmlinuz   
 !insertmacro FileNames "AVG Rescue CD (Antivirus Scanner)" multiboot\avg\isolinux\vmlinuz
 !insertmacro FileNames "AVIRA AntiVir Rescue CD (Virus Scanner)" antivir\vmlinuz ; Antivir, Avupdate, and system folder stored at root of USB! To be Fixed
 !insertmacro FileNames "Bitdefender Rescue Disk (Antivirus Scanner)" multiboot\bitdefender\casper\vmlinuz
 !insertmacro FileNames "Dr.Web Live CD" boot\module\drweb_bases.dwm
 !insertmacro FileNames "F-Secure Rescue CD" multiboot\fsecure\boot\isolinux\linux
; needs work !insertmacro FileNames "G DATA (Virus Scanner)" multiboot\gdata\boot\linux26
 !insertmacro FileNames "Kaspersky Rescue Disk (Antivirus Scanner)" multiboot\kav\boot\rescue.igz ; rescue folder is stored at root of USB! To be Fixed
 !insertmacro FileNames "Panda SafeCD" multiboot\panda\live\vmlinuz1 
 
   !insertmacro FileNames " "  " " 	
   !insertmacro FileNames "----------------- System Tools ----------------"  " " 
   !insertmacro FileNames " "  " "    

 !insertmacro FileNames "BackBox (Penetration Testing)" multiboot\backbox\casper\vmlinuz       
 !insertmacro FileNames "BackTrack5 (Penetration Testing)" multiboot\backtrack5\casper\vmlinuz  
 !insertmacro FileNames "Clonezilla (Backup + Clone Tool)" multiboot\clonezilla\live\initrd.img  
; OLD VERSION !insertmacro FileNames "DBAN (Hard Drive Nuker)" multiboot\ISOS\dban-1.0.7_i386.iso 
 !insertmacro FileNames "DBAN (Hard Drive Nuker)" multiboot\DBAN\DBAN.BZI
 !insertmacro FileNames "Deft 7 (Forensics)" multiboot\deft\casper\vmlinuz 
 !insertmacro FileNames "DRBL (Diskless Remote Boot in Linux)" multiboot\DRBL\live\vmlinuz 
 !insertmacro FileNames "EASEUS Disk Copy (Disk Cloning Tool)" multiboot\diskcopy\initrd.img  
 !insertmacro FileNames "FreeDOS (Balder img)" multiboot\balder10.img 
 !insertmacro FileNames "GParted (Partition Tools)" multiboot\gparted\live\vmlinuz 
 !insertmacro FileNames "HDT (Hardware Detection Tool)" multiboot\hdt.img
 !insertmacro FileNames "Memtest86+ (Memory Testing Tool)" multiboot\memtest.bin 
 !insertmacro FileNames "Matriux (Penetration Testing)" multiboot\matriux\live\vmlinuz
 !insertmacro FileNames "Offline NT Password & Registy Editor" multiboot\offnt\initrd.cgz  
 !insertmacro FileNames "Ophcrack (no tables)" multiboot\ophcracknt\boot\rootfs.gz  
 !insertmacro FileNames "Ophcrack XP (Password Finder)" multiboot\ophcrack\boot\rootfs.gz 
 !insertmacro FileNames "Ophcrack Vista/7 (Password Finder)" multiboot\ophcrackvista\boot\rootfs.gz  
 !insertmacro FileNames "Parted Magic (Partition Tools)" multiboot\partedmagic\pmagic\bzImage
 !insertmacro FileNames "PING (Partimg Is Not Ghost)" multiboot\PING\initrd.gz  
 !insertmacro FileNames "Partition Wizard (Partition Tools)" multiboot\pwiz\BOOT\tinycore.gz 
 !insertmacro FileNames "Rescatux" multiboot\rescatux\live\vmlinuz 
 !insertmacro FileNames "Redo Backup And Recovery (Recovery Tools)" multiboot\redobackup\casper\vmlinuz
 !insertmacro FileNames "Rip Linux (Recovery Distro)" multiboot\rip\boot\rootfs.cgz 
 !insertmacro FileNames "Trinity Rescue Kit" TRK\initrd.trk ; does install to root of drive 
 !insertmacro FileNames "Ultimate Boot CD (Diagnostics Tools)" multiboot\ISOS\ubcd.iso 
 !insertmacro FileNames "Web Converger (Web Kiosk)" multiboot\webcon\live\vmlinuz 
 
   !insertmacro FileNames " "  " " 	
   !insertmacro FileNames "----------------- Other OS/Tools ----------------"  " " 
   !insertmacro FileNames " "  " "  
   
 !insertmacro FileNames "Linux Live Tools for OCZ" multiboot\ocz\boot\vmlinuz   
 !insertmacro FileNames "HP SmartStart 8.60 x32" multiboot\HP\ss860_x32\system\initrd.img
 !insertmacro FileNames "HP SmartStart 8.70 x32" multiboot\HP\ss870_x32\system\initrd.img    
 !insertmacro FileNames "HP SmartStart 8.60 x64" multiboot\HP\ss860_x64\system\initrd.img
 !insertmacro FileNames "HP SmartStart 8.70 x64" multiboot\HP\ss870_x64\system\initrd.img 
 !insertmacro FileNames "HP Firmware Maintenance 8.70 (CD)" multiboot\HP\fwcd\system\initrd.img 
 !insertmacro FileNames "HP Automatic Firmware Update 9.30 (DVD)" multiboot\HP\fwdvd\system\initrd.img

 !insertmacro FileNames "Hiren's Boot CD" HBCD\menu.lst  ; does install to root of drive
 !insertmacro FileNames "Kon-Boot Floppy Image" multiboot\konboot.img
 !insertmacro FileNames "Windows Vista/7/8 Installer" bootmgr  ; does install to root of drive
 
   !insertmacro FileNames " "  " " 	
   !insertmacro FileNames "----------------- Bootable ISOs ----------------"  " " 
   !insertmacro FileNames " "  " "   
   
 !insertmacro FileNames "Try an Unlisted ISO" multiboot\ISOS\TEST1.iso 
 !insertmacro FileNames "Try an Unlisted ISO (Run from RAM)" multiboot\ISOS\TEST2.iso  

; ##################################### ADD NEW DISTRO ########################################
FunctionEnd

Function SetISOFileName ; Distro2Check (Name of the Distro), ISO2Check2 (The ISO File name before extraction), Download2Get (Download Link), Path2Name (Final destination/Name of File), GimmeSize (Size of the File), Config2Use (Config File to Write To), File2Check (file to check for before adding Menu entry), Homepage, OfficialName
 !insertmacro SetISOFileNames "Archlinux" archlinux-2011.08.19-core-dual.iso "http://mirrors.us.kernel.org/archlinux/iso/2011.08.19/archlinux-2011.08.19-core-dual.iso" archlinux-2011.08.19-core-dual.iso "673" linux.cfg multiboot\archlinux\arch\boot\i686\archiso.img "http://www.archlinux.org" "Archlinux"  
 !insertmacro SetISOFileNames "Bodhi" bodhi*.iso "http://sourceforge.net/projects/bodhilinux/files/latest/download" bodhi.iso "380" linux.cfg multiboot\bodhi\casper\vmlinuz "http://www.bodhilinux.com" "Bodhi"  
 !insertmacro SetISOFileNames "Dr.Web Live CD" drweb-livecd*.iso "http://download.geo.drweb.com/pub/drweb/livecd/drweb-livecd-600.iso" drweb.iso "176" antivirus.cfg boot\vmlinuz "http://www.freedrweb.com/livecd/" "Dr.Web"  
 !insertmacro SetISOFileNames "CAELinux (Computer Aided Engineering)" caelinux*.iso "ftp://cae-linux:salome@caelinux.dyndns.org/distrib/caelinux2011/caelinux2011.iso" CAE.iso "4094" linux.cfg multiboot\caelinux\casper\vmlinuz "http://caelinux.com" "CAELinux"  
 !insertmacro SetISOFileNames "Rescatux" rescatux_cdrom_usb_hybrid*.iso "http://sourceforge.net/projects/rescatux.berlios/files/rescatux_cdrom_usb_hybrid_i386_486-amd64_0.30b4_sg2d.iso/download" rescatux.iso "305" system.cfg multiboot\rescatux\live\vmlinuz "http://www.supergrubdisk.org/rescatux/" "Rescatux" 
 !insertmacro SetISOFileNames "CentOS" CentOS-6*.iso "http://mirrors.kernel.org/centos/6/isos/i386/CentOS-6.2-i386-LiveCD.iso" CentOS-6-LiveCD.iso "685" linux.cfg multiboot\centos\LiveOS\squashfs.img "http://www.centos.org" "CentOS"
 !insertmacro SetISOFileNames "CentOS 64bit" CentOS-6*64-Live*.iso "http://mirrors.kernel.org/centos/6/isos/x86_64/CentOS-6.2-x86_64-LiveCD.iso" CentOS-6_64-Live.iso "690" linux.cfg multiboot\centos64\LiveOS\squashfs.img "http://www.centos.org" "CentOS"
 !insertmacro SetISOFileNames "gpxe (Net Bootable Distros)" *gpxe.lkrn "http://rom-o-matic.net/gpxe/gpxe-git/gpxe.git/contrib/rom-o-matic/" multiboot\gpxe.lkrn "2" linux.cfg multiboot\gpxe.lkrn "http://etherboot.org" "GPXE"
 !insertmacro SetISOFileNames "Crunchbang 10" crunchbang-10*.iso "http://crunchbanglinux.org/downloads/" crunchbang-10.iso "691" linux.cfg multiboot\crunchbang\live\vmlinuz1 "http://crunchbanglinux.org" "Crunchbang"
 !insertmacro SetISOFileNames "FreeDOS (Balder img)" balder10.img "http://www.finnix.org/files/balder10.img" multiboot\balder10.img "2" system.cfg multiboot\balder10.img "http://www.finnix.org/Balder" "Finnix Balder"
 !insertmacro SetISOFileNames "Fedora 15 GNOME 32bit" Fedora-15-i686-Live-Desktop.iso "http://download.fedoraproject.org/pub/fedora/linux/releases/15/Live/i686/Fedora-15-i686-Live-Desktop.iso" Fedora-15-i686-Live-Desktop.iso "570" linux.cfg multiboot\fedora\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora"
 !insertmacro SetISOFileNames "Fedora 15 GNOME 64bit" Fedora-15-x86_64-Live-Desktop.iso "http://download.fedoraproject.org/pub/fedora/linux/releases/15/Live/x86_64/Fedora-15-x86_64-Live-Desktop.iso" Fedora-15-x86_64-Live-Desktop.iso "568" linux.cfg multiboot\fedora64\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora" 
 !insertmacro SetISOFileNames "Fedora 15 KDE 32bit" Fedora-15-i686-Live-KDE.iso "http://download.fedoraproject.org/pub/fedora/linux/releases/15/Live/i686/Fedora-15-i686-Live-KDE.iso" Fedora-15-i686-Live-KDE.iso "693" linux.cfg multiboot\fedoraKDE\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora" 
 !insertmacro SetISOFileNames "Fedora 15 KDE 64bit" Fedora-15-x86_64-Live-KDE.iso "http://download.fedoraproject.org/pub/fedora/linux/releases/15/Live/x86_64/Fedora-15-x86_64-Live-KDE.iso" Fedora-15-x86_64-Live-KDE.iso "693" linux.cfg multiboot\fedoraKDE64\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora" 
 !insertmacro SetISOFileNames "Fedora 15 LXDE 32bit" Fedora-15-i686-Live-LXDE.iso "http://download.fedoraproject.org/pub/alt/spins/linux/releases/15/Spins/i686/Fedora-15-i686-Live-LXDE.iso" Fedora-15-i686-Live-LXDE.iso "493" linux.cfg multiboot\fedoraLXDE\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora" 
 !insertmacro SetISOFileNames "Fedora 15 XFCE 32bit" Fedora-15-i686-Live-XFCE.iso "http://download.fedoraproject.org/pub/alt/spins/linux/releases/15/Spins/i686/Fedora-15-i686-Live-XFCE.iso" Fedora-15-i686-Live-XFCE.iso "590" linux.cfg multiboot\fedoraXFCE\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora" 
 !insertmacro SetISOFileNames "Fedora 15 LXDE 64bit" Fedora-15-x86_64-Live-LXDE.iso "http://download.fedoraproject.org/pub/alt/spins/linux/releases/15/Spins/x86_64/Fedora-15-x86_64-Live-LXDE.iso" Fedora-15-x86_64-Live-LXDE.iso "493" linux.cfg multiboot\fedoraLXDE64\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora" 
 !insertmacro SetISOFileNames "Fedora 15 XFCE 64bit" Fedora-15-x86_64-Live-XFCE.iso "http://download.fedoraproject.org/pub/alt/spins/linux/releases/15/Spins/x86_64/Fedora-15-x86_64-Live-XFCE.iso" Fedora-15-x86_64-Live-XFCE.iso "584" linux.cfg multiboot\fedoraXFCE64\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora" 
 
 !insertmacro SetISOFileNames "Fedora 16 GNOME 32bit" Fedora-16-i686-Live-Desktop.iso "http://download.fedoraproject.org/pub/fedora/linux/releases/16/Live/i686/Fedora-16-i686-Live-Desktop.iso" Fedora-16-i686-Live-Desktop.iso "605" linux.cfg multiboot\fedora16\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora"
 !insertmacro SetISOFileNames "Fedora 16 GNOME 64bit" Fedora-16-x86_64-Live-Desktop.iso "http://download.fedoraproject.org/pub/fedora/linux/releases/16/Live/x86_64/Fedora-16-x86_64-Live-Desktop.iso" Fedora-16-x86_64-Live-Desktop.iso "604" linux.cfg multiboot\fedora6416\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora" 
 !insertmacro SetISOFileNames "Fedora 16 KDE 32bit" Fedora-16-i686-Live-KDE.iso "http://download.fedoraproject.org/pub/fedora/linux/releases/16/Live/i686/Fedora-16-i686-Live-KDE.iso" Fedora-16-i686-Live-KDE.iso "697" linux.cfg multiboot\fedoraKDE16\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora" 
 !insertmacro SetISOFileNames "Fedora 16 KDE 64bit" Fedora-16-x86_64-Live-KDE.iso "http://download.fedoraproject.org/pub/fedora/linux/releases/16/Live/x86_64/Fedora-16-x86_64-Live-KDE.iso" Fedora-16-x86_64-Live-KDE.iso "697" linux.cfg multiboot\fedoraKDE6416\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora" 
 !insertmacro SetISOFileNames "Fedora 16 LXDE 32bit" Fedora-16-i686-Live-LXDE.iso "http://download.fedoraproject.org/pub/alt/spins/linux/releases/16/Spins/i686/Fedora-16-i686-Live-LXDE.iso" Fedora-16-i686-Live-LXDE.iso "542" linux.cfg multiboot\fedoraLXDE16\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora" 
 !insertmacro SetISOFileNames "Fedora 16 XFCE 32bit" Fedora-16-i686-Live-XFCE.iso "http://download.fedoraproject.org/pub/alt/spins/linux/releases/16/Spins/i686/Fedora-16-i686-Live-XFCE.iso" Fedora-16-i686-Live-XFCE.iso "624" linux.cfg multiboot\fedoraXFCE16\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora" 
 !insertmacro SetISOFileNames "Fedora 16 LXDE 64bit" Fedora-16-x86_64-Live-LXDE.iso "http://download.fedoraproject.org/pub/alt/spins/linux/releases/16/Spins/x86_64/Fedora-16-x86_64-Live-LXDE.iso" Fedora-16-x86_64-Live-LXDE.iso "541" linux.cfg multiboot\fedoraLXDE6416\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora" 
 !insertmacro SetISOFileNames "Fedora 16 XFCE 64bit" Fedora-16-x86_64-Live-XFCE.iso "http://download.fedoraproject.org/pub/alt/spins/linux/releases/16/Spins/x86_64/Fedora-16-x86_64-Live-XFCE.iso" Fedora-16-x86_64-Live-XFCE.iso "627" linux.cfg multiboot\fedoraXFCE6416\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora"  

 !insertmacro SetISOFileNames "Fedora 17 GNOME 32bit" Fedora-17-i686-Live-Desktop.iso "http://download.fedoraproject.org/pub/fedora/linux/releases/17/Live/i686/Fedora-17-i686-Live-Desktop.iso" Fedora-17-i686-Live-Desktop.iso "646" linux.cfg multiboot\fedora17\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora"
 !insertmacro SetISOFileNames "Fedora 17 GNOME 64bit" Fedora-17-x86_64-Live-Desktop.iso "http://download.fedoraproject.org/pub/fedora/linux/releases/17/Live/x86_64/Fedora-17-x86_64-Live-Desktop.iso" Fedora-17-x86_64-Live-Desktop.iso "645" linux.cfg multiboot\fedora6417\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora" 
 !insertmacro SetISOFileNames "Fedora 17 KDE 32bit" Fedora-17-i686-Live-KDE.iso "http://download.fedoraproject.org/pub/fedora/linux/releases/17/Live/i686/Fedora-17-i686-Live-KDE.iso" Fedora-17-i686-Live-KDE.iso "695" linux.cfg multiboot\fedoraKDE17\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora" 
 !insertmacro SetISOFileNames "Fedora 17 KDE 64bit" Fedora-17-x86_64-Live-KDE.iso "http://download.fedoraproject.org/pub/fedora/linux/releases/17/Live/x86_64/Fedora-17-x86_64-Live-KDE.iso" Fedora-17-x86_64-Live-KDE.iso "697" linux.cfg multiboot\fedoraKDE6417\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora" 
 !insertmacro SetISOFileNames "Fedora 17 LXDE 32bit" Fedora-17-i686-Live-LXDE.iso "http://download.fedoraproject.org/pub/alt/releases/17/Spins/i686/Fedora-17-i686-Live-LXDE.iso" Fedora-17-i686-Live-LXDE.iso "542" linux.cfg multiboot\fedoraLXDE17\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora" 
 !insertmacro SetISOFileNames "Fedora 17 XFCE 32bit" Fedora-17-i686-Live-XFCE.iso "http://download.fedoraproject.org/pub/alt/releases/17/Spins/i686/Fedora-17-i686-Live-XFCE.iso" Fedora-17-i686-Live-XFCE.iso "624" linux.cfg multiboot\fedoraXFCE17\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora" 
 !insertmacro SetISOFileNames "Fedora 17 LXDE 64bit" Fedora-17-x86_64-Live-LXDE.iso "http://download.fedoraproject.org/pub/alt/releases/17/Spins/x86_64/Fedora-17-x86_64-Live-LXDE.iso" Fedora-17-x86_64-Live-LXDE.iso "590" linux.cfg multiboot\fedoraLXDE6417\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora" 
 !insertmacro SetISOFileNames "Fedora 17 XFCE 64bit" Fedora-17-x86_64-Live-XFCE.iso "http://download.fedoraproject.org/pub/alt/releases/17/Spins/x86_64/Fedora-17-x86_64-Live-XFCE.iso" Fedora-17-x86_64-Live-XFCE.iso "670" linux.cfg multiboot\fedoraXFCE6417\isolinux\vmlinuz0 "http://fedoraproject.org" "Fedora"   
 
 !insertmacro SetISOFileNames "Pinguy OS 11" Pinguy_OS_11.04*i686.iso "http://sourceforge.net/projects/pinguy-os/files/Pinguy_OS_11.04/Pinguy_OS_11.04.1_i686.iso/download" Pinguy_OS_11.04_i686.iso "1610" linux.cfg multiboot\pinguy\casper\vmlinuz "http://pinguy-os.sourceforge.net" "Pinguy" 
 !insertmacro SetISOFileNames "Sn0wL1nuX 11" Sn0wL1nuX-11-Desktop-i386.iso "http://sourceforge.net/projects/sn0wl1nux/files/11/Sn0wL1nuX-11-Desktop-i386.iso/download" Sn0wL1nuX-11-Desktop-i386.iso "1008" linux.cfg multiboot\snowlinux\casper\vmlinuz "http://sn0wl1nux.forumdoandroid.com" "Sn0wL1nuX" 
 !insertmacro SetISOFileNames "Sn0wL1nuX 11 64bit" Sn0wL1nuX-11-Desktop-amd64.iso "http://sourceforge.net/projects/sn0wl1nux/files/11/Sn0wL1nuX-11-Desktop-amd64.iso/download" Sn0wL1nuX-11-Desktop-amd64.iso "1300" linux.cfg multiboot\snowlinux64\casper\vmlinuz "http://sn0wl1nux.forumdoandroid.com" "Sn0wL1nuX" 
 !insertmacro SetISOFileNames "Semplice Linux" semplice_2.0.2_203.0.iso "http://semplice-linux.org/download/" semplice.iso "610" linux.cfg multiboot\semplice\live\vmlinuz "http://semplice-linux.org" "Semplice Linux" 
 
 !insertmacro SetISOFileNames "Debian Live 6.0.4 Gnome 32bit" debian-live-6.0.4-i386-gnome-desktop.iso "http://cdimage.debian.org/cdimage/release/current-live/i386/iso-hybrid/debian-live-6.0.4-i386-gnome-desktop.iso" debian-live-6-gnome.iso "1141" linux.cfg multiboot\debian\live\vmlinuz "http://live.debian.net" "Debian Live"
 !insertmacro SetISOFileNames "Debian Live 6.0.4 KDE 32bit" debian-live-6.0.4-i386-kde-desktop.iso "http://cdimage.debian.org/cdimage/release/current-live/i386/iso-hybrid/debian-live-6.0.4-i386-kde-desktop.iso" debian-live-6-kde.iso "1000" linux.cfg multiboot\debiankde\live\vmlinuz "http://live.debian.net" "Debian Live"
 !insertmacro SetISOFileNames "Debian Live 6.0.4 LXDE 32bit" debian-live-6.0.4-i386-lxde-desktop.iso "http://cdimage.debian.org/cdimage/release/current-live/i386/iso-hybrid/debian-live-6.0.4-i386-lxde-desktop.iso" debian-live-6-lxde.iso "752" linux.cfg multiboot\debianlxde\live\vmlinuz "http://live.debian.net" "Debian Live"
 !insertmacro SetISOFileNames "Debian Live 6.0.4 XFCE 32bit" debian-live-6.0.4-i386-xfce-desktop.iso "http://cdimage.debian.org/cdimage/release/current-live/i386/iso-hybrid/debian-live-6.0.4-i386-xfce-desktop.iso" debian-live-6-xfce.iso "809" linux.cfg multiboot\debianxfce\live\vmlinuz "http://live.debian.net" "Debian Live"
 !insertmacro SetISOFileNames "Debian Live 6.0.4 Gnome 64bit" debian-live-6.0.4-amd64-gnome-desktop.iso "http://cdimage.debian.org/cdimage/release/current-live/amd64/iso-hybrid/debian-live-6.0.4-amd64-gnome-desktop.iso" debian-live-664-gnome.iso "1173" linux.cfg multiboot\debian64\live\vmlinuz "http://live.debian.net" "Debian Live"
 !insertmacro SetISOFileNames "Debian Live 6.0.4 KDE 64bit" debian-live-6.0.4-amd64-kde-desktop.iso "http://cdimage.debian.org/cdimage/release/current-live/amd64/iso-hybrid/debian-live-6.0.4-amd64-kde-desktop.iso" debian-live-664-kde.iso "1091" linux.cfg multiboot\debiankde64\live\vmlinuz "http://live.debian.net" "Debian Live"
 !insertmacro SetISOFileNames "Debian Live 6.0.4 LXDE 64bit" debian-live-6.0.4-amd64-lxde-desktop.iso "http://cdimage.debian.org/cdimage/release/current-live/amd64/iso-hybrid/debian-live-6.0.4-amd64-lxde-desktop.iso" debian-live-664-lxde.iso "789" linux.cfg multiboot\debianlxde64\live\vmlinuz "http://live.debian.net" "Debian Live"
 !insertmacro SetISOFileNames "Debian Live 6.0.4 XFCE 64bit" debian-live-6.0.4-amd64-xfce-desktop.iso "http://cdimage.debian.org/cdimage/release/current-live/amd64/iso-hybrid/debian-live-6.0.4-amd64-xfce-desktop.iso" debian-live-664-xfce.iso "809" linux.cfg multiboot\debianxfce64\live\vmlinuz "http://live.debian.net" "Debian Live"
 !insertmacro SetISOFileNames "Debian Net Installer 6.0.4 32bit" debian-6.0.4-i386-netinst.iso "http://cdimage.debian.org/debian-cd/6.0.4/i386/iso-cd/debian-6.0.4-i386-netinst.iso" debianinst.iso "191" linux.cfg multiboot\debianinst\install.386\vmlinuz "http://www.debian.org/releases/squeeze/debian-installer/" "Debian"
 !insertmacro SetISOFileNames "Web Converger (Web Kiosk)" webc*.iso "http://dl.webconverger.com/latest.iso" Webc.iso "426" linux.cfg multiboot\webcon\live\vmlinuz "http://webconverger.com/" "Web Converger"

 !insertmacro SetISOFileNames "Tails (Anonymous Browsing)" tails*.iso "https://archive.torproject.org/amnesia.boum.org/tails/stable/tails-i386-0.12/tails-i386-0.12.iso" tails.iso "764" linux.cfg multiboot\tails\live\vmlinuz "http://amnesia.boum.org" "Tails"
 !insertmacro SetISOFileNames "Offline NT Password & Registy Editor" cd110511.zip "http://pogostick.net/~pnh/ntpasswd/cd110511.zip" cd110511.zip "8" system.cfg multiboot\offnt\initrd.cgz "http://www.pogostick.net/~pnh/ntpasswd/" "Offline NT"
 !insertmacro SetISOFileNames "TinyCore (A Tiny Linux Distribution)" tinycore-current.iso "http://distro.ibiblio.org/tinycorelinux/4.x/x86/release/TinyCore-current.iso" TinyCore-current.iso "10" linux.cfg multiboot\tinycore\boot\core.gz "http://www.tinycorelinux.com" "TinyCore"
 !insertmacro SetISOFileNames "MultiCore" multicore-current.iso "http://distro.ibiblio.org/pub/linux/distributions/tinycorelinux/3.x/release/multicore-current.iso" multicore-current.iso "46" linux.cfg multiboot\multicore\boot\microcore.gz "http://www.tinycorelinux.com" "MultiCore"

 !insertmacro SetISOFileNames "Slitaz (Another Tiny Distro)" slitaz-4.0.iso "http://distro.ibiblio.org/slitaz/iso/4.0/slitaz-4.0.iso" slitaz.iso "36" linux.cfg multiboot\slitaz\boot\rootfs1.gz "http://www.slitaz.org" "SliTaZ"
 !insertmacro SetISOFileNames "Puppy Linux (Another Tiny Distro)" lupu-5*.iso "http://distro.ibiblio.org/pub/linux/distributions/puppylinux/puppy-5.2.8/lupu-528.iso" lupu.iso "129" linux.cfg multiboot\puppy\vmlinuz "http://www.puppylinux.org" "Puppy Linux"
 !insertmacro SetISOFileNames "Fatdog64 (64bit Puppy Linux)" Fatdog64*.iso "http://distro.ibiblio.org/pub/linux/distributions/fatdog/iso/Fatdog64-521.iso" Fatdog64.iso "195" linux.cfg multiboot\fatdog64\vmlinuz "http://www.puppylinuxforum.org/thread-180.html" "Fatdog64"
 !insertmacro SetISOFileNames "Racy Puppy Linux" racy-5*.iso "http://distro.ibiblio.org/quirky/racy-5.2.2/racy-5.2.2.iso" racy.iso "112" linux.cfg multiboot\racypuppy\vmlinuz "http://puppylinux.org/main/New%20Racy%20Puppy.htm" "Racy Puppy Linux" 
 !insertmacro SetISOFileNames "Slacko Puppy 5.3" slacko*.iso "http://ftp.nluug.nl/ftp/pub/os/Linux/distr/puppylinux/puppy-5.3.1/slacko-5.3.1-SCSI-MAIN.iso" slacko.iso "126" linux.cfg multiboot\slacko53\vmlinuz "http://puppylinux.org/wikka/Puppy53" "Slacko Puppy 5.3" 
 !insertmacro SetISOFileNames "Wary Puppy Linux" wary-5*.iso "http://distro.ibiblio.org/quirky/wary-5.1.3/wary-5.1.3.iso" wary.iso "119" linux.cfg multiboot\warypuppy\vmlinuz "http://puppylinux.org/main/Long-Term-Supported%20WaryPuppy.htm" "Wary Puppy Linux"

 !insertmacro SetISOFileNames "Damn Small Linux (DSL)" dsl-4.4.10-initrd.iso "ftp://distro.ibiblio.org/pub/linux/distributions/damnsmall/current/dsl-4.4.10-initrd.iso" dsl-4.4.10-initrd.iso "51" linux.cfg multiboot\dsl\boot\isolinux\linux24 "http://www.damnsmalllinux.org" "DSL"
 !insertmacro SetISOFileNames "PING (Partimg Is Not Ghost)" PING*.iso "http://ping.windowsdream.com/ping/Releases/3.00.04/PING-3.00.iso" PING.iso "26" system.cfg multiboot\PING\initrd.gz "http://ping.windowsdream.com" "PING"

 !insertmacro SetISOFileNames "HP SmartStart 8.60 x32" smartstart-8.60-0-x86.zip "http://h18004.www1.hp.com/products/servers/management/core-management-100.html" smartstart-8.60x86.zip "609" other.cfg multiboot\HP\ss860_x32\system\initrd.img "http://h18004.www1.hp.com/products/servers/management/core-management-100.html" "HP Tools"
 !insertmacro SetISOFileNames "HP SmartStart 8.70 x32" smartstart-8.70*-0-x86.zip "http://h18004.www1.hp.com/products/servers/management/core-management-100.html" smartstart-8.70x86.zip "632" other.cfg multiboot\HP\ss870_x32\system\initrd.img "http://h18004.www1.hp.com/products/servers/management/core-management-100.html" "HP Tools" 
 !insertmacro SetISOFileNames "HP SmartStart 8.60 x64" smartstart-8.60-0*x64.zip "http://h18004.www1.hp.com/products/servers/management/core-management-100.html" smartstart-8.60.zip "609" other.cfg multiboot\HP\ss860_x64\system\initrd.img "http://h18004.www1.hp.com/products/servers/management/core-management-100.html" "HP Tools"
 !insertmacro SetISOFileNames "HP SmartStart 8.70 x64" smartstart-8.70*x64.zip "http://h18004.www1.hp.com/products/servers/management/core-management-100.html" smartstart-8.70.zip "632" other.cfg multiboot\HP\ss870_x64\system\initrd.img "http://h18004.www1.hp.com/products/servers/management/core-management-100.html" "HP Tools"
 !insertmacro SetISOFileNames "HP Firmware Maintenance 8.70 (CD)" firmware-8.70*.zip "http://h18004.www1.hp.com/products/servers/management/core-management-100.html" firmware-8.70.zip "486" other.cfg multiboot\HP\fwcd\system\initrd.img "http://h18004.www1.hp.com/products/servers/management/core-management-100.html" "HP Tools"
 !insertmacro SetISOFileNames "HP Automatic Firmware Update 9.30 (DVD)" firmware-9.30*.zip "http://h18004.www1.hp.com/products/servers/management/core-management-100.html" firmware-9.30.zip "1100" other.cfg multiboot\HP\fwdvd\system\initrd.img "http://h18004.www1.hp.com/products/servers/management/core-management-100.html" "HP Tools"

 !insertmacro SetISOFileNames "Sugar on a Stick" Fedora-14-i686-Live-SoaS.iso "http://download.fedoraproject.org/pub/alt/spins/linux/releases/14/Spins/i686/Fedora-14-i686-Live-SoaS.iso" Fedora-14-i686-Live-SoaS.iso "477" linux.cfg multiboot\sos\isolinux\vmlinuz0 "http://wiki.sugarlabs.org/go/Sugar_on_a_Stick" "Sugar On A Stick"
 !insertmacro SetISOFileNames "Rip Linux (Recovery Distro)" RIPLinuX*.iso "http://www.tux.org/pub/people/kent-robotti/looplinux/rip/" RIPLinuX.iso "110" system.cfg multiboot\rip\boot\rootfs.cgz "http://www.tux.org/pub/people/kent-robotti/looplinux/rip/" "RIP Linux"
 !insertmacro SetISOFileNames "KNOPPIX 6.7.1 CD" KNOPPIX_V6.7.1CD-*.iso "ftp://mirrors.kernel.org/knoppix-dvd/CD/KNOPPIX_V6.7.1CD-2011-09-14-EN.iso" KNOPPIX_V6.7.1CD.iso "700" linux.cfg multiboot\knoppix6\KNOPPIX "http://knopper.net" "KNOPPIX"
 !insertmacro SetISOFileNames "KNOPPIX 7 DVD" KNOPPIX_V7.0*.iso "http://ftp.knoppix.nl/os/Linux/distr/knoppix/DVD/KNOPPIX_V7.0.2DVD-2012-05-30-EN.iso" KNOPPIX_V7.iso "4084" linux.cfg multiboot\knoppix\KNOPPIX "http://knopper.net" "KNOPPIX"
 !insertmacro SetISOFileNames "Ultimate Boot CD (Diagnostics Tools)" ubcd5*.iso "http://lug.mtu.edu/ubcd/ubcd511.iso" multiboot\ISOS\ubcd.iso "360" system.cfg multiboot\ISOS\ubcd.iso "http://www.ultimatebootcd.com" "Ultimate Boot CD"
 !insertmacro SetISOFileNames "Ophcrack (no tables)" ophcrack-notables-livecd-3.4.0.iso "http://sourceforge.net/projects/ophcrack/files/ophcrack-livecd/3.4.0/ophcrack-notables-livecd-3.4.0.iso/download" ophcrack-notables-livecd-3.4.0.iso "47" system.cfg multiboot\ophcracknt\boot\rootfs.gz "http://ophcrack.sourceforge.net" "Ophcrack"
 !insertmacro SetISOFileNames "Ophcrack XP (Password Finder)" ophcrack-xp-livecd-3.4.0.iso "http://downloads.sourceforge.net/ophcrack/ophcrack-xp-livecd-3.4.0.iso" ophcrack-xp-livecd-3.4.0.iso "425" system.cfg multiboot\ophcrack\boot\rootfs.gz "http://ophcrack.sourceforge.net" "Ophcrack"
 !insertmacro SetISOFileNames "Ophcrack Vista/7 (Password Finder)" ophcrack-vista-livecd-3.4.0.iso "http://downloads.sourceforge.net/ophcrack/ophcrack-vista-livecd-3.4.0.iso" ophcrack-vista-livecd-3.4.0.iso "506" system.cfg multiboot\ophcrackvista\boot\rootfs.gz "http://ophcrack.sourceforge.net" "Ophcrack" 
 !insertmacro SetISOFileNames "YlmF OS (Looks like Windows)" Ylmf_OS_3.0.iso "http://down.ylmf.org/Ylmf_OS_3.0.iso" Ylmf_OS_3.0.iso "678" linux.cfg multiboot\YLMF\casper\vmlinuz "http://www.ylmf.org" "YLMF"
; !insertmacro SetISOFileNames "Ubuntu Rescue Remix (System Rescue)" ubuntu-rescue-remix-10-04.iso "http://ubuntu-rescue-remix.org/files/URR/iso/ubuntu-rescue-remix-10-04.iso" ubuntu-rescue-remix-10-04.iso "171" system.cfg multiboot\URR\casper\vmlinuz "http://ubuntu-rescue-remix.org" "URR"
 !insertmacro SetISOFileNames "Deft 7 (Forensics)" deft*7.1.iso "ftp://ftp.cc.uoc.gr/mirrors/linux/deftlinux/deft7.1.iso" deft7.1.iso "2432" system.cfg multiboot\deft\casper\vmlinuz "http://www.deftlinux.net/" "Deft"
 !insertmacro SetISOFileNames "Matriux (Penetration Testing)" Matriux-Krypton*.iso "http://sourceforge.net/projects/matriux/files/matriux-krypton-v1-2/Matriux-Krypton-v1.2.iso/download" Matriux.iso "2217" system.cfg multiboot\matriux\live\vmlinuz "http://www.matriux.com" "Matriux"
 !insertmacro SetISOFileNames "Pear Linux" comice_os*.iso "http://sourceforge.net/projects/pearoslinux/files/latest/download" comice_os.iso "1122" linux.cfg multiboot\pear\casper\vmlinuz "http://pear-os-linux.fr/" "Pear Linux"
 !insertmacro SetISOFileNames "Liberte (Anonymous Browsing)" liberte-2012.2.zip "http://sourceforge.net/projects/liberte/files/2012.2/liberte-2012.2.zip/download" Liberte.zip "219" linux.cfg multiboot\liberte\liberte\boot\syslinux\isolinux.cfg "http://dee.su/liberte" "Liberte"

 !insertmacro SetISOFileNames "Fuduntu" Fuduntu-2012.1-i686-LiveDVD.iso "http://sourceforge.net/projects/fuduntu/files/latest/download" fuduntu.iso "894" linux.cfg multiboot\fuduntu\isolinux\vmlinuz0 "http://www.fuduntu.org/" "Fuduntu"

 !insertmacro SetISOFileNames "Ubuntu 12.04" ubuntu-12.04-desktop-i386.iso "http://releases.ubuntu.com/precise/ubuntu-12.04-desktop-i386.iso" ubuntu-12.04-desktop-i386.iso "701" linux.cfg multiboot\ubuntu1204\casper\vmlinuz "http://ubuntu.com" "Ubuntu"
 !insertmacro SetISOFileNames "Ubuntu 12.04 DVD" ubuntu-12.04-dvd-i386.iso "http://cdimage.ubuntu.com/releases/precise/release/ubuntu-12.04-dvd-i386.iso" ubuntu-12.04-dvd-i386.iso "1500" linux.cfg multiboot\ubuntu1204dvd\casper\vmlinuz "http://ubuntu.com" "Ubuntu"
 !insertmacro SetISOFileNames "Ubuntu 12.04 DVD amd64" ubuntu-12.04-dvd-amd64.iso "http://cdimage.ubuntu.com/releases/precise/release/ubuntu-12.04-dvd-amd64.iso" ubuntu-12.04-dvd-amd64.iso "1500" linux.cfg multiboot\ubuntu1204dvd64\casper\vmlinuz "http://ubuntu.com" "Ubuntu"

 !insertmacro SetISOFileNames "Xubuntu 12.04" xubuntu-12.04-desktop-i386.iso "http://cdimage.ubuntu.com/xubuntu/releases/12.04/release/xubuntu-12.04-desktop-i386.iso" xubuntu-12.04-desktop-i386.iso "680" linux.cfg multiboot\xubuntu1204\casper\vmlinuz "http://xubuntu.org" "Xubuntu"
 !insertmacro SetISOFileNames "Kubuntu 12.04" kubuntu-12.04-desktop-i386.iso "http://cdimage.ubuntu.com/kubuntu/releases/12.04/release/kubuntu-12.04-desktop-i386.iso" kubuntu-12.04-desktop-i386.iso "698" linux.cfg multiboot\kubuntu1204\casper\vmlinuz "http://kubuntu.org" "Kubuntu"
 !insertmacro SetISOFileNames "Kubuntu 12.04 DVD" kubuntu-12.04-dvd-i386.iso "http://cdimage.ubuntu.com/kubuntu/releases/precise/release/kubuntu-12.04-dvd-i386.iso" kubuntu-12.04-dvd-i386.iso "3300" linux.cfg multiboot\kubuntu1204dvd\casper\vmlinuz "http://kubuntu.org" "Kubuntu"
 !insertmacro SetISOFileNames "Kubuntu 12.04 DVD amd64" kubuntu-12.04-dvd-amd64.iso "http://cdimage.ubuntu.com/kubuntu/releases/precise/release/kubuntu-12.04-dvd-amd64.iso" kubuntu-12.04-dvd-amd64.iso "3200" linux.cfg multiboot\kubuntu1204dvd64\casper\vmlinuz "http://kubuntu.org" "Kubuntu"

 !insertmacro SetISOFileNames "Lubuntu 12.04" lubuntu-12.04-desktop-i386.iso "http://cdimages.ubuntu.com/lubuntu/releases/12.04/release/lubuntu-12.04-desktop-i386.iso" lubuntu-12.04-desktop-i386.iso "688" linux.cfg multiboot\lubuntu1204\casper\vmlinuz "http://lubuntu.net" "Lubuntu" 
 !insertmacro SetISOFileNames "Mythbuntu 12.04" mythbuntu-12.04-desktop-i386.iso "http://cdimage.ubuntu.com/mythbuntu/releases/12.04/release/mythbuntu-12.04-desktop-i386.iso" mythbuntu-12.04-desktop-i386.iso "667" linux.cfg multiboot\mythbuntu1204\casper\vmlinuz "http://www.mythbuntu.org" "Mythbuntu"
 !insertmacro SetISOFileNames "Ubuntu Server 12.04" ubuntu-12.04-server-i386.iso "http://releases.ubuntu.com/precise/ubuntu-12.04-server-i386.iso" ubuntu-12.04-server-i386.iso "672" linux.cfg multiboot\ubuntuserv1204\install\vmlinuz "http://ubuntu.com" "Ubuntu"
 !insertmacro SetISOFileNames "Ubuntu Server 12.04 amd64" ubuntu-12.04-server-amd64.iso "http://releases.ubuntu.com/precise/ubuntu-12.04-server-amd64.iso" ubuntu-12.04-server-amd64.iso "673" linux.cfg multiboot\ubuntuserv120464\install\vmlinuz "http://ubuntu.com" "Ubuntu"
 !insertmacro SetISOFileNames "Edubuntu 12.04" edubuntu-12.04-dvd-i386.iso "http://cdimage.ubuntu.com/edubuntu/releases/12.04/release/edubuntu-12.04-dvd-i386.iso" edubuntu-12.04-dvd-i386.iso "2723" linux.cfg multiboot\edubuntu1204\casper\vmlinuz "http://edubuntu.org" "Edubuntu" 
 !insertmacro SetISOFileNames "Edubuntu 12.04 amd64" edubuntu-12.04-dvd-amd64.iso "http://cdimage.ubuntu.com/edubuntu/releases/12.04/release/edubuntu-12.04-dvd-amd64.iso" edubuntu-12.04-dvd-amd64.iso "2742" linux.cfg multiboot\edubuntu120464\casper\vmlinuz "http://edubuntu.org" "Edubuntu" 

 !insertmacro SetISOFileNames "Ubuntu Studio 12.04" ubuntustudio-12.04-dvd-i386.iso "http://cdimage.ubuntu.com/ubuntustudio/releases/12.04/release/ubuntustudio-12.04-dvd-i386.iso" ubuntustudio-12.04-dvd-i386.iso "1949" linux.cfg multiboot\ubuntustud1204\casper\vmlinuz "http://ubuntustudio.org" "Ubuntu Studio" 
 !insertmacro SetISOFileNames "Ubuntu Studio 12.04 amd64" ubuntustudio-12.04-dvd-amd64.iso "http://cdimage.ubuntu.com/ubuntustudio/releases/12.04/release/ubuntustudio-12.04-dvd-amd64.iso" ubuntustudio-12.04-dvd-amd64.iso "2018" linux.cfg multiboot\ubuntustud120464\casper\vmlinuz "http://ubuntustudio.org" "Ubuntu Studio" 
 
 
 !insertmacro SetISOFileNames "Xubuntu 12.04 amd64" xubuntu-12.04-desktop-amd64.iso "http://cdimage.ubuntu.com/xubuntu/releases/12.04/release/xubuntu-12.04-desktop-amd64.iso" xubuntu-12.04-desktop-amd64.iso "680" linux.cfg multiboot\xubuntu120464\casper\vmlinuz "http://xubuntu.org" "Xubuntu"
 !insertmacro SetISOFileNames "Kubuntu 12.04 amd64" kubuntu-12.04-desktop-amd64.iso "http://cdimage.ubuntu.com/kubuntu/releases/12.04/release/kubuntu-12.04-desktop-amd64.iso" kubuntu-12.04-desktop-amd64.iso "698" linux.cfg multiboot\kubuntu120464\casper\vmlinuz "http://kubuntu.org" "Kubuntu"
 !insertmacro SetISOFileNames "Lubuntu 12.04 amd64" lubuntu-12.04-desktop-amd64.iso "http://cdimages.ubuntu.com/lubuntu/releases/12.04/release/lubuntu-12.04-desktop-amd64.iso" lubuntu-12.04-desktop-amd64.iso "688" linux.cfg multiboot\lubuntu120464\casper\vmlinuz "http://lubuntu.net" "Lubuntu" 
 
 !insertmacro SetISOFileNames "Mythbuntu 12.04 amd64" mythbuntu-12.04-desktop-amd64.iso "http://cdimage.ubuntu.com/mythbuntu/releases/12.04/release/mythbuntu-12.04-desktop-amd64.iso" mythbuntu-12.04-desktop-amd64.iso "697" linux.cfg multiboot\mythbuntu120464\casper\vmlinuz "http://www.mythbuntu.org/" "Mythbuntu" 
 !insertmacro SetISOFileNames "Ubuntu 12.04 amd64" ubuntu-12.04-desktop-amd64.iso "http://releases.ubuntu.com/precise/ubuntu-12.04-desktop-amd64.iso" ubuntu-12.04-desktop-amd64.iso "698" linux.cfg multiboot\ubuntu120464\casper\vmlinuz "http://ubuntu.com" "Ubuntu"
 
 !insertmacro SetISOFileNames "Ubuntu 11.10" ubuntu-11.10-desktop-i386.iso "http://releases.ubuntu.com/11.10/ubuntu-11.10-desktop-i386.iso" ubuntu-11.10-desktop-i386.iso "700" linux.cfg multiboot\ubuntu1110\casper\vmlinuz "http://ubuntu.com" "Ubuntu"
 !insertmacro SetISOFileNames "Ubuntu Server 11.10" ubuntu-11.10-server-i386.iso "http://releases.ubuntu.com/11.10/ubuntu-11.10-server-i386.iso" ubuntu-11.10-server-i386.iso "672" linux.cfg multiboot\ubuntuserv1110\install\vmlinuz "http://ubuntu.com" "Ubuntu"
 !insertmacro SetISOFileNames "Xubuntu 11.10" xubuntu-11.10-desktop-i386.iso "http://cdimage.ubuntu.com/xubuntu/releases/11.10/release/xubuntu-11.10-desktop-i386.iso" xubuntu-11.10-desktop-i386.iso "681" linux.cfg multiboot\xubuntu1110\casper\vmlinuz "http://xubuntu.org" "Xubuntu"
 !insertmacro SetISOFileNames "Kubuntu 11.10" kubuntu-11.10-desktop-i386.iso "http://releases.ubuntu.com/kubuntu/11.10/kubuntu-11.10-desktop-i386.iso" kubuntu-11.10-desktop-i386.iso "694" linux.cfg multiboot\kubuntu1110\casper\vmlinuz "http://kubuntu.org" "Kubuntu"
 !insertmacro SetISOFileNames "Lubuntu 11.10" lubuntu-11.10-desktop-i386.iso "http://cdimages.ubuntu.com/lubuntu/releases/11.10/release/lubuntu-11.10-desktop-i386.iso" lubuntu-11.10-desktop-i386.iso "521" linux.cfg multiboot\lubuntu1110\casper\vmlinuz "http://lubuntu.net" "Lubuntu"
 !insertmacro SetISOFileNames "Edubuntu 11.10" edubuntu-11.10-dvd-i386.iso "http://cdimage.ubuntu.com/edubuntu/releases/11.10/release/edubuntu-11.10-dvd-i386.iso" edubuntu-11.10-dvd-i386.iso "2583" linux.cfg multiboot\edubuntu1110\casper\vmlinuz "http://edubuntu.org" "Edubuntu" 

 !insertmacro SetISOFileNames "Ubuntu 11.10 amd64" ubuntu-11.10-desktop-amd64.iso "http://releases.ubuntu.com/11.10/ubuntu-11.10-desktop-amd64.iso" ubuntu-11.10-desktop-amd64.iso "700" linux.cfg multiboot\ubuntu111064\casper\vmlinuz "http://ubuntu.com" "Ubuntu"
 !insertmacro SetISOFileNames "Xubuntu 11.10 amd64" xubuntu-11.10-desktop-amd64.iso "http://cdimage.ubuntu.com/xubuntu/releases/11.10/release/xubuntu-11.10-desktop-amd64.iso" xubuntu-11.10-desktop-amd64.iso "693" linux.cfg multiboot\xubuntu111064\casper\vmlinuz "http://xubuntu.org" "Xubuntu"
 !insertmacro SetISOFileNames "Kubuntu 11.10 amd64" kubuntu-11.10-desktop-amd64.iso "http://releases.ubuntu.com/kubuntu/11.10/kubuntu-11.10-desktop-amd64.iso" kubuntu-11.10-desktop-amd64.iso "700" linux.cfg multiboot\kubuntu111064\casper\vmlinuz "http://kubuntu.org" "Kubuntu"
 !insertmacro SetISOFileNames "Lubuntu 11.10 amd64" lubuntu-11.10-desktop-amd64.iso "http://cdimages.ubuntu.com/lubuntu/releases/11.10/release/lubuntu-11.10-desktop-amd64.iso" lubuntu-11.10-desktop-amd64.iso "670" linux.cfg multiboot\lubuntu111064\casper\vmlinuz "http://lubuntu.net" "Lubuntu" 
 
 !insertmacro SetISOFileNames "Ultimate Edition 3" ultimate-edition-3.0-x86.iso "http://sourceforge.net/projects/ultimateedition/files/ultimate-edition-3.0-x86.iso/download" ultimate-edition-3.0-x86.iso "3200" linux.cfg multiboot\ultimateed\casper\vmlinuz "http://ultimateedition.info" "Ultimate Edition"
 
 !insertmacro SetISOFileNames "Ubuntu 11.04" ubuntu-11.04-desktop-i386.iso "http://releases.ubuntu.com/11.04/ubuntu-11.04-desktop-i386.iso" ubuntu-11.04-desktop-i386.iso "700" linux.cfg multiboot\ubuntu1104\casper\vmlinuz "http://ubuntu.com" "Ubuntu"
 !insertmacro SetISOFileNames "Xubuntu 11.04" xubuntu-11.04-desktop-i386.iso "http://cdimage.ubuntu.com/xubuntu/releases/11.04/release/xubuntu-11.04-desktop-i386.iso" xubuntu-11.04-desktop-i386.iso "681" linux.cfg multiboot\xubuntu1104\casper\vmlinuz "http://xubuntu.org" "Xubuntu"
 !insertmacro SetISOFileNames "Kubuntu 11.04" kubuntu-11.04-desktop-i386.iso "http://releases.ubuntu.com/kubuntu/11.04/kubuntu-11.04-desktop-i386.iso" kubuntu-11.04-desktop-i386.iso "694" linux.cfg multiboot\kubuntu1104\casper\vmlinuz "http://kubuntu.org" "Kubuntu"

 !insertmacro SetISOFileNames "Ubuntu 11.04 x64" ubuntu-11.04-desktop-amd64.iso "http://releases.ubuntu.com/11.04/ubuntu-11.04-desktop-amd64.iso" ubuntu-11.04-desktop-amd64.iso "700" linux.cfg multiboot\ubuntu1104x64\casper\vmlinuz "http://ubuntu.com" "Ubuntu"
 !insertmacro SetISOFileNames "Xubuntu 11.04 x64" xubuntu-11.04-desktop-amd64.iso "http://cdimage.ubuntu.com/xubuntu/releases/11.04/release/xubuntu-11.04-desktop-amd64.iso" xubuntu-11.04-desktop-amd64.iso "681" linux.cfg multiboot\xubuntu1104x64\casper\vmlinuz "http://xubuntu.org" "Xubuntu"
 !insertmacro SetISOFileNames "Kubuntu 11.04 x64" kubuntu-11.04-desktop-amd64.iso "http://releases.ubuntu.com/kubuntu/11.04/kubuntu-11.04-desktop-amd64.iso" kubuntu-11.04-desktop-amd64.iso "694" linux.cfg multiboot\kubuntu1104x64\casper\vmlinuz "http://kubuntu.org" "Kubuntu"

 !insertmacro SetISOFileNames "Lubuntu 11.04" lubuntu-11.04.iso "http://people.ubuntu.com/%7Egilir/lubuntu-11.04.iso" lubuntu-11.04.iso "521" linux.cfg multiboot\lubuntu1104\casper\vmlinuz "http://lubuntu.net" "Lubuntu"
 !insertmacro SetISOFileNames "Edubuntu 11.04" edubuntu-11.04-dvd-i386.iso "http://cdimage.ubuntu.com/edubuntu/releases/11.04/release/edubuntu-11.04-dvd-i386.iso" edubuntu-11.04-dvd-i386.iso "2583" linux.cfg multiboot\edubuntu1104\casper\vmlinuz "http://edubuntu.org" "Edubuntu" 
 !insertmacro SetISOFileNames "Ubuntu 10.10" ubuntu-10.10-desktop-i386.iso "http://releases.ubuntu.com/10.10/ubuntu-10.10-desktop-i386.iso" ubuntu-10.10-desktop-i386.iso "700" linux.cfg multiboot\ubuntu\casper\vmlinuz "http://ubuntu.com" "Ubuntu"
 !insertmacro SetISOFileNames "Xubuntu 10.10" xubuntu-10.10-desktop-i386.iso "http://cdimage.ubuntu.com/xubuntu/releases/10.10/release/xubuntu-10.10-desktop-i386.iso" xubuntu-10.10-desktop-i386.iso "681" linux.cfg multiboot\xubuntu\casper\vmlinuz "http://xubuntu.org" "Xubuntu"
 !insertmacro SetISOFileNames "Kubuntu 10.10" kubuntu-10.10-desktop-i386.iso "http://releases.ubuntu.com/kubuntu/10.10/kubuntu-10.10-desktop-i386.iso" kubuntu-10.10-desktop-i386.iso "694" linux.cfg multiboot\kubuntu\casper\vmlinuz "http://kubuntu.org" "Kubuntu"
 !insertmacro SetISOFileNames "Lubuntu 10.10" lubuntu-10.10.iso "http://people.ubuntu.com/%7Egilir/lubuntu-10.10.iso" lubuntu-10.10.iso "521" linux.cfg multiboot\lubuntu\casper\vmlinuz "http://lubuntu.net" "Lubuntu"
 !insertmacro SetISOFileNames "Edubuntu 10.10" edubuntu-10.10-dvd-i386.iso "http://cdimage.ubuntu.com/edubuntu/releases/10.10/release/edubuntu-10.10-dvd-i386.iso" edubuntu-10.10-dvd-i386.iso "2583" linux.cfg multiboot\edubuntu\casper\vmlinuz "http://edubuntu.org" "Edubuntu" 
 
 !insertmacro SetISOFileNames "Ubuntu 10.04" ubuntu-10.04*-desktop-i386.iso "http://www.ubuntu.com/start-download?distro=desktop&bits=32&release=lts" ubuntu-10.04-desktop-i386.iso "700" linux.cfg multiboot\ubuntu1004\casper\vmlinuz "http://ubuntu.com" "Ubuntu"
 !insertmacro SetISOFileNames "Xubuntu 10.04" xubuntu-10.04*-desktop-i386.iso "http://cdimage.ubuntu.com/xubuntu/releases/10.04/release/xubuntu-10.04.2-desktop-i386.iso" xubuntu-10.04-desktop-i386.iso "681" linux.cfg multiboot\xubuntu1004\casper\vmlinuz "http://xubuntu.org" "Xubuntu"
 !insertmacro SetISOFileNames "Kubuntu 10.04" kubuntu-10.04*-desktop-i386.iso "http://releases.ubuntu.com/kubuntu/10.04.3/kubuntu-10.04.3-desktop-i386.iso" kubuntu-10.04-desktop-i386.iso "694" linux.cfg multiboot\kubuntu1004\casper\vmlinuz "http://kubuntu.org" "Kubuntu"
 !insertmacro SetISOFileNames "Ubuntu 10.04 x64" ubuntu-10.04*-desktop-amd64.iso "http://www.ubuntu.com/start-download?distro=desktop&bits=64&release=lts" ubuntu-10.04-desktop-amd64.iso "700" linux.cfg multiboot\ubuntu1004x64\casper\vmlinuz "http://ubuntu.com" "Ubuntu"
 !insertmacro SetISOFileNames "Xubuntu 10.04 x64" xubuntu-10.04*-desktop-amd64.iso "http://cdimage.ubuntu.com/xubuntu/releases/10.04/release/xubuntu-10.04.2-desktop-amd64.iso" xubuntu-10.04-desktop-amd64.iso "681" linux.cfg multiboot\xubuntu1004x64\casper\vmlinuz "http://xubuntu.org" "Xubuntu"
 !insertmacro SetISOFileNames "Kubuntu 10.04 x64" kubuntu-10.04*-desktop-amd64.iso "http://releases.ubuntu.com/kubuntu/10.04/kubuntu-10.04.3-desktop-amd64.iso" kubuntu-10.04-desktop-amd64.iso "694" linux.cfg multiboot\kubuntu1004x64\casper\vmlinuz "http://kubuntu.org" "Kubuntu" 
 !insertmacro SetISOFileNames "Terralinux" Terra*.iso "http://sourceforge.net/projects/terralinuxos/files/latest/download" Terra.iso "1370" linux.cfg multiboot\terralinux\casper\vmlinuz "http://terralinux.blogspot.com/" "Terralinux"
 !insertmacro SetISOFileNames "Dreamlinux" dreamlinux*.iso "http://download.linux-live-cd.org/iso/Dreamlinux/Dreamlinux-5.iso" Dreamlinux.iso "988" linux.cfg multiboot\dreamlinux\boot\vmlinuz "http://www.dreamlinux.info/" "Dreamlinux" 
 
 ; !insertmacro SetISOFileNames "Samurai-WTF" samurai-0.9.5.iso "http://sourceforge.net/projects/samurai/files/samurai/samurai-0.9.5/samurai-0.9.5.iso/download" samurai-0.9.5.iso "1410" linux.cfg multiboot\samurai\casper\vmlinuz "http://samurai.inguardians.com/" "Samurai"

 !insertmacro SetISOFileNames "OpenSUSE 12.1 GNOME i686" openSUSE-12.1-GNOME-LiveCD-i686.iso "http://suse.mirrors.tds.net/pub/opensuse/distribution/12.1/iso/openSUSE-12.1-GNOME-LiveCD-i686.iso" openSUSE-12.1-GNOME-LiveCD-i686.iso "695" linux.cfg multiboot\opensuse12\openSUSE-12.1-livecd-gnome-read-only.i686-2.8.0 "http://software.opensuse.org" "OpenSUSE" 
 !insertmacro SetISOFileNames "OpenSUSE 12.1 GNOME x64" openSUSE-12.1-GNOME-LiveCD-x86_64.iso "http://suse.mirrors.tds.net/pub/opensuse/distribution/12.1/iso/openSUSE-12.1-GNOME-LiveCD-x86_64.iso" openSUSE-12.1-GNOME-LiveCD-x86_64.iso "695" linux.cfg multiboot\opensuse6412\openSUSE-12.1-livecd-gnome-read-only.x86_64-2.8.0 "http://software.opensuse.org" "OpenSUSE" 
 !insertmacro SetISOFileNames "OpenSUSE 12.1 KDE i686" openSUSE-12.1-KDE-LiveCD-i686.iso "http://suse.mirrors.tds.net/pub/opensuse/distribution/12.1/iso/openSUSE-12.1-KDE-LiveCD-i686.iso" openSUSE-12.1-KDE-LiveCD-i686.iso "695" linux.cfg multiboot\opensuseKDE12\openSUSE-12.1-livecd-kde-read-only.i686-2.8.0 "http://software.opensuse.org" "OpenSUSE" 
 !insertmacro SetISOFileNames "OpenSUSE 12.1 KDE x64" openSUSE-12.1-KDE-LiveCD-x86_64.iso "http://suse.mirrors.tds.net/pub/opensuse/distribution/12.1/iso/openSUSE-12.1-KDE-LiveCD-x86_64.iso" openSUSE-12.1-KDE-LiveCD-x86_64.iso "695" linux.cfg multiboot\opensuseKDE6412\openSUSE-12.1-livecd-kde-read-only.x86_64-2.8.0 "http://software.opensuse.org" "OpenSUSE"  
 
 !insertmacro SetISOFileNames "OpenSUSE 11.4 GNOME i686" openSUSE-11.4-GNOME-LiveCD-i686.iso "http://suse.mirrors.tds.net/pub/opensuse/distribution/11.4/iso/openSUSE-11.4-GNOME-LiveCD-i686.iso" openSUSE-11.4-GNOME-LiveCD-i686.iso "695" linux.cfg multiboot\opensuse\openSUSE-gnome-11.4-livecd-gnome-read-only.i686-2.8.0 "http://software.opensuse.org" "OpenSUSE" 
 !insertmacro SetISOFileNames "OpenSUSE 11.4 GNOME x64" openSUSE-11.4-GNOME-LiveCD-x86_64.iso "http://suse.mirrors.tds.net/pub/opensuse/distribution/11.4/iso/openSUSE-11.4-GNOME-LiveCD-x86_64.iso" openSUSE-11.4-GNOME-LiveCD-x86_64.iso "695" linux.cfg multiboot\opensuse64\openSUSE-gnome-11.4-livecd-gnome-read-only.x86_64-2.8.0 "http://software.opensuse.org" "OpenSUSE" 
 !insertmacro SetISOFileNames "OpenSUSE 11.4 KDE i686" openSUSE-11.4-KDE-LiveCD-i686.iso "http://suse.mirrors.tds.net/pub/opensuse/distribution/11.4/iso/openSUSE-11.4-KDE-LiveCD-i686.iso" openSUSE-11.4-KDE-LiveCD-i686.iso "695" linux.cfg multiboot\opensuseKDE\openSUSE-kde-11.4-livecd-kde-read-only.i686-2.8.0 "http://software.opensuse.org" "OpenSUSE" 
 !insertmacro SetISOFileNames "OpenSUSE 11.4 KDE x64" openSUSE-11.4-KDE-LiveCD-x86_64.iso "http://suse.mirrors.tds.net/pub/opensuse/distribution/11.4/iso/openSUSE-11.4-KDE-LiveCD-x86_64.iso" openSUSE-11.4-KDE-LiveCD-x86_64.iso "695" linux.cfg multiboot\opensuseKDE64\openSUSE-kde-11.4-livecd-kde-read-only.x86_64-2.8.0 "http://software.opensuse.org" "OpenSUSE" 

 
 !insertmacro SetISOFileNames "Ubuntu Netbook Remix 10.10" ubuntu-10.10-netbook-i386.iso "http://releases.ubuntu.com/10.10/ubuntu-10.10-netbook-i386.iso" ubuntu-10.10-netbook-i386.iso "700" netbook.cfg multiboot\netbookubuntu\casper\vmlinuz "http://ubuntu.com" "UNR"
 
 !insertmacro SetISOFileNames "Linux Mint 12 KDE 32bit" linuxmint-12-kde*32bit.iso "http://ftp.heanet.ie/pub/linuxmint.com/stable/12/linuxmint-12-kde-dvd-32bit.iso" linuxmint-12-kde-32bit.iso "1100" linux.cfg multiboot\mint1232KDE\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint"
 !insertmacro SetISOFileNames "Linux Mint 12 KDE 64bit" linuxmint-12-kde*64bit.iso "http://ftp.heanet.ie/pub/linuxmint.com/stable/12/linuxmint-12-kde-dvd-64bit.iso" linuxmint-12-kde-64bit.iso "1110" linux.cfg multiboot\mint1264KDE\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint" 
 !insertmacro SetISOFileNames "Linux Mint 12 LXDE 32bit" linuxmint-12-lxde*32bit.iso "http://mirror.yellowfiber.net/linuxmint/stable/12/linuxmint-12-lxde-cd-32bit.iso" linuxmint-12-lxde-cd-32bit.iso "657" linux.cfg multiboot\mint1232LXDE\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint" 

 !insertmacro SetISOFileNames "Linux Mint 13 Mate 32bit" linuxmint-13-mate-dvd-32bit*.iso "http://mirror.yellowfiber.net/linuxmint/testing/linuxmint-13-mate-dvd-32bit-rc.iso" linuxmint-13-mate-dvd-32bit.iso "898" linux.cfg multiboot\mintmate1332\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint"
 !insertmacro SetISOFileNames "Linux Mint 13 Mate 64bit" linuxmint-13-mate-dvd-64bit*.iso "http://mirrors.secution.com/linuxmint.com/testing/linuxmint-13-mate-dvd-64bit-rc.iso" linuxmint-13-mate-dvd-64bit.iso "885" linux.cfg multiboot\mintmate1364\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint" 
 !insertmacro SetISOFileNames "Linux Mint 13 Cinnamon 32bit" linuxmint-13-cinnamon-dvd-32bit*.iso "http://mirrors.secution.com/linuxmint.com/testing/linuxmint-13-cinnamon-dvd-32bit-rc.iso" linuxmint-13-cinnamon-dvd-32bit.iso "817" linux.cfg multiboot\mintcin1332\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint"
 !insertmacro SetISOFileNames "Linux Mint 13 Cinnamon 64bit" linuxmint-13-cinnamon-dvd-64bit*.iso "http://mirror.umd.edu/linuxmint/images/testing/linuxmint-13-cinnamon-dvd-64bit-rc.iso" linuxmint-13-cinnamon-dvd-64bit.iso "800" linux.cfg multiboot\mintcin1364\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint"
 
 !insertmacro SetISOFileNames "Linux Mint 12 Gnome 32bit" linuxmint-12-gnome*32bit.iso "http://ftp.heanet.ie/pub/linuxmint.com/stable/12/linuxmint-12-gnome-cd-nocodecs-32bit.iso" linuxmint-12-gnome-32bit.iso "620" linux.cfg multiboot\mint1232\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint"
 !insertmacro SetISOFileNames "Linux Mint 12 Gnome 64bit" linuxmint-12-gnome*64bit.iso "http://ftp.heanet.ie/pub/linuxmint.com/stable/12/linuxmint-12-gnome-cd-nocodecs-64bit.iso" linuxmint-12-gnome-64bit.iso "634" linux.cfg multiboot\mint1264\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint"
 !insertmacro SetISOFileNames "LMDE 201204 Mate/Cinnamon 32bit" linuxmint-201204-mate-cinnamon-dvd-32bit.iso "http://mirrors.secution.com/linuxmint.com/debian/linuxmint-201204-mate-cinnamon-dvd-32bit.iso" linuxmint-201204-mate-cinnamon-dvd-32bit.iso "1200" linux.cfg multiboot\mintdeb\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint"
 !insertmacro SetISOFileNames "LMDE 201204 Mate/Cinnamon 64bit" linuxmint-201204-mate-cinnamon-dvd-64bit.iso "http://mirrors.secution.com/linuxmint.com/debian/linuxmint-201204-mate-cinnamon-dvd-64bit.iso" linuxmint-201204-mate-cinnamon-dvd-64bit.iso "1200" linux.cfg multiboot\mintdeb64\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint" 
 !insertmacro SetISOFileNames "LMDE 201204 XFCE 32bit" linuxmint-201204-xfce-dvd-32bit.iso "http://mirror.yellowfiber.net/linuxmint/debian/linuxmint-201204-xfce-dvd-32bit.iso" linuxmint-201204-xfce-dvd-32bit.iso "1000" linux.cfg multiboot\mintxfce\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint" 
 !insertmacro SetISOFileNames "LMDE 201204 XFCE 64bit" linuxmint-201204-xfce-dvd-64bit.iso "http://mirror.yellowfiber.net/linuxmint/debian/linuxmint-201204-xfce-dvd-64bit.iso" linuxmint-201204-xfce-dvd-64bit.iso "1000" linux.cfg multiboot\mintxfce64\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint" 
 
 !insertmacro SetISOFileNames "Linux Mint 10" linuxmint-10-gnome*i386.iso "http://ftp.heanet.ie/pub/linuxmint.com/stable/10/linuxmint-10-gnome-cd-i386.iso" linuxmint-10-gnome-i386.iso "675" linux.cfg multiboot\mint\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint"

 !insertmacro SetISOFileNames "Linux Mint 11 32bit" linuxmint-11-gnome*32bit.iso "http://ftp.heanet.ie/pub/linuxmint.com/stable/11/linuxmint-11-gnome-dvd-32bit.iso" linuxmint-11-gnome-32bit.iso "867" linux.cfg multiboot\mint1132\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint"
 !insertmacro SetISOFileNames "Linux Mint 11 64bit" linuxmint-11-gnome*64bit.iso "http://ftp.heanet.ie/pub/linuxmint.com/stable/11/linuxmint-11-gnome-dvd-64bit.iso" linuxmint-11-gnome-64bit.iso "867" linux.cfg multiboot\mint1164\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint" 
 !insertmacro SetISOFileNames "Peppermint One" Peppermint-One*.iso "http://peppermintos.info/archive/Peppermint-One-06172010.iso" Peppermint-One.iso "444" linux.cfg multiboot\pmint\casper\vmlinuz "http://peppermintos.com" "Peppermint"
 !insertmacro SetISOFileNames "Peppermint Two" Peppermint-Two*.iso "http://peppermintos.info/dl1/Peppermint-Two-i386-06052011.iso" Peppermint-Two.iso "444" linux.cfg multiboot\pmint2\casper\vmlinuz "http://peppermintos.com" "Peppermint"
 !insertmacro SetISOFileNames "Netrunner" netrunner4*.iso "http://www.netrunner-os.com/wp-content/plugins/download-monitor/download.php?id=15" netrunner.iso "1141" linux.cfg multiboot\netrunner\casper\vmlinuz "http://www.netrunner-os.com" "Netrunner"
 !insertmacro SetISOFileNames "OSGeo Live" osgeo-live*.iso "http://download.osgeo.org/livedvd/release/5.5/osgeo-live-5.5.iso" osgeo.iso "4566" linux.cfg multiboot\osgeo\casper\vmlinuz "http://live.osgeo.org" "OSGeo Live"

 !insertmacro SetISOFileNames "EasyPeasy (NetBook Distro)" EasyPeasy-1.6.iso "http://sourceforge.net/projects/ubuntu-eee/files/EasyPeasy/EasyPeasy-1.6.iso/download" EasyPeasy-1.6.iso "839" netbook.cfg multiboot\easypeasy\casper\vmlinuz "http://www.geteasypeasy.com" "EasyPeasy"
 !insertmacro SetISOFileNames "EEEBuntu (NetBook Distro)" eeebuntu-3.0.1-nbr.iso "http://eeebuntu.virginmedia.com/Eeebuntu%203.0%20Editions/eeebuntu-3.0.1-nbr.iso" eeebuntu-3.0.1-nbr.iso "860" netbook.cfg multiboot\eeebuntu\casper\vmlinuz "http://www.eeebuntu.org" "EEEBuntu"
 !insertmacro SetISOFileNames "xPUD (Netbook Distro)" xpud-0.9.2.iso "http://xpud.googlecode.com/files/xpud-0.9.2.iso" xpud-0.9.2.iso "64" netbook.cfg multiboot\xpud\boot\xpud "http://www.xpud.org" "xPud"
 !insertmacro SetISOFileNames "SLAX (Tiny Slackware Based Distro)" slax-6.1.2.tar "http://www.slax.org/get_slax.php?download=tar" slax-6.1.2.tar "200" linux.cfg multiboot\Slax612\boot\vmlinuz "http://slax.org" "SLAX"
 !insertmacro SetISOFileNames "Porteus" porteus*.iso "http://www.ponce.cc/porteus/i486/current/" porteus.iso "300" linux.cfg multiboot\porteus\boot\vmlinuz "https://porteus.org/" "Porteus"
;REVISIT !insertmacro SetISOFileNames "Dreamlinux" DL3.5*.iso "ftp://ftp.nluug.nl/pub/os/Linux/distr/dreamlinux/stable/DL3.5_20092802.iso" DL3.5.iso "700" linux.cfg multiboot\dreamlinux\boot\vmlinuz "http://www.dreamlinux.net/" "Dreamlinux"
 !insertmacro SetISOFileNames "WifiWay 3.4" wifiway-3.4.iso "http://download.wifislax.com/wifiway-3.4.iso" wifiway-3.4.iso "490" linux.cfg multiboot\wifiway34\boot\vmlinuz "http://www.wifiway.org" "WifiWay"
 !insertmacro SetISOFileNames "WifiWay 2" wifiway-2*.iso "http://download.wifislax.com/wifiway-2.0.3-final.iso" wifiway.iso "499" linux.cfg multiboot\wifiway\boot\vmlinuz "http://www.wifiway.org" "WifiWay"
 !insertmacro SetISOFileNames "Panda SafeCD" SafeCD.iso "http://www.pandasecurity.com/resources/tools/SafeCD.iso" SafeCD.iso "215" antivirus.cfg multiboot\panda\live\vmlinuz1 "http://www.pandasecurity.com" "Panda Safe CD"
 !insertmacro SetISOFileNames "Parted Magic (Partition Tools)" pmagic*.iso "http://sourceforge.net/projects/partedmagic/files/latest" pmagic.iso "146" system.cfg multiboot\partedmagic\pmagic\bzImage "http://partedmagic.com" "Parted Magic"
 !insertmacro SetISOFileNames "PCLinuxOS" pclinuxos*.iso "http://www.pclinuxos.com/?page_id=10" pclinuxos.iso "600" linux.cfg multiboot\pclos\isolinux\vmlinuz "http://www.pclinuxos.com" "PCLinuxOS"
 !insertmacro SetISOFileNames "GParted (Partition Tools)" gparted-live*.iso "http://sourceforge.net/projects/gparted/files/latest" gparted-live.iso "232" system.cfg multiboot\gparted\live\vmlinuz "http://gparted.sourceforge.net" "gParted"
 !insertmacro SetISOFileNames "Partition Wizard (Partition Tools)" pwhe*.iso "http://www.partitionwizard.com/download/pwhe7.iso" pwhe.iso "40" system.cfg multiboot\pwiz\BOOT\tinycore.gz "http://www.partitionwizard.com" "Partition Wizard"
 !insertmacro SetISOFileNames "Clonezilla (Backup + Clone Tool)" clonezilla-live*.iso "http://sourceforge.net/projects/clonezilla/files/latest/download" clonezilla-live.iso "134" system.cfg multiboot\clonezilla\live\initrd.img "http://clonezilla.org" "Clonezilla"
 !insertmacro SetISOFileNames "Redo Backup And Recovery (Recovery Tools)" redobackup-livecd*.iso "http://sourceforge.net/projects/redobackup/files/redobackup-livecd-1.0.1.iso/download" redobackup-livecd.iso "199" system.cfg multiboot\redobackup\casper\vmlinuz "http://redobackup.org" "RedoBackup"
 !insertmacro SetISOFileNames "Kaspersky Rescue Disk (Antivirus Scanner)" kav_rescue_10.iso "http://rescuedisk.kaspersky-labs.com/rescuedisk/updatable/kav_rescue_10.iso" rescue.iso "252" antivirus.cfg multiboot\kav\boot\rescue.igz "http://support.kaspersky.com/viruses/rescuedisk" "Kaspersky"
 !insertmacro SetISOFileNames "AVG Rescue CD (Antivirus Scanner)" avg*.iso "http://www.avg.com/us-en/download-file-cd-arl-iso" avg.iso "80" antivirus.cfg multiboot\avg\isolinux\vmlinuz "http://www.avg.com" "AVG Rescue CD"
 !insertmacro SetISOFileNames "Acronis Antimalware CD" AcronisAntimalwareScanCD.iso "http://download.acronis.com/iso/AcronisAntimalwareScanCD.iso" AcronisAntimalwareScanCD.iso "333" antivirus.cfg multiboot\acronis\casper\vmlinuz "http://kb.acronis.com/content/18647" "Acronis"
 !insertmacro SetISOFileNames "Bitdefender Rescue Disk (Antivirus Scanner)" bitdefender-rescue-cd.iso "http://download.bitdefender.com/rescue_cd/bitdefender-rescue-cd.iso" bitdefender-rescue-cd.iso "546" antivirus.cfg multiboot\bitdefender\casper\vmlinuz "http://bitdefender.com" "Bitdefender"
 !insertmacro SetISOFileNames "AVIRA AntiVir Rescue CD (Virus Scanner)" rescue_system-common-en.iso "http://dl1.pro.antivir.de/package/rescue_system/common/en/rescue_system-common-en.iso" rescue_system-common-en.iso "74" antivirus.cfg antivir\vmlinuz "http://www.avira.com" "Avira"
 !insertmacro SetISOFileNames "G Data (Virus Scanner)" ENG_R_FUL_2011_BootCD.iso "http://qsmirror.gdatasecurity.de/pushfile.php?fHash=63a38a7e1da423969b1f7bdfdcf6da72" ENG_R_FUL_2011_BootCD.iso "692" antivirus.cfg multiboot\gdata\boot\linux26 "http://www.gdatasoftware.com" "G Data"
 !insertmacro SetISOFileNames "F-Secure Rescue CD" rescue-cd*.iso "http://www.f-secure.com/v-descs/tools/rescue-cd-3.14-44905.iso" rescue-cd.iso "120" antivirus.cfg multiboot\fsecure\boot\isolinux\linux "http://www.f-secure.com/en/web/labs_global/removal/rescue-cd" "F-Secure Rescue CD"

 !insertmacro SetISOFileNames "Jolicloud (NetBook Distro)" joli*.iso "http://www.jolicloud.com/download/jolicloud-iso" jolicloud.iso "691" netbook.cfg multiboot\jolicloud\casper\vmlinuz "http://www.jolicloud.com" "Jolicloud"
 !insertmacro SetISOFileNames "EASEUS Disk Copy (Disk Cloning Tool)" *.iso "http://majorgeeks.com/EaseUs_Disk_Copy_d4845.html" dc.iso "64" system.cfg multiboot\diskcopy\initrd.img "http://www.easeus.com" "EASEUS Disk Copy"
 !insertmacro SetISOFileNames "Hiren's Boot CD" Hiren*.iso "NONE" Hirens.iso "393" other.cfg HBCD\menu.lst "" ""
 !insertmacro SetISOFileNames "Kon-Boot Floppy Image" kon-boot-all.zip "http://www.mediafire.com/file/74qrm2h4oof17o7/kon-boot-all.zip" multiboot\konboot.img "2" other.cfg multiboot\konboot.img "http://www.piotrbania.com/all/kon-boot/" "Kon-Boot" 
 !insertmacro SetISOFileNames "Linux Live Tools for OCZ" ocz_tools*.zip "http://bit.ly/xbyDjF" multiboot\ocz\boot\vmlinuz "50" other.cfg multiboot\ocz\boot\vmlinuz "http://www.ocztechnologyforum.com/forum/showthread.php?99275-NEW!-Bootable-Linux-based-tools-for-OCZ-SSD-s" "OCZ" 
 !insertmacro SetISOFileNames "Windows Vista/7/8 Installer" *.iso "NONE" win.iso "300" other.cfg bootmgr "" ""
 !insertmacro SetISOFileNames "Memtest86+ (Memory Testing Tool)" memtest86+-4.20.zip "http://www.memtest.org/download/4.20/memtest86+-4.20.zip" memtest86+-4.20.zip "1" system.cfg multiboot\memtest.bin "http://www.memtest.org" "Memtest86+" 
 !insertmacro SetISOFileNames "HDT (Hardware Detection Tool)" hdt-0.5.0.img "http://hdt-project.org/raw-attachment/wiki/hdt-0.5.0/hdt-0.5.0.img" multiboot\hdt.img "1" system.cfg multiboot\hdt.img "http://hdt-project.org" "HDT" 
 !insertmacro SetISOFileNames "BackTrack5 (Penetration Testing)" BT5*.iso "http://www.backtrack-linux.org/downloads/" BT5.iso "2000" system.cfg multiboot\backtrack5\casper\vmlinuz "http://www.backtrack-linux.org" "Backtrack"
 !insertmacro SetISOFileNames "BackBox (Penetration Testing)" backbox*.iso "http://bit.ly/yCSJmW" backbox.iso "706" system.cfg multiboot\backbox\casper\vmlinuz "http://www.backbox.org/" "BackBox"

 !insertmacro SetISOFileNames "Mandriva 2011" Mandriva.2011.i586.1.iso "http://www.mandriva.com/en/downloads/download.html?product=Mandriva.2011.i586.1.iso" Mandriva.2011.i586.1.iso "1700" linux.cfg multiboot/mandriva/LiveOS/squashfs.img "http://www.mandriva.com" "Mandriva"
 !insertmacro SetISOFileNames "SalineOS" SalineOS*.iso "http://www.salineos.com/server/SalineOS-1.0-i386-PSE.iso" SalineOS*.iso "931" linux.cfg multiboot\saline\live\vmlinuz "http://www.salineos.com" "SalineOS"
 !insertmacro SetISOFileNames "Zorin OS" zorin*.iso "http://zorin-os.com/free.html" zorin.iso "670" linux.cfg multiboot\zorin\casper\vmlinuz "http://zorin-os.com/" "Zorin OS"
 
 !insertmacro SetISOFileNames "System Rescue CD" systemrescuecd-x86*.iso "http://sourceforge.net/projects/systemrescuecd/files/latest/download" systemrescuecd-x86.iso "353" system.cfg multiboot\systemrescuecd\isolinux\rescuecd "http://www.sysresccd.org" "System Rescue"
 !insertmacro SetISOFileNames "Trinity Rescue Kit" trinity-rescue-kit.3.4-build*.iso "ftp://ftp.osuosl.org/pub/trk/trinity-rescue-kit.3.4-build-372.iso" trinity-rescue-kit.3.4.iso "146" system.cfg TRK\initrd.trk "http://trinityhome.org" "TRK"
; OLD VERSION !insertmacro SetISOFileNames "DBAN (Hard Drive Nuker)" dban-1.0.7_i386.iso "http://sourceforge.net/projects/dban/files/dban/dban-1.0.7/dban-1.0.7_i386.iso/download" multiboot\ISOS\dban-1.0.7_i386.iso "2" system.cfg multiboot\ISOS\dban-1.0.7_i386.iso "http://www.dban.org" "DBAN"
 !insertmacro SetISOFileNames "DBAN (Hard Drive Nuker)" dban-2.2.6_i586.iso "http://sourceforge.net/projects/dban/files/dban/dban-2.2.6/dban-2.2.6_i586.iso/download" dban-2.2.6_i586.iso "2" system.cfg multiboot\DBAN\DBAN.BZI "http://www.dban.org" "DBAN"
 !insertmacro SetISOFileNames "DRBL (Diskless Remote Boot in Linux)" drbl-live*.iso "http://sourceforge.net/projects/drbl/files/drbl_live_stable/1.0.5-6/drbl-live-xfce-1.0.5-6-i686.iso/download" drbl-live*.iso "394" system.cfg multiboot\DRBL\live\vmlinuz "http://drbl.sourceforge.net" "DRBL"
 !insertmacro SetISOFileNames "XBMC" xbmc*.iso "http://mirrors.xbmc.org/releases/live/xbmc-10.1-live.iso" xbmc.iso "420" linux.cfg multiboot\xbmc\live\vmlinuz "http://xbmc.org/" "XBMC"
 !insertmacro SetISOFileNames "XBMCbuntu" xbmcbuntu*.iso "http://mirrors.xbmc.org/releases/XBMCbuntu/xbmcbuntu-11.0.iso" xbmcbuntu.iso "623" linux.cfg multiboot\xbmcbuntu\casper\vmlinuz "http://xbmc.org/" "XBMC"
 
 !insertmacro SetISOFileNames "Try an Unlisted ISO" *.iso "NONE" "" "1" menu.lst "" "" "" 
 !insertmacro SetISOFileNames "Try an Unlisted ISO (Run from RAM)" *.iso "NONE" "" "1" menu.lst "" "" ""  
 
 ; ##################################### ADD NEW DISTRO ########################################
FunctionEnd

Function License_PreFunction
  StrCpy $R8 1 ;This is the 1st page
FunctionEnd

Function SelectionsPage
  StrCpy $R8 2
 !insertmacro MUI_HEADER_TEXT $(SelectDist_Title) $(SelectDist_Subtitle) 
  nsDialogs::Create 1018
  Pop $Dialog

; To Install or Uninstall? That is the question!  
  ${NSD_CreateCheckBox} 60% 0 44% 15 "Remove an Installed Item?"
  Pop $Uninstaller
  ${NSD_OnClick} $Uninstaller Uninstall  
  
; Drive Selection Starts  
  ${NSD_CreateLabel} 0 0 58% 15 $(DrivePage_Text)
  Pop $LabelDrivePage
  ${NSD_CreateDropList} 0 20 15% 15 ""
  Pop $DestDriveTxt
  Call ListAllDrives
  ${NSD_OnChange} $DestDriveTxt OnSelectDrive
  
; All Drives Option
  ${NSD_CreateCheckBox} 17% 23 41% 15 "Show ALL Drives? (USE CAUTION)"
  Pop $AllDriveOption
  ${NSD_OnClick} $AllDriveOption ListAllDrives 

; Format Drive Option
  ${NSD_CreateCheckBox} 60% 23 100% 15 "Format Drive"
  Pop $Format
  ${NSD_OnClick} $Format FormatIt    
  
; Distro Selection Starts
  ${NSD_CreateLabel} 0 50 100% 15 $(Distro_Text) 
  Pop $LinuxDistroSelection   

  ${NSD_CreateListBox} 0 70 55% 95 "" ; was NSD_CreateDroplist 
  Pop $Distro
  ${NSD_OnChange} $Distro OnSelectDistro
  ${NSD_LB_SelectString} $Distro $DistroName   

; ISO Download Option
  ${NSD_CreateCheckBox} 60% 70 40% 15 "Download the ISO (Optional)."
  Pop $DownloadISO
  ${NSD_OnClick} $DownloadISO DownloadIt  
  
; Clickable Link to Distribution Homepage  
  ${NSD_CreateLink} 60% 90 40% 15 "Visit the $OfficialName HomePage"
  Pop $DistroLink
  ${NSD_OnClick} $DistroLink onClickLinuxSite    

; ISO Selection Starts  
  ${NSD_CreateLabel} 0 170 100% 15 $(IsoPage_Text)
  Pop $LabelISOSelection
  ${NSD_CreateText} 0 190 83% 20 "Browse to and select the $FileFormat"
  Pop $ISOFileTxt 
  ${NSD_CreateBrowseButton} 85% 190 60 20 "Browse"
  Pop $ISOSelection 
  ${NSD_OnClick} $ISOSelection ISOBrowse   

; Add Help Link
  ${NSD_CreateLink} 0 215 65% 15 "Click HERE to visit the YUMI page for additional Help!"
  Pop $Link
  ${NSD_OnClick} $LINK onClickMyLink  

;; Add a custom donate button
  ; ${NSD_CreateBitmap} 80% 125 20% 50 "PayPal Donation"
  ; Var /Global Donate
  ; Var /Global DonateHandle  
  ; Pop $Donate
  ; ${NSD_SetImage} $Donate $PLUGINSDIR\paypal.bmp $DonateHandle 
 ; GetFunctionAddress $DonateHandle OnClickDonate
 ; nsDialogs::OnClick $Donate $DonateHandle  
  
; Disable Next Button until a selection is made for all 
  GetDlgItem $6 $HWNDPARENT 1
  EnableWindow $6 0 
; Remove Back Button
  GetDlgItem $6 $HWNDPARENT 3
  ShowWindow $6 0 
; Hide or disable steps until we state to display them 
  EnableWindow $LabelISOSelection 0
  EnableWindow $ISOFileTxt 0
  ShowWindow $ISOSelection 0
  EnableWindow $LinuxDistroSelection 0
  EnableWindow $Distro 0
  EnableWindow $DownloadISO 0
  ShowWindow $DistroLink 0
  ShowWindow $Format 0
  ShowWindow $Uninstaller 0
  nsDialogs::Show 
;;  ${NSD_FreeImage} $DonateHandle
FunctionEnd

; Function OnClickDonate
;   ExecShell "open" "https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=YXUXHZ2Z2KSN2"
; FunctionEnd 

Function InstFiles_PreFunction
  StrCpy $R8 3
FunctionEnd

Function Finish_PreFunction
  StrCpy $R8 4
  Call NoQuit
FunctionEnd

Function ListAllDrives ; Set to Display All Drives
  SendMessage $DestDriveTxt ${CB_RESETCONTENT} 0 0 
  ${NSD_GetState} $AllDriveOption $DisplayAll
  ${If} $DisplayAll == ${BST_CHECKED}
  ${NSD_Check} $AllDriveOption
  ${NSD_SetText} $AllDriveOption "ALL Drives Shown! (BE CAREFUL)" 
    ${GetDrives} "ALL" DrivesList ; All Drives Listed  
  ${ElseIf} $DisplayAll == ${BST_UNCHECKED}
  ${NSD_Uncheck} $AllDriveOption
  ${NSD_SetText} $AllDriveOption "Show ALL Drives? (USE CAUTION)"  
	${GetDrives} "FDD" DrivesList ; FDD+HDD reduced to FDD for removable media only
  ${EndIf}
FunctionEnd

Function onClickMyLink
  Pop $Links ; pop something to prevent corruption
  ExecShell "open" "http://www.pendrivelinux.com/yumi-multiboot-usb-creator/"
FunctionEnd

Function onClickLinuxSite
  Pop $OfficialSite 
  ExecShell "open" "$Homepage"
FunctionEnd

Function DownloadIt ; Set Download Option
  ${NSD_GetState} $DownloadISO $DownloadMe
  ${If} $DownloadMe == ${BST_CHECKED}
  ${NSD_Check} $DownloadISO
  ${NSD_SetText} $DownloadISO "Opted to Download the $SomeFileExt."
  Call DownloadLinks
  ${ElseIf} $DownloadMe == ${BST_UNCHECKED}
  ${NSD_Uncheck} $DownloadISO 
  ${NSD_SetText} $DownloadISO "Download the $SomeFileExt (Optional)." 
  ${EndIf}  
FunctionEnd

Function EnableNext ; Enable Install Button
  ${If} $Blocksize >= 4 
  ${AndIf} $Removal != "Yes"
  ShowWindow $Format 1 
  ${Else}
  ShowWindow $Format 0
  ${EndIf}

  ${If} $Removal != "Yes"    
   ${AndIf} $ISOFileName != ""
    ${AndIf} $ISOFile != ""
     ${AndIf} $DestDrive != "" 
	  ${AndIf} $ISOTest != ""
  StrCpy $InUnStall "Install"	  
  GetDlgItem $6 $HWNDPARENT 1 ; Get "Install" control handle
   SendMessage $6 ${WM_SETTEXT} 0 "STR:Create"
    EnableWindow $6 1 ; Enable "Install" control button

  ${ElseIf} $Removal == "Yes"
   ${AndIf} $ISOFileName != ""
     ${AndIf} $DestDrive != "" 
	  ${AndIf} $ISOTest != ""
  StrCpy $InUnStall "UnInstall"	  
  GetDlgItem $6 $HWNDPARENT 1 ; Get "Install" control handle
   SendMessage $6 ${WM_SETTEXT} 0 "STR:Remove"
    EnableWindow $6 1 ; Enable "Install" control button
  ${EndIf}
  
; Test if ISO has been Selected. If not, disable Install Button
  ${If} $ISOTest == ""
  GetDlgItem $6 $HWNDPARENT 1
  EnableWindow $6 0 ; Disable "Install" if ISO not set 
  ${EndIf}
  
; Show Steps in progression
  ${If} $DestDrive != ""  
  EnableWindow $LinuxDistroSelection 1
  EnableWindow $Distro 1
  ${EndIf}  
  
  ${If} $ISOFileName != "" 
   ${AndIf} $Removal != "Yes"
  EnableWindow $LabelISOSelection 1 
  EnableWindow $ISOFileTxt 1  
  ShowWindow $ISOSelection 1
  
  ${ElseIf} $ISOFileName != "" 
   ${AndIf} $Removal == "Yes"
  EnableWindow $LabelISOSelection 0  
  EnableWindow $ISOFileTxt 0 
  ShowWindow $ISOSelection 0 
  ${EndIf}  
  
; Disable Window if ISO was downloaded
  ${If} $TheISO == "$EXEDIR\$ISOFileName"
  ${AndIf} $ISOTest != ""  
  EnableWindow $ISOSelection 0
  SetCtlColors $ISOFileTxt 009900 FFFFFF  
  ${EndIf}   
FunctionEnd

Function DownloadLinks
MessageBox MB_YESNO|MB_ICONQUESTION "Launch the Download Link?$\r$\nLet the download finish before moving to step 2." IDYES DownloadIt IDNO Skip
  Skip: ; Reset Download Checkbox Options 
  ${NSD_Uncheck} $DownloadISO 
  ${NSD_SetText} $DownloadISO "Download the $FileFormat (Optional)."  
  EnableWindow $DownloadISO 1
  Goto end
  DownloadIt:
  ${NSD_SetText} $LabelISOSelection "Step 3: Once your download has finished, Browse to and select the ISO."  
  EnableWindow $DownloadISO 0
  ExecShell "open" "$DownLink"    
  end:
FunctionEnd

Function LocalISODetected ; The script autodetected the ISO, so let's do the following
 ${If} $DownloadMe != ${BST_CHECKED}
 ${AndIf} $LocalSelection != "Yes"
 StrCpy $ISOFile "$EXEDIR\$ISOFileName"
 ${EndIf}
FunctionEnd

; get only the filename
Function GrabNameOnly
  Exch $4 ; count to get part
  Exch
  Exch $0 ; input string
  Push $1
  Push $2
  Push $3
  StrCpy $1 0
  StrCpy $3 1
  loop:
    IntOp $1 $1 - 1
    StrCpy $2 $0 1 $1
    StrCmp $2 "" exit2
    StrCmp $2 "\" next ; grab text to the right of "\"
    Goto loop
  next:
    StrCmp $3 $4 exit
    IntOp $3 $3 + 1
  Goto loop
  exit2:
    IntOp $1 $1 - 1
  exit:
    IntOp $1 $1 + 1
    StrCpy $0 $0 "" $1
    Pop $3
    Pop $2
    Pop $1
    Exch $0 ; output string
FunctionEnd

 !include StrContains.nsh ; Let's check if a * wildcard exists
 
; On Selection of Linux Distro
Function OnSelectDistro
  Pop $Distro
  ${NSD_LB_GetSelection} $Distro $DistroName ; was ${NSD_GetText} $Distro $DistroName 
  StrCpy $DistroName "$DistroName"   
  Call SetISOFileName
  StrCpy $ISOFileName "$ISOFileName" 
  StrCpy $SomeFileExt "$ISOFileName" "" -3 ; Grabs the last 3 charactors of the filename... zip or iso?
  StrCpy $FileFormat "$SomeFileExt" ; Set filetype to look for zip, tar, iso etc...
  ${NSD_SetText} $LabelISOSelection "Step 3: Browse and Select your $ISOFileName"
  ${NSD_SetText} $ISOFileTxt "Browse to your $ISOFileName  -->" 
  SetCtlColors $ISOFileTxt FF0000 FFFFFF  
  StrCpy $ISOTest "" ; Set to null until a new ISO selection is made

  ${If} $Removal == "Yes"
  StrCpy $ISOTest "$ISOFileName"  
  ${EndIf} 

; Redraw Home page Links as necessary
  ${NSD_SetText} $DistroLink "Visit the $OfficialName Home Page" 
  ShowWindow $DistroLink 0
  ${If} $OfficialName == ""
   ${OrIf} $Removal == "Yes"
  ShowWindow $DistroLink 0
  ${Else}
  ShowWindow $DistroLink 1
  ${EndIf}    
  
; Autodetect ISO's in same folder and select if they exist  
 ${If} ${FileExists} "$EXEDIR\$ISOFileName"
 ${AndIf} $Removal != "Yes"
 ${StrContains} $WILD "*" "$ISOFileName" ; Check for Wildcard and force Browse if * exists.
 ${AndIf} $WILD != "*"  
  StrCpy $TheISO "$EXEDIR\$ISOFileName"
  StrCpy $ISOFile "$TheISO"  
  EnableWindow $DownloadISO 0
  ${NSD_SetText} $DownloadISO "We Found and Selected the $SomeFileExt."    
  EnableWindow $ISOSelection 0 
  SetCtlColors $ISOFileTxt 009900 FFFFFF  
  ${NSD_SetText} $ISOFileTxt $ISOFile 
  ${NSD_SetText} $LabelISOSelection "Step 3 DONE: $ISOFileName Found and Selected!"  
  StrCpy $ISOTest "$TheISO" ; Populate ISOTest so we can enable Next    
  Call EnableNext  
  
 ${ElseIf} ${FileExists} "$EXEDIR\$ISOFileName"
 ${AndIf} $Removal != "Yes"
 ${AndIf} $WILD == "*" 
  EnableWindow $DownloadISO 1
  EnableWindow $ISOSelection 1
  ${NSD_Uncheck} $DownloadISO  
  ${NSD_SetText} $DownloadISO "Download the $SomeFileExt (Optional)."       
  SetCtlColors $ISOFileTxt FF9B00 FFFFFF  
  ${NSD_SetText} $ISOFileTxt "Browse to and select the $ISOFileName" 
  ${NSD_SetText} $LabelISOSelection "Step 3 PENDING: Browse to your $ISOFileName"    
  Call EnableNext  
  
 ${Else}
  Call EnableNext
  EnableWindow $DownloadISO 1
  EnableWindow $ISOSelection 1
  ${NSD_Uncheck} $DownloadISO  
  ${NSD_SetText} $DownloadISO "Download the $SomeFileExt (Optional)."   
 ${EndIf}  
 
 ${If} $DownLink == "NONE"
  ${OrIf} $Removal == "Yes"
  ShowWindow $DownloadISO 0
 ${Else}
  ShowWindow $DownloadISO 1
 ${EndIf}
 
; Warn user if adding a Windows Installer to rename Sources Folder to boot Linux 
;  ${If} $DistroName == "Windows Vista/7 Installer"
;  ${AndIf} $Removal != "Yes"
;  MessageBox MB_ICONQUESTION|MB_OK "After Windows Vista/7 Installer has been added, you must temporarily rename the SOURCES folder found at the root of the USB drive to SOURCESWIN prior to booting Ubuntu or any Ubuntu based distros (like Linux Mint), and rename SOURCESWIN back to SOURCES again prior to booting the Windows Installer.$\r$\n$\r$\nFailure to rename this folder will result in a halted boot condition."
;  ${EndIf}  
  
FunctionEnd 

; On Selection of ISO File
Function ISOBrowse
 nsDialogs::SelectFileDialog open "" $(IsoFile)
 Pop $TheISO  
 ${NSD_SetText} $ISOFileTxt $TheISO
 SetCtlColors $ISOFileTxt 009900 FFFFFF
 EnableWindow $DownloadISO 0
 ${NSD_SetText} $DownloadISO "Local $SomeFileExt Selected." 
 StrCpy $ISOTest "$TheISO" ; Populate ISOTest so we can enable Next 
 StrCpy $ISOFile "$TheISO" 
 StrCpy $LocalSelection "Yes"
 Call EnableNext
FunctionEnd

Function ClearAll
StrCpy $ISOTest ""
StrCpy $DistroName "" ; Clear Distro Name
StrCpy $ISOFileName "" ; Clear ISO Selection
StrCpy $SomeFileExt ""
StrCpy $FileFormat ""
FunctionEnd

; On Selection of Uninstaller Option
Function Uninstall
  ${NSD_GetState} $Uninstaller $Removal
  ${If} $Removal == ${BST_CHECKED}
  ShowWindow $Format 0
    ShowWindow $LabelISOSelection 0 
	Call ClearAll	
    EnableWindow $ISOFileTxt 0
	ShowWindow $ISOFileTxt 0
	ShowWindow $ISOSelection 0
  ${NSD_Check} $Uninstaller 
  StrCpy $Removal "Yes"
  ShowWindow $DistroLink 0
  ShowWindow $DownloadISO 0
   GetDlgItem $6 $HWNDPARENT 1 ; Get "Install" control handle
	SendMessage $6 ${WM_SETTEXT} 0 "STR:Remove"
	EnableWindow $6 0 ; Disable "Install" control button
  ${NSD_SetText} $Uninstaller "You're now in Uninstaller Mode!"
   ${NSD_SetText} $LinuxDistroSelection "Step 2: Select a Distribution from the following Box to remove from $DestDisk"  
    ${NSD_LB_Clear} $Distro "" ; Clear all distro entries because a new option may have been chosen
     Call SomeFiles
	 
  ${ElseIf} $Removal == ${BST_UNCHECKED}
   ShowWindow $Format 1  
    ShowWindow $LabelISOSelection 1 
    ShowWindow $ISOFileTxt 1
	ShowWindow $ISOSelection 0
	Call ClearAll
    ${NSD_SetText} $LabelISOSelection "Step 3: Select your $ISOFileName"
	${NSD_SetText} $ISOFileTxt "Disabled until step 2 is complete"
     GetDlgItem $6 $HWNDPARENT 1 ; Get "Install" control handle
	  SendMessage $6 ${WM_SETTEXT} 0 "STR:Create"
	  EnableWindow $6 0 ; Disable "Install" control button
  ${NSD_Uncheck} $Uninstaller  
  StrCpy $Removal "No"  
  ${NSD_SetText} $Uninstaller "Remove an Installed Item?" 
   ${NSD_SetText} $LinuxDistroSelection "Step 2: Select a Distribution from the following Box to put on $DestDisk" 
    ${NSD_LB_Clear} $Distro "" ; Clear all distro entries because a new option may have been chosen
     Call SomeFiles
  ${EndIf}  
FunctionEnd

; On Selection of USB Drive
Function OnSelectDrive
  Pop $DestDriveTxt
  ${NSD_GetText} $DestDriveTxt $Letters
  StrCpy $DestDrive "$Letters"
  StrCpy $BootDir $DestDrive -1 
  StrCpy $DestDisk $DestDrive -1
  ${NSD_LB_Clear} $Distro "" ; Clear all distro entries because a new drive may have been chosen
  Call SomeFiles
  Call CheckSpace
  Call FormatIt  
  Call EnableNext
  ${If} ${FileExists} $BootDir\menu.lst
  ${AndIf} ${FileExists} $BootDir\syslinux.cfg
  MessageBox MB_ICONQUESTION|MB_OK "It appears MultibootISO's was previously used on this drive? To use YUMI on this device, you must select the option to format the drive."
  ${EndIf}
FunctionEnd

Function DrivesList
 SendMessage $DestDriveTxt ${CB_ADDSTRING} 0 "STR:$9" 
 Push 1 ; must push something - see GetDrives documentation
FunctionEnd

Function FormatYes ; If Format is checked, do something
  ${If} $FormatMe == "Yes"
 
; Close All Open Explorer Windows 
  DetailPrint "Closing All Open Explorer Windows" 
  FindWindow $R0 CabinetWClass
  IsWindow $R0 0 +3
  SendMessage $R0 ${WM_SYSCOMMAND} 0xF060 0
  Goto -3
  
  SetShellVarContext all
  InitPluginsDir
  File /oname=$PLUGINSDIR\fat32format.exe "fat32format.exe"  
  DetailPrint "Formatting $DestDisk as Fat32 using Fat32format.exe"
  nsExec::ExecToLog '"cmd" /c "echo y|$PLUGINSDIR\fat32format -c$BlockSize $DestDisk"' ;/Q /y
  DetailPrint "Creating Label MULTIBOOT on $DestDisk"
  nsExec::ExecToLog '"cmd" /c "LABEL $DestDiskMULTIBOOT"'
  ${Else} 
  DetailPrint "Creating Label MULTIBOOT on $DestDisk"
  nsExec::ExecToLog '"cmd" /c "LABEL $DestDiskMULTIBOOT"'
  ${EndIf} 
FunctionEnd

Function FormatIt ; Set Format Option
  ${NSD_GetState} $Format $FormatMe
  ${If} $FormatMe == ${BST_CHECKED}
  ${NSD_Check} $Format
  StrCpy $FormatMe "Yes"
  ${NSD_SetText} $Format "We Will Fat32 Format $DestDrive Drive!"
    ${NSD_LB_Clear} $Distro "" ; Clear all distro entries because a new format option may have been chosen
	 ShowWindow $Uninstaller 0 ; Disable Uninstaller option because we will be formatting the drive.
    Call SomeFiles
  ${ElseIf} $FormatMe == ${BST_UNCHECKED}
  ${NSD_Uncheck} $Format 
  ${NSD_SetText} $Format "Format $DestDrive Drive (Erase Content)?"  
    ${NSD_LB_Clear} $Distro "" ; Clear all distro entries because a new format option may have been chosen
     ShowWindow $Uninstaller 1 ; Re-enable Uninstaller option.	
    Call SomeFiles
  ${EndIf}  
FunctionEnd

Function CheckSpace ; Check total available space so we can set block size
  Call TotalSpace
  ${If} $1 <= 511
  StrCpy $BlockSize 1
  ${ElseIf} $1 >= 512
  ${AndIf} $1 <= 8191
  StrCpy $BlockSize 4
  ${ElseIf} $1 >= 8192 
  ${AndIf} $1 <= 16383
  StrCpy $BlockSize 8
  ${ElseIf} $1 >= 16384
  ${AndIf} $1 <= 32767
  StrCpy $BlockSize 16
  ${ElseIf} $1 > 32768
  StrCpy $BlockSize 32
  ${EndIf}
 ; MessageBox MB_ICONSTOP|MB_OK "$0 Drive is $1 MB in size, blocksize = $BlockSize KB."  
FunctionEnd

Function TotalSpace
${DriveSpace} "$Letters" "/D=T /S=M" $1 ; used to find total space of select $Letters disk
FunctionEnd

Function FreeDiskSpace
${If} $FormatMe == "Yes"
${DriveSpace} "$BootDir" "/D=T /S=M" $1
${Else}
${DriveSpace} "$BootDir" "/D=F /S=M" $1
${EndIf}
FunctionEnd

Function HaveSpace ; Check space required
  Call FreeDiskSpace
  StrCpy $2 $SizeOfDistro ; Free space required by you (in MB)
  System::Int64Op $1 > $2 ; Compare the space required and the space available
  Pop $3 ; Get the result ...
  IntCmp $3 1 okay ; ... and compare it
  MessageBox MB_ICONSTOP|MB_OK "Oops: There is not enough Free disk space! $1 MB of $2 MB Needed on $BootDir Drive."
  quit ; Close the program if the disk space was too small...
  okay: ; Proceed to execute...
; End space required
FunctionEnd

!macro DeleteMenuEntry file start stop
Push "${FILE}" ; File to search in
Push "${START}$\r$\n" ; text to start deleting from 
Push "${STOP}$\r$\n" ; text to stop at
Call DeleteMenuEntry
!macroend
!define DeleteMenuEntry "!insertmacro DeleteMenuEntry"

; DeleteMenuEntry function is based on RemoveAfterLine function, by Afrow UK http://nsis.sourceforge.net/Delete_lines_from_one_line_to_another_line_inclusive, I (Lance), simply created a macro for it.
Function DeleteMenuEntry
 Exch $1 ;end string
 Exch
 Exch $2 ;begin string
 Exch 2
 Exch $3 ;file
 Exch 2
 Push $R0
 Push $R1
 Push $R2
 Push $R3
  GetTempFileName $R2
  FileOpen $R1 $R2 w
  FileOpen $R0 $3 r
  ClearErrors
  FileRead $R0 $R3
  IfErrors Done
  StrCmp $R3 $2 +3
  FileWrite $R1 $R3
  Goto -5
  ClearErrors
  FileRead $R0 $R3
  IfErrors Done
  StrCmp $R3 $1 +4 -3
  FileRead $R0 $R3
  IfErrors Done
  FileWrite $R1 $R3
  ClearErrors
  Goto -4
Done:
   FileClose $R0
   FileClose $R1
   SetDetailsPrint none
   Delete $3
   Rename $R2 $3
   SetDetailsPrint both
 Pop $R3
 Pop $R2
 Pop $R1
 Pop $R0
 Pop $3
 Pop $2
 Pop $1
FunctionEnd

; Custom Distros Installer - Uninstaller Include
!include "InstallDistro.nsh" ; ##################################### ADD NEW DISTRO ########################################
!include "RemoveDistro.nsh" ; ##################################### ADD NEW DISTRO ########################################

Function DoSyslinux ; Install Syslinux on USB
  IfFileExists "$BootDir\multiboot\ldlinux.sys" SkipSyslinux CreateSyslinux
  CreateSyslinux:
  CreateDirectory $BootDir\multiboot\menu ; create the directory structure if it doesn't exist
  CreateDirectory $BootDir\multiboot\ISOS ; create ISOS folder
  DetailPrint $(ExecuteSyslinux)
  ExecWait '$PLUGINSDIR\syslinux.exe -maf -d /multiboot $BootDir' $R8
  DetailPrint "Syslinux Errors $R8"
  Banner::destroy
  ${If} $R8 != 0
  MessageBox MB_ICONEXCLAMATION|MB_OK $(WarningSyslinux)
  ${EndIf} 
  SkipSyslinux: 
  DetailPrint $(SkipSyslinux)
  
  ${If} ${FileExists} $BootDir\multiboot\syslinux.cfg  
  DetailPrint "A Previous MultiBoot Installation was detected... proceeding to add your new selections."
  Call AddDir
  ${Else}
; Create and Copy files to your destination
  DetailPrint "Adding remaining files to the $BootDir\multiboot directory..." 
  CopyFiles "$PLUGINSDIR\syslinux.cfg" "$BootDir\multiboot\syslinux.cfg"
  CopyFiles "$PLUGINSDIR\yumi.png" "$BootDir\multiboot\yumi.png"
  CopyFiles "$PLUGINSDIR\YUMI-Copying.txt" "$BootDir\multiboot\YUMI-Copying.txt" 
  CopyFiles "$PLUGINSDIR\YUMI-Readme.txt" "$BootDir\multiboot\YUMI-Readme.txt" 
  CopyFiles "$PLUGINSDIR\license.txt" "$BootDir\multiboot\license.txt"   
  CopyFiles "$PLUGINSDIR\vesamenu.c32" "$BootDir\multiboot\vesamenu.c32"
  CopyFiles "$PLUGINSDIR\chain.c32" "$BootDir\multiboot\chain.c32"
  CopyFiles "$PLUGINSDIR\memdisk" "$BootDir\multiboot\memdisk"   
  Call AddDir    
  ${EndIf}   
FunctionEnd

Function AddDir ; changes to check if user had a version prior to 0.0.0.3 which now includes grub.exe 
  ${IfNotThen} ${FileExists} "$BootDir\multiboot\grub.exe" 'CopyFiles "$PLUGINSDIR\grub.exe" "$BootDir\multiboot\grub.exe"' 
 ; Windows/Ubuntu SOURCES conflict fix
  ${IfNot} ${FileExists} $BootDir\.disk\info 
  CreateDirectory $BootDir\.disk 
  CopyFiles "$PLUGINSDIR\info" "$BootDir\.disk\info"
  ${EndIf} 
FunctionEnd

; ---- Let's Do Stuff ----
Section  ; This is the only section that exists
; Get just the name of the ISO file 
Push "$ISOFile"
Push 1
Call GrabNameOnly
Pop $NameThatISO

 ${If} ${FileExists} "$BootDir\windows\system32" ; additional safeguard to protect from potential user ignorance. 
 MessageBox MB_ICONSTOP|MB_OK "ABORTING! ($DestDisk) contains a WINDOWS/SYSTEM32 Directory."
 Quit
 ${EndIf}
 
 ${If} $FormatMe == "Yes" 
 MessageBox MB_YESNO|MB_ICONEXCLAMATION "${NAME} is Ready to perform the following actions:$\r$\n$\r$\n1. Close Open Explorer Windows - Allows ($DestDisk) to be Fat32 Formatted!$\r$\n$\r$\n2. Fat32 Format ($DestDisk) - All Data will be Irrecoverably Deleted!$\r$\n$\r$\n3. Create a Syslinux MBR on ($DestDisk) - Existing MBR will be Overwritten!$\r$\n$\r$\n4. Create MULTIBOOT Label on ($DestDisk) - Existing Label will be Overwritten!$\r$\n$\r$\n5. Install ($DistroName) on ($DestDisk)$\r$\n$\r$\nAre you absolutely positive Drive ($DestDisk) is your USB Device?$\r$\nDouble Check with Windows (My Computer) to make sure!$\r$\n$\r$\nClick YES to perform these actions on ($DestDisk) or NO to Abort." IDYES proceed
 Quit
 ${ElseIf} $FormatMe != "Yes" 
 ${AndIfNot} ${FileExists} $BootDir\multiboot\syslinux.cfg
 MessageBox MB_YESNO|MB_ICONEXCLAMATION "${NAME} is Ready to perform the following actions:$\r$\n$\r$\n1. Create a Syslinux MBR on ($DestDisk) - Existing MBR will be Overwritten!$\r$\n$\r$\n2. Create MULTIBOOT Label on ($DestDisk) - Existing Label will be Overwritten!$\r$\n$\r$\n3. Install ($DistroName) on ($DestDisk)$\r$\n$\r$\nAre you absolutely positive Drive ($DestDisk) is your USB Device?$\r$\nDouble Check with Windows (My Computer) to make sure!$\r$\n$\r$\nClick YES to perform these actions on ($DestDisk) or NO to Abort." IDYES proceed
 Quit
 ${EndIf}

proceed: 
 ${IfThen} $Removal == "Yes" ${|} Goto removeonly ${|}
 Call HaveSpace ; Got enough Space? Lets Check!
 Call FormatYes ; Format the Drive?
 Call DoSyslinux ; Run Syslinux on the Drive to make it bootable
 Call LocalISODetected
 
; Copy the config file if it doesnt exist and create the entry in syslinux.cfg 
 ${IfNot} ${FileExists} "$BootDir\multiboot\menu\$Config2Use" 
 CopyFiles "$PLUGINSDIR\$Config2Use" "$BootDir\multiboot\menu\$Config2Use"
 Call Config2Write
 ${EndIf} 
 
removeonly:
 ${If} $Removal != "Yes"
 !insertmacro Install_Distros 
 ${ElseIf} $Removal == "Yes"
 !insertmacro Uninstall_Distros 
 ${EndIf}
 
SectionEnd

Function Config2Write
 ${If} $Config2Use == "linux.cfg"
  ${WriteToSysFile} "label Linux Distributions$\r$\nmenu label Linux Distributions ->$\r$\nMENU INDENT 1$\r$\nkernel vesamenu.c32$\r$\nAPPEND /multiboot/menu/linux.cfg" $R0 
 ${ElseIf} $Config2Use == "system.cfg"
  ${WriteToSysFile} "label System Tools$\r$\nmenu label System Tools ->$\r$\nMENU INDENT 1$\r$\nkernel vesamenu.c32$\r$\nAPPEND /multiboot/menu/system.cfg" $R0
 ${ElseIf} $Config2Use == "antivirus.cfg"
  ${WriteToSysFile} "label Antivirus Tools$\r$\nmenu label Antivirus Tools ->$\r$\nMENU INDENT 1$\r$\nkernel vesamenu.c32$\r$\nAPPEND /multiboot/menu/antivirus.cfg" $R0 
 ${ElseIf} $Config2Use == "netbook.cfg"
  ${WriteToSysFile} "label Netbook Distributions$\r$\nmenu label Netbook Distributions ->$\r$\nMENU INDENT 1$\r$\nkernel vesamenu.c32$\r$\nAPPEND /multiboot/menu/netbook.cfg" $R0 
 ${ElseIf} $Config2Use == "other.cfg"
  ${WriteToSysFile} "label Other Operating Systems and Tools$\r$\nmenu label Other Operating Systems and Tools ->$\r$\nMENU INDENT 1$\r$\nkernel vesamenu.c32$\r$\nAPPEND /multiboot/menu/other.cfg" $R0 
 ${ElseIf} $Config2Use == "menu.lst"
  ${WriteToSysFile} "label Directly Bootable ISOs$\r$\nmenu label Directly Bootable ISOs ->$\r$\nMENU INDENT 1$\r$\nKERNEL /multiboot/grub.exe$\r$\nAPPEND --config-file=/multiboot/menu/menu.lst" $R0 
  CopyFiles "$PLUGINSDIR\yumi.xpm.gz" "$BootDir\multiboot\menu\yumi.xpm.gz" 
 ${EndIf} 
FunctionEnd

Function NoQuit
MessageBox MB_YESNO "Would you like to add more ISOs/Distros Now?" IDYES noskip
    StrCmp $R8 3 0 End ;Compare $R8 variable with current page #
    StrCpy $R9 1 ; Goes to finish page
    Call RelGotoPage
    Abort
noskip:
StrCpy $Removal ""
StrCpy $NameThatISO "" ; Reset NameThatISO ISO Name
StrCpy $Config2Use "" ; Clear Config File to create and write to
StrCpy $DistroName "" ; Clear Distro Name
StrCpy $ISOFileName "" ; Clear ISO Selection
StrCpy $FileFormat "" ; Clear File Format
StrCpy $DownloadMe 0 ; Ensure Uncheck of Download Option
StrCpy $LocalSelection "" ; Reset Local Selection
StrCpy $FormatMe "" ; Reset Format Option
    StrCmp $R8 4 0 End ;Compare $R8 variable with current page #
    StrCpy $R9 -3 ; Goes back to selections page
    Call RelGotoPage ; change pages
    Abort
End:
FunctionEnd

Function RelGotoPage
  IntCmp $R9 0 0 Move Move
    StrCmp $R9 "X" 0 Move
      StrCpy $R9 "120"
Move:
  SendMessage $HWNDPARENT "0x408" "$R9" ""
FunctionEnd

; --- Stuff to do at startup of script ---
Function .onInit
;StrCpy $InstallButton ""
 StrCpy $FileFormat "ISO"
 userInfo::getAccountType
 Pop $Auth
 strCmp $Auth "Admin" done
 Messagebox MB_OK|MB_ICONINFORMATION "Currently you're trying to run this program as: $Auth$\r$\n$\r$\nYou must run this program with administrative rights...$\r$\n$\r$\nRight click the file and select Run As Administrator or Run As (and select an administrative account)!"
 Abort
 done:
 SetShellVarContext all
 InitPluginsDir
  File /oname=$PLUGINSDIR\paypal.bmp "paypal.bmp"   
  File /oname=$PLUGINSDIR\syslinux.exe "syslinux.exe"  
  File /oname=$PLUGINSDIR\syslinux.cfg "syslinux.cfg"
  File /oname=$PLUGINSDIR\menu.lst "menu.lst" 
  File /oname=$PLUGINSDIR\yumi.xpm.gz "yumi.xpm.gz" 
  File /oname=$PLUGINSDIR\grub.exe "grub.exe"  
  File /oname=$PLUGINSDIR\info "menu\info"   
  File /oname=$PLUGINSDIR\antivirus.cfg "menu\antivirus.cfg" 
  File /oname=$PLUGINSDIR\system.cfg "menu\system.cfg" 
  File /oname=$PLUGINSDIR\netbook.cfg "menu\netbook.cfg"
  File /oname=$PLUGINSDIR\linux.cfg "menu\linux.cfg" 
  File /oname=$PLUGINSDIR\other.cfg "menu\other.cfg"   
  File /oname=$PLUGINSDIR\liveusb "liveusb"   
  File /oname=$PLUGINSDIR\7zG.exe "7zG.exe"
  File /oname=$PLUGINSDIR\7z.dll "7z.dll"  
  File /oname=$PLUGINSDIR\yumi.png "yumi.png"
  File /oname=$PLUGINSDIR\YUMI-Copying.txt "YUMI-Copying.txt" 
  File /oname=$PLUGINSDIR\YUMI-Readme.txt "YUMI-Readme.txt" 
  File /oname=$PLUGINSDIR\license.txt "license.txt"   
  File /oname=$PLUGINSDIR\vesamenu.c32 "vesamenu.c32"  
  File /oname=$PLUGINSDIR\memdisk "memdisk" 
  File /oname=$PLUGINSDIR\chain.c32 "chain.c32" 
FunctionEnd