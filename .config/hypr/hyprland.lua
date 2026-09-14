-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

local monitor = require("modules.monitor")
local program = require("modules.program")
local autostart = require("modules.autostart")
local cursor = require("modules.cursor")
local enviroment_variables = require("modules.enviroment_variables")
local permisson = require("modules.permisson")
local look_and_feel = require("modules.look_and_feel")
local misc = require("modules.misc")
local input = require("modules.input")
local keybind = require("modules.keybind")
local window_and_workspace = require("modules.window_and_workspace")
local plugin = require("modules.plugin")

