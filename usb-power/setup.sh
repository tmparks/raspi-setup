#!/bin/sh

echo copying executable files

alias cp="sudo cp --backup=numbered"
cp usb-power.sh /usr/local/sbin/

echo setup complete
