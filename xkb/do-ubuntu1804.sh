#!/bin/bash

# Tweaking Caps and Shift-Caps input source stateless switching
# (see here: https://askubuntu.com/questions/1123163/modeless-stateless-layout-language-switching-with-caps-lock-again-18-04-lts-bi)
# This could require scanning your system codes!
sudo apt install xbindkeys

cat > ~/.xbindkeysrc <<EOF
"gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.gnome.Shell.Eval "imports.ui.status.keyboard.getInputSourceManager().inputSources[0].activate()""
m:0x2 + c:66

"gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.gnome.Shell.Eval "imports.ui.status.keyboard.getInputSourceManager().inputSources[1].activate()""
m:0x3 + c:66
EOF
# (the codes `m:0x2 + c:66` and `m:0x3 + c:66` are scanned using
# `xbindkeys --key` command and pushing 'Caps' and 'Shift+Caps')

xbindkeys --poll-rc

# see `dconf-editor` for the tree of gnome settings
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:none', 'altwin:ctrl_alt_win', 'ctrl:swap_lalt_lctl', 'ctrl:rctrl_ralt']"
gsettings set org.gnome.settings-daemon.media-keys.terminal "'<Alt>t'"
