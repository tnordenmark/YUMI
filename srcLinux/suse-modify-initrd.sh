#!/bin/bash
# Credit goes to Multisystem project.
mkdir ~/.yumi/suse
cd ~/.yumi/suse
gzip -dc ~/.yumi/initrd | cpio -imvd --no-absolute-filenames
sed -i "s@\tsearchImageHybridMedia@\tcddev=\"/dev/disk/by-uuid/$(cat ~/.yumi/uuid)\"\n\tcdopt=\"-t vfat\"@" ~/.yumi/suse/include
sed -i "s@searchImageISODevice@[ ! -d \"/cdrom\" ]@" ~/.yumi/suse/init
sed -i "s@\tkiwiMount \"\$biosBootDevice\" \"/cdrom\" \"-o ro\" 1>\&2@\tmkdir -p /cdrom\n\tbiosBootDevice=\"/dev/disk/by-uuid/$(cat ~/.yumi/uuid)\"\n\tkiwiMount \"\$biosBootDevice\" \"/cdrom\" \"-o ro\" 1>\&2\n\tsleep 2\n\tkiwiMount \"\$biosBootDevice\" \"/cdrom\" \"-o ro\" 1>\&2\n\techo \"Debug MS: \$(mount | grep cdrom)\"@" ~/.yumi/suse/init
find . | cpio -o -H newc | gzip -9 | tee ~/.yumi/initrd-mod
cd -
rm -R ~/.yumi/suse
exit
