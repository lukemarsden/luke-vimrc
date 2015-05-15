#!/bin/sh
synclient TapButton3=2
synclient RTCornerButton=0
synclient RBCornerButton=0
synclient LTCornerButton=0
synclient LBCornerButton=0
sudo iwconfig wlan0 power off
gsettings set org.gnome.settings-daemon.plugins.cursor active false
gsettings set org.gnome.desktop.a11y.keyboard bouncekeys-enable true
gsettings set org.gnome.desktop.a11y.keyboard bouncekeys-delay 50
syndaemon -i 0.2 -k -R
