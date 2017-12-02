#!/bin/zsh -xe

syntax() {
  echo "$0 disk image.tar.gz"
}

if [[ $# != 2 ]]; then
  syntax
  exit 1
fi

Disk="$1"
File="$2"

umount -f ${Disk}? || /bin/true
sync

(
echo o
echo n ; echo p ; echo 1 ; echo ; echo +100M
echo t ; echo c
echo n ; echo p ; echo 2 ;  echo ; echo

echo w ;
) | fdisk ${Disk}
sync

mkfs.vfat    ${Disk}1
mkfs.ext4 -F ${Disk}2
sync

mkdir -p root boot
mount ${Disk}1 boot
mount ${Disk}2 root
sync

bsdtar -xpf ${File} -C root
sync
mv root/boot/* boot
sync

umount boot
umount root
sync
