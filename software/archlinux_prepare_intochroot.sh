#!/bin/bash -ex

updateSystem() {
    pacman -Syuu --noconfirm
    pacman -S    --noconfirm --needed sudo git base-devel
}

# Create non-root user
createUser() {
    useradd --create-home mike
    # passwd mike
}
asMike() { sudo -u mike -s -- $@; }

# Install AUR helper
installTrizen() {
    cd /tmp
    asMike git clone https://aur.archlinux.org/trizen.git
    cd trizen
    # Install missing dependencies as root
    (source PKGBUILD && pacman -S --noconfirm --needed --asdeps "${makedepends[@]}" "${depends[@]}")
    # makepkg cannot be run as root
    asMike makepkg
    pacman -U --noconfirm ./trizen-*.pkg.tar.*
}


installRpiWs281x() {
    pacman -S --noconfirm --needed python python-setuptools scons swig
    asMike git clone https://github.com/jgarff/rpi_ws281x
    cd rpi_ws281x
    asMike scons
    cd python
    python setup.py install

}

installI2c() {
    pacman -S --noconfirm --needed i2c-tools lm_sensors

    # Reboot-persistent
    echo "i2c-bcm2708"  >> /etc/modules-load.d/raspberrypi.conf
    echo "i2c-dev"      >> /etc/modules-load.d/raspberrypi.conf
    # For now:
    modprobe "i2c-bcm2708"
    modprobe "i2c-dev"
}




updateSystem
createUser

installTrizen
installRpiWs281x
installI2c

bash
