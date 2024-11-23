--[[
	.\hksc.exe '.\Scripts\Lua Side\RushFrontEndPost.lua'  -o 'c:\Program Files (x86)\Call of Duty Black Ops 4\project-bo4\mods\RushModT8\Rush_Lua\RushFrontEndPost.luac'
]]

if not CoD.isFrontend then
    return
end

------------------------------

-- !! if update, remove chat changes, overlay changes, to avoid issues with enhancement mod

-- LUI.DEV = true -- well this is something..

if not DataSourceHelpers then
	DataSourceHelpers = {}
end
if not DataSources then
	DataSources = {}
end

require( "x64:27b70bc94aba2979" ) -- difficulty selections
require( "lua/shared/luaenum" )

require( "x64:31bbde4283bb35f8" ) -- map selections
require( "x64:1523012e06043492" )
require( "x64:52abb3dc03d38a77" )
require( "x64:3fd3a35782695797" )
require( "x64:4e80af213f3caa57" )
require( "ui/uieditor/widgets/scrollbars/verticalcounter" )
require( "x64:582580983913de78" )

require( "x64:6ade951b2d8c4d9a" )
require( "x64:7f6ae994925ce8e1" )
require( "ui/uieditor/widgets/footer/footercontainer_frontend_right" )
require( "x64:7662addde48b6aa5" )

require( "ui/uieditor/widgets/footer/footerbutton_backhold" )
require( "x64:1e69a699d13ef927" )
require( "ui/uieditor/widgets/pc/footer/footerbutton_frontend_pc_left" )
require( "ui/uieditor/widgets/pc/footer/footerbutton_frontend_pc_right" )

-- Main Frontend
require( "x64:3d58649a93c7c23a" )
require( "x64:643bb843a38237" )
require( "x64:4b06ac7d487ebb93" )
require( "x64:7574ad94e3056951" )
require( "x64:36767134a413986e" )
require( "x64:312a47386affd813" )
require( "x64:72a8dac04babf8b8" )
require( "x64:98f657bdbe677aa" )
require( "x64:3a03e6abe332775" )
require( "x64:9258f7404e4ba1d" )
require( "x64:26af9b7da2a5cafd" )
require( "x64:1247779f7898be87" )
require( "x64:7c0f8856fca43866" )
require( "x64:40776309501d0fd4" )
require( "ui/uieditor/widgets/header/header_container_frontend" )
require( "x64:713012bca0fbd2f4" )
require( "x64:16be582def81a3b7" )
require( "x64:2dd67ebb9f0b033a" )
require( "x64:46ee653ade3452f5" )
require( "x64:5c0887595cfb6bb1" )
require( "ui/uieditor/actions_helper" )

require( "ui/uieditor/widgets/chat/frontend/frontendchatclient" )

require( "ui/uieditor/widgets/chat/chatclientchatentryscrollviewcontainer" )
require( "ui/uieditor/widgets/chat/chatclientfilterbutton" )
require( "ui/uieditor/widgets/chat/chatclientinputtextbox" )
require( "ui/uieditor/widgets/emptyfocusable" )

require( "ui/uieditor/widgets/border" )
require( "x64:234a25dc398a559c" )

require( "ui/uieditor/widgets/chat/chatclientchatentrystaticview" )

require( "x64:4a2bcf8aadb8131e" )

require( "x64:3ab3f46201c530b4" )

require( "x64:1f91d9d528eb4ebd" )
require( "x64:71f846296f1a1b81" )

require( "lua/shared/luautils" )

require( "ui/uieditor/widgets/director/directorpartyleaderonlyprompt" )

require( "ui/uieditor/widgets/cac/newbreadcrumbcount" )
require( "ui/uieditor/widgets/buttonprogressringcontainer" )

require( "ui/uieditor/widgets/bumperbuttonwithkeymousetext" )
require( "ui/uieditor/widgets/director/directorselecttexttab" )
require( "ui/uieditor/widgets/tabbedwidgets/basictablist" )

require( "x64:54b31e839f22a9f3" )
require( "x64:12d64ca9d3c705ce" )
require( "x64:6131b51676141877" )
require( "x64:617d3422e33a0d58" )
require( "x64:1ea788cab9c8c2f2" )
require( "ui/uieditor/widgets/director/directorselectbutton" )
require( "x64:772675e4fd5488ad" )
require( "x64:1b4ca9804aae519a" )
require( "x64:224e2d03e4415acb" )
require( "x64:71f331b3b9d7ec0d" )
require( "ui/uieditor/widgets/pc/bnetstore/pc_bnetstore_purchasebutton" )
require( "x64:300d5a6dd418ced5" )

require( "ui/uieditor/widgets/common/commoncornerpips01" )
require( "ui/uieditor/widgets/director/directorbuttonadd" )
require( "x64:261730f9c061ba21" )
require( "x64:650279cd666ce7ee" )
require( "ui/uieditor/menus/social/social_playerdetailspopup" )

require( "x64:6bc6e2379d2241fb" )
require( "ui/uieditor/widgets/fileshare/fullscreenpopup/fullscreenpopuptemplate" )
require( "x64:15d80cb371475b19" )
require( "x64:179ffb6336ac6e4c" )
require( "x64:6156d841adc02c80" )
require( "ui/uieditor/widgets/playercard/selfidentitybadge" )
require( "ui/uieditor/widgets/startmenu/startmenu_codpoints" )

require( "ui/uieditor/widgets/header/headerlinescontainer" )

require( "ui/uieditor/menus/lobby/directorfindgamewz" )
require( "x64:6260c7a8e3737127" )
require( "x64:751ef3a2adbd471e" )
require( "ui/uieditor/widgets/director/directormapandgametypecontainer" )
require( "ui/uieditor/widgets/director/directorpregamebuttonoption" )
require( "x64:500e3efc70851381" )
require( "x64:37b2e5c29b34a47e" )
require( "x64:4bfdd9a330518b28" )
require( "x64:146b093e7d34ea80" )
require( "x64:2a155eac5398a2a3" )
require( "x64:2d4ed3fd8d1fcc4a" )
require( "x64:1429ef25909713fe" )
require( "x64:34632a684587e313" )
require( "ui/uieditor/widgets/notifications/publiclobbystagenotification/stagenotificationcontainer" )
require( "x64:445928c36e455a1" )

require( "x64:7dab8c3a6f5b136c" )
require( "ui/uieditor/widgets/director/directorselectbuttonlines" )

require( "ui/uieditor/widgets/common/commonheader" )
require( "x64:6fda45231af81f63" )
require( "x64:20daafb4764cb9e3" )
require( "x64:3ac3ecac3599406b" )

require( "x64:6dbdc73a4a6c0b46" )

require( "x64:2de1e084b1f3792d" )
require( "x64:562963bd5f35a7f6" )
require( "x64:47c8f6290ec1890e" )
require( "x64:763f019e9d0f8956" )
require( "x64:1ef651f35122631" )
require( "ui/uieditor/widgets/onofftextimagebacking" )

require( "ui/uieditor/widgets/director/directorpregamebutton" )

require( "x64:1bb65ae797e77e7b" )
require( "x64:23e426332d66c91e" )
require( "ui/uieditor/widgets/startgameflow/loadingscreensharedcpzm" )

require( "ui/uieditor/widgets/backgroundframes/genericmenuframe" )
require( "x64:6e1b6065122832d3" )
require( "x64:27196315b0b927fd" )

require( "x64:1ced5f2569bfff4a" )

require( "ui/uieditor/widgets/systemoverlays/systemoverlay_full_layout" )
require( "ui/uieditor/widgets/pc/pc_smallclosebutton" )

require( "ui/uieditor/widgets/systemoverlays/systemoverlay_compact_layout" )

require( "x64:294bcc019394211c" )
require( "x64:25ec5b3e9479f805" )

require( "x64:1019bf86db65af0e" )
require( "ui/uieditor/widgets/aar_t8/medals/aarmedalstab" )
require( "ui/uieditor/widgets/aar_t8/rewards/aarrewardstab" )
require( "x64:dcd854a7bb6c2c2" )
require( "x64:293feffa3a82d41c" )
require( "x64:30feb272637b3842" )
require( "x64:1a1b9abe59dc83dc" )
require( "x64:9d68986bd32e9fe" )
require( "x64:5db2330a5cdd63e8" )

require( "ui/uieditor/widgets/cac/cac_background_slide_panel" )
require( "ui/uieditor/widgets/cac/itemnamedescunlocktext" )
require( "ui/uieditor/widgets/cac/menuchooseclass/itemwidgets/itemweaponlevel" )
require( "ui/uieditor/widgets/cac/weaponattributes" )
require( "x64:ba5fa76d22ca8fe" )
require( "ui/uieditor/widgets/pc/utility/xcammousecontrol" )
require( "x64:6341ce33d59fafd1" )
require( "x64:5f36454e4aa0e1bb" )
require( "x64:eb8711f5087e974" )
require( "x64:62bd296def421df5" )
require( "x64:7e3a68f67fb108c9" )

require( "ui/uieditor/widgets/cac/cac_background_slide_panel_short" )
require( "ui/uieditor/widgets/cac/cacheader" )
require( "ui/uieditor/widgets/cac/weaponattachmentselect/attachmentflyoutcontainer" )
require( "x64:4ec07622a7f2e74e" )
require( "ui/uieditor/widgets/director/directordividerwithgradient" )
require( "ui/uieditor/widgets/onofftext" )

require( "x64:6103d565b59f1a18" )
require( "x64:3db0d043e3841f5c" )

require( "x64:1c2f345c8ff5611e" )
require( "x64:5e0fb1c5ee5c0772" )

require( "x64:25b3f12fb71c1346" )
require( "x64:51417b7fe0a0948" )
require( "x64:77046b0d9f3594f1" )
require( "x64:20602298da419f4f" )
require( "x64:4ceb8e53c9b511d" )

require( "x64:183bf909ab80816a" )
require( "x64:1a79cd5379458ac3" )
require( "x64:2d13dde082cbfc3a" )

require( "ui/uieditor/widgets/footer/fe_footercontainermain" )
require( "ui/uieditor/widgets/main/atvicopy" )
require( "ui/uieditor/widgets/main/connectionlabel" )
require( "ui/uieditor/widgets/main/startlabel" )
require( "ui/uieditor/widgets/director/directorquitbuttoncontainer" )
require( "x64:73a1772776cde124" )
require( "x64:3ae1040cb9e1ab23" )
require( "ui/uieditor/widgets/footer/fe_leftcontainermain" )
require( "ui/uieditor/widgets/footer/fe_rightcontainermain" )
require( "ui/uieditor/widgets/pc/utility/verticallistspacer" )

require( "ui/uieditor/menus/lobby/directorchoosemapandgametype" )
require( "ui/uieditor/menus/lobby/directorcustomgamesetup" )
require( "x64:320adbc63353ec37" )
require( "x64:447c727557c223b9" )
require( "x64:48830a14f983c4c4" )
require( "x64:746270a4d7cafbc0" )
require( "x64:3e18985ca0ef8cf8" )

require( "ui/uieditor/widgets/freecursor/freecursorwidget" )

require( "ui/uieditor/widgets/loadinganimation/animationloadingwidget" )
--require( "lua/lobby/common/lobbycore" )

------------------------------

require( "x64:3a79adf0dbc1a1b6" )
require( "x64:71c4c59d812255d" )
require( "ui/uieditor/widgets/scoreboard/tabbedscoreboardfuibox" )
require( "ui/uieditor/widgets/startmenu/options/startmenuoptionsbackground" )

require( "x64:181a24c5340caa1e" )
require( "ui/uieditor/widgets/director/directorselect_tabbar_center" )

require( "x64:2ceea494103cb1e2" )
require( "x64:334096eb04183443" )

------------------------------

-- Utils

local RushColors = {
	Black = {
		r = 0,
		g = 0,
		b = 0
	},
	Red = {
		r = 1,
		g = 0,
		b = 0
	},
	Green = {
		r = 0,
		g = 1,
		b = 0
	},
	Blue = {
		r = 0,
		g = 0,
		b = 1
	},
	Yellow = {
		r = 1,
		g = 1,
		b = 0
	},
	BluePlayer = {
		r = 0,
		g = 1,
		b = 1
	},
	Magenta = {
		r = 1,
		g = 0,
		b = 1
	},
	White = {
		r = 1,
		g = 1,
		b = 1
	},
	ChatTeam = {
		r = 0,
		g = 0,87,
		b = 0,94
	},
	EnemyColor = {
		r = 1,
		g = 0,
		b = 0
	}
}

local function RushPrintInfo(PrintInfo, DebugName)
	if DebugName ~= nill then
		Engine[@"printinfo"](0, "^1LUA Debug: " .. tostring(DebugName) .. " -> " .. tostring(PrintInfo))
	elseif PrintInfo ~= nill then
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

--[[
		CoD.DirectorUtility.ShowDirectorCustom = function ( f125_arg0, f125_arg1 )
			--RushPrintInfo("Returned True", "ShowDirectorCustom")
			return true
		end

		CoD.DirectorUtility.ShowDirectorPrivate = function ( f126_arg0, f126_arg1 )
			--RushPrintInfo("Returned True", "ShowDirectorPrivate")
			return false
		end

		CoD.DirectorUtility.ShowDirectorPublic = function ( f124_arg0 )
			--RushPrintInfo("Returned True", "ShowDirectorPublic")
			return false
		end
]]

--[[

	CoD.LobbyUtility.GetMaxClientCount = function ()
		RushPrintInfo("Called", "GetMaxClientCount")
		return 8
	end

	CoD.DirectorUtility.ValidateMaxPlayers = function ( f196_arg0 )
		RushPrintInfo("Called", "ValidateMaxPlayers")
		return false
	end

]]

-- Tabs Gamemodes
DataSources.DirectorPlaylistGameTypeList = DataSourceHelpers.ListSetup( "DirectorPlaylistGameTypeList", function ( f152_arg0, f152_arg1 )
	RushPrintInfo("Called", "DirectorPlaylistGameTypeList")

	local f152_local0 = {}
	local f152_local1 = Engine[@"getmodel"]( Engine[@"getglobalmodel"](), "lobbyRoot" )
	local f152_local2 = Engine[@"getmodel"]( f152_local1, "playlistId" )
	local f152_local3 = nil
	if f152_local2 and f152_local2:get() then
		f152_local3 = Engine[@"getplaylistinfobyid"]( f152_local2:get() )
	end
	local f152_local4 = Engine[@"createmodel"]( Engine[@"createmodel"]( f152_local1, "lobbyList" ), "playerCount" )
	local f152_local5 = Engine[@"getmodelvalue"]( f152_local4 ) or 0
	local f152_local6 = #CoD.ZombieUtility.GetUnfilteredPlaylistEntriesForTab( f152_arg0, CoD.ZombieUtility.ZMPlaylistTabs.FEATURED ) > 0
	local f152_local7 = false
	for f152_local8 = CoD.ZombieUtility.ZMPlaylistTabs.BEGIN, CoD.ZombieUtility.ZMPlaylistTabs.COUNT, 1 do
		local f152_local11 = ""
		local f152_local12 = @"hash_0"
		local f152_local13 = false
		local f152_local14 = false
		if f152_local8 == CoD.ZombieUtility.ZMPlaylistTabs.FEATURED then
			f152_local14 = not f152_local6
			f152_local12 = @"hash_F29BEFC80072FF5"
			f152_local13 = f152_local3.featuredCategory and f152_local3 and not f152_local3.excludePublicLobby
		elseif f152_local8 == CoD.ZombieUtility.ZMPlaylistTabs.PUBLIC then
			f152_local12 = @"hash_57E251454EDF7A26"
			local f152_local15 = f152_local3
			if not f152_local3.featuredCategory then
				f152_local13 = not f152_local3.excludePublicLobby
			else
				f152_local13 = false
			end
		elseif f152_local8 == CoD.ZombieUtility.ZMPlaylistTabs.ZCLASSIC then
			f152_local11 = @"zclassic"
			f152_local12 = CoD.ZombieUtility.GetGametypeTabName( "zclassic" )
			if f152_local3 and #f152_local3.rotationList == 1 then
				local f152_local16 = Engine[@"hash_1F2CD89B3C345FD3"]( f152_local3.rotationList[1].gametype )
				f152_local13 = f152_local16 and f152_local16.gametype == @"zclassic"
			end
		elseif f152_local8 == CoD.ZombieUtility.ZMPlaylistTabs.ZSTANDARD then
			f152_local11 = @"zstandard"
			f152_local12 = CoD.ZombieUtility.GetGametypeTabName( "zstandard" )
			if f152_local3 and #f152_local3.rotationList == 1 then
				local f152_local16 = Engine[@"hash_1F2CD89B3C345FD3"]( f152_local3.rotationList[1].gametype )
				f152_local13 = f152_local16 and f152_local16.gametype == @"zstandard"
			end
		elseif f152_local8 == CoD.ZombieUtility.ZMPlaylistTabs.TCM then
			if not LUI.DEV then
				--f152_local14 = true
			end
			f152_local11 = @"ztcm"
			f152_local12 = CoD.ZombieUtility.GetGametypeTabName( "ztcm" )
			if f152_local3 and #f152_local3.rotationList == 1 then
				local f152_local16 = Engine[@"hash_1F2CD89B3C345FD3"]( f152_local3.rotationList[1].gametype )
				f152_local13 = f152_local16 and f152_local16.gametype == @"ztcm"
			end
		elseif f152_local8 == CoD.ZombieUtility.ZMPlaylistTabs.ZTRIALS then
			f152_local14 = IsBooleanDvarSet( @"hash_70431CAAEFB37761" )
			f152_local11 = @"ztrials"
			f152_local12 = CoD.ZombieUtility.GetGametypeTabName( "ztrials" )
			if f152_local3 and #f152_local3.rotationList == 1 then
				local f152_local16 = Engine[@"hash_1F2CD89B3C345FD3"]( f152_local3.rotationList[1].gametype )
				f152_local13 = f152_local16 and f152_local16.gametype == @"ztrials"
			end
		elseif f152_local8 == CoD.ZombieUtility.ZMPlaylistTabs.ZTUTORIAL then
			if f152_local5 > 1 then
				f152_local14 = true
			end
			f152_local11 = @"ztutorial"
			f152_local12 = CoD.ZombieUtility.GetGametypeTabName( "ztutorial" )
			if f152_local3 and #f152_local3.rotationList == 1 then
				local f152_local16 = Engine[@"hash_1F2CD89B3C345FD3"]( f152_local3.rotationList[1].gametype )
				f152_local13 = f152_local16 and f152_local16.gametype == @"ztutorial"
			end
		end
		if not f152_local14 then
			if f152_local13 and not f152_local7 then
				f152_local7 = true
				CoD.ZombieUtility.SetPlaylistTab( f152_local8, f152_local11 )
			elseif f152_local7 then
				f152_local13 = false
			end
			table.insert( f152_local0, {
				models = {
					id = f152_local11,
					name = f152_local12,
					tabID = f152_local8,
					available = true
				},
				properties = {
					selectIndex = f152_local13
				}
			} )
		end
	end
	if not f152_local7 then
		f152_local0[1].properties.selectIndex = true
		CoD.ZombieUtility.SetPlaylistTab( f152_local0[1].models.tabID, f152_local0[1].models.id )
	end
	if f152_arg1.playerCountSubscription == nil then
		f152_arg1.playerCountSubscription = f152_arg1:subscribeToModel( f152_local4, function ()
			f152_arg1:updateDataSource()
		end, false )
	end
	return f152_local0
end, true )

--[[
-- Buttons List, Bottem Left Ones..
DataSources.DirectorPregameButtonsCustom = ListHelper_SetupDataSource( "DirectorPregameButtonsCustom", function ( f115_arg0, f115_arg1 )
	local f115_local0 = {}
	local f115_local1 = Engine[@"createmodel"]( Engine[@"getglobalmodel"](), "lobbyRoot.lobbyMainMode" )
	f115_local1 = f115_local1:get()
	local f115_local2 = LuaUtils.GetEModeForLobbyMainMode( f115_local1 )
	local f115_local3 = CoD.BreadcrumbUtility.GetStorageLoadoutBufferForPlayer( f115_arg0, f115_local2 )
	local f115_local4 = function ( f116_arg0, f116_arg1 )
		local f116_local0 = {}
		local f116_local1 = f116_arg0.hintText
		local f116_local2 = false
		local f116_local3 = false
		if not f116_local1 and f116_arg0.featureItemIndex then
			f116_local1 = nil
			if CoD.CACUtility.IsFeatureItemLocked( f115_arg0, f116_arg0.featureItemIndex, f115_local2 ) then
				f116_local1 = CoD.GetUnlockStringForItemIndex( f115_arg0, f116_arg0.featureItemIndex, Enum[@"statindexoffset"][@"hash_13057ABF96AF8289"], f115_local2 )
			end
		end
		if f116_arg0.newBreadcrumbFunc then
			f116_local2 = f116_arg0.newBreadcrumbFunc( nil, f115_arg0, f115_local2 )
		end
		if f116_arg0.hasRestrictionsEquippedFunc then
			f116_local3 = f116_arg0.hasRestrictionsEquippedFunc( f115_arg0 )
		end
		local f116_local4 = table.insert
		local f116_local5 = f115_local0
		local f116_local6 = {}
		local f116_local7 = {
			name = f116_arg0.name,
			subtitle = f116_arg0.subtitle,
			iconBackground = f116_arg0.iconBackground,
			featureItemIndex = f116_arg0.featureItemIndex or -1,
			showPregameButton = f116_arg0.showPregameButton,
			hintText = f116_local1 or "",
			hasBreadcrumb = f116_local2,
			isRestricted = f116_local3,
			trialLocked = f116_arg0.trialLocked or false
		}
		local f116_local8 = f116_arg0.breadcrumbModel
		if not f116_local8 then
			f116_local8 = Engine[@"getglobalmodel"]()
		end
		f116_local7.breadcrumbModel = f116_local8
		f116_local6.models = f116_local7
		f116_local6.properties = {
			action = f116_arg1.action,
			actionParam = f116_arg1.actionParam,
			selectIndex = f116_arg1.selectIndex
		}
		f116_local4( f116_local5, f116_local6 )
	end
	
	if f115_local1 == Enum[@"lobbymainmode"][@"lobby_mainmode_mp"] then
		local f115_local5 = Engine[@"getglobalmodel"]()
		f115_local5 = f115_local5["lobbyRoot.selectedGameType"]
		local f115_local6 = true
		if f115_arg1:getParent() then
			local f115_local7 = f115_arg1:getParent()
			if f115_local7._preGameType == "custom" and CoD.DirectorUtility.HideCustomizationGametypes[f115_local5:get()] then
				f115_local6 = false
			end
		end
		if f115_arg1:getParent() then
			local f115_local7 = f115_arg1:getParent()
			if f115_local7._preGameType == "public" then
				f115_local7 = Engine[@"getglobalmodel"]()
				f115_local7 = f115_local7["lobbyRoot.playlistId"]
				if f115_local7 and f115_local7:get() then
					local f115_local8 = IsLobbyNetworkModeLive()
					if f115_local8 then
						f115_local8 = Engine[@"getplaylistinfobyid"]( f115_local7:get() )
					end
					if f115_local8 and #f115_local8.rotationList > 0 then
						f115_local6 = not CoD.DirectorUtility.HideCustomizationPlaylistGametypes[f115_local8.rotationList[1].gametype]
					end
				end
			end
		end
		if not CoDShared.IsInTheaterLobby() then
			if not IsLobbyNetworkModeLAN() and (not CoD.DirectorUtility.IsOfflineDemo() or Engine[@"hash_5CB675CA7856DA25"]()) then
				f115_local4( {
					name = @"menu/depot",
					subtitle = @"menu/depot",
					iconBackground = @"$blacktransparent",
					showPregameButton = true,
					breadcrumbModel = DataSources.DepotBreadcrumbs.getModel( f115_arg0 )
				}, {
					action = CoD.DirectorUtility.OpenDirectorPersonalizationMenu,
					actionParam = {
						_sessionMode = f115_local2,
						_storageLoadoutBuffer = f115_local3,
						_allowsQuickSelect = true
					}
				} )
				f115_local4( {
					name = @"hash_6FF94A9EB646C873",
					subtitle = @"hash_6FF94A9EB646C873",
					iconBackground = @"$blacktransparent",
					showPregameButton = true,
					breadcrumbModel = DataSources.CharacterBreadcrumbs.recreateCharacterBreadcrumbModelsIfNeeded( f115_arg0, f115_local2 )
				}, {
					action = CoD.DirectorUtility.OpenDirectorChangeCharacterMenu,
					actionParam = {
						_sessionMode = f115_local2,
						_storageLoadoutBuffer = f115_local3,
						_selectIndex = 1
					}
				} )
			end
			f115_local4( {
				name = @"menu/change",
				subtitle = @"hash_31A1B9A85C55950F",
				iconBackground = @"$blacktransparent",
				showPregameButton = f115_local6,
				newBreadcrumbFunc = CoD.BreadcrumbUtility.IsAnyScorestreaksNew,
				hasRestrictionsEquippedFunc = CoD.CACUtility.AnyEquippedScorestreaksBanned
			}, {
				action = CoD.DirectorUtility.DirectorOpenOverlayWithMenuSessionMode,
				actionParam = {
					menuName = "SupportSelection",
					eMode = f115_local2
				}
			} )
			f115_local4( {
				name = @"menu/edit",
				subtitle = @"hash_6C705394F8BCCCC9",
				iconBackground = @"$blacktransparent",
				featureItemIndex = CoD.CACUtility.GetFeatureCACItemIndex(),
				showPregameButton = f115_local6,
				newBreadcrumbFunc = CoD.BreadcrumbUtility.IsAnythingInCACNew,
				hasRestrictionsEquippedFunc = CoD.CACUtility.AnyClassContainsRestrictedItems
			}, {
				action = CoD.DirectorUtility.OpenCACWithMenuSessionMode,
				actionParam = {
					eMode = f115_local2
				},
				selectIndex = true
			} )
		end
	end
	if f115_local1 == Enum[@"lobbymainmode"][@"lobby_mainmode_zm"] then
		if not IsLobbyNetworkModeLAN() and (not CoD.DirectorUtility.IsOfflineDemo() or Engine[@"hash_5CB675CA7856DA25"]()) then
			f115_local4( {
				name = @"hash_249E353FB642CB3F",
				subtitle = @"hash_249E353FB642CB3F",
				iconBackground = @"$blacktransparent",
				showPregameButton = true,
				breadcrumbModel = DataSources.CharacterBreadcrumbs.recreateCharacterBreadcrumbModelsIfNeeded( f115_arg0, f115_local2 )
			}, {
				action = CoD.DirectorUtility.OpenDirectorChangeCharacterMenu,
				actionParam = {
					_sessionMode = f115_local2,
					_storageLoadoutBuffer = f115_local3,
					_selectIndex = 1
				}
			} )
		end
		f115_local4( {
			name = @"menu/armory",
			subtitle = @"menu/armory",
			iconBackground = @"$blacktransparent",
			showPregameButton = true
		}, {
			action = CoD.DirectorUtility.OpenArmoryMenu,
			actionParam = {
				_sessionMode = f115_local2,
				_loadoutSlot = "armory"
			}
		} )
		f115_local4( { -- CUSTOM BUTTON TEST!! -- the button gets placed between spacing, as a ~~ LobbyButtons -> in DirectorCommonSafeAreaBottomAndLeft
			name = @"shield/launchgame", -- string name needs to be cached, same as trigger strings
			subtitle = @"shield/launchgame",
			iconBackground = @"$blacktransparent",
			showPregameButton = true
		}, {
			action = LaunchGameFunction, -- the function when you click it
			actionParam = {
				Controller = f115_arg0, -- the function params go here...
			}
		} )
		f115_local4( {
			name = @"menu/edit",
			subtitle = @"hash_43E876868767ECEB",
			iconBackground = @"$blacktransparent",
			showPregameButton = true
		}, {
			action = CoD.DirectorUtility.OpenCACWithMenuSessionMode,
			actionParam = {
				eMode = f115_local2
			},
			selectIndex = true
		} )
	end
	if f115_local1 == Enum[@"lobbymainmode"][@"lobby_mainmode_wz"] then
		if not IsLobbyNetworkModeLAN() and (not CoD.DirectorUtility.IsOfflineDemo() or Engine[@"hash_5CB675CA7856DA25"]()) then
			f115_local4( {
				name = @"menu/depot",
				subtitle = @"menu/depot",
				iconBackground = @"$blacktransparent",
				showPregameButton = true,
				breadcrumbModel = DataSources.DepotBreadcrumbs.getModel( f115_arg0 )
			}, {
				action = CoD.DirectorUtility.OpenDirectorPersonalizationMenu,
				actionParam = {
					_sessionMode = f115_local2,
					_storageLoadoutBuffer = f115_local3,
					_allowsQuickSelect = true
				}
			} )
		end
		f115_local4( {
			name = @"hash_249E353FB642CB3F",
			subtitle = @"hash_249E353FB642CB3F",
			iconBackground = @"$blacktransparent",
			showPregameButton = true,
			breadcrumbModel = DataSources.CharacterBreadcrumbs.recreateCharacterBreadcrumbModelsIfNeeded( f115_arg0, f115_local2 )
		}, {
			action = CoD.DirectorUtility.OpenDirectorChangeCharacterMenu,
			actionParam = {
				_sessionMode = f115_local2,
				_storageLoadoutBuffer = f115_local3
			}
		} )
		f115_local4( {
			name = @"menu/armory",
			subtitle = @"menu/armory",
			iconBackground = @"$blacktransparent",
			showPregameButton = true,
			trialLocked = IsGameTrial()
		}, {
			action = CoD.DirectorUtility.OpenWZPersonalizeWeaponMenu,
			actionParam = {
				_sessionMode = f115_local2,
				_loadoutSlot = "wzpersonalize"
			},
			selectIndex = true
		} )
	end
	local f115_local5 = CoD.DirectorUtility.CreateOfflineScreenState()
	if f115_arg1.offlineScreenStateSubscription == nil then
		f115_arg1.offlineScreenStateSubscription = f115_arg1:subscribeToModel( f115_local5, function ()
			f115_arg1:updateDataSource()
		end, false )
	end
	if not f115_arg1.occlusionChangeSubscription then
		f115_arg1.occlusionChangeSubscription = true
		f115_arg1.menu:appendEventHandler( "occlusion_change", function ( f118_arg0, f118_arg1 )
			if not f118_arg1.occluded then
				f115_arg1:updateDataSource()
			end
		end )
	end
	CoD.DirectorUtility.AddLobbyNavSubscriptionOnce( f115_arg1 )
	return f115_local0
end )
]]

-- Maps
DataSources.DirectorPlaylistMapList = DataSourceHelpers.ListSetup( "DirectorPlaylistMapList", function ( f149_arg0, f149_arg1 )
	RushPrintInfo("Called", "DirectorPlaylistMapList")
	local f149_local0 = {}
	local f149_local1 = Engine[@"getplaylistid"]()
	local f149_local2 = Engine[@"getglobalmodel"]()
	f149_local2 = f149_local2:create( "ZMLobbyExclusions.ZMPlaylistTab" )
	local f149_local3 = f149_local2:get()
	local f149_local4 = Engine[@"getglobalmodel"]()
	f149_local4 = f149_local4:create( "ZMLobbyExclusions.ZMPrivateDifficulty" )
	local f149_local5 = f149_local4:get()
	local f149_local6 = CoD.LobbyUtility.GetClientList()
	local f149_local7 = CoD.ZombieUtility.GetUnfilteredPlaylistEntriesForTab( f149_arg0, f149_local3, f149_local5 )
	if f149_local3 ~= CoD.ZombieUtility.ZMPlaylistTabs.FEATURED and f149_local3 ~= CoD.ZombieUtility.ZMPlaylistTabs.PUBLIC and f149_local3 ~= CoD.ZombieUtility.ZMPlaylistTabs.TCM and f149_local3 ~= @"ztrials" and f149_local3 ~= @"ztutorial" then
		local f149_local8 = {}
		local f149_local9 = {}
		for f149_local10 = 1, #f149_local7, 1 do
			local f149_local13 = f149_local7[f149_local10]
			local f149_local14 = f149_local13.rotationList[1].map
			if not CoD.ZombieUtility.ArrayContains( f149_local9, f149_local14 ) then
				table.insert( f149_local9, f149_local14 )
				table.insert( f149_local8, f149_local13 )
			end
		end
		f149_local7 = f149_local8
	end
	if f149_local3 == CoD.ZombieUtility.ZMPlaylistTabs.FEATURED or f149_local3 == CoD.ZombieUtility.ZMPlaylistTabs.PUBLIC then
		local f149_local8 = false
		local f149_local9 = {}
		for f149_local10 = 1, #f149_local7, 1 do
			local f149_local13 = f149_local7[f149_local10]
			if f149_local13[@"featured"] then
				f149_local8 = true
				if f149_local13.isQuickplayCard then
					table.insert( f149_local9, 1, f149_local13 )
				else
					table.insert( f149_local9, f149_local13 )
				end
			end
		end
		for f149_local10 = 1, #f149_local7, 1 do
			local f149_local13 = f149_local7[f149_local10]
			if not f149_local13[@"featured"] then
				table.insert( f149_local9, f149_local13 )
			end
		end
		f149_local7 = f149_local9
	end
	local f149_local8 = false
	for f149_local9 = 1, #f149_local7, 1 do
		local f149_local15 = f149_local7[f149_local9]
		local f149_local13 = f149_local15.id == f149_local1
		if not f149_local13 and Engine[@"getdvarbool"]( "zm_select_playlist_on_tab_change" ) then
			local f149_local14 = Engine[@"getplaylistinfobyid"]( f149_local1 )
			if #f149_local15.rotationList == 1 and #f149_local14.rotationList == 1 then
				f149_local13 = f149_local15.rotationList[1].map == f149_local14.rotationList[1].map
				if f149_local13 then
					Engine[@"setplaylistid"]( f149_local15.id )
					LuaUtils.SetQuickplayPlaylistID( f149_local15.id )
				end
			end
		end
		if f149_local13 then
			f149_local8 = true
		end
		local f149_local14 = f149_local15.rotationList[1].map
		local f149_local16 = CoD.MapUtility.GetMapValue( f149_local15.rotationList[1].map, "mapName", @"hash_0" )
		local f149_local17 = CoD.MapUtility.GetMapValue( f149_local15.rotationList[1].map, "previewImage", @"hash_0" )
		local f149_local18 = CoD.MapUtility.GetMapValue( f149_local15.rotationList[1].map, "bigPreviewImage", @"hash_0" )
		local f149_local19 = CoD.MapUtility.GetMapValue( f149_local15.rotationList[1].map, "mapDescription", @"hash_0" )
		local f149_local20 = f149_local15.description
		local f149_local21 = f149_local16
		local f149_local22 = f149_local15.locked
		if not f149_local22 and CoD.DirectorUtility.IsPlaylistRankRestrictedForPlayer( f149_local15, Enum[@"emodes"][@"mode_zombies"], f149_arg0 ) then
			f149_local22 = true
		end
		local f149_local23 = LuaUtils.PlaylistRulesIncludes( f149_local15.rules, @"scr_xpscalezm", "2" )
		local f149_local24 = LuaUtils.PlaylistRulesIncludes( f149_local15.rules, @"scr_gunxpscalezm", "2" )
		local f149_local25 = CoD.ZombieUtility.IsDoubleNP( f149_arg0 )
		local f149_local26 = f149_local15[@"featured"] and 2 or 1
		local f149_local27 = table.insert
		local f149_local28 = f149_local0
		local f149_local29 = {}
		local f149_local30 = {
			id = f149_local14,
			playlistID = f149_local15.id,
			text = Engine[@"localize"]( f149_local16 ),
			buttonText = Engine[@"localize"]( f149_local21 ),
			image = f149_local17,
			imageLarge = f149_local18
		}
		local f149_local31 = f149_local15.imageTileSmall
		if not f149_local31 then
			f149_local31 = @"blacktransparent"
		end
		f149_local30.tileImage = f149_local31
		f149_local30.playlistDesc = f149_local20
		if f149_local3 ~= CoD.ZombieUtility.ZMPlaylistTabs.FEATURED and f149_local3 ~= CoD.ZombieUtility.ZMPlaylistTabs.PUBLIC then
			f149_local31 = not f149_local15.excludePublicLobby
		else
			f149_local31 = false
		end
		f149_local30.isFeatured = f149_local31
		f149_local30.playlist = f149_local15.id
		f149_local30.name = Engine[@"hash_4F9F1239CFD921FE"]( f149_local15.name )
		f149_local30.playlistDesc = f149_local20
		f149_local31 = f149_local15.imageTileLarge
		if not f149_local31 then
			f149_local31 = @"blacktransparent"
		end
		f149_local30.icon = f149_local31
		f149_local30.iconBackground = f149_local15.imageBackground
		f149_local30.iconBackgroundFocus = f149_local15.imageBackgroundFocus
		f149_local30.mode = f149_local15.mainMode
		f149_local30.locked = f149_local22
		f149_local30.lockState = Engine[@"hash_514ECF96E169F000"]( f149_arg0, f149_local15.id )
		f149_local30.featured = f149_local15[@"featured"] == true
		f149_local30.maxPartySize = f149_local15.maxPartySize
		f149_local30.hasDoubleXP = f149_local23
		f149_local30.hasDoubleWeaponXP = f149_local24
		f149_local30.hasDoubleNP = f149_local25
		f149_local30.showForAllClients = false
		f149_local30.trialVariant = CoD.ZombieUtility.GetZMPlaylistTrialVariant( f149_local15 )
		f149_local30.trialName = CoD.ZombieUtility.LocalizeTrialMapName( f149_local14, CoD.ZombieUtility.GetZMPlaylistTrialVariant( f149_local15 ) )
		f149_local29.models = f149_local30
		f149_local30 = {
			mapName = f149_local14,
			playlistID = f149_local15.id,
			selectIndex = f149_local13
		}
		f149_local31 = Engine[@"hash_77D47312EBA41751"]()
		if not f149_local31 then
			f149_local31 = Engine[@"hash_5CB675CA7856DA25"]()
		end
		f149_local30.disabled = f149_local31
		f149_local30.purchasable = not Engine[@"ismapvalid"]( CoD.MapUtility.ConvertMapNameToXHash( f149_local14 ) )
		f149_local30.rowSpan = f149_local26
		f149_local29.properties = f149_local30
		f149_local27( f149_local28, f149_local29 )
	end
	if not f149_local8 and #f149_local0 > 0 and f149_local3 == @"zclassic" then
		local f149_local9 = Engine[@"getplaylistinfobyid"]( f149_local1 )
		for f149_local10 = 1, #f149_local0, 1 do
			if #f149_local9.rotationList == 1 and f149_local9.excludePublicLobby and f149_local0[f149_local10].models.id == f149_local9.rotationList[1].map and CoD.ZombieUtility.GetGroupedGameType( f149_local9.rotationList[1].gametype, @"zclassic" ) == @"zclassic" then
				f149_local0[f149_local10].properties.selectIndex = true
				f149_local8 = true
				Engine[@"setplaylistid"]( f149_local0[f149_local10].models.playlistID )
				LuaUtils.SetQuickplayPlaylistID( f149_local0[f149_local10].models.playlistID )
				break
			end
		end
	end
	if not f149_local8 and #f149_local0 > 0 then
		f149_local0[1].properties.selectIndex = true
		if Engine[@"getdvarbool"]( "zm_select_playlist_on_tab_change" ) then
			f149_local9 = f149_local0[1].models.playlistID
			f149_local8 = true
			Engine[@"setplaylistid"]( f149_local9 )
			LuaUtils.SetQuickplayPlaylistID( f149_local9 )
		end
	end
	if f149_arg1.playlistTabSubscription == nil then
		f149_arg1.playlistTabSubscription = f149_arg1:subscribeToModel( f149_local2, function ()
			f149_arg1:updateDataSource()
		end, false )
	end
	if f149_arg1.difficultySubscription == nil then
		f149_arg1.difficultySubscription = f149_arg1:subscribeToModel( f149_local4, function ()
			f149_arg1:updateDataSource()
		end, false )
	end
	return f149_local0
end, true )

-- Overlay
CoD.OverlayUtility.CreateOverlay = function ( f375_arg0, f375_arg1, f375_arg2, ... )
	local f375_local0 = nil
	local f375_local1 = {
		n = select( "#", ... ),
		...
	}

	local f375_local2 = function ( f376_arg0, f376_arg1 )
		for f376_local4, f376_local5 in ipairs( CoD.OverlayUtility.OverlayModelFields ) do
			local f376_local3 = nil
			local f376_local6 = Engine[@"createmodel"]( f376_arg0, f376_local5 )
			if type( f376_arg1[f376_local5] ) == "function" then
				f376_local3 = f376_arg1[f376_local5]( unpack( f375_local1 ) )
			else
				f376_local3 = f376_arg1[f376_local5]
			end
			if not f376_local3 and CoD.OverlayUtility.DefaultModelFields[f376_local5] then
				f376_local3 = CoD.OverlayUtility.callFnOrGetValue( CoD.OverlayUtility.DefaultModelFields[f376_local5], {
					f376_arg1,
					f375_local1
				} )
			end
			if f376_local3 ~= nil then
				Engine[@"setmodelvalue"]( f376_local6, f376_local3 )
			end
		end
	end
	
	if CoD.OverlayUtility.Overlays[f375_arg2] then
		local f375_local3 = CoD.OverlayUtility.Overlays[f375_arg2]
		local f375_local4 = CoD.OverlayUtility.callFnOrGetValue( f375_local3.menuName, f375_local1 )

		if f375_local4 then
			if CoD.Menu.ModelToUse then
				CoD.OverlayUtility.RefreshOverlayModels( CoD.Menu.ModelToUse, f375_local3, f375_local1 )
			end
			CoD.Menu.OverwriteMenuName = f375_arg2
			if CoD.isPC and f375_arg1.pcQuitOverlayActive and f375_arg2 ~= "QuitPCGamePopup" and f375_arg1.occludedBy and f375_arg1.occludedBy.menuName == "QuitPCGamePopup" then
				PerformOverlayBack( f375_arg1.occludedBy, f375_arg0 )
			end

			RushPrintInfo("Called", "Overlay -> " .. f375_local4 .. " -> " .. f375_arg2)

			if not f375_local3.openMethod or f375_local3.openMethod == CoD.OverlayUtility.OpenMethods.Popup then
				f375_local0 = OpenPopup( f375_arg1, f375_local4, f375_arg0 )
			elseif f375_local3.openMethod == CoD.OverlayUtility.OpenMethods.Overlay then
				f375_local0 = OpenOverlay( f375_arg1, f375_local4, f375_arg0 )
			end
			CoD.Menu.OverwriteMenuName = nil
			if f375_local0 then
				if CoD.isPC then
					--CoD.PCUtility.LockUIShortcutInput( f375_local0, f375_arg0 )
				end
				f375_local0.refreshData = CoD.OverlayUtility.RefreshOverlayDataFunction( f375_local0, f375_local1 )
				CoD.OverlayUtility.RefreshOverlayProperties( f375_local0, f375_local3, f375_local1 )
				CoD.OverlayUtility.RefreshOverlayPrompts( f375_local0, f375_local3, f375_local1 )
				if f375_local3.preCreateStep then
					f375_local3.preCreateStep( f375_local0, f375_arg0, unpack( f375_local1 ) )
				end
				if not f375_local0:getModel() then
					f375_local0.overlayModelName = "Overlay." .. f375_arg2
					local f375_local5 = Engine[@"createmodel"]( Engine[@"getmodelforcontroller"]( f375_arg0 ), f375_local0.overlayModelName )
					CoD.OverlayUtility.RefreshOverlayModels( f375_local5, f375_local3, f375_local1 )
					f375_local0:setModel( f375_local5, f375_arg0 )
				end
				LUI.OverrideFunction_CallOriginalFirst( f375_local0, "close", CoD.OverlayUtility.OverlayCloseMethod( f375_local0, f375_arg0 ) )
				if f375_local3.postCreateStep then
					f375_local3.postCreateStep( f375_local0, f375_arg0 )
				end
				f375_local0:UpdateAllButtonPrompts( f375_arg0 )
				if (f375_local4 == "SystemOverlay_FreeCursor" or f375_local4 == "SystemOverlay_MessageDialog" or f375_local4 == "SystemOverlay_FreeCursor_Full" or f375_local4 == "SystemOverlay_MessageDialogFull") and not f375_local3.allowFreeCursor then
					MenuHidesFreeCursor( f375_local0, f375_arg0 )
				end
			end
		end
	end
	return f375_local0
end

CoD.BaseUtility.SubscribeToMessageDialogBox = function ( f77_arg0, f77_arg1 )
	if not f77_arg1 then
		f77_arg1 = Engine[@"getprimarycontroller"]()
	end
	if f77_arg0._messagePendingSubscription ~= nil then
		f77_arg0:removeSubscription( f77_arg0._messagePendingSubscription )
	end
	f77_arg0._messagePendingSubscription = f77_arg0:subscribeToGlobalModel( f77_arg1, "MessageDialog", "messagePending", function ( model )
		if ShouldOpenMessageDialog( f77_arg0, f77_arg1 ) then
			local f78_local0 = CoD.SafeGetModelValue( Engine[@"getglobalmodel"](), "messageDialog.controller" ) or f77_arg1
			local f78_local1 = f77_arg0.occludedBy
			local f78_local2 = f77_arg0.occludedMenu
			if f78_local1 and f78_local1.menuName == "MessageDialogBox" then
				Close( f78_local1, f77_arg1 )
				f78_local1 = nil
			end

			RushPrintInfo("an Error Occurred! -> " .. GetErrorText(f78_local0))

			if not CoD.isFrontend then
				if f77_arg0.id == "Menu.HUD" and (IsGameTypeDOA() == false or f78_local0 == 0) and f78_local0 == f77_arg1 then
					local f78_local3 = CoD.OverlayUtility.CreateOverlay( f78_local0, f78_local1 or f77_arg0, "MessageDialogBox", f78_local0 )
					CoD.Menu.SetAsPriority( f78_local3, f78_local0 )
					f78_local3:setPriority( 9999 )
					f78_local3:setOwner( f78_local0 )
					f77_arg0._messageDialogBox = f78_local3
					LUI.OverrideFunction_CallOriginalSecond( f77_arg0._messageDialogBox, "close", function ()
						f77_arg0._messageDialogBox = nil
					end )
					Engine[@"lockinput"]( f78_local0, true )
					Engine[@"setuiactive"]( f78_local0, true )
				end
			elseif not f78_local1 and not string.find(GetErrorText(f78_local0), "UI Error 100002") then -- no message create overlay
				local f78_local4 = CoD.OverlayUtility.CreateOverlay( f78_local0, f77_arg0, "MessageDialogBox", f78_local0 )
				CoD.Menu.SetAsPriority( f78_local4, f78_local0 )
				f78_local4:setPriority( 9999 )
				f78_local4:registerEventHandler( "unused_durango_gamepad_button", function ( element, event )
					element:close()
				end )
			end
		end
	end, false )
end

-------------------------------

Engine[ @"PrintInfo" ](0, "^3Rush Post Director/Frontend Loading -> " .. Engine[ @"GetCurrentMap"]())

-- Main BO4 Spinner Logo (not engine loading one)
CoD.AnimationLoadingWidget = InheritFrom( LUI.UIElement )
CoD.AnimationLoadingWidget.__defaultWidth = 216
CoD.AnimationLoadingWidget.__defaultHeight = 216
CoD.AnimationLoadingWidget.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( 0, 1, 0, 0, 0, 1, 0, 0 ) -- override
	self:setClass( CoD.AnimationLoadingWidget )
	self.id = "AnimationLoadingWidget"
	self.soundSet = "Special_widgets"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Base = LUI.UIImage.new( 0.75, 0.88, 0, 0, 0.75, 0.98, 0, 0 )
	Base:setImage( RegisterImage( @"t7_menu_loadingspinner_flipbook" ) )
	Base:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_flipbook_animated" ) )
	Base:setAlpha( 0.85 )
	Base:setShaderVector( 0, 28, 1, 0, 0 )
	Base:setShaderVector( 1, 7, 0, 0, 0 )
	self:addElement( Base )
	self.Base = Base
	
	local Add = LUI.UIImage.new( 0.75, 0.88, 0, 0, 0.75, 0.98, 0, 0 )
	Add:setAlpha( 0.5 )
	Add:setImage( RegisterImage( @"t7_menu_loadingspinner_flipbook" ) )
	Add:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_flipbook_animated" ) )
	Add:setShaderVector( 0, 28, 1, 0, 0 )
	Add:setShaderVector( 1, 7, 0, 0, 0 )
	self:addElement( Add )
	self.Add = Add
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	RushPrintInfo("Called", "Main BO4 Spinner")
	self:setRGB(8, 0, 8)
	--self:setLeftRight(-0.50, -0.50, 0, 0)

	return self
end

CoD.AnimationLoadingWidget.__resetProperties = function ( f2_arg0 )
	f2_arg0.Add:completeAnimation()
	f2_arg0.Base:completeAnimation()
	f2_arg0.Add:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_flipbook_animated" ) )
	f2_arg0.Add:setShaderVector( 0, 28, 1, 0, 0 )
	f2_arg0.Add:setShaderVector( 1, 7, 0, 0, 0 )
	f2_arg0.Base:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_flipbook_animated" ) )
	f2_arg0.Base:setShaderVector( 0, 28, 1, 0, 0 )
	f2_arg0.Base:setShaderVector( 1, 7, 0, 0, 0 )
end

CoD.AnimationLoadingWidget.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f3_arg0, f3_arg1 )
			f3_arg0:__resetProperties()
			f3_arg0:setupElementClipCounter( 2 )
			local f3_local0 = function ( f4_arg0 )
				f3_arg0.Base:beginAnimation( 1000 )
				f3_arg0.Base:setShaderVector( 1, 28, 0, 0, 0 )
				f3_arg0.Base:registerEventHandler( "interrupted_keyframe", f3_arg0.clipInterrupted )
				f3_arg0.Base:registerEventHandler( "transition_complete_keyframe", f3_arg0.clipFinished )
			end
			
			f3_arg0.Base:completeAnimation()
			f3_arg0.Base:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_flipbook_animated" ) )
			f3_arg0.Base:setShaderVector( 0, 28, 1, 0, 0 )
			f3_arg0.Base:setShaderVector( 1, 7, 0, 0, 0 )
			f3_local0( f3_arg0.Base )
			local f3_local1 = function ( f5_arg0 )
				f3_arg0.Add:beginAnimation( 1000 )
				f3_arg0.Add:setShaderVector( 1, 28, 0, 0, 0 )
				f3_arg0.Add:registerEventHandler( "interrupted_keyframe", f3_arg0.clipInterrupted )
				f3_arg0.Add:registerEventHandler( "transition_complete_keyframe", f3_arg0.clipFinished )
			end
			
			f3_arg0.Add:completeAnimation()
			f3_arg0.Add:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_flipbook_animated" ) )
			f3_arg0.Add:setShaderVector( 0, 28, 1, 0, 0 )
			f3_arg0.Add:setShaderVector( 1, 7, 0, 0, 0 )
			f3_local1( f3_arg0.Add )
			f3_arg0.nextClip = "DefaultClip"
		end
	}
}

CoD.AnimationLoading2 = InheritFrom( LUI.UIElement )
CoD.AnimationLoading2.__defaultWidth = 216
CoD.AnimationLoading2.__defaultHeight = 216
CoD.AnimationLoading2.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.AnimationLoading2 )
	self.id = "AnimationLoading2"
	self.soundSet = "ChooseDecal"
	
	local Image0 = LUI.UIImage.new( 0, 0, 0, 216, 0, 0, 0, 216 )
	Image0:setImage( RegisterImage( @"t7_menu_loadingspinner_flipbook" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_flipbook" ) )
	Image0:setShaderVector( 0, 28, 0, 0, 0 )
	Image0:setShaderVector( 1, 22, 0, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end

	RushPrintInfo("Called", "Alt BO4 Spinner")
	self:setRGB(1, 0, 1)
	
	return self
end

-- Cusror
CoD.FreeCursor = InheritFrom( CoD.Menu )
LUI.createMenu.FreeCursor = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "FreeCursor", f1_arg0 )
	local f1_local1 = self
	SetProperty( self, "ignoreCursor", true )
	self:setClass( CoD.FreeCursor )
	self.soundSet = "none"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	
	local freeCursorWidget0 = CoD.freeCursorWidget.new( f1_local1, f1_arg0, 0, 0, 0, 140, 0, 0, 0, 140 )
	freeCursorWidget0:subscribeToGlobalModel( f1_arg0, "FreeCursor", nil, function ( model )
		freeCursorWidget0:setModel( model, f1_arg0 )
	end )
	self:addElement( freeCursorWidget0 )
	self.freeCursorWidget0 = freeCursorWidget0
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsFreeCursorActiveAndVisible( f1_arg0 )
			end
		}
	} )
	local f1_local3 = self
	local f1_local4 = self.subscribeToModel
	local f1_local5 = DataSources.FreeCursor.getModel( f1_arg0 )
	f1_local4( f1_local3, f1_local5.usingCursorInput, function ( f4_arg0 )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f4_arg0:get(),
			modelName = "usingCursorInput"
		} )
	end, false )
	f1_local3 = self
	f1_local4 = self.subscribeToModel
	f1_local5 = DataSources.FreeCursor.getModel( f1_arg0 )
	f1_local4( f1_local3, f1_local5.hidden, function ( f5_arg0 )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f5_arg0:get(),
			modelName = "hidden"
		} )
	end, false )
	f1_local3 = self
	f1_local4 = self.subscribeToModel
	f1_local5 = Engine[@"getmodelforcontroller"]( f1_arg0 )
	f1_local4( f1_local3, f1_local5.activeKeys, function ( f6_arg0 )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f6_arg0:get(),
			modelName = "activeKeys"
		} )
	end, false )
	freeCursorWidget0.id = "freeCursorWidget0"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	f1_local4 = self
	CallCustomElementFunction_Self( self, "setPriority", 1000 )
	SetProperty( self, "m_inputDisabled", true )

	RushPrintInfo("Called", "Main Cursor")
	self:setRGB(1, 0, 1)

	return self
end

CoD.FreeCursor.__resetProperties = function ( f7_arg0 )
	f7_arg0.freeCursorWidget0:completeAnimation()
	f7_arg0.freeCursorWidget0:setAlpha( 1 )
end

CoD.FreeCursor.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 0 )
		end
	},
	Hidden = {
		DefaultClip = function ( f9_arg0, f9_arg1 )
			f9_arg0:__resetProperties()
			f9_arg0:setupElementClipCounter( 1 )
			f9_arg0.freeCursorWidget0:completeAnimation()
			f9_arg0.freeCursorWidget0:setAlpha( 0 )
			f9_arg0.clipFinished( f9_arg0.freeCursorWidget0 )
		end
	}
}

CoD.FreeCursor.__onClose = function ( f10_arg0 )
	f10_arg0.freeCursorWidget0:close()
end

-- ZM Starting Weapon
CoD.ZMStartWeaponSelect = InheritFrom( CoD.Menu )
LUI.createMenu.ZMStartWeaponSelect = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "ZMStartWeaponSelect", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1 )
	SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, true )
	CoD.BaseUtility.CreateControllerModel( f1_arg0, "VariantListShownUpdate" )
	self:setClass( CoD.ZMStartWeaponSelect )
	self.soundSet = "CAC_PrimaryWeapon"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	local XCamMouseControl = nil
	
	XCamMouseControl = CoD.XCamMouseControl.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0.5, 0.5, -392, 108 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local BackgroundSlidePanel = CoD.cac_background_slide_panel.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0.5, 0.5, 132, 754 )
	BackgroundSlidePanel:setZoom( 70 )
	self:addElement( BackgroundSlidePanel )
	self.BackgroundSlidePanel = BackgroundSlidePanel
	
	local RestrictedText = CoD.RestrictedItemWarningText.new( f1_local1, f1_arg0, 0.5, 0.5, -247, 247, 0.5, 0.5, 54, 84 )
	self:addElement( RestrictedText )
	self.RestrictedText = RestrictedText
	
	local WeaponLevel = CoD.ItemWeaponLevel.new( f1_local1, f1_arg0, 0.5, 0.5, -790, 790, 0, 0, 650, 662 )
	self:addElement( WeaponLevel )
	self.WeaponLevel = WeaponLevel
	
	local WeaponListWidget = CoD.Armory_WeaponListWidget.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, 133, 623 )
	WeaponListWidget.weaponCategoryList.Tabs.grid:setDataSource( "ZMStartingWeaponGroups" )
	self:addElement( WeaponListWidget )
	self.WeaponListWidget = WeaponListWidget
	
	local ItemInfo = CoD.ItemNameDescUnlockText.new( f1_local1, f1_arg0, 0.5, 0.5, -792, -292, 0.5, 0.5, -88.5, 18.5 )
	ItemInfo:mergeStateConditions( {
		{
			stateName = "Zombie",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ItemInfo )
	self.ItemInfo = ItemInfo
	
	local WeaponAttributes = CoD.WeaponAttributes.new( f1_local1, f1_arg0, 0.5, 0.5, 461, 906, 0.5, 0.5, -120, 130 )
	WeaponAttributes:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return MenuPropertyIsTrue( menu, "_showWeaponVariantList" )
			end
		}
	} )
	WeaponAttributes:setZoom( 85 )
	self:addElement( WeaponAttributes )
	self.WeaponAttributes = WeaponAttributes
	
	local CACHeader = CoD.CommonHeader.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0, 0, 0, 67 )
	CACHeader.subtitle.StageTitle:setText( LocalizeToUpperString( @"hash_493CE015442D7E04" ) )
	CACHeader.subtitle.subtitle:setAlpha( 0 )
	CACHeader:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			CACHeader.subtitle.subtitle:setText( Engine[@"hash_4F9F1239CFD921FE"]( f4_local0 ) )
		end
	end )
	CACHeader:linkToElementModel( self, nil, false, function ( model )
		CACHeader:setModel( model, f1_arg0 )
	end )
	CACHeader:registerEventHandler( "menu_loaded", function ( element, event )
		local f6_local0 = nil
		if element.menuLoaded then
			f6_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f6_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f6_local0 then
			f6_local0 = element:dispatchEventToChildren( event )
		end
		return f6_local0
	end )
	self:addElement( CACHeader )
	self.CACHeader = CACHeader
	
	local BackingGrayMediumLeft = CoD.header_container_frontend.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 42 )
	BackingGrayMediumLeft:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		if element.menuLoaded then
			f7_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f7_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:addElement( BackingGrayMediumLeft )
	self.BackingGrayMediumLeft = BackingGrayMediumLeft
	
	local FooterContainerFrontendRight = CoD.FooterContainer_Frontend_Right.new( f1_local1, f1_arg0, 0, 1, 0, 0, 1, 1, -48, 0 )
	FooterContainerFrontendRight:registerEventHandler( "menu_loaded", function ( element, event )
		local f8_local0 = nil
		if element.menuLoaded then
			f8_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f8_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	self:addElement( FooterContainerFrontendRight )
	self.FooterContainerFrontendRight = FooterContainerFrontendRight
	
	RestrictedText:linkToElementModel( WeaponListWidget.weaponList, nil, false, function ( model )
		RestrictedText:setModel( model, f1_arg0 )
	end )
	WeaponLevel:linkToElementModel( WeaponListWidget.weaponList, nil, false, function ( model )
		WeaponLevel:setModel( model, f1_arg0 )
	end )
	ItemInfo:linkToElementModel( WeaponListWidget.weaponList, nil, false, function ( model )
		ItemInfo:setModel( model, f1_arg0 )
	end )
	WeaponAttributes:linkToElementModel( WeaponListWidget.weaponList, "weaponAttributes", false, function ( model )
		WeaponAttributes:setModel( model, f1_arg0 )
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], nil, function ( element, menu, controller, model )
		if MenuPropertyIsTrue( menu, "_showWeaponVariantList" ) and IsPC() then
			CoD.CACUtility.HideWeaponVariantList( menu, controller )
			return true
		elseif not IsPC() then
			CoD.CACUtility.UpdateClassModelWeaponIfPrimary( self, controller )
			CoD.CACUtility.PlayChooseScreenOutro( menu, controller, "Close" )
			DelayGoBack( menu, controller, 200 )
			return true
		elseif IsPC() then
			CoD.CACUtility.UpdateClassModelWeaponIfPrimary( self, controller )
			CoD.CACUtility.PlayChooseScreenOutro( menu, controller, "ClosePC" )
			DelayGoBack( menu, controller, 200 )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if MenuPropertyIsTrue( menu, "_showWeaponVariantList" ) and IsPC() then
			CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_370A9FDC87CD3D48", nil, nil )
			return true
		elseif not IsPC() then
			CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_370A9FDC87CD3D48", nil, nil )
			return true
		elseif IsPC() then
			CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_370A9FDC87CD3D48", nil, nil )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, false )
		CoD.CACUtility.ClearClassWeaponModel( f1_local1, f1_arg0 )
	end )
	self:subscribeToGlobalModel( f1_arg0, "PerController", "VariantListShownUpdate", function ( model )
		local f16_local0 = self
		UpdateElementState( self, "WeaponAttributes", f1_arg0 )
	end )
	if CoD.isPC then
		XCamMouseControl.id = "XCamMouseControl"
	end
	WeaponListWidget.id = "WeaponListWidget"
	FooterContainerFrontendRight:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		FooterContainerFrontendRight.id = "FooterContainerFrontendRight"
	end
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = WeaponListWidget
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	local f1_local12 = self
	if not IsPC() then
		CoD.BaseUtility.SetModelFromPropertyModel( f1_arg0, self, self )
		CoD.CACUtility.PlayChooseScreenIntro( f1_local1, f1_arg0, 200, "Open", false )
		MenuHidesFreeCursor( f1_local1, f1_arg0 )
	elseif IsPC() then
		CoD.BaseUtility.SetModelFromPropertyModel( f1_arg0, self, self )
		CoD.CACUtility.PlayChooseScreenIntro( f1_local1, f1_arg0, 200, "OpenPC", true )
	end

	RushPrintInfo("Called", "ZM Starting Weapon Select")
	self:setRGB(1, 0, 1)

	return self
end

CoD.ZMStartWeaponSelect.__resetProperties = function ( f17_arg0 )
	f17_arg0.WeaponListWidget:completeAnimation()
	f17_arg0.BackgroundSlidePanel:completeAnimation()
	f17_arg0.WeaponListWidget:setTopBottom( 0.5, 0.5, 133, 623 )
	f17_arg0.WeaponListWidget:setAlpha( 1 )
	f17_arg0.BackgroundSlidePanel:setTopBottom( 0.5, 0.5, 132, 754 )
	f17_arg0.BackgroundSlidePanel:setAlpha( 1 )
end

CoD.ZMStartWeaponSelect.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f18_arg0, f18_arg1 )
			f18_arg0:__resetProperties()
			f18_arg0:setupElementClipCounter( 2 )
			f18_arg0.BackgroundSlidePanel:completeAnimation()
			f18_arg0.BackgroundSlidePanel:setAlpha( 0 )
			f18_arg0.clipFinished( f18_arg0.BackgroundSlidePanel )
			f18_arg0.WeaponListWidget:completeAnimation()
			f18_arg0.WeaponListWidget:setTopBottom( 0, 0, 1080, 1570 )
			f18_arg0.clipFinished( f18_arg0.WeaponListWidget )
		end,
		Open = function ( f19_arg0, f19_arg1 )
			f19_arg0:__resetProperties()
			f19_arg0:setupElementClipCounter( 2 )
			local f19_local0 = function ( f20_arg0 )
				local f20_local0 = function ( f21_arg0 )
					f21_arg0:beginAnimation( 100, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
					f21_arg0:setTopBottom( 0, 0, 672, 1294 )
					f21_arg0:setAlpha( 1 )
					f21_arg0:registerEventHandler( "transition_complete_keyframe", f19_arg0.clipFinished )
				end
				
				f19_arg0.BackgroundSlidePanel:beginAnimation( 100 )
				f19_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 872, 1494 )
				f19_arg0.BackgroundSlidePanel:registerEventHandler( "interrupted_keyframe", f19_arg0.clipInterrupted )
				f19_arg0.BackgroundSlidePanel:registerEventHandler( "transition_complete_keyframe", f20_local0 )
			end
			
			f19_arg0.BackgroundSlidePanel:completeAnimation()
			f19_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 1072, 1694 )
			f19_arg0.BackgroundSlidePanel:setAlpha( 0 )
			f19_local0( f19_arg0.BackgroundSlidePanel )
			local f19_local1 = function ( f22_arg0 )
				local f22_local0 = function ( f23_arg0 )
					f23_arg0:beginAnimation( 49 )
					f23_arg0:setTopBottom( 0, 0, 680, 1170 )
					f23_arg0:setAlpha( 1 )
					f23_arg0:registerEventHandler( "transition_complete_keyframe", f19_arg0.clipFinished )
				end
				
				f19_arg0.WeaponListWidget:beginAnimation( 200, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
				f19_arg0.WeaponListWidget:setTopBottom( 0, 0, 700, 1190 )
				f19_arg0.WeaponListWidget:registerEventHandler( "interrupted_keyframe", f19_arg0.clipInterrupted )
				f19_arg0.WeaponListWidget:registerEventHandler( "transition_complete_keyframe", f22_local0 )
			end
			
			f19_arg0.WeaponListWidget:completeAnimation()
			f19_arg0.WeaponListWidget:setTopBottom( 0, 0, 1080, 1570 )
			f19_arg0.WeaponListWidget:setAlpha( 0 )
			f19_local1( f19_arg0.WeaponListWidget )
		end,
		Close = function ( f24_arg0, f24_arg1 )
			f24_arg0:__resetProperties()
			f24_arg0:setupElementClipCounter( 2 )
			local f24_local0 = function ( f25_arg0 )
				f24_arg0.BackgroundSlidePanel:beginAnimation( 200, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
				f24_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 1072, 1694 )
				f24_arg0.BackgroundSlidePanel:setAlpha( 0 )
				f24_arg0.BackgroundSlidePanel:registerEventHandler( "interrupted_keyframe", f24_arg0.clipInterrupted )
				f24_arg0.BackgroundSlidePanel:registerEventHandler( "transition_complete_keyframe", f24_arg0.clipFinished )
			end
			
			f24_arg0.BackgroundSlidePanel:completeAnimation()
			f24_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 672, 1294 )
			f24_arg0.BackgroundSlidePanel:setAlpha( 1 )
			f24_local0( f24_arg0.BackgroundSlidePanel )
			local f24_local1 = function ( f26_arg0 )
				f24_arg0.WeaponListWidget:beginAnimation( 200, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
				f24_arg0.WeaponListWidget:setTopBottom( 0, 0, 1080, 1570 )
				f24_arg0.WeaponListWidget:setAlpha( 0 )
				f24_arg0.WeaponListWidget:registerEventHandler( "interrupted_keyframe", f24_arg0.clipInterrupted )
				f24_arg0.WeaponListWidget:registerEventHandler( "transition_complete_keyframe", f24_arg0.clipFinished )
			end
			
			f24_arg0.WeaponListWidget:completeAnimation()
			f24_arg0.WeaponListWidget:setTopBottom( 0, 0, 680, 1170 )
			f24_arg0.WeaponListWidget:setAlpha( 1 )
			f24_local1( f24_arg0.WeaponListWidget )
		end,
		OpenPC = function ( f27_arg0, f27_arg1 )
			f27_arg0:__resetProperties()
			f27_arg0:setupElementClipCounter( 2 )
			local f27_local0 = function ( f28_arg0 )
				f27_arg0.BackgroundSlidePanel:beginAnimation( 70 )
				f27_arg0.BackgroundSlidePanel:setAlpha( 1 )
				f27_arg0.BackgroundSlidePanel:registerEventHandler( "interrupted_keyframe", f27_arg0.clipInterrupted )
				f27_arg0.BackgroundSlidePanel:registerEventHandler( "transition_complete_keyframe", f27_arg0.clipFinished )
			end
			
			f27_arg0.BackgroundSlidePanel:completeAnimation()
			f27_arg0.BackgroundSlidePanel:setAlpha( 0 )
			f27_local0( f27_arg0.BackgroundSlidePanel )
			local f27_local1 = function ( f29_arg0 )
				f27_arg0.WeaponListWidget:beginAnimation( 70 )
				f27_arg0.WeaponListWidget:setAlpha( 1 )
				f27_arg0.WeaponListWidget:registerEventHandler( "interrupted_keyframe", f27_arg0.clipInterrupted )
				f27_arg0.WeaponListWidget:registerEventHandler( "transition_complete_keyframe", f27_arg0.clipFinished )
			end
			
			f27_arg0.WeaponListWidget:completeAnimation()
			f27_arg0.WeaponListWidget:setAlpha( 0 )
			f27_local1( f27_arg0.WeaponListWidget )
		end,
		ClosePC = function ( f30_arg0, f30_arg1 )
			f30_arg0:__resetProperties()
			f30_arg0:setupElementClipCounter( 2 )
			local f30_local0 = function ( f31_arg0 )
				f30_arg0.BackgroundSlidePanel:beginAnimation( 40 )
				f30_arg0.BackgroundSlidePanel:setAlpha( 0 )
				f30_arg0.BackgroundSlidePanel:registerEventHandler( "interrupted_keyframe", f30_arg0.clipInterrupted )
				f30_arg0.BackgroundSlidePanel:registerEventHandler( "transition_complete_keyframe", f30_arg0.clipFinished )
			end
			
			f30_arg0.BackgroundSlidePanel:completeAnimation()
			f30_arg0.BackgroundSlidePanel:setAlpha( 1 )
			f30_local0( f30_arg0.BackgroundSlidePanel )
			local f30_local1 = function ( f32_arg0 )
				f30_arg0.WeaponListWidget:beginAnimation( 40 )
				f30_arg0.WeaponListWidget:setAlpha( 0 )
				f30_arg0.WeaponListWidget:registerEventHandler( "interrupted_keyframe", f30_arg0.clipInterrupted )
				f30_arg0.WeaponListWidget:registerEventHandler( "transition_complete_keyframe", f30_arg0.clipFinished )
			end
			
			f30_arg0.WeaponListWidget:completeAnimation()
			f30_arg0.WeaponListWidget:setAlpha( 1 )
			f30_local1( f30_arg0.WeaponListWidget )
		end
	}
}

CoD.ZMStartWeaponSelect.__onClose = function ( f33_arg0 )
	f33_arg0.RestrictedText:close()
	f33_arg0.WeaponLevel:close()
	f33_arg0.ItemInfo:close()
	f33_arg0.WeaponAttributes:close()
	f33_arg0.XCamMouseControl:close()
	f33_arg0.BackgroundSlidePanel:close()
	f33_arg0.WeaponListWidget:close()
	f33_arg0.CACHeader:close()
	f33_arg0.BackingGrayMediumLeft:close()
	f33_arg0.FooterContainerFrontendRight:close()
end

-- ZMPerk Select
local PostLoadFuncPerk = function ( f1_arg0, f1_arg1 )
	if not IsBooleanDvarSet( @"hash_7BAB0CFB192B09C9" ) then
		local f1_local0 = f1_arg0.PerksList
		f1_local0:setLeftRight( 0.5, 0.5, -486, 486 )
		f1_local0:setHorizontalCount( 7 )
		f1_local0:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_558C8A85F2048829"] )
	end
end

CoD.ZMPerkSelect = InheritFrom( CoD.Menu )
LUI.createMenu.ZMPerkSelect = function ( f2_arg0, f2_arg1 )
	local self = CoD.Menu.NewForUIEditor( "ZMPerkSelect", f2_arg0 )
	local f2_local1 = self
	CoD.BaseUtility.SetPropertiesFromUserData( self, f2_arg1 )
	SetControllerModelValue( f2_arg0, "ZMEquippedPerks.inEditMenu", true )
	self:setClass( CoD.ZMPerkSelect )
	self.soundSet = "ZCAC"
	self:setOwner( f2_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f2_arg0 )
	self.anyChildUsesUpdateState = true
	f2_local1:addElementToPendingUpdateStateList( self )
	
	local FooterContainerFrontendRight = CoD.FooterContainer_Frontend_Right.new( f2_local1, f2_arg0, 0, 1, 0, 0, 1, 1, -48, 0 )
	FooterContainerFrontendRight:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		if element.menuLoaded then
			f3_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f3_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f2_arg0 )
		end
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( FooterContainerFrontendRight )
	self.FooterContainerFrontendRight = FooterContainerFrontendRight
	
	local CACHeader = CoD.CommonHeader.new( f2_local1, f2_arg0, 0.5, 0.5, -960, 960, 0, 0, 0, 67 )
	CACHeader.subtitle.StageTitle:setText( LocalizeToUpperString( @"hash_28BDD7F912E1E764" ) )
	CACHeader.subtitle.subtitle:setAlpha( 0 )
	CACHeader:subscribeToGlobalModel( f2_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			CACHeader.subtitle.subtitle:setText( Engine[@"hash_4F9F1239CFD921FE"]( f4_local0 ) )
		end
	end )
	CACHeader:registerEventHandler( "menu_loaded", function ( element, event )
		local f5_local0 = nil
		if element.menuLoaded then
			f5_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f5_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f2_arg0 )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:addElement( CACHeader )
	self.CACHeader = CACHeader
	
	local BackingGrayMediumLeft = CoD.header_container_frontend.new( f2_local1, f2_arg0, 0, 0, 0, 1920, 0, 0, 0, 42 )
	BackingGrayMediumLeft:registerEventHandler( "menu_loaded", function ( element, event )
		local f6_local0 = nil
		if element.menuLoaded then
			f6_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f6_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f2_arg0 )
		if not f6_local0 then
			f6_local0 = element:dispatchEventToChildren( event )
		end
		return f6_local0
	end )
	self:addElement( BackingGrayMediumLeft )
	self.BackingGrayMediumLeft = BackingGrayMediumLeft
	
	local RestrictedText = CoD.RestrictedItemWarningText.new( f2_local1, f2_arg0, 0.5, 0.5, -247, 247, 0.5, 0.5, 424, 454 )
	self:addElement( RestrictedText )
	self.RestrictedText = RestrictedText
	
	local PerksList = LUI.UIList.new( f2_local1, f2_arg0, 8, 0, nil, false, false, false, false )
	PerksList:setLeftRight( 0.5, 0.5, -626, 486 )
	PerksList:setTopBottom( 0.5, 0.5, 138, 402 )
	PerksList:setScale( 0.98, 0.98 )
	PerksList:setWidgetType( CoD.ZMPerkOption )
	PerksList:setHorizontalCount( 8 )
	PerksList:setVerticalCount( 2 )
	PerksList:setSpacing( 8 )
	PerksList:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_3830CFD395E6AA0A"] )
	PerksList:setVerticalCounter( CoD.verticalCounter )
	PerksList:setDataSource( "PerkSelectList" )
	local PerkName = PerksList
	local PerkAltar = PerksList.subscribeToModel
	local SubHeaderDivider = DataSources.ZMEquippedPerks.getModel( f2_arg0 )
	PerkAltar( PerkName, SubHeaderDivider.updateEquipped, function ( f7_arg0, f7_arg1 )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f2_local1, f2_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"] )
	end, false )
	PerksList:linkToElementModel( PerksList, "globalItemIndex", true, function ( model, f8_arg1 )
		CoD.Menu.UpdateButtonShownState( f8_arg1, f2_local1, f2_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"] )
	end )
	PerkName = PerksList
	PerkAltar = PerksList.subscribeToModel
	SubHeaderDivider = DataSources.ZMEquippedPerks.getModel( f2_arg0 )
	PerkAltar( PerkName, SubHeaderDivider.currentSlot, function ( f9_arg0, f9_arg1 )
		CoD.Menu.UpdateButtonShownState( f9_arg1, f2_local1, f2_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"] )
	end, false )
	PerksList:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, f2_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"] )
		return f10_local0
	end )
	f2_local1:AddButtonCallbackFunction( PerksList, f2_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"], nil, function ( element, menu, controller, model )
		if not CoD.ZMPerkUtility.IsPerkLocked( element, controller, menu ) and not CoD.ZMPerkUtility.IsPerkEquippedInCurrentSlot( element, controller, menu ) then
			CoD.ZMPerkUtility.PerkOptionSelected( element, menu, controller )
			CoD.CACUtility.PlayElementXHashSound( element, "equipSound" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not CoD.ZMPerkUtility.IsPerkLocked( element, controller, menu ) and not CoD.ZMPerkUtility.IsPerkEquippedInCurrentSlot( element, controller, menu ) then
			CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"], @"hash_6D0BB36CD318F55F", nil, nil )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( PerksList, "childFocusGained", function ( element )
		ShowWidget( self.UnlockDescription )
		CoD.BaseUtility.SetElementModelToOtherElementModel( f2_arg0, self.ModifierInfo, self.PerkAltar )
	end )
	self:addElement( PerksList )
	self.PerksList = PerksList
	
	PerkAltar = LUI.GridLayout.new( f2_local1, f2_arg0, false, 0, 0, 10, 0, nil, nil, false, false, false, false )
	PerkAltar:mergeStateConditions( {
		{
			stateName = "Modifier",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f2_arg0, "isModifierSlot" )
			end
		}
	} )
	PerkAltar:linkToElementModel( PerkAltar, "isModifierSlot", true, function ( model )
		f2_local1:updateElementState( PerkAltar, {
			name = "model_validation",
			menu = f2_local1,
			controller = f2_arg0,
			modelValue = model:get(),
			modelName = "isModifierSlot"
		} )
	end )
	PerkAltar:setLeftRight( 0.5, 0.5, -475, 475 )
	PerkAltar:setTopBottom( 0.5, 0.5, -411, 39 )
	PerkAltar:setWidgetType( CoD.ZMPerkSlot )
	PerkAltar:setHorizontalCount( 4 )
	PerkAltar:setSpacing( 10 )
	PerkAltar:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_558C8A85F2048829"] )
	PerkAltar:setDataSource( "ZMEquippedPerks" )
	SubHeaderDivider = PerkAltar
	PerkName = PerkAltar.subscribeToModel
	local PerkDescription = DataSources.ZMEquippedPerks.getModel( f2_arg0 )
	PerkName( SubHeaderDivider, PerkDescription.currentSlot, function ( f16_arg0, f16_arg1 )
		CoD.Menu.UpdateButtonShownState( f16_arg1, f2_local1, f2_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"] )
	end, false )
	PerkAltar:linkToElementModel( PerkAltar, "slotIndex", true, function ( model, f17_arg1 )
		CoD.Menu.UpdateButtonShownState( f17_arg1, f2_local1, f2_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"] )
	end )
	PerkAltar:registerEventHandler( "list_active_changed", function ( element, event )
		local f18_local0 = nil
		CoD.ZMPerkUtility.PerkSlotHighlighted( element, f2_arg0 )
		return f18_local0
	end )
	PerkAltar:registerEventHandler( "gain_focus", function ( element, event )
		local f19_local0 = nil
		if element.gainFocus then
			f19_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f19_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, f2_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"] )
		return f19_local0
	end )
	f2_local1:AddButtonCallbackFunction( PerkAltar, f2_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"], nil, function ( element, menu, controller, model )
		if not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualToSelfModelValue( element, controller, "ZMEquippedPerks", "currentSlot", "slotIndex" ) then
			SelectItemIfPossible( self, element, controller )
			PlaySoundAlias( "uin_zcac_elixir_slot" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualToSelfModelValue( element, controller, "ZMEquippedPerks", "currentSlot", "slotIndex" ) then
			CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"], @"hash_6D0BB36CD318F55F", Enum[@"hash_3BEBDBAEEB3ECCCA"][@"hash_4B6372335C630AD3"], nil )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( PerkAltar, "childFocusGained", function ( element )
		HideWidget( self.UnlockDescription )
	end )
	self:addElement( PerkAltar )
	self.PerkAltar = PerkAltar
	
	PerkName = LUI.UIText.new( 0.5, 0.5, 490.5, 850.5, 0.5, 0.5, 156, 183 )
	PerkName:setRGB( 0.58, 0.85, 1 )
	PerkName:setTTF( "ttmussels_demibold" )
	PerkName:setLetterSpacing( 7 )
	PerkName:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_558C8A85F2048829"] )
	PerkName:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_670510683C22104B"] )
	self:addElement( PerkName )
	self.PerkName = PerkName
	
	SubHeaderDivider = LUI.UIImage.new( 0.5, 0.5, 492.5, 882.5, 0.5, 0.5, 194, 195 )
	SubHeaderDivider:setRGB( 0.92, 0.92, 0.92 )
	SubHeaderDivider:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_70E992BD5A540E2D" ) )
	SubHeaderDivider:setShaderVector( 0, 0, 1, 0, 0 )
	SubHeaderDivider:setShaderVector( 1, 0, 1.24, 0, 0 )
	SubHeaderDivider:setShaderVector( 2, 0, 1, 0, 0 )
	SubHeaderDivider:setShaderVector( 3, 0, 0, 0, 0 )
	SubHeaderDivider:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( SubHeaderDivider )
	self.SubHeaderDivider = SubHeaderDivider
	
	PerkDescription = LUI.UIText.new( 0.5, 0.5, 491.5, 851.5, 0.5, 0.5, 204, 221 )
	PerkDescription:setRGB( 0.92, 0.92, 0.92 )
	PerkDescription:setTTF( "dinnext_regular" )
	PerkDescription:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_558C8A85F2048829"] )
	PerkDescription:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_3F41D595A2B0EDF3"] )
	self:addElement( PerkDescription )
	self.PerkDescription = PerkDescription
	
	local UnlockDescription = CoD.onOffText.new( f2_local1, f2_arg0, 0.5, 0.5, 489.5, 836.5, 0.5, 0.5, 369, 387 )
	UnlockDescription:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not CoD.ZMPerkUtility.IsPerkLocked( self.PerksList, f2_arg0, menu )
			end
		}
	} )
	local RB = UnlockDescription
	local ModifierInfo = UnlockDescription.subscribeToModel
	local LB = DataSources.ZMEquippedPerks.getModel( f2_arg0 )
	ModifierInfo( RB, LB.updateEquipped, function ( f24_arg0 )
		f2_local1:updateElementState( UnlockDescription, {
			name = "model_validation",
			menu = f2_local1,
			controller = f2_arg0,
			modelValue = f24_arg0:get(),
			modelName = "updateEquipped"
		} )
	end, false )
	UnlockDescription:linkToElementModel( UnlockDescription, "globalItemIndex", true, function ( model )
		f2_local1:updateElementState( UnlockDescription, {
			name = "model_validation",
			menu = f2_local1,
			controller = f2_arg0,
			modelValue = model:get(),
			modelName = "globalItemIndex"
		} )
	end )
	UnlockDescription:setRGB( 0.39, 0.39, 0.39 )
	self:addElement( UnlockDescription )
	self.UnlockDescription = UnlockDescription
	
	ModifierInfo = CoD.ZMPerk_ModifierInfo.new( f2_local1, f2_arg0, 0.5, 0.5, 486.5, 886.5, 0.5, 0.5, 12, 76 )
	ModifierInfo:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f2_arg0, "isModifierSlot" )
			end
		}
	} )
	ModifierInfo:linkToElementModel( ModifierInfo, "isModifierSlot", true, function ( model )
		f2_local1:updateElementState( ModifierInfo, {
			name = "model_validation",
			menu = f2_local1,
			controller = f2_arg0,
			modelValue = model:get(),
			modelName = "isModifierSlot"
		} )
	end )
	self:addElement( ModifierInfo )
	self.ModifierInfo = ModifierInfo
	
	RB = CoD.BumperButtonWithKeyMouseText.new( f2_local1, f2_arg0, 0, 0, 1435, 1635, 0, 0, 160, 194 )
	RB.GamepadPrompt:setText( Engine[@"hash_4F9F1239CFD921FE"]( @"hash_5BFED5292621DA9A" ) )
	self:addElement( RB )
	self.RB = RB
	
	LB = CoD.BumperButtonWithKeyMouseText.new( f2_local1, f2_arg0, 0, 0, 285, 485, 0, 0, 160, 194 )
	LB.GamepadPrompt:setText( Engine[@"hash_4F9F1239CFD921FE"]( @"hash_5BDCD5292604F434" ) )
	LB.GamepadPrompt:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_3830CFD395E6AA0A"] )
	self:addElement( LB )
	self.LB = LB
	
	RestrictedText:linkToElementModel( PerksList, nil, false, function ( model )
		RestrictedText:setModel( model, f2_arg0 )
	end )
	PerkName:linkToElementModel( PerksList, "displayName", true, function ( model )
		local f29_local0 = model:get()
		if f29_local0 ~= nil then
			PerkName:setText( LocalizeToUpperString( f29_local0 ) )
		end
	end )
	PerkDescription:linkToElementModel( PerksList, "description", true, function ( model )
		local f30_local0 = model:get()
		if f30_local0 ~= nil then
			PerkDescription:setText( Engine[@"hash_4F9F1239CFD921FE"]( f30_local0 ) )
		end
	end )
	UnlockDescription:linkToElementModel( PerksList, nil, false, function ( model )
		UnlockDescription:setModel( model, f2_arg0 )
	end )
	UnlockDescription:linkToElementModel( PerksList, "itemIndex", true, function ( model )
		local f32_local0 = model:get()
		if f32_local0 ~= nil then
			UnlockDescription.TextBox:setText( CoD.BaseUtility.AlreadyLocalized( CoD.CACUtility.GetUnlockDescription( f2_local1, f2_arg0, f32_local0 ) ) )
		end
	end )
	ModifierInfo:linkToElementModel( PerkAltar, nil, false, function ( model )
		ModifierInfo:setModel( model, f2_arg0 )
	end )
	ModifierInfo:linkToElementModel( PerksList, "modifierDesc", true, function ( model )
		local f34_local0 = model:get()
		if f34_local0 ~= nil then
			ModifierInfo.ModifierDescription:setText( Engine[@"hash_4F9F1239CFD921FE"]( f34_local0 ) )
		end
	end )
	ModifierInfo:linkToElementModel( PerksList, "modifierName", true, function ( model )
		local f35_local0 = model:get()
		if f35_local0 ~= nil then
			ModifierInfo.ModifierName:setText( ConvertToUpperString( f35_local0 ) )
		end
	end )
	self:mergeStateConditions( {
		{
			stateName = "PC",
			condition = function ( menu, element, event )
				return IsPC()
			end
		}
	} )
	f2_local1:AddButtonCallbackFunction( self, f2_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_370A9FDC87CD3D48", nil, nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetControllerModelValue( f2_arg0, "ZMEquippedPerks.inEditMenu", false )
		ClearMenuSavedState( f2_local1 )
	end )
	FooterContainerFrontendRight:setModel( self.buttonModel, f2_arg0 )
	if CoD.isPC then
		FooterContainerFrontendRight.id = "FooterContainerFrontendRight"
	end
	PerksList.id = "PerksList"
	PerkAltar.id = "PerkAltar"
	self:processEvent( {
		name = "menu_loaded",
		controller = f2_arg0
	} )
	self.__defaultFocus = PerksList
	if CoD.isPC and (IsKeyboard( f2_arg0 ) or self.ignoreCursor) then
		self:restoreState( f2_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )

	if PostLoadFunc then
		PostLoadFuncPerk( self, f2_arg0 )
	end
	
	local f2_local15 = self
	CoD.GridAndListUtility.AddBumperNavigation( f2_local1, PerkAltar, f2_arg0 )

	RushPrintInfo("Called", "ZMPerk Select")
	self:setRGB(1, 0, 1)

	return self
end

CoD.ZMPerkSelect.__resetProperties = function ( f40_arg0 )
	f40_arg0.LB:completeAnimation()
	f40_arg0.RB:completeAnimation()
	f40_arg0.LB:setLeftRight( 0, 0, 285, 485 )
	f40_arg0.RB:setLeftRight( 0, 0, 1435, 1635 )
end

CoD.ZMPerkSelect.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f41_arg0, f41_arg1 )
			f41_arg0:__resetProperties()
			f41_arg0:setupElementClipCounter( 0 )
		end
	},
	PC = {
		DefaultClip = function ( f42_arg0, f42_arg1 )
			f42_arg0:__resetProperties()
			f42_arg0:setupElementClipCounter( 2 )
			f42_arg0.RB:completeAnimation()
			f42_arg0.RB:setLeftRight( 0.5, 0.5, 482, 682 )
			f42_arg0.clipFinished( f42_arg0.RB )
			f42_arg0.LB:completeAnimation()
			f42_arg0.LB:setLeftRight( 0.5, 0.5, -682, -482 )
			f42_arg0.clipFinished( f42_arg0.LB )
		end
	}
}

CoD.ZMPerkSelect.__onClose = function ( f43_arg0 )
	f43_arg0.RestrictedText:close()
	f43_arg0.PerkName:close()
	f43_arg0.PerkDescription:close()
	f43_arg0.UnlockDescription:close()
	f43_arg0.ModifierInfo:close()
	f43_arg0.FooterContainerFrontendRight:close()
	f43_arg0.CACHeader:close()
	f43_arg0.BackingGrayMediumLeft:close()
	f43_arg0.PerksList:close()
	f43_arg0.PerkAltar:close()
	f43_arg0.RB:close()
	f43_arg0.LB:close()
end

-- Weapon ZM Attachments
CoD.Armory_AttachmentSelect = InheritFrom( CoD.Menu )
LUI.createMenu.Armory_AttachmentSelect = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "Armory_AttachmentSelect", f1_arg0 )
	local f1_local1 = self
	SetModelToGlobalDataSource( f1_arg0, self, "AttachmentMenu" )
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1 )
	CoD.BaseUtility.InitControllerModel( f1_arg0, "armoryOpticListFocus", false )
	CoD.BaseUtility.InitControllerModel( f1_arg0, "armoryAttachmentUpdated", nil )
	CoD.BaseUtility.InitControllerModel( f1_arg0, "armoryAttachmentListFocus", false )
	self:setClass( CoD.Armory_AttachmentSelect )
	self.soundSet = "CAC_PrimaryWeapon"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	local XCamMouseControl = nil
	
	XCamMouseControl = CoD.XCamMouseControl.new( f1_local1, f1_arg0, 0.5, 1.5, -960.5, -960.5, 0, 0, 150, 650 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local BackgroundSlidePanel = CoD.cac_background_slide_panel.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 0, 670, 1292 )
	BackgroundSlidePanel:setZoom( 70 )
	self:addElement( BackgroundSlidePanel )
	self.BackgroundSlidePanel = BackgroundSlidePanel
	
	local WeaponAttachmentContainer = CoD.Armory_AttachmentContainer.new( f1_local1, f1_arg0, 0.5, 0.5, -750, 750, 0, 0, 693, 993 )
	WeaponAttachmentContainer:setZoom( 72 )
	self:addElement( WeaponAttachmentContainer )
	self.WeaponAttachmentContainer = WeaponAttachmentContainer
	
	local CACHeader = CoD.CommonHeader.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0, 0, 0, 67 )
	CACHeader.subtitle.StageTitle:setText( LocalizeToUpperString( @"hash_7560ECCA7484F00E" ) )
	CACHeader.subtitle.subtitle:setAlpha( 0 )
	CACHeader:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			CACHeader.subtitle.subtitle:setText( Engine[@"hash_4F9F1239CFD921FE"]( f2_local0 ) )
		end
	end )
	CACHeader:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		if element.menuLoaded then
			f3_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f3_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( CACHeader )
	self.CACHeader = CACHeader
	
	local BackingGrayMediumLeft = CoD.header_container_frontend.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 42 )
	BackingGrayMediumLeft:registerEventHandler( "menu_loaded", function ( element, event )
		local f4_local0 = nil
		if element.menuLoaded then
			f4_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f4_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	self:addElement( BackingGrayMediumLeft )
	self.BackingGrayMediumLeft = BackingGrayMediumLeft
	
	local FooterContainerFrontendRight = CoD.FooterContainer_Frontend_Right.new( f1_local1, f1_arg0, 0, 1, 0, 0, 1, 1, -48, 0 )
	FooterContainerFrontendRight:registerEventHandler( "menu_loaded", function ( element, event )
		local f5_local0 = nil
		if element.menuLoaded then
			f5_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f5_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:addElement( FooterContainerFrontendRight )
	self.FooterContainerFrontendRight = FooterContainerFrontendRight
	
	local AttachmentFlyoutContainer = CoD.AttachmentFlyoutContainer.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -540, 540 )
	LUI.OverrideFunction_CallOriginalFirst( AttachmentFlyoutContainer, "close", function ( element )
		if not IsBooleanDvarSet( "ui_attachmentFlyout" ) then
			CoD.WeaponAttachmentsUtility.CleanAttachmentDescriptionFlyouts( self, element, f1_arg0, f1_local1 )
		end
	end )
	self.__on_menuOpened_AttachmentFlyoutContainer = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		local f7_local0 = AttachmentFlyoutContainer
		if not IsBooleanDvarSet( "ui_attachmentFlyout" ) then
			CoD.WeaponAttachmentsUtility.SetupAttachmentDescriptionFlyouts( self, f7_local0, f7_arg1, f7_arg2 )
		end
	end
	
	f1_local1:addMenuOpenedCallback( self.__on_menuOpened_AttachmentFlyoutContainer )
	self:addElement( AttachmentFlyoutContainer )
	self.AttachmentFlyoutContainer = AttachmentFlyoutContainer
	
	local WeaponLevel = CoD.ItemWeaponLevel.new( f1_local1, f1_arg0, 0.5, 0.5, -790, 790, 0, 0, 650, 662 )
	self:addElement( WeaponLevel )
	self.WeaponLevel = WeaponLevel
	
	local AttachmentInfo = CoD.Armory_AttachmentInfoContainer.new( f1_local1, f1_arg0, 0.5, 0.5, -790, -37, 0, 0, 463.5, 570.5 )
	self:addElement( AttachmentInfo )
	self.AttachmentInfo = AttachmentInfo
	
	local WeaponAttributes = CoD.WeaponAttributes.new( f1_local1, f1_arg0, 0.5, 0.5, 450, 895, 0, 0, 425, 675 )
	WeaponAttributes:setZoom( 85 )
	self:addElement( WeaponAttributes )
	self.WeaponAttributes = WeaponAttributes
	
	AttachmentInfo:linkToElementModel( WeaponAttachmentContainer.AttachmentList.Attachments, nil, false, function ( model )
		AttachmentInfo.AttachmentInfo:setModel( model, f1_arg0 )
	end )
	AttachmentInfo:linkToElementModel( WeaponAttachmentContainer.OpticsList.Optics, nil, false, function ( model )
		AttachmentInfo.OpticInfo:setModel( model, f1_arg0 )
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], nil, function ( element, menu, controller, model )
		PlaySoundAlias( "uin_party_ease_slide_back" )
		CoD.CACUtility.PlayChooseScreenOutro( menu, controller, "Close" )
		DelayGoBack( menu, controller, 200 )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_370A9FDC87CD3D48", nil, nil )
		return true
	end, false )
	self.__on_menuOpened_self = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		local f12_local0 = self
		if not IsGamepadOrKeyboardNavigation( f12_arg1 ) then
			CoD.WeaponAttachmentsUtility.CenterAttachmentLayout( self, f12_arg1, f12_arg2, self.WeaponAttachmentContainer )
			CoD.ZMLoadoutUtility.ResetAttachmentListModelForWeaponAttributes( f12_arg2, f12_arg2, f12_arg1 )
		else
			CoD.WeaponAttachmentsUtility.CenterAttachmentLayout( self, f12_arg1, f12_arg2, self.WeaponAttachmentContainer )
		end
	end
	
	f1_local1:addMenuOpenedCallback( self.__on_menuOpened_self )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetPerControllerTableProperty( f1_arg0, "attachmentSlot", nil )
		CoD.CACUtility.UpdateClassWeaponModel( f1_local1, element, f1_arg0 )
		ForceNotifyControllerModel( f1_arg0, "WeaponPersonalization.listUpdate" )
	end )
	if CoD.isPC then
		XCamMouseControl.id = "XCamMouseControl"
	end
	WeaponAttachmentContainer.id = "WeaponAttachmentContainer"
	FooterContainerFrontendRight:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		FooterContainerFrontendRight.id = "FooterContainerFrontendRight"
	end
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = WeaponAttachmentContainer
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	self.__on_close_removeOverrides = function ()
		f1_local1:removeMenuOpenedCallback( self.__on_menuOpened_self )
		f1_local1:removeMenuOpenedCallback( self.__on_menuOpened_AttachmentFlyoutContainer )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	CoD.ZMLoadoutUtility.UpdateArmoryAttachmentModel( f1_local1, self, f1_arg0, false )
	CoD.BaseUtility.SetModelFromPropertyModel( f1_arg0, self, self )
	CoD.CACUtility.PlayChooseScreenIntro( f1_local1, f1_arg0, 200, "Open", true )
	CoD.BaseUtility.SetModelFromUserData( f1_arg0, WeaponLevel, f1_local1._weaponItemModel )

	RushPrintInfo("Called", "ZM Attachments")
	self:setRGB(1, 0, 0)

	return self
end

CoD.Armory_AttachmentSelect.__resetProperties = function ( f15_arg0 )
	f15_arg0.WeaponAttachmentContainer:completeAnimation()
	f15_arg0.BackgroundSlidePanel:completeAnimation()
	f15_arg0.WeaponAttachmentContainer:setTopBottom( 0, 0, 693, 993 )
	f15_arg0.WeaponAttachmentContainer:setAlpha( 1 )
	f15_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 670, 1292 )
	f15_arg0.BackgroundSlidePanel:setAlpha( 1 )
end

CoD.Armory_AttachmentSelect.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties()
			f16_arg0:setupElementClipCounter( 2 )
			f16_arg0.BackgroundSlidePanel:completeAnimation()
			f16_arg0.BackgroundSlidePanel:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.BackgroundSlidePanel )
			f16_arg0.WeaponAttachmentContainer:completeAnimation()
			f16_arg0.WeaponAttachmentContainer:setTopBottom( 0, 0, 1080, 1380 )
			f16_arg0.clipFinished( f16_arg0.WeaponAttachmentContainer )
		end,
		Open = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties()
			f17_arg0:setupElementClipCounter( 2 )
			local f17_local0 = function ( f18_arg0 )
				local f18_local0 = function ( f19_arg0 )
					f19_arg0:beginAnimation( 100, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
					f19_arg0:setTopBottom( 0, 0, 670, 1292 )
					f19_arg0:setAlpha( 1 )
					f19_arg0:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
				end
				
				f17_arg0.BackgroundSlidePanel:beginAnimation( 100 )
				f17_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 875, 1497 )
				f17_arg0.BackgroundSlidePanel:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.BackgroundSlidePanel:registerEventHandler( "transition_complete_keyframe", f18_local0 )
			end
			
			f17_arg0.BackgroundSlidePanel:completeAnimation()
			f17_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 1080, 1702 )
			f17_arg0.BackgroundSlidePanel:setAlpha( 0 )
			f17_local0( f17_arg0.BackgroundSlidePanel )
			local f17_local1 = function ( f20_arg0 )
				local f20_local0 = function ( f21_arg0 )
					f21_arg0:beginAnimation( 49 )
					f21_arg0:setTopBottom( 0, 0, 693, 993 )
					f21_arg0:setAlpha( 1 )
					f21_arg0:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
				end
				
				f17_arg0.WeaponAttachmentContainer:beginAnimation( 200 )
				f17_arg0.WeaponAttachmentContainer:setTopBottom( 0, 0, 705, 1005 )
				f17_arg0.WeaponAttachmentContainer:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.WeaponAttachmentContainer:registerEventHandler( "transition_complete_keyframe", f20_local0 )
			end
			
			f17_arg0.WeaponAttachmentContainer:completeAnimation()
			f17_arg0.WeaponAttachmentContainer:setTopBottom( 0, 0, 1103, 1403 )
			f17_arg0.WeaponAttachmentContainer:setAlpha( 0 )
			f17_local1( f17_arg0.WeaponAttachmentContainer )
		end,
		Close = function ( f22_arg0, f22_arg1 )
			f22_arg0:__resetProperties()
			f22_arg0:setupElementClipCounter( 2 )
			local f22_local0 = function ( f23_arg0 )
				local f23_local0 = function ( f24_arg0 )
					f24_arg0:beginAnimation( 100, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
					f24_arg0:setTopBottom( 0, 0, 1090, 1712 )
					f24_arg0:registerEventHandler( "transition_complete_keyframe", f22_arg0.clipFinished )
				end
				
				f22_arg0.BackgroundSlidePanel:beginAnimation( 100 )
				f22_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 880, 1502 )
				f22_arg0.BackgroundSlidePanel:setAlpha( 0 )
				f22_arg0.BackgroundSlidePanel:registerEventHandler( "interrupted_keyframe", f22_arg0.clipInterrupted )
				f22_arg0.BackgroundSlidePanel:registerEventHandler( "transition_complete_keyframe", f23_local0 )
			end
			
			f22_arg0.BackgroundSlidePanel:completeAnimation()
			f22_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 670, 1292 )
			f22_arg0.BackgroundSlidePanel:setAlpha( 1 )
			f22_local0( f22_arg0.BackgroundSlidePanel )
			local f22_local1 = function ( f25_arg0 )
				local f25_local0 = function ( f26_arg0 )
					f26_arg0:beginAnimation( 100, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
					f26_arg0:setTopBottom( 0, 0, 1113, 1413 )
					f26_arg0:registerEventHandler( "transition_complete_keyframe", f22_arg0.clipFinished )
				end
				
				f22_arg0.WeaponAttachmentContainer:beginAnimation( 100 )
				f22_arg0.WeaponAttachmentContainer:setTopBottom( 0, 0, 903, 1203 )
				f22_arg0.WeaponAttachmentContainer:setAlpha( 0 )
				f22_arg0.WeaponAttachmentContainer:registerEventHandler( "interrupted_keyframe", f22_arg0.clipInterrupted )
				f22_arg0.WeaponAttachmentContainer:registerEventHandler( "transition_complete_keyframe", f25_local0 )
			end
			
			f22_arg0.WeaponAttachmentContainer:completeAnimation()
			f22_arg0.WeaponAttachmentContainer:setTopBottom( 0, 0, 693, 993 )
			f22_arg0.WeaponAttachmentContainer:setAlpha( 1 )
			f22_local1( f22_arg0.WeaponAttachmentContainer )
		end
	}
}

CoD.Armory_AttachmentSelect.__onClose = function ( f27_arg0 )
	f27_arg0.__on_close_removeOverrides()
	f27_arg0.AttachmentInfo:close()
	f27_arg0.XCamMouseControl:close()
	f27_arg0.BackgroundSlidePanel:close()
	f27_arg0.WeaponAttachmentContainer:close()
	f27_arg0.CACHeader:close()
	f27_arg0.BackingGrayMediumLeft:close()
	f27_arg0.FooterContainerFrontendRight:close()
	f27_arg0.AttachmentFlyoutContainer:close()
	f27_arg0.WeaponLevel:close()
	f27_arg0.WeaponAttributes:close()
end

-- Weapon Flyout
CoD.WeaponSelectFlyout = InheritFrom( CoD.Menu )
LUI.createMenu.WeaponSelectFlyout = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "WeaponSelectFlyout", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1 )
	CoD.BaseUtility.InitControllerModelIfNotSet( f1_arg0, "hudItems.previewingMK2Weapon", 0 )
	CoD.BaseUtility.CreateControllerModel( f1_arg0, "VariantListShownUpdate" )
	self:setClass( CoD.WeaponSelectFlyout )
	self.soundSet = "CAC_PrimaryWeapon"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	local XCamMouseControl = nil
	
	XCamMouseControl = CoD.XCamMouseControl.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 0, 146, 646 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local BackgroundSlidePanel = CoD.cac_background_slide_panel.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 0, 672, 1294 )
	BackgroundSlidePanel:setZoom( 70 )
	self:addElement( BackgroundSlidePanel )
	self.BackgroundSlidePanel = BackgroundSlidePanel
	
	local CACHeader = CoD.CACHeader.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0, 0, 0, 67 )
	CACHeader.subtitle.StageTitle:setText( LocalizeToUpperString( @"hash_493CE015442D7E04" ) )
	CACHeader.subtitle.subtitle:setAlpha( 0 )
	CACHeader:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			CACHeader.subtitle.subtitle:setText( Engine[@"hash_4F9F1239CFD921FE"]( f2_local0 ) )
		end
	end )
	CACHeader:linkToElementModel( self, nil, false, function ( model )
		CACHeader:setModel( model, f1_arg0 )
	end )
	CACHeader:registerEventHandler( "menu_loaded", function ( element, event )
		local f4_local0 = nil
		if element.menuLoaded then
			f4_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f4_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	self:addElement( CACHeader )
	self.CACHeader = CACHeader
	
	local Mark2BonusExpLongBadge = CoD.Mark2BonusExpLongBadge.new( f1_local1, f1_arg0, 0.5, 0.5, -790, -530, 0, 0, 600, 618 )
	Mark2BonusExpLongBadge:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f5_local0
				if not IsCurrentMenu( menu, "PaintjobWeaponSelect" ) then
					f5_local0 = CoD.CACUtility.IsProgressionEnabledForMenu( menu )
					if f5_local0 then
						f5_local0 = CoD.ModelUtility.IsModelValueGreaterThan( f1_arg0, "hudItems.previewingMK2Weapon", 0 )
					end
				else
					f5_local0 = false
				end
				return f5_local0
			end
		}
	} )
	local ItemInfo = Mark2BonusExpLongBadge
	local WeaponLevel = Mark2BonusExpLongBadge.subscribeToModel
	local WeaponAttributes = Engine[@"hash_4DF5CFBC1771947"]( f1_arg0 )
	WeaponLevel( ItemInfo, WeaponAttributes["hudItems.previewingMK2Weapon"], function ( f6_arg0 )
		f1_local1:updateElementState( Mark2BonusExpLongBadge, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f6_arg0:get(),
			modelName = "hudItems.previewingMK2Weapon"
		} )
	end, false )
	Mark2BonusExpLongBadge:linkToElementModel( Mark2BonusExpLongBadge, "weaponModelSlot", true, function ( model )
		f1_local1:updateElementState( Mark2BonusExpLongBadge, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = model:get(),
			modelName = "weaponModelSlot"
		} )
	end )
	Mark2BonusExpLongBadge:linkToElementModel( Mark2BonusExpLongBadge, "itemIndex", true, function ( model )
		f1_local1:updateElementState( Mark2BonusExpLongBadge, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = model:get(),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( Mark2BonusExpLongBadge )
	self.Mark2BonusExpLongBadge = Mark2BonusExpLongBadge
	
	WeaponLevel = CoD.ItemWeaponLevel.new( f1_local1, f1_arg0, 0.5, 0.5, -790, 790, 0, 0, 650, 662 )
	self:addElement( WeaponLevel )
	self.WeaponLevel = WeaponLevel
	
	ItemInfo = CoD.ItemNameDescUnlockText.new( f1_local1, f1_arg0, 0.5, 0.5, -792, -292, 0, 0, 451.5, 558.5 )
	self:addElement( ItemInfo )
	self.ItemInfo = ItemInfo
	
	WeaponAttributes = CoD.WeaponAttributes.new( f1_local1, f1_arg0, 0.5, 0.5, 450, 895, 0, 0, 425, 675 )
	WeaponAttributes:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return MenuPropertyIsTrue( menu, "_showWeaponVariantList" )
			end
		}
	} )
	self:addElement( WeaponAttributes )
	self.WeaponAttributes = WeaponAttributes
	
	local RestrictedText = CoD.RestrictedItemWarningText.new( f1_local1, f1_arg0, 0.5, 0.5, -247, 247, 0, 0, 635, 665 )
	self:addElement( RestrictedText )
	self.RestrictedText = RestrictedText
	
	local DoubleWeaponXPIcon = CoD.DoubleWeaponXPIcon.new( f1_local1, f1_arg0, 0.5, 0.5, -881, -809, 0, 0, 600, 672 )
	self:addElement( DoubleWeaponXPIcon )
	self.DoubleWeaponXPIcon = DoubleWeaponXPIcon
	
	local WeaponListWidget = CoD.WeaponListWidget.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0, 0, 680, 1170 )
	self:addElement( WeaponListWidget )
	self.WeaponListWidget = WeaponListWidget
	
	local FooterContainerFrontendRight = CoD.FooterContainer_Frontend_Right.new( f1_local1, f1_arg0, 0, 1, 0, 0, 1, 1, -48, 0 )
	FooterContainerFrontendRight:registerEventHandler( "menu_loaded", function ( element, event )
		local f10_local0 = nil
		if element.menuLoaded then
			f10_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f10_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f10_local0 then
			f10_local0 = element:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	self:addElement( FooterContainerFrontendRight )
	self.FooterContainerFrontendRight = FooterContainerFrontendRight
	
	local TopBar = CoD.header_container_frontend.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 0, 0, 42 )
	TopBar:registerEventHandler( "menu_loaded", function ( element, event )
		local f11_local0 = nil
		if element.menuLoaded then
			f11_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f11_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f11_local0 then
			f11_local0 = element:dispatchEventToChildren( event )
		end
		return f11_local0
	end )
	self:addElement( TopBar )
	self.TopBar = TopBar
	
	WeaponLevel:linkToElementModel( WeaponListWidget.weaponList, nil, false, function ( model )
		WeaponLevel:setModel( model, f1_arg0 )
	end )
	WeaponAttributes:linkToElementModel( WeaponListWidget.weaponList, "weaponAttributes", false, function ( model )
		WeaponAttributes:setModel( model, f1_arg0 )
	end )
	RestrictedText:linkToElementModel( WeaponListWidget.weaponList, nil, false, function ( model )
		RestrictedText:setModel( model, f1_arg0 )
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], nil, function ( element, menu, controller, model )
		if MenuPropertyIsTrue( menu, "_showWeaponVariantList" ) and IsPC() then
			CoD.CACUtility.HideWeaponVariantList( menu, controller )
			return true
		elseif not IsPC() then
			PlaySoundAlias( "uin_party_ease_slide_back" )
			CoD.CACUtility.PlayChooseScreenOutro( menu, controller, "Close" )
			DelayUnhideFreecursorGoBack( menu, controller, 200 )
			return true
		elseif IsPC() then
			PlaySoundAlias( "uin_party_ease_slide_back" )
			CoD.CACUtility.PlayChooseScreenOutro( menu, controller, "ClosePC" )
			DelayGoBack( menu, controller, 70 )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if MenuPropertyIsTrue( menu, "_showWeaponVariantList" ) and IsPC() then
			CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_370A9FDC87CD3D48", nil, nil )
			return true
		elseif not IsPC() then
			CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_370A9FDC87CD3D48", nil, nil )
			return true
		elseif IsPC() then
			CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_370A9FDC87CD3D48", nil, nil )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		CoD.CACUtility.UpdateClassWeaponModel( f1_local1, element, f1_arg0 )
		ClearMenuSavedState( f1_local1 )
		SetControllerModelValue( f1_arg0, "hudItems.previewingMK2Weapon", 0 )
	end )
	self:subscribeToGlobalModel( f1_arg0, "PerController", "VariantListShownUpdate", function ( model )
		local f18_local0 = self
		UpdateElementState( self, "WeaponAttributes", f1_arg0 )
	end )
	if CoD.isPC then
		XCamMouseControl.id = "XCamMouseControl"
	end
	WeaponListWidget.id = "WeaponListWidget"
	FooterContainerFrontendRight:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		FooterContainerFrontendRight.id = "FooterContainerFrontendRight"
	end
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = WeaponListWidget
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	local f1_local14 = self
	if not IsPC() then
		CoD.BaseUtility.SetModelFromPropertyModel( f1_arg0, self, self )
		CoD.CACUtility.PlayChooseScreenIntro( f1_local1, f1_arg0, 200, "Open", false )
		MenuHidesFreeCursor( f1_local1, f1_arg0 )
	elseif IsPC() then
		CoD.BaseUtility.SetModelFromPropertyModel( f1_arg0, self, self )
		CoD.CACUtility.PlayChooseScreenIntro( f1_local1, f1_arg0, 200, "OpenPC", false )
		MenuHidesFreeCursor( f1_local1, f1_arg0 )
	end

	RushPrintInfo("Called", "Weapon Flyout")
	self:setRGB(1, 0, 0)

	return self
end

CoD.WeaponSelectFlyout.__resetProperties = function ( f19_arg0 )
	f19_arg0.WeaponListWidget:completeAnimation()
	f19_arg0.BackgroundSlidePanel:completeAnimation()
	f19_arg0.WeaponListWidget:setTopBottom( 0, 0, 680, 1170 )
	f19_arg0.WeaponListWidget:setAlpha( 1 )
	f19_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 672, 1294 )
	f19_arg0.BackgroundSlidePanel:setAlpha( 1 )
end

CoD.WeaponSelectFlyout.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f20_arg0, f20_arg1 )
			f20_arg0:__resetProperties()
			f20_arg0:setupElementClipCounter( 2 )
			f20_arg0.BackgroundSlidePanel:completeAnimation()
			f20_arg0.BackgroundSlidePanel:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.BackgroundSlidePanel )
			f20_arg0.WeaponListWidget:completeAnimation()
			f20_arg0.WeaponListWidget:setTopBottom( 0, 0, 1080, 1570 )
			f20_arg0.clipFinished( f20_arg0.WeaponListWidget )
		end,
		Open = function ( f21_arg0, f21_arg1 )
			f21_arg0:__resetProperties()
			f21_arg0:setupElementClipCounter( 2 )
			local f21_local0 = function ( f22_arg0 )
				local f22_local0 = function ( f23_arg0 )
					f23_arg0:beginAnimation( 100, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
					f23_arg0:setTopBottom( 0, 0, 672, 1294 )
					f23_arg0:setAlpha( 1 )
					f23_arg0:registerEventHandler( "transition_complete_keyframe", f21_arg0.clipFinished )
				end
				
				f21_arg0.BackgroundSlidePanel:beginAnimation( 100 )
				f21_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 872, 1494 )
				f21_arg0.BackgroundSlidePanel:registerEventHandler( "interrupted_keyframe", f21_arg0.clipInterrupted )
				f21_arg0.BackgroundSlidePanel:registerEventHandler( "transition_complete_keyframe", f22_local0 )
			end
			
			f21_arg0.BackgroundSlidePanel:completeAnimation()
			f21_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 1072, 1694 )
			f21_arg0.BackgroundSlidePanel:setAlpha( 0 )
			f21_local0( f21_arg0.BackgroundSlidePanel )
			local f21_local1 = function ( f24_arg0 )
				local f24_local0 = function ( f25_arg0 )
					f25_arg0:beginAnimation( 49 )
					f25_arg0:setTopBottom( 0, 0, 680, 1170 )
					f25_arg0:setAlpha( 1 )
					f25_arg0:registerEventHandler( "transition_complete_keyframe", f21_arg0.clipFinished )
				end
				
				f21_arg0.WeaponListWidget:beginAnimation( 200, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
				f21_arg0.WeaponListWidget:setTopBottom( 0, 0, 700, 1190 )
				f21_arg0.WeaponListWidget:registerEventHandler( "interrupted_keyframe", f21_arg0.clipInterrupted )
				f21_arg0.WeaponListWidget:registerEventHandler( "transition_complete_keyframe", f24_local0 )
			end
			
			f21_arg0.WeaponListWidget:completeAnimation()
			f21_arg0.WeaponListWidget:setTopBottom( 0, 0, 1080, 1570 )
			f21_arg0.WeaponListWidget:setAlpha( 0.01 )
			f21_local1( f21_arg0.WeaponListWidget )
		end,
		Close = function ( f26_arg0, f26_arg1 )
			f26_arg0:__resetProperties()
			f26_arg0:setupElementClipCounter( 2 )
			local f26_local0 = function ( f27_arg0 )
				f26_arg0.BackgroundSlidePanel:beginAnimation( 200, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
				f26_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 1072, 1694 )
				f26_arg0.BackgroundSlidePanel:setAlpha( 0 )
				f26_arg0.BackgroundSlidePanel:registerEventHandler( "interrupted_keyframe", f26_arg0.clipInterrupted )
				f26_arg0.BackgroundSlidePanel:registerEventHandler( "transition_complete_keyframe", f26_arg0.clipFinished )
			end
			
			f26_arg0.BackgroundSlidePanel:completeAnimation()
			f26_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 672, 1294 )
			f26_arg0.BackgroundSlidePanel:setAlpha( 1 )
			f26_local0( f26_arg0.BackgroundSlidePanel )
			local f26_local1 = function ( f28_arg0 )
				f26_arg0.WeaponListWidget:beginAnimation( 200, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
				f26_arg0.WeaponListWidget:setTopBottom( 0, 0, 1080, 1570 )
				f26_arg0.WeaponListWidget:setAlpha( 0 )
				f26_arg0.WeaponListWidget:registerEventHandler( "interrupted_keyframe", f26_arg0.clipInterrupted )
				f26_arg0.WeaponListWidget:registerEventHandler( "transition_complete_keyframe", f26_arg0.clipFinished )
			end
			
			f26_arg0.WeaponListWidget:completeAnimation()
			f26_arg0.WeaponListWidget:setTopBottom( 0, 0, 680, 1170 )
			f26_arg0.WeaponListWidget:setAlpha( 1 )
			f26_local1( f26_arg0.WeaponListWidget )
		end,
		OpenPC = function ( f29_arg0, f29_arg1 )
			f29_arg0:__resetProperties()
			f29_arg0:setupElementClipCounter( 2 )
			local f29_local0 = function ( f30_arg0 )
				f29_arg0.BackgroundSlidePanel:beginAnimation( 70 )
				f29_arg0.BackgroundSlidePanel:setAlpha( 1 )
				f29_arg0.BackgroundSlidePanel:registerEventHandler( "interrupted_keyframe", f29_arg0.clipInterrupted )
				f29_arg0.BackgroundSlidePanel:registerEventHandler( "transition_complete_keyframe", f29_arg0.clipFinished )
			end
			
			f29_arg0.BackgroundSlidePanel:completeAnimation()
			f29_arg0.BackgroundSlidePanel:setAlpha( 0 )
			f29_local0( f29_arg0.BackgroundSlidePanel )
			local f29_local1 = function ( f31_arg0 )
				f29_arg0.WeaponListWidget:beginAnimation( 70 )
				f29_arg0.WeaponListWidget:setAlpha( 1 )
				f29_arg0.WeaponListWidget:registerEventHandler( "interrupted_keyframe", f29_arg0.clipInterrupted )
				f29_arg0.WeaponListWidget:registerEventHandler( "transition_complete_keyframe", f29_arg0.clipFinished )
			end
			
			f29_arg0.WeaponListWidget:completeAnimation()
			f29_arg0.WeaponListWidget:setAlpha( 0 )
			f29_local1( f29_arg0.WeaponListWidget )
		end,
		ClosePC = function ( f32_arg0, f32_arg1 )
			f32_arg0:__resetProperties()
			f32_arg0:setupElementClipCounter( 2 )
			local f32_local0 = function ( f33_arg0 )
				f32_arg0.BackgroundSlidePanel:beginAnimation( 40 )
				f32_arg0.BackgroundSlidePanel:setAlpha( 0 )
				f32_arg0.BackgroundSlidePanel:registerEventHandler( "interrupted_keyframe", f32_arg0.clipInterrupted )
				f32_arg0.BackgroundSlidePanel:registerEventHandler( "transition_complete_keyframe", f32_arg0.clipFinished )
			end
			
			f32_arg0.BackgroundSlidePanel:completeAnimation()
			f32_arg0.BackgroundSlidePanel:setAlpha( 1 )
			f32_local0( f32_arg0.BackgroundSlidePanel )
			local f32_local1 = function ( f34_arg0 )
				f32_arg0.WeaponListWidget:beginAnimation( 40 )
				f32_arg0.WeaponListWidget:setAlpha( 0 )
				f32_arg0.WeaponListWidget:registerEventHandler( "interrupted_keyframe", f32_arg0.clipInterrupted )
				f32_arg0.WeaponListWidget:registerEventHandler( "transition_complete_keyframe", f32_arg0.clipFinished )
			end
			
			f32_arg0.WeaponListWidget:completeAnimation()
			f32_arg0.WeaponListWidget:setAlpha( 1 )
			f32_local1( f32_arg0.WeaponListWidget )
		end
	}
}

CoD.WeaponSelectFlyout.__onClose = function ( f35_arg0 )
	f35_arg0.WeaponLevel:close()
	f35_arg0.WeaponAttributes:close()
	f35_arg0.RestrictedText:close()
	f35_arg0.XCamMouseControl:close()
	f35_arg0.BackgroundSlidePanel:close()
	f35_arg0.CACHeader:close()
	f35_arg0.Mark2BonusExpLongBadge:close()
	f35_arg0.ItemInfo:close()
	f35_arg0.DoubleWeaponXPIcon:close()
	f35_arg0.WeaponListWidget:close()
	f35_arg0.FooterContainerFrontendRight:close()
	f35_arg0.TopBar:close()
end

-- Weapons Attachments
CoD.WeaponAttachmentSelect = InheritFrom( CoD.Menu )
LUI.createMenu.WeaponAttachmentSelect = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "WeaponAttachmentSelect", f1_arg0 )
	local f1_local1 = self
	SetModelToGlobalDataSource( f1_arg0, self, "AttachmentMenu" )
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1 )
	self:setClass( CoD.WeaponAttachmentSelect )
	self.soundSet = "CAC_PrimaryWeapon"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	local XCamMouseControl = nil
	
	XCamMouseControl = CoD.XCamMouseControl.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 0, 150, 650 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local BackgroundSlidePanel = CoD.cac_background_slide_panel_short.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 0, 639, 1261 )
	self:addElement( BackgroundSlidePanel )
	self.BackgroundSlidePanel = BackgroundSlidePanel
	
	local WeaponAttachmentContainer = CoD.WeaponAttachmentContainer.new( f1_local1, f1_arg0, 0.5, 0.5, -400, 400, 0, 0, 692, 992 )
	self:addElement( WeaponAttachmentContainer )
	self.WeaponAttachmentContainer = WeaponAttachmentContainer
	
	local AttachmentName = LUI.UIText.new( 0.5, 0.5, -791, -38, 0, 0, 495, 527 )
	AttachmentName:setRGB( 0.92, 0.89, 0.72 )
	AttachmentName:setTTF( "ttmussels_demibold" )
	AttachmentName:setLetterSpacing( 14 )
	AttachmentName:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_558C8A85F2048829"] )
	AttachmentName:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_3F41D595A2B0EDF3"] )
	self:addElement( AttachmentName )
	self.AttachmentName = AttachmentName
	
	local AttachmentDescription = LUI.UIText.new( 0.5, 0.5, -790, -315, 0, 0, 540, 558 )
	AttachmentDescription:setRGB( 0.8, 0.79, 0.78 )
	AttachmentDescription:setTTF( "dinnext_regular" )
	AttachmentDescription:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_558C8A85F2048829"] )
	AttachmentDescription:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_3F41D595A2B0EDF3"] )
	self:addElement( AttachmentDescription )
	self.AttachmentDescription = AttachmentDescription
	
	local UnlockDescription = CoD.onOffText.new( f1_local1, f1_arg0, 0.5, 0.5, -793, -446, 0, 0, 451, 469 )
	UnlockDescription:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not CoD.CACUtility.IsCACAttachmentItemLocked( menu, element, f1_arg0 )
			end
		}
	} )
	UnlockDescription:linkToElementModel( UnlockDescription, "itemIndex", true, function ( model )
		f1_local1:updateElementState( UnlockDescription, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = model:get(),
			modelName = "itemIndex"
		} )
	end )
	UnlockDescription:setRGB( 0.39, 0.39, 0.39 )
	self:addElement( UnlockDescription )
	self.UnlockDescription = UnlockDescription
	
	local DirectorDividerWithGradient = CoD.DirectorDividerWithGradient.new( f1_local1, f1_arg0, 0.5, 0.5, -790, -390, 0, 0, 532, 533 )
	DirectorDividerWithGradient:setRGB( 0.39, 0.39, 0.39 )
	self:addElement( DirectorDividerWithGradient )
	self.DirectorDividerWithGradient = DirectorDividerWithGradient
	
	local CACHeader = CoD.CACHeader.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0, 0, 0, 67 )
	CACHeader.subtitle.StageTitle:setText( LocalizeToUpperString( @"hash_7560ECCA7484F00E" ) )
	CACHeader.subtitle.subtitle:setAlpha( 0 )
	CACHeader:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			CACHeader.subtitle.subtitle:setText( Engine[@"hash_4F9F1239CFD921FE"]( f4_local0 ) )
		end
	end )
	CACHeader:linkToElementModel( self, nil, false, function ( model )
		CACHeader:setModel( model, f1_arg0 )
	end )
	CACHeader:registerEventHandler( "menu_loaded", function ( element, event )
		local f6_local0 = nil
		if element.menuLoaded then
			f6_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f6_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f6_local0 then
			f6_local0 = element:dispatchEventToChildren( event )
		end
		return f6_local0
	end )
	self:addElement( CACHeader )
	self.CACHeader = CACHeader
	
	local BackingGrayMediumLeft = CoD.header_container_frontend.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 0, 0, 42 )
	BackingGrayMediumLeft:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		if element.menuLoaded then
			f7_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f7_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:addElement( BackingGrayMediumLeft )
	self.BackingGrayMediumLeft = BackingGrayMediumLeft
	
	local FooterContainerFrontendRight = CoD.FooterContainer_Frontend_Right.new( f1_local1, f1_arg0, 0, 1, 0, 0, 1, 1, -48, 0 )
	FooterContainerFrontendRight:registerEventHandler( "menu_loaded", function ( element, event )
		local f8_local0 = nil
		if element.menuLoaded then
			f8_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f8_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	self:addElement( FooterContainerFrontendRight )
	self.FooterContainerFrontendRight = FooterContainerFrontendRight
	
	local WeaponLevel = CoD.ItemWeaponLevel.new( f1_local1, f1_arg0, 0.5, 0.5, -790, 790, 0, 0, 650, 662 )
	self:addElement( WeaponLevel )
	self.WeaponLevel = WeaponLevel
	
	local AttachmentFlyoutContainer = CoD.AttachmentFlyoutContainer.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -540, 540 )
	LUI.OverrideFunction_CallOriginalFirst( AttachmentFlyoutContainer, "close", function ( element )
		if not IsBooleanDvarSet( "ui_attachmentFlyout" ) then
			CoD.WeaponAttachmentsUtility.CleanAttachmentDescriptionFlyouts( self, element, f1_arg0, f1_local1 )
		end
	end )
	self.__on_menuOpened_AttachmentFlyoutContainer = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		local f10_local0 = AttachmentFlyoutContainer
		if not IsBooleanDvarSet( "ui_attachmentFlyout" ) then
			CoD.WeaponAttachmentsUtility.SetupAttachmentDescriptionFlyouts( self, f10_local0, f10_arg1, f10_arg2 )
		end
	end
	
	f1_local1:addMenuOpenedCallback( self.__on_menuOpened_AttachmentFlyoutContainer )
	self:addElement( AttachmentFlyoutContainer )
	self.AttachmentFlyoutContainer = AttachmentFlyoutContainer
	
	local WeaponAttributes = CoD.WeaponAttributes.new( f1_local1, f1_arg0, 0.5, 0.5, 430, 875, 0, 0, 420, 670 )
	self:addElement( WeaponAttributes )
	self.WeaponAttributes = WeaponAttributes
	
	local RestrictedItemWarningText = CoD.RestrictedItemWarningText.new( f1_local1, f1_arg0, 0.5, 0.5, -247, 247, 0.59, 0.59, 0, 30 )
	self:addElement( RestrictedItemWarningText )
	self.RestrictedItemWarningText = RestrictedItemWarningText
	
	AttachmentName:linkToElementModel( WeaponAttachmentContainer.GeneralAttachmentContainer.AttachmentList, "displayName", true, function ( model )
		local f11_local0 = model:get()
		if f11_local0 ~= nil then
			AttachmentName:setText( Engine[@"hash_4F9F1239CFD921FE"]( f11_local0 ) )
		end
	end )
	AttachmentDescription:linkToElementModel( WeaponAttachmentContainer.GeneralAttachmentContainer.AttachmentList, "description", true, function ( model )
		local f12_local0 = model:get()
		if f12_local0 ~= nil then
			AttachmentDescription:setText( f12_local0 )
		end
	end )
	UnlockDescription:linkToElementModel( WeaponAttachmentContainer.GeneralAttachmentContainer.AttachmentList, nil, false, function ( model )
		UnlockDescription:setModel( model, f1_arg0 )
	end )
	UnlockDescription:linkToElementModel( WeaponAttachmentContainer.GeneralAttachmentContainer.AttachmentList, "itemIndex", true, function ( model )
		local f14_local0 = model:get()
		if f14_local0 ~= nil then
			UnlockDescription.TextBox:setText( Engine[@"hash_4F9F1239CFD921FE"]( CoD.CACUtility.GetAttachmentUnlockDescription( f1_local1, f1_arg0, f14_local0 ) ) )
		end
	end )
	WeaponAttributes:linkToElementModel( WeaponAttachmentContainer.GeneralAttachmentContainer.AttachmentList, "weaponAttributes", false, function ( model )
		WeaponAttributes:setModel( model, f1_arg0 )
	end )
	WeaponAttributes:linkToElementModel( WeaponAttachmentContainer.GeneralAttachmentContainer.AttachmentList, nil, false, function ( model )
		WeaponAttributes.MutualExclusiveWarning:setModel( model, f1_arg0 )
	end )
	RestrictedItemWarningText:linkToElementModel( WeaponAttachmentContainer.GeneralAttachmentContainer.AttachmentList, nil, false, function ( model )
		RestrictedItemWarningText:setModel( model, f1_arg0 )
	end )
	self:appendEventHandler( "input_source_changed", function ( f18_arg0, f18_arg1 )
		f18_arg1.menu = f18_arg1.menu or f1_local1
		CoD.Menu.UpdateButtonShownState( f18_arg0, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3820DDD869ABBFAA"] )
	end )
	local f1_local16 = self
	local f1_local17 = self.subscribeToModel
	local f1_local18 = Engine[@"hash_4DF5CFBC1771947"]( f1_arg0 )
	f1_local17( f1_local16, f1_local18.LastInput, function ( f19_arg0, f19_arg1 )
		CoD.Menu.UpdateButtonShownState( f19_arg1, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3820DDD869ABBFAA"] )
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], nil, function ( element, menu, controller, model )
		if not IsPC() then
			PlaySoundAlias( "uin_party_ease_slide_back" )
			CoD.CACUtility.PlayChooseScreenOutro( menu, controller, "Close" )
			DelayUnhideFreecursorGoBack( menu, controller, 200 )
			return true
		elseif IsPC() then
			PlaySoundAlias( "uin_party_ease_slide_back" )
			CoD.CACUtility.PlayChooseScreenOutro( menu, controller, "ClosePC" )
			DelayGoBack( menu, controller, 70 )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsPC() then
			CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_370A9FDC87CD3D48", nil, nil )
			return true
		elseif IsPC() then
			CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_370A9FDC87CD3D48", nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3820DDD869ABBFAA"], "F10", function ( element, menu, controller, model )
		if IsMouseOrKeyboard( controller ) then
			CoD.CACUtility.RemoveAllAttachmentsFromClass( menu, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsMouseOrKeyboard( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_3820DDD869ABBFAA"], @"hash_5E9CED3392B6716C", nil, "F10" )
			return true
		else
			return false
		end
	end, false )
	self.__on_menuOpened_self = function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		local f24_local0 = self
		CoD.WeaponAttachmentsUtility.CenterAttachmentLayout( self, f24_arg1, f24_arg2, self.WeaponAttachmentContainer )
	end
	
	f1_local1:addMenuOpenedCallback( self.__on_menuOpened_self )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetPerControllerTableProperty( f1_arg0, "attachmentSlot", nil )
		CoD.CACUtility.UpdateClassWeaponModel( f1_local1, element, f1_arg0 )
		ClearMenuSavedState( f1_local1 )
	end )
	if CoD.isPC then
		XCamMouseControl.id = "XCamMouseControl"
	end
	WeaponAttachmentContainer.id = "WeaponAttachmentContainer"
	FooterContainerFrontendRight:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		FooterContainerFrontendRight.id = "FooterContainerFrontendRight"
	end
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = WeaponAttachmentContainer
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	self.__on_close_removeOverrides = function ()
		f1_local1:removeMenuOpenedCallback( self.__on_menuOpened_self )
		f1_local1:removeMenuOpenedCallback( self.__on_menuOpened_AttachmentFlyoutContainer )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	f1_local17 = self
	if not IsPC() then
		CoD.CACUtility.UpdateWeaponAttachmentModel( f1_local1, f1_local17, f1_arg0, false )
		CoD.BaseUtility.SetModelFromPropertyModel( f1_arg0, self, self )
		CoD.WeaponAttachmentsUtility.SetWeaponInfo( self, f1_arg0, f1_local1 )
		CoD.CACUtility.PlayChooseScreenIntro( f1_local1, f1_arg0, 200, "Open", true )
	elseif IsPC() then
		CoD.CACUtility.UpdateWeaponAttachmentModel( f1_local1, f1_local17, f1_arg0, false )
		CoD.BaseUtility.SetModelFromPropertyModel( f1_arg0, self, self )
		CoD.WeaponAttachmentsUtility.SetWeaponInfo( self, f1_arg0, f1_local1 )
		CoD.CACUtility.PlayChooseScreenIntro( f1_local1, f1_arg0, 200, "OpenPC", true )
	end

	RushPrintInfo("Called", "Weapon Attachments")
	self:setRGB(1, 0, 0)

	return self
end

CoD.WeaponAttachmentSelect.__resetProperties = function ( f27_arg0 )
	f27_arg0.WeaponAttachmentContainer:completeAnimation()
	f27_arg0.BackgroundSlidePanel:completeAnimation()
	f27_arg0.WeaponAttachmentContainer:setTopBottom( 0, 0, 692, 992 )
	f27_arg0.WeaponAttachmentContainer:setAlpha( 1 )
	f27_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 639, 1261 )
	f27_arg0.BackgroundSlidePanel:setAlpha( 1 )
end

CoD.WeaponAttachmentSelect.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f28_arg0, f28_arg1 )
			f28_arg0:__resetProperties()
			f28_arg0:setupElementClipCounter( 2 )
			f28_arg0.BackgroundSlidePanel:completeAnimation()
			f28_arg0.BackgroundSlidePanel:setAlpha( 0 )
			f28_arg0.clipFinished( f28_arg0.BackgroundSlidePanel )
			f28_arg0.WeaponAttachmentContainer:completeAnimation()
			f28_arg0.WeaponAttachmentContainer:setTopBottom( 0, 0, 1080, 1380 )
			f28_arg0.clipFinished( f28_arg0.WeaponAttachmentContainer )
		end,
		Open = function ( f29_arg0, f29_arg1 )
			f29_arg0:__resetProperties()
			f29_arg0:setupElementClipCounter( 2 )
			local f29_local0 = function ( f30_arg0 )
				local f30_local0 = function ( f31_arg0 )
					f31_arg0:beginAnimation( 100, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
					f31_arg0:setTopBottom( 0, 0, 639, 1261 )
					f31_arg0:setAlpha( 1 )
					f31_arg0:registerEventHandler( "transition_complete_keyframe", f29_arg0.clipFinished )
				end
				
				f29_arg0.BackgroundSlidePanel:beginAnimation( 100 )
				f29_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 859.5, 1481.5 )
				f29_arg0.BackgroundSlidePanel:registerEventHandler( "interrupted_keyframe", f29_arg0.clipInterrupted )
				f29_arg0.BackgroundSlidePanel:registerEventHandler( "transition_complete_keyframe", f30_local0 )
			end
			
			f29_arg0.BackgroundSlidePanel:completeAnimation()
			f29_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 1080, 1702 )
			f29_arg0.BackgroundSlidePanel:setAlpha( 0 )
			f29_local0( f29_arg0.BackgroundSlidePanel )
			local f29_local1 = function ( f32_arg0 )
				local f32_local0 = function ( f33_arg0 )
					f33_arg0:beginAnimation( 49 )
					f33_arg0:setTopBottom( 0, 0, 692, 992 )
					f33_arg0:setAlpha( 1 )
					f33_arg0:registerEventHandler( "transition_complete_keyframe", f29_arg0.clipFinished )
				end
				
				f29_arg0.WeaponAttachmentContainer:beginAnimation( 200 )
				f29_arg0.WeaponAttachmentContainer:setTopBottom( 0, 0, 705, 1005 )
				f29_arg0.WeaponAttachmentContainer:registerEventHandler( "interrupted_keyframe", f29_arg0.clipInterrupted )
				f29_arg0.WeaponAttachmentContainer:registerEventHandler( "transition_complete_keyframe", f32_local0 )
			end
			
			f29_arg0.WeaponAttachmentContainer:completeAnimation()
			f29_arg0.WeaponAttachmentContainer:setTopBottom( 0, 0, 1103, 1403 )
			f29_arg0.WeaponAttachmentContainer:setAlpha( 0 )
			f29_local1( f29_arg0.WeaponAttachmentContainer )
		end,
		Close = function ( f34_arg0, f34_arg1 )
			f34_arg0:__resetProperties()
			f34_arg0:setupElementClipCounter( 2 )
			local f34_local0 = function ( f35_arg0 )
				local f35_local0 = function ( f36_arg0 )
					f36_arg0:beginAnimation( 100, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
					f36_arg0:setTopBottom( 0, 0, 1090, 1712 )
					f36_arg0:registerEventHandler( "transition_complete_keyframe", f34_arg0.clipFinished )
				end
				
				f34_arg0.BackgroundSlidePanel:beginAnimation( 100 )
				f34_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 864.5, 1486.5 )
				f34_arg0.BackgroundSlidePanel:setAlpha( 0 )
				f34_arg0.BackgroundSlidePanel:registerEventHandler( "interrupted_keyframe", f34_arg0.clipInterrupted )
				f34_arg0.BackgroundSlidePanel:registerEventHandler( "transition_complete_keyframe", f35_local0 )
			end
			
			f34_arg0.BackgroundSlidePanel:completeAnimation()
			f34_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 639, 1261 )
			f34_arg0.BackgroundSlidePanel:setAlpha( 1 )
			f34_local0( f34_arg0.BackgroundSlidePanel )
			local f34_local1 = function ( f37_arg0 )
				local f37_local0 = function ( f38_arg0 )
					f38_arg0:beginAnimation( 100, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
					f38_arg0:setTopBottom( 0, 0, 1113, 1413 )
					f38_arg0:registerEventHandler( "transition_complete_keyframe", f34_arg0.clipFinished )
				end
				
				f34_arg0.WeaponAttachmentContainer:beginAnimation( 100 )
				f34_arg0.WeaponAttachmentContainer:setTopBottom( 0, 0, 902.5, 1202.5 )
				f34_arg0.WeaponAttachmentContainer:setAlpha( 0 )
				f34_arg0.WeaponAttachmentContainer:registerEventHandler( "interrupted_keyframe", f34_arg0.clipInterrupted )
				f34_arg0.WeaponAttachmentContainer:registerEventHandler( "transition_complete_keyframe", f37_local0 )
			end
			
			f34_arg0.WeaponAttachmentContainer:completeAnimation()
			f34_arg0.WeaponAttachmentContainer:setTopBottom( 0, 0, 692, 992 )
			f34_arg0.WeaponAttachmentContainer:setAlpha( 1 )
			f34_local1( f34_arg0.WeaponAttachmentContainer )
		end,
		OpenPC = function ( f39_arg0, f39_arg1 )
			f39_arg0:__resetProperties()
			f39_arg0:setupElementClipCounter( 2 )
			local f39_local0 = function ( f40_arg0 )
				f39_arg0.BackgroundSlidePanel:beginAnimation( 70 )
				f39_arg0.BackgroundSlidePanel:setAlpha( 1 )
				f39_arg0.BackgroundSlidePanel:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.BackgroundSlidePanel:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.BackgroundSlidePanel:completeAnimation()
			f39_arg0.BackgroundSlidePanel:setAlpha( 0 )
			f39_local0( f39_arg0.BackgroundSlidePanel )
			local f39_local1 = function ( f41_arg0 )
				f39_arg0.WeaponAttachmentContainer:beginAnimation( 70 )
				f39_arg0.WeaponAttachmentContainer:setAlpha( 1 )
				f39_arg0.WeaponAttachmentContainer:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.WeaponAttachmentContainer:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.WeaponAttachmentContainer:completeAnimation()
			f39_arg0.WeaponAttachmentContainer:setAlpha( 0 )
			f39_local1( f39_arg0.WeaponAttachmentContainer )
		end,
		ClosePC = function ( f42_arg0, f42_arg1 )
			f42_arg0:__resetProperties()
			f42_arg0:setupElementClipCounter( 2 )
			local f42_local0 = function ( f43_arg0 )
				f42_arg0.BackgroundSlidePanel:beginAnimation( 40 )
				f42_arg0.BackgroundSlidePanel:setAlpha( 0 )
				f42_arg0.BackgroundSlidePanel:registerEventHandler( "interrupted_keyframe", f42_arg0.clipInterrupted )
				f42_arg0.BackgroundSlidePanel:registerEventHandler( "transition_complete_keyframe", f42_arg0.clipFinished )
			end
			
			f42_arg0.BackgroundSlidePanel:completeAnimation()
			f42_arg0.BackgroundSlidePanel:setAlpha( 1 )
			f42_local0( f42_arg0.BackgroundSlidePanel )
			local f42_local1 = function ( f44_arg0 )
				f42_arg0.WeaponAttachmentContainer:beginAnimation( 40 )
				f42_arg0.WeaponAttachmentContainer:setAlpha( 0 )
				f42_arg0.WeaponAttachmentContainer:registerEventHandler( "interrupted_keyframe", f42_arg0.clipInterrupted )
				f42_arg0.WeaponAttachmentContainer:registerEventHandler( "transition_complete_keyframe", f42_arg0.clipFinished )
			end
			
			f42_arg0.WeaponAttachmentContainer:completeAnimation()
			f42_arg0.WeaponAttachmentContainer:setAlpha( 1 )
			f42_local1( f42_arg0.WeaponAttachmentContainer )
		end
	}
}

CoD.WeaponAttachmentSelect.__onClose = function ( f45_arg0 )
	f45_arg0.__on_close_removeOverrides()
	f45_arg0.AttachmentName:close()
	f45_arg0.AttachmentDescription:close()
	f45_arg0.UnlockDescription:close()
	f45_arg0.WeaponAttributes:close()
	f45_arg0.RestrictedItemWarningText:close()
	f45_arg0.XCamMouseControl:close()
	f45_arg0.BackgroundSlidePanel:close()
	f45_arg0.WeaponAttachmentContainer:close()
	f45_arg0.DirectorDividerWithGradient:close()
	f45_arg0.CACHeader:close()
	f45_arg0.BackingGrayMediumLeft:close()
	f45_arg0.FooterContainerFrontendRight:close()
	f45_arg0.WeaponLevel:close()
	f45_arg0.AttachmentFlyoutContainer:close()
end

-- Armory
CoD.Armory = InheritFrom( CoD.Menu )
LUI.createMenu.Armory = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "Armory", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1 )
	SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, true )
	SetControllerModelValue( f1_arg0, "Unlockables.listUpdate", 0 )
	CoD.BaseUtility.InitControllerModelIfNotSet( f1_arg0, "CustomClassList.equippedItemsChanged", false )
	SetMenuProperty( f1_local1, "__ignoreUnlockablesDefaultSelectIndex", true )
	CoD.BaseUtility.CreateControllerModel( f1_arg0, "VariantListShownUpdate" )
	self:setClass( CoD.Armory )
	self.soundSet = "CAC_PrimaryWeapon"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	local ScorestreakAspectRatioFix = nil
	
	ScorestreakAspectRatioFix = CoD.Scorestreak_AspectRatioFix.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	ScorestreakAspectRatioFix:mergeStateConditions( {
		{
			stateName = "Warzone",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ScorestreakAspectRatioFix )
	self.ScorestreakAspectRatioFix = ScorestreakAspectRatioFix
	
	local XCamMouseControl = nil
	
	XCamMouseControl = CoD.XCamMouseControl.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 0, 146, 646 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local BackgroundSlidePanel = CoD.cac_background_slide_panel.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 0, 672, 1294 )
	BackgroundSlidePanel:setZoom( 70 )
	self:addElement( BackgroundSlidePanel )
	self.BackgroundSlidePanel = BackgroundSlidePanel
	
	local CACHeader = CoD.CommonHeader.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0, 0, 0, 67 )
	CACHeader.subtitle.StageTitle:setText( LocalizeToUpperString( @"hash_7D6BF3A3749C31CD" ) )
	CACHeader.subtitle.subtitle:setAlpha( 0 )
	CACHeader:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			CACHeader.subtitle.subtitle:setText( Engine[@"hash_4F9F1239CFD921FE"]( f3_local0 ) )
		end
	end )
	CACHeader:linkToElementModel( self, nil, false, function ( model )
		CACHeader:setModel( model, f1_arg0 )
	end )
	CACHeader:registerEventHandler( "menu_loaded", function ( element, event )
		local f5_local0 = nil
		if element.menuLoaded then
			f5_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f5_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:addElement( CACHeader )
	self.CACHeader = CACHeader
	
	local ItemInfo = CoD.ItemNameDescUnlockText.new( f1_local1, f1_arg0, 0.5, 0.5, -792, -292, 0, 0, 451.5, 558.5 )
	ItemInfo:mergeStateConditions( {
		{
			stateName = "Zombie",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ItemInfo )
	self.ItemInfo = ItemInfo
	
	local WeaponLevel = CoD.ItemWeaponLevel.new( f1_local1, f1_arg0, 0.5, 0.5, -790, 790, 0, 0, 650, 662 )
	self:addElement( WeaponLevel )
	self.WeaponLevel = WeaponLevel
	
	local WeaponAttributes = CoD.WeaponAttributes.new( f1_local1, f1_arg0, 0.5, 0.5, 450, 895, 0, 0, 425, 675 )
	WeaponAttributes:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return MenuPropertyIsTrue( menu, "_showWeaponVariantList" )
			end
		}
	} )
	WeaponAttributes:setZoom( 85 )
	self:addElement( WeaponAttributes )
	self.WeaponAttributes = WeaponAttributes
	
	local WeaponListWidget = CoD.Armory_WeaponListWidget.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0, 0, 673, 1163 )
	self:addElement( WeaponListWidget )
	self.WeaponListWidget = WeaponListWidget
	
	local FooterContainerFrontendRight = CoD.FooterContainer_Frontend_Right.new( f1_local1, f1_arg0, 0, 1, 0, 0, 1, 1, -48, 0 )
	FooterContainerFrontendRight:registerEventHandler( "menu_loaded", function ( element, event )
		local f8_local0 = nil
		if element.menuLoaded then
			f8_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f8_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	self:addElement( FooterContainerFrontendRight )
	self.FooterContainerFrontendRight = FooterContainerFrontendRight
	
	local TopBar = CoD.header_container_frontend.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 42 )
	TopBar:registerEventHandler( "menu_loaded", function ( element, event )
		local f9_local0 = nil
		if element.menuLoaded then
			f9_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f9_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f9_local0 then
			f9_local0 = element:dispatchEventToChildren( event )
		end
		return f9_local0
	end )
	self:addElement( TopBar )
	self.TopBar = TopBar
	
	WeaponLevel:linkToElementModel( WeaponListWidget.weaponList, nil, false, function ( model )
		WeaponLevel:setModel( model, f1_arg0 )
	end )
	WeaponAttributes:linkToElementModel( WeaponListWidget.weaponList, "weaponAttributes", false, function ( model )
		WeaponAttributes:setModel( model, f1_arg0 )
	end )
	self:registerEventHandler( "occlusion_change", function ( self, event )
		local f12_local0 = nil
		if self.OcclusionChange then
			f12_local0 = self:OcclusionChange( event )
		elseif self.super.OcclusionChange then
			f12_local0 = self.super:OcclusionChange( event )
		end
		if IsEventPropertyEqualTo( event, "occluded", true ) then
			MenuUnhideFreeCursor( f1_local1, f1_arg0 )
		else
			MenuHidesFreeCursor( f1_local1, f1_arg0 )
		end
		if not f12_local0 then
			f12_local0 = self:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], nil, function ( element, menu, controller, model )
		if MenuPropertyIsTrue( menu, "_showWeaponVariantList" ) and IsPC() then
			CoD.CACUtility.HideWeaponVariantList( menu, controller )
			return true
		else
			PlaySoundAlias( "uin_party_ease_slide_back" )
			CoD.CACUtility.PlayChooseScreenOutro( menu, controller, "Close" )
			SaveLoadoutGeneric( controller )
			DelayGoBack( menu, controller, 200 )
			CoD.LobbyUtility.SetMenuControllerRestriction( self, controller, 0 )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_370A9FDC87CD3D48", nil, nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		CoD.CACUtility.UpdateClassWeaponModel( f1_local1, element, f1_arg0 )
		SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, false )
	end )
	self:subscribeToGlobalModel( f1_arg0, "PerController", "VariantListShownUpdate", function ( model )
		local f16_local0 = self
		UpdateElementState( self, "WeaponAttributes", f1_arg0 )
	end )
	if CoD.isPC then
		XCamMouseControl.id = "XCamMouseControl"
	end
	WeaponListWidget.id = "WeaponListWidget"
	FooterContainerFrontendRight:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		FooterContainerFrontendRight.id = "FooterContainerFrontendRight"
	end
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = WeaponListWidget
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	local f1_local12 = self
	CoD.BaseUtility.SetModelFromPropertyModel( f1_arg0, self, self )
	CoD.CACUtility.PlayChooseScreenIntro( f1_local1, f1_arg0, 200, "Open", false )
	CoD.LobbyUtility.SetMenuControllerRestriction( self, f1_arg0, 1 )
	CoD.FTUEUtility.ShowFTUESequenceIfNotSeen( self, f1_arg0, "ZMArmoryIntroduction" )
	MenuHidesFreeCursor( f1_local1, f1_arg0 )

	RushPrintInfo("Called", "Armory")
	self:setRGB(1, 0, 1)

	return self
end

CoD.Armory.__resetProperties = function ( f17_arg0 )
	f17_arg0.WeaponListWidget:completeAnimation()
	f17_arg0.BackgroundSlidePanel:completeAnimation()
	f17_arg0.WeaponListWidget:setTopBottom( 0, 0, 673, 1163 )
	f17_arg0.WeaponListWidget:setAlpha( 1 )
	f17_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 672, 1294 )
	f17_arg0.BackgroundSlidePanel:setAlpha( 1 )
end

CoD.Armory.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f18_arg0, f18_arg1 )
			f18_arg0:__resetProperties()
			f18_arg0:setupElementClipCounter( 2 )
			f18_arg0.BackgroundSlidePanel:completeAnimation()
			f18_arg0.BackgroundSlidePanel:setAlpha( 0 )
			f18_arg0.clipFinished( f18_arg0.BackgroundSlidePanel )
			f18_arg0.WeaponListWidget:completeAnimation()
			f18_arg0.WeaponListWidget:setTopBottom( 0, 0, 1080, 1570 )
			f18_arg0.clipFinished( f18_arg0.WeaponListWidget )
		end,
		Open = function ( f19_arg0, f19_arg1 )
			f19_arg0:__resetProperties()
			f19_arg0:setupElementClipCounter( 2 )
			local f19_local0 = function ( f20_arg0 )
				local f20_local0 = function ( f21_arg0 )
					f21_arg0:beginAnimation( 100, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
					f21_arg0:setTopBottom( 0, 0, 672, 1294 )
					f21_arg0:setAlpha( 1 )
					f21_arg0:registerEventHandler( "transition_complete_keyframe", f19_arg0.clipFinished )
				end
				
				f19_arg0.BackgroundSlidePanel:beginAnimation( 100 )
				f19_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 872, 1494 )
				f19_arg0.BackgroundSlidePanel:registerEventHandler( "interrupted_keyframe", f19_arg0.clipInterrupted )
				f19_arg0.BackgroundSlidePanel:registerEventHandler( "transition_complete_keyframe", f20_local0 )
			end
			
			f19_arg0.BackgroundSlidePanel:completeAnimation()
			f19_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 1072, 1694 )
			f19_arg0.BackgroundSlidePanel:setAlpha( 0 )
			f19_local0( f19_arg0.BackgroundSlidePanel )
			local f19_local1 = function ( f22_arg0 )
				local f22_local0 = function ( f23_arg0 )
					f23_arg0:beginAnimation( 49 )
					f23_arg0:setTopBottom( 0, 0, 680, 1170 )
					f23_arg0:setAlpha( 1 )
					f23_arg0:registerEventHandler( "transition_complete_keyframe", f19_arg0.clipFinished )
				end
				
				f19_arg0.WeaponListWidget:beginAnimation( 200, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
				f19_arg0.WeaponListWidget:setTopBottom( 0, 0, 700, 1190 )
				f19_arg0.WeaponListWidget:registerEventHandler( "interrupted_keyframe", f19_arg0.clipInterrupted )
				f19_arg0.WeaponListWidget:registerEventHandler( "transition_complete_keyframe", f22_local0 )
			end
			
			f19_arg0.WeaponListWidget:completeAnimation()
			f19_arg0.WeaponListWidget:setTopBottom( 0, 0, 1080, 1570 )
			f19_arg0.WeaponListWidget:setAlpha( 0 )
			f19_local1( f19_arg0.WeaponListWidget )
		end,
		Close = function ( f24_arg0, f24_arg1 )
			f24_arg0:__resetProperties()
			f24_arg0:setupElementClipCounter( 2 )
			local f24_local0 = function ( f25_arg0 )
				f24_arg0.BackgroundSlidePanel:beginAnimation( 200, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
				f24_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 1072, 1694 )
				f24_arg0.BackgroundSlidePanel:setAlpha( 0 )
				f24_arg0.BackgroundSlidePanel:registerEventHandler( "interrupted_keyframe", f24_arg0.clipInterrupted )
				f24_arg0.BackgroundSlidePanel:registerEventHandler( "transition_complete_keyframe", f24_arg0.clipFinished )
			end
			
			f24_arg0.BackgroundSlidePanel:completeAnimation()
			f24_arg0.BackgroundSlidePanel:setTopBottom( 0, 0, 672, 1294 )
			f24_arg0.BackgroundSlidePanel:setAlpha( 1 )
			f24_local0( f24_arg0.BackgroundSlidePanel )
			local f24_local1 = function ( f26_arg0 )
				f24_arg0.WeaponListWidget:beginAnimation( 200, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
				f24_arg0.WeaponListWidget:setTopBottom( 0, 0, 1080, 1570 )
				f24_arg0.WeaponListWidget:setAlpha( 0 )
				f24_arg0.WeaponListWidget:registerEventHandler( "interrupted_keyframe", f24_arg0.clipInterrupted )
				f24_arg0.WeaponListWidget:registerEventHandler( "transition_complete_keyframe", f24_arg0.clipFinished )
			end
			
			f24_arg0.WeaponListWidget:completeAnimation()
			f24_arg0.WeaponListWidget:setTopBottom( 0, 0, 680, 1170 )
			f24_arg0.WeaponListWidget:setAlpha( 1 )
			f24_local1( f24_arg0.WeaponListWidget )
		end
	}
}

CoD.Armory.__onClose = function ( f27_arg0 )
	f27_arg0.WeaponLevel:close()
	f27_arg0.WeaponAttributes:close()
	f27_arg0.ScorestreakAspectRatioFix:close()
	f27_arg0.XCamMouseControl:close()
	f27_arg0.BackgroundSlidePanel:close()
	f27_arg0.CACHeader:close()
	f27_arg0.ItemInfo:close()
	f27_arg0.WeaponListWidget:close()
	f27_arg0.FooterContainerFrontendRight:close()
	f27_arg0.TopBar:close()
end

-- ZM Equipment
CoD.ZMEquipmentSelect = InheritFrom( CoD.Menu )
LUI.createMenu.ZMEquipmentSelect = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "ZMEquipmentSelect", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1 )
	self:setClass( CoD.ZMEquipmentSelect )
	self.soundSet = "ZCAC"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	
	local BackgroundSlidePanel = CoD.cac_background_slide_panel.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0.5, 0.5, 132, 754 )
	BackgroundSlidePanel:setZoom( 70 )
	self:addElement( BackgroundSlidePanel )
	self.BackgroundSlidePanel = BackgroundSlidePanel
	
	local RestrictedText = CoD.RestrictedItemWarningText.new( f1_local1, f1_arg0, 0.5, 0.5, -247, 247, 0.5, 0.5, 70, 100 )
	self:addElement( RestrictedText )
	self.RestrictedText = RestrictedText
	
	local itemList = LUI.UIList.new( f1_local1, f1_arg0, 10, 0, nil, false, false, false, false )
	itemList:setLeftRight( 0.5, 0.5, -469, 469 )
	itemList:setTopBottom( 0.5, 0.5, 195, 307 )
	itemList:setWidgetType( CoD.ZMItemGridButtonSmall )
	itemList:setHorizontalCount( 6 )
	itemList:setSpacing( 10 )
	itemList:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_1FEEB12BCB0D7041"] )
	itemList:setDataSource( "Unlockables" )
	itemList:linkToElementModel( itemList, "globalItemIndex", true, function ( model, f2_arg1 )
		CoD.Menu.UpdateButtonShownState( f2_arg1, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"] )
	end )
	itemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = nil
		CoD.CACUtility.UpdateWeaponModel( f1_local1, element, f1_arg0 )
		return f3_local0
	end )
	itemList:registerEventHandler( "lose_list_focus", function ( element, event )
		local f4_local0 = nil
		CoD.CACUtility.SetActiveListItemToEquippedItem( f1_local1, f1_arg0, element )
		CoD.CACUtility.UpdateWeaponModel( f1_local1, element, f1_arg0 )
		return f4_local0
	end )
	itemList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"] )
		return f5_local0
	end )
	f1_local1:AddButtonCallbackFunction( itemList, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"], "ui_confirm", function ( element, menu, controller, model )
		if IsPC() and CoD.CACUtility.IsItemEquippedInCurrentLoadout( menu, element, controller ) and not CoD.CACUtility.IsCACItemLocked( menu, element, controller ) then
			GoBack( self, controller )
			return true
		elseif not CoD.CACUtility.IsItemEquippedInCurrentLoadout( menu, element, controller ) and not CoD.CACUtility.IsCACItemLocked( menu, element, controller ) then
			CoD.CACUtility.EquipWeapon( self, element, menu, controller, false )
			UpdateSelfElementState( menu, self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsPC() and CoD.CACUtility.IsItemEquippedInCurrentLoadout( menu, element, controller ) and not CoD.CACUtility.IsCACItemLocked( menu, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"], @"hash_0", Enum[@"hash_3BEBDBAEEB3ECCCA"][@"hash_4B6372335C630AD3"], "ui_confirm" )
			return false
		elseif not CoD.CACUtility.IsItemEquippedInCurrentLoadout( menu, element, controller ) and not CoD.CACUtility.IsCACItemLocked( menu, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"], @"hash_6D0BB36CD318F55F", nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self.__on_menuOpened_itemList = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		local f8_local0 = itemList
		CoD.CACUtility.SetActiveListItemToEquippedItem( f8_arg2, f8_arg1, f8_local0 )
		CoD.CACUtility.UpdateWeaponModel( f8_arg2, f8_local0, f8_arg1 )
	end
	
	f1_local1:addMenuOpenedCallback( self.__on_menuOpened_itemList )
	self:addElement( itemList )
	self.itemList = itemList
	
	local ItemInfo = CoD.ItemNameDescUnlockText.new( f1_local1, f1_arg0, 0.5, 0.5, -753, -253, 0.5, 0.5, -48, 59 )
	ItemInfo:mergeStateConditions( {
		{
			stateName = "Zombie",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ItemInfo )
	self.ItemInfo = ItemInfo
	
	local CACHeader = CoD.CommonHeader.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0, 0, 0, 67 )
	CACHeader.subtitle.StageTitle:setText( LocalizeToUpperString( CoD.CACUtility.GetHeaderNameForLoadoutSlot( self, @"hash_15C60F77B9332E5B" ) ) )
	CACHeader.subtitle.subtitle:setAlpha( 0 )
	CACHeader:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f10_local0 = model:get()
		if f10_local0 ~= nil then
			CACHeader.subtitle.subtitle:setText( Engine[@"hash_4F9F1239CFD921FE"]( f10_local0 ) )
		end
	end )
	CACHeader:linkToElementModel( self, nil, false, function ( model )
		CACHeader:setModel( model, f1_arg0 )
	end )
	CACHeader:registerEventHandler( "menu_loaded", function ( element, event )
		local f12_local0 = nil
		if element.menuLoaded then
			f12_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f12_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f12_local0 then
			f12_local0 = element:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	self:addElement( CACHeader )
	self.CACHeader = CACHeader
	
	local BackingGrayMediumLeft = CoD.header_container_frontend.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 42 )
	BackingGrayMediumLeft:registerEventHandler( "menu_loaded", function ( element, event )
		local f13_local0 = nil
		if element.menuLoaded then
			f13_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f13_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f13_local0 then
			f13_local0 = element:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	self:addElement( BackingGrayMediumLeft )
	self.BackingGrayMediumLeft = BackingGrayMediumLeft
	
	local FooterContainerFrontendRight = CoD.FooterContainer_Frontend_Right.new( f1_local1, f1_arg0, 0, 1, 0, 0, 1, 1, -48, 0 )
	FooterContainerFrontendRight:registerEventHandler( "menu_loaded", function ( element, event )
		local f14_local0 = nil
		if element.menuLoaded then
			f14_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f14_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f14_local0 then
			f14_local0 = element:dispatchEventToChildren( event )
		end
		return f14_local0
	end )
	self:addElement( FooterContainerFrontendRight )
	self.FooterContainerFrontendRight = FooterContainerFrontendRight
	
	local XCamMouseControl = nil
	
	XCamMouseControl = CoD.XCamMouseControl.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 0, 67, 672 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	RestrictedText:linkToElementModel( itemList, nil, false, function ( model )
		RestrictedText:setModel( model, f1_arg0 )
	end )
	ItemInfo:linkToElementModel( itemList, nil, false, function ( model )
		ItemInfo:setModel( model, f1_arg0 )
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_370A9FDC87CD3D48", nil, nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		CoD.CACUtility.ClearClassWeaponModel( f1_local1, f1_arg0 )
	end )
	itemList.id = "itemList"
	FooterContainerFrontendRight:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		FooterContainerFrontendRight.id = "FooterContainerFrontendRight"
	end
	if CoD.isPC then
		XCamMouseControl.id = "XCamMouseControl"
	end
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = itemList
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	self.__on_close_removeOverrides = function ()
		f1_local1:removeMenuOpenedCallback( self.__on_menuOpened_itemList )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	local f1_local10 = self
	if not CoD.BaseUtility.IsMenuSessionModeEqualTo( f1_local1, Enum[@"hash_59C0C2196D8313A0"][@"hash_73723205FAE52C4A"] ) then
		CoD.CACUtility.UpdateWeaponModel( f1_local1, self, f1_arg0 )
		CoD.BaseUtility.SetModelFromPropertyModel( f1_arg0, self, self )
	end

	RushPrintInfo("Called", "ZM Equipment")
	self:setRGB(1, 0, 0)

	return self
end

CoD.ZMEquipmentSelect.__onClose = function ( f21_arg0 )
	f21_arg0.__on_close_removeOverrides()
	f21_arg0.RestrictedText:close()
	f21_arg0.ItemInfo:close()
	f21_arg0.BackgroundSlidePanel:close()
	f21_arg0.itemList:close()
	f21_arg0.CACHeader:close()
	f21_arg0.BackingGrayMediumLeft:close()
	f21_arg0.FooterContainerFrontendRight:close()
	f21_arg0.XCamMouseControl:close()
end

-- ZM Special Weapon
CoD.ZMSpecialWeaponSelect = InheritFrom( CoD.Menu )
LUI.createMenu.ZMSpecialWeaponSelect = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "ZMSpecialWeaponSelect", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1 )
	self:setClass( CoD.ZMSpecialWeaponSelect )
	self.soundSet = "ZCAC"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	
	local BackgroundSlidePanel = CoD.cac_background_slide_panel.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0.5, 0.5, 132, 754 )
	BackgroundSlidePanel:setZoom( 70 )
	self:addElement( BackgroundSlidePanel )
	self.BackgroundSlidePanel = BackgroundSlidePanel
	
	local RestrictedText = CoD.RestrictedItemWarningText.new( f1_local1, f1_arg0, 0.5, 0.5, -247, 247, 0.5, 0.5, 76, 106 )
	self:addElement( RestrictedText )
	self.RestrictedText = RestrictedText
	
	local itemList = LUI.UIList.new( f1_local1, f1_arg0, 9, 0, nil, false, false, false, false )
	itemList:setLeftRight( 0.5, 0.5, -597.5, 597.5 )
	itemList:setTopBottom( 0.5, 0.5, 264, 410 )
	itemList:setWidgetType( CoD.ZMItemGridButton )
	itemList:setHorizontalCount( 4 )
	itemList:setSpacing( 9 )
	itemList:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_1FEEB12BCB0D7041"] )
	itemList:setDataSource( "ZMSpecialWeapons" )
	itemList:linkToElementModel( itemList, "globalItemIndex", true, function ( model, f2_arg1 )
		CoD.Menu.UpdateButtonShownState( f2_arg1, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"] )
	end )
	itemList:linkToElementModel( itemList, "refHash", true, function ( model, f3_arg1 )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"] )
	end )
	itemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f4_local0 = nil
		CoD.CACUtility.UpdateWeaponModel( f1_local1, element, f1_arg0 )
		CoD.ZMLoadoutUtility.UpdateZMSpecialWeaponActiveStageModel( element, f1_arg0 )
		return f4_local0
	end )
	itemList:registerEventHandler( "lose_list_focus", function ( element, event )
		local f5_local0 = nil
		CoD.CACUtility.SetActiveListItemToEquippedItem( f1_local1, f1_arg0, element )
		CoD.CACUtility.UpdateWeaponModel( f1_local1, element, f1_arg0 )
		CoD.ZMLoadoutUtility.UpdateZMSpecialWeaponActiveStageModel( element, f1_arg0 )
		return f5_local0
	end )
	itemList:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"] )
		return f6_local0
	end )
	f1_local1:AddButtonCallbackFunction( itemList, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"], "ui_confirm", function ( element, menu, controller, model )
		if not CoD.CACUtility.IsCACItemLocked( menu, element, controller ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( menu, element, controller ) then
			CoD.CACUtility.EquipWeapon( self, element, menu, controller, false )
			UpdateSelfElementState( menu, self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not CoD.CACUtility.IsCACItemLocked( menu, element, controller ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( menu, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"], @"hash_6D0BB36CD318F55F", nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self.__on_menuOpened_itemList = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		CoD.CACUtility.SetActiveListItemToEquippedItem( f9_arg2, f9_arg1, itemList )
	end
	
	f1_local1:addMenuOpenedCallback( self.__on_menuOpened_itemList )
	self:addElement( itemList )
	self.itemList = itemList
	
	local ItemInfo = CoD.ItemNameDescUnlockText.new( f1_local1, f1_arg0, 0.5, 0.5, -755, -255, 0.5, 0.5, -65, 42 )
	ItemInfo:mergeStateConditions( {
		{
			stateName = "Zombie",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ItemInfo )
	self.ItemInfo = ItemInfo
	
	local TopBar = LUI.UIImage.new( -0.07, 1.13, 0, 0, 0.5, 0.5, 171, 174 )
	TopBar:setRGB( 0.32, 0.55, 0.67 )
	TopBar:setImage( RegisterImage( @"hash_242BCCF45B82FBED" ) )
	self:addElement( TopBar )
	self.TopBar = TopBar
	
	local TopBar2 = LUI.UIImage.new( -0.07, 1.13, 0, 0, 0.5, 0.5, 247, 250 )
	TopBar2:setRGB( 0.36, 0.61, 0.74 )
	TopBar2:setZoom( 2 )
	TopBar2:setImage( RegisterImage( @"hash_242BCCF45B82FBED" ) )
	TopBar2:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_54E6CE42E0799F57" ) )
	self:addElement( TopBar2 )
	self.TopBar2 = TopBar2
	
	local hint = LUI.UIText.new( 0.5, 0.5, -960, 960, 0.5, 0.5, 145, 163 )
	hint:setRGB( 0.58, 0.58, 0.58 )
	hint:setText( Engine[@"hash_4F9F1239CFD921FE"]( @"hash_4AF3B94B4D16A655" ) )
	hint:setTTF( "ttmussels_regular" )
	hint:setLetterSpacing( 2 )
	hint:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_1FEEB12BCB0D7041"] )
	hint:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_3F41D595A2B0EDF3"] )
	self:addElement( hint )
	self.hint = hint
	
	local StageList = LUI.UIList.new( f1_local1, f1_arg0, 144, 0, nil, false, false, false, false )
	StageList:setLeftRight( 0.5, 0.5, -594, 594 )
	StageList:setTopBottom( 0.5, 0.5, 189, 289 )
	StageList:setWidgetType( CoD.ZMSpecialWeapon_StageInfo )
	StageList:setHorizontalCount( 3 )
	StageList:setSpacing( 144 )
	StageList:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_558C8A85F2048829"] )
	StageList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f11_local0 = nil
		CoD.ZMLoadoutUtility.UpdateZMSpecialWeaponStageModel( f1_local1, element, f1_arg0 )
		CoD.ZMLoadoutUtility.SetZMSpecialWeaponStageModel( element, f1_arg0 )
		return f11_local0
	end )
	self:addElement( StageList )
	self.StageList = StageList
	
	local ZMSpecialWeaponStageDescription = CoD.ZMSpecialWeapon_StageDescription.new( f1_local1, f1_arg0, 0.5, 0.5, 155, 755, 0.5, 0.5, -65, 42 )
	ZMSpecialWeaponStageDescription:subscribeToGlobalModel( f1_arg0, "ZMSpecialWeaponStage", nil, function ( model )
		ZMSpecialWeaponStageDescription:setModel( model, f1_arg0 )
	end )
	self:addElement( ZMSpecialWeaponStageDescription )
	self.ZMSpecialWeaponStageDescription = ZMSpecialWeaponStageDescription
	
	local FooterContainerFrontendRight = CoD.FooterContainer_Frontend_Right.new( f1_local1, f1_arg0, 0, 1, 0, 0, 1, 1, -48, 0 )
	FooterContainerFrontendRight:registerEventHandler( "menu_loaded", function ( element, event )
		local f13_local0 = nil
		if element.menuLoaded then
			f13_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f13_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f13_local0 then
			f13_local0 = element:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	self:addElement( FooterContainerFrontendRight )
	self.FooterContainerFrontendRight = FooterContainerFrontendRight
	
	local CACHeader = CoD.CommonHeader.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0, 0, 0, 67 )
	CACHeader.subtitle.StageTitle:setText( LocalizeToUpperString( CoD.CACUtility.GetHeaderNameForLoadoutSlot( self, @"hash_15C60F77B9332E5B" ) ) )
	CACHeader.subtitle.subtitle:setAlpha( 0 )
	CACHeader:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f14_local0 = model:get()
		if f14_local0 ~= nil then
			CACHeader.subtitle.subtitle:setText( Engine[@"hash_4F9F1239CFD921FE"]( f14_local0 ) )
		end
	end )
	CACHeader:linkToElementModel( self, nil, false, function ( model )
		CACHeader:setModel( model, f1_arg0 )
	end )
	CACHeader:registerEventHandler( "menu_loaded", function ( element, event )
		local f16_local0 = nil
		if element.menuLoaded then
			f16_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f16_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f16_local0 then
			f16_local0 = element:dispatchEventToChildren( event )
		end
		return f16_local0
	end )
	self:addElement( CACHeader )
	self.CACHeader = CACHeader
	
	local BackingGrayMediumLeft = CoD.header_container_frontend.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 42 )
	BackingGrayMediumLeft:registerEventHandler( "menu_loaded", function ( element, event )
		local f17_local0 = nil
		if element.menuLoaded then
			f17_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f17_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f17_local0 then
			f17_local0 = element:dispatchEventToChildren( event )
		end
		return f17_local0
	end )
	self:addElement( BackingGrayMediumLeft )
	self.BackingGrayMediumLeft = BackingGrayMediumLeft
	
	local arrow = LUI.UIImage.new( 0.5, 0.5, -318, -154, 0.5, 0.5, 174, 250 )
	arrow:setImage( RegisterImage( @"hash_5FCA9CA5BDA28506" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	local arrow2 = LUI.UIImage.new( 0.5, 0.5, 126, 290, 0.5, 0.5, 174, 250 )
	arrow2:setImage( RegisterImage( @"hash_5FCA9CA5BDA28506" ) )
	self:addElement( arrow2 )
	self.arrow2 = arrow2
	
	local XCamMouseControl = nil
	
	XCamMouseControl = CoD.XCamMouseControl.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0.5, 0.5, -473, 132 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	RestrictedText:linkToElementModel( itemList, nil, false, function ( model )
		RestrictedText:setModel( model, f1_arg0 )
	end )
	ItemInfo:linkToElementModel( itemList, nil, false, function ( model )
		ItemInfo:setModel( model, f1_arg0 )
	end )
	StageList:linkToElementModel( itemList, "stageDetailDatasource", true, function ( model )
		local f20_local0 = model:get()
		if f20_local0 ~= nil then
			StageList:setDataSource( f20_local0 )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f21_local0 = nil
		if self.menuLoaded then
			f21_local0 = self:menuLoaded( event )
		elseif self.super.menuLoaded then
			f21_local0 = self.super:menuLoaded( event )
		end
		SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, true )
		if not f21_local0 then
			f21_local0 = self:dispatchEventToChildren( event )
		end
		return f21_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_370A9FDC87CD3D48", nil, nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, false )
		CoD.CACUtility.ClearClassWeaponModel( f1_local1, f1_arg0 )
	end )
	itemList.id = "itemList"
	StageList.id = "StageList"
	FooterContainerFrontendRight:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		FooterContainerFrontendRight.id = "FooterContainerFrontendRight"
	end
	if CoD.isPC then
		XCamMouseControl.id = "XCamMouseControl"
	end
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = itemList
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	self.__on_close_removeOverrides = function ()
		f1_local1:removeMenuOpenedCallback( self.__on_menuOpened_itemList )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	local f1_local17 = self
	CoD.CACUtility.UpdateWeaponModel( f1_local1, self, f1_arg0 )
	CoD.BaseUtility.SetModelFromPropertyModel( f1_arg0, self, self )

	RushPrintInfo("Called", "ZM Special Weapon")
	self:setRGB(1, 0, 0)

	return self
end

CoD.ZMSpecialWeaponSelect.__onClose = function ( f26_arg0 )
	f26_arg0.__on_close_removeOverrides()
	f26_arg0.RestrictedText:close()
	f26_arg0.ItemInfo:close()
	f26_arg0.StageList:close()
	f26_arg0.BackgroundSlidePanel:close()
	f26_arg0.itemList:close()
	f26_arg0.ZMSpecialWeaponStageDescription:close()
	f26_arg0.FooterContainerFrontendRight:close()
	f26_arg0.CACHeader:close()
	f26_arg0.BackingGrayMediumLeft:close()
	f26_arg0.XCamMouseControl:close()
end

-- AAR
CoD.AAR_T8_ZM = InheritFrom( CoD.Menu )
LUI.createMenu.AAR_T8_ZM = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "AAR_T8_ZM", f1_arg0 )
	local f1_local1 = self
	CoD.AARUtility.InitAARModels( f1_arg0 )
	MenuHidesFreeCursor( f1_local1, f1_arg0 )
	self:setClass( CoD.AAR_T8_ZM )
	self.soundSet = "CAC"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	
	local Backing = LUI.UIImage.new( 0, 1, 0, 0, -0.1, 1, 0, 0 )
	Backing:setRGB( 0, 0, 1 )
	Backing:setAlpha( 0 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local AARSummaryTab = CoD.AARSummaryTab.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -442, 458 )
	AARSummaryTab:subscribeToGlobalModel( f1_arg0, "AARSummaryStats", nil, function ( model )
		AARSummaryTab:setModel( model, f1_arg0 )
	end )
	AARSummaryTab:setRGB(1, 0, 0)
	self:addElement( AARSummaryTab )
	self.AARSummaryTab = AARSummaryTab
	
	local AARContractsTab = CoD.AARContractsTab.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -450, 450 )
	AARContractsTab:setRGB(1, 0, 1)
	self:addElement( AARContractsTab )
	self.AARContractsTab = AARContractsTab
	
	local ZMAARScoreboardTab = CoD.ZMAARScoreboardTab.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -442, 458 )
	ZMAARScoreboardTab:subscribeToGlobalModel( f1_arg0, "AARSummaryStats", nil, function ( model )
		ZMAARScoreboardTab:setModel( model, f1_arg0 )
	end )
	ZMAARScoreboardTab:setRGB(1, 1, 0)
	self:addElement( ZMAARScoreboardTab )
	self.ZMAARScoreboardTab = ZMAARScoreboardTab
	
	local ZMAARTrialTab = CoD.ZMAARTrialTab.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -442, 458 )
	ZMAARTrialTab:subscribeToGlobalModel( f1_arg0, "AARSummaryStats", nil, function ( model )
		ZMAARTrialTab:setModel( model, f1_arg0 )
	end )
	ZMAARTrialTab:setRGB(1, 0, 0)
	self:addElement( ZMAARTrialTab )
	self.ZMAARTrialTab = ZMAARTrialTab
	
	local AARMedalsTab = CoD.AARMedalsTab.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -442, 458 )
	AARMedalsTab:setAlpha( 0 )
	AARMedalsTab:setRGB(1, 0, 1)
	self:addElement( AARMedalsTab )
	self.AARMedalsTab = AARMedalsTab
	
	local AARRewardsTab = CoD.AARRewardsTab.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -442, 458 )
	AARMedalsTab:setRGB(1, 0, 1)
	self:addElement( AARRewardsTab )
	self.AARRewardsTab = AARRewardsTab
	
	local FooterContainerFrontendRight = CoD.FooterContainer_Frontend_Right.new( f1_local1, f1_arg0, 0, 1, 0, 0, 1, 1, -48, 0 )
	FooterContainerFrontendRight:registerEventHandler( "menu_loaded", function ( element, event )
		local f5_local0 = nil
		if element.menuLoaded then
			f5_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f5_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:addElement( FooterContainerFrontendRight )
	self.FooterContainerFrontendRight = FooterContainerFrontendRight
	
	local StageNotificationContainer = CoD.StageNotificationContainer.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 120 )
	StageNotificationContainer:subscribeToGlobalModel( f1_arg0, "MapVote", "mapVoteGameModeNext", function ( model )
		local f6_local0 = model:get()
		if f6_local0 ~= nil then
			StageNotificationContainer.CommonHeader.subtitle.StageTitle:setText( CoD.GameTypeUtility.GameTypeToLocalizeToUpperName( f6_local0 ) )
		end
	end )
	StageNotificationContainer:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "publicLobby.stageDetails", function ( model )
		local f7_local0 = model:get()
		if f7_local0 ~= nil then
			StageNotificationContainer.CommonHeader.subtitle.subtitle:setText( ConvertToUpperString( CoD.BaseUtility.AlreadyLocalized( f7_local0 ) ) )
		end
	end )
	StageNotificationContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f8_local0 = nil
		if element.menuLoaded then
			f8_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f8_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	AARMedalsTab:setRGB(1, 0, 0)
	self:addElement( StageNotificationContainer )
	self.StageNotificationContainer = StageNotificationContainer
	
	local CommonHeader = CoD.CommonHeader.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 67 )
	CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( @"hash_5EEF90B1483C4C23" ) )
	CommonHeader.subtitle.subtitle:setAlpha( 0 )
	CommonHeader:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f9_local0 = model:get()
		if f9_local0 ~= nil then
			CommonHeader.subtitle.subtitle:setText( Engine[@"hash_4F9F1239CFD921FE"]( f9_local0 ) )
		end
	end )
	CommonHeader:registerEventHandler( "menu_loaded", function ( element, event )
		local f10_local0 = nil
		if element.menuLoaded then
			f10_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f10_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f10_local0 then
			f10_local0 = element:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	self:addElement( CommonHeader )
	self.CommonHeader = CommonHeader
	
	local ZMAARStampWidget = CoD.ZMAARStampWidget.new( f1_local1, f1_arg0, 0.5, 0.5, 514, 854, 0.5, 0.5, -298, -218 )
	ZMAARStampWidget:setRGB(1, 0, 0)
	self:addElement( ZMAARStampWidget )
	self.ZMAARStampWidget = ZMAARStampWidget
	
	local ScoreboardTab = CoD.AARScoreboardTabButton.new( f1_local1, f1_arg0, 0.5, 0.5, -339, 339, 0, 0, 13, 47 )
	ScoreboardTab:registerEventHandler( "menu_loaded", function ( element, event )
		local f11_local0 = nil
		if element.menuLoaded then
			f11_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f11_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f11_local0 then
			f11_local0 = element:dispatchEventToChildren( event )
		end
		return f11_local0
	end )
	ScoreboardTab:setRGB(1, 0, 0)
	self:addElement( ScoreboardTab )
	self.ScoreboardTab = ScoreboardTab
	
	local TopBar = CoD.header_container_frontend.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 0, 0, 42 )
	TopBar:registerEventHandler( "menu_loaded", function ( element, event )
		local f12_local0 = nil
		if element.menuLoaded then
			f12_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f12_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f12_local0 then
			f12_local0 = element:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	TopBar:setRGB(0, 0, 1)
	self:addElement( TopBar )
	self.TopBar = TopBar
	
	local DoubleXPNotification = CoD.AARDoubleXPNotification.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0, 0, 0, 1080 )
	DoubleXPNotification:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsModelValueEqualToEnum( f1_arg0, "AAR.activeTab", CoD.AARUtility.AARTabs.AAR_SUMMARY )
			end
		}
	} )
	local f1_local16 = DoubleXPNotification
	local f1_local17 = DoubleXPNotification.subscribeToModel
	local f1_local18 = Engine[@"hash_4DF5CFBC1771947"]( f1_arg0 )
	f1_local17( f1_local16, f1_local18["AAR.activeTab"], function ( f14_arg0 )
		f1_local1:updateElementState( DoubleXPNotification, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f14_arg0:get(),
			modelName = "AAR.activeTab"
		} )
	end, false )
	DoubleXPNotification:setRGB(1, 0, 0)
	self:addElement( DoubleXPNotification )
	self.DoubleXPNotification = DoubleXPNotification
	
	self:mergeStateConditions( {
		{
			stateName = "Offline_IGR",
			condition = function ( menu, element, event )
				local f15_local0 = IsPC()
				if f15_local0 then
					f15_local0 = CoD.PCKoreaUtility.IsInIGR()
					if f15_local0 then
						f15_local0 = IsLobbyNetworkModeLAN()
					end
				end
				return f15_local0
			end
		},
		{
			stateName = "DefaultState_IGR",
			condition = function ( menu, element, event )
				return IsPC() and CoD.PCKoreaUtility.IsInIGR()
			end
		},
		{
			stateName = "Offline",
			condition = function ( menu, element, event )
				return IsLobbyNetworkModeLAN()
			end
		}
	} )
	f1_local16 = self
	f1_local17 = self.subscribeToModel
	f1_local18 = Engine[@"hash_78DF2E5447F384B9"]()
	f1_local17( f1_local16, f1_local18["lobbyRoot.lobbyNav"], function ( f18_arg0 )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f18_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	f1_local16 = self
	f1_local17 = self.subscribeToModel
	f1_local18 = Engine[@"hash_78DF2E5447F384B9"]()
	f1_local17( f1_local16, f1_local18["lobbyRoot.lobbyNav"], function ( f19_arg0, f19_arg1 )
		CoD.Menu.UpdateButtonShownState( f19_arg1, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_4C083113BC81F23F"] )
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], "ui_confirm", function ( element, menu, controller, model )
		if not IsPC() then
			CoD.AnalyticsUtility.GoBackAndShowMatchSurveyIfNecessary( menu, controller )
			MenuUnhideFreeCursor( menu, controller )
			return true
		elseif IsPC() then
			CoD.AnalyticsUtility.GoBackAndShowMatchSurveyIfNecessary( menu, controller )
			MenuUnhideFreeCursor( menu, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsPC() then
			CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_4E4E038F4690D38D", nil, "ui_confirm" )
			return true
		elseif IsPC() then
			CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_370A9FDC87CD3D48", nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_593AB4C84F113EE1"], "ESCAPE", function ( element, menu, controller, model )
		CoD.AnalyticsUtility.GoBackAndShowMatchSurveyIfNecessary( menu, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_593AB4C84F113EE1"], @"hash_0", nil, "ESCAPE" )
		return false
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_4C083113BC81F23F"], "ui_contextual_1", function ( element, menu, controller, model )
		if IsLobbyNetworkModeLive() and not IsRecentGameBookmarked( controller ) then
			FileshareBookmarkRecentGame( controller )
			UpdateButtonPromptState( menu, element, controller, Enum[@"hash_3DD78803F918E9D"][@"hash_4C083113BC81F23F"] )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsLobbyNetworkModeLive() and not IsRecentGameBookmarked( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_4C083113BC81F23F"], @"hash_6941662A2E0BF65E", nil, "ui_contextual_1" )
			return true
		else
			return false
		end
	end, false )
	self.__on_menuOpened_self = function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
		local f26_local0 = self
		CoD.AARUtility.OpenAAROverlays( f26_arg2, f26_arg1 )
	end
	
	f1_local1:addMenuOpenedCallback( self.__on_menuOpened_self )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, false )
	end )
	self:subscribeToGlobalModel( f1_arg0, "PerController", "AAR.activeTab", function ( model )
		local f28_local0 = self
		CoD.AARUtility.UpdateAARScene( f1_local1, f1_arg0 )
	end )
	AARSummaryTab.id = "AARSummaryTab"
	AARContractsTab.id = "AARContractsTab"
	ZMAARScoreboardTab.id = "ZMAARScoreboardTab"
	ZMAARTrialTab.id = "ZMAARTrialTab"
	AARMedalsTab.id = "AARMedalsTab"
	AARRewardsTab.id = "AARRewardsTab"
	FooterContainerFrontendRight:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		FooterContainerFrontendRight.id = "FooterContainerFrontendRight"
	end
	ScoreboardTab.id = "ScoreboardTab"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = AARSummaryTab
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	self.__on_close_removeOverrides = function ()
		f1_local1:removeMenuOpenedCallback( self.__on_menuOpened_self )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	f1_local17 = self
	CoD.AARUtility.AARFirstTimeOpenActions( self, f1_arg0, f1_local1 )
	CoD.AARUtility.AnimateCurrentLevelProgress( f1_local1, f1_arg0 )
	f1_local17 = DoubleXPNotification
	if not IsPC() then
		SizeToSafeArea( f1_local17, f1_arg0 )
	end

	RushPrintInfo("Called", "AAR T8")

	return self
end

CoD.AAR_T8_ZM.__resetProperties = function ( f30_arg0 )
	f30_arg0.CommonHeader:completeAnimation()
	f30_arg0.StageNotificationContainer:completeAnimation()
	f30_arg0.ZMAARStampWidget:completeAnimation()
	f30_arg0.CommonHeader:setAlpha( 1 )
	f30_arg0.StageNotificationContainer:setAlpha( 1 )
	f30_arg0.ZMAARStampWidget:setTopBottom( 0.5, 0.5, -298, -218 )
end

CoD.AAR_T8_ZM.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f31_arg0, f31_arg1 )
			f31_arg0:__resetProperties()
			f31_arg0:setupElementClipCounter( 2 )
			f31_arg0.StageNotificationContainer:completeAnimation()
			f31_arg0.StageNotificationContainer:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.StageNotificationContainer )
			f31_arg0.CommonHeader:completeAnimation()
			f31_arg0.CommonHeader:setAlpha( 1 )
			f31_arg0.clipFinished( f31_arg0.CommonHeader )
		end
	},
	Offline_IGR = {
		DefaultClip = function ( f32_arg0, f32_arg1 )
			f32_arg0:__resetProperties()
			f32_arg0:setupElementClipCounter( 2 )
			f32_arg0.StageNotificationContainer:completeAnimation()
			f32_arg0.StageNotificationContainer:setAlpha( 0 )
			f32_arg0.clipFinished( f32_arg0.StageNotificationContainer )
			f32_arg0.ZMAARStampWidget:completeAnimation()
			f32_arg0.ZMAARStampWidget:setTopBottom( 0.5, 0.5, -127, -47 )
			f32_arg0.clipFinished( f32_arg0.ZMAARStampWidget )
		end
	},
	DefaultState_IGR = {
		DefaultClip = function ( f33_arg0, f33_arg1 )
			f33_arg0:__resetProperties()
			f33_arg0:setupElementClipCounter( 3 )
			f33_arg0.StageNotificationContainer:completeAnimation()
			f33_arg0.StageNotificationContainer:setAlpha( 0 )
			f33_arg0.clipFinished( f33_arg0.StageNotificationContainer )
			f33_arg0.CommonHeader:completeAnimation()
			f33_arg0.CommonHeader:setAlpha( 1 )
			f33_arg0.clipFinished( f33_arg0.CommonHeader )
			f33_arg0.ZMAARStampWidget:completeAnimation()
			f33_arg0.ZMAARStampWidget:setTopBottom( 0.5, 0.5, -127, -47 )
			f33_arg0.clipFinished( f33_arg0.ZMAARStampWidget )
		end
	},
	Offline = {
		DefaultClip = function ( f34_arg0, f34_arg1 )
			f34_arg0:__resetProperties()
			f34_arg0:setupElementClipCounter( 1 )
			f34_arg0.StageNotificationContainer:completeAnimation()
			f34_arg0.StageNotificationContainer:setAlpha( 0 )
			f34_arg0.clipFinished( f34_arg0.StageNotificationContainer )
		end
	}
}
CoD.AAR_T8_ZM.__onClose = function ( f35_arg0 )
	f35_arg0.__on_close_removeOverrides()
	f35_arg0.AARSummaryTab:close()
	f35_arg0.AARContractsTab:close()
	f35_arg0.ZMAARScoreboardTab:close()
	f35_arg0.ZMAARTrialTab:close()
	f35_arg0.AARMedalsTab:close()
	f35_arg0.AARRewardsTab:close()
	f35_arg0.FooterContainerFrontendRight:close()
	f35_arg0.StageNotificationContainer:close()
	f35_arg0.CommonHeader:close()
	f35_arg0.ZMAARStampWidget:close()
	f35_arg0.ScoreboardTab:close()
	f35_arg0.TopBar:close()
	f35_arg0.DoubleXPNotification:close()
end

CoD.FooterButtonPrompt = InheritFrom( LUI.UIElement )
CoD.FooterButtonPrompt.__defaultWidth = 150
CoD.FooterButtonPrompt.__defaultHeight = 48
CoD.FooterButtonPrompt.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.FooterButtonPrompt )
	self.id = "FooterButtonPrompt"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local buttonPromptImage = LUI.UIImage.new( 0, 0, 24, 54, 0, 0, 9, 39 )
	buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_saturation_normal" ) )
	buttonPromptImage:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( buttonPromptImage )
	self.buttonPromptImage = buttonPromptImage
	
	local label = LUI.UIText.new( 0, 0, 63, 132, 0, 0, 14, 34 )
	label:setTTF( "ttmussels_regular" )
	label:setLetterSpacing( 6 )
	label:setAlignment( Enum[@"luialignment"][@"lui_alignment_left"] )
	label:linkToElementModel( self, "Label", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			label:setText( LocalizeToUpperString( f2_local0 ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( label, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, -40 )
	end )
	self:addElement( label )
	self.label = label
	
	local progressRing = CoD.ButtonProgressRingContainer.new( f1_arg0, f1_arg1, 0, 0, 18, 60, 0, 0, 3, 45 )
	progressRing:linkToElementModel( self, nil, false, function ( model )
		progressRing:setModel( model, f1_arg1 )
	end )
	self:addElement( progressRing )
	self.progressRing = progressRing
	
	local newIcon = CoD.NewBreadcrumbCount.new( f1_arg0, f1_arg1, 0, 0, -11, 8, 0,5, 0,5, -9, 9 )
	newIcon:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return CoD.BreadcrumbUtility.ShouldShowTheMenuBreadcrumb( element, f1_arg1 )
			end
		}
	} )
	newIcon:linkToElementModel( newIcon, "breadcrumbCount", true, function ( model )
		f1_arg0:updateElementState( newIcon, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "breadcrumbCount"
		} )
	end )
	newIcon:setYRot( 180 )
	self:addElement( newIcon )
	self.newIcon = newIcon
	
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "InitialState",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:linkToElementModel( self, nil, true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = nil
		} )
	end )
	local f1_local5 = self
	local f1_local6 = self.subscribeToModel
	local f1_local7 = DataSources.FreeCursor.getModel( f1_arg1 )
	f1_local6( f1_local5, f1_local7.usingCursorInput, function ( f11_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f11_arg0:get(),
			modelName = "usingCursorInput"
		} )
	end, false )
	f1_local5 = self
	f1_local6 = self.subscribeToModel
	f1_local7 = DataSources.FreeCursor.getModel( f1_arg1 )
	f1_local6( f1_local5, f1_local7.hidden, function ( f12_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f12_arg0:get(),
			modelName = "hidden"
		} )
	end, false )
	f1_local5 = self
	f1_local6 = self.subscribeToModel
	f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg1 )
	f1_local6( f1_local5, f1_local7.activeKeys, function ( f13_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f13_arg0:get(),
			modelName = "activeKeys"
		} )
	end, false )
	self:linkToElementModel( self, "flags", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "flags"
		} )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller, f15_arg2, f15_arg3, f15_arg4 )
		if IsSelfInState( self, "DefaultState" ) and not IsPC() then
			HideWidget( element )
		elseif not IsPC() then
			ShowWidget( element )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PreLoadFunc then
		PreLoadFunc( self, f1_arg1, f1_arg0 )
	end
	f1_local6 = self
	if IsPC() then
		DisableKeyboardNavigationByElement( self )
	end
	return self
end

CoD.FooterButtonPrompt.__resetProperties = function ( f16_arg0 )
	f16_arg0.buttonPromptImage:completeAnimation()
	f16_arg0.label:completeAnimation()
	f16_arg0.progressRing:completeAnimation()
	f16_arg0.buttonPromptImage:setRGB( 1, 1, 1 )
	f16_arg0.buttonPromptImage:setAlpha( 1 )
	f16_arg0.buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_saturation_normal" ) )
	f16_arg0.buttonPromptImage:setShaderVector( 0, 1, 0, 0, 0 )
	f16_arg0.label:setRGB( 1, 1, 1 )
	f16_arg0.label:setAlpha( 1 )
	f16_arg0.progressRing:setAlpha( 1 )
end

CoD.FooterButtonPrompt.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties()
			f17_arg0:setupElementClipCounter( 3 )
			f17_arg0.buttonPromptImage:completeAnimation()
			f17_arg0.buttonPromptImage:setAlpha( 0 )
			f17_arg0.clipFinished( f17_arg0.buttonPromptImage )
			f17_arg0.label:completeAnimation()
			f17_arg0.label:setAlpha( 0 )
			f17_arg0.clipFinished( f17_arg0.label )
			f17_arg0.progressRing:completeAnimation()
			f17_arg0.progressRing:setAlpha( 0 )
			f17_arg0.clipFinished( f17_arg0.progressRing )
		end
	},
	Disabled = {
		DefaultClip = function ( f18_arg0, f18_arg1 )
			f18_arg0:__resetProperties()
			f18_arg0:setupElementClipCounter( 2 )
			f18_arg0.buttonPromptImage:completeAnimation()
			f18_arg0.buttonPromptImage:setRGB( 0,5, 0,5, 0,5 )
			f18_arg0.buttonPromptImage:setAlpha( 0,5 )
			f18_arg0.buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_saturation_normal" ) )
			f18_arg0.buttonPromptImage:setShaderVector( 0, 0, 0, 0, 0 )
			f18_arg0.clipFinished( f18_arg0.buttonPromptImage )
			f18_arg0.label:completeAnimation()
			f18_arg0.label:setRGB( 0,5, 0,5, 0,5 )
			f18_arg0.label:setAlpha( 0,5 )
			f18_arg0.clipFinished( f18_arg0.label )
		end
	},
	Enabled = {
		DefaultClip = function ( f19_arg0, f19_arg1 )
			f19_arg0:__resetProperties()
			f19_arg0:setupElementClipCounter( 0 )
		end,
		Hide = function ( f20_arg0, f20_arg1 )
			f20_arg0:__resetProperties()
			f20_arg0:setupElementClipCounter( 2 )
			f20_arg0.buttonPromptImage:completeAnimation()
			f20_arg0.buttonPromptImage:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.buttonPromptImage )
			f20_arg0.label:completeAnimation()
			f20_arg0.label:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.label )
		end,
		Focus = function ( f21_arg0, f21_arg1 )
			f21_arg0:__resetProperties()
			f21_arg0:setupElementClipCounter( 1 )
			f21_arg0.label:completeAnimation()
			f21_arg0.label:setAlpha( 1 )
			f21_arg0.clipFinished( f21_arg0.label )
		end
	},
	InitialState = {
		DefaultClip = function ( f22_arg0, f22_arg1 )
			f22_arg0:__resetProperties()
			f22_arg0:setupElementClipCounter( 0 )
		end
	}
}

if not CoD.isPC then
	CoD.FooterButtonPrompt.__clipsPerState.Enabled.Focus = nil
end

CoD.FooterButtonPrompt.__onClose = function ( f23_arg0 )
	f23_arg0.label:close()
	f23_arg0.progressRing:close()
	f23_arg0.newIcon:close()
end

-- Create a Class
CoD.ZMCustomizeClassMenu = InheritFrom( CoD.Menu )
LUI.createMenu.ZMCustomizeClassMenu = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "ZMCustomizeClassMenu", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1 )
	SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, true )
	CoD.ZMStoryUtility.SetSelectedStoryToCurrentMapStory( f1_arg0 )
	CoD.LobbyUtility.SetMenuControllerRestriction( self, f1_arg0, 1 )
	self:setClass( CoD.ZMCustomizeClassMenu )
	self.soundSet = "FrontendMain"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	local ScorestreakAspectRatioFix = nil
	
	ScorestreakAspectRatioFix = CoD.Scorestreak_AspectRatioFix.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	ScorestreakAspectRatioFix:setRGB(1, 0, 1)
	self:addElement( ScorestreakAspectRatioFix )
	self.ScorestreakAspectRatioFix = ScorestreakAspectRatioFix
	
	local DirectorCustomizeClassZM = CoD.DirectorCustomizeClassZM.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	DirectorCustomizeClassZM:setRGB(1, 1, 0)
	self:addElement( DirectorCustomizeClassZM )
	self.DirectorCustomizeClassZM = DirectorCustomizeClassZM
	
	local GenericMenuFrame = CoD.GenericMenuFrame.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	GenericMenuFrame.CommonHeader.BGSceneBlur:setAlpha( 1 )
	GenericMenuFrame.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( @"hash_1FE4770705278297" ) )
	GenericMenuFrame:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			GenericMenuFrame.CommonHeader.subtitle.subtitle:setText( Engine[@"hash_4F9F1239CFD921FE"]( f2_local0 ) )
		end
	end )
	GenericMenuFrame:setRGB(1, 1, 0)
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local SafeAreaContainer = CoD.ZMCustomizeClassSafeAreaContainer.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 1080 )
	SafeAreaContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		if element.menuLoaded then
			f3_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f3_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	SafeAreaContainer:setRGB(1, 0, 1)
	self:addElement( SafeAreaContainer )
	self.SafeAreaContainer = SafeAreaContainer
	
	DirectorCustomizeClassZM:linkToElementModel( SafeAreaContainer.customClassList.customClasssList, nil, false, function ( model )
		DirectorCustomizeClassZM:setModel( model, f1_arg0 )
	end )
	GenericMenuFrame:linkToElementModel( SafeAreaContainer.customClassList.customClasssList, nil, false, function ( model )
		GenericMenuFrame.CommonHeader:setModel( model, f1_arg0 )
	end )
	self:linkToElementModel( self, nil, true, function ( model, f6_arg1 )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_222361E23588705A"] )
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		SaveLoadoutGeneric( controller )
		UpdateGamerprofile( self, element, controller )
		CoD.ZMLoadoutUtility.SaveZMLoadoutBuffer( controller )
		CoD.LobbyUtility.SetMenuControllerRestriction( self, controller, 0 )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_370A9FDC87CD3D48", nil, nil )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_222361E23588705A"], "ui_contextual_1", function ( element, menu, controller, model )
		if not CoD.CACUtility.IsCurrentClassLocked( menu, controller ) then
			CoD.CACUtility.OpenClassOptions( self, menu, controller, "ClassOptions" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not CoD.CACUtility.IsCurrentClassLocked( menu, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_222361E23588705A"], @"hash_227F19FF8EF11A44", nil, "ui_contextual_1" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		ResetFrontendMusic( f1_arg0 )
		CoD.ZMStoryUtility.SetSelectedStoryToCurrentMapStory( f1_arg0 )
	end )
	DirectorCustomizeClassZM.id = "DirectorCustomizeClassZM"
	if CoD.isPC then
		GenericMenuFrame.id = "GenericMenuFrame"
	end
	SafeAreaContainer.id = "SafeAreaContainer"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = DirectorCustomizeClassZM
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	local f1_local6 = self
	if not CoD.BaseUtility.IsMenuSessionModeEqualTo( f1_local1, Enum[@"hash_59C0C2196D8313A0"][@"hash_2B22E0240605CFFE"] ) then
		CoD.BaseUtility.SetStateByMenuSessionMode( f1_local1, self, f1_arg0 )
		CoD.FTUEUtility.ShowFTUESequenceIfNotSeen( self, f1_arg0, "ZMLoadoutIntroduction" )
	else
		SetCharacterModeToSessionMode( self, f1_arg0, Enum[@"hash_59C0C2196D8313A0"][@"hash_73723205FAE52C4A"] )
		CoD.FTUEUtility.ShowFTUESequenceIfNotSeen( self, f1_arg0, "ZMLoadoutIntroduction" )
	end

	--self:setRGB(0, 0, 1)
	RushPrintInfo("Called", "Create a Class")

	return self
end

CoD.ZMCustomizeClassMenu.__onClose = function ( f12_arg0 )
	f12_arg0.DirectorCustomizeClassZM:close()
	f12_arg0.GenericMenuFrame:close()
	f12_arg0.ScorestreakAspectRatioFix:close()
	f12_arg0.SafeAreaContainer:close()
end

-- Main Buttons
-- Bottem Left Ones.. removed, breaks other enh mod

CoD.DirectorSelectButtonMiniInternal = InheritFrom( LUI.UIElement )
CoD.DirectorSelectButtonMiniInternal.__defaultWidth = 301
CoD.DirectorSelectButtonMiniInternal.__defaultHeight = 69
CoD.DirectorSelectButtonMiniInternal.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.DirectorSelectButtonMiniInternal )
	self.id = "DirectorSelectButtonMiniInternal"
	self.soundSet = "FrontendMain"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local SceneBlur = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	SceneBlur:setRGB( 0, 0, 0 )
	SceneBlur:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_E2354BE557C4C7A" ) )
	SceneBlur:setShaderVector( 0, 0, 0.4, 0, 0 )
	self:addElement( SceneBlur )
	self.SceneBlur = SceneBlur
	
	local NoiseTiledBacking = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	NoiseTiledBacking:setAlpha( 0.95 )
	NoiseTiledBacking:setImage( RegisterImage( @"hash_634839E8065B1E53" ) )
	NoiseTiledBacking:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_16CBE95C250C6D15" ) )
	NoiseTiledBacking:setShaderVector( 0, 0, 0, 0, 0 )
	NoiseTiledBacking:setupNineSliceShader( 196, 88 )
	self:addElement( NoiseTiledBacking )
	self.NoiseTiledBacking = NoiseTiledBacking
	
	local Tint = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	Tint:setRGB( 0, 0, 0 )
	Tint:setAlpha( 0.75 )
	self:addElement( Tint )
	self.Tint = Tint
	
	local FocusBrackets = CoD.CommonFocusBrackets.new( f1_arg0, f1_arg1, 0, 1, -20, 20, 0, 1, -20, 20 )
	FocusBrackets:setAlpha( 0 )
	self:addElement( FocusBrackets )
	self.FocusBrackets = FocusBrackets
	
	local FrontendFrameSelected = LUI.UIImage.new( 0, 1, -4, 4, 0, 1, -4, 4 )
	FrontendFrameSelected:setRGB( 0.8, 0.7, 0.09 )
	FrontendFrameSelected:setAlpha( 0 )
	FrontendFrameSelected:setImage( RegisterImage( @"hash_CB07CCC28498CB2" ) )
	FrontendFrameSelected:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_1FD777557404A7B3" ) )
	FrontendFrameSelected:setShaderVector( 0, 0, 0, 0, 0 )
	FrontendFrameSelected:setupNineSliceShader( 10, 10 )
	self:addElement( FrontendFrameSelected )
	self.FrontendFrameSelected = FrontendFrameSelected
	
	local FocusGlow = LUI.UIImage.new( 0, 1, -130, 130, 0, 1, -158, 158 )
	FocusGlow:setAlpha( 0 )
	FocusGlow:setImage( RegisterImage( @"hash_1223AD1B40A93955" ) )
	FocusGlow:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_6DAB59B2CAE01851" ) )
	FocusGlow:setShaderVector( 0, 0, 0, 0.21, 0.09 )
	FocusGlow:setShaderVector( 1, 1.36, 0, 0, 0 )
	FocusGlow:setupNineSliceShader( 245, 185 )
	self:addElement( FocusGlow )
	self.FocusGlow = FocusGlow
	
	local FocusHighlight = LUI.UIImage.new( 0, 1, -52, 52, 0, 1, -42, 42 )
	FocusHighlight:setAlpha( 0 )
	FocusHighlight:setImage( RegisterImage( @"hash_53F09D20CA138B49" ) )
	FocusHighlight:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_6DAB59B2CAE01851" ) )
	FocusHighlight:setShaderVector( 0, 0, 0, 0.27, 0.18 )
	FocusHighlight:setShaderVector( 1, 0.9, 0, 0, 0 )
	FocusHighlight:setupNineSliceShader( 135, 70 )
	self:addElement( FocusHighlight )
	self.FocusHighlight = FocusHighlight
	
	local DotTiledBacking = CoD.CommonPixelBacking.new( f1_arg0, f1_arg1, 0, 1, 4, -4, 0, 1, 4, -4 )
	DotTiledBacking:setRFTMaterial( LUI.UIImage.GetCachedMaterial( @"hash_54E6CE42E0799F57" ) )
	DotTiledBacking.NoiseBacking:setAlpha( 1 )
	DotTiledBacking.TiledShaderImage:setRGB( 0.22, 0.22, 0.22 )
	DotTiledBacking.TiledShaderImage:setAlpha( 0.15 )
	DotTiledBacking.TiledShaderImage:setupNineSliceShader( 36, 36 )
	self:addElement( DotTiledBacking )
	self.DotTiledBacking = DotTiledBacking
	
	local FrameBorder = LUI.UIImage.new( 0, 1, -1, 1, 0, 1, -1, 1 )
	FrameBorder:setAlpha( 0.1 )
	FrameBorder:setImage( RegisterImage( @"hash_3185E11D74ECA3D7" ) )
	FrameBorder:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_1FD777557404A7B3" ) )
	FrameBorder:setShaderVector( 0, 0, 0, 0, 0 )
	FrameBorder:setupNineSliceShader( 12, 12 )
	self:addElement( FrameBorder )
	self.FrameBorder = FrameBorder
	
	local LeaderActivityText = LUI.UIText.new( 0, 0, 16, 285, 1, 1, -64.5, -44.5 )
	LeaderActivityText:setRGB( 0.63, 0.62, 0.61 )
	LeaderActivityText:setAlpha( 0 )
	LeaderActivityText:setText( Engine[@"hash_4F9F1239CFD921FE"]( @"hash_393E719493E9E18F" ) )
	LeaderActivityText:setTTF( "ttmussels_regular" )
	LeaderActivityText:setLetterSpacing( 4 )
	LeaderActivityText:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_1FEEB12BCB0D7041"] )
	LeaderActivityText:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_3F41D595A2B0EDF3"] )
	self:addElement( LeaderActivityText )
	self.LeaderActivityText = LeaderActivityText
	
	local MiddleText = LUI.UIText.new( 0, 1, 16, -16, 0.5, 0.5, -12, 12 )
	MiddleText:setRGB( ColorSet.T8__BIEGE.r, ColorSet.T8__BIEGE.g, ColorSet.T8__BIEGE.b )
	MiddleText:setText( LocalizeToUpperString( @"hash_A43B10D9DA121A" ) )
	MiddleText:setTTF( "ttmussels_regular" )
	MiddleText:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_171E049B161CD00A" ) )
	MiddleText:setLetterSpacing( 3 )
	MiddleText:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_1FEEB12BCB0D7041"] )
	MiddleText:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_6ED4298C93DC5ED"] )
	self:addElement( MiddleText )
	self.MiddleText = MiddleText
	
	local MiddleTextFocus = LUI.UIText.new( 0, 1, 16, -16, 0.5, 0.5, -12, 12 )
	MiddleTextFocus:setRGB( 0.28, 0.25, 0.24 )
	MiddleTextFocus:setAlpha( 0 )
	MiddleTextFocus:setText( LocalizeToUpperString( @"hash_A43B10D9DA121A" ) )
	MiddleTextFocus:setTTF( "ttmussels_regular" )
	MiddleTextFocus:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_2AE166D9BA8C6907" ) )
	MiddleTextFocus:setShaderVector( 0, 0.13, 0, 0, 0 )
	MiddleTextFocus:setShaderVector( 1, 0.34, 0, 0, 0 )
	MiddleTextFocus:setShaderVector( 2, 1, 0, 0, 0 )
	MiddleTextFocus:setLetterSpacing( 3 )
	MiddleTextFocus:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_1FEEB12BCB0D7041"] )
	MiddleTextFocus:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_6ED4298C93DC5ED"] )
	self:addElement( MiddleTextFocus )
	self.MiddleTextFocus = MiddleTextFocus
	
	local lockImage = LUI.UIImage.new( 1, 1, -42, 8, 0.5, 0.5, -25, 25 )
	lockImage:setAlpha( 0 )
	lockImage:setScale( 0.6, 0.6 )
	lockImage:setImage( RegisterImage( @"hash_1E1E7C490B2BA4FB" ) )
	self:addElement( lockImage )
	self.lockImage = lockImage
	
	local Lines = CoD.DirectorSelectButtonLines.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 1, 1, -1 )
	Lines:setRGB( 0.64, 0.71, 0.78 )
	self:addElement( Lines )
	self.Lines = Lines
	
	local FocusBorder = LUI.UIImage.new( 0, 1, -4, 4, 0, 1, -4, 4 )
	FocusBorder:setRGB( 0.96, 0.94, 0.78 )
	FocusBorder:setAlpha( 0 )
	FocusBorder:setImage( RegisterImage( @"hash_CB07CCC28498CB2" ) )
	FocusBorder:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_1FD777557404A7B3" ) )
	FocusBorder:setShaderVector( 0, 0, 0, 0, 0 )
	FocusBorder:setupNineSliceShader( 10, 10 )
	self:addElement( FocusBorder )
	self.FocusBorder = FocusBorder
	
	self:subscribeToGlobalModel( f1_arg1, "GlobalModel", "lobbyRoot.lobbyNav", function ( model )
		if ParentHasChildFocus( self ) then
			SetLoseFocusToSelf( self, f1_arg1 )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.DirectorSelectButtonMiniInternal.__resetProperties = function ( f3_arg0 )
	f3_arg0.lockImage:completeAnimation()
	f3_arg0.FrontendFrameSelected:completeAnimation()
	f3_arg0.FocusBrackets:completeAnimation()
	f3_arg0.DotTiledBacking:completeAnimation()
	f3_arg0.MiddleTextFocus:completeAnimation()
	f3_arg0.MiddleText:completeAnimation()
	f3_arg0.Lines:completeAnimation()
	f3_arg0.FocusHighlight:completeAnimation()
	f3_arg0.FocusGlow:completeAnimation()
	f3_arg0.NoiseTiledBacking:completeAnimation()
	f3_arg0.FocusBorder:completeAnimation()
	f3_arg0.lockImage:setAlpha( 0 )
	f3_arg0.lockImage:setScale( 0.6, 0.6 )
	f3_arg0.FrontendFrameSelected:setAlpha( 0 )
	f3_arg0.FocusBrackets:setLeftRight( 0, 1, -20, 20 )
	f3_arg0.FocusBrackets:setTopBottom( 0, 1, -20, 20 )
	f3_arg0.FocusBrackets:setAlpha( 0 )
	f3_arg0.DotTiledBacking.TiledShaderImage:setRGB( 0.22, 0.22, 0.22 )
	f3_arg0.DotTiledBacking.TiledShaderImage:setAlpha( 0.15 )
	f3_arg0.MiddleTextFocus:setLeftRight( 0, 1, 16, -16 )
	f3_arg0.MiddleTextFocus:setRGB( 0.28, 0.25, 0.24 )
	f3_arg0.MiddleTextFocus:setAlpha( 0 )
	f3_arg0.MiddleText:setLeftRight( 0, 1, 16, -16 )
	f3_arg0.MiddleText:setRGB( ColorSet.T8__BIEGE.r, ColorSet.T8__BIEGE.g, ColorSet.T8__BIEGE.b )
	f3_arg0.MiddleText:setAlpha( 1 )
	f3_arg0.Lines:setAlpha( 1 )
	f3_arg0.FocusHighlight:setAlpha( 0 )
	f3_arg0.FocusGlow:setRGB( 1, 1, 1 )
	f3_arg0.FocusGlow:setAlpha( 0 )
	f3_arg0.NoiseTiledBacking:setRGB( 1, 1, 1 )
	f3_arg0.FocusBorder:setRGB( 0.96, 0.94, 0.78 )
	f3_arg0.FocusBorder:setAlpha( 0 )
end

CoD.DirectorSelectButtonMiniInternal.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f4_arg0, f4_arg1 )
			f4_arg0:__resetProperties()
			f4_arg0:setupElementClipCounter( 0 )
		end,
		Focus = function ( f5_arg0, f5_arg1 )
			f5_arg0:__resetProperties()
			f5_arg0:setupElementClipCounter( 9 )
			f5_arg0.FocusBrackets:completeAnimation()
			f5_arg0.FocusBrackets:setLeftRight( 0, 1, -10, 10 )
			f5_arg0.FocusBrackets:setTopBottom( 0, 1, -10, 10 )
			f5_arg0.FocusBrackets:setAlpha( 1 )
			f5_arg0.clipFinished( f5_arg0.FocusBrackets )
			f5_arg0.FrontendFrameSelected:completeAnimation()
			f5_arg0.FrontendFrameSelected:setAlpha( 0.1 )
			f5_arg0.clipFinished( f5_arg0.FrontendFrameSelected )
			local f5_local0 = function ( f6_arg0 )
				local f6_local0 = function ( f7_arg0 )
					f7_arg0:beginAnimation( 2010 )
					f7_arg0:setRGB( 1, 1, 1 )
					f7_arg0:registerEventHandler( "transition_complete_keyframe", f5_arg0.clipFinished )
				end
				
				f5_arg0.FocusGlow:beginAnimation( 1990 )
				f5_arg0.FocusGlow:setRGB( 0.79, 0.79, 0.79 )
				f5_arg0.FocusGlow:registerEventHandler( "interrupted_keyframe", f5_arg0.clipInterrupted )
				f5_arg0.FocusGlow:registerEventHandler( "transition_complete_keyframe", f6_local0 )
			end
			
			f5_arg0.FocusGlow:completeAnimation()
			f5_arg0.FocusGlow:setRGB( 1, 1, 1 )
			f5_arg0.FocusGlow:setAlpha( 1 )
			f5_local0( f5_arg0.FocusGlow )
			f5_arg0.FocusHighlight:completeAnimation()
			f5_arg0.FocusHighlight:setAlpha( 0.5 )
			f5_arg0.clipFinished( f5_arg0.FocusHighlight )
			f5_arg0.DotTiledBacking:completeAnimation()
			f5_arg0.DotTiledBacking.TiledShaderImage:completeAnimation()
			f5_arg0.DotTiledBacking.TiledShaderImage:setRGB( 0.28, 0.28, 0.28 )
			f5_arg0.DotTiledBacking.TiledShaderImage:setAlpha( 0.7 )
			f5_arg0.clipFinished( f5_arg0.DotTiledBacking )
			f5_arg0.MiddleText:completeAnimation()
			f5_arg0.MiddleText:setAlpha( 0 )
			f5_arg0.clipFinished( f5_arg0.MiddleText )
			f5_arg0.MiddleTextFocus:completeAnimation()
			f5_arg0.MiddleTextFocus:setRGB( 0.28, 0.25, 0.24 )
			f5_arg0.MiddleTextFocus:setAlpha( 1 )
			f5_arg0.clipFinished( f5_arg0.MiddleTextFocus )
			f5_arg0.lockImage:completeAnimation()
			f5_arg0.lockImage:setScale( 1.2, 1.2 )
			f5_arg0.clipFinished( f5_arg0.lockImage )
			f5_arg0.Lines:completeAnimation()
			f5_arg0.Lines:setAlpha( 0 )
			f5_arg0.clipFinished( f5_arg0.Lines )
			f5_arg0.nextClip = "Focus"
		end,
		GainFocus = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 9 )
			local f8_local0 = function ( f9_arg0 )
				local f9_local0 = function ( f10_arg0 )
					f10_arg0:beginAnimation( 50, Enum[@"hash_1F50FFF429AB1890"][@"hash_66F6186B702830BC"] )
					f10_arg0:setLeftRight( 0, 1, -10, 10 )
					f10_arg0:setTopBottom( 0, 1, -10, 10 )
					f10_arg0:setAlpha( 1 )
					f10_arg0:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
				end
				
				f8_arg0.FocusBrackets:beginAnimation( 100 )
				f8_arg0.FocusBrackets:setLeftRight( 0, 1, -8, 8 )
				f8_arg0.FocusBrackets:setTopBottom( 0, 1, -8, 8 )
				f8_arg0.FocusBrackets:setAlpha( 0.75 )
				f8_arg0.FocusBrackets:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.FocusBrackets:registerEventHandler( "transition_complete_keyframe", f9_local0 )
			end
			
			f8_arg0.FocusBrackets:completeAnimation()
			f8_arg0.FocusBrackets:setLeftRight( 0, 1, -40, 40 )
			f8_arg0.FocusBrackets:setTopBottom( 0, 1, -40, 40 )
			f8_arg0.FocusBrackets:setAlpha( 0 )
			f8_local0( f8_arg0.FocusBrackets )
			local f8_local1 = function ( f11_arg0 )
				f8_arg0.FrontendFrameSelected:beginAnimation( 200, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
				f8_arg0.FrontendFrameSelected:setAlpha( 0.1 )
				f8_arg0.FrontendFrameSelected:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.FrontendFrameSelected:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
			end
			
			f8_arg0.FrontendFrameSelected:completeAnimation()
			f8_arg0.FrontendFrameSelected:setAlpha( 0 )
			f8_local1( f8_arg0.FrontendFrameSelected )
			local f8_local2 = function ( f12_arg0 )
				f8_arg0.FocusGlow:beginAnimation( 200, Enum[@"hash_1F50FFF429AB1890"][@"hash_66F6186B702830BC"] )
				f8_arg0.FocusGlow:setAlpha( 1 )
				f8_arg0.FocusGlow:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.FocusGlow:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
			end
			
			f8_arg0.FocusGlow:completeAnimation()
			f8_arg0.FocusGlow:setAlpha( 0 )
			f8_local2( f8_arg0.FocusGlow )
			local f8_local3 = function ( f13_arg0 )
				f8_arg0.FocusHighlight:beginAnimation( 200 )
				f8_arg0.FocusHighlight:setAlpha( 0.8 )
				f8_arg0.FocusHighlight:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.FocusHighlight:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
			end
			
			f8_arg0.FocusHighlight:completeAnimation()
			f8_arg0.FocusHighlight:setAlpha( 0 )
			f8_local3( f8_arg0.FocusHighlight )
			local f8_local4 = function ( f14_arg0 )
				f8_arg0.DotTiledBacking:beginAnimation( 200 )
				f8_arg0.DotTiledBacking.TiledShaderImage:beginAnimation( 200 )
				f8_arg0.DotTiledBacking.TiledShaderImage:setRGB( 0.28, 0.28, 0.28 )
				f8_arg0.DotTiledBacking:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.DotTiledBacking:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
			end
			
			f8_arg0.DotTiledBacking:completeAnimation()
			f8_arg0.DotTiledBacking.TiledShaderImage:completeAnimation()
			f8_arg0.DotTiledBacking.TiledShaderImage:setRGB( 0.22, 0.22, 0.22 )
			f8_local4( f8_arg0.DotTiledBacking )
			local f8_local5 = function ( f15_arg0 )
				f8_arg0.MiddleText:beginAnimation( 200 )
				f8_arg0.MiddleText:setAlpha( 0 )
				f8_arg0.MiddleText:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.MiddleText:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
			end
			
			f8_arg0.MiddleText:completeAnimation()
			f8_arg0.MiddleText:setRGB( ColorSet.T8__BIEGE.r, ColorSet.T8__BIEGE.g, ColorSet.T8__BIEGE.b )
			f8_arg0.MiddleText:setAlpha( 1 )
			f8_local5( f8_arg0.MiddleText )
			local f8_local6 = function ( f16_arg0 )
				f8_arg0.MiddleTextFocus:beginAnimation( 200 )
				f8_arg0.MiddleTextFocus:setAlpha( 1 )
				f8_arg0.MiddleTextFocus:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.MiddleTextFocus:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
			end
			
			f8_arg0.MiddleTextFocus:completeAnimation()
			f8_arg0.MiddleTextFocus:setAlpha( 0 )
			f8_local6( f8_arg0.MiddleTextFocus )
			local f8_local7 = function ( f17_arg0 )
				f8_arg0.lockImage:beginAnimation( 200 )
				f8_arg0.lockImage:setScale( 1.2, 1.2 )
				f8_arg0.lockImage:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.lockImage:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
			end
			
			f8_arg0.lockImage:completeAnimation()
			f8_arg0.lockImage:setScale( 0.6, 0.6 )
			f8_local7( f8_arg0.lockImage )
			local f8_local8 = function ( f18_arg0 )
				f8_arg0.Lines:beginAnimation( 200 )
				f8_arg0.Lines:setAlpha( 0 )
				f8_arg0.Lines:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.Lines:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
			end
			
			f8_arg0.Lines:completeAnimation()
			f8_arg0.Lines:setAlpha( 1 )
			f8_local8( f8_arg0.Lines )
		end,
		LoseFocus = function ( f19_arg0, f19_arg1 )
			f19_arg0:__resetProperties()
			f19_arg0:setupElementClipCounter( 9 )
			local f19_local0 = function ( f20_arg0 )
				f19_arg0.FocusBrackets:beginAnimation( 60, Enum[@"hash_1F50FFF429AB1890"][@"hash_2053CEB9A0427197"] )
				f19_arg0.FocusBrackets:setAlpha( 0 )
				f19_arg0.FocusBrackets:registerEventHandler( "interrupted_keyframe", f19_arg0.clipInterrupted )
				f19_arg0.FocusBrackets:registerEventHandler( "transition_complete_keyframe", f19_arg0.clipFinished )
			end
			
			f19_arg0.FocusBrackets:completeAnimation()
			f19_arg0.FocusBrackets:setLeftRight( 0, 1, -10, 10 )
			f19_arg0.FocusBrackets:setTopBottom( 0, 1, -10, 10 )
			f19_arg0.FocusBrackets:setAlpha( 1 )
			f19_local0( f19_arg0.FocusBrackets )
			local f19_local1 = function ( f21_arg0 )
				f19_arg0.FrontendFrameSelected:beginAnimation( 200, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
				f19_arg0.FrontendFrameSelected:setAlpha( 0 )
				f19_arg0.FrontendFrameSelected:registerEventHandler( "interrupted_keyframe", f19_arg0.clipInterrupted )
				f19_arg0.FrontendFrameSelected:registerEventHandler( "transition_complete_keyframe", f19_arg0.clipFinished )
			end
			
			f19_arg0.FrontendFrameSelected:completeAnimation()
			f19_arg0.FrontendFrameSelected:setAlpha( 0.1 )
			f19_local1( f19_arg0.FrontendFrameSelected )
			local f19_local2 = function ( f22_arg0 )
				f19_arg0.FocusGlow:beginAnimation( 200 )
				f19_arg0.FocusGlow:setAlpha( 0 )
				f19_arg0.FocusGlow:registerEventHandler( "interrupted_keyframe", f19_arg0.clipInterrupted )
				f19_arg0.FocusGlow:registerEventHandler( "transition_complete_keyframe", f19_arg0.clipFinished )
			end
			
			f19_arg0.FocusGlow:completeAnimation()
			f19_arg0.FocusGlow:setAlpha( 1 )
			f19_local2( f19_arg0.FocusGlow )
			local f19_local3 = function ( f23_arg0 )
				f19_arg0.FocusHighlight:beginAnimation( 200 )
				f19_arg0.FocusHighlight:setAlpha( 0 )
				f19_arg0.FocusHighlight:registerEventHandler( "interrupted_keyframe", f19_arg0.clipInterrupted )
				f19_arg0.FocusHighlight:registerEventHandler( "transition_complete_keyframe", f19_arg0.clipFinished )
			end
			
			f19_arg0.FocusHighlight:completeAnimation()
			f19_arg0.FocusHighlight:setAlpha( 0.8 )
			f19_local3( f19_arg0.FocusHighlight )
			local f19_local4 = function ( f24_arg0 )
				f19_arg0.DotTiledBacking:beginAnimation( 200 )
				f19_arg0.DotTiledBacking.TiledShaderImage:beginAnimation( 200 )
				f19_arg0.DotTiledBacking.TiledShaderImage:setRGB( 0.22, 0.22, 0.22 )
				f19_arg0.DotTiledBacking:registerEventHandler( "interrupted_keyframe", f19_arg0.clipInterrupted )
				f19_arg0.DotTiledBacking:registerEventHandler( "transition_complete_keyframe", f19_arg0.clipFinished )
			end
			
			f19_arg0.DotTiledBacking:completeAnimation()
			f19_arg0.DotTiledBacking.TiledShaderImage:completeAnimation()
			f19_arg0.DotTiledBacking.TiledShaderImage:setRGB( 0.28, 0.28, 0.28 )
			f19_local4( f19_arg0.DotTiledBacking )
			local f19_local5 = function ( f25_arg0 )
				f19_arg0.MiddleText:beginAnimation( 200 )
				f19_arg0.MiddleText:setAlpha( 1 )
				f19_arg0.MiddleText:registerEventHandler( "interrupted_keyframe", f19_arg0.clipInterrupted )
				f19_arg0.MiddleText:registerEventHandler( "transition_complete_keyframe", f19_arg0.clipFinished )
			end
			
			f19_arg0.MiddleText:completeAnimation()
			f19_arg0.MiddleText:setRGB( ColorSet.T8__BIEGE.r, ColorSet.T8__BIEGE.g, ColorSet.T8__BIEGE.b )
			f19_arg0.MiddleText:setAlpha( 0 )
			f19_local5( f19_arg0.MiddleText )
			local f19_local6 = function ( f26_arg0 )
				f19_arg0.MiddleTextFocus:beginAnimation( 200 )
				f19_arg0.MiddleTextFocus:setAlpha( 0 )
				f19_arg0.MiddleTextFocus:registerEventHandler( "interrupted_keyframe", f19_arg0.clipInterrupted )
				f19_arg0.MiddleTextFocus:registerEventHandler( "transition_complete_keyframe", f19_arg0.clipFinished )
			end
			
			f19_arg0.MiddleTextFocus:completeAnimation()
			f19_arg0.MiddleTextFocus:setAlpha( 1 )
			f19_local6( f19_arg0.MiddleTextFocus )
			local f19_local7 = function ( f27_arg0 )
				f19_arg0.lockImage:beginAnimation( 200 )
				f19_arg0.lockImage:setScale( 0.6, 0.6 )
				f19_arg0.lockImage:registerEventHandler( "interrupted_keyframe", f19_arg0.clipInterrupted )
				f19_arg0.lockImage:registerEventHandler( "transition_complete_keyframe", f19_arg0.clipFinished )
			end
			
			f19_arg0.lockImage:completeAnimation()
			f19_arg0.lockImage:setScale( 1.2, 1.2 )
			f19_local7( f19_arg0.lockImage )
			local f19_local8 = function ( f28_arg0 )
				f19_arg0.Lines:beginAnimation( 200 )
				f19_arg0.Lines:setAlpha( 1 )
				f19_arg0.Lines:registerEventHandler( "interrupted_keyframe", f19_arg0.clipInterrupted )
				f19_arg0.Lines:registerEventHandler( "transition_complete_keyframe", f19_arg0.clipFinished )
			end
			
			f19_arg0.Lines:completeAnimation()
			f19_arg0.Lines:setAlpha( 0 )
			f19_local8( f19_arg0.Lines )
		end
	},
	TrialLocked = {
		DefaultClip = function ( f29_arg0, f29_arg1 )
			f29_arg0:__resetProperties()
			f29_arg0:setupElementClipCounter( 5 )
			f29_arg0.NoiseTiledBacking:completeAnimation()
			f29_arg0.NoiseTiledBacking:setRGB( 0.78, 0.78, 0.78 )
			f29_arg0.clipFinished( f29_arg0.NoiseTiledBacking )
			f29_arg0.FocusBrackets:completeAnimation()
			f29_arg0.FocusBrackets:setAlpha( 0 )
			f29_arg0.clipFinished( f29_arg0.FocusBrackets )
			f29_arg0.MiddleText:completeAnimation()
			f29_arg0.MiddleText:setLeftRight( 0, 1, 32, -32 )
			f29_arg0.MiddleText:setRGB( 0.92, 0.92, 0.92 )
			f29_arg0.MiddleText:setAlpha( 0.2 )
			f29_arg0.clipFinished( f29_arg0.MiddleText )
			f29_arg0.MiddleTextFocus:completeAnimation()
			f29_arg0.MiddleTextFocus:setLeftRight( 0, 1, 32, -32 )
			f29_arg0.clipFinished( f29_arg0.MiddleTextFocus )
			f29_arg0.lockImage:completeAnimation()
			f29_arg0.lockImage:setAlpha( 0.5 )
			f29_arg0.clipFinished( f29_arg0.lockImage )
		end,
		Focus = function ( f30_arg0, f30_arg1 )
			f30_arg0:__resetProperties()
			f30_arg0:setupElementClipCounter( 6 )
			f30_arg0.NoiseTiledBacking:completeAnimation()
			f30_arg0.NoiseTiledBacking:setRGB( 0.78, 0.78, 0.78 )
			f30_arg0.clipFinished( f30_arg0.NoiseTiledBacking )
			f30_arg0.FocusBrackets:completeAnimation()
			f30_arg0.FocusBrackets:setLeftRight( 0, 1, -10, 10 )
			f30_arg0.FocusBrackets:setTopBottom( 0, 1, -10, 10 )
			f30_arg0.FocusBrackets:setAlpha( 1 )
			f30_arg0.clipFinished( f30_arg0.FocusBrackets )
			f30_arg0.MiddleText:completeAnimation()
			f30_arg0.MiddleText:setLeftRight( 0, 1, 32, -32 )
			f30_arg0.MiddleText:setRGB( 0.92, 0.92, 0.92 )
			f30_arg0.MiddleText:setAlpha( 0.2 )
			f30_arg0.clipFinished( f30_arg0.MiddleText )
			f30_arg0.MiddleTextFocus:completeAnimation()
			f30_arg0.MiddleTextFocus:setLeftRight( 0, 1, 32, -32 )
			f30_arg0.clipFinished( f30_arg0.MiddleTextFocus )
			f30_arg0.lockImage:completeAnimation()
			f30_arg0.lockImage:setAlpha( 0.5 )
			f30_arg0.clipFinished( f30_arg0.lockImage )
			f30_arg0.FocusBorder:completeAnimation()
			f30_arg0.FocusBorder:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
			f30_arg0.FocusBorder:setAlpha( 0.25 )
			f30_arg0.clipFinished( f30_arg0.FocusBorder )
		end,
		GainFocus = function ( f31_arg0, f31_arg1 )
			f31_arg0:__resetProperties()
			f31_arg0:setupElementClipCounter( 6 )
			f31_arg0.NoiseTiledBacking:completeAnimation()
			f31_arg0.NoiseTiledBacking:setRGB( 0.78, 0.78, 0.78 )
			f31_arg0.clipFinished( f31_arg0.NoiseTiledBacking )
			local f31_local0 = function ( f32_arg0 )
				local f32_local0 = function ( f33_arg0 )
					f33_arg0:beginAnimation( 50, Enum[@"hash_1F50FFF429AB1890"][@"hash_66F6186B702830BC"] )
					f33_arg0:setLeftRight( 0, 1, -10, 10 )
					f33_arg0:setTopBottom( 0, 1, -10, 10 )
					f33_arg0:setAlpha( 1 )
					f33_arg0:registerEventHandler( "transition_complete_keyframe", f31_arg0.clipFinished )
				end
				
				f31_arg0.FocusBrackets:beginAnimation( 100 )
				f31_arg0.FocusBrackets:setLeftRight( 0, 1, -8, 8 )
				f31_arg0.FocusBrackets:setTopBottom( 0, 1, -8, 8 )
				f31_arg0.FocusBrackets:setAlpha( 0.75 )
				f31_arg0.FocusBrackets:registerEventHandler( "interrupted_keyframe", f31_arg0.clipInterrupted )
				f31_arg0.FocusBrackets:registerEventHandler( "transition_complete_keyframe", f32_local0 )
			end
			
			f31_arg0.FocusBrackets:completeAnimation()
			f31_arg0.FocusBrackets:setLeftRight( 0, 1, -40, 40 )
			f31_arg0.FocusBrackets:setTopBottom( 0, 1, -40, 40 )
			f31_arg0.FocusBrackets:setAlpha( 0 )
			f31_local0( f31_arg0.FocusBrackets )
			f31_arg0.MiddleText:completeAnimation()
			f31_arg0.MiddleText:setLeftRight( 0, 1, 32, -32 )
			f31_arg0.MiddleText:setRGB( 0.92, 0.92, 0.92 )
			f31_arg0.MiddleText:setAlpha( 0.2 )
			f31_arg0.clipFinished( f31_arg0.MiddleText )
			f31_arg0.MiddleTextFocus:completeAnimation()
			f31_arg0.MiddleTextFocus:setLeftRight( 0, 1, 32, -32 )
			f31_arg0.clipFinished( f31_arg0.MiddleTextFocus )
			f31_arg0.lockImage:completeAnimation()
			f31_arg0.lockImage:setAlpha( 0.5 )
			f31_arg0.clipFinished( f31_arg0.lockImage )
			local f31_local1 = function ( f34_arg0 )
				f31_arg0.FocusBorder:beginAnimation( 200 )
				f31_arg0.FocusBorder:setAlpha( 0.25 )
				f31_arg0.FocusBorder:registerEventHandler( "interrupted_keyframe", f31_arg0.clipInterrupted )
				f31_arg0.FocusBorder:registerEventHandler( "transition_complete_keyframe", f31_arg0.clipFinished )
			end
			
			f31_arg0.FocusBorder:completeAnimation()
			f31_arg0.FocusBorder:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
			f31_arg0.FocusBorder:setAlpha( 0 )
			f31_local1( f31_arg0.FocusBorder )
		end,
		LoseFocus = function ( f35_arg0, f35_arg1 )
			f35_arg0:__resetProperties()
			f35_arg0:setupElementClipCounter( 6 )
			f35_arg0.NoiseTiledBacking:completeAnimation()
			f35_arg0.NoiseTiledBacking:setRGB( 0.78, 0.78, 0.78 )
			f35_arg0.clipFinished( f35_arg0.NoiseTiledBacking )
			local f35_local0 = function ( f36_arg0 )
				f35_arg0.FocusBrackets:beginAnimation( 60, Enum[@"hash_1F50FFF429AB1890"][@"hash_2053CEB9A0427197"] )
				f35_arg0.FocusBrackets:setAlpha( 0 )
				f35_arg0.FocusBrackets:registerEventHandler( "interrupted_keyframe", f35_arg0.clipInterrupted )
				f35_arg0.FocusBrackets:registerEventHandler( "transition_complete_keyframe", f35_arg0.clipFinished )
			end
			
			f35_arg0.FocusBrackets:completeAnimation()
			f35_arg0.FocusBrackets:setLeftRight( 0, 1, -10, 10 )
			f35_arg0.FocusBrackets:setTopBottom( 0, 1, -10, 10 )
			f35_arg0.FocusBrackets:setAlpha( 1 )
			f35_local0( f35_arg0.FocusBrackets )
			f35_arg0.MiddleText:completeAnimation()
			f35_arg0.MiddleText:setLeftRight( 0, 1, 32, -32 )
			f35_arg0.MiddleText:setRGB( 0.92, 0.92, 0.92 )
			f35_arg0.MiddleText:setAlpha( 0.2 )
			f35_arg0.clipFinished( f35_arg0.MiddleText )
			f35_arg0.MiddleTextFocus:completeAnimation()
			f35_arg0.MiddleTextFocus:setLeftRight( 0, 1, 32, -32 )
			f35_arg0.clipFinished( f35_arg0.MiddleTextFocus )
			f35_arg0.lockImage:completeAnimation()
			f35_arg0.lockImage:setAlpha( 0.5 )
			f35_arg0.clipFinished( f35_arg0.lockImage )
			local f35_local1 = function ( f37_arg0 )
				f35_arg0.FocusBorder:beginAnimation( 200 )
				f35_arg0.FocusBorder:setAlpha( 0 )
				f35_arg0.FocusBorder:registerEventHandler( "interrupted_keyframe", f35_arg0.clipInterrupted )
				f35_arg0.FocusBorder:registerEventHandler( "transition_complete_keyframe", f35_arg0.clipFinished )
			end
			
			f35_arg0.FocusBorder:completeAnimation()
			f35_arg0.FocusBorder:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
			f35_arg0.FocusBorder:setAlpha( 0.25 )
			f35_local1( f35_arg0.FocusBorder )
		end
	},
	ArenaSuspended = {
		DefaultClip = function ( f38_arg0, f38_arg1 )
			f38_arg0:__resetProperties()
			f38_arg0:setupElementClipCounter( 3 )
			f38_arg0.NoiseTiledBacking:completeAnimation()
			f38_arg0.NoiseTiledBacking:setRGB( 0.78, 0.78, 0.78 )
			f38_arg0.clipFinished( f38_arg0.NoiseTiledBacking )
			f38_arg0.FocusBrackets:completeAnimation()
			f38_arg0.FocusBrackets:setAlpha( 0 )
			f38_arg0.clipFinished( f38_arg0.FocusBrackets )
			f38_arg0.DotTiledBacking:completeAnimation()
			f38_arg0.DotTiledBacking.TiledShaderImage:completeAnimation()
			f38_arg0.DotTiledBacking.TiledShaderImage:setAlpha( 0.43 )
			f38_arg0.clipFinished( f38_arg0.DotTiledBacking )
		end
	},
	Locked = {
		DefaultClip = function ( f39_arg0, f39_arg1 )
			f39_arg0:__resetProperties()
			f39_arg0:setupElementClipCounter( 4 )
			f39_arg0.NoiseTiledBacking:completeAnimation()
			f39_arg0.NoiseTiledBacking:setRGB( 0.78, 0.78, 0.78 )
			f39_arg0.clipFinished( f39_arg0.NoiseTiledBacking )
			f39_arg0.FocusBrackets:completeAnimation()
			f39_arg0.FocusBrackets:setAlpha( 0 )
			f39_arg0.clipFinished( f39_arg0.FocusBrackets )
			f39_arg0.MiddleText:completeAnimation()
			f39_arg0.MiddleText:setRGB( 0.92, 0.92, 0.92 )
			f39_arg0.MiddleText:setAlpha( 0.2 )
			f39_arg0.clipFinished( f39_arg0.MiddleText )
			f39_arg0.lockImage:completeAnimation()
			f39_arg0.lockImage:setAlpha( 0.5 )
			f39_arg0.clipFinished( f39_arg0.lockImage )
		end,
		Focus = function ( f40_arg0, f40_arg1 )
			f40_arg0:__resetProperties()
			f40_arg0:setupElementClipCounter( 5 )
			f40_arg0.NoiseTiledBacking:completeAnimation()
			f40_arg0.NoiseTiledBacking:setRGB( 0.78, 0.78, 0.78 )
			f40_arg0.clipFinished( f40_arg0.NoiseTiledBacking )
			f40_arg0.FocusBrackets:completeAnimation()
			f40_arg0.FocusBrackets:setLeftRight( 0, 1, -10, 10 )
			f40_arg0.FocusBrackets:setTopBottom( 0, 1, -10, 10 )
			f40_arg0.FocusBrackets:setAlpha( 1 )
			f40_arg0.clipFinished( f40_arg0.FocusBrackets )
			f40_arg0.MiddleText:completeAnimation()
			f40_arg0.MiddleText:setRGB( 0.92, 0.92, 0.92 )
			f40_arg0.MiddleText:setAlpha( 0.2 )
			f40_arg0.clipFinished( f40_arg0.MiddleText )
			f40_arg0.lockImage:completeAnimation()
			f40_arg0.lockImage:setAlpha( 0.5 )
			f40_arg0.clipFinished( f40_arg0.lockImage )
			f40_arg0.FocusBorder:completeAnimation()
			f40_arg0.FocusBorder:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
			f40_arg0.FocusBorder:setAlpha( 0.25 )
			f40_arg0.clipFinished( f40_arg0.FocusBorder )
		end,
		GainFocus = function ( f41_arg0, f41_arg1 )
			f41_arg0:__resetProperties()
			f41_arg0:setupElementClipCounter( 5 )
			f41_arg0.NoiseTiledBacking:completeAnimation()
			f41_arg0.NoiseTiledBacking:setRGB( 0.78, 0.78, 0.78 )
			f41_arg0.clipFinished( f41_arg0.NoiseTiledBacking )
			local f41_local0 = function ( f42_arg0 )
				local f42_local0 = function ( f43_arg0 )
					f43_arg0:beginAnimation( 50, Enum[@"hash_1F50FFF429AB1890"][@"hash_66F6186B702830BC"] )
					f43_arg0:setLeftRight( 0, 1, -10, 10 )
					f43_arg0:setTopBottom( 0, 1, -10, 10 )
					f43_arg0:setAlpha( 1 )
					f43_arg0:registerEventHandler( "transition_complete_keyframe", f41_arg0.clipFinished )
				end
				
				f41_arg0.FocusBrackets:beginAnimation( 100 )
				f41_arg0.FocusBrackets:setLeftRight( 0, 1, -8, 8 )
				f41_arg0.FocusBrackets:setTopBottom( 0, 1, -8, 8 )
				f41_arg0.FocusBrackets:setAlpha( 0.75 )
				f41_arg0.FocusBrackets:registerEventHandler( "interrupted_keyframe", f41_arg0.clipInterrupted )
				f41_arg0.FocusBrackets:registerEventHandler( "transition_complete_keyframe", f42_local0 )
			end
			
			f41_arg0.FocusBrackets:completeAnimation()
			f41_arg0.FocusBrackets:setLeftRight( 0, 1, -40, 40 )
			f41_arg0.FocusBrackets:setTopBottom( 0, 1, -40, 40 )
			f41_arg0.FocusBrackets:setAlpha( 0 )
			f41_local0( f41_arg0.FocusBrackets )
			f41_arg0.MiddleText:completeAnimation()
			f41_arg0.MiddleText:setRGB( 0.92, 0.92, 0.92 )
			f41_arg0.MiddleText:setAlpha( 0.2 )
			f41_arg0.clipFinished( f41_arg0.MiddleText )
			f41_arg0.lockImage:completeAnimation()
			f41_arg0.lockImage:setAlpha( 0.5 )
			f41_arg0.clipFinished( f41_arg0.lockImage )
			local f41_local1 = function ( f44_arg0 )
				f41_arg0.FocusBorder:beginAnimation( 200 )
				f41_arg0.FocusBorder:setAlpha( 0.25 )
				f41_arg0.FocusBorder:registerEventHandler( "interrupted_keyframe", f41_arg0.clipInterrupted )
				f41_arg0.FocusBorder:registerEventHandler( "transition_complete_keyframe", f41_arg0.clipFinished )
			end
			
			f41_arg0.FocusBorder:completeAnimation()
			f41_arg0.FocusBorder:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
			f41_arg0.FocusBorder:setAlpha( 0 )
			f41_local1( f41_arg0.FocusBorder )
		end,
		LoseFocus = function ( f45_arg0, f45_arg1 )
			f45_arg0:__resetProperties()
			f45_arg0:setupElementClipCounter( 5 )
			f45_arg0.NoiseTiledBacking:completeAnimation()
			f45_arg0.NoiseTiledBacking:setRGB( 0.78, 0.78, 0.78 )
			f45_arg0.clipFinished( f45_arg0.NoiseTiledBacking )
			local f45_local0 = function ( f46_arg0 )
				f45_arg0.FocusBrackets:beginAnimation( 60, Enum[@"hash_1F50FFF429AB1890"][@"hash_2053CEB9A0427197"] )
				f45_arg0.FocusBrackets:setAlpha( 0 )
				f45_arg0.FocusBrackets:registerEventHandler( "interrupted_keyframe", f45_arg0.clipInterrupted )
				f45_arg0.FocusBrackets:registerEventHandler( "transition_complete_keyframe", f45_arg0.clipFinished )
			end
			
			f45_arg0.FocusBrackets:completeAnimation()
			f45_arg0.FocusBrackets:setLeftRight( 0, 1, -10, 10 )
			f45_arg0.FocusBrackets:setTopBottom( 0, 1, -10, 10 )
			f45_arg0.FocusBrackets:setAlpha( 1 )
			f45_local0( f45_arg0.FocusBrackets )
			f45_arg0.MiddleText:completeAnimation()
			f45_arg0.MiddleText:setRGB( 0.92, 0.92, 0.92 )
			f45_arg0.MiddleText:setAlpha( 0.2 )
			f45_arg0.clipFinished( f45_arg0.MiddleText )
			f45_arg0.lockImage:completeAnimation()
			f45_arg0.lockImage:setAlpha( 0.5 )
			f45_arg0.clipFinished( f45_arg0.lockImage )
			local f45_local1 = function ( f47_arg0 )
				f45_arg0.FocusBorder:beginAnimation( 200 )
				f45_arg0.FocusBorder:setAlpha( 0 )
				f45_arg0.FocusBorder:registerEventHandler( "interrupted_keyframe", f45_arg0.clipInterrupted )
				f45_arg0.FocusBorder:registerEventHandler( "transition_complete_keyframe", f45_arg0.clipFinished )
			end
			
			f45_arg0.FocusBorder:completeAnimation()
			f45_arg0.FocusBorder:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
			f45_arg0.FocusBorder:setAlpha( 0.25 )
			f45_local1( f45_arg0.FocusBorder )
		end
	},
	Disabled = {
		DefaultClip = function ( f48_arg0, f48_arg1 )
			f48_arg0:__resetProperties()
			f48_arg0:setupElementClipCounter( 5 )
			f48_arg0.FocusBrackets:completeAnimation()
			f48_arg0.FocusBrackets:setAlpha( 0 )
			f48_arg0.clipFinished( f48_arg0.FocusBrackets )
			f48_arg0.MiddleText:completeAnimation()
			f48_arg0.MiddleText:setRGB( 0.31, 0.29, 0.29 )
			f48_arg0.MiddleText:setAlpha( 1 )
			f48_arg0.clipFinished( f48_arg0.MiddleText )
			f48_arg0.lockImage:completeAnimation()
			f48_arg0.lockImage:setScale( 1.2, 1.2 )
			f48_arg0.clipFinished( f48_arg0.lockImage )
			f48_arg0.Lines:completeAnimation()
			f48_arg0.Lines:setAlpha( 0.5 )
			f48_arg0.clipFinished( f48_arg0.Lines )
			f48_arg0.FocusBorder:completeAnimation()
			f48_arg0.FocusBorder:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
			f48_arg0.clipFinished( f48_arg0.FocusBorder )
		end,
		Focus = function ( f49_arg0, f49_arg1 )
			f49_arg0:__resetProperties()
			f49_arg0:setupElementClipCounter( 5 )
			f49_arg0.FocusBrackets:completeAnimation()
			f49_arg0.FocusBrackets:setLeftRight( 0, 1, -10, 10 )
			f49_arg0.FocusBrackets:setTopBottom( 0, 1, -10, 10 )
			f49_arg0.FocusBrackets:setAlpha( 1 )
			f49_arg0.clipFinished( f49_arg0.FocusBrackets )
			f49_arg0.MiddleText:completeAnimation()
			f49_arg0.MiddleText:setRGB( 0.31, 0.29, 0.29 )
			f49_arg0.MiddleText:setAlpha( 1 )
			f49_arg0.clipFinished( f49_arg0.MiddleText )
			f49_arg0.lockImage:completeAnimation()
			f49_arg0.lockImage:setScale( 1.2, 1.2 )
			f49_arg0.clipFinished( f49_arg0.lockImage )
			f49_arg0.Lines:completeAnimation()
			f49_arg0.Lines:setAlpha( 0.5 )
			f49_arg0.clipFinished( f49_arg0.Lines )
			f49_arg0.FocusBorder:completeAnimation()
			f49_arg0.FocusBorder:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
			f49_arg0.FocusBorder:setAlpha( 0.25 )
			f49_arg0.clipFinished( f49_arg0.FocusBorder )
		end,
		GainFocus = function ( f50_arg0, f50_arg1 )
			f50_arg0:__resetProperties()
			f50_arg0:setupElementClipCounter( 5 )
			local f50_local0 = function ( f51_arg0 )
				local f51_local0 = function ( f52_arg0 )
					f52_arg0:beginAnimation( 50, Enum[@"hash_1F50FFF429AB1890"][@"hash_66F6186B702830BC"] )
					f52_arg0:setLeftRight( 0, 1, -10, 10 )
					f52_arg0:setTopBottom( 0, 1, -10, 10 )
					f52_arg0:setAlpha( 1 )
					f52_arg0:registerEventHandler( "transition_complete_keyframe", f50_arg0.clipFinished )
				end
				
				f50_arg0.FocusBrackets:beginAnimation( 100 )
				f50_arg0.FocusBrackets:setLeftRight( 0, 1, -8, 8 )
				f50_arg0.FocusBrackets:setTopBottom( 0, 1, -8, 8 )
				f50_arg0.FocusBrackets:setAlpha( 0.75 )
				f50_arg0.FocusBrackets:registerEventHandler( "interrupted_keyframe", f50_arg0.clipInterrupted )
				f50_arg0.FocusBrackets:registerEventHandler( "transition_complete_keyframe", f51_local0 )
			end
			
			f50_arg0.FocusBrackets:completeAnimation()
			f50_arg0.FocusBrackets:setLeftRight( 0, 1, -40, 40 )
			f50_arg0.FocusBrackets:setTopBottom( 0, 1, -40, 40 )
			f50_arg0.FocusBrackets:setAlpha( 0 )
			f50_local0( f50_arg0.FocusBrackets )
			f50_arg0.MiddleText:completeAnimation()
			f50_arg0.MiddleText:setRGB( 0.31, 0.29, 0.29 )
			f50_arg0.MiddleText:setAlpha( 1 )
			f50_arg0.clipFinished( f50_arg0.MiddleText )
			f50_arg0.lockImage:completeAnimation()
			f50_arg0.lockImage:setScale( 1.2, 1.2 )
			f50_arg0.clipFinished( f50_arg0.lockImage )
			f50_arg0.Lines:completeAnimation()
			f50_arg0.Lines:setAlpha( 0.5 )
			f50_arg0.clipFinished( f50_arg0.Lines )
			local f50_local1 = function ( f53_arg0 )
				f50_arg0.FocusBorder:beginAnimation( 200 )
				f50_arg0.FocusBorder:setAlpha( 0.25 )
				f50_arg0.FocusBorder:registerEventHandler( "interrupted_keyframe", f50_arg0.clipInterrupted )
				f50_arg0.FocusBorder:registerEventHandler( "transition_complete_keyframe", f50_arg0.clipFinished )
			end
			
			f50_arg0.FocusBorder:completeAnimation()
			f50_arg0.FocusBorder:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
			f50_arg0.FocusBorder:setAlpha( 0 )
			f50_local1( f50_arg0.FocusBorder )
		end,
		LoseFocus = function ( f54_arg0, f54_arg1 )
			f54_arg0:__resetProperties()
			f54_arg0:setupElementClipCounter( 5 )
			local f54_local0 = function ( f55_arg0 )
				f54_arg0.FocusBrackets:beginAnimation( 60 )
				f54_arg0.FocusBrackets:setAlpha( 0 )
				f54_arg0.FocusBrackets:registerEventHandler( "interrupted_keyframe", f54_arg0.clipInterrupted )
				f54_arg0.FocusBrackets:registerEventHandler( "transition_complete_keyframe", f54_arg0.clipFinished )
			end
			
			f54_arg0.FocusBrackets:completeAnimation()
			f54_arg0.FocusBrackets:setLeftRight( 0, 1, -10, 10 )
			f54_arg0.FocusBrackets:setTopBottom( 0, 1, -10, 10 )
			f54_arg0.FocusBrackets:setAlpha( 1 )
			f54_local0( f54_arg0.FocusBrackets )
			f54_arg0.MiddleText:completeAnimation()
			f54_arg0.MiddleText:setRGB( 0.31, 0.29, 0.29 )
			f54_arg0.MiddleText:setAlpha( 1 )
			f54_arg0.clipFinished( f54_arg0.MiddleText )
			f54_arg0.lockImage:completeAnimation()
			f54_arg0.lockImage:setScale( 1.2, 1.2 )
			f54_arg0.clipFinished( f54_arg0.lockImage )
			f54_arg0.Lines:completeAnimation()
			f54_arg0.Lines:setAlpha( 0.5 )
			f54_arg0.clipFinished( f54_arg0.Lines )
			local f54_local1 = function ( f56_arg0 )
				f54_arg0.FocusBorder:beginAnimation( 200 )
				f54_arg0.FocusBorder:setAlpha( 0 )
				f54_arg0.FocusBorder:registerEventHandler( "interrupted_keyframe", f54_arg0.clipInterrupted )
				f54_arg0.FocusBorder:registerEventHandler( "transition_complete_keyframe", f54_arg0.clipFinished )
			end
			
			f54_arg0.FocusBorder:completeAnimation()
			f54_arg0.FocusBorder:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
			f54_arg0.FocusBorder:setAlpha( 0.25 )
			f54_local1( f54_arg0.FocusBorder )
		end
	}
}

CoD.DirectorSelectButtonMiniInternal.__onClose = function ( f57_arg0 )
	f57_arg0.FocusBrackets:close()
	f57_arg0.DotTiledBacking:close()
	f57_arg0.Lines:close()
end

-- Message Box
CoD.SystemOverlay_MessageDialog = InheritFrom( CoD.Menu )
LUI.createMenu.SystemOverlay_MessageDialog = function ( f1_arg0, f1_arg1 )
	  local self = CoD.Menu.NewForUIEditor( "SystemOverlay_MessageDialog", f1_arg0 )
	  local f1_local1 = self
	  CoD.OverlayUtility.SystemOverlayPreLoad( self, f1_arg0 )
	  self:setClass( CoD.SystemOverlay_MessageDialog )
	  self.soundSet = "ChooseDecal"
	  self:setOwner( f1_arg0 )
	  self:setLeftRight( 0, 1, 0, 0 )
	  self:setTopBottom( 0, 1, 0, 0 )
	  self:playSound( "menu_open", f1_arg0 )
	  self.anyChildUsesUpdateState = true
	  
	  local layout = CoD.systemOverlay_FreeCursor_Layout.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	  layout:linkToElementModel( self, nil, false, function ( model )
			layout:setModel( model, f1_arg0 )
	  end )
	  self:addElement( layout )
	  self.layout = layout

	  local emptyFocusable = CoD.emptyFocusable.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	  self:addElement( emptyFocusable )
	  self.emptyFocusable = emptyFocusable

	  local ErrorText = GetErrorText(f1_arg0)

	  local error_text = LUI.UIText.new(0.1, 0, 64, 0, 0.25, 0.25, 20, 50)
	  error_text:setText("Error -> " .. ErrorText)
	  error_text:setTTF("ttmussels_demibold")
	  self:addElement(error_text)
	  self.error_text = error_text
	  
	  self:appendEventHandler( "input_source_changed", function ( f3_arg0, f3_arg1 )
			f3_arg1.menu = f3_arg1.menu or f1_local1
			CoD.Menu.UpdateButtonShownState( f3_arg0, f1_local1, f1_arg0, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	  end )
	  local f1_local4 = self
	  local f1_local5 = self.subscribeToModel
	  local f1_local6 = Engine[@"getmodelforcontroller"]( f1_arg0 )
	  f1_local5( f1_local4, f1_local6.LastInput, function ( f4_arg0, f4_arg1 )
			CoD.Menu.UpdateButtonShownState( f4_arg1, f1_local1, f1_arg0, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xba_pscross"], "ui_confirm", function ( element, menu, controller, model )
			if not IsMouseOrKeyboard( controller ) and CoD.OverlayUtility.HasOverlayACrossAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayACrossAction( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if not IsMouseOrKeyboard( controller ) and CoD.OverlayUtility.HasOverlayACrossAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"hash_128080D5840E11B2", nil, "ui_confirm" )
				  return true
			else
				  return false
			end
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xbb_pscircle"], nil, function ( element, menu, controller, model )
			if CoD.OverlayUtility.HasOverlayBCircleAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayBCircleAction( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if CoD.OverlayUtility.HasOverlayBCircleAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xbb_pscircle"], @"hash_128080D5840E11B2", nil, nil )
				  return true
			else
				  return false
			end
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xbx_pssquare"], "A", function ( element, menu, controller, model )
			if CoD.OverlayUtility.HasOverlayXSquareAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayXSquareAction( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if CoD.OverlayUtility.HasOverlayXSquareAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xbx_pssquare"], @"hash_128080D5840E11B2", nil, "A" )
				  return true
			else
				  return false
			end
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xby_pstriangle"], "S", function ( element, menu, controller, model )
			if CoD.OverlayUtility.HasOverlayYTriangleAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayYTriangleAction( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if CoD.OverlayUtility.HasOverlayYTriangleAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xby_pstriangle"], @"hash_128080D5840E11B2", nil, "S" )
				  return true
			else
				  return false
			end
	  end, false )
	  layout.buttons:setModel( self.buttonModel, f1_arg0 )
	  layout.id = "layout"
	  emptyFocusable.id = "emptyFocusable"
	  self:processEvent( {
			name = "menu_loaded",
			controller = f1_arg0
	  } )
	  self.__defaultFocus = layout
	  if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
			self:restoreState( f1_arg0 )
	  end
	  LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	  if PostLoadFunc then
			PostLoadFunc( self, f1_arg0 )
	  end
	  
	  f1_local5 = self
	  CoD.OverlayUtility.SystemOverlayPostLoad( self, f1_arg0 )
	  --DisableKeyboardNavigationByElement( emptyFocusable )

	  self:setAlpha(0.75)
	  self:setRGB(0.85, 0.90, 0)
	  RushPrintInfo("Called - > " .. ErrorText, "System Overlay Message Box")

	  return self
end

CoD.SystemOverlay_MessageDialog.__onClose = function ( f13_arg0 )
	  f13_arg0.layout:close()
	  f13_arg0.emptyFocusable:close()
end

-- Full One
CoD.SystemOverlay_MessageDialogFull = InheritFrom( CoD.Menu )
LUI.createMenu.SystemOverlay_MessageDialogFull = function ( f1_arg0, f1_arg1 )
	  local self = CoD.Menu.NewForUIEditor( "SystemOverlay_MessageDialogFull", f1_arg0 )
	  local f1_local1 = self
	  self:setClass( CoD.SystemOverlay_MessageDialogFull )
	  self.soundSet = "default"
	  self:setOwner( f1_arg0 )
	  self:setLeftRight( 0, 1, 0, 0 )
	  self:setTopBottom( 0, 1, 0, 0 )
	  self:playSound( "menu_open", f1_arg0 )
	  self.anyChildUsesUpdateState = true
	  
	  local layout = CoD.systemOverlay_Full_Layout.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	  layout:linkToElementModel( self, nil, false, function ( model )
			layout:setModel( model, f1_arg0 )
	  end )
	  self:addElement( layout )
	  self.layout = layout
	  
	  local emptyFocusable = CoD.emptyFocusable.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	  self:addElement( emptyFocusable )
	  self.emptyFocusable = emptyFocusable
	  
	  local BTNQuit = nil

	  local ErrorText = GetErrorText(f1_arg0)

	  local error_text = LUI.UIText.new(0.1, 0, 64, 0, 0.18, 0.18, 20, 50)
	  error_text:setText("Error -> " .. ErrorText)
	  error_text:setTTF("ttmussels_demibold")
	  self:addElement(error_text)
	  self.error_text = error_text
	  
	  BTNQuit = CoD.PC_SmallCloseButton.new( f1_local1, f1_arg0, 0.5, 0.5, 866, 900, 0.5, 0.5, -230, -198 )
	  BTNQuit:registerEventHandler( "gain_focus", function ( element, event )
			local f3_local0 = nil
			if element.gainFocus then
				  f3_local0 = element:gainFocus( event )
			elseif element.super.gainFocus then
				  f3_local0 = element.super:gainFocus( event )
			end
			CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
			return f3_local0
	  end )
	  f1_local1:AddButtonCallbackFunction( BTNQuit, f1_arg0, Enum[@"luibutton"][@"lui_key_xba_pscross"], "ui_confirm", function ( element, menu, controller, model )
			PerformOverlayBack( menu, controller )
			return true
	  end, function ( element, menu, controller )
			CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"hash_0", nil, "ui_confirm" )
			return false
	  end, false )
	  self:addElement( BTNQuit )
	  self.BTNQuit = BTNQuit
	  
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xba_pscross"], "ui_confirm", function ( element, menu, controller, model )
			if CoD.OverlayUtility.HasOverlayACrossAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayACrossAction( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if CoD.OverlayUtility.HasOverlayACrossAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"hash_128080D5840E11B2", nil, "ui_confirm" )
				  return true
			else
				  return false
			end
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xbb_pscircle"], "ESCAPE", function ( element, menu, controller, model )
			if CoD.OverlayUtility.HasOverlayBCircleAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayBCircleAction( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if CoD.OverlayUtility.HasOverlayBCircleAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xbb_pscircle"], @"hash_128080D5840E11B2", nil, "ESCAPE" )
				  return true
			else
				  return false
			end
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xbx_pssquare"], "A", function ( element, menu, controller, model )
			if CoD.OverlayUtility.HasOverlayXSquareAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayXSquareAction( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if CoD.OverlayUtility.HasOverlayXSquareAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xbx_pssquare"], @"hash_128080D5840E11B2", nil, "A" )
				  return true
			else
				  return false
			end
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xby_pstriangle"], "S", function ( element, menu, controller, model )
			if CoD.OverlayUtility.HasOverlayYTriangleAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayYTriangleAction( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if CoD.OverlayUtility.HasOverlayYTriangleAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xby_pstriangle"], @"hash_128080D5840E11B2", nil, "S" )
				  return true
			else
				  return false
			end
	  end, false )
	  layout.buttons:setModel( self.buttonModel, f1_arg0 )
	  layout.id = "layout"
	  emptyFocusable.id = "emptyFocusable"
	  if CoD.isPC then
			BTNQuit.id = "BTNQuit"
	  end
	  self:processEvent( {
			name = "menu_loaded",
			controller = f1_arg0
	  } )
	  self.__defaultFocus = layout
	  if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
			self:restoreState( f1_arg0 )
	  end
	  LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	  if PostLoadFunc then
			PostLoadFunc( self, f1_arg0 )
	  end
	  
	  self:setAlpha(0.75)
	  self:setRGB(0.85, 0.90, 0)
	  RushPrintInfo("Called", "System Overlay Full Message Box")

	  return self
end

CoD.SystemOverlay_MessageDialogFull.__onClose = function ( f14_arg0 )
	  f14_arg0.layout:close()
	  f14_arg0.emptyFocusable:close()
	  f14_arg0.BTNQuit:close()
end

CoD.SystemOverlay_Compact = InheritFrom( CoD.Menu )
LUI.createMenu.SystemOverlay_Compact = function ( f1_arg0, f1_arg1 )
	  local self = CoD.Menu.NewForUIEditor( "SystemOverlay_Compact", f1_arg0 )
	  local f1_local1 = self
	  DisableAutoButtonCallback( f1_local1, self, f1_arg0 )
	  self:setClass( CoD.SystemOverlay_Compact )
	  self.soundSet = "default"
	  self:setOwner( f1_arg0 )
	  self:setLeftRight( 0, 1, 0, 0 )
	  self:setTopBottom( 0, 1, 0, 0 )
	  self:playSound( "menu_open", f1_arg0 )
	  self.anyChildUsesUpdateState = true
	  
	  local layout = CoD.systemOverlay_Compact_Layout.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	  layout:setAlpha( 0.99 )
	  layout:linkToElementModel( self, nil, false, function ( model )
			layout:setModel( model, f1_arg0 )
	  end )
	  self:addElement( layout )
	  self.layout = layout
	  
	  local BTNQuit = nil
	  
	  BTNQuit = CoD.PC_SmallCloseButton.new( f1_local1, f1_arg0, 0.5, 0.5, 866, 900, 0.5, 0.5, -232, -198 )
	  BTNQuit:registerEventHandler( "gain_focus", function ( element, event )
			local f3_local0 = nil
			if element.gainFocus then
				  f3_local0 = element:gainFocus( event )
			elseif element.super.gainFocus then
				  f3_local0 = element.super:gainFocus( event )
			end
			CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
			return f3_local0
	  end )
	  f1_local1:AddButtonCallbackFunction( BTNQuit, f1_arg0, Enum[@"luibutton"][@"lui_key_xba_pscross"], "ui_confirm", function ( element, menu, controller, model )
			if HasOverlayBackAction( menu ) then
				  PerformOverlayBack( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if HasOverlayBackAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"hash_0", nil, "ui_confirm" )
				  return false
			else
				  return false
			end
	  end, false )
	  self:addElement( BTNQuit )
	  self.BTNQuit = BTNQuit
	  
	  self:appendEventHandler( "input_source_changed", function ( f6_arg0, f6_arg1 )
			f6_arg1.menu = f6_arg1.menu or f1_local1
			CoD.Menu.UpdateButtonShownState( f6_arg0, f1_local1, f1_arg0, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
			CoD.Menu.UpdateButtonShownState( f6_arg0, f1_local1, f1_arg0, Enum[@"luibutton"][@"lui_key_xbb_pscircle"] )
			CoD.Menu.UpdateButtonShownState( f6_arg0, f1_local1, f1_arg0, Enum[@"luibutton"][@"lui_key_xbx_pssquare"] )
			CoD.Menu.UpdateButtonShownState( f6_arg0, f1_local1, f1_arg0, Enum[@"luibutton"][@"lui_key_xby_pstriangle"] )
	  end )
	  local f1_local4 = self
	  local f1_local5 = self.subscribeToModel
	  local f1_local6 = Engine[@"getmodelforcontroller"]( f1_arg0 )
	  f1_local5( f1_local4, f1_local6.LastInput, function ( f7_arg0, f7_arg1 )
			CoD.Menu.UpdateButtonShownState( f7_arg1, f1_local1, f1_arg0, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
			CoD.Menu.UpdateButtonShownState( f7_arg1, f1_local1, f1_arg0, Enum[@"luibutton"][@"lui_key_xbb_pscircle"] )
			CoD.Menu.UpdateButtonShownState( f7_arg1, f1_local1, f1_arg0, Enum[@"luibutton"][@"lui_key_xbx_pssquare"] )
			CoD.Menu.UpdateButtonShownState( f7_arg1, f1_local1, f1_arg0, Enum[@"luibutton"][@"lui_key_xby_pstriangle"] )
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xbx_pssquare"], nil, function ( element, menu, controller, model )
			if not IsPC() then
				  return true
			elseif IsPC() and IsGamepad( controller ) and CoD.OverlayUtility.HasOverlayXSquareAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayXSquareAction( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if not IsPC() then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xbx_pssquare"], @"hash_0", nil, nil )
				  return false
			elseif IsPC() and IsGamepad( controller ) and CoD.OverlayUtility.HasOverlayXSquareAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xbx_pssquare"], @"hash_57E8A8BFFB7D0CD4", nil, nil )
				  return true
			else
				  return false
			end
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xby_pstriangle"], nil, function ( element, menu, controller, model )
			if not IsPC() then
				  return true
			elseif IsPC() and IsGamepad( controller ) and CoD.OverlayUtility.HasOverlayYTriangleAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayYTriangleAction( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if not IsPC() then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xby_pstriangle"], @"hash_0", nil, nil )
				  return false
			elseif IsPC() and IsGamepad( controller ) and CoD.OverlayUtility.HasOverlayYTriangleAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xby_pstriangle"], @"hash_57E8A8BFFB7D0CD4", nil, nil )
				  return true
			else
				  return false
			end
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xba_pscross"], nil, function ( element, menu, controller, model )
			if not IsPC() and HasOverlayContinueAction( menu ) then
				  PerformOverlayContinue( menu, controller )
				  return true
			elseif IsPC() and IsGamepad( controller ) and CoD.OverlayUtility.HasOverlayACrossAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayACrossAction( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if not IsPC() and HasOverlayContinueAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"hash_66393FF34EA56966", nil, nil )
				  return true
			elseif IsPC() and IsGamepad( controller ) and CoD.OverlayUtility.HasOverlayACrossAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"hash_57E8A8BFFB7D0CD4", nil, nil )
				  return true
			else
				  return false
			end
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xbb_pscircle"], "ESCAPE", function ( element, menu, controller, model )
			if not IsPC() and HasOverlayBackAction( menu ) then
				  PerformOverlayBack( menu, controller )
				  return true
			elseif IsPC() and IsGamepad( controller ) and CoD.OverlayUtility.HasOverlayBCircleAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayBCircleAction( menu, controller )
				  return true
			elseif IsPC() and IsMouseOrKeyboard( controller ) and HasOverlayBackAction( menu ) then
				  PerformOverlayBack( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if not IsPC() and HasOverlayBackAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xbb_pscircle"], @"menu/back", nil, "ESCAPE" )
				  return true
			elseif IsPC() and IsGamepad( controller ) and CoD.OverlayUtility.HasOverlayBCircleAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xbb_pscircle"], @"hash_57E8A8BFFB7D0CD4", nil, "ESCAPE" )
				  return true
			elseif IsPC() and IsMouseOrKeyboard( controller ) and HasOverlayBackAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xbb_pscircle"], @"hash_57E8A8BFFB7D0CD4", nil, "ESCAPE" )
				  return true
			else
				  return false
			end
	  end, false )
	  layout.buttons:setModel( self.buttonModel, f1_arg0 )
	  layout.id = "layout"
	  if CoD.isPC then
			BTNQuit.id = "BTNQuit"
	  end
	  self:processEvent( {
			name = "menu_loaded",
			controller = f1_arg0
	  } )
	  self.__defaultFocus = layout
	  if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
			self:restoreState( f1_arg0 )
	  end
	  LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	  if PostLoadFunc then
			PostLoadFunc( self, f1_arg0 )
	  end
	  f1_local5 = self
	  SetProperty( self, "disablePopupOpenCloseAnim", true )
	  MenuHidesFreeCursor( f1_local1, f1_arg0 )
	  f1_local5 = BTNQuit
	  if not HasOverlayBackAction( f1_local1 ) then
			ReplaceElementWithFake( self, "BTNQuit" )
	  end

	  self:setAlpha(0.75)
	  self:setRGB(0.85, 0.90, 0)
	  RushPrintInfo("Called", "System Overlay Compact")

	  return self
end

CoD.SystemOverlay_Compact.__onClose = function ( f16_arg0 )
	  f16_arg0.layout:close()
	  f16_arg0.BTNQuit:close()
end

CoD.SystemOverlay_NoBG = InheritFrom( CoD.Menu )
LUI.createMenu.SystemOverlay_NoBG = function ( f1_arg0, f1_arg1 )
	  local self = CoD.Menu.NewForUIEditor( "SystemOverlay_NoBG", f1_arg0 )
	  local f1_local1 = self
	  CoD.OverlayUtility.SystemOverlayPreLoad( self, f1_arg0 )
	  self:setClass( CoD.SystemOverlay_NoBG )
	  self.soundSet = "default"
	  self:setOwner( f1_arg0 )
	  self:setLeftRight( 0, 1, 0, 0 )
	  self:setTopBottom( 0, 1, 0, 0 )
	  self:playSound( "menu_open", f1_arg0 )
	  self.anyChildUsesUpdateState = true
	  
	  local layout = CoD.systemOverlay_Compact_Layout.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -540, 540 )
	  layout:setAlpha( 0.99 )
	  layout.background:setAlpha( 0 )
	  layout:linkToElementModel( self, nil, false, function ( model )
			layout:setModel( model, f1_arg0 )
	  end )
	  self:addElement( layout )
	  self.layout = layout
	  
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xba_pscross"], nil, function ( element, menu, controller, model )
			return true
	  end, function ( element, menu, controller )
			CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"hash_0", nil, nil )
			return false
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xbb_pscircle"], nil, function ( element, menu, controller, model )
			if HasOverlayBackAction( menu ) then
				  PerformOverlayBack( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if HasOverlayBackAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xbb_pscircle"], @"menu/back", nil, nil )
				  return true
			else
				  return false
			end
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xbx_pssquare"], nil, function ( element, menu, controller, model )
			return true
	  end, function ( element, menu, controller )
			CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xbx_pssquare"], @"hash_0", nil, nil )
			return false
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xby_pstriangle"], nil, function ( element, menu, controller, model )
			return true
	  end, function ( element, menu, controller )
			CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xby_pstriangle"], @"hash_0", nil, nil )
			return false
	  end, false )
	  layout.buttons:setModel( self.buttonModel, f1_arg0 )
	  layout.id = "layout"
	  self:processEvent( {
			name = "menu_loaded",
			controller = f1_arg0
	  } )
	  self.__defaultFocus = layout
	  if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
			self:restoreState( f1_arg0 )
	  end
	  LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	  if PostLoadFunc then
			PostLoadFunc( self, f1_arg0 )
	  end
	  
	  local f1_local3 = self
	  CoD.OverlayUtility.SystemOverlayPostLoad( self, f1_arg0 )

	  self:setAlpha(0.75)
	  self:setRGB(0.85, 0.90, 0)
	  RushPrintInfo("Called", "System Overlay No BG")

	  return self
end

CoD.SystemOverlay_NoBG.__onClose = function ( f11_arg0 )
	  f11_arg0.layout:close()
end

local PostLoadFuncE = function ( f1_arg0 )
	  f1_arg0.disablePopupOpenCloseAnim = true
	  f1_arg0.disableBlur = true
end

CoD.SystemOverlay_Full = InheritFrom( CoD.Menu )
LUI.createMenu.SystemOverlay_Full = function ( f2_arg0, f2_arg1 )
	  local self = CoD.Menu.NewForUIEditor( "SystemOverlay_Full", f2_arg0 )
	  local f2_local1 = self
	  self:setClass( CoD.SystemOverlay_Full )
	  self.soundSet = "default"
	  self:setOwner( f2_arg0 )
	  self:setLeftRight( 0, 1, 0, 0 )
	  self:setTopBottom( 0, 1, 0, 0 )
	  self:playSound( "menu_open", f2_arg0 )
	  self.anyChildUsesUpdateState = true
	  
	  local layout = CoD.systemOverlay_Full_Layout.new( f2_local1, f2_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	  layout:linkToElementModel( self, nil, false, function ( model )
			layout:setModel( model, f2_arg0 )
	  end )
	  self:addElement( layout )
	  self.layout = layout
	  
	  local BTNQuit = nil
	  
	  BTNQuit = CoD.PC_SmallCloseButton.new( f2_local1, f2_arg0, 0.5, 0.5, 866, 900, 0.5, 0.5, -230, -198 )
	  BTNQuit:registerEventHandler( "gain_focus", function ( element, event )
			local f4_local0 = nil
			if element.gainFocus then
				  f4_local0 = element:gainFocus( event )
			elseif element.super.gainFocus then
				  f4_local0 = element.super:gainFocus( event )
			end
			CoD.Menu.UpdateButtonShownState( element, f2_local1, f2_arg0, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
			return f4_local0
	  end )
	  f2_local1:AddButtonCallbackFunction( BTNQuit, f2_arg0, Enum[@"luibutton"][@"lui_key_xba_pscross"], "ui_confirm", function ( element, menu, controller, model )
			PerformOverlayBack( menu, controller )
			return true
	  end, function ( element, menu, controller )
			CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"hash_0", nil, "ui_confirm" )
			return false
	  end, false )
	  self:addElement( BTNQuit )
	  self.BTNQuit = BTNQuit
	  
	  f2_local1:AddButtonCallbackFunction( self, f2_arg0, Enum[@"luibutton"][@"lui_key_xba_pscross"], "ui_confirm", function ( element, menu, controller, model )
			if HasOverlayContinueAction( menu ) then
				  PerformOverlayContinue( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if HasOverlayContinueAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"hash_66393FF34EA56966", nil, "ui_confirm" )
				  return true
			else
				  return false
			end
	  end, false )
	  f2_local1:AddButtonCallbackFunction( self, f2_arg0, Enum[@"luibutton"][@"lui_key_xbb_pscircle"], nil, function ( element, menu, controller, model )
			if HasOverlayBackAction( menu ) then
				  PerformOverlayBack( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if HasOverlayBackAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xbb_pscircle"], @"menu/back", nil, nil )
				  return true
			else
				  return false
			end
	  end, false )
	  f2_local1:AddButtonCallbackFunction( self, f2_arg0, Enum[@"luibutton"][@"lui_key_xbx_pssquare"], nil, function ( element, menu, controller, model )
			return true
	  end, function ( element, menu, controller )
			CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xbx_pssquare"], @"hash_0", nil, nil )
			return false
	  end, false )
	  f2_local1:AddButtonCallbackFunction( self, f2_arg0, Enum[@"luibutton"][@"lui_key_xby_pstriangle"], nil, function ( element, menu, controller, model )
			return true
	  end, function ( element, menu, controller )
			CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xby_pstriangle"], @"hash_0", nil, nil )
			return false
	  end, false )
	  layout.buttons:setModel( self.buttonModel, f2_arg0 )
	  layout.id = "layout"
	  if CoD.isPC then
			BTNQuit.id = "BTNQuit"
	  end
	  self:processEvent( {
			name = "menu_loaded",
			controller = f2_arg0
	  } )
	  self.__defaultFocus = layout
	  if CoD.isPC and (IsKeyboard( f2_arg0 ) or self.ignoreCursor) then
			self:restoreState( f2_arg0 )
	  end
	  LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	  if PostLoadFunc then
			PostLoadFuncE( self, f2_arg0 )
	  end
	  
	  self:setAlpha(0.75)
	  self:setRGB(0.85, 0.90, 0)
	  RushPrintInfo("Called", "System Overlay Full")

	  return self
end

CoD.SystemOverlay_Full.__onClose = function ( f15_arg0 )
	  f15_arg0.layout:close()
	  f15_arg0.BTNQuit:close()
end

CoD.SystemOverlay_FreeCursor = InheritFrom( CoD.Menu )
LUI.createMenu.SystemOverlay_FreeCursor = function ( f1_arg0, f1_arg1 )
	  local self = CoD.Menu.NewForUIEditor( "SystemOverlay_FreeCursor", f1_arg0 )
	  local f1_local1 = self
	  self:setClass( CoD.SystemOverlay_FreeCursor )
	  self.soundSet = "default"
	  self:setOwner( f1_arg0 )
	  self:setLeftRight( 0, 1, 0, 0 )
	  self:setTopBottom( 0, 1, 0, 0 )
	  self:playSound( "menu_open", f1_arg0 )
	  self.anyChildUsesUpdateState = true
	  
	  local layout = CoD.systemOverlay_FreeCursor_Layout.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	  layout:setAlpha( 0.99 )
	  layout:linkToElementModel( self, nil, false, function ( model )
			layout:setModel( model, f1_arg0 )
	  end )
	  self:addElement( layout )
	  self.layout = layout
	  
	  local emptyFocusable = CoD.emptyFocusable.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	  self:addElement( emptyFocusable )
	  self.emptyFocusable = emptyFocusable
	  
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xba_pscross"], "ui_confirm", function ( element, menu, controller, model )
			if CoD.OverlayUtility.HasOverlayACrossAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayACrossAction( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if CoD.OverlayUtility.HasOverlayACrossAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"hash_128080D5840E11B2", nil, "ui_confirm" )
				  return true
			else
				  return false
			end
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xbb_pscircle"], "ESCAPE", function ( element, menu, controller, model )
			if CoD.OverlayUtility.HasOverlayBCircleAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayBCircleAction( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if CoD.OverlayUtility.HasOverlayBCircleAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xbb_pscircle"], @"hash_128080D5840E11B2", nil, "ESCAPE" )
				  return true
			else
				  return false
			end
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xbx_pssquare"], "A", function ( element, menu, controller, model )
			if CoD.OverlayUtility.HasOverlayXSquareAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayXSquareAction( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if CoD.OverlayUtility.HasOverlayXSquareAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xbx_pssquare"], @"hash_128080D5840E11B2", nil, "A" )
				  return true
			else
				  return false
			end
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xby_pstriangle"], "S", function ( element, menu, controller, model )
			if CoD.OverlayUtility.HasOverlayYTriangleAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayYTriangleAction( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if CoD.OverlayUtility.HasOverlayYTriangleAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xby_pstriangle"], @"hash_128080D5840E11B2", nil, "S" )
				  return true
			else
				  return false
			end
	  end, false )
	  layout.buttons:setModel( self.buttonModel, f1_arg0 )
	  layout.id = "layout"
	  emptyFocusable.id = "emptyFocusable"
	  self:processEvent( {
			name = "menu_loaded",
			controller = f1_arg0
	  } )
	  self.__defaultFocus = layout
	  if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
			self:restoreState( f1_arg0 )
	  end
	  LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	  if PostLoadFunc then
			PostLoadFunc( self, f1_arg0 )
	  end

	  self:setAlpha(0.75)
	  self:setRGB(0.85, 0.90, 0)
	  RushPrintInfo("Called", "System Overlay Free Cursor")
	  
	  return self
end

CoD.SystemOverlay_FreeCursor.__onClose = function ( f11_arg0 )
	  f11_arg0.layout:close()
	  f11_arg0.emptyFocusable:close()
end

CoD.SystemOverlay_FreeCursor_Full = InheritFrom( CoD.Menu )
LUI.createMenu.SystemOverlay_FreeCursor_Full = function ( f1_arg0, f1_arg1 )
	  local self = CoD.Menu.NewForUIEditor( "SystemOverlay_FreeCursor_Full", f1_arg0 )
	  local f1_local1 = self
	  self:setClass( CoD.SystemOverlay_FreeCursor_Full )
	  self.soundSet = "default"
	  self:setOwner( f1_arg0 )
	  self:setLeftRight( 0, 1, 0, 0 )
	  self:setTopBottom( 0, 1, 0, 0 )
	  self:playSound( "menu_open", f1_arg0 )
	  self.anyChildUsesUpdateState = true
	  
	  local layout = CoD.systemOverlay_FreeCursor_Full_Layout.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	  layout:setAlpha( 0.99 )
	  layout:linkToElementModel( self, nil, false, function ( model )
			layout:setModel( model, f1_arg0 )
	  end )
	  self:addElement( layout )
	  self.layout = layout
	  
	  local emptyFocusable = CoD.emptyFocusable.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	  self:addElement( emptyFocusable )
	  self.emptyFocusable = emptyFocusable
	  
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xba_pscross"], "ui_confirm", function ( element, menu, controller, model )
			if CoD.OverlayUtility.HasOverlayACrossAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayACrossAction( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if CoD.OverlayUtility.HasOverlayACrossAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"hash_128080D5840E11B2", nil, "ui_confirm" )
				  return true
			else
				  return false
			end
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xbb_pscircle"], "ESCAPE", function ( element, menu, controller, model )
			if CoD.OverlayUtility.HasOverlayBCircleAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayBCircleAction( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if CoD.OverlayUtility.HasOverlayBCircleAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xbb_pscircle"], @"hash_128080D5840E11B2", nil, "ESCAPE" )
				  return true
			else
				  return false
			end
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xbx_pssquare"], "A", function ( element, menu, controller, model )
			if CoD.OverlayUtility.HasOverlayXSquareAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayXSquareAction( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if CoD.OverlayUtility.HasOverlayXSquareAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xbx_pssquare"], @"hash_128080D5840E11B2", nil, "A" )
				  return true
			else
				  return false
			end
	  end, false )
	  f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xby_pstriangle"], "S", function ( element, menu, controller, model )
			if CoD.OverlayUtility.HasOverlayYTriangleAction( menu ) then
				  CoD.OverlayUtility.PerformOverlayYTriangleAction( menu, controller )
				  return true
			else
				  
			end
	  end, function ( element, menu, controller )
			if CoD.OverlayUtility.HasOverlayYTriangleAction( menu ) then
				  CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xby_pstriangle"], @"hash_128080D5840E11B2", nil, "S" )
				  return true
			else
				  return false
			end
	  end, false )
	  layout.buttons:setModel( self.buttonModel, f1_arg0 )
	  layout.id = "layout"
	  emptyFocusable.id = "emptyFocusable"
	  self:processEvent( {
			name = "menu_loaded",
			controller = f1_arg0
	  } )
	  self.__defaultFocus = layout
	  if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
			self:restoreState( f1_arg0 )
	  end
	  LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	  if PostLoadFunc then
			PostLoadFunc( self, f1_arg0 )
	  end

	  self:setAlpha(0.75)
	  self:setRGB(0.85, 0.90, 0)
	  RushPrintInfo("Called", "System Overlay Free Cursor Full")
	  
	  return self
end

CoD.SystemOverlay_FreeCursor_Full.__onClose = function ( f11_arg0 )
	  f11_arg0.layout:close()
	  f11_arg0.emptyFocusable:close()
end

CoD.header_container_frontend = InheritFrom( LUI.UIElement )
CoD.header_container_frontend.__defaultWidth = 1920
CoD.header_container_frontend.__defaultHeight = 42
CoD.header_container_frontend.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.header_container_frontend )
	self.id = "header_container_frontend"
	self.soundSet = "default"
	
	local BackingBlack = LUI.UIImage.new( -0.14, 1.16, 0, 0, 0, 0, -103, 9 )
	BackingBlack:setRGB( 0, 0, 0 )
	self:addElement( BackingBlack )
	self.BackingBlack = BackingBlack
	
	local f1_local2 = nil
	self.BackingGrayMediumLeft = LUI.UIElement.createFake()
	local BackingGrayMediumLeftPC = nil
	
	BackingGrayMediumLeftPC = CoD.HeaderLinesContainer.new( f1_arg0, f1_arg1, -0.14, 1.16, 0, 0, 0, 0, -103, 9 )
	BackingGrayMediumLeftPC:setRGB( 0, 0, 0 )
	BackingGrayMediumLeftPC:setAlpha(0)
	self:addElement( BackingGrayMediumLeftPC )
	self.BackingGrayMediumLeftPC = BackingGrayMediumLeftPC
	
	local GrainBG01 = LUI.UIImage.new( -0.14, 1.16, 0, 0, 0, 0, -247, 9 )
	GrainBG01:setAlpha( 0 )
	GrainBG01:setImage( RegisterImage( @"hash_1FC25912CF54567" ) )
	GrainBG01:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_1655565C7B387234" ) )
	self:addElement( GrainBG01 )
	self.GrainBG01 = GrainBG01
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end

	RushPrintInfo("Called", "Header Container Frontend")
	self:setAlpha(0)

	return self
end

CoD.header_container_frontend.__onClose = function ( f2_arg0 )
	f2_arg0.BackingGrayMediumLeft:close()
	f2_arg0.BackingGrayMediumLeftPC:close()
end

-- Spinner (no not the bo4 logo, it's the plasma, etc logo lol)
CoD.SpinnerLoadingAnimation = InheritFrom( LUI.UIElement )
CoD.SpinnerLoadingAnimation.__defaultWidth = 60
CoD.SpinnerLoadingAnimation.__defaultHeight = 60
CoD.SpinnerLoadingAnimation.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.SpinnerLoadingAnimation )
	self.id = "SpinnerLoadingAnimation"
	self.soundSet = "none"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Spinner = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	Spinner:setAlpha( 0.02 )
	Spinner:setZRot( -359 )
	Spinner:setRGB(1, 0, 0)
	Spinner:setImage( RegisterImage( @"hash_7C96F6285B1D996C" ) )
	Spinner:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_F755127C95CF5B6" ) )
	Spinner:setShaderVector( 0, 2, 0, 0, 0 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local TierSlot = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	TierSlot:setAlpha( 0 )
	TierSlot:setRGB(1, 0, 1)
	TierSlot:setImage( RegisterImage( @"hash_54E34A05404188D6" ) )
	self:addElement( TierSlot )
	self.TierSlot = TierSlot
	
	local Tier = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	Tier:setAlpha( 0 )
	Tier:setRGB(1, 0, 0)
	Tier:setImage( RegisterImage( @"hash_583164AD29684964" ) )
	self:addElement( Tier )
	self.Tier = Tier
	
	local TierGlow = LUI.UIImage.new( -0.08, 1.08, 0, 0, -0.57, 1.57, 0, 0 )
	TierGlow:setRGB( 0.00, 0.75, 0.36 )
	TierGlow:setAlpha( 0 )
	TierGlow:setImage( RegisterImage( @"hash_64A1176ABBF1AB4C" ) )
	TierGlow:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_31CC85D0A86303B0" ) )
	TierGlow:setShaderVector( 0, 2, 0, 0, 0 )
	self:addElement( TierGlow )
	self.TierGlow = TierGlow
	
	local NPEmpty = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	NPEmpty:setAlpha( 0 )
	NPEmpty:setImage( RegisterImage( @"hash_3F0CBEA58DDBE303" ) )
	self:addElement( NPEmpty )
	self.NPEmpty = NPEmpty
	
	local NP = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	NP:setAlpha( 0 )
	NP:setImage( RegisterImage( @"hash_476C393335224D3F" ) )
	self:addElement( NP )
	self.NP = NP
	
	local NPGlow = LUI.UIImage.new( -0.08, 1.08, -4, -4, -0.37, 1.77, 1, 1 )
	NPGlow:setRGB( 0.46, 0.00, 0.00 )
	NPGlow:setAlpha( 0 )
	NPGlow:setImage( RegisterImage( @"hash_64A1176ABBF1AB4C" ) )
	NPGlow:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_31CC85D0A86303B0" ) )
	NPGlow:setShaderVector( 0, 2, 0, 0, 0 )
	self:addElement( NPGlow )
	self.NPGlow = NPGlow
	
	self:mergeStateConditions( {
		{
			stateName = "Blackmarket",
			condition = function ( menu, element, event )
				return IsPerControllerTablePropertyValue( f1_arg1, "inBlackMarket", true )
			end
		},
		{
			stateName = "Laboratory",
			condition = function ( menu, element, event )
				return IsPerControllerTablePropertyValue( f1_arg1, "inLaboratory", true )
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	self:setRGB(1, 0, 1)
	RushPrintInfo("Called", "Spinner")
	
	return self
end

CoD.SpinnerLoadingAnimation.__resetProperties = function ( f4_arg0 )
	f4_arg0.Spinner:completeAnimation()
	f4_arg0.TierSlot:completeAnimation()
	f4_arg0.Tier:completeAnimation()
	f4_arg0.TierGlow:completeAnimation()
	f4_arg0.NPEmpty:completeAnimation()
	f4_arg0.NP:completeAnimation()
	f4_arg0.NPGlow:completeAnimation()
	f4_arg0.Spinner:setAlpha( 0.02 )
	f4_arg0.Spinner:setZRot( -359 )
	f4_arg0.TierSlot:setAlpha( 0 )
	f4_arg0.Tier:setAlpha( 0 )
	f4_arg0.Tier:setScale( 1, 1 )
	f4_arg0.TierGlow:setAlpha( 0 )
	f4_arg0.TierGlow:setScale( 1, 1 )
	f4_arg0.NPEmpty:setAlpha( 0 )
	f4_arg0.NP:setAlpha( 0 )
	f4_arg0.NP:setScale( 1, 1 )
	f4_arg0.NPGlow:setAlpha( 0 )
	f4_arg0.NPGlow:setScale( 1, 1 )
end

CoD.SpinnerLoadingAnimation.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f5_arg0, f5_arg1 )
			f5_arg0:__resetProperties()
			f5_arg0:setupElementClipCounter( 1 )
			local f5_local0 = function ( f6_arg0 )
				f5_arg0.Spinner:beginAnimation( 1400 )
				f5_arg0.Spinner:setZRot( -359 )
				f5_arg0.Spinner:registerEventHandler( "interrupted_keyframe", f5_arg0.clipInterrupted )
				f5_arg0.Spinner:registerEventHandler( "transition_complete_keyframe", f5_arg0.clipFinished )
			end
			
			f5_arg0.Spinner:completeAnimation()
			f5_arg0.Spinner:setZRot( 0 )
			f5_local0( f5_arg0.Spinner )
			f5_arg0.nextClip = "DefaultClip"
		end
	},
	Blackmarket = {
		DefaultClip = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 4 )
			f7_arg0.Spinner:completeAnimation()
			f7_arg0.Spinner:setAlpha( 0 )
			f7_arg0.clipFinished( f7_arg0.Spinner )
			f7_arg0.TierSlot:completeAnimation()
			f7_arg0.TierSlot:setAlpha( 1 )
			f7_arg0.clipFinished( f7_arg0.TierSlot )
			local f7_local0 = function ( f8_arg0 )
				local f8_local0 = function ( f9_arg0 )
					local f9_local0 = function ( f10_arg0 )
						local f10_local0 = function ( f11_arg0 )
							f11_arg0:beginAnimation( 799, Enum[@"hash_1F50FFF429AB1890"][@"hash_66F6186B702830BC"] )
							f11_arg0:setAlpha( 0 )
							f11_arg0:registerEventHandler( "transition_complete_keyframe", f7_arg0.clipFinished )
						end
						
						f10_arg0:beginAnimation( 250, Enum[@"hash_1F50FFF429AB1890"][@"hash_66F6186B702830BC"] )
						f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
					end
					
					f9_arg0:beginAnimation( 49, Enum[@"hash_1F50FFF429AB1890"][@"hash_66F6186B702830BC"] )
					f9_arg0:setAlpha( 1 )
					f9_arg0:setScale( 0.9, 0.9 )
					f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
				end
				
				f8_arg0:beginAnimation( 200, Enum[@"hash_1F50FFF429AB1890"][@"hash_66F6186B702830BC"] )
				f8_arg0:setAlpha( 0.9 )
				f8_arg0:setScale( 0.8, 0.8 )
				f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
			end
			
			f7_arg0.Tier:beginAnimation( 100 )
			f7_arg0.Tier:setAlpha( 0 )
			f7_arg0.Tier:setScale( 5, 5 )
			f7_arg0.Tier:registerEventHandler( "interrupted_keyframe", f7_arg0.clipInterrupted )
			f7_arg0.Tier:registerEventHandler( "transition_complete_keyframe", f7_local0 )
			local f7_local1 = function ( f12_arg0 )
				local f12_local0 = function ( f13_arg0 )
					f13_arg0:beginAnimation( 350, Enum[@"hash_1F50FFF429AB1890"][@"hash_66F6186B702830BC"] )
					f13_arg0:setAlpha( 0 )
					f13_arg0:setScale( 4, 2 )
					f13_arg0:registerEventHandler( "transition_complete_keyframe", f7_arg0.clipFinished )
				end
				
				f12_arg0:beginAnimation( 50, Enum[@"hash_1F50FFF429AB1890"][@"hash_66F6186B702830BC"] )
				f12_arg0:setAlpha( 0.5 )
				f12_arg0:setScale( 1.38, 1.12 )
				f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
			end
			
			f7_arg0.TierGlow:beginAnimation( 350 )
			f7_arg0.TierGlow:setAlpha( 0 )
			f7_arg0.TierGlow:setScale( 1, 1 )
			f7_arg0.TierGlow:registerEventHandler( "interrupted_keyframe", f7_arg0.clipInterrupted )
			f7_arg0.TierGlow:registerEventHandler( "transition_complete_keyframe", f7_local1 )
			f7_arg0.nextClip = "DefaultClip"
		end
	},
	Laboratory = {
		DefaultClip = function ( f14_arg0, f14_arg1 )
			f14_arg0:__resetProperties()
			f14_arg0:setupElementClipCounter( 4 )
			f14_arg0.Spinner:completeAnimation()
			f14_arg0.Spinner:setAlpha( 0 )
			f14_arg0.clipFinished( f14_arg0.Spinner )
			f14_arg0.NPEmpty:completeAnimation()
			f14_arg0.NPEmpty:setAlpha( 1 )
			f14_arg0.clipFinished( f14_arg0.NPEmpty )
			local f14_local0 = function ( f15_arg0 )
				local f15_local0 = function ( f16_arg0 )
					local f16_local0 = function ( f17_arg0 )
						local f17_local0 = function ( f18_arg0 )
							f18_arg0:beginAnimation( 799 )
							f18_arg0:setAlpha( 0 )
							f18_arg0:registerEventHandler( "transition_complete_keyframe", f14_arg0.clipFinished )
						end
						
						f17_arg0:beginAnimation( 250 )
						f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
					end
					
					f16_arg0:beginAnimation( 49 )
					f16_arg0:setAlpha( 1 )
					f16_arg0:setScale( 1, 1 )
					f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
				end
				
				f15_arg0:beginAnimation( 200 )
				f15_arg0:setAlpha( 0.8 )
				f15_arg0:setScale( 0.8, 0.8 )
				f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
			end
			
			f14_arg0.NP:beginAnimation( 100 )
			f14_arg0.NP:setAlpha( 0 )
			f14_arg0.NP:setScale( 5, 5 )
			f14_arg0.NP:registerEventHandler( "interrupted_keyframe", f14_arg0.clipInterrupted )
			f14_arg0.NP:registerEventHandler( "transition_complete_keyframe", f14_local0 )
			local f14_local1 = function ( f19_arg0 )
				local f19_local0 = function ( f20_arg0 )
					f20_arg0:beginAnimation( 350 )
					f20_arg0:setAlpha( 0 )
					f20_arg0:setScale( 4, 2 )
					f20_arg0:registerEventHandler( "transition_complete_keyframe", f14_arg0.clipFinished )
				end
				
				f19_arg0:beginAnimation( 50 )
				f19_arg0:setAlpha( 0.5 )
				f19_arg0:setScale( 1.38, 1.12 )
				f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
			end
			
			f14_arg0.NPGlow:beginAnimation( 350 )
			f14_arg0.NPGlow:setAlpha( 0 )
			f14_arg0.NPGlow:setScale( 1, 1 )
			f14_arg0.NPGlow:registerEventHandler( "interrupted_keyframe", f14_arg0.clipInterrupted )
			f14_arg0.NPGlow:registerEventHandler( "transition_complete_keyframe", f14_local1 )
			f14_arg0.nextClip = "DefaultClip"
		end
	}
}

-- Buttons
CoD.DirectorSelectTextTab = InheritFrom( LUI.UIElement )
CoD.DirectorSelectTextTab.__defaultWidth = 234
CoD.DirectorSelectTextTab.__defaultHeight = 34
CoD.DirectorSelectTextTab.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.DirectorSelectTextTab )
	self.id = "DirectorSelectTextTab"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local ZMTabBackingGlowRed = LUI.UIImage.new( 0, 1, -111, 111, 0, 1, -111, 111 )
	ZMTabBackingGlowRed:setAlpha( 0 )
	ZMTabBackingGlowRed:setImage( RegisterImage( @"hash_64E64BF345836DCC" ) )
	ZMTabBackingGlowRed:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_31CC85D0A86303B0" ) )
	ZMTabBackingGlowRed:setShaderVector( 0, 1.36, 0, 0, 0 )
	self:addElement( ZMTabBackingGlowRed )
	self.ZMTabBackingGlowRed = ZMTabBackingGlowRed
	
	local ZMTabBackingRed = LUI.UIImage.new( 0, 1, -67, 67, 0, 1, -32, 32 )
	ZMTabBackingRed:setAlpha( 0 )
	ZMTabBackingRed:setImage( RegisterImage( @"hash_74188F6C6CDE87B1" ) )
	ZMTabBackingRed:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_31CC85D0A86303B0" ) )
	ZMTabBackingRed:setShaderVector( 0, 0.9, 0, 0, 0 )
	self:addElement( ZMTabBackingRed )
	self.ZMTabBackingRed = ZMTabBackingRed
	
	local ZMBacker = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	ZMBacker:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	ZMBacker:setAlpha( 0 )
	self:addElement( ZMBacker )
	self.ZMBacker = ZMBacker
	
	local ZMTextFocus = LUI.UIText.new( 0, 1, 0, 0, 0.5, 0.5, -10, 10 )
	ZMTextFocus:setRGB( 0.03, 0.03, 0.03 )
	ZMTextFocus:setAlpha( 0 )
	ZMTextFocus:setTTF( "notosans_regular" )
	ZMTextFocus:setLetterSpacing( 3 )
	ZMTextFocus:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_1FEEB12BCB0D7041"] )
	ZMTextFocus:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_E821F0ECFF8D1C7"] )
	ZMTextFocus:linkToElementModel( self, "name", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			ZMTextFocus:setText( Engine[@"hash_4F9F1239CFD921FE"]( f2_local0 ) )
		end
	end )
	self:addElement( ZMTextFocus )
	self.ZMTextFocus = ZMTextFocus
	
	local ZMText = LUI.UIText.new( 0, 1, 0, 0, 0.5, 0.5, -9, 9 )
	ZMText:setRGB( ColorSet.T8__BEIGE__HEADER.r, ColorSet.T8__BEIGE__HEADER.g, ColorSet.T8__BEIGE__HEADER.b )
	ZMText:setAlpha( 0 )
	ZMText:setTTF( "notosans_regular" )
	ZMText:setLetterSpacing( 3 )
	ZMText:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_1FEEB12BCB0D7041"] )
	ZMText:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_3F41D595A2B0EDF3"] )
	ZMText:linkToElementModel( self, "name", true, function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			ZMText:setText( LocalizeToUpperString( f3_local0 ) )
		end
	end )
	self:addElement( ZMText )
	self.ZMText = ZMText
	
	local ZMTabEndRight = LUI.UIImage.new( 1, 1, -8, 0, 0, 0, 0, 35 )
	ZMTabEndRight:setAlpha( 0 )
	ZMTabEndRight:setImage( RegisterImage( @"hash_1B48CD982934DAD0" ) )
	self:addElement( ZMTabEndRight )
	self.ZMTabEndRight = ZMTabEndRight
	
	local ZMTabEndLeft = LUI.UIImage.new( 0, 0, 0, 8, 0, 0, 0, 35 )
	ZMTabEndLeft:setAlpha( 0 )
	ZMTabEndLeft:setImage( RegisterImage( @"hash_709A262142D19A9F" ) )
	self:addElement( ZMTabEndLeft )
	self.ZMTabEndLeft = ZMTabEndLeft
	
	local TabBackingGlow = LUI.UIImage.new( 0, 1, -117, 117, 0, 1, -111, 111 )
	TabBackingGlow:setAlpha( 0 )
	TabBackingGlow:setImage( RegisterImage( @"hash_1223AD1B40A93955" ) )
	TabBackingGlow:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_31CC85D0A86303B0" ) )
	TabBackingGlow:setShaderVector( 0, 1.36, 0, 0, 0 )
	self:addElement( TabBackingGlow )
	self.TabBackingGlow = TabBackingGlow
	
	local TabBacking = LUI.UIImage.new( 0, 1, -66, 66, 0, 1, -30, 30 )
	TabBacking:setAlpha( 0 )
	TabBacking:setImage( RegisterImage( @"hash_53F09D20CA138B49" ) )
	TabBacking:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_31CC85D0A86303B0" ) )
	TabBacking:setShaderVector( 0, 0.9, 0, 0, 0 )
	self:addElement( TabBacking )
	self.TabBacking = TabBacking
	
	local TabTitle = LUI.UIText.new( 0, 1, 11, -9, 0.5, 0.5, -10.5, 10.5 )
	TabTitle:setRGB( 0.66, 0.63, 0.52 )
	TabTitle:setAlpha( 0 )
	TabTitle:setTTF( "ttmussels_regular" )
	TabTitle:setLetterSpacing( 3 )
	TabTitle:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_1FEEB12BCB0D7041"] )
	TabTitle:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_E821F0ECFF8D1C7"] )
	TabTitle:linkToElementModel( self, "name", true, function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			TabTitle:setText( LocalizeToUpperString( f4_local0 ) )
		end
	end )
	self:addElement( TabTitle )
	self.TabTitle = TabTitle
	
	local TabTitleFocus = LUI.UIText.new( 0, 1, 16, -14, 0.5, 0.5, -10.5, 10.5 )
	TabTitleFocus:setRGB( 0, 0, 0 )
	TabTitleFocus:setAlpha( 0 )
	TabTitleFocus:setTTF( "ttmussels_demibold" )
	TabTitleFocus:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_171E049B161CD00A" ) )
	TabTitleFocus:setLetterSpacing( 3 )
	TabTitleFocus:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_1FEEB12BCB0D7041"] )
	TabTitleFocus:setAlignment( Enum[@"hash_67A5123B654282D2"][@"hash_E821F0ECFF8D1C7"] )
	TabTitleFocus:setBackingType( 2 )
	TabTitleFocus:setBackingColor( 0.8, 0.32, 0.08 )
	TabTitleFocus:setBackingAlpha( 0 )
	TabTitleFocus:setBackingXPadding( 50 )
	TabTitleFocus:setBackingYPadding( 7 )
	TabTitleFocus:setBackingImage( RegisterImage( @"hash_6FB5B66CB2DD078F" ) )
	TabTitleFocus:setBackingMaterial( LUI.UIImage.GetCachedMaterial( @"hash_31CC85D0A86303B0" ) )
	TabTitleFocus:setBackingShaderVector( 0, 1.5, 0, 0, 0 )
	TabTitleFocus:linkToElementModel( self, "name", true, function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			TabTitleFocus:setText( LocalizeToUpperString( f5_local0 ) )
		end
	end )
	self:addElement( TabTitleFocus )
	self.TabTitleFocus = TabTitleFocus
	
	local TabEndLeft = LUI.UIImage.new( 0, 0, 9, 17, 0, 0, 0, 35 )
	TabEndLeft:setAlpha( 0 )
	TabEndLeft:setImage( RegisterImage( @"hash_709A262142D19A9F" ) )
	self:addElement( TabEndLeft )
	self.TabEndLeft = TabEndLeft
	
	local TabEndRight = LUI.UIImage.new( 0, 0, 217, 225, 0, 0, 0, 35 )
	TabEndRight:setAlpha( 0 )
	TabEndRight:setImage( RegisterImage( @"hash_1B48CD982934DAD0" ) )
	self:addElement( TabEndRight )
	self.TabEndRight = TabEndRight
	
	local newIcon = CoD.NewBreadcrumbCount.new( f1_arg0, f1_arg1, 0, 0, 203, 221, 0.5, 0.5, -26, -8 )
	newIcon:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueGreaterThan( element, f1_arg1, "breadcrumbCount", 0 )
			end
		}
	} )
	newIcon:linkToElementModel( newIcon, "breadcrumbCount", true, function ( model )
		f1_arg0:updateElementState( newIcon, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "breadcrumbCount"
		} )
	end )
	newIcon:linkToElementModel( self, "breadcrumb", true, function ( model )
		local f8_local0 = model:get()
		if f8_local0 ~= nil then
			newIcon:setModel( f8_local0, f1_arg1 )
		end
	end )
	self:addElement( newIcon )
	self.newIcon = newIcon
	
	self:mergeStateConditions( {
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return not CoD.ModelUtility.IsSelfModelValueNilOrTrue( self, f1_arg1, "available" )
			end
		},
		{
			stateName = "ZombiesPC",
			condition = function ( menu, element, event )
				return IsPC() and IsZombies()
			end
		},
		{
			stateName = "DefaultPC",
			condition = function ( menu, element, event )
				return IsPC()
			end
		},
		{
			stateName = "Zombies",
			condition = function ( menu, element, event )
				return IsZombies()
			end
		}
	} )
	self:linkToElementModel( self, "available", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "available"
		} )
	end )
	local f1_local15 = self
	local f1_local16 = self.subscribeToModel
	local f1_local17 = Engine[@"hash_78DF2E5447F384B9"]()
	f1_local16( f1_local15, f1_local17["lobbyRoot.lobbyNav"], function ( f14_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f14_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	RushPrintInfo("Called", "Director Select Text Tab")
	self:setRGB(1, 0, 0)

	return self
end

CoD.DirectorSelectTextTab.__resetProperties = function ( f15_arg0 )
	f15_arg0.TabTitleFocus:completeAnimation()
	f15_arg0.TabTitle:completeAnimation()
	f15_arg0.TabBackingGlow:completeAnimation()
	f15_arg0.TabEndLeft:completeAnimation()
	f15_arg0.TabEndRight:completeAnimation()
	f15_arg0.TabBacking:completeAnimation()
	f15_arg0.ZMText:completeAnimation()
	f15_arg0.ZMTabEndRight:completeAnimation()
	f15_arg0.ZMTabBackingRed:completeAnimation()
	f15_arg0.ZMTabBackingGlowRed:completeAnimation()
	f15_arg0.ZMTabEndLeft:completeAnimation()
	f15_arg0.ZMTextFocus:completeAnimation()
	f15_arg0.TabTitleFocus:setLeftRight( 0, 1, 16, -14 )
	f15_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10.5, 10.5 )
	f15_arg0.TabTitleFocus:setRGB( 0, 0, 0 )
	f15_arg0.TabTitleFocus:setAlpha( 0 )
	f15_arg0.TabTitleFocus:setScale( 1, 1 )
	f15_arg0.TabTitleFocus:setBackingAlpha( 0 )
	f15_arg0.TabTitleFocus:setBackingXPadding( 50 )
	f15_arg0.TabTitle:setTopBottom( 0.5, 0.5, -10.5, 10.5 )
	f15_arg0.TabTitle:setRGB( 0.66, 0.63, 0.52 )
	f15_arg0.TabTitle:setAlpha( 0 )
	f15_arg0.TabBackingGlow:setAlpha( 0 )
	f15_arg0.TabEndLeft:setLeftRight( 0, 0, 9, 17 )
	f15_arg0.TabEndLeft:setAlpha( 0 )
	f15_arg0.TabEndRight:setLeftRight( 0, 0, 217, 225 )
	f15_arg0.TabEndRight:setAlpha( 0 )
	f15_arg0.TabBacking:setAlpha( 0 )
	f15_arg0.TabBacking:setShaderVector( 0, 0.9, 0, 0, 0 )
	f15_arg0.ZMText:setAlpha( 0 )
	f15_arg0.ZMTabEndRight:setLeftRight( 1, 1, -8, 0 )
	f15_arg0.ZMTabEndRight:setAlpha( 0 )
	f15_arg0.ZMTabBackingRed:setAlpha( 0 )
	f15_arg0.ZMTabBackingRed:setShaderVector( 0, 0.9, 0, 0, 0 )
	f15_arg0.ZMTabBackingGlowRed:setAlpha( 0 )
	f15_arg0.ZMTabEndLeft:setLeftRight( 0, 0, 0, 8 )
	f15_arg0.ZMTabEndLeft:setAlpha( 0 )
	f15_arg0.ZMTextFocus:setAlpha( 0 )
end

CoD.DirectorSelectTextTab.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties()
			f16_arg0:setupElementClipCounter( 2 )
			f16_arg0.TabTitle:completeAnimation()
			f16_arg0.TabTitle:setRGB( 0.66, 0.63, 0.52 )
			f16_arg0.TabTitle:setAlpha( 1 )
			f16_arg0.clipFinished( f16_arg0.TabTitle )
			f16_arg0.TabTitleFocus:completeAnimation()
			f16_arg0.TabTitleFocus:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.TabTitleFocus )
		end,
		Active = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties()
			f17_arg0:setupElementClipCounter( 6 )
			local f17_local0 = function ( f18_arg0 )
				f17_arg0.TabBackingGlow:beginAnimation( 200 )
				f17_arg0.TabBackingGlow:setAlpha( 0.95 )
				f17_arg0.TabBackingGlow:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.TabBackingGlow:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
			end
			
			f17_arg0.TabBackingGlow:completeAnimation()
			f17_arg0.TabBackingGlow:setAlpha( 0 )
			f17_local0( f17_arg0.TabBackingGlow )
			local f17_local1 = function ( f19_arg0 )
				local f19_local0 = function ( f20_arg0 )
					f20_arg0:beginAnimation( 49 )
					f20_arg0:setAlpha( 0.5 )
					f20_arg0:setShaderVector( 0, 1, 0, 0, 0 )
					f20_arg0:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
				end
				
				f19_arg0:beginAnimation( 50 )
				f19_arg0:setAlpha( 0.25 )
				f19_arg0:setShaderVector( 0, 2, 0, 0, 0 )
				f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
			end
			
			f17_arg0.TabBacking:beginAnimation( 100 )
			f17_arg0.TabBacking:setAlpha( 0 )
			f17_arg0.TabBacking:setShaderVector( 0, 1, 0, 0, 0 )
			f17_arg0.TabBacking:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
			f17_arg0.TabBacking:registerEventHandler( "transition_complete_keyframe", f17_local1 )
			local f17_local2 = function ( f21_arg0 )
				f17_arg0.TabTitle:beginAnimation( 100 )
				f17_arg0.TabTitle:setAlpha( 0 )
				f17_arg0.TabTitle:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.TabTitle:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
			end
			
			f17_arg0.TabTitle:completeAnimation()
			f17_arg0.TabTitle:setAlpha( 1 )
			f17_local2( f17_arg0.TabTitle )
			local f17_local3 = function ( f22_arg0 )
				f17_arg0.TabTitleFocus:beginAnimation( 100 )
				f17_arg0.TabTitleFocus:setAlpha( 1 )
				f17_arg0.TabTitleFocus:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.TabTitleFocus:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
			end
			
			f17_arg0.TabTitleFocus:completeAnimation()
			f17_arg0.TabTitleFocus:setAlpha( 0 )
			f17_local3( f17_arg0.TabTitleFocus )
			local f17_local4 = function ( f23_arg0 )
				local f23_local0 = function ( f24_arg0 )
					f24_arg0:beginAnimation( 40 )
					f24_arg0:setLeftRight( 0, 0, 1, 9 )
					f24_arg0:setAlpha( 1 )
					f24_arg0:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
				end
				
				f17_arg0.TabEndLeft:beginAnimation( 160 )
				f17_arg0.TabEndLeft:setLeftRight( 0, 0, -2, 6 )
				f17_arg0.TabEndLeft:setAlpha( 0.8 )
				f17_arg0.TabEndLeft:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.TabEndLeft:registerEventHandler( "transition_complete_keyframe", f23_local0 )
			end
			
			f17_arg0.TabEndLeft:completeAnimation()
			f17_arg0.TabEndLeft:setLeftRight( 0, 0, 17, 25 )
			f17_arg0.TabEndLeft:setAlpha( 0 )
			f17_local4( f17_arg0.TabEndLeft )
			local f17_local5 = function ( f25_arg0 )
				local f25_local0 = function ( f26_arg0 )
					f26_arg0:beginAnimation( 40 )
					f26_arg0:setLeftRight( 0, 0, 225, 233 )
					f26_arg0:setAlpha( 1 )
					f26_arg0:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
				end
				
				f17_arg0.TabEndRight:beginAnimation( 160 )
				f17_arg0.TabEndRight:setLeftRight( 0, 0, 228, 236 )
				f17_arg0.TabEndRight:setAlpha( 0.8 )
				f17_arg0.TabEndRight:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.TabEndRight:registerEventHandler( "transition_complete_keyframe", f25_local0 )
			end
			
			f17_arg0.TabEndRight:completeAnimation()
			f17_arg0.TabEndRight:setLeftRight( 0, 0, 210, 218 )
			f17_arg0.TabEndRight:setAlpha( 0 )
			f17_local5( f17_arg0.TabEndRight )
		end
	},
	Unavailable = {
		DefaultClip = function ( f27_arg0, f27_arg1 )
			f27_arg0:__resetProperties()
			f27_arg0:setupElementClipCounter( 1 )
			f27_arg0.TabTitle:completeAnimation()
			f27_arg0.TabTitle:setRGB( 0.23, 0.23, 0.23 )
			f27_arg0.TabTitle:setAlpha( 1 )
			f27_arg0.clipFinished( f27_arg0.TabTitle )
		end
	},
	ZombiesPC = {
		DefaultClip = function ( f28_arg0, f28_arg1 )
			f28_arg0:__resetProperties()
			f28_arg0:setupElementClipCounter( 3 )
			f28_arg0.ZMText:completeAnimation()
			f28_arg0.ZMText:setAlpha( 0 )
			f28_arg0.clipFinished( f28_arg0.ZMText )
			f28_arg0.TabTitle:completeAnimation()
			f28_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f28_arg0.TabTitle:setRGB( 0.92, 0.89, 0.72 )
			f28_arg0.TabTitle:setAlpha( 1 )
			f28_arg0.clipFinished( f28_arg0.TabTitle )
			f28_arg0.TabTitleFocus:completeAnimation()
			f28_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f28_arg0.clipFinished( f28_arg0.TabTitleFocus )
		end,
		Focus = function ( f29_arg0, f29_arg1 )
			f29_arg0:__resetProperties()
			f29_arg0:setupElementClipCounter( 4 )
			f29_arg0.TabTitle:completeAnimation()
			f29_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f29_arg0.TabTitle:setRGB( 0.66, 0.63, 0.52 )
			f29_arg0.TabTitle:setAlpha( 0 )
			f29_arg0.clipFinished( f29_arg0.TabTitle )
			f29_arg0.TabTitleFocus:completeAnimation()
			f29_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f29_arg0.TabTitleFocus:setRGB( 1, 0.31, 0.26 )
			f29_arg0.TabTitleFocus:setAlpha( 1 )
			f29_arg0.TabTitleFocus:setBackingAlpha( 0.15 )
			f29_arg0.clipFinished( f29_arg0.TabTitleFocus )
			f29_arg0.TabEndLeft:completeAnimation()
			f29_arg0.TabEndLeft:setLeftRight( 0, 0, 10, 18 )
			f29_arg0.TabEndLeft:setAlpha( 1 )
			f29_arg0.clipFinished( f29_arg0.TabEndLeft )
			f29_arg0.TabEndRight:completeAnimation()
			f29_arg0.TabEndRight:setLeftRight( 0, 0, 216, 224 )
			f29_arg0.TabEndRight:setAlpha( 1 )
			f29_arg0.clipFinished( f29_arg0.TabEndRight )
		end,
		GainFocus = function ( f30_arg0, f30_arg1 )
			f30_arg0:__resetProperties()
			f30_arg0:setupElementClipCounter( 4 )
			local f30_local0 = function ( f31_arg0 )
				f30_arg0.TabTitle:beginAnimation( 20 )
				f30_arg0.TabTitle:setAlpha( 0 )
				f30_arg0.TabTitle:registerEventHandler( "interrupted_keyframe", f30_arg0.clipInterrupted )
				f30_arg0.TabTitle:registerEventHandler( "transition_complete_keyframe", f30_arg0.clipFinished )
			end
			
			f30_arg0.TabTitle:completeAnimation()
			f30_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f30_arg0.TabTitle:setRGB( 0.66, 0.63, 0.52 )
			f30_arg0.TabTitle:setAlpha( 1 )
			f30_local0( f30_arg0.TabTitle )
			local f30_local1 = function ( f32_arg0 )
				local f32_local0 = function ( f33_arg0 )
					local f33_local0 = function ( f34_arg0 )
						f34_arg0:beginAnimation( 60 )
						f34_arg0:setBackingAlpha( 0.15 )
						f34_arg0:setBackingXPadding( 50 )
						f34_arg0:registerEventHandler( "transition_complete_keyframe", f30_arg0.clipFinished )
					end
					
					f33_arg0:beginAnimation( 60 )
					f33_arg0:setRGB( 1, 0.31, 0.26 )
					f33_arg0:setScale( 1, 1 )
					f33_arg0:setBackingAlpha( 0.11 )
					f33_arg0:setBackingXPadding( 44.78 )
					f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
				end
				
				f30_arg0.TabTitleFocus:beginAnimation( 110 )
				f30_arg0.TabTitleFocus:setRGB( 0.88, 0.43, 0.35 )
				f30_arg0.TabTitleFocus:setAlpha( 1 )
				f30_arg0.TabTitleFocus:setScale( 0.96, 0.96 )
				f30_arg0.TabTitleFocus:setBackingAlpha( 0.07 )
				f30_arg0.TabTitleFocus:setBackingXPadding( 39.57 )
				f30_arg0.TabTitleFocus:registerEventHandler( "interrupted_keyframe", f30_arg0.clipInterrupted )
				f30_arg0.TabTitleFocus:registerEventHandler( "transition_complete_keyframe", f32_local0 )
			end
			
			f30_arg0.TabTitleFocus:completeAnimation()
			f30_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f30_arg0.TabTitleFocus:setRGB( 0.66, 0.63, 0.52 )
			f30_arg0.TabTitleFocus:setAlpha( 0 )
			f30_arg0.TabTitleFocus:setScale( 0.88, 0.88 )
			f30_arg0.TabTitleFocus:setBackingAlpha( 0 )
			f30_arg0.TabTitleFocus:setBackingXPadding( 30 )
			f30_local1( f30_arg0.TabTitleFocus )
			local f30_local2 = function ( f35_arg0 )
				local f35_local0 = function ( f36_arg0 )
					f36_arg0:beginAnimation( 120 )
					f36_arg0:setLeftRight( 0, 0, 10, 18 )
					f36_arg0:setAlpha( 1 )
					f36_arg0:registerEventHandler( "transition_complete_keyframe", f30_arg0.clipFinished )
				end
				
				f30_arg0.TabEndLeft:beginAnimation( 50 )
				f30_arg0.TabEndLeft:setLeftRight( 0, 0, -20, -12 )
				f30_arg0.TabEndLeft:setAlpha( 0.29 )
				f30_arg0.TabEndLeft:registerEventHandler( "interrupted_keyframe", f30_arg0.clipInterrupted )
				f30_arg0.TabEndLeft:registerEventHandler( "transition_complete_keyframe", f35_local0 )
			end
			
			f30_arg0.TabEndLeft:completeAnimation()
			f30_arg0.TabEndLeft:setLeftRight( 0, 0, 0, 8 )
			f30_arg0.TabEndLeft:setAlpha( 0 )
			f30_local2( f30_arg0.TabEndLeft )
			local f30_local3 = function ( f37_arg0 )
				local f37_local0 = function ( f38_arg0 )
					f38_arg0:beginAnimation( 120 )
					f38_arg0:setLeftRight( 0, 0, 216, 224 )
					f38_arg0:setAlpha( 1 )
					f38_arg0:registerEventHandler( "transition_complete_keyframe", f30_arg0.clipFinished )
				end
				
				f30_arg0.TabEndRight:beginAnimation( 50 )
				f30_arg0.TabEndRight:setLeftRight( 0, 0, 246, 254 )
				f30_arg0.TabEndRight:setAlpha( 0.29 )
				f30_arg0.TabEndRight:registerEventHandler( "interrupted_keyframe", f30_arg0.clipInterrupted )
				f30_arg0.TabEndRight:registerEventHandler( "transition_complete_keyframe", f37_local0 )
			end
			
			f30_arg0.TabEndRight:completeAnimation()
			f30_arg0.TabEndRight:setLeftRight( 0, 0, 217, 225 )
			f30_arg0.TabEndRight:setAlpha( 0 )
			f30_local3( f30_arg0.TabEndRight )
		end,
		LoseFocus = function ( f39_arg0, f39_arg1 )
			f39_arg0:__resetProperties()
			f39_arg0:setupElementClipCounter( 4 )
			local f39_local0 = function ( f40_arg0 )
				f39_arg0.TabTitle:beginAnimation( 30 )
				f39_arg0.TabTitle:setAlpha( 1 )
				f39_arg0.TabTitle:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.TabTitle:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.TabTitle:completeAnimation()
			f39_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f39_arg0.TabTitle:setRGB( 0.66, 0.63, 0.52 )
			f39_arg0.TabTitle:setAlpha( 0 )
			f39_local0( f39_arg0.TabTitle )
			local f39_local1 = function ( f41_arg0 )
				f39_arg0.TabTitleFocus:beginAnimation( 30 )
				f39_arg0.TabTitleFocus:setAlpha( 0 )
				f39_arg0.TabTitleFocus:setScale( 0.88, 0.88 )
				f39_arg0.TabTitleFocus:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.TabTitleFocus:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.TabTitleFocus:completeAnimation()
			f39_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f39_arg0.TabTitleFocus:setRGB( 1, 0.31, 0.26 )
			f39_arg0.TabTitleFocus:setAlpha( 1 )
			f39_arg0.TabTitleFocus:setScale( 1, 1 )
			f39_arg0.TabTitleFocus:setBackingAlpha( 0.15 )
			f39_local1( f39_arg0.TabTitleFocus )
			local f39_local2 = function ( f42_arg0 )
				f39_arg0.TabEndLeft:beginAnimation( 170 )
				f39_arg0.TabEndLeft:setLeftRight( 0, 0, -20, -12 )
				f39_arg0.TabEndLeft:setAlpha( 0 )
				f39_arg0.TabEndLeft:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.TabEndLeft:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.TabEndLeft:completeAnimation()
			f39_arg0.TabEndLeft:setLeftRight( 0, 0, 10, 18 )
			f39_arg0.TabEndLeft:setAlpha( 1 )
			f39_local2( f39_arg0.TabEndLeft )
			local f39_local3 = function ( f43_arg0 )
				f39_arg0.TabEndRight:beginAnimation( 170 )
				f39_arg0.TabEndRight:setLeftRight( 0, 0, 246, 254 )
				f39_arg0.TabEndRight:setAlpha( 0 )
				f39_arg0.TabEndRight:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.TabEndRight:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.TabEndRight:completeAnimation()
			f39_arg0.TabEndRight:setLeftRight( 0, 0, 216, 224 )
			f39_arg0.TabEndRight:setAlpha( 1 )
			f39_local3( f39_arg0.TabEndRight )
		end,
		Active = function ( f44_arg0, f44_arg1 )
			f44_arg0:__resetProperties()
			f44_arg0:setupElementClipCounter( 6 )
			local f44_local0 = function ( f45_arg0 )
				local f45_local0 = function ( f46_arg0 )
					f46_arg0:beginAnimation( 2500 )
					f46_arg0:setAlpha( 1 )
					f46_arg0:registerEventHandler( "transition_complete_keyframe", f44_arg0.clipFinished )
				end
				
				f44_arg0.ZMTabBackingGlowRed:beginAnimation( 2500 )
				f44_arg0.ZMTabBackingGlowRed:setAlpha( 0.5 )
				f44_arg0.ZMTabBackingGlowRed:registerEventHandler( "interrupted_keyframe", f44_arg0.clipInterrupted )
				f44_arg0.ZMTabBackingGlowRed:registerEventHandler( "transition_complete_keyframe", f45_local0 )
			end
			
			f44_arg0.ZMTabBackingGlowRed:completeAnimation()
			f44_arg0.ZMTabBackingGlowRed:setAlpha( 1 )
			f44_local0( f44_arg0.ZMTabBackingGlowRed )
			f44_arg0.ZMTabBackingRed:completeAnimation()
			f44_arg0.ZMTabBackingRed:setAlpha( 0.5 )
			f44_arg0.ZMTabBackingRed:setShaderVector( 0, 0.9, 0, 0, 0 )
			f44_arg0.clipFinished( f44_arg0.ZMTabBackingRed )
			f44_arg0.ZMTabEndRight:completeAnimation()
			f44_arg0.ZMTabEndRight:setLeftRight( 1, 1, -9, -1 )
			f44_arg0.ZMTabEndRight:setAlpha( 1 )
			f44_arg0.clipFinished( f44_arg0.ZMTabEndRight )
			f44_arg0.ZMTabEndLeft:completeAnimation()
			f44_arg0.ZMTabEndLeft:setLeftRight( 0, 0, 1, 9 )
			f44_arg0.ZMTabEndLeft:setAlpha( 1 )
			f44_arg0.clipFinished( f44_arg0.ZMTabEndLeft )
			f44_arg0.TabTitle:completeAnimation()
			f44_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f44_arg0.TabTitle:setAlpha( 0 )
			f44_arg0.clipFinished( f44_arg0.TabTitle )
			f44_arg0.TabTitleFocus:completeAnimation()
			f44_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f44_arg0.TabTitleFocus:setAlpha( 1 )
			f44_arg0.clipFinished( f44_arg0.TabTitleFocus )
			f44_arg0.nextClip = "Active"
		end,
		GainActive = function ( f47_arg0, f47_arg1 )
			f47_arg0:__resetProperties()
			f47_arg0:setupElementClipCounter( 7 )
			local f47_local0 = function ( f48_arg0 )
				f47_arg0.ZMTabBackingGlowRed:beginAnimation( 200 )
				f47_arg0.ZMTabBackingGlowRed:setAlpha( 1 )
				f47_arg0.ZMTabBackingGlowRed:registerEventHandler( "interrupted_keyframe", f47_arg0.clipInterrupted )
				f47_arg0.ZMTabBackingGlowRed:registerEventHandler( "transition_complete_keyframe", f47_arg0.clipFinished )
			end
			
			f47_arg0.ZMTabBackingGlowRed:completeAnimation()
			f47_arg0.ZMTabBackingGlowRed:setAlpha( 0 )
			f47_local0( f47_arg0.ZMTabBackingGlowRed )
			local f47_local1 = function ( f49_arg0 )
				local f49_local0 = function ( f50_arg0 )
					local f50_local0 = function ( f51_arg0 )
						f51_arg0:beginAnimation( 49 )
						f51_arg0:setAlpha( 0.5 )
						f51_arg0:setShaderVector( 0, 0.9, 0, 0, 0 )
						f51_arg0:registerEventHandler( "transition_complete_keyframe", f47_arg0.clipFinished )
					end
					
					f50_arg0:beginAnimation( 50 )
					f50_arg0:setAlpha( 0.25 )
					f50_arg0:setShaderVector( 0, 2, 0, 0, 0 )
					f50_arg0:registerEventHandler( "transition_complete_keyframe", f50_local0 )
				end
				
				f47_arg0.ZMTabBackingRed:beginAnimation( 100 )
				f47_arg0.ZMTabBackingRed:registerEventHandler( "interrupted_keyframe", f47_arg0.clipInterrupted )
				f47_arg0.ZMTabBackingRed:registerEventHandler( "transition_complete_keyframe", f49_local0 )
			end
			
			f47_arg0.ZMTabBackingRed:completeAnimation()
			f47_arg0.ZMTabBackingRed:setAlpha( 0 )
			f47_arg0.ZMTabBackingRed:setShaderVector( 0, 0.9, 0, 0, 0 )
			f47_local1( f47_arg0.ZMTabBackingRed )
			f47_arg0.ZMTextFocus:completeAnimation()
			f47_arg0.ZMTextFocus:setAlpha( 0 )
			f47_arg0.clipFinished( f47_arg0.ZMTextFocus )
			local f47_local2 = function ( f52_arg0 )
				local f52_local0 = function ( f53_arg0 )
					f53_arg0:beginAnimation( 40 )
					f53_arg0:setLeftRight( 1, 1, -9, -1 )
					f53_arg0:registerEventHandler( "transition_complete_keyframe", f47_arg0.clipFinished )
				end
				
				f47_arg0.ZMTabEndRight:beginAnimation( 160 )
				f47_arg0.ZMTabEndRight:setLeftRight( 1, 1, -6, 2 )
				f47_arg0.ZMTabEndRight:setAlpha( 1 )
				f47_arg0.ZMTabEndRight:registerEventHandler( "interrupted_keyframe", f47_arg0.clipInterrupted )
				f47_arg0.ZMTabEndRight:registerEventHandler( "transition_complete_keyframe", f52_local0 )
			end
			
			f47_arg0.ZMTabEndRight:completeAnimation()
			f47_arg0.ZMTabEndRight:setLeftRight( 1, 1, -24, -16 )
			f47_arg0.ZMTabEndRight:setAlpha( 0 )
			f47_local2( f47_arg0.ZMTabEndRight )
			local f47_local3 = function ( f54_arg0 )
				local f54_local0 = function ( f55_arg0 )
					f55_arg0:beginAnimation( 40 )
					f55_arg0:setLeftRight( 0, 0, 1, 9 )
					f55_arg0:registerEventHandler( "transition_complete_keyframe", f47_arg0.clipFinished )
				end
				
				f47_arg0.ZMTabEndLeft:beginAnimation( 160 )
				f47_arg0.ZMTabEndLeft:setLeftRight( 0, 0, -2, 6 )
				f47_arg0.ZMTabEndLeft:setAlpha( 1 )
				f47_arg0.ZMTabEndLeft:registerEventHandler( "interrupted_keyframe", f47_arg0.clipInterrupted )
				f47_arg0.ZMTabEndLeft:registerEventHandler( "transition_complete_keyframe", f54_local0 )
			end
			
			f47_arg0.ZMTabEndLeft:completeAnimation()
			f47_arg0.ZMTabEndLeft:setLeftRight( 0, 0, 17, 25 )
			f47_arg0.ZMTabEndLeft:setAlpha( 0 )
			f47_local3( f47_arg0.ZMTabEndLeft )
			local f47_local4 = function ( f56_arg0 )
				f47_arg0.TabTitle:beginAnimation( 20 )
				f47_arg0.TabTitle:setAlpha( 0 )
				f47_arg0.TabTitle:registerEventHandler( "interrupted_keyframe", f47_arg0.clipInterrupted )
				f47_arg0.TabTitle:registerEventHandler( "transition_complete_keyframe", f47_arg0.clipFinished )
			end
			
			f47_arg0.TabTitle:completeAnimation()
			f47_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f47_arg0.TabTitle:setRGB( 0.92, 0.89, 0.72 )
			f47_arg0.TabTitle:setAlpha( 1 )
			f47_local4( f47_arg0.TabTitle )
			local f47_local5 = function ( f57_arg0 )
				f47_arg0.TabTitleFocus:beginAnimation( 100 )
				f47_arg0.TabTitleFocus:setAlpha( 1 )
				f47_arg0.TabTitleFocus:registerEventHandler( "interrupted_keyframe", f47_arg0.clipInterrupted )
				f47_arg0.TabTitleFocus:registerEventHandler( "transition_complete_keyframe", f47_arg0.clipFinished )
			end
			
			f47_arg0.TabTitleFocus:completeAnimation()
			f47_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f47_arg0.TabTitleFocus:setRGB( 0, 0, 0 )
			f47_arg0.TabTitleFocus:setAlpha( 0 )
			f47_local5( f47_arg0.TabTitleFocus )
		end,
		LoseActive = function ( f58_arg0, f58_arg1 )
			f58_arg0:__resetProperties()
			f58_arg0:setupElementClipCounter( 7 )
			local f58_local0 = function ( f59_arg0 )
				f58_arg0.ZMTabBackingGlowRed:beginAnimation( 100 )
				f58_arg0.ZMTabBackingGlowRed:setAlpha( 0 )
				f58_arg0.ZMTabBackingGlowRed:registerEventHandler( "interrupted_keyframe", f58_arg0.clipInterrupted )
				f58_arg0.ZMTabBackingGlowRed:registerEventHandler( "transition_complete_keyframe", f58_arg0.clipFinished )
			end
			
			f58_arg0.ZMTabBackingGlowRed:completeAnimation()
			f58_arg0.ZMTabBackingGlowRed:setAlpha( 1 )
			f58_local0( f58_arg0.ZMTabBackingGlowRed )
			local f58_local1 = function ( f60_arg0 )
				f58_arg0.ZMTabBackingRed:beginAnimation( 100 )
				f58_arg0.ZMTabBackingRed:setAlpha( 0 )
				f58_arg0.ZMTabBackingRed:registerEventHandler( "interrupted_keyframe", f58_arg0.clipInterrupted )
				f58_arg0.ZMTabBackingRed:registerEventHandler( "transition_complete_keyframe", f58_arg0.clipFinished )
			end
			
			f58_arg0.ZMTabBackingRed:completeAnimation()
			f58_arg0.ZMTabBackingRed:setAlpha( 0.5 )
			f58_arg0.ZMTabBackingRed:setShaderVector( 0, 0.9, 0, 0, 0 )
			f58_local1( f58_arg0.ZMTabBackingRed )
			f58_arg0.ZMText:completeAnimation()
			f58_arg0.ZMText:setAlpha( 0 )
			f58_arg0.clipFinished( f58_arg0.ZMText )
			local f58_local2 = function ( f61_arg0 )
				f58_arg0.ZMTabEndRight:beginAnimation( 100 )
				f58_arg0.ZMTabEndRight:setLeftRight( 1, 1, -8, 0 )
				f58_arg0.ZMTabEndRight:setAlpha( 0 )
				f58_arg0.ZMTabEndRight:registerEventHandler( "interrupted_keyframe", f58_arg0.clipInterrupted )
				f58_arg0.ZMTabEndRight:registerEventHandler( "transition_complete_keyframe", f58_arg0.clipFinished )
			end
			
			f58_arg0.ZMTabEndRight:completeAnimation()
			f58_arg0.ZMTabEndRight:setLeftRight( 1, 1, -9, -1 )
			f58_arg0.ZMTabEndRight:setAlpha( 1 )
			f58_local2( f58_arg0.ZMTabEndRight )
			local f58_local3 = function ( f62_arg0 )
				f58_arg0.ZMTabEndLeft:beginAnimation( 100 )
				f58_arg0.ZMTabEndLeft:setLeftRight( 0, 0, 0, 8 )
				f58_arg0.ZMTabEndLeft:setAlpha( 0 )
				f58_arg0.ZMTabEndLeft:registerEventHandler( "interrupted_keyframe", f58_arg0.clipInterrupted )
				f58_arg0.ZMTabEndLeft:registerEventHandler( "transition_complete_keyframe", f58_arg0.clipFinished )
			end
			
			f58_arg0.ZMTabEndLeft:completeAnimation()
			f58_arg0.ZMTabEndLeft:setLeftRight( 0, 0, 1, 9 )
			f58_arg0.ZMTabEndLeft:setAlpha( 1 )
			f58_local3( f58_arg0.ZMTabEndLeft )
			local f58_local4 = function ( f63_arg0 )
				f58_arg0.TabTitle:beginAnimation( 100 )
				f58_arg0.TabTitle:setRGB( 0.92, 0.89, 0.72 )
				f58_arg0.TabTitle:setAlpha( 1 )
				f58_arg0.TabTitle:registerEventHandler( "interrupted_keyframe", f58_arg0.clipInterrupted )
				f58_arg0.TabTitle:registerEventHandler( "transition_complete_keyframe", f58_arg0.clipFinished )
			end
			
			f58_arg0.TabTitle:completeAnimation()
			f58_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f58_arg0.TabTitle:setRGB( 0.66, 0.63, 0.52 )
			f58_arg0.TabTitle:setAlpha( 0 )
			f58_local4( f58_arg0.TabTitle )
			local f58_local5 = function ( f64_arg0 )
				f58_arg0.TabTitleFocus:beginAnimation( 100 )
				f58_arg0.TabTitleFocus:setAlpha( 0 )
				f58_arg0.TabTitleFocus:registerEventHandler( "interrupted_keyframe", f58_arg0.clipInterrupted )
				f58_arg0.TabTitleFocus:registerEventHandler( "transition_complete_keyframe", f58_arg0.clipFinished )
			end
			
			f58_arg0.TabTitleFocus:completeAnimation()
			f58_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f58_arg0.TabTitleFocus:setAlpha( 1 )
			f58_local5( f58_arg0.TabTitleFocus )
		end,
		ActiveAndFocus = function ( f65_arg0, f65_arg1 )
			f65_arg0:__resetProperties()
			f65_arg0:setupElementClipCounter( 6 )
			local f65_local0 = function ( f66_arg0 )
				local f66_local0 = function ( f67_arg0 )
					f67_arg0:beginAnimation( 2500 )
					f67_arg0:setAlpha( 1 )
					f67_arg0:registerEventHandler( "transition_complete_keyframe", f65_arg0.clipFinished )
				end
				
				f65_arg0.ZMTabBackingGlowRed:beginAnimation( 2500 )
				f65_arg0.ZMTabBackingGlowRed:setAlpha( 0.5 )
				f65_arg0.ZMTabBackingGlowRed:registerEventHandler( "interrupted_keyframe", f65_arg0.clipInterrupted )
				f65_arg0.ZMTabBackingGlowRed:registerEventHandler( "transition_complete_keyframe", f66_local0 )
			end
			
			f65_arg0.ZMTabBackingGlowRed:completeAnimation()
			f65_arg0.ZMTabBackingGlowRed:setAlpha( 1 )
			f65_local0( f65_arg0.ZMTabBackingGlowRed )
			f65_arg0.ZMTabBackingRed:completeAnimation()
			f65_arg0.ZMTabBackingRed:setAlpha( 0.9 )
			f65_arg0.ZMTabBackingRed:setShaderVector( 0, 0.9, 0, 0, 0 )
			f65_arg0.clipFinished( f65_arg0.ZMTabBackingRed )
			f65_arg0.ZMTabEndRight:completeAnimation()
			f65_arg0.ZMTabEndRight:setLeftRight( 1, 1, -18, -10 )
			f65_arg0.ZMTabEndRight:setAlpha( 1 )
			f65_arg0.clipFinished( f65_arg0.ZMTabEndRight )
			f65_arg0.ZMTabEndLeft:completeAnimation()
			f65_arg0.ZMTabEndLeft:setLeftRight( 0, 0, 10, 18 )
			f65_arg0.ZMTabEndLeft:setAlpha( 1 )
			f65_arg0.clipFinished( f65_arg0.ZMTabEndLeft )
			f65_arg0.TabTitle:completeAnimation()
			f65_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f65_arg0.TabTitle:setAlpha( 0 )
			f65_arg0.clipFinished( f65_arg0.TabTitle )
			f65_arg0.TabTitleFocus:completeAnimation()
			f65_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f65_arg0.TabTitleFocus:setAlpha( 1 )
			f65_arg0.clipFinished( f65_arg0.TabTitleFocus )
			f65_arg0.nextClip = "ActiveAndFocus"
		end,
		FocusToActiveAndFocus = function ( f68_arg0, f68_arg1 )
			f68_arg0:__resetProperties()
			f68_arg0:setupElementClipCounter( 6 )
			local f68_local0 = function ( f69_arg0 )
				f68_arg0.ZMTabBackingGlowRed:beginAnimation( 200 )
				f68_arg0.ZMTabBackingGlowRed:setAlpha( 1 )
				f68_arg0.ZMTabBackingGlowRed:registerEventHandler( "interrupted_keyframe", f68_arg0.clipInterrupted )
				f68_arg0.ZMTabBackingGlowRed:registerEventHandler( "transition_complete_keyframe", f68_arg0.clipFinished )
			end
			
			f68_arg0.ZMTabBackingGlowRed:completeAnimation()
			f68_arg0.ZMTabBackingGlowRed:setAlpha( 0 )
			f68_local0( f68_arg0.ZMTabBackingGlowRed )
			local f68_local1 = function ( f70_arg0 )
				local f70_local0 = function ( f71_arg0 )
					f71_arg0:beginAnimation( 49 )
					f71_arg0:setAlpha( 0.5 )
					f71_arg0:setShaderVector( 0, 1, 0, 0, 0 )
					f71_arg0:registerEventHandler( "transition_complete_keyframe", f68_arg0.clipFinished )
				end
				
				f70_arg0:beginAnimation( 50 )
				f70_arg0:setAlpha( 0.25 )
				f70_arg0:setShaderVector( 0, 2, 0, 0, 0 )
				f70_arg0:registerEventHandler( "transition_complete_keyframe", f70_local0 )
			end
			
			f68_arg0.ZMTabBackingRed:beginAnimation( 100 )
			f68_arg0.ZMTabBackingRed:setAlpha( 0 )
			f68_arg0.ZMTabBackingRed:setShaderVector( 0, 1, 0, 0, 0 )
			f68_arg0.ZMTabBackingRed:registerEventHandler( "interrupted_keyframe", f68_arg0.clipInterrupted )
			f68_arg0.ZMTabBackingRed:registerEventHandler( "transition_complete_keyframe", f68_local1 )
			local f68_local2 = function ( f72_arg0 )
				local f72_local0 = function ( f73_arg0 )
					local f73_local0 = function ( f74_arg0 )
						f74_arg0:beginAnimation( 30 )
						f74_arg0:setLeftRight( 1, 1, -18, -10 )
						f74_arg0:setAlpha( 1 )
						f74_arg0:registerEventHandler( "transition_complete_keyframe", f68_arg0.clipFinished )
					end
					
					f73_arg0:beginAnimation( 19 )
					f73_arg0:setLeftRight( 1, 1, -3, 5 )
					f73_arg0:setAlpha( 0.8 )
					f73_arg0:registerEventHandler( "transition_complete_keyframe", f73_local0 )
				end
				
				f68_arg0.ZMTabEndRight:beginAnimation( 100 )
				f68_arg0.ZMTabEndRight:setLeftRight( 1, 1, -8, 0 )
				f68_arg0.ZMTabEndRight:setAlpha( 0.67 )
				f68_arg0.ZMTabEndRight:registerEventHandler( "interrupted_keyframe", f68_arg0.clipInterrupted )
				f68_arg0.ZMTabEndRight:registerEventHandler( "transition_complete_keyframe", f72_local0 )
			end
			
			f68_arg0.ZMTabEndRight:completeAnimation()
			f68_arg0.ZMTabEndRight:setLeftRight( 1, 1, -33, -25 )
			f68_arg0.ZMTabEndRight:setAlpha( 0 )
			f68_local2( f68_arg0.ZMTabEndRight )
			local f68_local3 = function ( f75_arg0 )
				local f75_local0 = function ( f76_arg0 )
					local f76_local0 = function ( f77_arg0 )
						f77_arg0:beginAnimation( 30 )
						f77_arg0:setLeftRight( 0, 0, 10, 18 )
						f77_arg0:setAlpha( 1 )
						f77_arg0:registerEventHandler( "transition_complete_keyframe", f68_arg0.clipFinished )
					end
					
					f76_arg0:beginAnimation( 19 )
					f76_arg0:setLeftRight( 0, 0, -5, 3 )
					f76_arg0:setAlpha( 0.8 )
					f76_arg0:registerEventHandler( "transition_complete_keyframe", f76_local0 )
				end
				
				f68_arg0.ZMTabEndLeft:beginAnimation( 100 )
				f68_arg0.ZMTabEndLeft:setLeftRight( 0, 0, 0, 8 )
				f68_arg0.ZMTabEndLeft:setAlpha( 0.67 )
				f68_arg0.ZMTabEndLeft:registerEventHandler( "interrupted_keyframe", f68_arg0.clipInterrupted )
				f68_arg0.ZMTabEndLeft:registerEventHandler( "transition_complete_keyframe", f75_local0 )
			end
			
			f68_arg0.ZMTabEndLeft:completeAnimation()
			f68_arg0.ZMTabEndLeft:setLeftRight( 0, 0, 25, 33 )
			f68_arg0.ZMTabEndLeft:setAlpha( 0 )
			f68_local3( f68_arg0.ZMTabEndLeft )
			local f68_local4 = function ( f78_arg0 )
				f68_arg0.TabTitle:beginAnimation( 20 )
				f68_arg0.TabTitle:setAlpha( 0 )
				f68_arg0.TabTitle:registerEventHandler( "interrupted_keyframe", f68_arg0.clipInterrupted )
				f68_arg0.TabTitle:registerEventHandler( "transition_complete_keyframe", f68_arg0.clipFinished )
			end
			
			f68_arg0.TabTitle:completeAnimation()
			f68_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f68_arg0.TabTitle:setAlpha( 1 )
			f68_local4( f68_arg0.TabTitle )
			local f68_local5 = function ( f79_arg0 )
				f68_arg0.TabTitleFocus:beginAnimation( 120 )
				f68_arg0.TabTitleFocus:setAlpha( 1 )
				f68_arg0.TabTitleFocus:registerEventHandler( "interrupted_keyframe", f68_arg0.clipInterrupted )
				f68_arg0.TabTitleFocus:registerEventHandler( "transition_complete_keyframe", f68_arg0.clipFinished )
			end
			
			f68_arg0.TabTitleFocus:completeAnimation()
			f68_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f68_arg0.TabTitleFocus:setRGB( 0, 0, 0 )
			f68_arg0.TabTitleFocus:setAlpha( 0 )
			f68_local5( f68_arg0.TabTitleFocus )
		end,
		ActiveAndFocusToActive = function ( f80_arg0, f80_arg1 )
			f80_arg0:__resetProperties()
			f80_arg0:setupElementClipCounter( 6 )
			f80_arg0.ZMTabBackingGlowRed:completeAnimation()
			f80_arg0.ZMTabBackingGlowRed:setAlpha( 1 )
			f80_arg0.clipFinished( f80_arg0.ZMTabBackingGlowRed )
			local f80_local0 = function ( f81_arg0 )
				f80_arg0.ZMTabBackingRed:beginAnimation( 200 )
				f80_arg0.ZMTabBackingRed:setAlpha( 0.5 )
				f80_arg0.ZMTabBackingRed:registerEventHandler( "interrupted_keyframe", f80_arg0.clipInterrupted )
				f80_arg0.ZMTabBackingRed:registerEventHandler( "transition_complete_keyframe", f80_arg0.clipFinished )
			end
			
			f80_arg0.ZMTabBackingRed:completeAnimation()
			f80_arg0.ZMTabBackingRed:setAlpha( 0.9 )
			f80_arg0.ZMTabBackingRed:setShaderVector( 0, 0.9, 0, 0, 0 )
			f80_local0( f80_arg0.ZMTabBackingRed )
			local f80_local1 = function ( f82_arg0 )
				f80_arg0.ZMTabEndRight:beginAnimation( 160 )
				f80_arg0.ZMTabEndRight:setLeftRight( 1, 1, -9, -1 )
				f80_arg0.ZMTabEndRight:registerEventHandler( "interrupted_keyframe", f80_arg0.clipInterrupted )
				f80_arg0.ZMTabEndRight:registerEventHandler( "transition_complete_keyframe", f80_arg0.clipFinished )
			end
			
			f80_arg0.ZMTabEndRight:completeAnimation()
			f80_arg0.ZMTabEndRight:setLeftRight( 1, 1, -18, -10 )
			f80_arg0.ZMTabEndRight:setAlpha( 1 )
			f80_local1( f80_arg0.ZMTabEndRight )
			local f80_local2 = function ( f83_arg0 )
				f80_arg0.ZMTabEndLeft:beginAnimation( 160 )
				f80_arg0.ZMTabEndLeft:setLeftRight( 0, 0, 1, 9 )
				f80_arg0.ZMTabEndLeft:registerEventHandler( "interrupted_keyframe", f80_arg0.clipInterrupted )
				f80_arg0.ZMTabEndLeft:registerEventHandler( "transition_complete_keyframe", f80_arg0.clipFinished )
			end
			
			f80_arg0.ZMTabEndLeft:completeAnimation()
			f80_arg0.ZMTabEndLeft:setLeftRight( 0, 0, 10, 18 )
			f80_arg0.ZMTabEndLeft:setAlpha( 1 )
			f80_local2( f80_arg0.ZMTabEndLeft )
			f80_arg0.TabTitle:completeAnimation()
			f80_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f80_arg0.TabTitle:setAlpha( 0 )
			f80_arg0.clipFinished( f80_arg0.TabTitle )
			f80_arg0.TabTitleFocus:completeAnimation()
			f80_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f80_arg0.TabTitleFocus:setAlpha( 1 )
			f80_arg0.clipFinished( f80_arg0.TabTitleFocus )
		end,
		ActiveToActiveAndFocus = function ( f84_arg0, f84_arg1 )
			f84_arg0:__resetProperties()
			f84_arg0:setupElementClipCounter( 6 )
			f84_arg0.ZMTabBackingGlowRed:completeAnimation()
			f84_arg0.ZMTabBackingGlowRed:setAlpha( 1 )
			f84_arg0.clipFinished( f84_arg0.ZMTabBackingGlowRed )
			local f84_local0 = function ( f85_arg0 )
				f84_arg0.ZMTabBackingRed:beginAnimation( 100 )
				f84_arg0.ZMTabBackingRed:setAlpha( 0.9 )
				f84_arg0.ZMTabBackingRed:registerEventHandler( "interrupted_keyframe", f84_arg0.clipInterrupted )
				f84_arg0.ZMTabBackingRed:registerEventHandler( "transition_complete_keyframe", f84_arg0.clipFinished )
			end
			
			f84_arg0.ZMTabBackingRed:completeAnimation()
			f84_arg0.ZMTabBackingRed:setAlpha( 0.5 )
			f84_arg0.ZMTabBackingRed:setShaderVector( 0, 0.9, 0, 0, 0 )
			f84_local0( f84_arg0.ZMTabBackingRed )
			local f84_local1 = function ( f86_arg0 )
				f84_arg0.ZMTabEndRight:beginAnimation( 100 )
				f84_arg0.ZMTabEndRight:setLeftRight( 1, 1, -18, -10 )
				f84_arg0.ZMTabEndRight:registerEventHandler( "interrupted_keyframe", f84_arg0.clipInterrupted )
				f84_arg0.ZMTabEndRight:registerEventHandler( "transition_complete_keyframe", f84_arg0.clipFinished )
			end
			
			f84_arg0.ZMTabEndRight:completeAnimation()
			f84_arg0.ZMTabEndRight:setLeftRight( 1, 1, -9, -1 )
			f84_arg0.ZMTabEndRight:setAlpha( 1 )
			f84_local1( f84_arg0.ZMTabEndRight )
			local f84_local2 = function ( f87_arg0 )
				f84_arg0.ZMTabEndLeft:beginAnimation( 100 )
				f84_arg0.ZMTabEndLeft:setLeftRight( 0, 0, 10, 18 )
				f84_arg0.ZMTabEndLeft:registerEventHandler( "interrupted_keyframe", f84_arg0.clipInterrupted )
				f84_arg0.ZMTabEndLeft:registerEventHandler( "transition_complete_keyframe", f84_arg0.clipFinished )
			end
			
			f84_arg0.ZMTabEndLeft:completeAnimation()
			f84_arg0.ZMTabEndLeft:setLeftRight( 0, 0, 1, 9 )
			f84_arg0.ZMTabEndLeft:setAlpha( 1 )
			f84_local2( f84_arg0.ZMTabEndLeft )
			f84_arg0.TabTitle:completeAnimation()
			f84_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f84_arg0.TabTitle:setAlpha( 0 )
			f84_arg0.clipFinished( f84_arg0.TabTitle )
			f84_arg0.TabTitleFocus:completeAnimation()
			f84_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f84_arg0.TabTitleFocus:setAlpha( 1 )
			f84_arg0.clipFinished( f84_arg0.TabTitleFocus )
		end
	},
	DefaultPC = {
		DefaultClip = function ( f88_arg0, f88_arg1 )
			f88_arg0:__resetProperties()
			f88_arg0:setupElementClipCounter( 2 )
			f88_arg0.TabTitle:completeAnimation()
			f88_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f88_arg0.TabTitle:setRGB( 0.66, 0.63, 0.52 )
			f88_arg0.TabTitle:setAlpha( 1 )
			f88_arg0.clipFinished( f88_arg0.TabTitle )
			f88_arg0.TabTitleFocus:completeAnimation()
			f88_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f88_arg0.clipFinished( f88_arg0.TabTitleFocus )
		end,
		Focus = function ( f89_arg0, f89_arg1 )
			f89_arg0:__resetProperties()
			f89_arg0:setupElementClipCounter( 4 )
			f89_arg0.TabTitle:completeAnimation()
			f89_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f89_arg0.TabTitle:setRGB( 0.66, 0.63, 0.52 )
			f89_arg0.TabTitle:setAlpha( 0 )
			f89_arg0.clipFinished( f89_arg0.TabTitle )
			f89_arg0.TabTitleFocus:completeAnimation()
			f89_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f89_arg0.TabTitleFocus:setRGB( 1, 0.85, 0.48 )
			f89_arg0.TabTitleFocus:setAlpha( 1 )
			f89_arg0.TabTitleFocus:setScale( 1, 1 )
			f89_arg0.TabTitleFocus:setBackingAlpha( 0.15 )
			f89_arg0.clipFinished( f89_arg0.TabTitleFocus )
			f89_arg0.TabEndLeft:completeAnimation()
			f89_arg0.TabEndLeft:setLeftRight( 0, 0, 10, 18 )
			f89_arg0.TabEndLeft:setAlpha( 1 )
			f89_arg0.clipFinished( f89_arg0.TabEndLeft )
			f89_arg0.TabEndRight:completeAnimation()
			f89_arg0.TabEndRight:setLeftRight( 1, 1, -18, -10 )
			f89_arg0.TabEndRight:setAlpha( 1 )
			f89_arg0.clipFinished( f89_arg0.TabEndRight )
		end,
		GainFocus = function ( f90_arg0, f90_arg1 )
			f90_arg0:__resetProperties()
			f90_arg0:setupElementClipCounter( 4 )
			local f90_local0 = function ( f91_arg0 )
				f90_arg0.TabTitle:beginAnimation( 20 )
				f90_arg0.TabTitle:setAlpha( 0 )
				f90_arg0.TabTitle:registerEventHandler( "interrupted_keyframe", f90_arg0.clipInterrupted )
				f90_arg0.TabTitle:registerEventHandler( "transition_complete_keyframe", f90_arg0.clipFinished )
			end
			
			f90_arg0.TabTitle:completeAnimation()
			f90_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f90_arg0.TabTitle:setRGB( 0.66, 0.63, 0.52 )
			f90_arg0.TabTitle:setAlpha( 1 )
			f90_local0( f90_arg0.TabTitle )
			local f90_local1 = function ( f92_arg0 )
				local f92_local0 = function ( f93_arg0 )
					local f93_local0 = function ( f94_arg0 )
						f94_arg0:beginAnimation( 60 )
						f94_arg0:setBackingAlpha( 0.15 )
						f94_arg0:setBackingXPadding( 50 )
						f94_arg0:registerEventHandler( "transition_complete_keyframe", f90_arg0.clipFinished )
					end
					
					f93_arg0:beginAnimation( 60 )
					f93_arg0:setRGB( 1, 0.85, 0.48 )
					f93_arg0:setScale( 1, 1 )
					f93_arg0:setBackingAlpha( 0.11 )
					f93_arg0:setBackingXPadding( 44.78 )
					f93_arg0:registerEventHandler( "transition_complete_keyframe", f93_local0 )
				end
				
				f90_arg0.TabTitleFocus:beginAnimation( 110 )
				f90_arg0.TabTitleFocus:setRGB( 0.88, 0.77, 0.49 )
				f90_arg0.TabTitleFocus:setAlpha( 1 )
				f90_arg0.TabTitleFocus:setScale( 0.96, 0.96 )
				f90_arg0.TabTitleFocus:setBackingAlpha( 0.07 )
				f90_arg0.TabTitleFocus:setBackingXPadding( 39.57 )
				f90_arg0.TabTitleFocus:registerEventHandler( "interrupted_keyframe", f90_arg0.clipInterrupted )
				f90_arg0.TabTitleFocus:registerEventHandler( "transition_complete_keyframe", f92_local0 )
			end
			
			f90_arg0.TabTitleFocus:completeAnimation()
			f90_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f90_arg0.TabTitleFocus:setRGB( 0.66, 0.63, 0.52 )
			f90_arg0.TabTitleFocus:setAlpha( 0 )
			f90_arg0.TabTitleFocus:setScale( 0.88, 0.88 )
			f90_arg0.TabTitleFocus:setBackingAlpha( 0 )
			f90_arg0.TabTitleFocus:setBackingXPadding( 30 )
			f90_local1( f90_arg0.TabTitleFocus )
			local f90_local2 = function ( f95_arg0 )
				local f95_local0 = function ( f96_arg0 )
					f96_arg0:beginAnimation( 120 )
					f96_arg0:setLeftRight( 0, 0, 10, 18 )
					f96_arg0:setAlpha( 1 )
					f96_arg0:registerEventHandler( "transition_complete_keyframe", f90_arg0.clipFinished )
				end
				
				f90_arg0.TabEndLeft:beginAnimation( 50 )
				f90_arg0.TabEndLeft:setLeftRight( 0, 0, -20, -12 )
				f90_arg0.TabEndLeft:setAlpha( 0.29 )
				f90_arg0.TabEndLeft:registerEventHandler( "interrupted_keyframe", f90_arg0.clipInterrupted )
				f90_arg0.TabEndLeft:registerEventHandler( "transition_complete_keyframe", f95_local0 )
			end
			
			f90_arg0.TabEndLeft:completeAnimation()
			f90_arg0.TabEndLeft:setLeftRight( 0, 0, 0, 8 )
			f90_arg0.TabEndLeft:setAlpha( 0 )
			f90_local2( f90_arg0.TabEndLeft )
			local f90_local3 = function ( f97_arg0 )
				local f97_local0 = function ( f98_arg0 )
					f98_arg0:beginAnimation( 120 )
					f98_arg0:setLeftRight( 1, 1, -18, -10 )
					f98_arg0:setAlpha( 1 )
					f98_arg0:registerEventHandler( "transition_complete_keyframe", f90_arg0.clipFinished )
				end
				
				f90_arg0.TabEndRight:beginAnimation( 50 )
				f90_arg0.TabEndRight:setLeftRight( 1, 1, 12, 20 )
				f90_arg0.TabEndRight:setAlpha( 0.29 )
				f90_arg0.TabEndRight:registerEventHandler( "interrupted_keyframe", f90_arg0.clipInterrupted )
				f90_arg0.TabEndRight:registerEventHandler( "transition_complete_keyframe", f97_local0 )
			end
			
			f90_arg0.TabEndRight:completeAnimation()
			f90_arg0.TabEndRight:setLeftRight( 1, 1, -8, 0 )
			f90_arg0.TabEndRight:setAlpha( 0 )
			f90_local3( f90_arg0.TabEndRight )
		end,
		LoseFocus = function ( f99_arg0, f99_arg1 )
			f99_arg0:__resetProperties()
			f99_arg0:setupElementClipCounter( 4 )
			local f99_local0 = function ( f100_arg0 )
				f99_arg0.TabTitle:beginAnimation( 30 )
				f99_arg0.TabTitle:setAlpha( 1 )
				f99_arg0.TabTitle:registerEventHandler( "interrupted_keyframe", f99_arg0.clipInterrupted )
				f99_arg0.TabTitle:registerEventHandler( "transition_complete_keyframe", f99_arg0.clipFinished )
			end
			
			f99_arg0.TabTitle:completeAnimation()
			f99_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f99_arg0.TabTitle:setRGB( 0.66, 0.63, 0.52 )
			f99_arg0.TabTitle:setAlpha( 0 )
			f99_local0( f99_arg0.TabTitle )
			local f99_local1 = function ( f101_arg0 )
				f99_arg0.TabTitleFocus:beginAnimation( 30 )
				f99_arg0.TabTitleFocus:setAlpha( 0 )
				f99_arg0.TabTitleFocus:setScale( 0.88, 0.88 )
				f99_arg0.TabTitleFocus:registerEventHandler( "interrupted_keyframe", f99_arg0.clipInterrupted )
				f99_arg0.TabTitleFocus:registerEventHandler( "transition_complete_keyframe", f99_arg0.clipFinished )
			end
			
			f99_arg0.TabTitleFocus:completeAnimation()
			f99_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f99_arg0.TabTitleFocus:setRGB( 1, 0.85, 0.48 )
			f99_arg0.TabTitleFocus:setAlpha( 1 )
			f99_arg0.TabTitleFocus:setScale( 1, 1 )
			f99_arg0.TabTitleFocus:setBackingAlpha( 0.15 )
			f99_local1( f99_arg0.TabTitleFocus )
			local f99_local2 = function ( f102_arg0 )
				f99_arg0.TabEndLeft:beginAnimation( 170 )
				f99_arg0.TabEndLeft:setLeftRight( 0, 0, -20, -12 )
				f99_arg0.TabEndLeft:setAlpha( 0 )
				f99_arg0.TabEndLeft:registerEventHandler( "interrupted_keyframe", f99_arg0.clipInterrupted )
				f99_arg0.TabEndLeft:registerEventHandler( "transition_complete_keyframe", f99_arg0.clipFinished )
			end
			
			f99_arg0.TabEndLeft:completeAnimation()
			f99_arg0.TabEndLeft:setLeftRight( 0, 0, 10, 18 )
			f99_arg0.TabEndLeft:setAlpha( 1 )
			f99_local2( f99_arg0.TabEndLeft )
			local f99_local3 = function ( f103_arg0 )
				f99_arg0.TabEndRight:beginAnimation( 170 )
				f99_arg0.TabEndRight:setLeftRight( 1, 1, 12, 20 )
				f99_arg0.TabEndRight:setAlpha( 0 )
				f99_arg0.TabEndRight:registerEventHandler( "interrupted_keyframe", f99_arg0.clipInterrupted )
				f99_arg0.TabEndRight:registerEventHandler( "transition_complete_keyframe", f99_arg0.clipFinished )
			end
			
			f99_arg0.TabEndRight:completeAnimation()
			f99_arg0.TabEndRight:setLeftRight( 1, 1, -18, -10 )
			f99_arg0.TabEndRight:setAlpha( 1 )
			f99_local3( f99_arg0.TabEndRight )
		end,
		Active = function ( f104_arg0, f104_arg1 )
			f104_arg0:__resetProperties()
			f104_arg0:setupElementClipCounter( 6 )
			local f104_local0 = function ( f105_arg0 )
				local f105_local0 = function ( f106_arg0 )
					f106_arg0:beginAnimation( 2500 )
					f106_arg0:setAlpha( 1 )
					f106_arg0:registerEventHandler( "transition_complete_keyframe", f104_arg0.clipFinished )
				end
				
				f104_arg0.TabBackingGlow:beginAnimation( 2500 )
				f104_arg0.TabBackingGlow:setAlpha( 0.5 )
				f104_arg0.TabBackingGlow:registerEventHandler( "interrupted_keyframe", f104_arg0.clipInterrupted )
				f104_arg0.TabBackingGlow:registerEventHandler( "transition_complete_keyframe", f105_local0 )
			end
			
			f104_arg0.TabBackingGlow:completeAnimation()
			f104_arg0.TabBackingGlow:setAlpha( 1 )
			f104_local0( f104_arg0.TabBackingGlow )
			f104_arg0.TabBacking:completeAnimation()
			f104_arg0.TabBacking:setAlpha( 0.5 )
			f104_arg0.clipFinished( f104_arg0.TabBacking )
			f104_arg0.TabTitle:completeAnimation()
			f104_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f104_arg0.TabTitle:setAlpha( 0 )
			f104_arg0.clipFinished( f104_arg0.TabTitle )
			f104_arg0.TabTitleFocus:completeAnimation()
			f104_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f104_arg0.TabTitleFocus:setAlpha( 1 )
			f104_arg0.clipFinished( f104_arg0.TabTitleFocus )
			f104_arg0.TabEndLeft:completeAnimation()
			f104_arg0.TabEndLeft:setLeftRight( 0, 0, 0, 8 )
			f104_arg0.TabEndLeft:setAlpha( 1 )
			f104_arg0.clipFinished( f104_arg0.TabEndLeft )
			f104_arg0.TabEndRight:completeAnimation()
			f104_arg0.TabEndRight:setLeftRight( 1, 1, -8, 0 )
			f104_arg0.TabEndRight:setAlpha( 1 )
			f104_arg0.clipFinished( f104_arg0.TabEndRight )
			f104_arg0.nextClip = "Active"
		end,
		GainActive = function ( f107_arg0, f107_arg1 )
			f107_arg0:__resetProperties()
			f107_arg0:setupElementClipCounter( 6 )
			local f107_local0 = function ( f108_arg0 )
				f107_arg0.TabBackingGlow:beginAnimation( 200 )
				f107_arg0.TabBackingGlow:setAlpha( 1 )
				f107_arg0.TabBackingGlow:registerEventHandler( "interrupted_keyframe", f107_arg0.clipInterrupted )
				f107_arg0.TabBackingGlow:registerEventHandler( "transition_complete_keyframe", f107_arg0.clipFinished )
			end
			
			f107_arg0.TabBackingGlow:completeAnimation()
			f107_arg0.TabBackingGlow:setAlpha( 0 )
			f107_local0( f107_arg0.TabBackingGlow )
			local f107_local1 = function ( f109_arg0 )
				local f109_local0 = function ( f110_arg0 )
					f110_arg0:beginAnimation( 49 )
					f110_arg0:setAlpha( 0.5 )
					f110_arg0:setShaderVector( 0, 1, 0, 0, 0 )
					f110_arg0:registerEventHandler( "transition_complete_keyframe", f107_arg0.clipFinished )
				end
				
				f109_arg0:beginAnimation( 50 )
				f109_arg0:setAlpha( 0.25 )
				f109_arg0:setShaderVector( 0, 2, 0, 0, 0 )
				f109_arg0:registerEventHandler( "transition_complete_keyframe", f109_local0 )
			end
			
			f107_arg0.TabBacking:beginAnimation( 100 )
			f107_arg0.TabBacking:setAlpha( 0 )
			f107_arg0.TabBacking:setShaderVector( 0, 1, 0, 0, 0 )
			f107_arg0.TabBacking:registerEventHandler( "interrupted_keyframe", f107_arg0.clipInterrupted )
			f107_arg0.TabBacking:registerEventHandler( "transition_complete_keyframe", f107_local1 )
			local f107_local2 = function ( f111_arg0 )
				local f111_local0 = function ( f112_arg0 )
					f112_arg0:beginAnimation( 180 )
					f112_arg0:registerEventHandler( "transition_complete_keyframe", f107_arg0.clipFinished )
				end
				
				f107_arg0.TabTitle:beginAnimation( 20 )
				f107_arg0.TabTitle:setAlpha( 0 )
				f107_arg0.TabTitle:registerEventHandler( "interrupted_keyframe", f107_arg0.clipInterrupted )
				f107_arg0.TabTitle:registerEventHandler( "transition_complete_keyframe", f111_local0 )
			end
			
			f107_arg0.TabTitle:completeAnimation()
			f107_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f107_arg0.TabTitle:setRGB( 0.66, 0.63, 0.52 )
			f107_arg0.TabTitle:setAlpha( 1 )
			f107_local2( f107_arg0.TabTitle )
			local f107_local3 = function ( f113_arg0 )
				f107_arg0.TabTitleFocus:beginAnimation( 120 )
				f107_arg0.TabTitleFocus:setAlpha( 1 )
				f107_arg0.TabTitleFocus:registerEventHandler( "interrupted_keyframe", f107_arg0.clipInterrupted )
				f107_arg0.TabTitleFocus:registerEventHandler( "transition_complete_keyframe", f107_arg0.clipFinished )
			end
			
			f107_arg0.TabTitleFocus:completeAnimation()
			f107_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f107_arg0.TabTitleFocus:setAlpha( 0 )
			f107_local3( f107_arg0.TabTitleFocus )
			local f107_local4 = function ( f114_arg0 )
				local f114_local0 = function ( f115_arg0 )
					local f115_local0 = function ( f116_arg0 )
						local f116_local0 = function ( f117_arg0 )
							f117_arg0:beginAnimation( 60 )
							f117_arg0:setAlpha( 1 )
							f117_arg0:registerEventHandler( "transition_complete_keyframe", f107_arg0.clipFinished )
						end
						
						f116_arg0:beginAnimation( 20 )
						f116_arg0:setLeftRight( 0, 0, 0, 8 )
						f116_arg0:setAlpha( 0.7 )
						f116_arg0:registerEventHandler( "transition_complete_keyframe", f116_local0 )
					end
					
					f115_arg0:beginAnimation( 19 )
					f115_arg0:setLeftRight( 0, 0, -5, 3 )
					f115_arg0:setAlpha( 0.6 )
					f115_arg0:registerEventHandler( "transition_complete_keyframe", f115_local0 )
				end
				
				f107_arg0.TabEndLeft:beginAnimation( 100 )
				f107_arg0.TabEndLeft:setLeftRight( 0, 0, 0, 8 )
				f107_arg0.TabEndLeft:setAlpha( 0.5 )
				f107_arg0.TabEndLeft:registerEventHandler( "interrupted_keyframe", f107_arg0.clipInterrupted )
				f107_arg0.TabEndLeft:registerEventHandler( "transition_complete_keyframe", f114_local0 )
			end
			
			f107_arg0.TabEndLeft:completeAnimation()
			f107_arg0.TabEndLeft:setLeftRight( 0, 0, 25, 33 )
			f107_arg0.TabEndLeft:setAlpha( 0 )
			f107_local4( f107_arg0.TabEndLeft )
			local f107_local5 = function ( f118_arg0 )
				local f118_local0 = function ( f119_arg0 )
					local f119_local0 = function ( f120_arg0 )
						local f120_local0 = function ( f121_arg0 )
							f121_arg0:beginAnimation( 60 )
							f121_arg0:setAlpha( 1 )
							f121_arg0:registerEventHandler( "transition_complete_keyframe", f107_arg0.clipFinished )
						end
						
						f120_arg0:beginAnimation( 20 )
						f120_arg0:setLeftRight( 1, 1, -8, 0 )
						f120_arg0:setAlpha( 0.7 )
						f120_arg0:registerEventHandler( "transition_complete_keyframe", f120_local0 )
					end
					
					f119_arg0:beginAnimation( 19 )
					f119_arg0:setLeftRight( 1, 1, -3, 5 )
					f119_arg0:setAlpha( 0.6 )
					f119_arg0:registerEventHandler( "transition_complete_keyframe", f119_local0 )
				end
				
				f107_arg0.TabEndRight:beginAnimation( 100 )
				f107_arg0.TabEndRight:setLeftRight( 1, 1, -8, 0 )
				f107_arg0.TabEndRight:setAlpha( 0.5 )
				f107_arg0.TabEndRight:registerEventHandler( "interrupted_keyframe", f107_arg0.clipInterrupted )
				f107_arg0.TabEndRight:registerEventHandler( "transition_complete_keyframe", f118_local0 )
			end
			
			f107_arg0.TabEndRight:completeAnimation()
			f107_arg0.TabEndRight:setLeftRight( 1, 1, -33, -25 )
			f107_arg0.TabEndRight:setAlpha( 0 )
			f107_local5( f107_arg0.TabEndRight )
		end,
		LoseActive = function ( f122_arg0, f122_arg1 )
			f122_arg0:__resetProperties()
			f122_arg0:setupElementClipCounter( 6 )
			local f122_local0 = function ( f123_arg0 )
				f122_arg0.TabBackingGlow:beginAnimation( 100 )
				f122_arg0.TabBackingGlow:setAlpha( 0 )
				f122_arg0.TabBackingGlow:registerEventHandler( "interrupted_keyframe", f122_arg0.clipInterrupted )
				f122_arg0.TabBackingGlow:registerEventHandler( "transition_complete_keyframe", f122_arg0.clipFinished )
			end
			
			f122_arg0.TabBackingGlow:completeAnimation()
			f122_arg0.TabBackingGlow:setAlpha( 1 )
			f122_local0( f122_arg0.TabBackingGlow )
			local f122_local1 = function ( f124_arg0 )
				f122_arg0.TabBacking:beginAnimation( 100 )
				f122_arg0.TabBacking:setAlpha( 0 )
				f122_arg0.TabBacking:registerEventHandler( "interrupted_keyframe", f122_arg0.clipInterrupted )
				f122_arg0.TabBacking:registerEventHandler( "transition_complete_keyframe", f122_arg0.clipFinished )
			end
			
			f122_arg0.TabBacking:completeAnimation()
			f122_arg0.TabBacking:setAlpha( 0.5 )
			f122_local1( f122_arg0.TabBacking )
			local f122_local2 = function ( f125_arg0 )
				f122_arg0.TabTitle:beginAnimation( 100 )
				f122_arg0.TabTitle:setAlpha( 1 )
				f122_arg0.TabTitle:registerEventHandler( "interrupted_keyframe", f122_arg0.clipInterrupted )
				f122_arg0.TabTitle:registerEventHandler( "transition_complete_keyframe", f122_arg0.clipFinished )
			end
			
			f122_arg0.TabTitle:completeAnimation()
			f122_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f122_arg0.TabTitle:setRGB( 0.66, 0.63, 0.52 )
			f122_arg0.TabTitle:setAlpha( 0 )
			f122_local2( f122_arg0.TabTitle )
			local f122_local3 = function ( f126_arg0 )
				f122_arg0.TabTitleFocus:beginAnimation( 100 )
				f122_arg0.TabTitleFocus:setAlpha( 0 )
				f122_arg0.TabTitleFocus:registerEventHandler( "interrupted_keyframe", f122_arg0.clipInterrupted )
				f122_arg0.TabTitleFocus:registerEventHandler( "transition_complete_keyframe", f122_arg0.clipFinished )
			end
			
			f122_arg0.TabTitleFocus:completeAnimation()
			f122_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f122_arg0.TabTitleFocus:setAlpha( 1 )
			f122_local3( f122_arg0.TabTitleFocus )
			local f122_local4 = function ( f127_arg0 )
				f122_arg0.TabEndLeft:beginAnimation( 100 )
				f122_arg0.TabEndLeft:setAlpha( 0 )
				f122_arg0.TabEndLeft:registerEventHandler( "interrupted_keyframe", f122_arg0.clipInterrupted )
				f122_arg0.TabEndLeft:registerEventHandler( "transition_complete_keyframe", f122_arg0.clipFinished )
			end
			
			f122_arg0.TabEndLeft:completeAnimation()
			f122_arg0.TabEndLeft:setLeftRight( 0, 0, 0, 8 )
			f122_arg0.TabEndLeft:setAlpha( 1 )
			f122_local4( f122_arg0.TabEndLeft )
			local f122_local5 = function ( f128_arg0 )
				f122_arg0.TabEndRight:beginAnimation( 100 )
				f122_arg0.TabEndRight:setAlpha( 0 )
				f122_arg0.TabEndRight:registerEventHandler( "interrupted_keyframe", f122_arg0.clipInterrupted )
				f122_arg0.TabEndRight:registerEventHandler( "transition_complete_keyframe", f122_arg0.clipFinished )
			end
			
			f122_arg0.TabEndRight:completeAnimation()
			f122_arg0.TabEndRight:setLeftRight( 1, 1, -8, 0 )
			f122_arg0.TabEndRight:setAlpha( 1 )
			f122_local5( f122_arg0.TabEndRight )
		end,
		ActiveAndFocus = function ( f129_arg0, f129_arg1 )
			f129_arg0:__resetProperties()
			f129_arg0:setupElementClipCounter( 6 )
			local f129_local0 = function ( f130_arg0 )
				local f130_local0 = function ( f131_arg0 )
					f131_arg0:beginAnimation( 2500 )
					f131_arg0:setAlpha( 1 )
					f131_arg0:registerEventHandler( "transition_complete_keyframe", f129_arg0.clipFinished )
				end
				
				f129_arg0.TabBackingGlow:beginAnimation( 2500 )
				f129_arg0.TabBackingGlow:setAlpha( 0.5 )
				f129_arg0.TabBackingGlow:registerEventHandler( "interrupted_keyframe", f129_arg0.clipInterrupted )
				f129_arg0.TabBackingGlow:registerEventHandler( "transition_complete_keyframe", f130_local0 )
			end
			
			f129_arg0.TabBackingGlow:completeAnimation()
			f129_arg0.TabBackingGlow:setAlpha( 1 )
			f129_local0( f129_arg0.TabBackingGlow )
			f129_arg0.TabBacking:completeAnimation()
			f129_arg0.TabBacking:setAlpha( 0.9 )
			f129_arg0.clipFinished( f129_arg0.TabBacking )
			f129_arg0.TabTitle:completeAnimation()
			f129_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f129_arg0.TabTitle:setAlpha( 0 )
			f129_arg0.clipFinished( f129_arg0.TabTitle )
			f129_arg0.TabTitleFocus:completeAnimation()
			f129_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f129_arg0.TabTitleFocus:setAlpha( 1 )
			f129_arg0.clipFinished( f129_arg0.TabTitleFocus )
			f129_arg0.TabEndLeft:completeAnimation()
			f129_arg0.TabEndLeft:setLeftRight( 0, 0, 10, 18 )
			f129_arg0.TabEndLeft:setAlpha( 1 )
			f129_arg0.clipFinished( f129_arg0.TabEndLeft )
			f129_arg0.TabEndRight:completeAnimation()
			f129_arg0.TabEndRight:setLeftRight( 1, 1, -18, -10 )
			f129_arg0.TabEndRight:setAlpha( 1 )
			f129_arg0.clipFinished( f129_arg0.TabEndRight )
			f129_arg0.nextClip = "ActiveAndFocus"
		end,
		FocusToActiveAndFocus = function ( f132_arg0, f132_arg1 )
			f132_arg0:__resetProperties()
			f132_arg0:setupElementClipCounter( 6 )
			local f132_local0 = function ( f133_arg0 )
				f132_arg0.TabBackingGlow:beginAnimation( 200 )
				f132_arg0.TabBackingGlow:setAlpha( 1 )
				f132_arg0.TabBackingGlow:registerEventHandler( "interrupted_keyframe", f132_arg0.clipInterrupted )
				f132_arg0.TabBackingGlow:registerEventHandler( "transition_complete_keyframe", f132_arg0.clipFinished )
			end
			
			f132_arg0.TabBackingGlow:completeAnimation()
			f132_arg0.TabBackingGlow:setAlpha( 0 )
			f132_local0( f132_arg0.TabBackingGlow )
			local f132_local1 = function ( f134_arg0 )
				local f134_local0 = function ( f135_arg0 )
					f135_arg0:beginAnimation( 49 )
					f135_arg0:setAlpha( 0.5 )
					f135_arg0:setShaderVector( 0, 1, 0, 0, 0 )
					f135_arg0:registerEventHandler( "transition_complete_keyframe", f132_arg0.clipFinished )
				end
				
				f134_arg0:beginAnimation( 50 )
				f134_arg0:setAlpha( 0.25 )
				f134_arg0:setShaderVector( 0, 2, 0, 0, 0 )
				f134_arg0:registerEventHandler( "transition_complete_keyframe", f134_local0 )
			end
			
			f132_arg0.TabBacking:beginAnimation( 100 )
			f132_arg0.TabBacking:setAlpha( 0 )
			f132_arg0.TabBacking:setShaderVector( 0, 1, 0, 0, 0 )
			f132_arg0.TabBacking:registerEventHandler( "interrupted_keyframe", f132_arg0.clipInterrupted )
			f132_arg0.TabBacking:registerEventHandler( "transition_complete_keyframe", f132_local1 )
			local f132_local2 = function ( f136_arg0 )
				f132_arg0.TabTitle:beginAnimation( 20 )
				f132_arg0.TabTitle:setAlpha( 0 )
				f132_arg0.TabTitle:registerEventHandler( "interrupted_keyframe", f132_arg0.clipInterrupted )
				f132_arg0.TabTitle:registerEventHandler( "transition_complete_keyframe", f132_arg0.clipFinished )
			end
			
			f132_arg0.TabTitle:completeAnimation()
			f132_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f132_arg0.TabTitle:setRGB( 0.66, 0.63, 0.52 )
			f132_arg0.TabTitle:setAlpha( 1 )
			f132_local2( f132_arg0.TabTitle )
			local f132_local3 = function ( f137_arg0 )
				f132_arg0.TabTitleFocus:beginAnimation( 120 )
				f132_arg0.TabTitleFocus:setAlpha( 1 )
				f132_arg0.TabTitleFocus:registerEventHandler( "interrupted_keyframe", f132_arg0.clipInterrupted )
				f132_arg0.TabTitleFocus:registerEventHandler( "transition_complete_keyframe", f132_arg0.clipFinished )
			end
			
			f132_arg0.TabTitleFocus:completeAnimation()
			f132_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f132_arg0.TabTitleFocus:setRGB( 0, 0, 0 )
			f132_arg0.TabTitleFocus:setAlpha( 0 )
			f132_local3( f132_arg0.TabTitleFocus )
			local f132_local4 = function ( f138_arg0 )
				local f138_local0 = function ( f139_arg0 )
					local f139_local0 = function ( f140_arg0 )
						local f140_local0 = function ( f141_arg0 )
							f141_arg0:beginAnimation( 49 )
							f141_arg0:setAlpha( 1 )
							f141_arg0:registerEventHandler( "transition_complete_keyframe", f132_arg0.clipFinished )
						end
						
						f140_arg0:beginAnimation( 30 )
						f140_arg0:setLeftRight( 0, 0, 10, 18 )
						f140_arg0:setAlpha( 0.75 )
						f140_arg0:registerEventHandler( "transition_complete_keyframe", f140_local0 )
					end
					
					f139_arg0:beginAnimation( 19 )
					f139_arg0:setLeftRight( 0, 0, -5, 3 )
					f139_arg0:setAlpha( 0.6 )
					f139_arg0:registerEventHandler( "transition_complete_keyframe", f139_local0 )
				end
				
				f132_arg0.TabEndLeft:beginAnimation( 100 )
				f132_arg0.TabEndLeft:setLeftRight( 0, 0, 0, 8 )
				f132_arg0.TabEndLeft:setAlpha( 0.5 )
				f132_arg0.TabEndLeft:registerEventHandler( "interrupted_keyframe", f132_arg0.clipInterrupted )
				f132_arg0.TabEndLeft:registerEventHandler( "transition_complete_keyframe", f138_local0 )
			end
			
			f132_arg0.TabEndLeft:completeAnimation()
			f132_arg0.TabEndLeft:setLeftRight( 0, 0, 25, 33 )
			f132_arg0.TabEndLeft:setAlpha( 0 )
			f132_local4( f132_arg0.TabEndLeft )
			local f132_local5 = function ( f142_arg0 )
				local f142_local0 = function ( f143_arg0 )
					local f143_local0 = function ( f144_arg0 )
						local f144_local0 = function ( f145_arg0 )
							f145_arg0:beginAnimation( 49 )
							f145_arg0:setAlpha( 1 )
							f145_arg0:registerEventHandler( "transition_complete_keyframe", f132_arg0.clipFinished )
						end
						
						f144_arg0:beginAnimation( 30 )
						f144_arg0:setLeftRight( 1, 1, -18, -10 )
						f144_arg0:setAlpha( 0.75 )
						f144_arg0:registerEventHandler( "transition_complete_keyframe", f144_local0 )
					end
					
					f143_arg0:beginAnimation( 19 )
					f143_arg0:setLeftRight( 1, 1, -3, 5 )
					f143_arg0:setAlpha( 0.6 )
					f143_arg0:registerEventHandler( "transition_complete_keyframe", f143_local0 )
				end
				
				f132_arg0.TabEndRight:beginAnimation( 100 )
				f132_arg0.TabEndRight:setLeftRight( 1, 1, -8, 0 )
				f132_arg0.TabEndRight:setAlpha( 0.5 )
				f132_arg0.TabEndRight:registerEventHandler( "interrupted_keyframe", f132_arg0.clipInterrupted )
				f132_arg0.TabEndRight:registerEventHandler( "transition_complete_keyframe", f142_local0 )
			end
			
			f132_arg0.TabEndRight:completeAnimation()
			f132_arg0.TabEndRight:setLeftRight( 1, 1, -33, -25 )
			f132_arg0.TabEndRight:setAlpha( 0 )
			f132_local5( f132_arg0.TabEndRight )
		end,
		ActiveAndFocusToActive = function ( f146_arg0, f146_arg1 )
			f146_arg0:__resetProperties()
			f146_arg0:setupElementClipCounter( 6 )
			f146_arg0.TabBackingGlow:completeAnimation()
			f146_arg0.TabBackingGlow:setAlpha( 1 )
			f146_arg0.clipFinished( f146_arg0.TabBackingGlow )
			local f146_local0 = function ( f147_arg0 )
				f146_arg0.TabBacking:beginAnimation( 200 )
				f146_arg0.TabBacking:setAlpha( 0.5 )
				f146_arg0.TabBacking:registerEventHandler( "interrupted_keyframe", f146_arg0.clipInterrupted )
				f146_arg0.TabBacking:registerEventHandler( "transition_complete_keyframe", f146_arg0.clipFinished )
			end
			
			f146_arg0.TabBacking:completeAnimation()
			f146_arg0.TabBacking:setAlpha( 0.9 )
			f146_local0( f146_arg0.TabBacking )
			f146_arg0.TabTitle:completeAnimation()
			f146_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f146_arg0.TabTitle:setAlpha( 0 )
			f146_arg0.clipFinished( f146_arg0.TabTitle )
			f146_arg0.TabTitleFocus:completeAnimation()
			f146_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f146_arg0.TabTitleFocus:setAlpha( 1 )
			f146_arg0.clipFinished( f146_arg0.TabTitleFocus )
			local f146_local1 = function ( f148_arg0 )
				f146_arg0.TabEndLeft:beginAnimation( 150 )
				f146_arg0.TabEndLeft:setLeftRight( 0, 0, 0, 8 )
				f146_arg0.TabEndLeft:registerEventHandler( "interrupted_keyframe", f146_arg0.clipInterrupted )
				f146_arg0.TabEndLeft:registerEventHandler( "transition_complete_keyframe", f146_arg0.clipFinished )
			end
			
			f146_arg0.TabEndLeft:completeAnimation()
			f146_arg0.TabEndLeft:setLeftRight( 0, 0, 10, 18 )
			f146_arg0.TabEndLeft:setAlpha( 1 )
			f146_local1( f146_arg0.TabEndLeft )
			local f146_local2 = function ( f149_arg0 )
				f146_arg0.TabEndRight:beginAnimation( 150 )
				f146_arg0.TabEndRight:setLeftRight( 1, 1, -8, 0 )
				f146_arg0.TabEndRight:registerEventHandler( "interrupted_keyframe", f146_arg0.clipInterrupted )
				f146_arg0.TabEndRight:registerEventHandler( "transition_complete_keyframe", f146_arg0.clipFinished )
			end
			
			f146_arg0.TabEndRight:completeAnimation()
			f146_arg0.TabEndRight:setLeftRight( 1, 1, -18, -10 )
			f146_arg0.TabEndRight:setAlpha( 1 )
			f146_local2( f146_arg0.TabEndRight )
		end,
		ActiveToActiveAndFocus = function ( f150_arg0, f150_arg1 )
			f150_arg0:__resetProperties()
			f150_arg0:setupElementClipCounter( 6 )
			f150_arg0.TabBackingGlow:completeAnimation()
			f150_arg0.TabBackingGlow:setAlpha( 1 )
			f150_arg0.clipFinished( f150_arg0.TabBackingGlow )
			local f150_local0 = function ( f151_arg0 )
				f150_arg0.TabBacking:beginAnimation( 100 )
				f150_arg0.TabBacking:setAlpha( 0.9 )
				f150_arg0.TabBacking:registerEventHandler( "interrupted_keyframe", f150_arg0.clipInterrupted )
				f150_arg0.TabBacking:registerEventHandler( "transition_complete_keyframe", f150_arg0.clipFinished )
			end
			
			f150_arg0.TabBacking:completeAnimation()
			f150_arg0.TabBacking:setAlpha( 0.5 )
			f150_local0( f150_arg0.TabBacking )
			f150_arg0.TabTitle:completeAnimation()
			f150_arg0.TabTitle:setTopBottom( 0.5, 0.5, -9, 9 )
			f150_arg0.TabTitle:setAlpha( 0 )
			f150_arg0.clipFinished( f150_arg0.TabTitle )
			f150_arg0.TabTitleFocus:completeAnimation()
			f150_arg0.TabTitleFocus:setTopBottom( 0.5, 0.5, -10, 10 )
			f150_arg0.TabTitleFocus:setAlpha( 1 )
			f150_arg0.clipFinished( f150_arg0.TabTitleFocus )
			local f150_local1 = function ( f152_arg0 )
				f150_arg0.TabEndLeft:beginAnimation( 100 )
				f150_arg0.TabEndLeft:setLeftRight( 0, 0, 10, 18 )
				f150_arg0.TabEndLeft:registerEventHandler( "interrupted_keyframe", f150_arg0.clipInterrupted )
				f150_arg0.TabEndLeft:registerEventHandler( "transition_complete_keyframe", f150_arg0.clipFinished )
			end
			
			f150_arg0.TabEndLeft:completeAnimation()
			f150_arg0.TabEndLeft:setLeftRight( 0, 0, 0, 8 )
			f150_arg0.TabEndLeft:setAlpha( 1 )
			f150_local1( f150_arg0.TabEndLeft )
			local f150_local2 = function ( f153_arg0 )
				f150_arg0.TabEndRight:beginAnimation( 100 )
				f150_arg0.TabEndRight:setLeftRight( 1, 1, -18, -10 )
				f150_arg0.TabEndRight:registerEventHandler( "interrupted_keyframe", f150_arg0.clipInterrupted )
				f150_arg0.TabEndRight:registerEventHandler( "transition_complete_keyframe", f150_arg0.clipFinished )
			end
			
			f150_arg0.TabEndRight:completeAnimation()
			f150_arg0.TabEndRight:setLeftRight( 1, 1, -8, 0 )
			f150_arg0.TabEndRight:setAlpha( 1 )
			f150_local2( f150_arg0.TabEndRight )
		end
	},
	Zombies = {
		DefaultClip = function ( f154_arg0, f154_arg1 )
			f154_arg0:__resetProperties()
			f154_arg0:setupElementClipCounter( 2 )
			f154_arg0.ZMText:completeAnimation()
			f154_arg0.ZMText:setAlpha( 0 )
			f154_arg0.clipFinished( f154_arg0.ZMText )
			f154_arg0.TabTitle:completeAnimation()
			f154_arg0.TabTitle:setRGB( 0.92, 0.89, 0.72 )
			f154_arg0.TabTitle:setAlpha( 1 )
			f154_arg0.clipFinished( f154_arg0.TabTitle )
		end,
		Active = function ( f155_arg0, f155_arg1 )
			f155_arg0:__resetProperties()
			f155_arg0:setupElementClipCounter( 7 )
			local f155_local0 = function ( f156_arg0 )
				f155_arg0.ZMTabBackingGlowRed:beginAnimation( 200 )
				f155_arg0.ZMTabBackingGlowRed:setAlpha( 0.95 )
				f155_arg0.ZMTabBackingGlowRed:registerEventHandler( "interrupted_keyframe", f155_arg0.clipInterrupted )
				f155_arg0.ZMTabBackingGlowRed:registerEventHandler( "transition_complete_keyframe", f155_arg0.clipFinished )
			end
			
			f155_arg0.ZMTabBackingGlowRed:completeAnimation()
			f155_arg0.ZMTabBackingGlowRed:setAlpha( 0 )
			f155_local0( f155_arg0.ZMTabBackingGlowRed )
			local f155_local1 = function ( f157_arg0 )
				local f157_local0 = function ( f158_arg0 )
					local f158_local0 = function ( f159_arg0 )
						f159_arg0:beginAnimation( 49 )
						f159_arg0:setAlpha( 0.5 )
						f159_arg0:setShaderVector( 0, 0.9, 0, 0, 0 )
						f159_arg0:registerEventHandler( "transition_complete_keyframe", f155_arg0.clipFinished )
					end
					
					f158_arg0:beginAnimation( 50 )
					f158_arg0:setAlpha( 0.25 )
					f158_arg0:setShaderVector( 0, 2, 0, 0, 0 )
					f158_arg0:registerEventHandler( "transition_complete_keyframe", f158_local0 )
				end
				
				f155_arg0.ZMTabBackingRed:beginAnimation( 100 )
				f155_arg0.ZMTabBackingRed:registerEventHandler( "interrupted_keyframe", f155_arg0.clipInterrupted )
				f155_arg0.ZMTabBackingRed:registerEventHandler( "transition_complete_keyframe", f157_local0 )
			end
			
			f155_arg0.ZMTabBackingRed:completeAnimation()
			f155_arg0.ZMTabBackingRed:setAlpha( 0 )
			f155_arg0.ZMTabBackingRed:setShaderVector( 0, 0.9, 0, 0, 0 )
			f155_local1( f155_arg0.ZMTabBackingRed )
			f155_arg0.ZMTextFocus:completeAnimation()
			f155_arg0.ZMTextFocus:setAlpha( 0 )
			f155_arg0.clipFinished( f155_arg0.ZMTextFocus )
			local f155_local2 = function ( f160_arg0 )
				local f160_local0 = function ( f161_arg0 )
					f161_arg0:beginAnimation( 40 )
					f161_arg0:setLeftRight( 1, 1, -9, -1 )
					f161_arg0:registerEventHandler( "transition_complete_keyframe", f155_arg0.clipFinished )
				end
				
				f155_arg0.ZMTabEndRight:beginAnimation( 160 )
				f155_arg0.ZMTabEndRight:setLeftRight( 1, 1, -6, 2 )
				f155_arg0.ZMTabEndRight:setAlpha( 1 )
				f155_arg0.ZMTabEndRight:registerEventHandler( "interrupted_keyframe", f155_arg0.clipInterrupted )
				f155_arg0.ZMTabEndRight:registerEventHandler( "transition_complete_keyframe", f160_local0 )
			end
			
			f155_arg0.ZMTabEndRight:completeAnimation()
			f155_arg0.ZMTabEndRight:setLeftRight( 1, 1, -24, -16 )
			f155_arg0.ZMTabEndRight:setAlpha( 0 )
			f155_local2( f155_arg0.ZMTabEndRight )
			local f155_local3 = function ( f162_arg0 )
				local f162_local0 = function ( f163_arg0 )
					f163_arg0:beginAnimation( 40 )
					f163_arg0:setLeftRight( 0, 0, 1, 9 )
					f163_arg0:registerEventHandler( "transition_complete_keyframe", f155_arg0.clipFinished )
				end
				
				f155_arg0.ZMTabEndLeft:beginAnimation( 160 )
				f155_arg0.ZMTabEndLeft:setLeftRight( 0, 0, -2, 6 )
				f155_arg0.ZMTabEndLeft:setAlpha( 1 )
				f155_arg0.ZMTabEndLeft:registerEventHandler( "interrupted_keyframe", f155_arg0.clipInterrupted )
				f155_arg0.ZMTabEndLeft:registerEventHandler( "transition_complete_keyframe", f162_local0 )
			end
			
			f155_arg0.ZMTabEndLeft:completeAnimation()
			f155_arg0.ZMTabEndLeft:setLeftRight( 0, 0, 17, 25 )
			f155_arg0.ZMTabEndLeft:setAlpha( 0 )
			f155_local3( f155_arg0.ZMTabEndLeft )
			local f155_local4 = function ( f164_arg0 )
				f155_arg0.TabTitle:beginAnimation( 100 )
				f155_arg0.TabTitle:setAlpha( 0 )
				f155_arg0.TabTitle:registerEventHandler( "interrupted_keyframe", f155_arg0.clipInterrupted )
				f155_arg0.TabTitle:registerEventHandler( "transition_complete_keyframe", f155_arg0.clipFinished )
			end
			
			f155_arg0.TabTitle:completeAnimation()
			f155_arg0.TabTitle:setRGB( 0.92, 0.89, 0.72 )
			f155_arg0.TabTitle:setAlpha( 1 )
			f155_local4( f155_arg0.TabTitle )
			local f155_local5 = function ( f165_arg0 )
				f155_arg0.TabTitleFocus:beginAnimation( 100 )
				f155_arg0.TabTitleFocus:setAlpha( 1 )
				f155_arg0.TabTitleFocus:registerEventHandler( "interrupted_keyframe", f155_arg0.clipInterrupted )
				f155_arg0.TabTitleFocus:registerEventHandler( "transition_complete_keyframe", f155_arg0.clipFinished )
			end
			
			f155_arg0.TabTitleFocus:completeAnimation()
			f155_arg0.TabTitleFocus:setLeftRight( -0, 1, 11, -9 )
			f155_arg0.TabTitleFocus:setRGB( 0, 0, 0 )
			f155_arg0.TabTitleFocus:setAlpha( 0 )
			f155_local5( f155_arg0.TabTitleFocus )
		end
	}
}

CoD.DirectorSelectTextTab.__onClose = function ( f166_arg0 )
	f166_arg0.ZMTextFocus:close()
	f166_arg0.ZMText:close()
	f166_arg0.TabTitle:close()
	f166_arg0.TabTitleFocus:close()
	f166_arg0.newIcon:close()
end

CoD.DirectorSelectButtonGameType = InheritFrom( LUI.UIElement )
CoD.DirectorSelectButtonGameType.__defaultWidth = 300
CoD.DirectorSelectButtonGameType.__defaultHeight = 70
CoD.DirectorSelectButtonGameType.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.DirectorSelectButtonGameType )
	self.id = "DirectorSelectButtonGameType"
	self.soundSet = "FrontendMain"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local DirectorCustomStartButton = CoD.DirectorSelectButtonMiniInternal.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 1, 0, 0 )
	DirectorCustomStartButton:mergeStateConditions( {
		{
			stateName = "TrialLocked",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "trialLocked" )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return CoD.DirectorUtility.IsDirectorButtonOptionLocked( menu, self, f1_arg1 )
			end
		},
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "Unselectable" )
			end
		}
	} )
	DirectorCustomStartButton:linkToElementModel( DirectorCustomStartButton, "trialLocked", true, function ( model )
		f1_arg0:updateElementState( DirectorCustomStartButton, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "trialLocked"
		} )
	end )
	DirectorCustomStartButton:linkToElementModel( DirectorCustomStartButton, "locked", true, function ( model )
		f1_arg0:updateElementState( DirectorCustomStartButton, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "locked"
		} )
	end )
	DirectorCustomStartButton:linkToElementModel( DirectorCustomStartButton, "featureItemIndex", true, function ( model )
		f1_arg0:updateElementState( DirectorCustomStartButton, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "featureItemIndex"
		} )
	end )
	local f1_local2 = DirectorCustomStartButton
	local DirectorPartyLeaderOnlyPrompt = DirectorCustomStartButton.subscribeToModel
	local f1_local4 = Engine[@"getglobalmodel"]()
	DirectorPartyLeaderOnlyPrompt( f1_local2, f1_local4["lobbyRoot.lobbyNav"], function ( f8_arg0 )
		f1_arg0:updateElementState( DirectorCustomStartButton, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f8_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	DirectorCustomStartButton.Tint:setRGB( 0.05, 0.08, 0.11 )
	DirectorCustomStartButton.Tint:setAlpha( 0.25 )
	DirectorCustomStartButton.LeaderActivityText:setText( "" )
	DirectorCustomStartButton:linkToElementModel( self, nil, false, function ( model )
		DirectorCustomStartButton:setModel( model, f1_arg1 )
	end )
	DirectorCustomStartButton:linkToElementModel( self, "subtitle", true, function ( model )
		local f10_local0 = model:get()
		if f10_local0 ~= nil then
			DirectorCustomStartButton.MiddleText:setText( LocalizeToUpperString( f10_local0 ) )
		end
	end )
	DirectorCustomStartButton:linkToElementModel( self, "subtitle", true, function ( model )
		local f11_local0 = model:get()
		if f11_local0 ~= nil then
			DirectorCustomStartButton.MiddleTextFocus:setText( LocalizeToUpperString( f11_local0 ) )
		end
	end )
	self:addElement( DirectorCustomStartButton )
	self.DirectorCustomStartButton = DirectorCustomStartButton
	
	DirectorPartyLeaderOnlyPrompt = CoD.DirectorPartyLeaderOnlyPrompt.new( f1_arg0, f1_arg1, 0, 0, 50.5, 250.5, 0, 0, 46.5, 70.5 )
	DirectorPartyLeaderOnlyPrompt:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	DirectorPartyLeaderOnlyPrompt:appendEventHandler( "on_session_start", function ( f13_arg0, f13_arg1 )
		f13_arg1.menu = f13_arg1.menu or f1_arg0
		f1_arg0:updateElementState( DirectorPartyLeaderOnlyPrompt, f13_arg1 )
	end )
	DirectorPartyLeaderOnlyPrompt:appendEventHandler( "on_session_end", function ( f14_arg0, f14_arg1 )
		f14_arg1.menu = f14_arg1.menu or f1_arg0
		f1_arg0:updateElementState( DirectorPartyLeaderOnlyPrompt, f14_arg1 )
	end )
	f1_local4 = DirectorPartyLeaderOnlyPrompt
	f1_local2 = DirectorPartyLeaderOnlyPrompt.subscribeToModel
	local f1_local5 = Engine[@"getglobalmodel"]()
	f1_local2( f1_local4, f1_local5["lobbyRoot.lobbyNav"], function ( f15_arg0 )
		f1_arg0:updateElementState( DirectorPartyLeaderOnlyPrompt, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f15_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	f1_local4 = DirectorPartyLeaderOnlyPrompt
	f1_local2 = DirectorPartyLeaderOnlyPrompt.subscribeToModel
	f1_local5 = Engine[@"getglobalmodel"]()
	f1_local2( f1_local4, f1_local5["lobbyRoot.gameClient.update"], function ( f16_arg0 )
		f1_arg0:updateElementState( DirectorPartyLeaderOnlyPrompt, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f16_arg0:get(),
			modelName = "lobbyRoot.gameClient.update"
		} )
	end, false )
	f1_local4 = DirectorPartyLeaderOnlyPrompt
	f1_local2 = DirectorPartyLeaderOnlyPrompt.subscribeToModel
	f1_local5 = Engine[@"getglobalmodel"]()
	f1_local2( f1_local4, f1_local5["lobbyRoot.privateClient.update"], function ( f17_arg0 )
		f1_arg0:updateElementState( DirectorPartyLeaderOnlyPrompt, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f17_arg0:get(),
			modelName = "lobbyRoot.privateClient.update"
		} )
	end, false )
	self:addElement( DirectorPartyLeaderOnlyPrompt )
	self.DirectorPartyLeaderOnlyPrompt = DirectorPartyLeaderOnlyPrompt
	
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return CoD.DirectorUtility.IsDirectorButtonOptionLocked( menu, self, f1_arg1 )
			end
		},
		{
			stateName = "Unselectable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:linkToElementModel( self, "locked", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "locked"
		} )
	end )
	self:linkToElementModel( self, "featureItemIndex", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "featureItemIndex"
		} )
	end )
	f1_local4 = self
	f1_local2 = self.subscribeToModel
	f1_local5 = Engine[@"getglobalmodel"]()
	f1_local2( f1_local4, f1_local5["lobbyRoot.lobbyNav"], function ( f22_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f22_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	DirectorCustomStartButton.id = "DirectorCustomStartButton"
	self.__defaultFocus = DirectorCustomStartButton
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end

	self:setRGB(1, 0, 0)
	
	return self
end

CoD.DirectorSelectButtonGameType.__resetProperties = function ( f23_arg0 )
	f23_arg0.DirectorPartyLeaderOnlyPrompt:completeAnimation()
	f23_arg0.DirectorCustomStartButton:completeAnimation()
	f23_arg0.DirectorPartyLeaderOnlyPrompt:setAlpha( 1 )
	f23_arg0.DirectorPartyLeaderOnlyPrompt:setScale( 1, 1 )
	f23_arg0.DirectorCustomStartButton:setZoom( 0 )
	f23_arg0.DirectorCustomStartButton:setScale( 1, 1 )
end

CoD.DirectorSelectButtonGameType.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f24_arg0, f24_arg1 )
			f24_arg0:__resetProperties()
			f24_arg0:setupElementClipCounter( 1 )
			f24_arg0.DirectorPartyLeaderOnlyPrompt:completeAnimation()
			f24_arg0.DirectorPartyLeaderOnlyPrompt:setAlpha( 0 )
			f24_arg0.clipFinished( f24_arg0.DirectorPartyLeaderOnlyPrompt )
		end,
		ChildFocus = function ( f25_arg0, f25_arg1 )
			f25_arg0:__resetProperties()
			f25_arg0:setupElementClipCounter( 2 )
			f25_arg0.DirectorCustomStartButton:completeAnimation()
			f25_arg0.DirectorCustomStartButton:setZoom( 5 )
			f25_arg0.DirectorCustomStartButton:setScale( 1.05, 1.05 )
			f25_arg0.clipFinished( f25_arg0.DirectorCustomStartButton )
			f25_arg0.DirectorPartyLeaderOnlyPrompt:completeAnimation()
			f25_arg0.DirectorPartyLeaderOnlyPrompt:setScale( 1.05, 1.05 )
			f25_arg0.clipFinished( f25_arg0.DirectorPartyLeaderOnlyPrompt )
		end,
		GainChildFocus = function ( f26_arg0, f26_arg1 )
			f26_arg0:__resetProperties()
			f26_arg0:setupElementClipCounter( 2 )
			local f26_local0 = function ( f27_arg0 )
				f26_arg0.DirectorCustomStartButton:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_both"] )
				f26_arg0.DirectorCustomStartButton:setZoom( 5 )
				f26_arg0.DirectorCustomStartButton:setScale( 1.05, 1.05 )
				f26_arg0.DirectorCustomStartButton:registerEventHandler( "interrupted_keyframe", f26_arg0.clipInterrupted )
				f26_arg0.DirectorCustomStartButton:registerEventHandler( "transition_complete_keyframe", f26_arg0.clipFinished )
			end
			
			f26_arg0.DirectorCustomStartButton:completeAnimation()
			f26_arg0.DirectorCustomStartButton:setZoom( 0 )
			f26_arg0.DirectorCustomStartButton:setScale( 1, 1 )
			f26_local0( f26_arg0.DirectorCustomStartButton )
			local f26_local1 = function ( f28_arg0 )
				f26_arg0.DirectorPartyLeaderOnlyPrompt:beginAnimation( 200 )
				f26_arg0.DirectorPartyLeaderOnlyPrompt:setAlpha( 1 )
				f26_arg0.DirectorPartyLeaderOnlyPrompt:setScale( 1.05, 1.05 )
				f26_arg0.DirectorPartyLeaderOnlyPrompt:registerEventHandler( "interrupted_keyframe", f26_arg0.clipInterrupted )
				f26_arg0.DirectorPartyLeaderOnlyPrompt:registerEventHandler( "transition_complete_keyframe", f26_arg0.clipFinished )
			end
			
			f26_arg0.DirectorPartyLeaderOnlyPrompt:completeAnimation()
			f26_arg0.DirectorPartyLeaderOnlyPrompt:setAlpha( 0 )
			f26_arg0.DirectorPartyLeaderOnlyPrompt:setScale( 1, 1 )
			f26_local1( f26_arg0.DirectorPartyLeaderOnlyPrompt )
		end,
		LoseChildFocus = function ( f29_arg0, f29_arg1 )
			f29_arg0:__resetProperties()
			f29_arg0:setupElementClipCounter( 2 )
			local f29_local0 = function ( f30_arg0 )
				f29_arg0.DirectorCustomStartButton:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_both"] )
				f29_arg0.DirectorCustomStartButton:setZoom( 0 )
				f29_arg0.DirectorCustomStartButton:setScale( 1, 1 )
				f29_arg0.DirectorCustomStartButton:registerEventHandler( "interrupted_keyframe", f29_arg0.clipInterrupted )
				f29_arg0.DirectorCustomStartButton:registerEventHandler( "transition_complete_keyframe", f29_arg0.clipFinished )
			end
			
			f29_arg0.DirectorCustomStartButton:completeAnimation()
			f29_arg0.DirectorCustomStartButton:setZoom( 5 )
			f29_arg0.DirectorCustomStartButton:setScale( 1.05, 1.05 )
			f29_local0( f29_arg0.DirectorCustomStartButton )
			local f29_local1 = function ( f31_arg0 )
				f29_arg0.DirectorPartyLeaderOnlyPrompt:beginAnimation( 200 )
				f29_arg0.DirectorPartyLeaderOnlyPrompt:setAlpha( 0 )
				f29_arg0.DirectorPartyLeaderOnlyPrompt:registerEventHandler( "interrupted_keyframe", f29_arg0.clipInterrupted )
				f29_arg0.DirectorPartyLeaderOnlyPrompt:registerEventHandler( "transition_complete_keyframe", f29_arg0.clipFinished )
			end
			
			f29_arg0.DirectorPartyLeaderOnlyPrompt:completeAnimation()
			f29_arg0.DirectorPartyLeaderOnlyPrompt:setAlpha( 1 )
			f29_local1( f29_arg0.DirectorPartyLeaderOnlyPrompt )
		end
	},
	Locked = {
		DefaultClip = function ( f32_arg0, f32_arg1 )
			f32_arg0:__resetProperties()
			f32_arg0:setupElementClipCounter( 1 )
			f32_arg0.DirectorPartyLeaderOnlyPrompt:completeAnimation()
			f32_arg0.DirectorPartyLeaderOnlyPrompt:setAlpha( 0 )
			f32_arg0.clipFinished( f32_arg0.DirectorPartyLeaderOnlyPrompt )
		end,
		ChildFocus = function ( f33_arg0, f33_arg1 )
			f33_arg0:__resetProperties()
			f33_arg0:setupElementClipCounter( 2 )
			f33_arg0.DirectorCustomStartButton:completeAnimation()
			f33_arg0.DirectorCustomStartButton:setScale( 1.05, 1.05 )
			f33_arg0.clipFinished( f33_arg0.DirectorCustomStartButton )
			f33_arg0.DirectorPartyLeaderOnlyPrompt:completeAnimation()
			f33_arg0.DirectorPartyLeaderOnlyPrompt:setAlpha( 0 )
			f33_arg0.clipFinished( f33_arg0.DirectorPartyLeaderOnlyPrompt )
		end,
		GainChildFocus = function ( f34_arg0, f34_arg1 )
			f34_arg0:__resetProperties()
			f34_arg0:setupElementClipCounter( 2 )
			local f34_local0 = function ( f35_arg0 )
				f34_arg0.DirectorCustomStartButton:beginAnimation( 200 )
				f34_arg0.DirectorCustomStartButton:setScale( 1.05, 1.05 )
				f34_arg0.DirectorCustomStartButton:registerEventHandler( "interrupted_keyframe", f34_arg0.clipInterrupted )
				f34_arg0.DirectorCustomStartButton:registerEventHandler( "transition_complete_keyframe", f34_arg0.clipFinished )
			end
			
			f34_arg0.DirectorCustomStartButton:completeAnimation()
			f34_arg0.DirectorCustomStartButton:setScale( 1, 1 )
			f34_local0( f34_arg0.DirectorCustomStartButton )
			f34_arg0.DirectorPartyLeaderOnlyPrompt:completeAnimation()
			f34_arg0.DirectorPartyLeaderOnlyPrompt:setAlpha( 0 )
			f34_arg0.clipFinished( f34_arg0.DirectorPartyLeaderOnlyPrompt )
		end,
		LoseChildFocus = function ( f36_arg0, f36_arg1 )
			f36_arg0:__resetProperties()
			f36_arg0:setupElementClipCounter( 2 )
			local f36_local0 = function ( f37_arg0 )
				f36_arg0.DirectorCustomStartButton:beginAnimation( 200 )
				f36_arg0.DirectorCustomStartButton:setScale( 1, 1 )
				f36_arg0.DirectorCustomStartButton:registerEventHandler( "interrupted_keyframe", f36_arg0.clipInterrupted )
				f36_arg0.DirectorCustomStartButton:registerEventHandler( "transition_complete_keyframe", f36_arg0.clipFinished )
			end
			
			f36_arg0.DirectorCustomStartButton:completeAnimation()
			f36_arg0.DirectorCustomStartButton:setScale( 1.05, 1.05 )
			f36_local0( f36_arg0.DirectorCustomStartButton )
			f36_arg0.DirectorPartyLeaderOnlyPrompt:completeAnimation()
			f36_arg0.DirectorPartyLeaderOnlyPrompt:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.DirectorPartyLeaderOnlyPrompt )
		end
	},
	Unselectable = {
		DefaultClip = function ( f38_arg0, f38_arg1 )
			f38_arg0:__resetProperties()
			f38_arg0:setupElementClipCounter( 1 )
			f38_arg0.DirectorPartyLeaderOnlyPrompt:completeAnimation()
			f38_arg0.DirectorPartyLeaderOnlyPrompt:setAlpha( 0 )
			f38_arg0.clipFinished( f38_arg0.DirectorPartyLeaderOnlyPrompt )
		end
	}
}

CoD.DirectorSelectButtonGameType.__onClose = function ( f39_arg0 )
	f39_arg0.DirectorCustomStartButton:close()
	f39_arg0.DirectorPartyLeaderOnlyPrompt:close()
end

-- the huge picture one..
CoD.DirectorSelectButton = InheritFrom( LUI.UIElement )
CoD.DirectorSelectButton.__defaultWidth = 300
CoD.DirectorSelectButton.__defaultHeight = 394
CoD.DirectorSelectButton.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.DirectorSelectButton )
	self.id = "DirectorSelectButton"
	self.soundSet = "FrontendMain"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local DirectorSelectButtonInternal = CoD.DirectorSelectButtonInternalCard.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 1, 0, 0 )
	DirectorSelectButtonInternal.ImageNotFocus:setAlpha( 0.85 )
	DirectorSelectButtonInternal.ImageMask:setAlpha( 0 )
	DirectorSelectButtonInternal:linkToElementModel( self, nil, false, function ( model )
		DirectorSelectButtonInternal:setModel( model, f1_arg1 )
	end )
	DirectorSelectButtonInternal:linkToElementModel( self, "iconBackground", true, function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			DirectorSelectButtonInternal.ImageNotFocus:setImage( RegisterImage( f3_local0 ) )
		end
	end )
	DirectorSelectButtonInternal:linkToElementModel( self, "iconBackgroundFocus", true, function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			DirectorSelectButtonInternal.ImageFocus:setImage( RegisterImage( f4_local0 ) )
		end
	end )
	DirectorSelectButtonInternal:linkToElementModel( self, "subtitle", true, function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			DirectorSelectButtonInternal.LeaderActivityText:setText( Engine[@"hash_4F9F1239CFD921FE"]( f5_local0 ) )
		end
	end )
	DirectorSelectButtonInternal:linkToElementModel( self, "name", true, function ( model )
		local f6_local0 = model:get()
		if f6_local0 ~= nil then
			DirectorSelectButtonInternal.MiddleText:setText( ToUpper( CoD.BaseUtility.LocalizeIfXHash( f6_local0 ) ) )
		end
	end )
	DirectorSelectButtonInternal:linkToElementModel( self, "playlistDesc", true, function ( model )
		local f7_local0 = model:get()
		if f7_local0 ~= nil then
			DirectorSelectButtonInternal.GameModeDescription:setText( CoD.BaseUtility.LocalizeIfXHash( f7_local0 ) )
		end
	end )
	self:addElement( DirectorSelectButtonInternal )
	self.DirectorSelectButtonInternal = DirectorSelectButtonInternal
	
	self:mergeStateConditions( {
		{
			stateName = "Small",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "small" )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "locked" )
			end
		}
	} )
	self:linkToElementModel( self, "small", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "small"
		} )
	end )
	self:linkToElementModel( self, "locked", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "locked"
		} )
	end )
	DirectorSelectButtonInternal.id = "DirectorSelectButtonInternal"
	self.__defaultFocus = DirectorSelectButtonInternal
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end

	self:setRGB(1, 0, 1)

	return self
end

CoD.DirectorSelectButton.__resetProperties = function ( f12_arg0 )
	f12_arg0.DirectorSelectButtonInternal:completeAnimation()
	f12_arg0.DirectorSelectButtonInternal:setAlpha( 1 )
	f12_arg0.DirectorSelectButtonInternal:setZoom( 0 )
	f12_arg0.DirectorSelectButtonInternal:setScale( 1, 1 )
	f12_arg0.DirectorSelectButtonInternal.ImageNotFocus:setAlpha( 0.85 )
	f12_arg0.DirectorSelectButtonInternal.ImageFocus:setAlpha( 0 )
end

CoD.DirectorSelectButton.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f13_arg0, f13_arg1 )
			f13_arg0:__resetProperties()
			f13_arg0:setupElementClipCounter( 1 )
			f13_arg0.DirectorSelectButtonInternal:completeAnimation()
			f13_arg0.DirectorSelectButtonInternal.ImageNotFocus:completeAnimation()
			f13_arg0.DirectorSelectButtonInternal.ImageFocus:completeAnimation()
			f13_arg0.DirectorSelectButtonInternal.ImageNotFocus:setAlpha( 0.85 )
			f13_arg0.DirectorSelectButtonInternal.ImageFocus:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.DirectorSelectButtonInternal )
		end,
		ChildFocus = function ( f14_arg0, f14_arg1 )
			f14_arg0:__resetProperties()
			f14_arg0:setupElementClipCounter( 1 )
			f14_arg0.DirectorSelectButtonInternal:completeAnimation()
			f14_arg0.DirectorSelectButtonInternal.ImageNotFocus:completeAnimation()
			f14_arg0.DirectorSelectButtonInternal.ImageFocus:completeAnimation()
			f14_arg0.DirectorSelectButtonInternal:setZoom( 5 )
			f14_arg0.DirectorSelectButtonInternal:setScale( 1.05, 1.05 )
			f14_arg0.DirectorSelectButtonInternal.ImageNotFocus:setAlpha( 1 )
			f14_arg0.DirectorSelectButtonInternal.ImageFocus:setAlpha( 1 )
			f14_arg0.clipFinished( f14_arg0.DirectorSelectButtonInternal )
		end,
		GainChildFocus = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties()
			f15_arg0:setupElementClipCounter( 1 )
			local f15_local0 = function ( f16_arg0 )
				f15_arg0.DirectorSelectButtonInternal:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_both"] )
				f15_arg0.DirectorSelectButtonInternal.ImageNotFocus:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_both"] )
				f15_arg0.DirectorSelectButtonInternal.ImageFocus:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_both"] )
				f15_arg0.DirectorSelectButtonInternal:setScale( 1.05, 1.05 )
				f15_arg0.DirectorSelectButtonInternal.ImageNotFocus:setAlpha( 1 )
				f15_arg0.DirectorSelectButtonInternal.ImageFocus:setAlpha( 1 )
				f15_arg0.DirectorSelectButtonInternal:registerEventHandler( "interrupted_keyframe", f15_arg0.clipInterrupted )
				f15_arg0.DirectorSelectButtonInternal:registerEventHandler( "transition_complete_keyframe", f15_arg0.clipFinished )
			end
			
			f15_arg0.DirectorSelectButtonInternal:completeAnimation()
			f15_arg0.DirectorSelectButtonInternal.ImageNotFocus:completeAnimation()
			f15_arg0.DirectorSelectButtonInternal.ImageFocus:completeAnimation()
			f15_arg0.DirectorSelectButtonInternal:setZoom( 5 )
			f15_arg0.DirectorSelectButtonInternal:setScale( 1, 1 )
			f15_arg0.DirectorSelectButtonInternal.ImageNotFocus:setAlpha( 0.85 )
			f15_arg0.DirectorSelectButtonInternal.ImageFocus:setAlpha( 0 )
			f15_local0( f15_arg0.DirectorSelectButtonInternal )
		end,
		LoseChildFocus = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties()
			f17_arg0:setupElementClipCounter( 1 )
			local f17_local0 = function ( f18_arg0 )
				f17_arg0.DirectorSelectButtonInternal:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_both"] )
				f17_arg0.DirectorSelectButtonInternal.ImageNotFocus:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_both"] )
				f17_arg0.DirectorSelectButtonInternal.ImageFocus:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_both"] )
				f17_arg0.DirectorSelectButtonInternal:setScale( 1, 1 )
				f17_arg0.DirectorSelectButtonInternal.ImageNotFocus:setAlpha( 0.85 )
				f17_arg0.DirectorSelectButtonInternal.ImageFocus:setAlpha( 0 )
				f17_arg0.DirectorSelectButtonInternal:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.DirectorSelectButtonInternal:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
			end
			
			f17_arg0.DirectorSelectButtonInternal:completeAnimation()
			f17_arg0.DirectorSelectButtonInternal.ImageNotFocus:completeAnimation()
			f17_arg0.DirectorSelectButtonInternal.ImageFocus:completeAnimation()
			f17_arg0.DirectorSelectButtonInternal:setZoom( 0 )
			f17_arg0.DirectorSelectButtonInternal:setScale( 1.05, 1.05 )
			f17_arg0.DirectorSelectButtonInternal.ImageNotFocus:setAlpha( 1 )
			f17_arg0.DirectorSelectButtonInternal.ImageFocus:setAlpha( 1 )
			f17_local0( f17_arg0.DirectorSelectButtonInternal )
		end
	},
	Small = {
		DefaultClip = function ( f19_arg0, f19_arg1 )
			f19_arg0:__resetProperties()
			f19_arg0:setupElementClipCounter( 1 )
			f19_arg0.DirectorSelectButtonInternal:completeAnimation()
			f19_arg0.DirectorSelectButtonInternal:setAlpha( 0 )
			f19_arg0.clipFinished( f19_arg0.DirectorSelectButtonInternal )
		end,
		ChildFocus = function ( f20_arg0, f20_arg1 )
			f20_arg0:__resetProperties()
			f20_arg0:setupElementClipCounter( 1 )
			f20_arg0.DirectorSelectButtonInternal:completeAnimation()
			f20_arg0.DirectorSelectButtonInternal:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.DirectorSelectButtonInternal )
		end,
		GainChildFocus = function ( f21_arg0, f21_arg1 )
			f21_arg0:__resetProperties()
			f21_arg0:setupElementClipCounter( 1 )
			f21_arg0.DirectorSelectButtonInternal:completeAnimation()
			f21_arg0.DirectorSelectButtonInternal:setAlpha( 0 )
			f21_arg0.DirectorSelectButtonInternal:setScale( 1, 1 )
			f21_arg0.clipFinished( f21_arg0.DirectorSelectButtonInternal )
		end,
		LoseChildFocus = function ( f22_arg0, f22_arg1 )
			f22_arg0:__resetProperties()
			f22_arg0:setupElementClipCounter( 1 )
			f22_arg0.DirectorSelectButtonInternal:completeAnimation()
			f22_arg0.DirectorSelectButtonInternal:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.DirectorSelectButtonInternal )
		end
	},
	Locked = {
		DefaultClip = function ( f23_arg0, f23_arg1 )
			f23_arg0:__resetProperties()
			f23_arg0:setupElementClipCounter( 1 )
			f23_arg0.DirectorSelectButtonInternal:completeAnimation()
			f23_arg0.clipFinished( f23_arg0.DirectorSelectButtonInternal )
		end,
		ChildFocus = function ( f24_arg0, f24_arg1 )
			f24_arg0:__resetProperties()
			f24_arg0:setupElementClipCounter( 1 )
			f24_arg0.DirectorSelectButtonInternal:completeAnimation()
			f24_arg0.DirectorSelectButtonInternal.ImageNotFocus:completeAnimation()
			f24_arg0.DirectorSelectButtonInternal.ImageFocus:completeAnimation()
			f24_arg0.DirectorSelectButtonInternal:setScale( 1.05, 1.05 )
			f24_arg0.DirectorSelectButtonInternal.ImageNotFocus:setAlpha( 1 )
			f24_arg0.DirectorSelectButtonInternal.ImageFocus:setAlpha( 1 )
			f24_arg0.clipFinished( f24_arg0.DirectorSelectButtonInternal )
		end,
		GainChildFocus = function ( f25_arg0, f25_arg1 )
			f25_arg0:__resetProperties()
			f25_arg0:setupElementClipCounter( 1 )
			local f25_local0 = function ( f26_arg0 )
				f25_arg0.DirectorSelectButtonInternal:beginAnimation( 200 )
				f25_arg0.DirectorSelectButtonInternal.ImageNotFocus:beginAnimation( 200 )
				f25_arg0.DirectorSelectButtonInternal.ImageFocus:beginAnimation( 200 )
				f25_arg0.DirectorSelectButtonInternal:setScale( 1.05, 1.05 )
				f25_arg0.DirectorSelectButtonInternal.ImageNotFocus:setAlpha( 1 )
				f25_arg0.DirectorSelectButtonInternal.ImageFocus:setAlpha( 1 )
				f25_arg0.DirectorSelectButtonInternal:registerEventHandler( "interrupted_keyframe", f25_arg0.clipInterrupted )
				f25_arg0.DirectorSelectButtonInternal:registerEventHandler( "transition_complete_keyframe", f25_arg0.clipFinished )
			end
			
			f25_arg0.DirectorSelectButtonInternal:completeAnimation()
			f25_arg0.DirectorSelectButtonInternal.ImageNotFocus:completeAnimation()
			f25_arg0.DirectorSelectButtonInternal.ImageFocus:completeAnimation()
			f25_arg0.DirectorSelectButtonInternal:setScale( 1, 1 )
			f25_arg0.DirectorSelectButtonInternal.ImageNotFocus:setAlpha( 0.85 )
			f25_arg0.DirectorSelectButtonInternal.ImageFocus:setAlpha( 0 )
			f25_local0( f25_arg0.DirectorSelectButtonInternal )
		end,
		LoseChildFocus = function ( f27_arg0, f27_arg1 )
			f27_arg0:__resetProperties()
			f27_arg0:setupElementClipCounter( 1 )
			local f27_local0 = function ( f28_arg0 )
				f27_arg0.DirectorSelectButtonInternal:beginAnimation( 200 )
				f27_arg0.DirectorSelectButtonInternal.ImageNotFocus:beginAnimation( 200 )
				f27_arg0.DirectorSelectButtonInternal.ImageFocus:beginAnimation( 200 )
				f27_arg0.DirectorSelectButtonInternal:setScale( 1, 1 )
				f27_arg0.DirectorSelectButtonInternal.ImageNotFocus:setAlpha( 0.85 )
				f27_arg0.DirectorSelectButtonInternal.ImageFocus:setAlpha( 0 )
				f27_arg0.DirectorSelectButtonInternal:registerEventHandler( "interrupted_keyframe", f27_arg0.clipInterrupted )
				f27_arg0.DirectorSelectButtonInternal:registerEventHandler( "transition_complete_keyframe", f27_arg0.clipFinished )
			end
			
			f27_arg0.DirectorSelectButtonInternal:completeAnimation()
			f27_arg0.DirectorSelectButtonInternal.ImageNotFocus:completeAnimation()
			f27_arg0.DirectorSelectButtonInternal.ImageFocus:completeAnimation()
			f27_arg0.DirectorSelectButtonInternal:setScale( 1.05, 1.05 )
			f27_arg0.DirectorSelectButtonInternal.ImageNotFocus:setAlpha( 1 )
			f27_arg0.DirectorSelectButtonInternal.ImageFocus:setAlpha( 1 )
			f27_local0( f27_arg0.DirectorSelectButtonInternal )
		end
	}
}

CoD.DirectorSelectButton.__onClose = function ( f29_arg0 )
	f29_arg0.DirectorSelectButtonInternal:close()
end


CoD.DirectorPreGameButtonLeftJustified = InheritFrom( LUI.UIElement )
CoD.DirectorPreGameButtonLeftJustified.__defaultWidth = 212
CoD.DirectorPreGameButtonLeftJustified.__defaultHeight = 50
CoD.DirectorPreGameButtonLeftJustified.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.DirectorPreGameButtonLeftJustified )
	self.id = "DirectorPreGameButtonLeftJustified"
	self.soundSet = "FrontendMain"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local baseButton = CoD.DirectorSelectButtonMiniInternal.new( f1_arg0, f1_arg1, 0, 0, 0, 212, 0, 0, 0, 50 )
	baseButton:mergeStateConditions( {
		{
			stateName = "TrialLocked",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "trialLocked" )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "locked" )
			end
		}
	} )
	baseButton:linkToElementModel( baseButton, "trialLocked", true, function ( model )
		f1_arg0:updateElementState( baseButton, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "trialLocked"
		} )
	end )
	baseButton:linkToElementModel( baseButton, "locked", true, function ( model )
		f1_arg0:updateElementState( baseButton, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "locked"
		} )
	end )
	baseButton.MiddleText:setTTF( "ttmussels_regular" )
	baseButton.MiddleTextFocus:setTTF( "ttmussels_regular" )
	baseButton:linkToElementModel( self, nil, false, function ( model )
		baseButton:setModel( model, f1_arg1 )
	end )
	baseButton:linkToElementModel( self, "subtitle", true, function ( model )
		local f7_local0 = model:get()
		if f7_local0 ~= nil then
			baseButton.MiddleText:setText( LocalizeToUpperString( f7_local0 ) )
		end
	end )
	baseButton:linkToElementModel( self, "subtitle", true, function ( model )
		local f8_local0 = model:get()
		if f8_local0 ~= nil then
			baseButton.MiddleTextFocus:setText( LocalizeToUpperString( f8_local0 ) )
		end
	end )
	self:addElement( baseButton )
	self.baseButton = baseButton
	
	local sizeElement = CoD.DirectorSelectButtonImageInternal.new( f1_arg0, f1_arg1, 0, 0, 0, 212, 0, 0, 0, 50 )
	sizeElement:mergeStateConditions( {
		{
			stateName = "TrialLocked",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "trialLocked" )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "locked" )
			end
		},
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	sizeElement:linkToElementModel( sizeElement, "trialLocked", true, function ( model )
		f1_arg0:updateElementState( sizeElement, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "trialLocked"
		} )
	end )
	sizeElement:linkToElementModel( sizeElement, "locked", true, function ( model )
		f1_arg0:updateElementState( sizeElement, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "locked"
		} )
	end )
	sizeElement:setAlpha( 0 )
	sizeElement.Tint:setRGB( 0.05, 0.08, 0.11 )
	sizeElement.Tint:setAlpha( 0.25 )
	sizeElement:linkToElementModel( self, nil, false, function ( model )
		sizeElement:setModel( model, f1_arg1 )
	end )
	sizeElement:linkToElementModel( self, "subtitle", true, function ( model )
		local f15_local0 = model:get()
		if f15_local0 ~= nil then
			sizeElement.ButtonName.GameModeText:setText( ToUpper( CoD.BaseUtility.LocalizeIfXHash( f15_local0 ) ) )
		end
	end )
	self:addElement( sizeElement )
	self.sizeElement = sizeElement
	
	self:mergeStateConditions( {
		{
			stateName = "Large",
			condition = function ( menu, element, event )
				return not CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "small" )
			end
		}
	} )
	self:linkToElementModel( self, "small", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "small"
		} )
	end )
	baseButton.id = "baseButton"
	sizeElement.id = "sizeElement"
	self.__defaultFocus = baseButton
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	self:setRGB(1, 1, 0)

	return self
end

CoD.DirectorPreGameButtonLeftJustified.__resetProperties = function ( f18_arg0 )
	f18_arg0.baseButton:completeAnimation()
	f18_arg0.sizeElement:completeAnimation()
	f18_arg0.baseButton:setTopBottom( 0, 0, 0, 50 )
	f18_arg0.baseButton:setAlpha( 1 )
	f18_arg0.baseButton:setScale( 1, 1 )
	f18_arg0.sizeElement:setLeftRight( 0, 0, 0, 212 )
	f18_arg0.sizeElement:setTopBottom( 0, 0, 0, 50 )
	f18_arg0.sizeElement:setAlpha( 0 )
	f18_arg0.sizeElement:setScale( 1, 1 )
end

CoD.DirectorPreGameButtonLeftJustified.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f19_arg0, f19_arg1 )
			f19_arg0:__resetProperties()
			f19_arg0:setupElementClipCounter( 0 )
		end,
		ChildFocus = function ( f20_arg0, f20_arg1 )
			f20_arg0:__resetProperties()
			f20_arg0:setupElementClipCounter( 1 )
			f20_arg0.baseButton:completeAnimation()
			f20_arg0.baseButton:setScale( 1.05, 1.05 )
			f20_arg0.clipFinished( f20_arg0.baseButton )
		end,
		GainChildFocus = function ( f21_arg0, f21_arg1 )
			f21_arg0:__resetProperties()
			f21_arg0:setupElementClipCounter( 1 )
			local f21_local0 = function ( f22_arg0 )
				f21_arg0.baseButton:beginAnimation( 200 )
				f21_arg0.baseButton:setScale( 1.05, 1.05 )
				f21_arg0.baseButton:registerEventHandler( "interrupted_keyframe", f21_arg0.clipInterrupted )
				f21_arg0.baseButton:registerEventHandler( "transition_complete_keyframe", f21_arg0.clipFinished )
			end
			
			f21_arg0.baseButton:completeAnimation()
			f21_arg0.baseButton:setScale( 1, 1 )
			f21_local0( f21_arg0.baseButton )
		end,
		LoseChildFocus = function ( f23_arg0, f23_arg1 )
			f23_arg0:__resetProperties()
			f23_arg0:setupElementClipCounter( 1 )
			local f23_local0 = function ( f24_arg0 )
				f23_arg0.baseButton:beginAnimation( 200 )
				f23_arg0.baseButton:setScale( 1, 1 )
				f23_arg0.baseButton:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
				f23_arg0.baseButton:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
			end
			
			f23_arg0.baseButton:completeAnimation()
			f23_arg0.baseButton:setScale( 1.05, 1.05 )
			f23_local0( f23_arg0.baseButton )
		end
	},
	Large = {
		DefaultClip = function ( f25_arg0, f25_arg1 )
			f25_arg0:__resetProperties()
			f25_arg0:setupElementClipCounter( 2 )
			f25_arg0.baseButton:completeAnimation()
			f25_arg0.baseButton:setTopBottom( 0, 0, 0, 197 )
			f25_arg0.baseButton:setAlpha( 0 )
			f25_arg0.clipFinished( f25_arg0.baseButton )
			f25_arg0.sizeElement:completeAnimation()
			f25_arg0.sizeElement:setLeftRight( 0, 0, 0, 212 )
			f25_arg0.sizeElement:setTopBottom( 0, 0, 0, 189 )
			f25_arg0.sizeElement:setAlpha( 1 )
			f25_arg0.clipFinished( f25_arg0.sizeElement )
		end,
		ChildFocus = function ( f26_arg0, f26_arg1 )
			f26_arg0:__resetProperties()
			f26_arg0:setupElementClipCounter( 2 )
			f26_arg0.baseButton:completeAnimation()
			f26_arg0.baseButton:setTopBottom( 0, 0, 0, 197 )
			f26_arg0.baseButton:setAlpha( 0 )
			f26_arg0.baseButton:setScale( 1.05, 1.05 )
			f26_arg0.clipFinished( f26_arg0.baseButton )
			f26_arg0.sizeElement:completeAnimation()
			f26_arg0.sizeElement:setLeftRight( 0, 0, 0, 212 )
			f26_arg0.sizeElement:setTopBottom( 0, 0, 0, 189 )
			f26_arg0.sizeElement:setAlpha( 1 )
			f26_arg0.sizeElement:setScale( 1.05, 1.05 )
			f26_arg0.clipFinished( f26_arg0.sizeElement )
		end,
		GainChildFocus = function ( f27_arg0, f27_arg1 )
			f27_arg0:__resetProperties()
			f27_arg0:setupElementClipCounter( 2 )
			local f27_local0 = function ( f28_arg0 )
				f27_arg0.baseButton:beginAnimation( 200 )
				f27_arg0.baseButton:setScale( 1.05, 1.05 )
				f27_arg0.baseButton:registerEventHandler( "interrupted_keyframe", f27_arg0.clipInterrupted )
				f27_arg0.baseButton:registerEventHandler( "transition_complete_keyframe", f27_arg0.clipFinished )
			end
			
			f27_arg0.baseButton:completeAnimation()
			f27_arg0.baseButton:setTopBottom( 0, 0, 0, 197 )
			f27_arg0.baseButton:setAlpha( 0 )
			f27_arg0.baseButton:setScale( 1, 1 )
			f27_local0( f27_arg0.baseButton )
			local f27_local1 = function ( f29_arg0 )
				f27_arg0.sizeElement:beginAnimation( 200 )
				f27_arg0.sizeElement:setScale( 1.05, 1.05 )
				f27_arg0.sizeElement:registerEventHandler( "interrupted_keyframe", f27_arg0.clipInterrupted )
				f27_arg0.sizeElement:registerEventHandler( "transition_complete_keyframe", f27_arg0.clipFinished )
			end
			
			f27_arg0.sizeElement:completeAnimation()
			f27_arg0.sizeElement:setLeftRight( 0, 0, 0, 212 )
			f27_arg0.sizeElement:setTopBottom( 0, 0, 0, 189 )
			f27_arg0.sizeElement:setAlpha( 1 )
			f27_arg0.sizeElement:setScale( 1, 1 )
			f27_local1( f27_arg0.sizeElement )
		end,
		LoseChildFocus = function ( f30_arg0, f30_arg1 )
			f30_arg0:__resetProperties()
			f30_arg0:setupElementClipCounter( 2 )
			local f30_local0 = function ( f31_arg0 )
				f30_arg0.baseButton:beginAnimation( 200 )
				f30_arg0.baseButton:setScale( 1, 1 )
				f30_arg0.baseButton:registerEventHandler( "interrupted_keyframe", f30_arg0.clipInterrupted )
				f30_arg0.baseButton:registerEventHandler( "transition_complete_keyframe", f30_arg0.clipFinished )
			end
			
			f30_arg0.baseButton:completeAnimation()
			f30_arg0.baseButton:setTopBottom( 0, 0, 0, 197 )
			f30_arg0.baseButton:setAlpha( 0 )
			f30_arg0.baseButton:setScale( 1.05, 1.05 )
			f30_local0( f30_arg0.baseButton )
			local f30_local1 = function ( f32_arg0 )
				f30_arg0.sizeElement:beginAnimation( 200 )
				f30_arg0.sizeElement:setScale( 1, 1 )
				f30_arg0.sizeElement:registerEventHandler( "interrupted_keyframe", f30_arg0.clipInterrupted )
				f30_arg0.sizeElement:registerEventHandler( "transition_complete_keyframe", f30_arg0.clipFinished )
			end
			
			f30_arg0.sizeElement:completeAnimation()
			f30_arg0.sizeElement:setLeftRight( 0, 0, 0, 212 )
			f30_arg0.sizeElement:setTopBottom( 0, 0, 0, 189 )
			f30_arg0.sizeElement:setAlpha( 1 )
			f30_arg0.sizeElement:setScale( 1.05, 1.05 )
			f30_local1( f30_arg0.sizeElement )
		end
	}
}
CoD.DirectorPreGameButtonLeftJustified.__onClose = function ( f33_arg0 )
	f33_arg0.baseButton:close()
	f33_arg0.sizeElement:close()
end

CoD.DirectorCommonPartyLists = InheritFrom( LUI.UIElement )
CoD.DirectorCommonPartyLists.__defaultWidth = 1920
CoD.DirectorCommonPartyLists.__defaultHeight = 1080
CoD.DirectorCommonPartyLists.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.DirectorCommonPartyLists )
	self.id = "DirectorCommonPartyLists"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local PartyAndLobbyListsScaled = CoD.DirectorPublicPlayerListsContainer.new( f1_arg0, f1_arg1, 0.5, 0.5, 491, 916, 0, 0, 60, 120 )
	PartyAndLobbyListsScaled:setScale( 0.9, 0.9 )
	self:addElement( PartyAndLobbyListsScaled )
	self.PartyAndLobbyListsScaled = PartyAndLobbyListsScaled
	
	PartyAndLobbyListsScaled.id = "PartyAndLobbyListsScaled"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end

	local MainDirector = f1_arg0
	--MainDirector.DirectorSelect:setRGB(1, 0, 1)
	--MainDirector.DirectorSelect.LogoBO4:setRGB(1, 0, 1)
	--MainDirector.DirectorSelect.LogoBO4:setScale( 2, 2 )
	
	self:setRGB(1, 0, 0)

	RushPrintInfo("Called", "Party Common Lists, Director Debug")

	return self
end

CoD.DirectorCommonPartyLists.__onClose = function ( f2_arg0 )
	f2_arg0.PartyAndLobbyListsScaled:close()
end

CoD.FrontendChatClientContainer = InheritFrom( LUI.UIElement )
CoD.FrontendChatClientContainer.__defaultWidth = 540
CoD.FrontendChatClientContainer.__defaultHeight = 290
CoD.FrontendChatClientContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.PCUtility.StartAddingSticky( f1_arg0, self )
	CoD.PCUtility.PreSetupMenuChat( self, f1_arg0, f1_arg1 )
	self:setClass( CoD.FrontendChatClientContainer )
	self.id = "FrontendChatClientContainer"
	self.soundSet = "HUD"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local ChatClient = CoD.FrontendChatClient.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 1, 0, 0 )
	self:addElement( ChatClient )
	self.ChatClient = ChatClient
	
	self:mergeStateConditions( {
		{
			stateName = "Offline",
			condition = function ( menu, element, event )
				return false
			end
		},
		{
			stateName = "PassiveMode",
			condition = function ( menu, element, event )
				return not CoD.PCUtility.MenuChatIsActive( f1_arg1 )
			end
		}
	} )
	local f1_local2 = self
	local f1_local3 = self.subscribeToModel
	local f1_local4 = Engine[@"getmodelforcontroller"]( f1_arg1 )
	f1_local3( f1_local2, f1_local4["ChatGlobal.ChatAvailableInMenuEvent"], function ( f4_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f4_arg0:get(),
			modelName = "ChatGlobal.ChatAvailableInMenuEvent"
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine[@"getmodelforcontroller"]( f1_arg1 )
	f1_local3( f1_local2, f1_local4["ChatGlobal.MenuChatInActiveMode"], function ( f5_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f5_arg0:get(),
			modelName = "ChatGlobal.MenuChatInActiveMode"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller, f6_arg2, f6_arg3, f6_arg4 )
		CoD.FreeCursorUtility.RetriggerCursorPosition( f1_arg0, controller )
		ClearRecordedFocusIfFocusAncestor( f1_arg0, controller, self.ChatClient )
		ClearRecordedInputFocusIfInputFocusAncestor( f1_arg0, controller, self.ChatClient )
	end )
	ChatClient.id = "ChatClient"
	self.__defaultFocus = ChatClient
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	f1_local3 = self
	CoD.PCUtility.StopAddingSticky( f1_arg0 )

	--self:setRGB(1, 0, 1)
	RushPrintInfo("MainChatClient", "Called")

	return self
end

CoD.FrontendChatClientContainer.__resetProperties = function ( f7_arg0 )
	f7_arg0.ChatClient:completeAnimation()
	f7_arg0.ChatClient:setAlpha( 1 )
end

CoD.FrontendChatClientContainer.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 0 )
		end
	},
	Offline = {
		DefaultClip = function ( f9_arg0, f9_arg1 )
			f9_arg0:__resetProperties()
			f9_arg0:setupElementClipCounter( 1 )
			f9_arg0.ChatClient:completeAnimation()
			f9_arg0.ChatClient:setAlpha( 0 )
			f9_arg0.clipFinished( f9_arg0.ChatClient )
		end
	},
	PassiveMode = {
		DefaultClip = function ( f10_arg0, f10_arg1 )
			f10_arg0:__resetProperties()
			f10_arg0:setupElementClipCounter( 1 )
			f10_arg0.ChatClient:completeAnimation()
			f10_arg0.ChatClient:setAlpha( 0 )
			f10_arg0.clipFinished( f10_arg0.ChatClient )
		end
	}
}

CoD.FrontendChatClientContainer.__onClose = function ( f11_arg0 )
	f11_arg0.ChatClient:close()
end

CoD.FrontendChatClient = InheritFrom( LUI.UIElement )
CoD.FrontendChatClient.__defaultWidth = 540
CoD.FrontendChatClient.__defaultHeight = 290
CoD.FrontendChatClient.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.FrontendChatClient )
	self.id = "FrontendChatClient"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local emptyFocusable = CoD.emptyFocusable.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 1, 0, 0 )
	emptyFocusable:setRGB(1, 0, 0)
	self:addElement( emptyFocusable )
	self.emptyFocusable = emptyFocusable
	
	local FrontendChatBG = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	FrontendChatBG:setImage( RegisterImage( @"hash_6FECB0E0003975BA" ) )
	FrontendChatBG:setRGB(1, 0, 1)
	self:addElement( FrontendChatBG )
	self.FrontendChatBG = FrontendChatBG
	
	local InputText = CoD.ChatClientInputTextBox.new( f1_arg0, f1_arg1, 0.03, 0.03, -6, 514, 0.97, 0.97, -30, 0 )
	InputText:subscribeToGlobalModel( f1_arg1, "ChatGlobal", nil, function ( model )
		InputText:setModel( model, f1_arg1 )
	end )
	InputText:subscribeToGlobalModel( f1_arg1, "ChatGlobal", "Event", function ( model )
		CoD.PCUtility.ChatClientInputTextFieldUpdatePrompt( self, InputText, f1_arg1 )
	end )
	self:addElement( InputText )
	self.InputText = InputText
	
	local ChatClientChatEntryScrollViewContainer = CoD.ChatClientChatEntryScrollViewContainer.new( f1_arg0, f1_arg1, 0.03, 0.03, -2, 516, 0.07, 0.07, 1.5, 212.5 )
	self:addElement( ChatClientChatEntryScrollViewContainer )
	self.ChatClientChatEntryScrollViewContainer = ChatClientChatEntryScrollViewContainer
	
	local FiltersButton = CoD.ChatClientFilterButton.new( f1_arg0, f1_arg1, 0.99, 0.99, -125, 0, 0.02, 0.02, 0, 25 )
	FiltersButton:setRGB(1, 0, 0)
	FiltersButton:setAlpha( 0 )

	self:addElement( FiltersButton )
	self.FiltersButton = FiltersButton
	
	self:mergeStateConditions( {
		{
			stateName = "Chatting",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	local f1_local6 = self
	local f1_local7 = self.subscribeToModel
	local f1_local8 = Engine[@"getmodelforcontroller"]( f1_arg1 )
	f1_local7( f1_local6, f1_local8["ChatGlobal.Event"], function ( f5_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f5_arg0:get(),
			modelName = "ChatGlobal.Event"
		} )
	end, false )
	emptyFocusable.id = "emptyFocusable"
	InputText.id = "InputText"
	ChatClientChatEntryScrollViewContainer.id = "ChatClientChatEntryScrollViewContainer"
	FiltersButton.id = "FiltersButton"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	f1_local7 = self
	CoD.PCWidgetUtility.PrepareChatVScrollWidget( self, f1_arg1, f1_arg0, self.ChatClientChatEntryScrollViewContainer )

	RushPrintInfo("ChatClient", "Called")
	return self
end

CoD.FrontendChatClient.__resetProperties = function ( f6_arg0 )
	f6_arg0.InputText:completeAnimation()
	f6_arg0.ChatClientChatEntryScrollViewContainer:completeAnimation()
	f6_arg0.emptyFocusable:completeAnimation()
	f6_arg0.InputText:setAlpha( 1 )
	f6_arg0.ChatClientChatEntryScrollViewContainer:setAlpha( 1 )
	f6_arg0.emptyFocusable:setAlpha( 1 )
end

CoD.FrontendChatClient.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 1 )
			f7_arg0.InputText:completeAnimation()
			f7_arg0.InputText:setAlpha( 1 )
			f7_arg0.clipFinished( f7_arg0.InputText )
		end
	},
	Chatting = {
		DefaultClip = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 3 )
			f8_arg0.emptyFocusable:completeAnimation()
			f8_arg0.emptyFocusable:setAlpha( 1 )
			f8_arg0.clipFinished( f8_arg0.emptyFocusable )
			f8_arg0.InputText:completeAnimation()
			f8_arg0.InputText:setAlpha( 1 )
			f8_arg0.clipFinished( f8_arg0.InputText )
			f8_arg0.ChatClientChatEntryScrollViewContainer:completeAnimation()
			f8_arg0.ChatClientChatEntryScrollViewContainer:setAlpha( 1 )
			f8_arg0.clipFinished( f8_arg0.ChatClientChatEntryScrollViewContainer )
		end
	}
}

CoD.FooterContainer_Frontend_Right = InheritFrom( LUI.UIElement )
CoD.FooterContainer_Frontend_Right.__defaultWidth = 1920
CoD.FooterContainer_Frontend_Right.__defaultHeight = 48
CoD.FooterContainer_Frontend_Right.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.FooterContainer_Frontend_Right )
	self.id = "FooterContainer_Frontend_Right"
	self.soundSet = "default"
	self.onlyChildrenFocusable = CoD.isPC
	self.anyChildUsesUpdateState = true
	local BackgroundPC = nil
	
	BackgroundPC = CoD.Footer_BG.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 1, 1, -54, 0 )
	BackgroundPC:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = nil
		if element.menuLoaded then
			f2_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f2_local0 = element.super:menuLoaded( event )
		end
		SizeToWidthOfScreen( element, f1_arg1 )
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	BackgroundPC:setRGB(1, 0, 0)
	self:addElement( BackgroundPC )
	self.BackgroundPC = BackgroundPC
	
	local f1_local2 = nil
	self.BackgroundConsole = LUI.UIElement.createFake()
	local f1_local3 = nil
	self.RightContainer = LUI.UIElement.createFake()
	local LeftContainerPC = nil
	
	LeftContainerPC = CoD.FooterButton_Frontend_PC_Left.new( f1_arg0, f1_arg1, 0.5, 0.5, -960, 960, 1, 1, -54, 0 )
	LeftContainerPC:linkToElementModel( self, nil, false, function ( model )
		LeftContainerPC:setModel( model, f1_arg1 )
	end )
	LeftContainerPC:setRGB(1, 0, 1)
	self:addElement( LeftContainerPC )
	self.LeftContainerPC = LeftContainerPC
	
	local RightContainerPC = nil
	
	RightContainerPC = CoD.FooterButton_Frontend_PC_Right.new( f1_arg0, f1_arg1, 0.5, 0.5, -960, 960, 1, 1, -54, 0 )
	RightContainerPC:linkToElementModel( self, nil, false, function ( model )
		RightContainerPC:setModel( model, f1_arg1 )
	end )
	RightContainerPC:setRGB(0, 0, 1)
	self:addElement( RightContainerPC )
	self.RightContainerPC = RightContainerPC
	
	local BackHold = CoD.FooterButton_BackHold.new( f1_arg0, f1_arg1, 0.5, 0.5, -120, 120, 1, 1, -48, 0 )
	BackHold:setAlpha( 0 )
	BackHold:linkToElementModel( self, "" .. Enum[@"luibutton"][@"lui_key_xbb_pscircle"], false, function ( model )
		BackHold:setModel( model, f1_arg1 )
	end )
	BackHold:setRGB(0, 1, 1)
	self:addElement( BackHold )
	self.BackHold = BackHold
	
	local f1_local7 = nil
	self.CenterContainer = LUI.UIElement.createFake()
	local f1_local8 = nil
	self.LeftContainer = LUI.UIElement.createFake()
	self.__on_menuOpened_self = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		local f6_local0 = self
		if IsPC() then
			CallCustomElementFunction_Self( self, "setPriority", 10 )
		end
	end
	
	f1_arg0:addMenuOpenedCallback( self.__on_menuOpened_self )
	if CoD.isPC then
		LeftContainerPC.id = "LeftContainerPC"
	end
	if CoD.isPC then
		RightContainerPC.id = "RightContainerPC"
	end
	if CoD.isPC then
		BackHold.id = "BackHold"
	end
	self.__defaultFocus = RightContainerPC
	self.__on_close_removeOverrides = function ()
		f1_arg0:removeMenuOpenedCallback( self.__on_menuOpened_self )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	local f1_local9 = self
	if IsPC() then
		CoD.PCUtility.SetForceMouseEventDispatch( self, true )
	end

	RushPrintInfo("Called", "FooterFront")

	if f1_arg0.ItemInfo ~= nill then
		RushPrintInfo("Called", "BGB Main Selector")
		f1_arg0:setRGB(1, 0, 1)
	end

	return self
end

CoD.FooterContainer_Frontend_Right.__onClose = function ( f8_arg0 )
	f8_arg0.__on_close_removeOverrides()
	f8_arg0.BackgroundPC:close()
	f8_arg0.BackgroundConsole:close()
	f8_arg0.RightContainer:close()
	f8_arg0.LeftContainerPC:close()
	f8_arg0.RightContainerPC:close()
	f8_arg0.BackHold:close()
	f8_arg0.CenterContainer:close()
	f8_arg0.LeftContainer:close()
end

CoD.DirectorGamemodeSelectionZM = InheritFrom( CoD.Menu )
LUI.createMenu.DirectorGamemodeSelectionZM = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "DirectorGamemodeSelectionZM", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.CreateGlobalModel( "ZMLobbyExclusions.focusedPlaylistID" )
	self:setClass( CoD.DirectorGamemodeSelectionZM )
	self.soundSet = "FrontendMain"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	
	local SceneBlur = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	SceneBlur:setRGB( 0, 0, 0 )
	SceneBlur:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_E2354BE557C4C7A" ) )
	SceneBlur:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( SceneBlur )
	self.SceneBlur = SceneBlur
	
	local BackgroundImage = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	BackgroundImage:setAlpha( 0 )
	BackgroundImage:setImage( RegisterImage( @"uie_fe_cp_background" ) )
	self:addElement( BackgroundImage )
	self.BackgroundImage = BackgroundImage
	
	local BGEnhancement = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	BGEnhancement:setRGB( 0, 0, 0 )
	BGEnhancement:setAlpha( 0.2 )
	self:addElement( BGEnhancement )
	self.BGEnhancement = BGEnhancement
	
	local NoiseTiledBacking = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	NoiseTiledBacking:setAlpha( 0 )
	NoiseTiledBacking:setRGB(0, 1, 1)
	NoiseTiledBacking:setImage( RegisterImage( @"uie_ui_menu_specialist_hub_repeat_bg" ) )
	NoiseTiledBacking:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_16CBE95C250C6D15" ) )
	NoiseTiledBacking:setShaderVector( 0, 0, 0, 0, 0 )
	NoiseTiledBacking:setupNineSliceShader( 196, 88 )
	self:addElement( NoiseTiledBacking )
	self.NoiseTiledBacking = NoiseTiledBacking
	
	local TiledPlusGrid = LUI.UIImage.new( 0.5, 0.5, -1095, 960, 0, 0, 0, 1080 )
	TiledPlusGrid:setAlpha( 0.05 )
	TiledPlusGrid:setRGB(0, 1, 1)
	TiledPlusGrid:setImage( RegisterImage( @"uie_ui_hud_vehicle_hellstorm_repeat_plusgrid" ) )
	TiledPlusGrid:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_67C9C02F608D0A75" ) )
	TiledPlusGrid:setShaderVector( 0, 0, 0, 0, 0 )
	TiledPlusGrid:setupNineSliceShader( 220, 220 )
	self:addElement( TiledPlusGrid )
	self.TiledPlusGrid = TiledPlusGrid
	
	local DirectorGamemodeSelectionZMInternal = CoD.DirectorGamemodeSelectionZMInternal.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -540, 540 )
	self:addElement( DirectorGamemodeSelectionZMInternal )
	self.DirectorGamemodeSelectionZMInternal = DirectorGamemodeSelectionZMInternal
	
	local FooterContainerFrontendRight = CoD.FooterContainer_Frontend_Right.new( f1_local1, f1_arg0, 0, 1, 0, 0, 1, 1, -48, 0 )
	FooterContainerFrontendRight:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = nil
		if element.menuLoaded then
			f2_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f2_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	self:addElement( FooterContainerFrontendRight )
	self.FooterContainerFrontendRight = FooterContainerFrontendRight
	
	local DirectorHeaderTabSafeArea = CoD.DirectorHeaderTabSafeArea.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 0, 0, 1080 )
	DirectorHeaderTabSafeArea.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( @"hash_74456C22914B29F9" ) )
	DirectorHeaderTabSafeArea.Tabs.customClasssList:setDataSource( "DirectorPlaylistGameTypeList" )
	DirectorHeaderTabSafeArea:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			DirectorHeaderTabSafeArea.CommonHeader.subtitle.subtitle:setText( Engine[@"hash_4F9F1239CFD921FE"]( f3_local0 ) )
		end
	end )
	DirectorHeaderTabSafeArea:registerEventHandler( "menu_loaded", function ( element, event )
		local f4_local0 = nil
		if element.menuLoaded then
			f4_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f4_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	DirectorHeaderTabSafeArea:setRGB(1, 0, 0)
	self:addElement( DirectorHeaderTabSafeArea )
	self.DirectorHeaderTabSafeArea = DirectorHeaderTabSafeArea
	
	self:mergeStateConditions( {
		{
			stateName = "Featured",
			condition = function ( menu, element, event )
				return CoD.ZombieUtility.FeaturedInfo()
			end
		},
		{
			stateName = "Classic",
			condition = function ( menu, element, event )
				return CoD.ZombieUtility.ClassicInfo()
			end
		},
		{
			stateName = "ZombieRush",
			condition = function ( menu, element, event )
				return CoD.ZombieUtility.ZombieRushInfo()
			end
		},
		{
			stateName = "TCM",
			condition = function ( menu, element, event )
				return CoD.ZombieUtility.TCMInfo()
			end
		},
		{
			stateName = "Trials",
			condition = function ( menu, element, event )
				return CoD.ZombieUtility.TrialsInfo()
			end
		},
		{
			stateName = "Tutorial",
			condition = function ( menu, element, event )
				return CoD.ZombieUtility.TutorialInfo()
			end
		}
	} )
	local f1_local10 = self
	local f1_local11 = self.subscribeToModel
	local f1_local12 = Engine[@"getglobalmodel"]()
	f1_local11( f1_local10, f1_local12["ZMLobbyExclusions.ZMPlaylistTab"], function ( f11_arg0 )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f11_arg0:get(),
			modelName = "ZMLobbyExclusions.ZMPlaylistTab"
		} )
	end, false )
	f1_local10 = self
	f1_local11 = self.subscribeToModel
	f1_local12 = Engine[@"getglobalmodel"]()
	f1_local11( f1_local10, f1_local12["ZMLobbyExclusions.ZMPlaylistTab"], function ( f12_arg0, f12_arg1 )
		CoD.Menu.UpdateButtonShownState( f12_arg1, f1_local1, f1_arg0, Enum[@"luibutton"][@"lui_key_start"] )
	end, false )
	self:appendEventHandler( "input_source_changed", function ( f13_arg0, f13_arg1 )
		f13_arg1.menu = f13_arg1.menu or f1_local1
		CoD.Menu.UpdateButtonShownState( f13_arg0, f1_local1, f1_arg0, Enum[@"luibutton"][@"lui_key_start"] )
	end )
	f1_local10 = self
	f1_local11 = self.subscribeToModel
	f1_local12 = Engine[@"getmodelforcontroller"]( f1_arg0 )
	f1_local11( f1_local10, f1_local12.LastInput, function ( f14_arg0, f14_arg1 )
		CoD.Menu.UpdateButtonShownState( f14_arg1, f1_local1, f1_arg0, Enum[@"luibutton"][@"lui_key_start"] )
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_xbb_pscircle"], nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xbb_pscircle"], @"menu/back", nil, nil )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"luibutton"][@"lui_key_start"], nil, function ( element, menu, controller, model )
		if CoD.ZombieUtility.TrialsInfo() and IsGamepad( controller ) then
			OpenOverlay( self, "DirectorZMTrialsInfo", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CoD.ZombieUtility.TrialsInfo() and IsGamepad( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_start"], @"hash_4AB419DD8BD872BA", nil, nil )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		CoD.DirectorUtility.UpdateChosenPlaylist( f1_arg0 )
		ClearMenuSavedState( f1_local1 )
	end )
	DirectorGamemodeSelectionZMInternal.id = "DirectorGamemodeSelectionZMInternal"
	FooterContainerFrontendRight:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		FooterContainerFrontendRight.id = "FooterContainerFrontendRight"
	end
	DirectorHeaderTabSafeArea.id = "DirectorHeaderTabSafeArea"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = DirectorGamemodeSelectionZMInternal
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	f1_local11 = self
	CoD.ZombieUtility.SetFocusedPlaylistIDToLobbyPlaylistID( f1_arg0 )
	CoD.ZombieUtility.SubscribeToZMPlaylistInfoModels( self, f1_arg0 )

	Engine[ @"PrintInfo" ](0, "^1LUA Debug: ZMMainSelection -> Called")

	return self
end

CoD.DirectorGamemodeSelectionZM.__onClose = function ( f20_arg0 )
	f20_arg0.DirectorGamemodeSelectionZMInternal:close()
	f20_arg0.FooterContainerFrontendRight:close()
	f20_arg0.DirectorHeaderTabSafeArea:close()
end


-- ZMSlelection
CoD.DirectorGamemodeSelectionZMInternal = InheritFrom( LUI.UIElement )
CoD.DirectorGamemodeSelectionZMInternal.__defaultWidth = 1920
CoD.DirectorGamemodeSelectionZMInternal.__defaultHeight = 1080
CoD.DirectorGamemodeSelectionZMInternal.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.DirectorGamemodeSelectionZMInternal )
	self.id = "DirectorGamemodeSelectionZMInternal"
	self.soundSet = "FrontendMain"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local DirectorInfoPanelZM = CoD.DirectorInfoPanelZM.new( f1_arg0, f1_arg1, 1, 1, -626, -86, 0, 0, 188, 944 )
	DirectorInfoPanelZM:subscribeToGlobalModel( f1_arg1, "DirectorZMPlaylistInfo", nil, function ( model )
		DirectorInfoPanelZM:setModel( model, f1_arg1 )
	end )
	DirectorInfoPanelZM:setRGB(1, 0, 1)
	self:addElement( DirectorInfoPanelZM )
	self.DirectorInfoPanelZM = DirectorInfoPanelZM
	
	local Maps = LUI.UIList.new( f1_arg0, f1_arg1, 20, 0, nil, false, false, false, false )
	Maps:setLeftRight( 0, 0, 97, 1141 )
	Maps:setTopBottom( 0, 0, 282, 882 )
	Maps:setAlpha( 0 )
	Maps:setRGB(0, 1, 1)
	Maps:setWidgetType( CoD.DirectorZMMapSelectItem )
	Maps:setHorizontalCount( 4 )
	Maps:setVerticalCount( 5 )
	Maps:setSpacing( 20 )
	Maps:setAlignment( Enum[@"luialignment"][@"lui_alignment_left"] )
	Maps:setVerticalCounter( CoD.verticalCounter )
	Maps:setDataSource( "DirectorPlaylistMapList" )
	Maps:appendEventHandler( "on_session_start", function ( f3_arg0, f3_arg1 )
		f3_arg1.menu = f3_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f3_arg0, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	end )
	Maps:appendEventHandler( "on_session_end", function ( f4_arg0, f4_arg1 )
		f4_arg1.menu = f4_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f4_arg0, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	end )
	local Tutorial = Maps
	local Playlists = Maps.subscribeToModel
	local DottedDivider = Engine[@"getglobalmodel"]()
	Playlists( Tutorial, DottedDivider["lobbyRoot.lobbyNav"], function ( f5_arg0, f5_arg1 )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	end, false )
	Tutorial = Maps
	Playlists = Maps.subscribeToModel
	DottedDivider = Engine[@"getglobalmodel"]()
	Playlists( Tutorial, DottedDivider["lobbyRoot.gameClient.update"], function ( f6_arg0, f6_arg1 )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	end, false )
	Tutorial = Maps
	Playlists = Maps.subscribeToModel
	DottedDivider = Engine[@"getglobalmodel"]()
	Playlists( Tutorial, DottedDivider["lobbyRoot.privateClient.update"], function ( f7_arg0, f7_arg1 )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	end, false )
	Maps:linkToElementModel( Maps, "locked", true, function ( model, f8_arg1 )
		CoD.Menu.UpdateButtonShownState( f8_arg1, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	end )
	Maps:linkToElementModel( Maps, "lockState", true, function ( model, f9_arg1 )
		CoD.Menu.UpdateButtonShownState( f9_arg1, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	end )
	Maps:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f10_local0 = nil
		CoD.ZombieUtility.UpdateFocusedPlaylistID( f1_arg1, element )
		return f10_local0
	end )
	Maps:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
		return f11_local0
	end )
	f1_arg0:AddButtonCallbackFunction( Maps, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"], "ui_confirm", function ( element, menu, controller, model )
		if IsLobbyHostOfCurrentMenu() and not IsElementPropertyValue( element, "purchasable", true ) and not CoD.ModelUtility.IsSelfModelValueTrue( element, controller, "locked" ) then
			CoD.DirectorUtility.SetPlaylist( controller, element )
			PlaySoundSetSound( self, "action" )
			GoBack( self, controller )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, controller, "lockState", Enum[@"hash_4DACBB5C5F26BCD9"][@"hash_19B632F6362EA1BE"] ) then
			CoD.StoreUtility.OpenStoreToDLCPack( self, element, controller, "DirectorFindGame", menu )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, controller, "lockState", Enum[@"hash_4DACBB5C5F26BCD9"][@"hash_4BDEB566326AC98"] ) then
			CoD.StoreUtility.OpenStoreToDLCPack( self, element, controller, "DirectorFindGame", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsLobbyHostOfCurrentMenu() and not IsElementPropertyValue( element, "purchasable", true ) and not CoD.ModelUtility.IsSelfModelValueTrue( element, controller, "locked" ) then
			CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"menu/select", nil, "ui_confirm" )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, controller, "lockState", Enum[@"hash_4DACBB5C5F26BCD9"][@"hash_19B632F6362EA1BE"] ) then
			CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"menu/select", nil, "ui_confirm" )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, controller, "lockState", Enum[@"hash_4DACBB5C5F26BCD9"][@"hash_4BDEB566326AC98"] ) then
			CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"menu/select", nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	Maps:subscribeToGlobalModel( f1_arg1, "ZMLobbyExclusions", "ZMPlaylistTab", function ( model )
		CoD.ZombieUtility.UpdateFocusedPlaylistID( f1_arg1, Maps )
	end )
	self:addElement( Maps )
	self.Maps = Maps
	
	Playlists = LUI.UIList.new( f1_arg0, f1_arg1, 20, 0, nil, false, false, false, false )
	Playlists:setLeftRight( 0, 0, 96, 1252 )
	Playlists:setTopBottom( 0, 0, 188, 1232 )
	Playlists:setAlpha( 0 )
	Playlists:setRGB(0, 1, 1)
	Playlists:setWidgetType( CoD.DirectorZMPlaylistSelectItem )
	Playlists:setHorizontalCount( 3 )
	Playlists:setVerticalCount( 4 )
	Playlists:setSpacing( 20 )
	Playlists:setAlignment( Enum[@"luialignment"][@"lui_alignment_left"] )
	Playlists:setVerticalCounter( CoD.verticalCounter )
	Playlists:setDataSource( "DirectorPlaylistMapList" )
	Playlists:appendEventHandler( "on_session_start", function ( f15_arg0, f15_arg1 )
		f15_arg1.menu = f15_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f15_arg0, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	end )
	Playlists:appendEventHandler( "on_session_end", function ( f16_arg0, f16_arg1 )
		f16_arg1.menu = f16_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f16_arg0, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	end )
	DottedDivider = Playlists
	Tutorial = Playlists.subscribeToModel
	local DifficultyList = Engine[@"getglobalmodel"]()
	Tutorial( DottedDivider, DifficultyList["lobbyRoot.lobbyNav"], function ( f17_arg0, f17_arg1 )
		CoD.Menu.UpdateButtonShownState( f17_arg1, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	end, false )
	DottedDivider = Playlists
	Tutorial = Playlists.subscribeToModel
	DifficultyList = Engine[@"getglobalmodel"]()
	Tutorial( DottedDivider, DifficultyList["lobbyRoot.gameClient.update"], function ( f18_arg0, f18_arg1 )
		CoD.Menu.UpdateButtonShownState( f18_arg1, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	end, false )
	DottedDivider = Playlists
	Tutorial = Playlists.subscribeToModel
	DifficultyList = Engine[@"getglobalmodel"]()
	Tutorial( DottedDivider, DifficultyList["lobbyRoot.privateClient.update"], function ( f19_arg0, f19_arg1 )
		CoD.Menu.UpdateButtonShownState( f19_arg1, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	end, false )
	Playlists:linkToElementModel( Playlists, "locked", true, function ( model, f20_arg1 )
		CoD.Menu.UpdateButtonShownState( f20_arg1, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	end )
	Playlists:linkToElementModel( Playlists, "lockState", true, function ( model, f21_arg1 )
		CoD.Menu.UpdateButtonShownState( f21_arg1, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	end )
	Playlists:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f22_local0 = nil
		CoD.ZombieUtility.UpdateFocusedPlaylistID( f1_arg1, element )
		return f22_local0
	end )
	Playlists:registerEventHandler( "gain_focus", function ( element, event )
		local f23_local0 = nil
		if element.gainFocus then
			f23_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f23_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
		return f23_local0
	end )
	f1_arg0:AddButtonCallbackFunction( Playlists, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"], "ui_confirm", function ( element, menu, controller, model )
		if IsLobbyHostOfCurrentMenu() and not IsElementPropertyValue( element, "purchasable", true ) and not CoD.ModelUtility.IsSelfModelValueTrue( element, controller, "locked" ) then
			CoD.DirectorUtility.SetPlaylist( controller, element )
			PlaySoundSetSound( self, "action" )
			GoBack( self, controller )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, controller, "lockState", Enum[@"hash_4DACBB5C5F26BCD9"][@"hash_19B632F6362EA1BE"] ) then
			CoD.StoreUtility.OpenStoreToDLCPack( self, element, controller, "DirectorFindGame", menu )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, controller, "lockState", Enum[@"hash_4DACBB5C5F26BCD9"][@"hash_4BDEB566326AC98"] ) then
			CoD.StoreUtility.OpenStoreToDLCPack( self, element, controller, "DirectorFindGame", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsLobbyHostOfCurrentMenu() and not IsElementPropertyValue( element, "purchasable", true ) and not CoD.ModelUtility.IsSelfModelValueTrue( element, controller, "locked" ) then
			CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"menu/select", nil, "ui_confirm" )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, controller, "lockState", Enum[@"hash_4DACBB5C5F26BCD9"][@"hash_19B632F6362EA1BE"] ) then
			CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"menu/select", nil, "ui_confirm" )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, controller, "lockState", Enum[@"hash_4DACBB5C5F26BCD9"][@"hash_4BDEB566326AC98"] ) then
			CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"menu/select", nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	Playlists:subscribeToGlobalModel( f1_arg1, "ZMLobbyExclusions", "ZMPlaylistTab", function ( model )
		CoD.ZombieUtility.UpdateFocusedPlaylistID( f1_arg1, Playlists )
	end )
	self:addElement( Playlists )
	self.Playlists = Playlists
	
	Tutorial = LUI.UIList.new( f1_arg0, f1_arg1, 20, 0, nil, false, false, false, false )
	Tutorial:setLeftRight( 0, 0, 97, 1141 )
	Tutorial:setTopBottom( 0, 0, 188, 664 )
	Tutorial:setAlpha( 0 )
	Tutorial:setRGB(0, 1, 1)
	Tutorial:setWidgetType( CoD.DirectorZMTutorialSelectItem )
	Tutorial:setHorizontalCount( 2 )
	Tutorial:setSpacing( 20 )
	Tutorial:setAlignment( Enum[@"luialignment"][@"lui_alignment_left"] )
	Tutorial:setVerticalCounter( CoD.verticalCounter )
	Tutorial:setDataSource( "DirectorPlaylistMapList" )
	Tutorial:appendEventHandler( "on_session_start", function ( f27_arg0, f27_arg1 )
		f27_arg1.menu = f27_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f27_arg0, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	end )
	Tutorial:appendEventHandler( "on_session_end", function ( f28_arg0, f28_arg1 )
		f28_arg1.menu = f28_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f28_arg0, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	end )
	DifficultyList = Tutorial
	DottedDivider = Tutorial.subscribeToModel
	local f1_local7 = Engine[@"getglobalmodel"]()
	DottedDivider( DifficultyList, f1_local7["lobbyRoot.lobbyNav"], function ( f29_arg0, f29_arg1 )
		CoD.Menu.UpdateButtonShownState( f29_arg1, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	end, false )
	DifficultyList = Tutorial
	DottedDivider = Tutorial.subscribeToModel
	f1_local7 = Engine[@"getglobalmodel"]()
	DottedDivider( DifficultyList, f1_local7["lobbyRoot.gameClient.update"], function ( f30_arg0, f30_arg1 )
		CoD.Menu.UpdateButtonShownState( f30_arg1, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	end, false )
	DifficultyList = Tutorial
	DottedDivider = Tutorial.subscribeToModel
	f1_local7 = Engine[@"getglobalmodel"]()
	DottedDivider( DifficultyList, f1_local7["lobbyRoot.privateClient.update"], function ( f31_arg0, f31_arg1 )
		CoD.Menu.UpdateButtonShownState( f31_arg1, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
	end, false )
	Tutorial:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f32_local0 = nil
		CoD.ZombieUtility.UpdateFocusedPlaylistID( f1_arg1, element )
		return f32_local0
	end )
	Tutorial:registerEventHandler( "gain_focus", function ( element, event )
		local f33_local0 = nil
		if element.gainFocus then
			f33_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f33_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
		return f33_local0
	end )
	f1_arg0:AddButtonCallbackFunction( Tutorial, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"], "ui_confirm", function ( element, menu, controller, model )
		if IsLobbyHostOfCurrentMenu() and not IsElementPropertyValue( element, "purchasable", true ) then
			CoD.DirectorUtility.SetPlaylist( controller, element )
			PlaySoundSetSound( self, "action" )
			GoBack( self, controller )
			return true
		elseif IsLobbyHostOfCurrentMenu() then
			OpenOverlay( self, "Store", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsLobbyHostOfCurrentMenu() and not IsElementPropertyValue( element, "purchasable", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"menu/select", nil, "ui_confirm" )
			return true
		elseif IsLobbyHostOfCurrentMenu() then
			CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"menu/select", nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	Tutorial:subscribeToGlobalModel( f1_arg1, "ZMLobbyExclusions", "ZMPlaylistTab", function ( model )
		CoD.ZombieUtility.UpdateFocusedPlaylistID( f1_arg1, Tutorial )
	end )
	self:addElement( Tutorial )
	self.Tutorial = Tutorial
	
	DottedDivider = LUI.UIImage.new( 0, 0, 615, 619, 0, 0, -261, 783 )
	DottedDivider:setAlpha( 0 )
	DottedDivider:setZRot( 90 )
	DottedDivider:setImage( RegisterImage( @"hash_C49B0C8991A541F" ) )
	DottedDivider:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_67C9C02F608D0A75" ) )
	DottedDivider:setRGB(0, 1, 1)
	DottedDivider:setShaderVector( 0, 0, 0, 0, 0 )
	DottedDivider:setupNineSliceShader( 4, 8 )
	self:addElement( DottedDivider )
	self.DottedDivider = DottedDivider
	
	DifficultyList = LUI.UIList.new( f1_arg0, f1_arg1, 20, 0, nil, false, false, false, false )
	DifficultyList:setLeftRight( 0, 0, 97, 1141 )
	DifficultyList:setTopBottom( 0, 0, 189, 241 )
	DifficultyList:setAlpha( 0 )
	DifficultyList:setWidgetType( CoD.ZMDifficultySelectButton )
	DifficultyList:setHorizontalCount( 4 )
	DifficultyList:setSpacing( 20 )
	DifficultyList:setAlignment( Enum[@"luialignment"][@"lui_alignment_left"] )
	DifficultyList:setDataSource( "ZMDifficultyList" )
	DifficultyList:registerEventHandler( "gain_focus", function ( element, event )
		local f37_local0 = nil
		if element.gainFocus then
			f37_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f37_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"] )
		return f37_local0
	end )
	f1_arg0:AddButtonCallbackFunction( DifficultyList, f1_arg1, Enum[@"luibutton"][@"lui_key_xba_pscross"], "ui_confirm", function ( element, menu, controller, model )
		CoD.ZombieUtility.SelectDifficulty( element, controller )
		PlaySoundAlias( "uin_toggle_generic" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum[@"luibutton"][@"lui_key_xba_pscross"], @"hash_3AC3B80C833B60E1", nil, "ui_confirm" )
		return true
	end, false )
	self:addElement( DifficultyList )
	self.DifficultyList = DifficultyList
	
	self:mergeStateConditions( {
		{
			stateName = "Featured",
			condition = function ( menu, element, event )
				return CoD.ZombieUtility.FeaturedInfo()
			end
		},
		{
			stateName = "Classic",
			condition = function ( menu, element, event )
				return CoD.ZombieUtility.ClassicInfo()
			end
		},
		{
			stateName = "ZombieRush",
			condition = function ( menu, element, event )
				return CoD.ZombieUtility.ZombieRushInfo()
			end
		},
		{
			stateName = "TCM",
			condition = function ( menu, element, event )
				return CoD.ZombieUtility.TCMInfo()
			end
		},
		{
			stateName = "Trials",
			condition = function ( menu, element, event )
				return CoD.ZombieUtility.TrialsInfo()
			end
		},
		{
			stateName = "Tutorial",
			condition = function ( menu, element, event )
				return CoD.ZombieUtility.TutorialInfo()
			end
		}
	} )
	local f1_local8 = self
	f1_local7 = self.subscribeToModel
	local f1_local9 = Engine[@"getglobalmodel"]()
	f1_local7( f1_local8, f1_local9["ZMLobbyExclusions.ZMPlaylistTab"], function ( f46_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f46_arg0:get(),
			modelName = "ZMLobbyExclusions.ZMPlaylistTab"
		} )
	end, false )
	self:registerEventHandler( "occlusion_change", function ( self, event )
		local f47_local0 = nil
		if self.OcclusionChange then
			f47_local0 = self:OcclusionChange( event )
		elseif self.super.OcclusionChange then
			f47_local0 = self.super:OcclusionChange( event )
		end
		if CoD.ZombieUtility.TutorialInfo() then
			CoD.FreeCursorUtility.GiveFocusToElementsDefaultFocus( f1_arg0, self.Tutorial, f1_arg1 )
		elseif CoD.ZombieUtility.FeaturedInfo() then
			CoD.FreeCursorUtility.GiveFocusToElementsDefaultFocus( f1_arg0, self.Playlists, f1_arg1 )
		else
			CoD.FreeCursorUtility.GiveFocusToElementsDefaultFocus( f1_arg0, self.Maps, f1_arg1 )
		end
		if not f47_local0 then
			f47_local0 = self:dispatchEventToChildren( event )
		end
		return f47_local0
	end )
	self:subscribeToGlobalModel( f1_arg1, "GlobalModel", "ZMLobbyExclusions.ZMPlaylistTab", function ( model )
		local f48_local0 = self
		if CoD.ZombieUtility.FeaturedInfo() then
			CoD.FreeCursorUtility.GiveFocusToElementsDefaultFocus( f1_arg0, self.Playlists, f1_arg1 )
		elseif CoD.ZombieUtility.TutorialInfo() then
			CoD.FreeCursorUtility.GiveFocusToElementsDefaultFocus( f1_arg0, self.Tutorial, f1_arg1 )
		else
			CoD.FreeCursorUtility.GiveFocusToElementsDefaultFocus( f1_arg0, self.Maps, f1_arg1 )
		end
	end )
	Maps.id = "Maps"
	Playlists.id = "Playlists"
	Tutorial.id = "Tutorial"
	DifficultyList.id = "DifficultyList"
	self.__defaultFocus = Playlists
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end

      --self:setRGB(0, 1, 1)
      --f1_arg0:setRGB(0, 1, 0) -- needs changes

      Engine[ @"PrintInfo" ](0, "^1LUA Debug: ZMSelection -> Called")
	return self
end

CoD.DirectorGamemodeSelectionZMInternal.__resetProperties = function ( f49_arg0 )
	f49_arg0.Playlists:completeAnimation()
	f49_arg0.Maps:completeAnimation()
	f49_arg0.DifficultyList:completeAnimation()
	f49_arg0.DottedDivider:completeAnimation()
	f49_arg0.Tutorial:completeAnimation()
	f49_arg0.Playlists:setAlpha( 0 )
	f49_arg0.Maps:setAlpha( 0 )
	f49_arg0.DifficultyList:setAlpha( 0 )
	f49_arg0.DottedDivider:setAlpha( 0 )
	f49_arg0.Tutorial:setAlpha( 0 )
end

CoD.DirectorGamemodeSelectionZMInternal.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f50_arg0, f50_arg1 )
			f50_arg0:__resetProperties()
			f50_arg0:setupElementClipCounter( 0 )
		end
	},
	Featured = {
		DefaultClip = function ( f51_arg0, f51_arg1 )
			f51_arg0:__resetProperties()
			f51_arg0:setupElementClipCounter( 1 )
			f51_arg0.Playlists:completeAnimation()
			f51_arg0.Playlists:setAlpha( 1 )
			f51_arg0.clipFinished( f51_arg0.Playlists )
		end
	},
	Classic = {
		DefaultClip = function ( f52_arg0, f52_arg1 )
			f52_arg0:__resetProperties()
			f52_arg0:setupElementClipCounter( 3 )
			f52_arg0.Maps:completeAnimation()
			f52_arg0.Maps:setAlpha( 1 )
			f52_arg0.clipFinished( f52_arg0.Maps )
			f52_arg0.DottedDivider:completeAnimation()
			f52_arg0.DottedDivider:setAlpha( 0.15 )
			f52_arg0.clipFinished( f52_arg0.DottedDivider )
			f52_arg0.DifficultyList:completeAnimation()
			f52_arg0.DifficultyList:setAlpha( 1 )
			f52_arg0.clipFinished( f52_arg0.DifficultyList )
		end
	},
	ZombieRush = {
		DefaultClip = function ( f53_arg0, f53_arg1 )
			f53_arg0:__resetProperties()
			f53_arg0:setupElementClipCounter( 1 )
			f53_arg0.Maps:completeAnimation()
			f53_arg0.Maps:setAlpha( 1 )
			f53_arg0.clipFinished( f53_arg0.Maps )
		end
	},
	TCM = {
		DefaultClip = function ( f54_arg0, f54_arg1 )
			f54_arg0:__resetProperties()
			f54_arg0:setupElementClipCounter( 1 )
			f54_arg0.Maps:completeAnimation()
			f54_arg0.Maps:setAlpha( 1 )
			f54_arg0.clipFinished( f54_arg0.Maps )
		end
	},
	Trials = {
		DefaultClip = function ( f55_arg0, f55_arg1 )
			f55_arg0:__resetProperties()
			f55_arg0:setupElementClipCounter( 1 )
			f55_arg0.Maps:completeAnimation()
			f55_arg0.Maps:setAlpha( 1 )
			f55_arg0.clipFinished( f55_arg0.Maps )
		end
	},
	Tutorial = {
		DefaultClip = function ( f56_arg0, f56_arg1 )
			f56_arg0:__resetProperties()
			f56_arg0:setupElementClipCounter( 2 )
			f56_arg0.Playlists:completeAnimation()
			f56_arg0.Playlists:setAlpha( 0 )
			f56_arg0.clipFinished( f56_arg0.Playlists )
			f56_arg0.Tutorial:completeAnimation()
			f56_arg0.Tutorial:setAlpha( 1 )
			f56_arg0.clipFinished( f56_arg0.Tutorial )
		end
	}
}

CoD.DirectorGamemodeSelectionZMInternal.__onClose = function ( f57_arg0 )
	f57_arg0.DirectorInfoPanelZM:close()
	f57_arg0.Maps:close()
	f57_arg0.Playlists:close()
	f57_arg0.Tutorial:close()
	f57_arg0.DifficultyList:close()
end


-- ZMDifficulty
CoD.ZMDifficultySelectButton = InheritFrom( LUI.UIElement )
CoD.ZMDifficultySelectButton.__defaultWidth = 246
CoD.ZMDifficultySelectButton.__defaultHeight = 52
CoD.ZMDifficultySelectButton.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZMDifficultySelectButton )
	self.id = "ZMDifficultySelectButton"
	self.soundSet = "FrontendMain"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local DifficultyList = CoD.ZMButtonDifficultyInternal.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 1, 0, 0 )
	DifficultyList.LeaderActivityText:setAlpha( 0 )
	DifficultyList.LeaderActivityText:setText( "" )
	DifficultyList.Header:setAlpha( 0 )
	DifficultyList.Header:setText( LocalizeToUpperString( @"hash_0" ) )
	DifficultyList.MiddleText:setAlpha( 0 )
	DifficultyList.MiddleText:setText( LocalizeToUpperString( @"hash_0" ) )
	DifficultyList:linkToElementModel( self, "difficultyImage", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			DifficultyList.ImageNotFocus:setImage( RegisterImage( f2_local0 ) )
		end
	end )
	DifficultyList:linkToElementModel( self, "difficultyImage", true, function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			DifficultyList.ImageFocus:setImage( RegisterImage( f3_local0 ) )
		end
	end )
	DifficultyList:setRGB(1, 1, 0)
	self:addElement( DifficultyList )
	self.DifficultyList = DifficultyList
	
	local DifficultyImage = LUI.UIFixedAspectRatioImage.new( 0, 0, 6, 46, 0.5, 0.5, -20, 20 )
	DifficultyImage:linkToElementModel( self, "difficultyImage", true, function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			DifficultyImage:setImage( RegisterImage( f4_local0 ) )
		end
	end )
	DifficultyImage:setRGB(1, 0, 0)
	self:addElement( DifficultyImage )
	self.DifficultyImage = DifficultyImage
	
	local DifficultySubText = LUI.UIText.new( 0, 0, 5, 197, 1, 1, -19, -3 )
	DifficultySubText:setRGB( 1, 0, 1 )
	DifficultySubText:setTTF( "skorzhen" )
	DifficultySubText:setRGB(1, 0, 1)
	DifficultySubText:setLetterSpacing( 2 )
	DifficultySubText:setAlignment( Enum[@"luialignment"][@"lui_alignment_left"] )
	DifficultySubText:setAlignment( Enum[@"luialignment"][@"lui_alignment_top"] )
	DifficultySubText:linkToElementModel( self, "difficultySubText", true, function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			DifficultySubText:setText( Engine[@"hash_4F9F1239CFD921FE"]( f5_local0 ) )
		end
	end )
	self:addElement( DifficultySubText )
	self.DifficultySubText = DifficultySubText
	
	local DifficultyText = LUI.UIText.new( 1, 1, -189, -10, 0.5, 0.5, -9, 13 )
	DifficultyText:setRGB( 1, 0, 1 )
	DifficultyText:setTTF( "skorzhen" )
	DifficultyText:setRGB(1, 0, 1)
	DifficultyText:setLetterSpacing( 2 )
	DifficultyText:setAlignment( Enum[@"luialignment"][@"lui_alignment_center"] )
	DifficultyText:setAlignment( Enum[@"luialignment"][@"lui_alignment_top"] )
	DifficultyText:linkToElementModel( self, "difficultyText", true, function ( model )
		local f6_local0 = model:get()
		if f6_local0 ~= nil then
			DifficultyText:setText( LocalizeToUpperString( f6_local0 ) )
		end
	end )
	self:addElement( DifficultyText )
	self.DifficultyText = DifficultyText
	
	local EquippedMarkerTick = LUI.UIImage.new( 1, 1, -151, 9, 0, 0, -17, 143 )
	EquippedMarkerTick:setAlpha( 0 )
	EquippedMarkerTick:setRGB(1, 0, 0)
	EquippedMarkerTick:setZoom( 4 )
	EquippedMarkerTick:setImage( RegisterImage( @"uie_ui_menu_zombies_cac_elixir_slot_check" ) )
	self:addElement( EquippedMarkerTick )
	self.EquippedMarkerTick = EquippedMarkerTick
	
	self:mergeStateConditions( {
		{
			stateName = "Selected",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsGlobalModelValueEqualToSelfModelValue( self, "ZMLobbyExclusions.ZMPrivateDifficulty", "difficultyID" )
			end
		}
	} )
	local f1_local6 = self
	local f1_local7 = self.subscribeToModel
	local f1_local8 = Engine[@"getglobalmodel"]()
	f1_local7( f1_local6, f1_local8["ZMLobbyExclusions.ZMPrivateDifficulty"], function ( f8_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f8_arg0:get(),
			modelName = "ZMLobbyExclusions.ZMPrivateDifficulty"
		} )
	end, false )
	self:linkToElementModel( self, "difficultyID", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "difficultyID"
		} )
	end )
	DifficultyList.id = "DifficultyList"
	self.__defaultFocus = DifficultyList
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end

	return self
end

 CoD.ZMDifficultySelectButton.__resetProperties = function ( f10_arg0 )
	f10_arg0.DifficultyText:completeAnimation()
	f10_arg0.DifficultyList:completeAnimation()
	f10_arg0.DifficultyImage:completeAnimation()
	f10_arg0.DifficultySubText:completeAnimation()
	f10_arg0.EquippedMarkerTick:completeAnimation()
	f10_arg0.DifficultyText:setRGB( 1, 0, 1 )
	f10_arg0.DifficultyText:setScale( 1, 1 )
	f10_arg0.DifficultyList:setScale( 1, 1 )
	f10_arg0.DifficultyImage:setLeftRight( 0, 0, 6, 46 )
	f10_arg0.DifficultyImage:setScale( 1, 1 )
	f10_arg0.DifficultySubText:setLeftRight( 0, 0, 5, 197 )
	f10_arg0.DifficultySubText:setTopBottom( 1, 1, -19, -3 )
	f10_arg0.DifficultySubText:setRGB( 1, 0, 1 )
	f10_arg0.EquippedMarkerTick:setLeftRight( 1, 1, -151, 9 )
	f10_arg0.EquippedMarkerTick:setTopBottom( 0, 0, -17, 143 )
	f10_arg0.EquippedMarkerTick:setAlpha( 0 )
end

CoD.ZMDifficultySelectButton.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f11_arg0, f11_arg1 )
			f11_arg0:__resetProperties()
			f11_arg0:setupElementClipCounter( 1 )
			f11_arg0.DifficultyText:completeAnimation()
			f11_arg0.DifficultyText:setRGB( 0.5, 0, 0.5 )
			f11_arg0.clipFinished( f11_arg0.DifficultyText )
		end,
		ChildFocus = function ( f12_arg0, f12_arg1 )
			f12_arg0:__resetProperties()
			f12_arg0:setupElementClipCounter( 4 )
			f12_arg0.DifficultyList:completeAnimation()
			f12_arg0.DifficultyList:setScale( 1.05, 1.05 )
			f12_arg0.clipFinished( f12_arg0.DifficultyList )
			f12_arg0.DifficultyImage:completeAnimation()
			f12_arg0.DifficultyImage:setLeftRight( 0, 0, 1, 41 )
			f12_arg0.DifficultyImage:setScale( 1.05, 1.05 )
			f12_arg0.clipFinished( f12_arg0.DifficultyImage )
			f12_arg0.DifficultySubText:completeAnimation()
			f12_arg0.DifficultySubText:setLeftRight( 0, 0, 0, 192 )
			f12_arg0.DifficultySubText:setTopBottom( 1, 1, -17, -1 )
			f12_arg0.clipFinished( f12_arg0.DifficultySubText )
			f12_arg0.DifficultyText:completeAnimation()
			f12_arg0.DifficultyText:setRGB(1, 0, 1)
			f12_arg0.DifficultyText:setScale( 1.05, 1.05 )
			f12_arg0.clipFinished( f12_arg0.DifficultyText )
		end,
		GainChildFocus = function ( f13_arg0, f13_arg1 )
			f13_arg0:__resetProperties()
			f13_arg0:setupElementClipCounter( 4 )
			local f13_local0 = function ( f14_arg0 )
				f13_arg0.DifficultyList:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_in"] )
				f13_arg0.DifficultyList:setScale( 1.05, 1.05 )
				f13_arg0.DifficultyList:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.DifficultyList:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
			end
			
			f13_arg0.DifficultyList:completeAnimation()
			f13_arg0.DifficultyList:setScale( 1, 1 )
			f13_local0( f13_arg0.DifficultyList )
			local f13_local1 = function ( f15_arg0 )
				f13_arg0.DifficultyImage:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_in"] )
				f13_arg0.DifficultyImage:setLeftRight( 0, 0, 1, 41 )
				f13_arg0.DifficultyImage:setScale( 1.05, 1.05 )
				f13_arg0.DifficultyImage:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.DifficultyImage:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
			end
			
			f13_arg0.DifficultyImage:completeAnimation()
			f13_arg0.DifficultyImage:setLeftRight( 0, 0, 6, 46 )
			f13_arg0.DifficultyImage:setScale( 1, 1 )
			f13_local1( f13_arg0.DifficultyImage )
			local f13_local2 = function ( f16_arg0 )
				f13_arg0.DifficultySubText:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_in"] )
				f13_arg0.DifficultySubText:setLeftRight( 0, 0, 0, 192 )
				f13_arg0.DifficultySubText:setTopBottom( 1, 1, -17, -1 )
				f13_arg0.DifficultySubText:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.DifficultySubText:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
			end
			
			f13_arg0.DifficultySubText:completeAnimation()
			f13_arg0.DifficultySubText:setLeftRight( 0, 0, 5, 197 )
			f13_arg0.DifficultySubText:setTopBottom( 1, 1, -19, -3 )
			f13_local2( f13_arg0.DifficultySubText )
			local f13_local3 = function ( f17_arg0 )
				f13_arg0.DifficultyText:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_in"] )
				f13_arg0.DifficultyText:setRGB(1, 0, 1)
				f13_arg0.DifficultyText:setScale( 1.05, 1.05 )
				f13_arg0.DifficultyText:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.DifficultyText:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
			end
			
			f13_arg0.DifficultyText:completeAnimation()
			f13_arg0.DifficultyText:setRGB( 0.5, 0, 0.5 )
			f13_arg0.DifficultyText:setScale( 1, 1 )
			f13_local3( f13_arg0.DifficultyText )
		end,
		LoseChildFocus = function ( f18_arg0, f18_arg1 )
			f18_arg0:__resetProperties()
			f18_arg0:setupElementClipCounter( 4 )
			local f18_local0 = function ( f19_arg0 )
				f18_arg0.DifficultyList:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_out"] )
				f18_arg0.DifficultyList:setScale( 1, 1 )
				f18_arg0.DifficultyList:registerEventHandler( "interrupted_keyframe", f18_arg0.clipInterrupted )
				f18_arg0.DifficultyList:registerEventHandler( "transition_complete_keyframe", f18_arg0.clipFinished )
			end
			
			f18_arg0.DifficultyList:completeAnimation()
			f18_arg0.DifficultyList:setScale( 1.05, 1.05 )
			f18_local0( f18_arg0.DifficultyList )
			local f18_local1 = function ( f20_arg0 )
				f18_arg0.DifficultyImage:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_out"] )
				f18_arg0.DifficultyImage:setLeftRight( 0, 0, 6, 46 )
				f18_arg0.DifficultyImage:setScale( 1, 1 )
				f18_arg0.DifficultyImage:registerEventHandler( "interrupted_keyframe", f18_arg0.clipInterrupted )
				f18_arg0.DifficultyImage:registerEventHandler( "transition_complete_keyframe", f18_arg0.clipFinished )
			end
			
			f18_arg0.DifficultyImage:completeAnimation()
			f18_arg0.DifficultyImage:setLeftRight( 0, 0, 1, 41 )
			f18_arg0.DifficultyImage:setScale( 1.05, 1.05 )
			f18_local1( f18_arg0.DifficultyImage )
			local f18_local2 = function ( f21_arg0 )
				f18_arg0.DifficultySubText:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_out"] )
				f18_arg0.DifficultySubText:setLeftRight( 0, 0, 5, 197 )
				f18_arg0.DifficultySubText:setTopBottom( 1, 1, -19, -3 )
				f18_arg0.DifficultySubText:registerEventHandler( "interrupted_keyframe", f18_arg0.clipInterrupted )
				f18_arg0.DifficultySubText:registerEventHandler( "transition_complete_keyframe", f18_arg0.clipFinished )
			end
			
			f18_arg0.DifficultySubText:completeAnimation()
			f18_arg0.DifficultySubText:setLeftRight( 0, 0, 0, 192 )
			f18_arg0.DifficultySubText:setTopBottom( 1, 1, -17, -1 )
			f18_local2( f18_arg0.DifficultySubText )
			local f18_local3 = function ( f22_arg0 )
				f18_arg0.DifficultyText:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_out"] )
				f18_arg0.DifficultyText:setRGB( 0.5, 0, 0.5 )
				f18_arg0.DifficultyText:setScale( 1, 1 )
				f18_arg0.DifficultyText:registerEventHandler( "interrupted_keyframe", f18_arg0.clipInterrupted )
				f18_arg0.DifficultyText:registerEventHandler( "transition_complete_keyframe", f18_arg0.clipFinished )
			end
			
			f18_arg0.DifficultyText:completeAnimation()
			f18_arg0.DifficultyText:setRGB(1, 0, 1)
			f18_arg0.DifficultyText:setScale( 1.05, 1.05 )
			f18_local3( f18_arg0.DifficultyText )
		end
	},
	Selected = {
		DefaultClip = function ( f23_arg0, f23_arg1 )
			f23_arg0:__resetProperties()
			f23_arg0:setupElementClipCounter( 3 )
			f23_arg0.DifficultySubText:completeAnimation()
			f23_arg0.DifficultySubText:setRGB(1, 0, 1)
			f23_arg0.clipFinished( f23_arg0.DifficultySubText )
			f23_arg0.DifficultyText:completeAnimation()
			f23_arg0.DifficultyText:setRGB( 1, 0, 1 )
			f23_arg0.clipFinished( f23_arg0.DifficultyText )
			f23_arg0.EquippedMarkerTick:completeAnimation()
			f23_arg0.EquippedMarkerTick:setAlpha( 1 )
			f23_arg0.clipFinished( f23_arg0.EquippedMarkerTick )
		end,
		ChildFocus = function ( f24_arg0, f24_arg1 )
			f24_arg0:__resetProperties()
			f24_arg0:setupElementClipCounter( 5 )
			f24_arg0.DifficultyList:completeAnimation()
			f24_arg0.DifficultyList:setScale( 1.05, 1.05 )
			f24_arg0.clipFinished( f24_arg0.DifficultyList )
			f24_arg0.DifficultyImage:completeAnimation()
			f24_arg0.DifficultyImage:setLeftRight( 0, 0, 1, 41 )
			f24_arg0.DifficultyImage:setScale( 1.05, 1.05 )
			f24_arg0.clipFinished( f24_arg0.DifficultyImage )
			f24_arg0.DifficultySubText:completeAnimation()
			f24_arg0.DifficultySubText:setLeftRight( 0, 0, 0, 192 )
			f24_arg0.DifficultySubText:setTopBottom( 1, 1, -17, -1 )
			f24_arg0.clipFinished( f24_arg0.DifficultySubText )
			f24_arg0.DifficultyText:completeAnimation()
			f24_arg0.DifficultyText:setRGB( 1, 0, 1 )
			f24_arg0.DifficultyText:setScale( 1.05, 1.05 )
			f24_arg0.clipFinished( f24_arg0.DifficultyText )
			f24_arg0.EquippedMarkerTick:completeAnimation()
			f24_arg0.EquippedMarkerTick:setLeftRight( 1, 1, -145, 15 )
			f24_arg0.EquippedMarkerTick:setTopBottom( 0, 0, -18, 142 )
			f24_arg0.EquippedMarkerTick:setAlpha( 1 )
			f24_arg0.clipFinished( f24_arg0.EquippedMarkerTick )
		end,
		GainChildFocus = function ( f25_arg0, f25_arg1 )
			f25_arg0:__resetProperties()
			f25_arg0:setupElementClipCounter( 5 )
			local f25_local0 = function ( f26_arg0 )
				f25_arg0.DifficultyList:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_in"] )
				f25_arg0.DifficultyList:setScale( 1.05, 1.05 )
				f25_arg0.DifficultyList:registerEventHandler( "interrupted_keyframe", f25_arg0.clipInterrupted )
				f25_arg0.DifficultyList:registerEventHandler( "transition_complete_keyframe", f25_arg0.clipFinished )
			end
			
			f25_arg0.DifficultyList:completeAnimation()
			f25_arg0.DifficultyList:setScale( 1, 1 )
			f25_local0( f25_arg0.DifficultyList )
			local f25_local1 = function ( f27_arg0 )
				f25_arg0.DifficultyImage:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_in"] )
				f25_arg0.DifficultyImage:setLeftRight( 0, 0, 1, 41 )
				f25_arg0.DifficultyImage:setScale( 1.05, 1.05 )
				f25_arg0.DifficultyImage:registerEventHandler( "interrupted_keyframe", f25_arg0.clipInterrupted )
				f25_arg0.DifficultyImage:registerEventHandler( "transition_complete_keyframe", f25_arg0.clipFinished )
			end
			
			f25_arg0.DifficultyImage:completeAnimation()
			f25_arg0.DifficultyImage:setLeftRight( 0, 0, 6, 46 )
			f25_arg0.DifficultyImage:setScale( 1, 1 )
			f25_local1( f25_arg0.DifficultyImage )
			local f25_local2 = function ( f28_arg0 )
				f25_arg0.DifficultySubText:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_in"] )
				f25_arg0.DifficultySubText:setLeftRight( 0, 0, 0, 192 )
				f25_arg0.DifficultySubText:setTopBottom( 1, 1, -17, -1 )
				f25_arg0.DifficultySubText:setRGB( 1, 0, 1 )
				f25_arg0.DifficultySubText:registerEventHandler( "interrupted_keyframe", f25_arg0.clipInterrupted )
				f25_arg0.DifficultySubText:registerEventHandler( "transition_complete_keyframe", f25_arg0.clipFinished )
			end
			
			f25_arg0.DifficultySubText:completeAnimation()
			f25_arg0.DifficultySubText:setLeftRight( 0, 0, 5, 197 )
			f25_arg0.DifficultySubText:setTopBottom( 1, 1, -19, -3 )
			f25_arg0.DifficultySubText:setRGB( 1, 0, 1 )
			f25_local2( f25_arg0.DifficultySubText )
			local f25_local3 = function ( f29_arg0 )
				f25_arg0.DifficultyText:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_in"] )
				f25_arg0.DifficultyText:setRGB( 1, 0, 1 )
				f25_arg0.DifficultyText:setScale( 1.05, 1.05 )
				f25_arg0.DifficultyText:registerEventHandler( "interrupted_keyframe", f25_arg0.clipInterrupted )
				f25_arg0.DifficultyText:registerEventHandler( "transition_complete_keyframe", f25_arg0.clipFinished )
			end
			
			f25_arg0.DifficultyText:completeAnimation()
			f25_arg0.DifficultyText:setRGB(1, 0, 1)
			f25_arg0.DifficultyText:setScale( 1, 1 )
			f25_local3( f25_arg0.DifficultyText )
			local f25_local4 = function ( f30_arg0 )
				f25_arg0.EquippedMarkerTick:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_in"] )
				f25_arg0.EquippedMarkerTick:setLeftRight( 1, 1, -145, 15 )
				f25_arg0.EquippedMarkerTick:setTopBottom( 0, 0, -18, 142 )
				f25_arg0.EquippedMarkerTick:registerEventHandler( "interrupted_keyframe", f25_arg0.clipInterrupted )
				f25_arg0.EquippedMarkerTick:registerEventHandler( "transition_complete_keyframe", f25_arg0.clipFinished )
			end
			
			f25_arg0.EquippedMarkerTick:completeAnimation()
			f25_arg0.EquippedMarkerTick:setLeftRight( 1, 1, -151, 9 )
			f25_arg0.EquippedMarkerTick:setTopBottom( 0, 0, -17, 143 )
			f25_arg0.EquippedMarkerTick:setAlpha( 1 )
			f25_local4( f25_arg0.EquippedMarkerTick )
		end,
		LoseChildFocus = function ( f31_arg0, f31_arg1 )
			f31_arg0:__resetProperties()
			f31_arg0:setupElementClipCounter( 5 )
			local f31_local0 = function ( f32_arg0 )
				f31_arg0.DifficultyList:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_out"] )
				f31_arg0.DifficultyList:setScale( 1, 1 )
				f31_arg0.DifficultyList:registerEventHandler( "interrupted_keyframe", f31_arg0.clipInterrupted )
				f31_arg0.DifficultyList:registerEventHandler( "transition_complete_keyframe", f31_arg0.clipFinished )
			end
			
			f31_arg0.DifficultyList:completeAnimation()
			f31_arg0.DifficultyList:setScale( 1.05, 1.05 )
			f31_local0( f31_arg0.DifficultyList )
			local f31_local1 = function ( f33_arg0 )
				f31_arg0.DifficultyImage:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_out"] )
				f31_arg0.DifficultyImage:setLeftRight( 0, 0, 6, 46 )
				f31_arg0.DifficultyImage:setScale( 1, 1 )
				f31_arg0.DifficultyImage:registerEventHandler( "interrupted_keyframe", f31_arg0.clipInterrupted )
				f31_arg0.DifficultyImage:registerEventHandler( "transition_complete_keyframe", f31_arg0.clipFinished )
			end
			
			f31_arg0.DifficultyImage:completeAnimation()
			f31_arg0.DifficultyImage:setLeftRight( 0, 0, 1, 41 )
			f31_arg0.DifficultyImage:setScale( 1.05, 1.05 )
			f31_local1( f31_arg0.DifficultyImage )
			local f31_local2 = function ( f34_arg0 )
				f31_arg0.DifficultySubText:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_out"] )
				f31_arg0.DifficultySubText:setLeftRight( 0, 0, 5, 197 )
				f31_arg0.DifficultySubText:setTopBottom( 1, 1, -19, -3 )
				f31_arg0.DifficultySubText:setRGB( 1, 0, 1 )
				f31_arg0.DifficultySubText:registerEventHandler( "interrupted_keyframe", f31_arg0.clipInterrupted )
				f31_arg0.DifficultySubText:registerEventHandler( "transition_complete_keyframe", f31_arg0.clipFinished )
			end
			
			f31_arg0.DifficultySubText:completeAnimation()
			f31_arg0.DifficultySubText:setLeftRight( 0, 0, 0, 192 )
			f31_arg0.DifficultySubText:setTopBottom( 1, 1, -17, -1 )
			f31_arg0.DifficultySubText:setRGB( 1, 0, 1 )
			f31_local2( f31_arg0.DifficultySubText )
			local f31_local3 = function ( f35_arg0 )
				f31_arg0.DifficultyText:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_out"] )
				f31_arg0.DifficultyText:setRGB(1, 0, 1)
				f31_arg0.DifficultyText:setScale( 1, 1 )
				f31_arg0.DifficultyText:registerEventHandler( "interrupted_keyframe", f31_arg0.clipInterrupted )
				f31_arg0.DifficultyText:registerEventHandler( "transition_complete_keyframe", f31_arg0.clipFinished )
			end
			
			f31_arg0.DifficultyText:completeAnimation()
			f31_arg0.DifficultyText:setRGB( ColorSet.T8__BIEGE.r, ColorSet.T8__BIEGE.g, ColorSet.T8__BIEGE.b )
			f31_arg0.DifficultyText:setScale( 1.05, 1.05 )
			f31_local3( f31_arg0.DifficultyText )
			local f31_local4 = function ( f36_arg0 )
				f31_arg0.EquippedMarkerTick:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_out"] )
				f31_arg0.EquippedMarkerTick:setLeftRight( 1, 1, -151, 9 )
				f31_arg0.EquippedMarkerTick:setTopBottom( 0, 0, -17, 143 )
				f31_arg0.EquippedMarkerTick:registerEventHandler( "interrupted_keyframe", f31_arg0.clipInterrupted )
				f31_arg0.EquippedMarkerTick:registerEventHandler( "transition_complete_keyframe", f31_arg0.clipFinished )
			end
			
			f31_arg0.EquippedMarkerTick:completeAnimation()
			f31_arg0.EquippedMarkerTick:setLeftRight( 1, 1, -145, 15 )
			f31_arg0.EquippedMarkerTick:setTopBottom( 0, 0, -18, 142 )
			f31_arg0.EquippedMarkerTick:setAlpha( 1 )
			f31_local4( f31_arg0.EquippedMarkerTick )
		end
	}
}

CoD.ZMDifficultySelectButton.__onClose = function ( f37_arg0 )
	f37_arg0.DifficultyList:close()
	f37_arg0.DifficultyImage:close()
	f37_arg0.DifficultySubText:close()
	f37_arg0.DifficultyText:close()
end