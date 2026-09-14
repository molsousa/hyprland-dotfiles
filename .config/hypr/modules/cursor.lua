----------------
---- CURSOR ----
----------------

local cursor_theme 	    = "Simp1e-Tokyo-Night"
local cursor_size 	    = 28

hl.config({
	cursor = {
		enable_hyprcursor = true
	}
})

hl.env("HYPRCURSOR_THEME",  cursor_theme)
hl.env("HYPRCURSOR_SIZE",   cursor_size)
hl.env("XCURSOR_THEME",     cursor_theme)
hl.env("XCURSOR_SIZE",      cursor_size)

hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme ".. cursor_theme)
hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size "..  cursor_size)
