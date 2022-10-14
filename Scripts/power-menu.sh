#!/bin/bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

# Available Styles
# >> Styles Below Only Works With "rofi-git(AUR)", Current Version: 1.5.4-76-gca067234
# full     full_circle     full_rounded     full_alt
# card     card_circle     column     column_circle
# row     row_alt     row_circle
# single     single_circle     single_full     single_full_circle     single_rounded     single_text

style="power"
rofi_command="rofi -theme ~/.config/rofi/powermenu.rasi"
uptime=$(uptime -p)
my_hostname=$(hostname)

# Options
shutdown=" Shutdown"
reboot=" Reboot"

# Variable passed to rofi
options="$shutdown\n$reboot"

chosen="$(echo -e "$options" | $rofi_command -p " $my_hostname | $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        sudo shutdown -h now
	;;
    $reboot)
        sudo shutdown -r now
        ;;
esac
