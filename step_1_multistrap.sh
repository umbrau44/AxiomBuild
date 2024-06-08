#!/bin/sh


BUILD="arm"
ARCH="armhf"
CONF="multistrap-axiomair-pi3.conf"
if [ -f ./Volumio.sqsh ];
then
	mv ./Volumio.sqsh ./Volumio.sqsh.old
fi
mkdir -p "build/$BUILD/root/etc/apt/apt.conf.d/"
cp -r /etc/apt/trusted.gpg* build/$BUILD/root/etc/apt

multistrap -a "$ARCH" -f "$CONF"

cp /usr/bin/qemu-arm-static "build/$BUILD/root/usr/bin/"


