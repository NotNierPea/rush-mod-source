--[[
	.\hksc.exe '.\Scripts\Lua Side\RushFrontEndInit.lua'  -o 'c:\Program Files (x86)\Call of Duty Black Ops 4\project-bo4\mods\RushModT8\Rush_Lua\RushFrontEndInit.luac'
]]

if not CoD.isFrontend then
    return
end

-- Should get loaded when main.lua - ~~ x64:a72a59704fc8a51 ~~

------------------------------

--require( "ui/uieditor/widgets/loadinganimation/animationloadingwidget" )
--require( "lua/lobby/common/lobbycore" )

------------------------------

-- Utils

local function RushPrintInfo(PrintInfo, DebugName)
	if DebugName ~= nil then
		Engine[@"printinfo"](0, "^1LUA Debug: " .. tostring(DebugName) .. " -> " .. tostring(PrintInfo))
	elseif PrintInfo ~= nil then
		Engine[@"printinfo"](0, "^1LUA Debug: " .. tostring(PrintInfo))
	end
end

local function GetErrorText(controller)
	local errortext = Engine[@"getmodelvalue"]( Engine[@"getmodel"]( DataSources.MessageDialog.getModel(controller), "message" ) )
	if errortext ~= nil then
		if type(errortext) == "xhash" then
			errortext = Engine[@"hash_4F9F1239CFD921FE"]( errortext )
		end
		return errortext
	else
		return "No Error"
	end
end

-------------------------------

Engine[ @"PrintInfo" ](0, "^2Rush Init Director/Frontend Loading -> " .. Engine[ @"GetCurrentMap"]())

--[[
if CoD.MainOverlay == nil then
	RushPrintInfo("no good!")
else
	RushPrintInfo("good")
end
]]