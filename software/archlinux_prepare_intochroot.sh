#!/bin/bash -ex

# Update system
pacman -Syuu --noconfirm
pacman -S    --noconfirm --needed sudo git base-devel

# Create non-root user
useradd --create-home mike
# passwd mike
asMike() { sudo -u mike -s -- $@; }

cd /tmp

# Install AUR helper
asMike git clone https://aur.archlinux.org/trizen.git
cd trizen
# Install missing dependencies as root
(source PKGBUILD && pacman -S --noconfirm --needed --asdeps "${makedepends[@]}" "${depends[@]}")
# makepkg cannot be run as root
asMike makepkg
pacman -U --noconfirm ./trizen-*.pkg.tar.*



# Install led strip library
pacman -S --noconfirm --needed python python-setuptools scons swig
asMike git clone https://github.com/jgarff/rpi_ws281x
cd rpi_ws281x
asMike scons
cd python
python setup.py install


bash
