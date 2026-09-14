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
	mode 		= "highres highrr maxwidth",
	position 	= "auto",
	scale 		= "1",
	--mirror	    = "eDP-1",
    vrr         = 0,
    --cm = "hdr",
    --bitdepth = 10
})
