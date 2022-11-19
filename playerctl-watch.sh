#!/bin/bash

gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type "suspend"
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type "suspend"

function restore()
{
    echo "Interrupt signal received, restoring default settings..."
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type "suspend"
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type "suspend"
    echo "Restored, exiting..."
}
trap restore exit
suspend_enabled=1




while true; do
    playerctl_status=$(playerctl status)
    if [[ "$playerctl_status" == 'Playing' ]] && [[ $suspend_enabled -eq 1 ]]
    then
        echo "Audio playing was detected, suspend disabled"
        suspend_enabled=0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type "nothing"
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type "nothing"
    elif [[ "$playerctl_status" != "Playing" ]] && [[ $suspend_enabled -eq 0 ]]
    then
        echo "Suspend enabled"
        suspend_enabled=1
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type "suspend"
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type "suspend"
    fi
    sleep 60
done
