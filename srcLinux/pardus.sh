#!/bin/bash
mkdir  ~/.yumi/pardus
#cp ~/.yumi/live/boot/initrd ~/.yumi/pardus
#cp ~/.yumi/live/boot/initrd ~/.yumi/pardus
cd ~/.yumi/pardus
gzip -dc ~/.yumi/initrd | cpio -imvd --no-absolute-filenames
cat <<EOF>> ~/.yumi/pardus/etc/initramfs.conf
root=UUID=`cat ~/.yumi/uuid`
liveroot=UUID=`cat ~/.yumi/uuid`
EOF
find . | cpio -o -H newc | gzip -9 | tee ~/.yumi/initrd1
cd -
rm -R ~/.yumi/pardus
