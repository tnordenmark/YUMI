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
 !insertmacro FileNames "Linux Mint 13 KDE 32bit" multiboot\mintkde1332\casper\vmlinuz 
 !insertmacro FileNames "Linux Mint 13 KDE 64bit" multiboot\mintkde1364\casper\vmlinuz  
 !insertmacro FileNames "Linux Mint 13 XFCE 32bit" multiboot\mintxfce1332\casper\vmlinuz  
 !insertmacro FileNames "Linux Mint 13 XFCE 64bit" multiboot\mintxfce1364\casper\vmlinuz 
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
 !insertmacro FileNames "Ubuntu 12.10 Daily Build" multiboot\ubuntu1210\casper\vmlinuz    
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
 !insertmacro FileNames "Ubuntu 12.10 amd64 Daily Build" multiboot\ubuntu121064\casper\vmlinuz    
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
	
 !insertmacro FileNames "AntiX" multiboot\antix\antiX\vmlinuz 	
 !insertmacro FileNames "Archlinux" multiboot\archlinux\arch\boot\i686\archiso.img
 !insertmacro FileNames "Bodhi" multiboot\bodhi\casper\vmlinuz	
 !insertmacro FileNames "CAELinux (Computer Aided Engineering)" multiboot\caelinux\casper\vmlinuz	 
 !insertmacro FileNames "CentOS" multiboot\centos\LiveOS\squashfs.img 
 !insertmacro FileNames "CentOS 64bit" multiboot\centos64\LiveOS\squashfs.img  
 !insertmacro FileNames "Crunchbang 10" multiboot\crunchbang\live\vmlinuz1    
 !insertmacro FileNames "Damn Small Linux (DSL)" multiboot\dsl\boot\isolinux\linux24 
; REVISIT !insertmacro FileNames "Dreamlinux" multiboot\dreamlinux\boot\vmlinuz  
 !insertmacro FileNames "Fuduntu" multiboot\fuduntu\isolinux\vmlinuz0
 !insertmacro FileNames "gpxe (Net Bootable Distros)" multiboot\gpxe.lkrn
 !insertmacro FileNames "KNOPPIX 6.7.1 CD" multiboot\knoppix6\KNOPPIX  
 !insertmacro FileNames "KNOPPIX 7 DVD" multiboot\knoppix\KNOPPIX  
 !insertmacro FileNames "KXStudio 12.04" multiboot\KXStudio1204\casper\vmlinuz 
 !insertmacro FileNames "Mandriva 2011" multiboot\mandriva\LiveOS\squashfs.img 
 !insertmacro FileNames "Netrunner" multiboot\netrunner\casper\vmlinuz 
 !insertmacro FileNames "OSGeo Live" multiboot\osgeo\casper\vmlinuz 
