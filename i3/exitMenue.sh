#!/bin/bash
while [ "$select" != "BACK" -a "$select" != "LOGOUT" -a "$select" != "POWEROFF" -a "$select" != 'REBOOT' ]; do
    select=$(echo -e 'BACK\nLOGOUT\nPOWEROFF\nREBOOT' |
        dmenu -nb '#151515' -nf '#999999' -sb '#f00060' -sf '#000000' -fn '-*-*-medium-r-normal-*-*-*-*-*-*-100-*-*' -i -p "        WHAT DO YOU WANT?")
done

case $select in
    'LOGOUT')   i3-msg exit ;;
    'POWEROFF') shutdown -h now ;;
    'REBOOT')   reboot ;;
esac

