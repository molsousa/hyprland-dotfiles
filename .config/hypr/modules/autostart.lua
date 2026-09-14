-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function () 
   hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
   hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
   hl.exec_cmd("hyprpm reload")
   hl.exec_cmd("waybar & hyprpaper & dunst")
   hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme \"adw-gtk3-dark\"")
   hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"")
   hl.exec_cmd("hyprshade auto")
   hl.exec_cmd("udiskie &")
   hl.exec_cmd("hypridle &")
end)