; REVISIT !insertmacro FileNames "MultiCore" multiboot\multicore\boot\microcore.gz 
 !insertmacro FileNames "PCLinuxOS" multiboot\pclos\isolinux\vmlinuz 
 !insertmacro FileNames "Peppermint One" multiboot\pmint\casper\vmlinuz  
 !insertmacro FileNames "Peppermint Two" multiboot\pmint2\casper\vmlinuz  
 !insertmacro FileNames "Peppermint Three" multiboot\pmint3\casper\vmlinuz   
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
 !insertmacro FileNames "HP Automatic Firmware Update 10.10 (DVD)" multiboot\HP\fwdvd10\system\initrd.img 

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
 !insertmacro SetISOFileNames "AntiX" antiX-12-486.iso "http://sourceforge.net/projects/antix-linux/files/Final/antiX-12-486.iso/download" antiX-12-486.iso "698" linux.cfg multiboot\antix\antiX\vmlinuz "http://sourceforge.net/projects/antix-linux/" "AntiX"   
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
 !insertmacro SetISOFileNames "HP Automatic Firmware Update 10.10 (DVD)" firmware-10.10*.zip "ftp://ftp.hp.com/pub/softlib2/software1/cd/p1040529012/v71197/firmware-10.10-0.zip" firmware-10.10-0.zip "1400" other.cfg multiboot\HP\fwdvd10\system\initrd.img "http://h20000.www2.hp.com/bizsupport/TechSupport/SoftwareDescription.jsp?swItem=MTX-9ed665a89aba447d925937f38b" "HP Tools"

 !insertmacro SetISOFileNames "Sugar on a Stick" Fedora-14-i686-Live-SoaS.iso "http://download.fedoraproject.org/pub/alt/spins/linux/releases/14/Spins/i686/Fedora-14-i686-Live-SoaS.iso" Fedora-14-i686-Live-SoaS.iso "477" linux.cfg multiboot\sos\isolinux\vmlinuz0 "http://wiki.sugarlabs.org/go/Sugar_on_a_Stick" "Sugar On A Stick"
 !insertmacro SetISOFileNames "Rip Linux (Recovery Distro)" RIPLinuX*.iso "http://www.tux.org/pub/people/kent-robotti/looplinux/rip/" RIPLinuX.iso "110" system.cfg multiboot\rip\boot\rootfs.cgz "http://www.tux.org/pub/people/kent-robotti/looplinux/rip/" "RIP Linux"
 !insertmacro SetISOFileNames "KNOPPIX 6.7.1 CD" KNOPPIX_V6.7.1CD-*.iso "ftp://mirrors.kernel.org/knoppix-dvd/CD/KNOPPIX_V6.7.1CD-2011-09-14-EN.iso" KNOPPIX_V6.7.1CD.iso "700" linux.cfg multiboot\knoppix6\KNOPPIX "http://knopper.net" "KNOPPIX"
 !insertmacro SetISOFileNames "KNOPPIX 7 DVD" KNOPPIX_V7.0*.iso "http://ftp.knoppix.nl/os/Linux/distr/knoppix/DVD/KNOPPIX_V7.0.2DVD-2012-05-30-EN.iso" KNOPPIX_V7.iso "4084" linux.cfg multiboot\knoppix\KNOPPIX "http://knopper.net" "KNOPPIX"
 !insertmacro SetISOFileNames "Ultimate Boot CD (Diagnostics Tools)" ubcd5*.iso "http://lug.mtu.edu/ubcd/ubcd511.iso" multiboot\ISOS\ubcd.iso "360" system.cfg multiboot\ISOS\ubcd.iso "http://www.ultimatebootcd.com" "Ultimate Boot CD"
 !insertmacro SetISOFileNames "Ophcrack (no tables)" ophcrack-notables-livecd-3.4.0.iso "http://sourceforge.net/projects/ophcrack/files/ophcrack-livecd/3.4.0/ophcrack-notables-livecd-3.4.0.iso/download" ophcrack-notables-livecd-3.4.0.iso "47" system.cfg multiboot\ophcracknt\boot\rootfs.gz "http://ophcrack.sourceforge.net" "Ophcrack"
 !insertmacro SetISOFileNames "Ophcrack XP (Password Finder)" ophcrack-xp-livecd-3.4.0.iso "http://downloads.sourceforge.net/ophcrack/ophcrack-xp-livecd-3.4.0.iso" ophcrack-xp-livecd-3.4.0.iso "425" system.cfg multiboot\ophcrack\boot\rootfs.gz "http://ophcrack.sourceforge.net" "Ophcrack"
 !insertmacro SetISOFileNames "Ophcrack Vista/7 (Password Finder)" ophcrack-vista-livecd-3.4.0.iso "http://downloads.sourceforge.net/ophcrack/ophcrack-vista-livecd-3.4.0.iso" ophcrack-vista-livecd-3.4.0.iso "506" system.cfg multiboot\ophcrackvista\boot\rootfs.gz "http://ophcrack.sourceforge.net" "Ophcrack" 
 !insertmacro SetISOFileNames "YlmF OS (Looks like Windows)" Ylmf_OS_3.0.iso "http://down.ylmf.org/Ylmf_OS_3.0.iso" Ylmf_OS_3.0.iso "678" linux.cfg multiboot\YLMF\casper\vmlinuz "http://www.ylmf.org" "YLMF"
 !insertmacro SetISOFileNames "Ubuntu Rescue Remix (System Rescue)" ubuntu-rescue-remix-10-04.iso "http://ubuntu-rescue-remix.org/files/URR/iso/ubuntu-rescue-remix-10-04.iso" ubuntu-rescue-remix-10-04.iso "171" system.cfg multiboot\URR\casper\vmlinuz "http://ubuntu-rescue-remix.org" "URR"
 !insertmacro SetISOFileNames "Deft 7 (Forensics)" deft*7.1.iso "ftp://ftp.cc.uoc.gr/mirrors/linux/deftlinux/deft7.1.iso" deft7.1.iso "2432" system.cfg multiboot\deft\casper\vmlinuz "http://www.deftlinux.net/" "Deft"
 !insertmacro SetISOFileNames "Matriux (Penetration Testing)" Matriux-Krypton*.iso "http://sourceforge.net/projects/matriux/files/matriux-krypton-v1-2/Matriux-Krypton-v1.2.iso/download" Matriux.iso "2217" system.cfg multiboot\matriux\live\vmlinuz "http://www.matriux.com" "Matriux"
 !insertmacro SetISOFileNames "Pear Linux" comice_os*.iso "http://sourceforge.net/projects/pearoslinux/files/latest/download" comice_os.iso "1122" linux.cfg multiboot\pear\casper\vmlinuz "http://pear-os-linux.fr/" "Pear Linux"
 !insertmacro SetISOFileNames "Liberte (Anonymous Browsing)" liberte-2012.2.zip "http://sourceforge.net/projects/liberte/files/2012.2/liberte-2012.2.zip/download" Liberte.zip "219" linux.cfg multiboot\liberte\liberte\boot\syslinux\isolinux.cfg "http://dee.su/liberte" "Liberte"

 !insertmacro SetISOFileNames "Fuduntu" Fuduntu-2012.1-i686-LiveDVD.iso "http://sourceforge.net/projects/fuduntu/files/latest/download" fuduntu.iso "894" linux.cfg multiboot\fuduntu\isolinux\vmlinuz0 "http://www.fuduntu.org/" "Fuduntu"
 !insertmacro SetISOFileNames "KXStudio 12.04" KXStudio_12.04*.iso "http://superb-sea2.dl.sourceforge.net/project/kxstudio/Live/KXStudio_12.04-LiveDVD_32bit.iso" KXStudio.iso "1632" linux.cfg multiboot\KXStudio1204\casper\vmlinuz "http://kxstudio.sourceforge.net/Main_Page" "KXStudio"
 !insertmacro SetISOFileNames "Ubuntu 12.10 Daily Build" quantal-desktop-i386.iso "http://cdimage.ubuntu.com/daily-live/current/quantal-desktop-i386.iso" quantal-desktop-i386.iso "744" linux.cfg multiboot\ubuntu1210\casper\vmlinuz "http://cdimage.ubuntu.com/daily-live/current/" "Ubuntu 12.10"
 !insertmacro SetISOFileNames "Ubuntu 12.10 amd64 Daily Build" quantal-desktop-amd64.iso "http://cdimage.ubuntu.com/daily-live/current/quantal-desktop-amd64.iso" quantal-desktop-amd64.iso "755" linux.cfg multiboot\ubuntu121064\casper\vmlinuz "http://cdimage.ubuntu.com/daily-live/current/" "Ubuntu 12.10"

 !insertmacro SetISOFileNames "Ubuntu 12.04" ubuntu-12.04*desktop-i386.iso "http://releases.ubuntu.com/precise/ubuntu-12.04.1-desktop-i386.iso" ubuntu-12.04.1-desktop-i386.iso "701" linux.cfg multiboot\ubuntu1204\casper\vmlinuz "http://ubuntu.com" "Ubuntu"
 !insertmacro SetISOFileNames "Ubuntu 12.04 DVD" ubuntu-12.04*dvd-i386.iso "http://cdimage.ubuntu.com/releases/precise/release/ubuntu-12.04.1-dvd-i386.iso" ubuntu-12.04.1-dvd-i386.iso "1500" linux.cfg multiboot\ubuntu1204dvd\casper\vmlinuz "http://ubuntu.com" "Ubuntu"
 !insertmacro SetISOFileNames "Ubuntu 12.04 DVD amd64" ubuntu-12.04*dvd-amd64.iso "http://cdimage.ubuntu.com/releases/precise/release/ubuntu-12.04.1-dvd-amd64.iso" ubuntu-12.04.1-dvd-amd64.iso "1500" linux.cfg multiboot\ubuntu1204dvd64\casper\vmlinuz "http://ubuntu.com" "Ubuntu"

 !insertmacro SetISOFileNames "Xubuntu 12.04" xubuntu-12.04*desktop-i386.iso "http://cdimage.ubuntu.com/xubuntu/releases/12.04.1/release/xubuntu-12.04.1-desktop-i386.iso" xubuntu-12.04-desktop-i386.iso "680" linux.cfg multiboot\xubuntu1204\casper\vmlinuz "http://xubuntu.org" "Xubuntu"
 !insertmacro SetISOFileNames "Kubuntu 12.04" kubuntu-12.04*desktop-i386.iso "http://cdimage.ubuntu.com/kubuntu/releases/12.04.1/release/kubuntu-12.04.1-desktop-i386.iso" kubuntu-12.04-desktop-i386.iso "698" linux.cfg multiboot\kubuntu1204\casper\vmlinuz "http://kubuntu.org" "Kubuntu"
 !insertmacro SetISOFileNames "Kubuntu 12.04 DVD" kubuntu-12.04*dvd-i386.iso "http://cdimage.ubuntu.com/kubuntu/releases/precise/release/kubuntu-12.04-dvd-i386.iso" kubuntu-12.04-dvd-i386.iso "3300" linux.cfg multiboot\kubuntu1204dvd\casper\vmlinuz "http://kubuntu.org" "Kubuntu"
 !insertmacro SetISOFileNames "Kubuntu 12.04 DVD amd64" kubuntu*12.04-dvd-amd64.iso "http://cdimage.ubuntu.com/kubuntu/releases/precise/release/kubuntu-12.04-dvd-amd64.iso" kubuntu-12.04-dvd-amd64.iso "3200" linux.cfg multiboot\kubuntu1204dvd64\casper\vmlinuz "http://kubuntu.org" "Kubuntu"

 !insertmacro SetISOFileNames "Lubuntu 12.04" lubuntu-12.04*desktop-i386.iso "http://cdimages.ubuntu.com/lubuntu/releases/12.04/release/lubuntu-12.04-desktop-i386.iso" lubuntu-12.04-desktop-i386.iso "688" linux.cfg multiboot\lubuntu1204\casper\vmlinuz "http://lubuntu.net" "Lubuntu" 
 !insertmacro SetISOFileNames "Mythbuntu 12.04" mythbuntu-12.04*desktop-i386.iso "http://cdimage.ubuntu.com/mythbuntu/releases/12.04.1/release/mythbuntu-12.04.1-desktop-i386.iso" mythbuntu-12.04-desktop-i386.iso "667" linux.cfg multiboot\mythbuntu1204\casper\vmlinuz "http://www.mythbuntu.org" "Mythbuntu"
 !insertmacro SetISOFileNames "Ubuntu Server 12.04" ubuntu-12.04*server-i386.iso "http://releases.ubuntu.com/precise/ubuntu-12.04.1-server-i386.iso" ubuntu-12.04-server-i386.iso "672" linux.cfg multiboot\ubuntuserv1204\install\vmlinuz "http://ubuntu.com" "Ubuntu"
 !insertmacro SetISOFileNames "Ubuntu Server 12.04 amd64" ubuntu-12.04*server-amd64.iso "http://releases.ubuntu.com/precise/ubuntu-12.04.1-server-amd64.iso" ubuntu-12.04-server-amd64.iso "673" linux.cfg multiboot\ubuntuserv120464\install\vmlinuz "http://ubuntu.com" "Ubuntu"
 !insertmacro SetISOFileNames "Edubuntu 12.04" edubuntu-12.04*dvd-i386.iso "http://cdimage.ubuntu.com/edubuntu/releases/12.04.1/release/edubuntu-12.04.1-dvd-i386.iso" edubuntu-12.04-dvd-i386.iso "2723" linux.cfg multiboot\edubuntu1204\casper\vmlinuz "http://edubuntu.org" "Edubuntu" 
 !insertmacro SetISOFileNames "Edubuntu 12.04 amd64" edubuntu-12.04*dvd-amd64.iso "http://cdimage.ubuntu.com/edubuntu/releases/12.04.1/release/edubuntu-12.04*dvd-amd64.iso" edubuntu-12.04-dvd-amd64.iso "2742" linux.cfg multiboot\edubuntu120464\casper\vmlinuz "http://edubuntu.org" "Edubuntu" 

 !insertmacro SetISOFileNames "Ubuntu Studio 12.04" ubuntustudio-12.04*dvd-i386.iso "http://cdimage.ubuntu.com/ubuntustudio/releases/12.04.1/release/ubuntustudio-12.04.1-dvd-i386.iso" ubuntustudio-12.04-dvd-i386.iso "1949" linux.cfg multiboot\ubuntustud1204\casper\vmlinuz "http://ubuntustudio.org" "Ubuntu Studio" 
 !insertmacro SetISOFileNames "Ubuntu Studio 12.04 amd64" ubuntustudio-12.04*dvd-amd64.iso "http://cdimage.ubuntu.com/ubuntustudio/releases/12.04.1/release/ubuntustudio-12.04.1-dvd-amd64.iso" ubuntustudio-12.04-dvd-amd64.iso "2018" linux.cfg multiboot\ubuntustud120464\casper\vmlinuz "http://ubuntustudio.org" "Ubuntu Studio" 
 
 !insertmacro SetISOFileNames "Xubuntu 12.04 amd64" xubuntu-12.04*desktop-amd64.iso "http://cdimage.ubuntu.com/xubuntu/releases/12.04.1/release/xubuntu-12.04.1-desktop-amd64.iso" xubuntu-12.04-desktop-amd64.iso "680" linux.cfg multiboot\xubuntu120464\casper\vmlinuz "http://xubuntu.org" "Xubuntu"
 !insertmacro SetISOFileNames "Kubuntu 12.04 amd64" kubuntu-12.04*desktop-amd64.iso "http://cdimage.ubuntu.com/kubuntu/releases/12.04.1/release/kubuntu-12.04.1-desktop-amd64.iso" kubuntu-12.04-desktop-amd64.iso "698" linux.cfg multiboot\kubuntu120464\casper\vmlinuz "http://kubuntu.org" "Kubuntu"
 !insertmacro SetISOFileNames "Lubuntu 12.04 amd64" lubuntu-12.04*desktop-amd64.iso "http://cdimages.ubuntu.com/lubuntu/releases/12.04/release/lubuntu-12.04-desktop-amd64.iso" lubuntu-12.04-desktop-amd64.iso "688" linux.cfg multiboot\lubuntu120464\casper\vmlinuz "http://lubuntu.net" "Lubuntu" 
 
 !insertmacro SetISOFileNames "Mythbuntu 12.04 amd64" mythbuntu-12.04*desktop-amd64.iso "http://cdimage.ubuntu.com/mythbuntu/releases/12.04.1/release/mythbuntu-12.04.1-desktop-amd64.iso" mythbuntu-12.04-desktop-amd64.iso "697" linux.cfg multiboot\mythbuntu120464\casper\vmlinuz "http://www.mythbuntu.org/" "Mythbuntu" 
 !insertmacro SetISOFileNames "Ubuntu 12.04 amd64" ubuntu-12.04*desktop-amd64.iso "http://releases.ubuntu.com/precise/ubuntu-12.04.1-desktop-amd64.iso" ubuntu-12.04-desktop-amd64.iso "698" linux.cfg multiboot\ubuntu120464\casper\vmlinuz "http://ubuntu.com" "Ubuntu"
 
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
 
 !insertmacro SetISOFileNames "Samurai-WTF" samurai-0.9.5.iso "http://sourceforge.net/projects/samurai/files/samurai/samurai-0.9.5/samurai-0.9.5.iso/download" samurai-0.9.5.iso "1410" linux.cfg multiboot\samurai\casper\vmlinuz "http://samurai.inguardians.com/" "Samurai"

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
 !insertmacro SetISOFileNames "Linux Mint 13 KDE 32bit" linuxmint-13-kde-dvd-32bit.iso "http://mirror.yellowfiber.net/linuxmint/stable/13/linuxmint-13-kde-dvd-32bit.iso" linuxmint-13-kde-dvd-32bit.iso "915" linux.cfg multiboot\mintkde1332\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint"
 !insertmacro SetISOFileNames "Linux Mint 13 XFCE 32bit" linuxmint-13-xfce-dvd-32bit.iso "http://linuxfreedom.com/linuxmint/linuxmint.com/stable/13/linuxmint-13-xfce-dvd-32bit.iso" linuxmint-13-xfce-dvd-32bit.iso "811" linux.cfg multiboot\mintxfce1332\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint"
 !insertmacro SetISOFileNames "Linux Mint 13 KDE 64bit" linuxmint-13-kde-dvd-64bit.iso "http://mirror.yellowfiber.net/linuxmint/stable/13/linuxmint-13-kde-dvd-64bit.iso" linuxmint-13-kde-dvd-64bit.iso "915" linux.cfg multiboot\mintkde1364\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint"
 !insertmacro SetISOFileNames "Linux Mint 13 XFCE 64bit" linuxmint-13-xfce-dvd-64bit.iso "http://linuxfreedom.com/linuxmint/linuxmint.com/stable/13/linuxmint-13-xfce-dvd-64bit.iso" linuxmint-13-xfce-dvd-64bit.iso "811" linux.cfg multiboot\mintxfce1364\casper\vmlinuz "http://www.linuxmint.com" "Linux Mint"

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
 !insertmacro SetISOFileNames "Peppermint Three" Peppermint-3*.iso "http://peppermintos.info/dl1/Peppermint-3-20120722-i386.iso" Peppermint-3.iso "532" linux.cfg multiboot\pmint3\casper\vmlinuz "http://peppermintos.com" "Peppermint"

 !insertmacro SetISOFileNames "Netrunner" netrunner4*.iso "http://www.netrunner-os.com/wp-content/plugins/download-monitor/download.php?id=15" netrunner.iso "1141" linux.cfg multiboot\netrunner\casper\vmlinuz "http://www.netrunner-os.com" "Netrunner"
 !insertmacro SetISOFileNames "OSGeo Live" osgeo-live*.iso "http://download.osgeo.org/livedvd/release/5.5/osgeo-live-5.5.iso" osgeo.iso "4566" linux.cfg multiboot\osgeo\casper\vmlinuz "http://live.osgeo.org" "OSGeo Live"

 !insertmacro SetISOFileNames "EasyPeasy (NetBook Distro)" EasyPeasy-1.6.iso "http://sourceforge.net/projects/ubuntu-eee/files/EasyPeasy/EasyPeasy-1.6.iso/download" EasyPeasy-1.6.iso "839" netbook.cfg multiboot\easypeasy\casper\vmlinuz "http://www.geteasypeasy.com" "EasyPeasy"
 !insertmacro SetISOFileNames "EEEBuntu (NetBook Distro)" eeebuntu-3.0.1-nbr.iso "http://eeebuntu.virginmedia.com/Eeebuntu%203.0%20Editions/eeebuntu-3.0.1-nbr.iso" eeebuntu-3.0.1-nbr.iso "860" netbook.cfg multiboot\eeebuntu\casper\vmlinuz "http://www.eeebuntu.org" "EEEBuntu"
 !insertmacro SetISOFileNames "xPUD (Netbook Distro)" xpud-0.9.2.iso "http://xpud.googlecode.com/files/xpud-0.9.2.iso" xpud-0.9.2.iso "64" netbook.cfg multiboot\xpud\boot\xpud "http://www.xpud.org" "xPud"
 !insertmacro SetISOFileNames "SLAX (Tiny Slackware Based Distro)" slax-6.1.2.tar "http://www.slax.org/get_slax.php?download=tar" slax-6.1.2.tar "200" linux.cfg multiboot\Slax612\boot\vmlinuz "http://slax.org" "SLAX"
 !insertmacro SetISOFileNames "Porteus" porteus*.iso "http://www.ponce.cc/porteus/i486/current/" porteus.iso "300" linux.cfg multiboot\porteus\boot\vmlinuz "https://porteus.org/" "Porteus"
 !insertmacro SetISOFileNames "Dreamlinux" DL3.5*.iso "ftp://ftp.nluug.nl/pub/os/Linux/distr/dreamlinux/stable/DL3.5_20092802.iso" DL3.5.iso "700" linux.cfg multiboot\dreamlinux\boot\vmlinuz "http://www.dreamlinux.net/" "Dreamlinux"
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
 !insertmacro SetISOFileNames "DBAN (Hard Drive Nuker)" dban-2.2.6_i586.iso "http://sourceforge.net/projects/dban/files/dban/dban-2.2.6/dban-2.2.6_i586.iso/download" dban-2.2.6_i586.iso "2" system.cfg multiboot\DBAN\DBAN.BZI "http://www.dban.org" "DBAN"
 !insertmacro SetISOFileNames "DRBL (Diskless Remote Boot in Linux)" drbl-live*.iso "http://sourceforge.net/projects/drbl/files/drbl_live_stable/1.0.5-6/drbl-live-xfce-1.0.5-6-i686.iso/download" drbl-live*.iso "394" system.cfg multiboot\DRBL\live\vmlinuz "http://drbl.sourceforge.net" "DRBL"
 !insertmacro SetISOFileNames "XBMC" xbmc*.iso "http://mirrors.xbmc.org/releases/live/xbmc-10.1-live.iso" xbmc.iso "420" linux.cfg multiboot\xbmc\live\vmlinuz "http://xbmc.org/" "XBMC"
 !insertmacro SetISOFileNames "XBMCbuntu" xbmcbuntu*.iso "http://mirrors.xbmc.org/releases/XBMCbuntu/xbmcbuntu-11.0.iso" xbmcbuntu.iso "623" linux.cfg multiboot\xbmcbuntu\casper\vmlinuz "http://xbmc.org/" "XBMC"
 
 !insertmacro SetISOFileNames "Try an Unlisted ISO" *.iso "NONE" "" "1" menu.lst "" "" "" 
 !insertmacro SetISOFileNames "Try an Unlisted ISO (Run from RAM)" *.iso "NONE" "" "1" menu.lst "" "" ""  
 
 ; ##################################### ADD NEW DISTRO ########################################
FunctionEnd