#!/bin/bash
######## FIND AVAILABLE USB DRIVES ########
for LIST in `ls -H /dev/disk/by-id/usb* | grep part[1-9]`
do
  DRIVE=`readlink -e $LIST`
  LABLE=`ls -lQ /dev/disk/by-label | grep $(echo $DRIVE  | cut -c 6-9) | cut -d "\"" -f2`
#  UUID=`ls -lQ /dev/disk/by-uuid | grep $(echo $DRIVE  | cut -c 6-9) | cut -d "\"" -f2`
  echo "$DRIVE, $LABLE"
done >> ~/.yumi/USB_DETECTION.txt
