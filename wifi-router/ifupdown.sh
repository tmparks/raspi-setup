#!/bin/sh

# Start/stop DHCP server after WiFi interface is brought up/down
if [ "$IFACE" = "wlan0" ]
then
	service isc-dhcp-server "$MODE"
fi
