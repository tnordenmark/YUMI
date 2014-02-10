#!/bin/bash
PATH=/bin:/usr/bin
# WRITTEN BY IAN BRUCE AND EDITED BY SUNDAR FOR MULTIBOOTUSB
# Path changed and additional editing done by Lance for YUMI
# LICENCE - GPL
##### UPDATE DISTRO CFG FILE(S) #####
#!/bin/bash

ISO_MOUNT=~/.yumi/live/
PRO_DIR=~/.yumi

typeset -A DISTRONAMES

DISTRONAMES=(
[pmagic]=parted-magic
[archisolabel]=archisolabel
[chakraisolabel]=chakraisolabel
[misolabel]=misolabel
#[install]=ubuntu
[ubuntu-server.seed]=ubuntu
[boot=live]=debian
[root=live:CDLABEL]=fedora
[redhat]=redhat
[suse]=suse
[opensuse]=opensuse
[slitaz]=slitaz
[ophcrack]=slitaz
[systemrescuecd]=systemrescuecd
[tinycore]=slitaz
[xpud]=slitaz
[rescue.cpi]=slitaz
[Untangle]=slitaz
[boot=casper]=ubuntu
[slax]=slax
[porteus]=porteus
[Wifislax]=wifislax
[antix]=antiX
[livecd=livecd]=PCLinuxOS
[looptype=squashfs]=gentoo
[knoppix]=knoppix
[finnix]=finnix
[sms]=sms
[wifiway]=wifiway
[unity]=PCLinuxOS
#[slack]=slack
[4mlinux]=slitaz
[partition wizard]=slitaz
[ripLinux]=slitaz
[vector]=sms
[autoexec]=sms
[puppy]=SLAMPP
[lebel dummy]=slitaz
)


MATCH=''

for distro in "${!DISTRONAMES[@]}"
do
  [ "$MATCH" ] && MATCH="${MATCH}|${distro}" || MATCH="${distro}"
done


CONFIG=$(find $ISO_MOUNT -iname \*.cfg)

[ "$CONFIG" ] || exit


distro=$(

  sed -nr "s/(${MATCH})/\n\1\n/igp" $CONFIG |

    sed -nr "/^(${MATCH})$/Ip" |

      tr '[:upper:]' '[:lower:]' |

        sort |

          uniq -c |

            sort -nr |

              head -n1 |

                sed -r 's/^ *[0-9]+ *//'

)


[ "$distro" ] || exit

#echo ${DISTRONAMES[$distro] > $PRO_DIR/distro.txt
echo ${DISTRONAMES[$distro]}
