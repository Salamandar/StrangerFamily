#!/bin/bash -xe
ScriptDir="$(dirname $(readlink -f $0))"

# Download links:
readonly ArchLinuxARM_dl_host='http://os.archlinuxarm.org/os'
readonly ArchLinuxARM_dl_rpi1='ArchLinuxARM-rpi-latest.tar.gz'
readonly ArchLinuxARM_dl_rpi2='ArchLinuxARM-rpi-2-latest.tar.gz'
readonly ArchLinuxARM_dl_rpi3='ArchLinuxARM-rpi-3-latest.tar.gz'

# Please select the correct image here:
readonly ArchLinuxARM_image="${ArchLinuxARM_dl_rpi1}"

# readonly WorkingDirectory="${ScriptDir}/working"
readonly WorkingDirectory="${ScriptDir}/../working"
mkdir "${WorkingDirectory}" -p
cd "${WorkingDirectory}"

readonly ArchLinuxARM_downurl="${ArchLinuxARM_dl_host}/${ArchLinuxARM_image}"
readonly ArchLinuxARM_imgfile="${ArchLinuxARM_image}"


downloadImage() {
  if [[ ! -f "${ArchLinuxARM_imgfile}" ]]; then
    wget "${ArchLinuxARM_downurl}" -O "${ArchLinuxARM_imgfile}"
  fi
}

extractImage() {
  # Keep the latest working directory to prevent some cries
  if [[ -d "root" ]]; then
    rm -rf        "root_latest"
    mv    "root"  "root_latest"
  fi
  mkdir "root"

  bsdtar -xpf "${ArchLinuxARM_imgfile}" -C "root"
}


downloadQemu() {
  hash "apt-get" && apt-get install qemu-arm-static
  hash "yaourt"  && sudo -u $SUDO_USER yaourt -S --noconfirm --needed binfmt-support-git qemu-arm-static arch-install-scripts
  hash "trizen"  && sudo -u $SUDO_USER trizen -S --noconfirm --needed binfmt-support-git qemu-arm-static arch-install-scripts
  update-binfmts --importdir /usr/lib/binfmt.d/ --enable arm
}

cleanupInstall() {
  umount "${WorkingDirectory}/root_bind" --force || true
  rmdir  "${WorkingDirectory}/root_bind" || true

  rm -rf "${WorkingDirectory}/root/repository" || true
}

prepareInstall() {
  # Install qemu into the chroot
  cp $(which qemu-arm-static) "root/usr/bin"

  # Allow access from chroot to our repository
  cp -Tr "${ScriptDir}" "root/repository"
  trap 'cleanupInstall' EXIT

  # Workaround if this is / is not a key
  mkdir -p "root_bind"
  mount --bind "root" "root_bind"
  arch-chroot "root_bind" /usr/bin/qemu-arm-static /usr/bin/bash "/repository/archlinux_prepare_intochroot.sh"
  umount "root_bind"
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

  mkdir -p          "mount_boot"
  mount "${Disk}1"  "mount_boot"
  mkdir -p          "mount_root"
  mount "${Disk}2"  "mount_root"

  rsync -aAXv "root/boot/"*  "mount_boot"
  rsync -aAXv "root/"*       "mount_root"
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
downloadQemu
extractImage
prepareInstall

if [[ "${NO_COPY_SCRIPT}" == "no" ]]; then
  Disk="$1"
  prepareDisk
  copyToDisk
fi
