YUMI (Your Universal Multiboot Installer) ©2011-2013 Lance http://www.pendrivelinux.com (covered under GNU GPL License) - see YUMI-Copying

Background of YUMI (Your Universal Multiboot Installer):

YUMI is an easy to use installer script created using NSIS. YUMI's purpose is to help automate the creation of a bootable USB Flash Drive that can be used to boot multiple Linux based distributions (one at a time).
The end result should be a bootable USB Flash drive that will get you up and running with your chosen Live Distributions, all without having to do the research and perform the steps by hand. 
My work consists of creating/maintaining the YUMI scripts, initial creation/changes and continued maintenance of the menu entries, adding suggested entries, and testing to make sure the distributions boot.  

How YUMI Works:

YUMI utilizes a Syslinux MBR to make the chosen drive bootable. Distributions are extracted using 7zip to the multiboot folder on the USB device, and a custom syslinux.cfg file along with distro independant configuration files are used to boot each distribution. Grub4DOS grub.exe may also be used to boot ISO files directly. 

Credits, Resources, and Third Party Tools used:

* Remnants of Cedric Tissieres's Tazusb.exe for Slitaz (slitaz@objectif-securite.ch) may reside in the YUMI script, as it was derived from UUI, which was inspired by Tazusb.exe. 
* Created with NSIS Installer © Contributors http://nsis.sourceforge.net (needed to compile the YUMI.nsi script)  
* Syslinux © H. Peter Anvin http://syslinux.zytor.com (unmodified binary used)
* grub.exe Grub4DOS © the Gna! people + Chenall https://code.google.com/p/grub4dos-chenall/ (unmodified binary used) : Official Grub4DOS: http://gna.org/projects/grub4dos/
* 7-Zip is © Igor Pavlovis http://7-zip.org (unmodified binaries were used)
* Fat32format.exe © Tom Thornhill Ridgecorp Consultants http://www.ridgecrop.demon.co.uk (unmodified binary used)
* Firadisk.img © Panot Joonkhiaw Karyonix http://reboot.pro/8804/

Additional instructions for YUMI can be found HERE: http://www.pendrivelinux.com/yumi-multiboot-usb-creator/

Changelog:

11/13/13 Version 1.9.9.5B: Add WifiSlax. Thanks to Geminis Demon for helping finish the entry!
11/12/13 Version 1.9.9.5: Added provision to ensure menu.32 exists. Fixed Falcon4 and Hiren menu creation.
11/11/13 Version 1.9.9.4: Added Persistent Option for Ubuntu and some Derivatives. Fix Kon-Boot free entry. Switch to AutoDetect Size of ISO.
11/08/13 Version 1.9.9.3: Add Liberte Linux. Fixed a menu scrolling bug (vesamenu.c32 incompatible with boot.msg?) that occurred with distros like Puppy and KNOPPIX
11/07/13 Version 1.9.9.2: Add support for TAILS, and Ultimate Boot CD
11/05/13 Version 1.9.9.1: Quick fix to support older versions of Knoppix
11/04/13 Version 1.9.9.0: Beta release of YUMI version 2