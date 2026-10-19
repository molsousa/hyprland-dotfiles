------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   	  = "eDP-1",
    mode     	  = "highres highrr maxwidth",
    position 	  = "auto",
    scale    	  = "1",
})

hl.monitor({
	output 		= "",
	mode 		= "1600x900@60", -- "highres highrr maxwidth",
	position 	= "auto",
	scale 		= "1",
	--mirror	    = "eDP-1",
    vrr         = 0,
    --cm = "hdr",
    --bitdepth = 10
})
