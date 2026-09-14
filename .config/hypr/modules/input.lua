---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "br",
        kb_variant = "abnt2",
        kb_model   = "abnt2",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0.6, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
	        disable_while_typing = true,
            clickfinger_behavior = true,
        },
    },
})

hl.gesture({
    fingers     = 3,
    direction   = "vertical",
    action      = "workspace"
})

hl.gesture({ 
    fingers     = 2, 
    direction   = "pinch", 
    action      = "cursor_zoom", 
    zoom_level  = 1.5,
    mode        = "live"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

