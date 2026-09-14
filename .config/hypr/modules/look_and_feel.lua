-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 2,
        gaps_out = 4,

        border_size = 2,

        col = {
            active_border   = {colors = {"rgba(0bccdfff)", "rgba(de15dcff)"}, angle=45},
            inactive_border = {colors = {"rgba(dfdfdfcc)", "rgba(89ffa0ee)"}, angle=30}
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "scrolling", -- dwindle / master / scrolling / monocle
    },

    decoration = {
	    rounding 	    = 10,
        rounding_power 	= 5.0,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1,
        inactive_opacity = 0.8,

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 10,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 5,
            passes    = 3,
            vibrancy  = 0.1300,
            variant   = {
                    "acrylic",  
            },
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",            { type = "bezier", points = { {0.23, 1},    {0.32, 1}       } })
hl.curve("easeInOutCubic",          { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}       } })
hl.curve("linear",                  { type = "bezier", points = { {0, 0},       {1, 1}          } })
hl.curve("almostLinear",            { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}       } })
hl.curve("quick",                   { type = "bezier", points = { {0.15, 0},    {0.1, 1}        } })
hl.curve("overshoot", 	            { type = "bezier", points = { {0.5, 0.9},   {0.1, 1.1}      } })
hl.curve("easeOutSine",             { type = "bezier", points = { {0.61, 1},    {0.88, 1}       } })
hl.curve("easeInOutBack",           { type = "bezier", points = { {0.68, -0.6}, {0.32, 1.6}     } })
hl.curve("easeOutBack",             { type = "bezier", points = { {0.34, 1.56}, {0.64, 1}       } })
hl.curve("active-window-border",    { type = "bezier", points = { {0.2, 0.0},   {0.1, 0.3}      } })

-- Default spring
hl.curve("easy",                { type = "spring", mass = 1, stiffness = 71.2633, 	dampening = 15.8273644 	})
hl.curve("rubber", 	            { type = "spring", mass = 1, stiffness = 75, 	    dampening = 13 		    })
hl.curve("workspace_switch",    { type = "spring", mass = 1, stiffness = 90,        dampening = 14          })
hl.curve("resize_window",       { type = "spring", mass = 1, stiffness = 180,       dampening = 22          })
hl.curve("my_bouncy_spring",    { type = "spring", mass = 1, stiffness = 100,       dampening = 20          })
hl.curve("crisp",               { type = "spring", mass = 1, stiffness = 200,       dampening = 20          })
hl.curve("fade_spring",         { type = "spring", mass = 1, stiffness = 30,        dampening = 15          })
hl.curve("gentle_bounce",       { type = "spring", mass = 1, stiffness = 50,        dampening = 10          })

hl.animation({ leaf = "global",        	        enabled = true,  speed = 10,   	bezier = "default"      })
hl.animation({ leaf = "border",        	        enabled = true,  speed = 2.39, 	bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       	        enabled = true,  speed = 1.5, 	spring = "rubber"})
hl.animation({ leaf = "windowsIn",     	        enabled = true,  speed = 1,  	spring = "rubber",                  style = "popin 90%" })
hl.animation({ leaf = "windowsOut",    	        enabled = true,  speed = 1, 	spring = "rubber",                  style = "popin 90%" })
hl.animation({ leaf = "fadeIn",        	        enabled = true,  speed = 1.23, 	bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       	        enabled = true,  speed = 1.26, 	bezier = "almostLinear" })
hl.animation({ leaf = "fade",          	        enabled = true,  speed = 2.03, 	bezier = "quick"        })
hl.animation({ leaf = "layers",        	        enabled = true,  speed = 1.81, 	bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      	        enabled = true,  speed = 2,    	bezier = "easeOutQuint", 	        style = "fade"      })
hl.animation({ leaf = "layersOut",     	        enabled = true,  speed = 2.5,  	bezier = "linear",       	        style = "fade"      })
hl.animation({ leaf = "fadeLayersIn",           enabled = true,  speed = 1.79, 	bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", 	        enabled = true,  speed = 1.39, 	bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",             enabled = true,  speed = 1.94, 	bezier = "linear", 	                style = "slidevert" })
hl.animation({ leaf = "workspacesIn",  	        enabled = true,  speed = 7,    	bezier = "easeOutBack",		        style = "slidevert" })
hl.animation({ leaf = "workspacesOut", 	        enabled = true,  speed = 7, 	bezier = "easeOutBack",		        style = "slidevert" })
hl.animation({ leaf = "zoomFactor",    	        enabled = true,  speed = 5,    	bezier = "quick"        })
hl.animation({ leaf = "specialWorkspaceIn",     enabled = true,  speed = 2.51, 	spring = "easy"         })
hl.animation({ leaf = "specialWorkspaceOut",    enabled = true,  speed = 2.51, 	spring = "easy"         }) 

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split  = true, -- You probably want this
	    force_split     = 0,
	    smart_split     = false,
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
	    allow_small_split   = true,
	    mfact               = 0.6,
        new_status          = "slave",
	    orientation         = "left"
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column    = true,
        column_width                = 0.85,
        focus_fit_method            = 0,
    },
})

