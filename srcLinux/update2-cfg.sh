#!/bin/bash
# Contributed by Ian Bruce 
# Edited and added more distribution support by Lance for use with YUMI + corrected append paths to be / instead of // 
# parameters:
#
# $1 - distribution type/name
#
# $2 - directory to operate on (optional)
#
# $LOADER_PREFIX

PRO_DIR=~/.yumi
USB_MOUNT="$(cat < ~/.yumi/usb-mount)"
DISTRONAME="$(cat < ~/.yumi/distro-name)"
USB_UUID="$(cat < ~/.yumi/usb-uuid)"
USB_LABEL="$(cat < ~/.yumi/usb-label)"
KERNEL_PREFIX=/yumi/$DISTRONAME
LOADER_PREFIX=/yumi/$DISTRONAME
distrofind="$(cat < $PRO_DIR/distro.txt)"
DIRPREFIX=/yumi/$DISTRONAME

PATH=/bin:/usr/bin

distro=$1
 
dir=$2

[ "$distro" ] || exit

[ "$dir" ] && { cd "$dir" || exit ; }
 
script()
{
  for s in "${sedcmd[@]}"
  do
    echo "$s"
  done
}

common=(
  's:(dir|file|root)=/:\1=\\:ig'
  "s:([ \t=,])/:\1${LOADER_PREFIX}/:ig"
  's:(dir|file|root)=\\:\1=/:ig'
  "s|loop=|loop=${KERNEL_PREFIX}/|ig"
  "s|source=cd|source=usb|ig"
  "s|livecd=livecd|livecd=${KERNEL_PREFIX}/livecd fromusb|ig"
)


case $distro in

parted-magic)

  sedcmd=(
    "${common[@]}"
    "/append/I s|$| directory=${KERNEL_PREFIX}/|ig"
  ) ;;

fedora)

  sedcmd=(
    "${common[@]}"
    's/ root=[^[:space:]]*//ig'
    "/initrd=/I s|$| live_dir=${KERNEL_PREFIX}/LiveOS root=UUID=${USB_UUID}|ig"
  ) ;;

systemrescuecd)

  sedcmd=(
    "${common[@]}"
    "/append/I s|$| subdir=${KERNEL_PREFIX}/|ig"
  ) ;;

archisolabel)

  sedcmd=(
    "${common[@]}"
    's/ archisobasedir=[^[:space:]]*//gi'
    "s|archisolabel=|archisodevice=/dev/disk/by-uuid/${USB_UUID} archisolabel=|ig"
    's/ archisolabel=[^[:space:]]*//gi'
    "s|archisodevice=|archisobasedir=${DIRPREFIX}/arch archisodevice=|ig"
  ) ;;

chakraisolabel)

  sedcmd=(
    "${common[@]}"
    's/ chakraisobasedir=[^[:space:]]*//gi'
    "s|chakraisolabel=|chakraisodevice=/dev/disk/by-uuid/${USB_UUID} chakraisolabel=|ig"
    's/ chakraisolabel=[^[:space:]]*//gi'
    "s|chakraisodevice=|chakraisobasedir=${DIRPREFIX}/chakra chakraisodevice=|ig"
  ) ;;

misolabel)

  sedcmd=(
    "${common[@]}"
    's/ misobasedir=[^[:space:]]*//gi'
    "s|misolabel=|misodevice=/dev/disk/by-uuid/${USB_UUID} misolabel|ig"
    's/ misolabel=[^[:space:]]*//gi'
    "s|misodevice=|misobasedir=${DIRPREFIX}/manjaro misodevice=|ig"
  ) ;;

porteus)

  sedcmd=(
    "${common[@]}"
    "s|initrd=|from=${KERNEL_PREFIX}/porteus fromusb initrd=|ig"
  ) ;;

slax)

  sedcmd=(
    "${common[@]}"
    "s|initrd=|from=${KERNEL_PREFIX}/slax fromusb initrd=|ig"
  ) ;;

wifislax)

  sedcmd=(
    "${common[@]}"
    "s|initrd=|from=${KERNEL_PREFIX}/Wifislax fromusb initrd=|ig"
  ) ;;

slack)

  sedcmd=(
    "${common[@]}"
    "/append/I s|$| from=${KERNEL_PREFIX}/Wifislax fromusb|ig"
  ) ;;

wifiway)

  sedcmd=(
    "${common[@]}"
    "s|initrd=|from=${KERNEL_PREFIX}/wifiway fromusb initrd=|ig"
  ) ;;

SL-Live)

  sedcmd=(
    "${common[@]}"
    "s|initrd=|sgnfile=${KERNEL_PREFIX}/livecd.sgn from=${KERNEL_PREFIX}/ fromusb initrd=|ig"
  ) ;;

SLAMPP)

  sedcmd=(
    "${common[@]}"
    "s|initrd=|slax from=${KERNEL_PREFIX}/ fromusb initrd=|ig"
  ) ;;

antix)

  sedcmd=(
    "${common[@]}"
    "s|initrd=|image_dir=${KERNEL_PREFIX}/antiX initrd=|ig"
  ) ;;

pclinuxos)

  sedcmd=(
    "${common[@]}"
#    "/append/I s|$| fromusb|ig"
  ) ;;

gentoo)

  sedcmd=(
    "${common[@]}"
    's/ cdroot_type[^[:space:]]*//ig'
    "s|looptype=squashfs|looptype=squashfs subdir=${KERNEL_PREFIX}|ig"

  ) ;;

knoppix)

  sedcmd=(
    "${common[@]}"
    "s|initrd=|knoppix_dir=${KERNEL_PREFIX}/KNOPPIX initrd=|ig"
  ) ;;

finnix)

  sedcmd=(
    "${common[@]}"
    "s|initrd=|finnix_dir=${KERNEL_PREFIX}/finnix initrd=|ig"
  ) ;;

debian)

  sedcmd=(
    "${common[@]}"
    "s|boot=live|boot=live ignore_bootid live-media-path=${KERNEL_PREFIX}/live|ig"
  ) ;;

slitaz)
sedcmd=(
    "${common[@]}"
  ) ;;

puppy)
sedcmd=(
    "${common[@]}"
  ) ;;

sms)
sedcmd=(
    "${common[@]}"
    "s|initrd=|from=${KERNEL_PREFIX}/ fromusb initrd=|ig"
  ) ;;

ubuntu)

  sedcmd=(
    "${common[@]}"
    "s|boot=casper|boot=casper cdrom-detect/try-usb=true floppy.allowed_drive_mask=0 ignore_uuid ignore_bootid root=UUID=${USB_UUID} live-media-path=${KERNEL_PREFIX}/casper|ig"
    "s|file=/cdrom|file=/cdrom${KERNEL_PREFIX}|ig"
  ) ;;

ubuntuserver)

  sedcmd=(
    "${common[@]}"
    "s|file=/cdrom|cdrom-detect/try-usb=true floppy.allowed_drive_mask=0 ignore_uuid ignore_bootid root=UUID=${USB_UUID} file=/cdrom${KERNEL_PREFIX}|ig"
  ) ;;

*)

  sedcmd=(
    "${common[@]}"
  ) ;;

esac


#cat <(script)
SCRIPT=$(mktemp) ; script >$SCRIPT
find . -iname \*.cfg -exec sed -ri -f $SCRIPT {} \;
rm $SCRIPT

