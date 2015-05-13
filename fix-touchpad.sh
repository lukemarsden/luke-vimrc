#!/bin/sh
synclient TapButton3=2
synclient RTCornerButton=0
synclient RBCornerButton=0
synclient LTCornerButton=0
synclient LBCornerButton=0
gsettings set org.gnome.settings-daemon.plugins.cursor active false
sudo iwconfig wlan0 power off
