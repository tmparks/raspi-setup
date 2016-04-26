#!/bin/sh

echo installing software

sudo apt-get install \
	hostapd \
	isc-dhcp-server \
	iptables-persistent \
	|| exit	# exit if installation fails

echo copying configuration files

alias cp="sudo cp --backup=numbered"
cp sysctl.conf /etc
cp hostapd isc-dhcp-server /etc/default
cp dhcpd.conf /etc/dhcp
cp hostapd.conf /etc/hostapd
cp rules.v4 /etc/iptables
cp interfaces /etc/network

echo configuring services

sudo update-rc.d hostapd enable
sudo update-rc.d isc-dhcp-server enable

FILE=/etc/hostapd/hostapd.conf
echo
echo WiFi network $(egrep '^ssid=' $FILE)
echo WiFi password $(egrep '^wpa_passphrase=' $FILE)
echo edit $FILE to modify
echo

echo setup complete
