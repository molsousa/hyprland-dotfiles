tar xvf Simp1e-Tokyo-Night.tar.gz -C ~/.local/share/icons

sudo nvim /etc/environment

sudo nvim /etc/alternatives/x-cursor-theme

gsettings set org.gnome.desktop.interface cursor-theme "cursor_theme"
gsettings set org.gnome.desktop.interface cursor-size 24

sudo nvim ~/.icons/default/index.theme

flatpak override --user --filesystem=~/.local/share/icons:ro --filesystem=/usr/share/icons:ro
flatpak override --user --env=XCURSOR_THEME="cursor_theme"
flatpak override --user --env=XCURSOR_SIZE=24
