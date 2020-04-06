-----------------------------------------------------------------
--FCOChatTabBrain.lua
--Author: Baertram
--[[
Remembers for each chat tab where, and to whom you were speaking.
Enables you to switch chat tabs by keybindings, cycle chat tabs,
show/hide the chat with keybindings, minimize/maximize the chat on events,
redirect send whispers to one chat tab to keep the output clean, automatically
open chat tabs upon incoming messages (after a set delay of your chat inactivity)
]]
------------------------------------------------------------------
FCOCTB = FCOCTB or {}
local FCOCTB = FCOCTB

--===================== HELP & CHAT COMMANDS ==============================================

local function help()
	local locVars = FCOCTB.localizationVars.fco_ctb_loc
    d(locVars["chatcommands_info"])
	d(locVars["chatcommands_help"])
	d(locVars["chatcommands_status"])
	d(locVars["chatcommands_addonon"])
	d(locVars["chatcommands_addonoff"])
	d(locVars["chatcommands_addontoggle"])
end

local function status()
    local locVars = FCOCTB.localizationVars.fco_ctb_loc
	d(locVars["chatcommands_status_info"])
	if(FCOCTB.settingsVars.settings.chatBrainActive == true) then
		d(locVars["chatcommands_status_on"])
    else
		d(locVars["chatcommands_status_off"])
	end
end

--chat command handlers
local function command_handler(arg)
    arg = string.lower(arg)
    local locVars = FCOCTB.localizationVars.fco_ctb_loc
	if(arg == "help" or arg == "list") then
       	help()
	elseif(arg == "status" or arg == "") then
       	status()
	elseif(arg == "on" or arg == "an") then
        FCOCTB.setChatBrain(true)
        d(locVars["chatcommands_status_on"])
	elseif(arg == "off" or arg == "aus") then
        FCOCTB.setChatBrain(false)
        d(locVars["chatcommands_status_off"])
	elseif(arg == "toggle") then
        FCOCTB.toggleChatBrain()
        if FCOCTB.settingsVars.settings.chatBrainActive == true then
        	d(locVars["chatcommands_status_on"])
        else
	        d(locVars["chatcommands_status_off"])
        end
    end
end

function FCOCTB.RegisterSlashCommands()
    -- Register slash commands
	SLASH_COMMANDS["/fcochattabbrain"] = command_handler
	SLASH_COMMANDS["/fcoctb"] 		   = command_handler
end

-- Call the start function for this addon
FCOCTB.Initialized()
