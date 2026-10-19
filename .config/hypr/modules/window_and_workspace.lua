--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

-- Workspace config 
hl.workspace_rule({ workspace = "1", layout = "dwindle" })
hl.workspace_rule({ workspace = "2", layout = "master" })
hl.workspace_rule({ workspace = "9", layout = "monocle" })

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name = "hyprpwcenter",
    match = {
        class = "^(hyprpwcenter)$",
    },
    
    float       = true,
    no_focus    = false,
    size        = "800 400"
})

hl.window_rule({
    name = "nm-connection-editor",
    match = {
        class = "^(nm-connection-editor)$",
    },

    float = true,
    size = "600 400"
})

hl.window_rule({
    name = "blueman",
    match = {
        class = "^(blueman-manager)$",
    },

    float = true,
    size = "848 632"
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = {
        class = "hyprland-run" 
    },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name = "polkit-agent",
    match = {
        class = "^(hyprpolkitagent)$" 
    },

    float = true,
    center = true,
    size = "600 200",
    stay_focused = true,
})

hl.window_rule({
    name = "polkit-opacity",
    match = {
        title = "^(Hyprland Polkit Agent)$" 
    },

    opacity = "0.90 0.90",
})

hl.window_rule({
    name = "timeshift",
    match = {
        title = "^(Timeshift)$",
    },

    float = true,
    size = "900 700"
})
