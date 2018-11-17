#!/bin/bash -xe
ScriptDir="$(dirname $(readlink -f $0))"

readonly WorkingDirectory="${ScriptDir}/../working"
mkdir "${WorkingDirectory}" -p
cd "${WorkingDirectory}"



img_url='https://geekolloc.fr/nextcloud/index.php/s/B764iTP3xR8zqgE/download'
readonly ArchLinuxARM_imgfile='arch_stranger_things.tar.bz2'

downloadImage() {
  if [[ ! -f "${ArchLinuxARM_imgfile}" ]]; then
    wget "${img_url}" -O "${ArchLinuxARM_imgfile}"
  fi
}

prepareDisk() {
  # Umount…
  umount -f ${Disk}? || /bin/true
  sync ; sleep 1

  # Create /boot (100M), / (the rest)
  (
    echo o
    echo n ; echo p ; echo 1 ; echo ; echo +100M
    echo t ; echo c
    echo n ; echo p ; echo 2 ;  echo ; echo

    echo w ;
  ) | fdisk "${Disk}"
  sync ; sleep 1

  mkfs.vfat    "${Disk}1"
  sync ; sleep 1
  mkfs.ext4 -F "${Disk}2"
  sync ; sleep 1
}


copyToDisk() {
  # Umount…
  umount -f ${Disk}? || /bin/true

  mkdir -p          "mount_root"
  mount "${Disk}2"  "mount_root"
  mkdir -p          "mount_root/boot"
  mount "${Disk}1"  "mount_root/boot"

  bsdtar -xpf "${ArchLinuxARM_imgfile}" -C "mount_root"
  sync ; sleep 1

  umount "mount_boot" "mount_root"
  sync ; sleep 1
}



# Check if launched with sudo
if [[ -z "$SUDO_USER" ]]; then
  set +x
  echo "#########################################"
  echo "This script should be executed with sudo."
  echo "#########################################"
  exit 1
fi

# Check if we should copy to disk
: ${NO_COPY_SCRIPT:=yes}

if [[ "${NO_COPY_SCRIPT}" == "yes" ]]; then
  set +x
  echo "#########################################"
  echo "Testing mode ; Disk will no be written."
  echo "#########################################"

  prompt_confirm() {
    while true; do
      read -r -n 1 -p "${1:-Continue?} [y/n]: " REPLY
      case $REPLY in
        [yY]) echo ; return 0 ;;
        [nN]) echo ; return 1 ;;
        *) printf " \033[31m %s \n\033[0m" "invalid input"
      esac
    done
  }

  prompt_confirm "Continue ?" || exit 1
  set -x
fi


downloadImage

if [[ "${NO_COPY_SCRIPT}" == "no" ]]; then
  Disk="$1"
  prepareDisk
  copyToDisk
fi
