---------------------
---- KEYBINDINGS ----
---------------------

local program = require("modules.program")

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

local function layout_bind(bind_table)
    return function ()
        local workspace = hl.get_active_special_workspace() or
                          hl.get_active_workspace()

        if not workspace then
            return
        end

        local layout = workspace.tiled_layout

        if bind_table[layout] then
            hl.dispatch(bind_table[layout])
        end
    end
end

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
local closeWindowBind = hl.bind(mainMod .. " + K", hl.dsp.window.close())
hl.bind(mainMod .. " + Q",              hl.dsp.exec_cmd(program.terminal))
hl.bind(mainMod .. " + M",              hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E",              hl.dsp.exec_cmd(program.fileManager))
hl.bind(mainMod .. " + V",              hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R",              hl.dsp.exec_cmd(program.menu))
hl.bind(mainMod .. " + P",              hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J",              hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind(mainMod .. " + F",              hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + PRINT",          hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. " + SHIFT + PRINT",  hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + L",              hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + B",              hl.dsp.exec_cmd("~/.scripts/power_profile.alter.sh"))
hl.bind(mainMod .. " + W",              hl.dsp.exec_cmd("pgrep -x waybar && killall waybar || waybar"))
hl.bind(mainMod .. " + F1",             hl.dsp.exec_cmd(program.emailClient))
hl.bind(mainMod .. " + F2",             hl.dsp.exec_cmd(program.notesClient))
hl.bind(mainMod .. " + F3",             hl.dsp.exec_cmd(program.passwordClient))
hl.bind(mainMod .. " + F4",             hl.dsp.exec_cmd(program.browserDefault))
hl.bind(mainMod .. " + F5",             hl.dsp.exec_cmd(program.codeDefault))
hl.bind("PRINT",                        hl.dsp.exec_cmd("hyprshot -m output"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + left", 	hl.dsp.window.move({direction = "left"}))
hl.bind(mainMod .. " + SHIFT + right", 	hl.dsp.window.move({direction = "right"}))
hl.bind(mainMod .. " + SHIFT + up", 	hl.dsp.window.move({direction = "up"}))
hl.bind(mainMod .. " + SHIFT + down", 	hl.dsp.window.move ({direction = "down"}))

hl.bind(mainMod .. " + A", layout_bind({
    scrolling = hl.dsp.layout("swapcol l"),  -- Scrolling: swap column with left one
    dwindle   = hl.dsp.layout("swapsplit"),  -- Dwindle: swap window split
    monocle   = hl.dsp.layout("cycleprev"),  -- Monocle and master: cycle prev window
    master    = hl.dsp.layout("cycleprev"),
}))

hl.bind(mainMod .. " + D", layout_bind({
    scrolling = hl.dsp.layout("swapcol r"),   -- Scrolling: swap column with right one
    dwindle   = hl.dsp.layout("togglesplit"), -- Dwindle: toggle window split
    monocle   = hl.dsp.layout("cyclenext"),   -- Monocle and master: cycle next window
    master    = hl.dsp.layout("cyclenext"),
}))

hl.bind(mainMod .. " + TAB", function ()
    local layouts   = { "scrolling", "dwindle", "master", "monocle" }
    local workspace = hl.get_active_workspace()
    if hl.get_active_special_workspace() then
        workspace = hl.get_active_special_workspace()
    end

    local next_layout = "dwindle"

    if not workspace then
        return
    end

    for i = 1, #layouts do
        if layouts[i] == workspace.tiled_layout then
            local next_layout_idx = (i % #layouts) + 1
            next_layout = layouts[next_layout_idx]
            break
        end
    end

    if workspace.special then
        hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
    else
        hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
    end
end)

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", 	        hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + SHIFT + mouse:272",  hl.dsp.window.resize(), { mouse = true })

hl.bind("ALT + TAB",            hl.dsp.window.cycle_next())
hl.bind("ALT + SHIFT + TAB",    hl.dsp.window.cycle_next({ next = false }))
hl.bind("ALT + R",              hl.dsp.submap("resize"))

hl.define_submap("resize", function()
    hl.bind("right", hl.dsp.window.resize   ({ x = 10,  y = 0,      relative = true}), {repeating = true})
    hl.bind("left", hl.dsp.window.resize    ({ x = -10, y = 0,      relative = true}), {repeating = true})
    hl.bind("up", hl.dsp.window.resize      ({ x = 0,   y = 10,     relative = true}), {repeating = true})
    hl.bind("down", hl.dsp.window.resize    ({ x = 0,   y = -10,    relative = true}), {repeating = true})
    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 6%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 6%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

