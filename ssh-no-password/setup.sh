#!/bin/sh

echo verifying authorized_keys configuration

if [ ! -s $HOME/.ssh/authorized_keys ]
then
	echo "no authorized keys found!"
	exit 1
fi

echo copying configuration files

alias cp="sudo cp --backup=numbered"
cp sshd_config /etc/ssh

echo setup complete
