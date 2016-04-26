#!/bin/sh

# Exit if software installation fails
sudo apt-get install tightvncserver || exit

echo Enter a password for the VNC server
vncpasswd

chmod 755 vncserver xstartup
sudo cp --backup=numbered vncserver /etc/init.d
cp --backup=numbered xstartup $HOME/.vnc

sudo update-rc.d lightdm remove
sudo update-rc.d vncserver defaults

echo setup complete
