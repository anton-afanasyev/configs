#!/bin/bash

sudo ln -fs `realpath symbols/my` /usr/share/X11/xkb/symbols/my
#ln -fs `realpath .` ~/.config/xkb

# Also, one should manually add "my:main = +my(main)" to "! option = symbols" section
# in `/usr/share/X11/xkb/rules/evdev` file (as well as description to `/usr/share/X11/xkb/rules/evdev.lst`)


# gsettings get org.gnome.desktop.input-sources xkb-options
gsettings set org.gnome.desktop.input-sources xkb-options "['my:main']"

sudo rm -rf /var/lib/xkb/*.xkm

# This doesn't work permanently on Ubuntu 14.04 (resetting after layout change)
# setxkbmap -symbols my -print | sudo xkbcomp -I"$HOME/.config/xkb" - "${DISPLAY%%.*}"

# Useful links:
# http://habrahabr.ru/post/222285/#comment_7586289
# http://askubuntu.com/questions/501659/how-to-swap-command-and-control-keys-with-xkb-step-by-step
# http://superuser.com/questions/116376/can-i-swap-the-ctrl-and-alt-in-kde
# http://onedev.net/post/478
# http://askubuntu.com/questions/363075/xmodmap-doesnt-work-for-two-layouts/405553#405553
