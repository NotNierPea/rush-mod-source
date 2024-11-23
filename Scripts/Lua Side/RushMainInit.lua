--[[

      .\hksc.exe '.\Scripts\Lua Side\RushMainInit.lua'  -o 'c:\Program Files (x86)\Call of Duty Black Ops 4\project-bo4\mods\RushModT8\Rush_Lua\RushMainInit.luac'

      Prototype and notes for LUA

      Engine.PrintInfo(0, "Fuck lua") -> PrintInfo should be XHASH instead of STRING

      -- Engine[@"func"]
      -- Enum[@"name"]
      -- Enum[@"name"][@"name2"]
      -- CoD[@"hash_8A9D1228888C8CB"]
      -- CoD.BlackMarketTableUtility[@"name"]
      -- Dvar[@"name"]


      Hooks:
      x64:2cfcd4cb80781b03.lua -> 27cac000f20ef647 (PC version)
      x64:12dd4ff313102b79.lua -> 4a3eb94d551ddf71 (Frontend)
      x64:66eee5926f63b60b.lua -> 4ed0bcba9d999e0f (Frontend 2)
      x64:2cb5bf4e094259d8.lua -> 46f417a74d9ab424 (Zombies)
      x64:8f9e828ebdeac4c.lua  -> 7f750379a77f3190 (Warzone)
      x64:5be322a54ff91a9a.lua -> 4fb12287640e989a (Multiplayer/Warzone)


      Hud factories:
      x64:31824fcd24cd5764.lua -> 2b23cf5ef446c848 (Zombies / T7Hud_zm_factory)
      57d27ab8e2f7a9d0 (Others / Hud)

      619241173 = Failed to allocate from element pool

      LUI.UI????.new(leftAnchor, rightAnchor, left, right, topAnchor, bottomAnchor, top, bottom)

      The hooks for blackout and the multiplayer is probably in one these files (dump required)
      elseif CoD.isWarzone then
            require( "x64:8f9e828ebdeac4c" )
      else
            require( "x64:eb491e34e330ae0" )
            require( "x64:6b7fc557f641386" )
            require( "x64:2f1b9c001eb57aa3" )
            require( "x64:37c614e146b5eea5" )
]]

---------------------------

if CoD.isFrontend then
	return
end

require( "ui/uieditor/menus/startgameflow/loading_zm" )
require( "ui/uieditor/widgets/hud/movieplayback/moviesubtitles" )
require( "ui/uieditor/widgets/loadinganimation/loadingscreenskipprompt" )
require( "ui/uieditor/widgets/notifications/xp/doublexpiconsleftaligned" )
require( "ui/uieditor/widgets/startgameflow/loadingscreentalkerwidgetcpzm" )
require( "ui/uieditor/widgets/startgameflow/loadingscreensharedcpzm" )
require( "ui/uieditor/widgets/pc_notif" )
require( "x64:5c0887595cfb6bb1" )

require("x64:488c89835c36151") -- gameover needs
require("x64:5170894c2be18f57")
require("x64:7e1697b8a432349")

require( "lua/shared/luareadonlytables" )
require( "lua/shared/lobbydata" )
require( "x64:5127dca51df8f7c7" )
require( "x64:785d6d26960f9bae" )
require( "x64:675e553bec904d39" )

require( "ui/utility/overlayutility" )

require( "x64:206d3dba7fca3db6" )
require( "ui/uieditor/widgets/notifications/xp/doublexpiconsleftaligned" )
require( "x64:64e305ae5efd943d" )
require( "x64:21c6bd5c481bc2be" )
require( "x64:3f1759af4f758ac8" )
require( "x64:13a06c735b413259" )
require( "x64:25526ba46c282c68" )
require( "x64:362d19097b6da0d8" )
require( "x64:7b710bc406e458bd" )

require( "ui/uieditor/widgets/backgroundframes/menuframeingame" )
require( "ui/uieditor/widgets/startmenu/options/startmenuoptionsbackground" )
require( "x64:36374709588b8a15" )
require( "ui/uieditor/widgets/director/directorquitbuttoncontainer" )
require( "ui/uieditor/widgets/hud/console/consoleentrycontainer" )

require("x64:5dad384961396711")

require( "x64:598e888b7d3db378" )
require( "x64:7d31d988677643" )
require( "x64:1e4d86781e568c41" )
require( "x64:2d9b05e07fa074ee" )

require( "x64:7857aae823214ba2" )
require( "x64:67139dde30490cc8" )
require( "x64:776b99ac28573661" )
require( "x64:4be457f86919afa5" )

require( "ui/uieditor/widgets/blackmarket/smokewidget" )
require( "x64:5857f6c026e9ea99" )

require( "x64:1dddc350afc94b48" )
require( "x64:3ad2dd10539beaf7" )

require( "x64:ff22b286a167aad" )

require( "x64:8c081eae077f5fd" )

require( "ui/uieditor/widgets/hud/centerconsole/centerconsoleentrycontainer" )

require( "x64:4c50f23ab4600782" )
require( "x64:1ee862a5c760e804" )
require( "ui/uieditor/widgets/lobby/common/fe_listsubheaderpanel" )

require( "x64:1e974620a2d49d8f" )

require( "ui/uieditor/widgets/chat/ingame/ingamechatclient" )
require( "ui/uieditor/widgets/chat/chatclientchatentryscrollviewcontainer" )
require( "ui/uieditor/widgets/chat/chatclientchatentrystaticview" )
require( "ui/uieditor/widgets/chat/chatclientfilterbutton" )
require( "ui/uieditor/widgets/chat/chatclientinputtextbox" )
require( "ui/uieditor/widgets/emptyfocusable" )

require( "ui/uieditor/widgets/border" )
require( "x64:234a25dc398a559c" )

require( "x64:55814753ce54450b" )

require( "ui/uieditor/widgets/loadinganimation/animationloadingwidget" )

---------------------------

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
	if DebugName ~= nil then
		Engine[@"printinfo"](0, "^1LUA Debug: " .. tostring(DebugName) .. " -> " .. tostring(PrintInfo))
	elseif PrintInfo ~= nil then
		Engine[@"printinfo"](0, "^1LUA Debug: " .. tostring(PrintInfo))
	end
end

local function GetImageMap(MainMap)
      if(MainMap == "zm_zodt8") then
            return "img_t8_menu_mp_loadscreen_casino"
      elseif(MainMap == "zm_towers") then
            return "img_t8_menu_mp_loadscreen_embassy"
      elseif(MainMap == "zm_mansion") then
            return "img_t8_menu_mp_loadscreen_casino"
      elseif(MainMap == "zm_escape") then
            return "img_t8_menu_mp_loadscreen_russianbase"
      elseif(MainMap == "zm_office") then
            return "img_t8_menu_mp_loadscreen_embassy"
      elseif(MainMap == "zm_orange") then
            return "img_t8_menu_mp_loadscreen_russianbase"
      elseif(MainMap == "zm_white") then
            return "img_t8_menu_mp_loadscreen_geothermal"
      elseif(MainMap == "zm_red") then
            return "img_t8_menu_mp_loadscreen_geothermal"
      end

      return "img_t8_menu_mp_loadscreen_casino"
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

CoD.HUDUtility.IsMovieShowing = function ( f129_arg0 )
	RushPrintInfo("Called", "IsMovieShowing")
	return false
end

CoD.HUDUtility.InitLoadingImageOrMovie = function ( f131_arg0, f131_arg1 )
	local f131_local0 = Engine[@"getcurrentmap"]()
	--CoD.HUDUtility.InitLoadingMovie( f131_arg1 )
      Engine[@"setdvar"]( "ui_useloadingmovie", 0 )

      --local f131_local1 = MapNameToMapLoadingImage( f131_arg1, f131_local0 )
      local f131_local1 = @"t8_menu_zm_loadscreen_dlc0"

	f131_arg0:setImage( RegisterImage( f131_local1 ) )
	f131_arg0:setRGB( 1, 1, 1 )
	--f131_arg0:addElement( LUI.UITimer.newElementTimer( 16, false, function ()
	--	if f131_arg0.ismp4 and not Engine[@"iscinematicmp4"]() then
	--		f131_arg0:setRGB( 0, 0, 0 )
	--		f131_arg0:setImage( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	--		f131_arg0.ismp4 = nil
	--	end
	--end ) )
end

CoD.HUDUtility.StartPlay = function ( f133_arg0, f133_arg1 )
      RushPrintInfo("Called", "StartPlay")
      Engine[@"stop3dcinematic"]()
      Engine[@"setloadingmovieskippedstate"]( true )
end

CoD.HUDUtility.InitLoadingMovie = function ( f130_arg0 ) -- main problem, doesn't get override for some reason
	RushPrintInfo("Called", "InitLoadingMovie")
	return 
end

CoD.HUDUtility.ShowRestartLevelPrompt = function ()
      RushPrintInfo("Called", "ShowRestartLevelPrompt")
      return true
end

local function GetEventString(ID)
      if ID == 1 then
            return "^3 Freeze!"
      elseif ID == 2 then
            return "^4 Weapons Disabled!"
      elseif ID == 3 then
            return "^3 Zombie Teleport!"
      elseif ID == 4 then
            return "^6 Gravity Change!"
      elseif ID == 5 then
            return "^6 Speed Change!"
      elseif ID == 6 then
            return "^4 InstaKill Spawn!"
      elseif ID == 7 then
            return "^7 Points Taken!"
      elseif ID == 8 then
            return "^7 Shield UP!"
      elseif ID == 9 then
            return "^7 Perk UP!"
      elseif ID == 10 then
            return "^1 Uhhhh"
      elseif ID == 11 then
            return "^7 Reign Drops!"
      elseif ID == 12 then
            return "^7 1x Self Revive!"
      elseif ID == 13 then
            return "^2 uhhh"
      elseif ID == 14 then
            return "^9 Headless Zombies!"
      elseif ID == 15 then
            return "^4 Random Elixir!"
      elseif ID == 16 then
            return "^4 Suprise!"
      elseif ID == 17 then
            return "^4 Hide Gun!"
      elseif ID == 18 then
            return "^9 widowzzz wine ARMY!"
      elseif ID == 19 then
            return "^9 symbolzzz wine ARMY!"
      elseif ID == 20 then
            return "^3 Exo Suit Activated!"
      elseif ID == 21 then
            return "^9 Super Jump!"
      elseif ID == 22 then
            return "^9 NUKE!!!!!"
      elseif ID == 23 then
            return "^1 Third Person"
      elseif ID == 24 then
            return "^4 Flashbang!"
      elseif ID == 25 then
            return "^1 No Event"
      elseif ID == 26 then
            return "^9 NUKE ARMY!"
      elseif ID == 27 then
            return "^4 JumpScare!"
      elseif ID == 28 then
            return "^9 Invisible Zombies!"
      elseif ID == 29 then
            return "^2 Super Speed Zombies!"
      elseif ID == 30 then
            return "^2 Fake Error!"
      elseif ID == 31 then
            return "^3 Rocket Gun!"
      elseif ID == 32 then
            return "^3 Models Gun!"
      elseif ID == 33 then
            return "^3 Nukie Friend!"
      
      end
end

local function GetQuestString(ID)
      if ID == 1 then
            return "- Mannequin Step";
      elseif ID == 2 then
            return "- Circuits Step";
      elseif ID == 3 then
            return "- Server Step";
      elseif ID == 4 then
            return "- Canister Step";
      elseif ID == 5 then
            return "- Crawler Step";
      elseif ID == 6 then
            return "- The Clock Step";
      elseif ID == 7 then
            return "- The Bunker Step (Finale)";
      elseif ID == 8 then
            return "- The Teleport Step (Final)";
      elseif ID == 9 then
            return "- Look the Dead in the Eye Step";
      elseif ID == 10 then
            return "- Hit Marks Step";
      elseif ID == 11 then
            return "- Push/Ignite The Bow Step";
      elseif ID == 12 then
            return "- Scepter and Sundial Step";
      elseif ID == 13 then
            return "- Align the Citizens Step";
      elseif ID == 14 then
            return "- The Door Step";
      elseif ID == 15 then
            return "- Oil Step";
      elseif ID == 16 then
            return "- The Planet Step";
      elseif ID == 17 then
            return "- The Iceberg Challenge Step";
      elseif ID == 18 then
            return "- Upgrade The Artifact Step";
      elseif ID == 19 then
            return "- The Outlets Step";
      elseif ID == 20 then
            return "- The Clock Step";
      elseif ID == 21 then
            return "- The Pressure Plate Step";
      elseif ID == 22 then
            return "- Defend Key Step";
      elseif ID == 23 then
            return "- The Light Step";
      elseif ID == 24 then
            return "- Unknown Step";
      elseif ID == 25 then
            return "- The Gladiator Round Step";
      elseif ID == 26 then
            return "- Activate Middle Balls Step";
      elseif ID == 27 then
            return "- Charge Spikes Step";
      elseif ID == 28 then
            return "- Electric Setup Step";
      elseif ID == 29 then
            return "- Unknown Step";
      elseif ID == 30 then
            return "- The Fire Shield Step";
      elseif ID == 31 then
            return "- The Shit Teleport Step";
      elseif ID == 32 then
            return "- The Shit Place Bath Step"
      elseif ID == 33 then
            return "- The Shit Place Odin Step"
      elseif ID == 34 then
            return "- Collect Stuff (Wood, Skull) Step (Finale)"
      elseif ID == 35 then
            return "- Activate Blue Fires Step"
      elseif ID == 36 then
            return "- Activate Knights Step"
      elseif ID == 37 then
            return "- Charge Stones Step"
      elseif ID == 38 then
            return "- Stone Lockdown Step"
      elseif ID == 39 then
            return "- Shoot Sticks Step"
      elseif ID == 40 then
            return "- Stick Ghost Step"
      elseif ID == 41 then
            return "- Stick Lockdown Step"
      elseif ID == 42 then
            return "- Shoot The Beam Step"
      elseif ID == 43 then
            return "- Rings Puzzle Step"
      elseif ID == 44 then
            return "- Marks Puzzle Step"
      elseif ID == 45 then
            return "- Beam Lockdown Step"
      elseif ID == 46 then
            return "- Acitvate Any Sone Step"
      elseif ID == 47 then
            return "- Completed!"
      elseif ID == 48 then
            return "- Agarthan Device Step"
      elseif ID == 49 then
            return "- Campfire Step"
      elseif ID == 50 then
            return "- Snow Orbs Step"
      elseif ID == 51 then
            return "- Agarthan Device Lockdown Step"
      elseif ID == 52 then
            return "- Charge Agarthan Device Step"
      elseif ID == 53 then
            return "- Charge Generators / Open Door Step"
      elseif ID == 54 then
            return "- Place Door Fuse / Shoot Electric Boxes Step"
      elseif ID == 55 then
            return "- Soapstones Step"
      elseif ID == 56 then
            return "- Acquire Agarthan Device Step"
      elseif ID == 57 then
            return "- Dials Step (Finale)"
      elseif ID == 58 then
            return "- PAP Lockdown Step"
      elseif ID == 59 then
            return "- Final Lockdown"
      elseif ID == 61 then
            return "- Into The Portal Step"
      elseif ID == 62 then
            return "- Final Showdown!"
      elseif ID == 60 then
            return "- Unknown Step"
      end
end

local OldErrorText = ""
local CurrentType = ""

local function Orignal_ShouldOpenMessageDialog( f33_arg0, f33_arg1 )
	if f33_arg0:getParent() == nil then
		return 
	end
	local f33_local0 = Engine[@"getmodel"]( Engine[@"getglobalmodel"](), "messageDialog" )
	if f33_local0 ~= nil then
		if IsInGame() then
			local f33_local1 = Engine[@"getmodel"]( f33_local0, "controller" )
			if f33_local1 ~= nil and Engine[@"getmodelvalue"]( f33_local1 ) ~= f33_arg1 then
				return false
			end
		end
		local f33_local1 = Engine[@"getmodel"]( f33_local0, "messagePending" )
		if f33_local1 ~= nil and Engine[@"getmodelvalue"]( f33_local1 ) > 0 then
			return true
		end
	end
	return false
end

----------------------------

-- Replace later
-- zm_towers_crowd_meter - done
-- the zm revive down widget - done
-- subtitles - done
-- hint wonder/hero weapon -- done

----------------------------

Engine[ @"PrintInfo" ](0, "^3Rush Init In-Game LUA Loaded -> " .. Engine[ @"GetCurrentMap"]() .. " -> " .. tostring(LUI.createMenu["T7Hud_" .. Engine[@"getcurrentmap"]()] ~= nil))
Engine[@"stop3dcinematic"]() -- fuck you starting cutscene
Engine[@"setloadingmovieskippedstate"]( true )

local function LoadShitAgainInit()

      -- Hint Wonder/Hero
      CoD.zm_hint_text = InheritFrom( CoD.Menu )
      CoD.zm_hint_text.__stateMap = {
            "DefaultState",
            "Visible"
      }

      LUI.createMenu.zm_hint_text = function ( f1_arg0, f1_arg1 )
            local self = CoD.Menu.NewForUIEditor( "zm_hint_text", f1_arg0 )
            local f1_local1 = self
            self:setClass( CoD.zm_hint_text )
            self.soundSet = "default"
            self:setOwner( f1_arg0 )
            self:setLeftRight( 0, 1, 0, 0 )
            self:setTopBottom( 0, 1, 0, 0 )
            self:playSound( "menu_open", f1_arg0 )
            self.ignoreCursor = true
            f1_local1:addElementToPendingUpdateStateList( self )
            
            local txtHintText = LUI.UIText.new( 0, 1, 96, -96, 0.5, 0.5, -58.5, -25.5 )
            txtHintText:setTTF( "dinnext_regular" )
            txtHintText:setAlignment( Enum[@"luialignment"][@"lui_alignment_center"] )
            txtHintText:setAlignment( Enum[@"luialignment"][@"lui_alignment_top"] )
            --txtHintText:setBackingType( 2 )
            --txtHintText:setBackingColor( 0, 1, 1 )
            --txtHintText:setBackingXPadding( 6 )
            --txtHintText:setBackingYPadding( 4 )
            --txtHintText:setBackingImage( RegisterImage( @"hash_675D661B612187DF" ) )
            txtHintText:linkToElementModel( self, "text", true, function ( model )
                  local f2_local0 = model:get()
                  if f2_local0 ~= nil then
                        txtHintText:setText( Engine[@"hash_4F9F1239CFD921FE"]( f2_local0 ) )
                  end
            end )
            self:addElement( txtHintText )
            self.txtHintText = txtHintText
            
            self:processEvent( {
                  name = "menu_loaded",
                  controller = f1_arg0
            } )
            LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
            
            if PostLoadFunc then
                  PostLoadFunc( self, f1_arg0 )
            end
            
            RushPrintInfo("Called", "ZM Hint Text")
            self:setRGB(0, 1, 1)
            
            return self
      end
      
      CoD.zm_hint_text.__resetProperties = function ( f3_arg0 )
            f3_arg0.txtHintText:completeAnimation()
            f3_arg0.txtHintText:setAlpha( 1 )
      end
      
      CoD.zm_hint_text.__clipsPerState = {
            DefaultState = {
                  DefaultClip = function ( f4_arg0, f4_arg1 )
                        f4_arg0:__resetProperties()
                        f4_arg0:setupElementClipCounter( 1 )
                        f4_arg0.txtHintText:completeAnimation()
                        f4_arg0.txtHintText:setAlpha( 0 )
                        f4_arg0.clipFinished( f4_arg0.txtHintText )
                  end,
                  Visible = function ( f5_arg0, f5_arg1 )
                        f5_arg0:__resetProperties()
                        f5_arg0:setupElementClipCounter( 1 )
                        local f5_local0 = function ( f6_arg0 )
                              f5_arg0.txtHintText:beginAnimation( 250 )
                              f5_arg0.txtHintText:setAlpha( 1 )
                              f5_arg0.txtHintText:registerEventHandler( "interrupted_keyframe", f5_arg0.clipInterrupted )
                              f5_arg0.txtHintText:registerEventHandler( "transition_complete_keyframe", f5_arg0.clipFinished )
                        end
                        
                        f5_arg0.txtHintText:completeAnimation()
                        f5_arg0.txtHintText:setAlpha( 0 )
                        f5_local0( f5_arg0.txtHintText )
                  end
            },
            Visible = {
                  DefaultClip = function ( f7_arg0, f7_arg1 )
                        f7_arg0:__resetProperties()
                        f7_arg0:setupElementClipCounter( 0 )
                  end,
                  DefaultState = function ( f8_arg0, f8_arg1 )
                        f8_arg0:__resetProperties()
                        f8_arg0:setupElementClipCounter( 1 )
                        local f8_local0 = function ( f9_arg0 )
                              f8_arg0.txtHintText:beginAnimation( 250 )
                              f8_arg0.txtHintText:setAlpha( 0 )
                              f8_arg0.txtHintText:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
                              f8_arg0.txtHintText:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
                        end
                        
                        f8_arg0.txtHintText:completeAnimation()
                        f8_arg0.txtHintText:setAlpha( 1 )
                        f8_local0( f8_arg0.txtHintText )
                  end
            }
      }

      CoD.zm_hint_text.__onClose = function ( f10_arg0 )
            f10_arg0.txtHintText:close()
      end
            
      -- Cursor Hint
      CoD.ZMCursorHint = InheritFrom( LUI.UIElement )
      CoD.ZMCursorHint.__defaultWidth = 750
      CoD.ZMCursorHint.__defaultHeight = 135
      CoD.ZMCursorHint.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            self:setClass( CoD.ZMCursorHint )
            self.id = "ZMCursorHint"
            self.soundSet = "HUD"
            f1_arg0:addElementToPendingUpdateStateList( self )
            
            local CursorHintText = LUI.UIText.new(0.5, 0.5, -375 - 3, 375 + 3, 0, 0, 3 - 3, 25 + 3)
            CursorHintText:setTTF( "notosans_bold" )

            CursorHintText:setShaderVector( 0, 0, 0, 0, 0 )
            CursorHintText:setShaderVector( 1, 0.5, 0, 0, 0 )
            CursorHintText:setShaderVector( 2, 0, 0, 0, 0 )
            CursorHintText:setShaderVector( 3, 0, 0, 0, 0 )
            CursorHintText:setShaderVector( 4, 0, 0, 0, 0 )

            CursorHintText:setLetterSpacing( 0.5 )

            CursorHintText:setAlignment( Enum[@"luialignment"][@"lui_alignment_center"] )
            CursorHintText:setAlignment( Enum[@"luialignment"][@"lui_alignment_top"] )

            --CursorHintText:setBackingType( 1 )
            --CursorHintText:setBackingWidget( CoD.Corner9SliceZM, f1_arg0, f1_arg1 )
            --CursorHintText:setBackingAlpha( 0.8 )
            --CursorHintText:setBackingXPadding( 40 )
            --CursorHintText:setBackingYPadding( 4 )

            CursorHintText:subscribeToGlobalModel( f1_arg1, "HUDItems", "cursorHintText", function ( model )
                  local f2_local0 = model:get()
                  if f2_local0 ~= nil then
                        CursorHintText:setText( f2_local0 )
                  end
            end )

            self:addElement( CursorHintText )
            self.CursorHintText = CursorHintText
            
            self:mergeStateConditions( {
                  {
                        stateName = "Active_NoImage",
                        condition = function ( menu, element, event )
                              local f3_local0 = IsCursorHintActive( f1_arg1 )
                              if f3_local0 then
                                    if not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_final_killcam"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_hud_hardcore"] ) and Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_hud_visible"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_in_guided_missile"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_in_killcam"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_is_demo_playing"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_is_flash_banged"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_nemesis_killcam"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_play_of_the_match"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_round_end_killcam"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_selecting_locational_killstreak"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_spectating_client"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_ui_active"] ) then
                                          f3_local0 = CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f1_arg1, "HUDItems", "cursorHintImage", "blacktransparent" )
                                    else
                                          f3_local0 = false
                                    end
                              end
                              return f3_local0
                        end
                  },
                  {
                        stateName = "Active",
                        condition = function ( menu, element, event )
                              local f4_local0 = IsCursorHintActive( f1_arg1 )
                              if f4_local0 then
                                    if not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_final_killcam"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_hud_hardcore"] ) and Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_hud_visible"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_in_guided_missile"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_in_killcam"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_is_demo_playing"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_is_flash_banged"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_nemesis_killcam"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_play_of_the_match"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_round_end_killcam"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_selecting_locational_killstreak"] ) and not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_spectating_client"] ) then
                                          f4_local0 = not Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_ui_active"] )
                                    else
                                          f4_local0 = false
                                    end
                              end
                              return f4_local0
                        end
                  }
            } )
            local f1_local2 = self
            local f1_local3 = self.subscribeToModel
            local f1_local4 = Engine[@"getmodelforcontroller"]( f1_arg1 )
            f1_local3( f1_local2, f1_local4["hudItems.showCursorHint"], function ( f5_arg0 )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = f5_arg0:get(),
                        modelName = "hudItems.showCursorHint"
                  } )
            end, false )
            f1_local2 = self
            f1_local3 = self.subscribeToModel
            f1_local4 = Engine[@"getmodelforcontroller"]( f1_arg1 )
            f1_local3( f1_local2, f1_local4["hudItems.inventory.open"], function ( f6_arg0 )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = f6_arg0:get(),
                        modelName = "hudItems.inventory.open"
                  } )
            end, false )
            f1_local2 = self
            f1_local3 = self.subscribeToModel
            f1_local4 = Engine[@"getmodelforcontroller"]( f1_arg1 )
            f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_final_killcam"]], function ( f7_arg0 )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = f7_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_final_killcam"]
                  } )
            end, false )
            f1_local2 = self
            f1_local3 = self.subscribeToModel
            f1_local4 = Engine[@"getmodelforcontroller"]( f1_arg1 )
            f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_hud_hardcore"]], function ( f8_arg0 )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = f8_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_hud_hardcore"]
                  } )
            end, false )
            f1_local2 = self
            f1_local3 = self.subscribeToModel
            f1_local4 = Engine[@"getmodelforcontroller"]( f1_arg1 )
            f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_hud_visible"]], function ( f9_arg0 )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = f9_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_hud_visible"]
                  } )
            end, false )
            f1_local2 = self
            f1_local3 = self.subscribeToModel
            f1_local4 = Engine[@"getmodelforcontroller"]( f1_arg1 )
            f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_guided_missile"]], function ( f10_arg0 )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = f10_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_guided_missile"]
                  } )
            end, false )
            f1_local2 = self
            f1_local3 = self.subscribeToModel
            f1_local4 = Engine[@"getmodelforcontroller"]( f1_arg1 )
            f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_killcam"]], function ( f11_arg0 )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = f11_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_killcam"]
                  } )
            end, false )
            f1_local2 = self
            f1_local3 = self.subscribeToModel
            f1_local4 = Engine[@"getmodelforcontroller"]( f1_arg1 )
            f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_is_demo_playing"]], function ( f12_arg0 )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = f12_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_is_demo_playing"]
                  } )
            end, false )
            f1_local2 = self
            f1_local3 = self.subscribeToModel
            f1_local4 = Engine[@"getmodelforcontroller"]( f1_arg1 )
            f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_is_flash_banged"]], function ( f13_arg0 )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = f13_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_is_flash_banged"]
                  } )
            end, false )
            f1_local2 = self
            f1_local3 = self.subscribeToModel
            f1_local4 = Engine[@"getmodelforcontroller"]( f1_arg1 )
            f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_nemesis_killcam"]], function ( f14_arg0 )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = f14_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_nemesis_killcam"]
                  } )
            end, false )
            f1_local2 = self
            f1_local3 = self.subscribeToModel
            f1_local4 = Engine[@"getmodelforcontroller"]( f1_arg1 )
            f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_play_of_the_match"]], function ( f15_arg0 )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = f15_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_play_of_the_match"]
                  } )
            end, false )
            f1_local2 = self
            f1_local3 = self.subscribeToModel
            f1_local4 = Engine[@"getmodelforcontroller"]( f1_arg1 )
            f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_round_end_killcam"]], function ( f16_arg0 )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = f16_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_round_end_killcam"]
                  } )
            end, false )
            f1_local2 = self
            f1_local3 = self.subscribeToModel
            f1_local4 = Engine[@"getmodelforcontroller"]( f1_arg1 )
            f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_selecting_locational_killstreak"]], function ( f17_arg0 )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = f17_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_selecting_locational_killstreak"]
                  } )
            end, false )
            f1_local2 = self
            f1_local3 = self.subscribeToModel
            f1_local4 = Engine[@"getmodelforcontroller"]( f1_arg1 )
            f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_spectating_client"]], function ( f18_arg0 )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = f18_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_spectating_client"]
                  } )
            end, false )
            f1_local2 = self
            f1_local3 = self.subscribeToModel
            f1_local4 = Engine[@"getmodelforcontroller"]( f1_arg1 )
            f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_ui_active"]], function ( f19_arg0 )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = f19_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_ui_active"]
                  } )
            end, false )
            f1_local2 = self
            f1_local3 = self.subscribeToModel
            f1_local4 = DataSources.HUDItems.getModel( f1_arg1 )
            f1_local3( f1_local2, f1_local4.cursorHintImage, function ( f20_arg0 )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = f20_arg0:get(),
                        modelName = "cursorHintImage"
                  } )
            end, false )
            LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
            
            if PostLoadFunc then
                  PostLoadFunc( self, f1_arg1, f1_arg0 )
            end
            
            RushPrintInfo("Called", "ZM Cursor Hint")
            self:setRGB(1, 0, 0)

            return self
      end
      
      CoD.ZMCursorHint.__resetProperties = function ( f21_arg0 )
            f21_arg0.CursorHintText:completeAnimation()
            f21_arg0.CursorHintText:setAlpha( 1 )
      end
      
      CoD.ZMCursorHint.__clipsPerState = {
            DefaultState = {
                  DefaultClip = function ( f22_arg0, f22_arg1 )
                        f22_arg0:__resetProperties()
                        f22_arg0:setupElementClipCounter( 1 )
                        f22_arg0.CursorHintText:completeAnimation()
                        f22_arg0.CursorHintText:setAlpha( 0 )
                        f22_arg0.clipFinished( f22_arg0.CursorHintText )
                  end
            },
            Active_NoImage = {
                  DefaultClip = function ( f23_arg0, f23_arg1 )
                        f23_arg0:__resetProperties()
                        f23_arg0:setupElementClipCounter( 1 )
                        local f23_local0 = function ( f24_arg0 )
                              f23_arg0.CursorHintText:beginAnimation( 300 )
                              f23_arg0.CursorHintText:setAlpha( 1 )
                              f23_arg0.CursorHintText:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
                              f23_arg0.CursorHintText:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
                        end
                        
                        f23_arg0.CursorHintText:completeAnimation()
                        f23_arg0.CursorHintText:setAlpha( 0 )
                        f23_local0( f23_arg0.CursorHintText )
                  end
            },
            Active = {
                  DefaultClip = function ( f25_arg0, f25_arg1 )
                        f25_arg0:__resetProperties()
                        f25_arg0:setupElementClipCounter( 1 )
                        local f25_local0 = function ( f26_arg0 )
                              f25_arg0.CursorHintText:beginAnimation( 300 )
                              f25_arg0.CursorHintText:setAlpha( 1 )
                              f25_arg0.CursorHintText:registerEventHandler( "interrupted_keyframe", f25_arg0.clipInterrupted )
                              f25_arg0.CursorHintText:registerEventHandler( "transition_complete_keyframe", f25_arg0.clipFinished )
                        end
                        
                        f25_arg0.CursorHintText:completeAnimation()
                        f25_arg0.CursorHintText:setAlpha( 0 )
                        f25_local0( f25_arg0.CursorHintText )
                  end
            }
      }

      CoD.ZMCursorHint.__onClose = function ( f27_arg0 )
            f27_arg0.CursorHintText:close()
      end

      CoD.ConsoleUtility.MoveConsoleEntry = function ( f8_arg0, f8_arg1 )
            --RushPrintInfo("Called", "Move Console Entry")

            --f8_arg0:completeAllAnimations()

            local f8_local0, f8_local1, f8_local2, f8_local3 = f8_arg0.ConsoleEntry:getLocalRect()
            local f8_local4 = (f8_local1 - f8_local3) * f8_arg1

            f8_arg0:beginAnimation( "move_subtitle_event", 100 )

            -- if almost last print, goes down and low alpha..
            if f8_arg1 >= 5 then
                  local f8_local5 = f8_arg0
                  local f8_local6 = f8_arg0.setAlpha
                  local f8_local7
                  if f8_arg1 == 5 then
                        f8_local7 = 0.6
                        if not f8_local7 then
                        
                        else
                              f8_local6( f8_local5, f8_local7 )
                        end
                  end
                  f8_local7 = 0.4
            end

            f8_arg0:setTopBottom( false, true, f8_local1 + f8_local4, f8_local3 + f8_local4 )
      end

      CoD.ConsoleUtility.ShowConsoleEntry = function ( f6_arg0, f6_arg1, f6_arg2 )
            f6_arg0.id = f6_arg1
            if not f6_arg2 then
                  f6_arg2 = 0
            end

            f6_arg0:completeAllAnimations()
            f6_arg0:setAlpha( 1 )

            f6_arg0.ConsoleEntry.Text0.Text:setAlpha( 0 )
            f6_arg0.ConsoleEntry.Icon0.Icon:setAlpha( 0 )
            f6_arg0.ConsoleEntry.Text1.Text:setAlpha( 0 )
            f6_arg0.ConsoleEntry.Icon1.Icon:setAlpha( 0 )

            local f6_local0, f6_local1, f6_local2, f6_local3 = f6_arg0:getLocalRect()
            f6_arg0:setTopBottom( false, true, -(f6_local3 - f6_local1), 0 )

            local f6_local4 = 0
            f6_local0 = f6_local0 + f6_arg2 / 2
            local f6_local5 = function ( f7_arg0 )
                  local f7_local0
                  if f7_arg0 == nil or f7_arg0 == "" or f7_arg0 == @"hash_0" then
                        f7_local0 = false
                  else
                        f7_local0 = true
                  end
                  return f7_local0
            end
            
            local f6_local6 = f6_arg0:getModel()
            f6_arg0.icon0Visible = f6_local5( Engine[@"getmodelvalue"]( Engine[@"getmodel"]( f6_local6, "icon0" ) ) )
            f6_arg0.text0Visible = f6_local5( Engine[@"getmodelvalue"]( Engine[@"getmodel"]( f6_local6, "text0" ) ) )
            f6_arg0.icon1Visible = f6_local5( Engine[@"getmodelvalue"]( Engine[@"getmodel"]( f6_local6, "icon1" ) ) )
            f6_arg0.text1Visible = f6_local5( Engine[@"getmodelvalue"]( Engine[@"getmodel"]( f6_local6, "text1" ) ) )
            f6_arg0.text2Visible = f6_local5( Engine[@"getmodelvalue"]( Engine[@"getmodel"]( f6_local6, "text2" ) ) )
            if f6_arg0.icon0Visible then
                  local f6_local7, f6_local8, f6_local9, f6_local10 = f6_arg0.ConsoleEntry.Icon0:getLocalRect()
                  local f6_local11 = (f6_local10 - f6_local8) * Engine[@"getmodelvalue"]( Engine[@"getmodel"]( f6_local6, "iconWidth" ) )
                  if f6_local11 < 0 then
                        f6_arg0.ConsoleEntry.Icon0:setLeftRight( true, false, f6_local0, f6_local0 - f6_local11 )
                  else
                        f6_arg0.ConsoleEntry.Icon0:setLeftRight( true, false, f6_local0 + f6_local11, f6_local0 )
                  end
                  f6_local0 = f6_local0 + math.abs( f6_local11 ) + f6_arg2
                  f6_arg0.ConsoleEntry.Icon0:playClip( "FadeIn" )
            end
            if f6_arg0.text0Visible then
                  local f6_local7 = f6_arg0.ConsoleEntry.Text0.Text:getTextWidth()
                  f6_arg0.ConsoleEntry.Text0:setLeftRight( true, false, f6_local0, f6_local0 + f6_local7 )
                  f6_local0 = f6_local0 + f6_local7 + f6_arg2
                  f6_arg0.ConsoleEntry.Text0:playClip( "FadeIn" )
            end
            if f6_arg0.icon1Visible then
                  local f6_local7, f6_local8, f6_local9, f6_local10 = f6_arg0.ConsoleEntry.Icon1:getLocalRect()
                  local f6_local11 = (f6_local10 - f6_local8) * Engine[@"getmodelvalue"]( Engine[@"getmodel"]( f6_local6, "iconWidth" ) )
                  if f6_local11 < 0 then
                        f6_arg0.ConsoleEntry.Icon1:setLeftRight( true, false, f6_local0 - f6_local11, f6_local0 )
                  else
                        f6_arg0.ConsoleEntry.Icon1:setLeftRight( true, false, f6_local0, f6_local0 + f6_local11 )
                  end
                  f6_local0 = f6_local0 + math.abs( f6_local11 ) + f6_arg2
                  f6_arg0.ConsoleEntry.Icon1:playClip( "FadeIn" )
            end
            if f6_arg0.text1Visible then
                  local f6_local7 = f6_arg0.ConsoleEntry.Text1.Text:getTextWidth()
                  f6_arg0.ConsoleEntry.Text1:setLeftRight( true, false, f6_local0, f6_local0 + f6_local7 )
                  f6_local0 = f6_local0 + f6_local7 + f6_arg2
                  f6_arg0.ConsoleEntry.Text1:playClip( "FadeIn" )
            end
            if f6_arg0.text2Visible then
                  local f6_local7 = f6_arg0.ConsoleEntry.Text2.Text:getTextWidth()
                  f6_arg0.ConsoleEntry.Text2:setLeftRight( true, false, f6_local0, f6_local0 + f6_local7 )
                  f6_local0 = f6_local0 + f6_local7 + f6_arg2
                  f6_arg0.ConsoleEntry.Text2:playClip( "FadeIn" )
            end
            f6_local0 = f6_local0 - f6_arg2 / 2
            f6_arg0.ConsoleEntry.Panel:setLeftRight( true, false, f6_arg0.panelStartLeft, f6_arg0.panelStartRight + f6_local0 )
            if f6_arg0.alignment == Enum[@"luialignment"][@"lui_alignment_center"] then
                  f6_arg0.ConsoleEntry:setLeftRight( false, false, -f6_local0 / 2, f6_local0 / 2 )
            end
            f6_arg0.ConsoleEntry:playClip( "FadeIn" )
            f6_arg0.timer = LUI.UITimer.new( 5000, "hide_console_entry", true, f6_arg0 )
            f6_arg0:addElement( f6_arg0.timer )
      end

      -- Utils for Prints
      CoD.ConsoleUtility.UpdateConsole = function ( f1_arg0 ) 
            local f1_local0 = 0

            -- remove this, and manually move them in cod.consolecenter...
            for f1_local1 = 0, f1_arg0.maxElementIndex, 1 do
                  if f1_arg0.lines[f1_local1].active then
                        f1_arg0.lines[f1_local1].position = f1_arg0.lines[f1_local1].position + 1
                        f1_arg0.lines[f1_local1].element:moveConsoleEntry( f1_arg0.lines[f1_local1].position )
                        f1_local0 = f1_local0 + 1
                  end
	      end

            local f1_local1 = Engine[@"getmodelforcontroller"]( f1_arg0.controller )
            local f1_local2 = Engine[@"getmodel"]( f1_arg0.consoleModel, "currentIndex" )
            local f1_local3 = Engine[@"getmodelvalue"]( f1_local2 )

            if f1_arg0.maxElementIndex < f1_local0 then
                  f1_arg0.lines[f1_local3].element:forceHideConsoleEntry()
            end
            if Engine[@"isvisibilitybitset"]( f1_arg0.controller, Enum[@"uivisibilitybit"][@"bit_demo_camera_mode_moviecam"] ) then
                  
            else
                  f1_arg0.lines[f1_local3].element:showConsoleEntry( f1_local3, f1_arg0.padding )
                  f1_arg0.lines[f1_local3].active = true
            end
            Engine[@"setmodelvalue"]( f1_local2, (f1_local3 + 1) % (f1_arg0.maxElementIndex + 1) )
            return true
      end
      
      CoD.ConsoleUtility.ConsoleNotificationComplete = function ( f2_arg0, f2_arg1 )
            f2_arg0.lines[f2_arg1.id].active = false
            f2_arg0.lines[f2_arg1.id].position = 0
      end
      
      CoD.ConsoleUtility.Init = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4 )
            RushPrintInfo("Called", "Setup Prints Util")

            f3_arg0.controller = f3_arg1
            local f3_local0 = Engine[@"getmodel"]( Engine[@"getmodelforcontroller"]( f3_arg1 ), "hudItems." .. f3_arg2 )
            Engine[@"setmodelvalue"]( Engine[@"createmodel"]( f3_local0, "currentIndex" ), 0 )
            f3_arg0.currentIndex = 0
            f3_arg0.maxElementIndex = f3_arg3 or 6
            f3_arg0.consoleModel = f3_local0
            f3_arg0.padding = f3_arg4
            f3_local0.numEntries:set( f3_arg0.maxElementIndex + 1 )
            f3_arg0.lines = {}
            
            for f3_local1 = 0, f3_arg0.maxElementIndex, 1 do
                  f3_arg0.lines[f3_local1] = {}
                  f3_arg0.lines[f3_local1].active = false
                  f3_arg0.lines[f3_local1].name = "ConsoleEntry" .. f3_local1
                  f3_arg0.lines[f3_local1].element = f3_arg0[f3_arg0.lines[f3_local1].name]
                  f3_arg0.lines[f3_local1].position = 0
            end

            f3_arg0:registerEventHandler( "console_notification_complete", CoD.ConsoleUtility.ConsoleNotificationComplete )
            f3_arg0:subscribeToModel( f3_local0, function ( model )
                  CoD.ConsoleUtility.UpdateConsole( f3_arg0 )
            end, false )
      end
            
      -- Print Subtitles
      CoD.CenterConsole = InheritFrom( LUI.UIElement )
      CoD.CenterConsole.__defaultWidth = 1110
      CoD.CenterConsole.__defaultHeight = 147
      CoD.CenterConsole.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            self:setClass( CoD.CenterConsole )
            self.id = "CenterConsole"
            self.soundSet = "HUD"
            self.anyChildUsesUpdateState = true
                  
            local ConsoleEntry0 = CoD.CenterConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, 0, -30 )
            ConsoleEntry0:subscribeToGlobalModel( f1_arg1, "HUDItems", "centerConsole.line0", function ( model )
                  ConsoleEntry0:setModel( model, f1_arg1 )
            end )
            self:addElement( ConsoleEntry0 )
            self.ConsoleEntry0 = ConsoleEntry0
            
            local ConsoleEntry1 = CoD.CenterConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, 0, -30 )
            ConsoleEntry1:subscribeToGlobalModel( f1_arg1, "HUDItems", "centerConsole.line1", function ( model )
                  ConsoleEntry1:setModel( model, f1_arg1 )
            end )
            self:addElement( ConsoleEntry1 )
            self.ConsoleEntry1 = ConsoleEntry1
            
            local ConsoleEntry2 = CoD.CenterConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, 0, -30 )
            ConsoleEntry2:subscribeToGlobalModel( f1_arg1, "HUDItems", "centerConsole.line2", function ( model )
                  ConsoleEntry2:setModel( model, f1_arg1 )
            end )
            self:addElement( ConsoleEntry2 )
            self.ConsoleEntry2 = ConsoleEntry2
            
            local ConsoleEntry3 = CoD.CenterConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, 0, -30 )
            ConsoleEntry3:subscribeToGlobalModel( f1_arg1, "HUDItems", "centerConsole.line3", function ( model )
                  ConsoleEntry3:setModel( model, f1_arg1 )
            end )
            self:addElement( ConsoleEntry3 )
            self.ConsoleEntry3 = ConsoleEntry3
            
            local ConsoleEntry4 = CoD.CenterConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, 0, -30 )
            ConsoleEntry4:subscribeToGlobalModel( f1_arg1, "HUDItems", "centerConsole.line4", function ( model )
                  ConsoleEntry4:setModel( model, f1_arg1 )
            end )
            self:addElement( ConsoleEntry4 )
            self.ConsoleEntry4 = ConsoleEntry4
            
            local ConsoleEntry5 = CoD.CenterConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, 0, -30 )
            ConsoleEntry5:subscribeToGlobalModel( f1_arg1, "HUDItems", "centerConsole.line5", function ( model )
                  ConsoleEntry5:setModel( model, f1_arg1 )
            end )
            self:addElement( ConsoleEntry5 )
            self.ConsoleEntry5 = ConsoleEntry5
            
            local ConsoleEntry6 = CoD.CenterConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, 0, -30 )
            ConsoleEntry6:subscribeToGlobalModel( f1_arg1, "HUDItems", "centerConsole.line6", function ( model )
                  ConsoleEntry6:setModel( model, f1_arg1 )
            end )
            self:addElement( ConsoleEntry6 )
            self.ConsoleEntry6 = ConsoleEntry6

            -- custom made for later
            local ConsoleEntry7 = CoD.CenterConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, 0, -30 )
            ConsoleEntry7:subscribeToGlobalModel( f1_arg1, "HUDItems", "centerConsole.line7", function ( model )
                  ConsoleEntry7:setModel( model, f1_arg1 )
            end )
            self:addElement( ConsoleEntry7 )
            self.ConsoleEntry7 = ConsoleEntry7

            local ConsoleEntry8 = CoD.CenterConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, 0, -30 )
            ConsoleEntry8:subscribeToGlobalModel( f1_arg1, "HUDItems", "centerConsole.line8", function ( model )
                  ConsoleEntry8:setModel( model, f1_arg1 )
            end )
            self:addElement( ConsoleEntry8 )
            self.ConsoleEntry8 = ConsoleEntry8
            
            LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
            if PreLoadFunc then
                  PreLoadFunc( self, f1_arg1, f1_arg0 )
            end
            local f1_local8 = self
            if IsMultiplayer() then
                  CoD.ConsoleUtility.Init( self, f1_arg1, "centerConsole", 0, 0 )
            else
                  CoD.ConsoleUtility.Init( self, f1_arg1, "centerConsole", nil, 6 ) --
            end

            RushPrintInfo("Called", "Center Console (Prints)")
            self:setTopBottom(0.70, 0.70, 0, 0)

            return self
      end
      
      CoD.CenterConsole.__onClose = function ( f9_arg0 )
            f9_arg0.ConsoleEntry0:close()
            f9_arg0.ConsoleEntry1:close()
            f9_arg0.ConsoleEntry2:close()
            f9_arg0.ConsoleEntry3:close()
            f9_arg0.ConsoleEntry4:close()
            f9_arg0.ConsoleEntry5:close()
            f9_arg0.ConsoleEntry6:close()
      end

      -- Main Print Subtitles Entry
      CoD.CenterConsoleEntry = InheritFrom( LUI.UIElement )
      CoD.CenterConsoleEntry.__defaultWidth = 1110
      CoD.CenterConsoleEntry.__defaultHeight = 33
      CoD.CenterConsoleEntry.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            self:setClass( CoD.CenterConsoleEntry )
            self.id = "CenterConsoleEntry"
            self.soundSet = "HUD"
            self.anyChildUsesUpdateState = true
            f1_arg0:addElementToPendingUpdateStateList( self )
            
            local Panel = CoD.FE_ListSubHeaderPanel.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 0, 0, 33 )
            Panel:setRGB( 1, 0, 1 )
            Panel:setAlpha( 0 )
            self:addElement( Panel )
            self.Panel = Panel
            
            local Text1 = CoD.CenterConsoleText.new( f1_arg0, f1_arg1, 0.5, 0.5, 53, 555, 0.5, 0.5, -19.5, 19.5 )
            Text1:setRGB( 1, 0, 0 )
            Text1:setAlpha( 0.9 )
            Text1.Text.__Color = function ( f2_arg0 )
                  local f2_local0 = f2_arg0:get()
                  if f2_local0 ~= nil then
                        Text1.Text:setRGB( ConsoleColorFromIndex( f1_arg1, f2_local0 ) )
                  end
            end
            
            Text1:linkToElementModel( self, "text1color", true, Text1.Text.__Color )
            Text1.Text.__Color_FullPath = function ()
                  local f3_local0 = self:getModel()
                  if f3_local0 then
                        f3_local0 = self:getModel()
                        f3_local0 = f3_local0.text1color
                  end
                  if f3_local0 then
                        Text1.Text.__Color( f3_local0 )
                  end
            end
            
            Text1:linkToElementModel( self, "text1", true, function ( model )
                  local f4_local0 = model:get()
                  if f4_local0 ~= nil then
                        Text1.Text:setText( CoD.BaseUtility.AlreadyLocalized( f4_local0 ) )
                  end
            end )
            self:addElement( Text1 )
            self.Text1 = Text1
            
            local Icon1 = CoD.CenterConsoleIcon.new( f1_arg0, f1_arg1, 0.5, 0.5, 14, 53, 0.5, 0.5, -19.5, 19.5 )
            Icon1:linkToElementModel( self, "icon1", true, function ( model )
                  local f5_local0 = model:get()
                  if f5_local0 ~= nil then
                        Icon1.Icon:setImage( RegisterImage( BlackTransparentIfNilOrEmpty( f5_local0 ) ) )
                  end
            end )
            self:addElement( Icon1 )
            self.Icon1 = Icon1
            
            local Text0 = CoD.CenterConsoleText.new( f1_arg0, f1_arg1, 0.5, 0.5, -516, 14, 0.5, 0.5, -19.5, 19.5 )
            Text0.Text.__Color = function ( f6_arg0 )
                  local f6_local0 = f6_arg0:get()
                  if f6_local0 ~= nil then
                        Text0.Text:setRGB( ConsoleColorFromIndex( f1_arg1, f6_local0 ) )
                  end
            end
            
            Text0:linkToElementModel( self, "text0color", true, Text0.Text.__Color )
            Text0.Text.__Color_FullPath = function ()
                  local f7_local0 = self:getModel()
                  if f7_local0 then
                        f7_local0 = self:getModel()
                        f7_local0 = f7_local0.text0color
                  end
                  if f7_local0 then
                        Text0.Text.__Color( f7_local0 )
                  end
            end
            
            Text0:linkToElementModel( self, "text0", true, function ( model )
                  local f8_local0 = model:get()
                  if f8_local0 ~= nil then
                        Text0.Text:setText( CoD.BaseUtility.AlreadyLocalized( f8_local0 ) )
                  end
            end )
            self:addElement( Text0 )
            self.Text0 = Text0
            
            local Icon0 = CoD.CenterConsoleIcon.new( f1_arg0, f1_arg1, 0.5, 0.5, -555, -516, 0.5, 0.5, -19.5, 19.5 )
            Icon0:linkToElementModel( self, "icon0", true, function ( model )
                  local f9_local0 = model:get()
                  if f9_local0 ~= nil then
                        Icon0.Icon:setImage( RegisterImage( BlackTransparentIfNilOrEmpty( f9_local0 ) ) )
                  end
            end )
            self:addElement( Icon0 )
            self.Icon0 = Icon0
            
            local f1_local6 = Text1
            local f1_local7 = Text1.subscribeToModel
            local f1_local8 = Engine[@"getmodelforcontroller"]( f1_arg1 )
            f1_local7( f1_local6, f1_local8["profile.colorblindMode"], Text1.Text.__Color_FullPath )
            f1_local6 = Text0
            f1_local7 = Text0.subscribeToModel
            f1_local8 = Engine[@"getmodelforcontroller"]( f1_arg1 )
            f1_local7( f1_local6, f1_local8["profile.colorblindMode"], Text0.Text.__Color_FullPath )
            LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
            
            if PostLoadFunc then
                  PostLoadFunc( self, f1_arg1, f1_arg0 )
            end
            
            return self
      end
      
      CoD.CenterConsoleEntry.__resetProperties = function ( f10_arg0 )
            f10_arg0.Panel:completeAnimation()
            f10_arg0.Panel:setRGB( 0, 0, 0 )
            f10_arg0.Panel:setAlpha( 0 )
      end
      
      CoD.CenterConsoleEntry.__clipsPerState = {
            DefaultState = {
                  DefaultClip = function ( f11_arg0, f11_arg1 )
                        f11_arg0:__resetProperties()
                        f11_arg0:setupElementClipCounter( 0 )
                  end,
                  FadeOut = function ( f12_arg0, f12_arg1 )
                        f12_arg0:__resetProperties()
                        f12_arg0:setupElementClipCounter( 1 )
                        local f12_local0 = function ( f13_arg0 )
                              f12_arg0.Panel:beginAnimation( 280, Enum[@"luitween"][@"luitween_bounce"] )
                              f12_arg0.Panel:setAlpha( 0 )
                              f12_arg0.Panel:registerEventHandler( "interrupted_keyframe", f12_arg0.clipInterrupted )
                              f12_arg0.Panel:registerEventHandler( "transition_complete_keyframe", f12_arg0.clipFinished )
                        end
                        
                        f12_arg0.Panel:completeAnimation()
                        f12_arg0.Panel:setRGB( 0, 0, 0 )
                        f12_arg0.Panel:setAlpha(0)
                        --f12_local0( f12_arg0.Panel )
                  end,
                  FadeIn = function ( f14_arg0, f14_arg1 )
                        f14_arg0:__resetProperties()
                        f14_arg0:setupElementClipCounter( 1 )
                        local f14_local0 = function ( f15_arg0 )
                              local f15_local0 = function ( f16_arg0 )
                                    local f16_local0 = function ( f17_arg0 )
                                          local f17_local0 = function ( f18_arg0 )
                                                local f18_local0 = function ( f19_arg0 )
                                                      local f19_local0 = function ( f20_arg0 )
                                                            local f20_local0 = function ( f21_arg0 )
                                                                  local f21_local0 = function ( f22_arg0 )
                                                                        local f22_local0 = function ( f23_arg0 )
                                                                              f23_arg0:beginAnimation( 9 )
                                                                              f23_arg0:setAlpha( 0.4 )
                                                                              f23_arg0:registerEventHandler( "transition_complete_keyframe", f14_arg0.clipFinished )
                                                                        end
                                                                        
                                                                        f22_arg0:beginAnimation( 19 )
                                                                        f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
                                                                  end
                                                                  
                                                                  f21_arg0:beginAnimation( 9 )
                                                                  f21_arg0:setAlpha( 0.1 )
                                                                  f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
                                                            end
                                                            
                                                            f20_arg0:beginAnimation( 20 )
                                                            f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
                                                      end
                                                      
                                                      f19_arg0:beginAnimation( 10 )
                                                      f19_arg0:setRGB( 0, 0, 0 )
                                                      f19_arg0:setAlpha( 0.4 )
                                                      f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
                                                end
                                                
                                                f18_arg0:beginAnimation( 20 )
                                                f18_arg0:setRGB( 0.33, 0.33, 0.33 )
                                                f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
                                          end
                                          
                                          f17_arg0:beginAnimation( 10 )
                                          f17_arg0:setAlpha( 0.1 )
                                          f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
                                    end
                                    
                                    f16_arg0:beginAnimation( 20 )
                                    f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
                              end
                              
                              --f14_arg0.Panel:beginAnimation( 10 )
                              f14_arg0.Panel:setAlpha( 0 )
                              f14_arg0.Panel:registerEventHandler( "interrupted_keyframe", f14_arg0.clipInterrupted )
                              f14_arg0.Panel:registerEventHandler( "transition_complete_keyframe", f15_local0 )
                        end
                        
                        f14_arg0.Panel:completeAnimation()
                        f14_arg0.Panel:setRGB( 0, 0, 0 )
                        f14_arg0.Panel:setAlpha( 0 )
                        f14_local0( f14_arg0.Panel )
                  end
            }
      }

      CoD.CenterConsoleEntry.__onClose = function ( f24_arg0 )
            f24_arg0.Panel:close()
            f24_arg0.Text1:close()
            f24_arg0.Icon1:close()
            f24_arg0.Text0:close()
            f24_arg0.Icon0:close()
      end

      -- Main Print Subitiles Panel
      CoD.FE_ListSubHeaderPanel = InheritFrom( LUI.UIElement )
      CoD.FE_ListSubHeaderPanel.__defaultWidth = 48
      CoD.FE_ListSubHeaderPanel.__defaultHeight = 45
      CoD.FE_ListSubHeaderPanel.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            self:setClass( CoD.FE_ListSubHeaderPanel )
            self.id = "FE_ListSubHeaderPanel"
            self.soundSet = "default"
            
            local Image = LUI.UIImage.new( 0, 0, 0, 0, 0, 0, 0, 0 )
            --Image:setImage( RegisterImage( @"uie_t7_menu_frontend_listsubheadpanelfull" ) )
            --Image:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_nineslice_normal" ) )
            Image:setShaderVector( 0, 0, 0, 0, 0 )
            --Image:setupNineSliceShader( 24, 6 )
            self:addElement( Image )
            self.Image = Image
            
            if PostLoadFunc then
                  PostLoadFunc( self, f1_arg1, f1_arg0 )
            end
            
            return self
      end

      -- Main Print Subtitles Entry Text
      CoD.CenterConsoleText = InheritFrom( LUI.UIElement )
      CoD.CenterConsoleText.__defaultWidth = 495
      CoD.CenterConsoleText.__defaultHeight = 33
      CoD.CenterConsoleText.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            self:setClass( CoD.CenterConsoleText )
            self.id = "CenterConsoleText"
            self.soundSet = "HUD"
            f1_arg0:addElementToPendingUpdateStateList( self )
            
            local Text = LUI.UIText.new( 0, 0, 0, 1350, 0, 0, -2.5, 35.5 )
            Text:setText("")
            Text:setTTF("notosans_bold")
            --Text:setRFTMaterial(LUI.UIImage.GetCachedMaterial( @"hash_2D79DB5C45AD6024"))
            Text:setShaderVector( 0, 0, 0, 0, 0 )
            Text:setShaderVector( 1, 0.5, 0, 0, 0 )
            Text:setShaderVector( 2, 0, 0, 0, 0 )
            Text:setShaderVector( 3, 0, 0, 0, 0 )
            Text:setShaderVector( 4, 0, 0, 0, 0 )
            Text:setAlignment( Enum[@"luialignment"][@"lui_alignment_left"] )
            self:addElement( Text )
            self.Text = Text
            
            if PostLoadFunc then
                  PostLoadFunc( self, f1_arg1, f1_arg0 )
            end
            
            return self
      end
      
      CoD.CenterConsoleText.__resetProperties = function ( f2_arg0 )
            f2_arg0.Text:completeAnimation()
            f2_arg0.Text:setAlpha( 1 )
      end
      
      CoD.CenterConsoleText.__clipsPerState = {
            DefaultState = {
                  DefaultClip = function ( f3_arg0, f3_arg1 )
                        f3_arg0:__resetProperties()
                        f3_arg0:setupElementClipCounter( 1 )
                        f3_arg0.Text:completeAnimation()
                        f3_arg0.Text:setAlpha( 0 )
                        f3_arg0.clipFinished( f3_arg0.Text )
                  end,
                  FadeOut = function ( f4_arg0, f4_arg1 )
                        f4_arg0:__resetProperties()
                        f4_arg0:setupElementClipCounter( 1 )
                        local f4_local0 = function ( f5_arg0 )
                              f4_arg0.Text:beginAnimation( 100 )
                              f4_arg0.Text:setAlpha( 0 )
                              f4_arg0.Text:registerEventHandler( "interrupted_keyframe", f4_arg0.clipInterrupted )
                              f4_arg0.Text:registerEventHandler( "transition_complete_keyframe", f4_arg0.clipFinished )
                        end
                        
                        f4_arg0.Text:completeAnimation()
                        f4_arg0.Text:setAlpha( 1 )
                        f4_local0( f4_arg0.Text )
                  end,
                  FadeIn = function ( f6_arg0, f6_arg1 )
                        f6_arg0:__resetProperties()
                        f6_arg0:setupElementClipCounter( 1 )
                        local f6_local0 = function ( f7_arg0 )
                              f6_arg0.Text:beginAnimation( 100 )
                              f6_arg0.Text:setAlpha( 1 )
                              f6_arg0.Text:registerEventHandler( "interrupted_keyframe", f6_arg0.clipInterrupted )
                              f6_arg0.Text:registerEventHandler( "transition_complete_keyframe", f6_arg0.clipFinished )
                        end
                        
                        f6_arg0.Text:completeAnimation()
                        f6_arg0.Text:setAlpha( 0 )
                        f6_local0( f6_arg0.Text )
                  end
            }
      }      

      -- Main Print Subtitles Entry Icon (Useless)
      CoD.CenterConsoleIcon = InheritFrom( LUI.UIElement )
      CoD.CenterConsoleIcon.__defaultWidth = 22
      CoD.CenterConsoleIcon.__defaultHeight = 21
      CoD.CenterConsoleIcon.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            self:setClass( CoD.CenterConsoleIcon )
            self.id = "CenterConsoleIcon"
            self.soundSet = "HUD"
            f1_arg0:addElementToPendingUpdateStateList( self )
            
            local Icon = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
            Icon:setAlpha( 0 )
            Icon:setImage( RegisterImage( @"uie_death_headshot" ) )
            Icon:setMaterial( LUI.UIImage.GetCachedMaterial( @"ui_add" ) )
            self:addElement( Icon )
            self.Icon = Icon
            
            if PostLoadFunc then
                  PostLoadFunc( self, f1_arg1, f1_arg0 )
            end
            
            return self
      end
      
      CoD.CenterConsoleIcon.__resetProperties = function ( f2_arg0 )
            f2_arg0.Icon:completeAnimation()
            f2_arg0.Icon:setAlpha( 0 )
      end
      
      CoD.CenterConsoleIcon.__clipsPerState = {
            DefaultState = {
                  DefaultClip = function ( f3_arg0, f3_arg1 )
                        f3_arg0:__resetProperties()
                        f3_arg0:setupElementClipCounter( 0 )
                  end,
                  FadeIn = function ( f4_arg0, f4_arg1 )
                        f4_arg0:__resetProperties()
                        f4_arg0:setupElementClipCounter( 1 )
                        local f4_local0 = function ( f5_arg0 )
                              local f5_local0 = function ( f6_arg0 )
                                    local f6_local0 = function ( f7_arg0 )
                                          local f7_local0 = function ( f8_arg0 )
                                                local f8_local0 = function ( f9_arg0 )
                                                      local f9_local0 = function ( f10_arg0 )
                                                            local f10_local0 = function ( f11_arg0 )
                                                                  local f11_local0 = function ( f12_arg0 )
                                                                        local f12_local0 = function ( f13_arg0 )
                                                                              f13_arg0:beginAnimation( 9 )
                                                                              f13_arg0:setAlpha( 1 )
                                                                              f13_arg0:registerEventHandler( "transition_complete_keyframe", f4_arg0.clipFinished )
                                                                        end
                                                                        
                                                                        f12_arg0:beginAnimation( 19 )
                                                                        f12_arg0:setAlpha( 0.75 )
                                                                        f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
                                                                  end
                                                                  
                                                                  f11_arg0:beginAnimation( 9 )
                                                                  f11_arg0:setAlpha( 0.74 )
                                                                  f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
                                                            end
                                                            
                                                            f10_arg0:beginAnimation( 20 )
                                                            f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
                                                      end
                                                      
                                                      f9_arg0:beginAnimation( 10 )
                                                      f9_arg0:setAlpha( 1 )
                                                      f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
                                                end
                                                
                                                f8_arg0:beginAnimation( 20 )
                                                f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
                                          end
                                          
                                          f7_arg0:beginAnimation( 10 )
                                          f7_arg0:setAlpha( 0.4 )
                                          f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
                                    end
                                    
                                    f6_arg0:beginAnimation( 20 )
                                    f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
                              end
                              
                              f4_arg0.Icon:beginAnimation( 10 )
                              f4_arg0.Icon:setAlpha( 1 )
                              f4_arg0.Icon:registerEventHandler( "interrupted_keyframe", f4_arg0.clipInterrupted )
                              f4_arg0.Icon:registerEventHandler( "transition_complete_keyframe", f5_local0 )
                        end
                        
                        f4_arg0.Icon:completeAnimation()
                        f4_arg0.Icon:setAlpha( 0 )
                        f4_local0( f4_arg0.Icon )
                  end,
                  FadeOut = function ( f14_arg0, f14_arg1 )
                        f14_arg0:__resetProperties()
                        f14_arg0:setupElementClipCounter( 1 )
                        local f14_local0 = function ( f15_arg0 )
                              f14_arg0.Icon:beginAnimation( 100 )
                              f14_arg0.Icon:setAlpha( 0 )
                              f14_arg0.Icon:registerEventHandler( "interrupted_keyframe", f14_arg0.clipInterrupted )
                              f14_arg0.Icon:registerEventHandler( "transition_complete_keyframe", f14_arg0.clipFinished )
                        end
                        
                        f14_arg0.Icon:completeAnimation()
                        f14_arg0.Icon:setAlpha( 1 )
                        f14_local0( f14_arg0.Icon )
                  end
            }
      }  
            
      -- Main Subtitles
      CoD.SubtitlesContainer = InheritFrom( LUI.UIElement )
      CoD.SubtitlesContainer.__defaultWidth = 1110
      CoD.SubtitlesContainer.__defaultHeight = 147
      CoD.SubtitlesContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            self:setClass( CoD.SubtitlesContainer )
            self.id = "SubtitlesContainer"
            self.soundSet = "HUD"
            
            local SubtitleEntry0 = CoD.SubtitleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, -30, 0 )
            SubtitleEntry0:subscribeToGlobalModel( f1_arg1, "HUDItems", "subtitles.line0", function ( model )
                  SubtitleEntry0:setModel( model, f1_arg1 )
            end )
            self:addElement( SubtitleEntry0 )
            self.SubtitleEntry0 = SubtitleEntry0
            
            local SubtitleEntry1 = CoD.SubtitleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, -30, 0 )
            SubtitleEntry1:subscribeToGlobalModel( f1_arg1, "HUDItems", "subtitles.line1", function ( model )
                  SubtitleEntry1:setModel( model, f1_arg1 )
            end )
            self:addElement( SubtitleEntry1 )
            self.SubtitleEntry1 = SubtitleEntry1
            
            local SubtitleEntry2 = CoD.SubtitleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, -30, 0 )
            SubtitleEntry2:subscribeToGlobalModel( f1_arg1, "HUDItems", "subtitles.line2", function ( model )
                  SubtitleEntry2:setModel( model, f1_arg1 )
            end )
            self:addElement( SubtitleEntry2 )
            self.SubtitleEntry2 = SubtitleEntry2
            
            local SubtitleEntry3 = CoD.SubtitleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, -30, 0 )
            SubtitleEntry3:subscribeToGlobalModel( f1_arg1, "HUDItems", "subtitles.line3", function ( model )
                  SubtitleEntry3:setModel( model, f1_arg1 )
            end )
            self:addElement( SubtitleEntry3 )
            self.SubtitleEntry3 = SubtitleEntry3
            
            local SubtitleEntry4 = CoD.SubtitleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, -30, 0 )
            SubtitleEntry4:subscribeToGlobalModel( f1_arg1, "HUDItems", "subtitles.line4", function ( model )
                  SubtitleEntry4:setModel( model, f1_arg1 )
            end )
            self:addElement( SubtitleEntry4 )
            self.SubtitleEntry4 = SubtitleEntry4
            
            local SubtitleEntry5 = CoD.SubtitleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, -30, 0 )
            SubtitleEntry5:subscribeToGlobalModel( f1_arg1, "HUDItems", "subtitles.line5", function ( model )
                  SubtitleEntry5:setModel( model, f1_arg1 )
            end )
            self:addElement( SubtitleEntry5 )
            self.SubtitleEntry5 = SubtitleEntry5
            
            local SubtitleEntry6 = CoD.SubtitleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, -30, 0 )
            SubtitleEntry6:subscribeToGlobalModel( f1_arg1, "HUDItems", "subtitles.line6", function ( model )
                  SubtitleEntry6:setModel( model, f1_arg1 )
            end )
            self:addElement( SubtitleEntry6 )
            self.SubtitleEntry6 = SubtitleEntry6
            
            LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
            
            if PostLoadFunc then
                  PostLoadFunc( self, f1_arg1, f1_arg0 )
            end
            
            local f1_local8 = self
            CoD.SubtitleUtility.Init( self, f1_arg1, "subtitles", nil )

            self:setTopBottom(0.205, 0.205, 0, 0)
            self:setRGB(1, 1, 0)
            RushPrintInfo("Called", "Main ZM Subtitles")
            
            -- fix treyarch's fast_restart issue
            self.SubtitleEntry0.SubtitleEntry.glow:setText("")
            self.SubtitleEntry0.SubtitleEntry.TextBox:setText("")

            self.SubtitleEntry1.SubtitleEntry.glow:setText("")
            self.SubtitleEntry1.SubtitleEntry.TextBox:setText("")

            self.SubtitleEntry2.SubtitleEntry.glow:setText("")
            self.SubtitleEntry2.SubtitleEntry.TextBox:setText("")

            self.SubtitleEntry3.SubtitleEntry.glow:setText("")
            self.SubtitleEntry3.SubtitleEntry.TextBox:setText("")

            self.SubtitleEntry4.SubtitleEntry.glow:setText("")
            self.SubtitleEntry4.SubtitleEntry.TextBox:setText("")

            self.SubtitleEntry5.SubtitleEntry.glow:setText("")
            self.SubtitleEntry5.SubtitleEntry.TextBox:setText("")

            self.SubtitleEntry6.SubtitleEntry.glow:setText("")
            self.SubtitleEntry6.SubtitleEntry.TextBox:setText("")
            
            return self
      end
      
      CoD.SubtitlesContainer.__onClose = function ( f9_arg0 )
            f9_arg0.SubtitleEntry0:close()
            f9_arg0.SubtitleEntry1:close()
            f9_arg0.SubtitleEntry2:close()
            f9_arg0.SubtitleEntry3:close()
            f9_arg0.SubtitleEntry4:close()
            f9_arg0.SubtitleEntry5:close()
            f9_arg0.SubtitleEntry6:close()
      end  
      
      -- Main Subtitles Entry
      CoD.SubtitleEntry = InheritFrom( LUI.UIElement )
      CoD.SubtitleEntry.__defaultWidth = 1110
      CoD.SubtitleEntry.__defaultHeight = 33
      CoD.SubtitleEntry.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            self:setClass( CoD.SubtitleEntry )
            self.id = "SubtitleEntry"
            self.soundSet = "HUD"
            f1_arg0:addElementToPendingUpdateStateList( self )
            
            local glow = LUI.UIText.new( 0, 0, 0, 1110, 0, 0, 0, 33 )
            glow:setRGB( 0, 0, 0 )
            glow:setTTF( "ttmussels_demibold" )
            glow:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_2AE166D9BA8C6907" ) )
            glow:setShaderVector( 0, 0.4, 0, 0, 0 )
            glow:setShaderVector( 1, -0.7, 0, 0, 0 )
            glow:setShaderVector( 2, 1, 0, 0, 0 )
            glow:setAlignment( Enum[@"luialignment"][@"lui_alignment_center"] )
            glow:setAlignment( Enum[@"luialignment"][@"lui_alignment_top"] )
            glow:linkToElementModel( self, "text", true, function ( model )
                  local f2_local0 = model:get()
                  if f2_local0 ~= nil then
                        glow:setText( f2_local0 )
                  end
            end )
            self:addElement( glow )
            self.glow = glow
            
            local TextBox = LUI.UIText.new( 0, 0, 0, 1110, 0, 0, 0, 33 )
            TextBox:setTTF( "ttmussels_demibold" )
            TextBox:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_2AE166D9BA8C6907" ) )
            TextBox:setShaderVector( 0, 0, 0, 0, 0 )
            TextBox:setShaderVector( 1, 0, 0, 0, 0 )
            TextBox:setShaderVector( 2, 1, 0, 0, 0 )
            TextBox:setAlignment( Enum[@"luialignment"][@"lui_alignment_center"] )
            TextBox:setAlignment( Enum[@"luialignment"][@"lui_alignment_top"] )
            TextBox:linkToElementModel( self, "text", true, function ( model )
                  local f3_local0 = model:get()
                  if f3_local0 ~= nil then
                        TextBox:setText( f3_local0 )
                  end
            end )
            LUI.OverrideFunction_CallOriginalFirst( TextBox, "setText", function ( element, controller )
                  UpdateWidgetHeightToMultilineText( self, element, 5 )
            end )
            self:addElement( TextBox )
            self.TextBox = TextBox
            
            LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
            
            if PostLoadFunc then
                  PostLoadFunc( self, f1_arg1, f1_arg0 )
            end
            
            return self
      end
      
      CoD.SubtitleEntry.__resetProperties = function ( f5_arg0 )
            f5_arg0.TextBox:completeAnimation()
            f5_arg0.glow:completeAnimation()
            f5_arg0.TextBox:setAlpha( 1 )
            f5_arg0.glow:setAlpha( 1 )
      end
      
      CoD.SubtitleEntry.__clipsPerState = {
            DefaultState = {
                  DefaultClip = function ( f6_arg0, f6_arg1 )
                        f6_arg0:__resetProperties()
                        f6_arg0:setupElementClipCounter( 0 )
                  end,
                  FadeOut = function ( f7_arg0, f7_arg1 )
                        f7_arg0:__resetProperties()
                        f7_arg0:setupElementClipCounter( 2 )
                        local f7_local0 = function ( f8_arg0 )
                              f7_arg0.glow:beginAnimation( 280, Enum[@"luitween"][@"luitween_bounce"] )
                              f7_arg0.glow:setAlpha( 0 )
                              f7_arg0.glow:registerEventHandler( "interrupted_keyframe", f7_arg0.clipInterrupted )
                              f7_arg0.glow:registerEventHandler( "transition_complete_keyframe", f7_arg0.clipFinished )
                        end
                        
                        f7_arg0.glow:completeAnimation()
                        f7_arg0.glow:setAlpha( 1 )
                        f7_local0( f7_arg0.glow )
                        local f7_local1 = function ( f9_arg0 )
                              f7_arg0.TextBox:beginAnimation( 280, Enum[@"luitween"][@"luitween_bounce"] )
                              f7_arg0.TextBox:setAlpha( 0 )
                              f7_arg0.TextBox:registerEventHandler( "interrupted_keyframe", f7_arg0.clipInterrupted )
                              f7_arg0.TextBox:registerEventHandler( "transition_complete_keyframe", f7_arg0.clipFinished )
                        end
                        
                        f7_arg0.TextBox:completeAnimation()
                        f7_arg0.TextBox:setAlpha( 1 )
                        f7_local1( f7_arg0.TextBox )
                  end,
                  FadeIn = function ( f10_arg0, f10_arg1 )
                        f10_arg0:__resetProperties()
                        f10_arg0:setupElementClipCounter( 2 )
                        local f10_local0 = function ( f11_arg0 )
                              f10_arg0.glow:beginAnimation( 200, Enum[@"luitween"][@"luitween_bounce"] | Enum[@"luitween"][@"luitween_ease_both"] )
                              f10_arg0.glow:setAlpha( 1 )
                              f10_arg0.glow:registerEventHandler( "interrupted_keyframe", f10_arg0.clipInterrupted )
                              f10_arg0.glow:registerEventHandler( "transition_complete_keyframe", f10_arg0.clipFinished )
                        end
                        
                        f10_arg0.glow:completeAnimation()
                        f10_arg0.glow:setAlpha( 0 )
                        f10_local0( f10_arg0.glow )
                        local f10_local1 = function ( f12_arg0 )
                              f10_arg0.TextBox:beginAnimation( 200, Enum[@"luitween"][@"luitween_bounce"] | Enum[@"luitween"][@"luitween_ease_both"] )
                              f10_arg0.TextBox:setAlpha( 1 )
                              f10_arg0.TextBox:registerEventHandler( "interrupted_keyframe", f10_arg0.clipInterrupted )
                              f10_arg0.TextBox:registerEventHandler( "transition_complete_keyframe", f10_arg0.clipFinished )
                        end
                        
                        f10_arg0.TextBox:completeAnimation()
                        f10_arg0.TextBox:setAlpha( 0 )
                        f10_local1( f10_arg0.TextBox )
                  end,
                  Hide = function ( f13_arg0, f13_arg1 )
                        f13_arg0:__resetProperties()
                        f13_arg0:setupElementClipCounter( 2 )
                        f13_arg0.glow:completeAnimation()
                        f13_arg0.glow:setAlpha( 0 )
                        f13_arg0.clipFinished( f13_arg0.glow )
                        f13_arg0.TextBox:completeAnimation()
                        f13_arg0.TextBox:setAlpha( 1 )
                        f13_arg0.clipFinished( f13_arg0.TextBox )
                  end
            }
      }

      CoD.SubtitleEntry.__onClose = function ( f14_arg0 )
            f14_arg0.glow:close()
            f14_arg0.TextBox:close()
      end
      
      -- Laststand
      CoD.zm_laststand_client = InheritFrom( CoD.Menu )
      LUI.createMenu.zm_laststand_client = function ( f1_arg0, f1_arg1 )
            local self = CoD.Menu.NewForUIEditor( "zm_laststand_client", f1_arg0 )
            local f1_local1 = self
            self:setClass( CoD.zm_laststand_client )
            self.soundSet = "none"
            self:setOwner( f1_arg0 )
            self:setLeftRight( 0, 1, 0, 0 )
            self:setTopBottom( 0, 1, 0, 0 )
            self:playSound( "menu_open", f1_arg0 )
            self.ignoreCursor = true
            self.anyChildUsesUpdateState = true
            f1_local1:addElementToPendingUpdateStateList( self )
            
            local DecorativeBGAnim = CoD.Hud_ZM_LastStand_DecorativeBGInternal.new( f1_local1, f1_arg0, 0.5, 0.5, -88, 88, 1, 1, -413, -237 )
            DecorativeBGAnim:setRGB( 0, 0, 0 )
            self:addElement( DecorativeBGAnim )
            self.DecorativeBGAnim = DecorativeBGAnim
            
            local bleedout_clock = LUI.UIImage.new( 0.5, 0.5, -128, 0, 1, 1, -268.5, -140.5 )
            bleedout_clock:setRGB( 1, 0, 0 )
            bleedout_clock:setAlpha( 0.9 )
            bleedout_clock:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_clock_normal" ) )
            bleedout_clock:setShaderVector( 0, -0.03, 0, 0, 0 )
            bleedout_clock:setShaderVector( 1, 0.5, 0, 0, 0 )
            bleedout_clock:setShaderVector( 2, 0.5, 0, 0, 0 )
            bleedout_clock:setShaderVector( 3, 0.18, 0, 0, 0 )
            bleedout_clock:setShaderVector( 4, 4, 0.04, 0, 0 )
            self:addElement( bleedout_clock )
            self.bleedout_clock = bleedout_clock
            
            local revive_clock = LUI.UIImage.new( 0.5, 0.5, 0, 136, 1, 1, -268.5, -140.5 )
            revive_clock:setRGB( 0.12, 1, 0 )
            revive_clock:setYRot( 180 )
            revive_clock:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_clock_normal" ) )
            revive_clock:setShaderVector( 0, -0.21, 0, 0, 0 )
            revive_clock:setShaderVector( 1, 0.5, 0, 0, 0 )
            revive_clock:setShaderVector( 2, 0.5, 0, 0, 0 )
            revive_clock:setShaderVector( 3, 0, 0, 0, 0 )
            revive_clock:setShaderVector( 4, 0, 0.06, 0, 0 )
            self:addElement( revive_clock )
            self.revive_clock = revive_clock
            
            local bleedout_label = LUI.UIText.new( 0.5, 0.5, -100, 100, 1, 1, -370.5, -340.5 )
            bleedout_label:setRGB( ColorSet.T8_ZM_BLUE.r, ColorSet.T8_ZM_BLUE.g, ColorSet.T8_ZM_BLUE.b )
            bleedout_label:setTTF( "skorzhen" )
            bleedout_label:setAlignment( Enum[@"luialignment"][@"lui_alignment_center"] )
            bleedout_label:linkToElementModel( self, "num_downs", true, function ( model )
                  local f2_local0 = model:get()
                  if f2_local0 ~= nil then
                        bleedout_label:setText( CoD.ZombieUtility.GetNumDownsText( f2_local0 ) )
                  end
            end )
            self:addElement( bleedout_label )
            self.bleedout_label = bleedout_label
            
            local ReviveBarBG2 = LUI.UIImage.new( 0.5, 0.5, -148, 148, 1, 1, -320, -292 )
            ReviveBarBG2:setAlpha( 0 )
            ReviveBarBG2:setYRot( 180 )
            ReviveBarBG2:setScale( 0.81, 0.6 )
            ReviveBarBG2:setImage( RegisterImage( @"uie_zm_hud_revive_meterbg" ) )
            self:addElement( ReviveBarBG2 )
            self.ReviveBarBG2 = ReviveBarBG2
            
            local revive_bar = LUI.UIImage.new( 0.5, 0.5, -148, 148, 1, 1, -320, -292 )
            revive_bar:setAlpha( 0 )
            revive_bar:setScale( 0.8, 0.6 )
            revive_bar:setImage( RegisterImage( @"uie_zm_hud_revive_meterfg" ) )
            revive_bar:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_wipe_normal" ) )
            revive_bar:setShaderVector( 1, 0, 0, 0, 0 )
            revive_bar:setShaderVector( 2, 1, 0, 0, 0 )
            revive_bar:setShaderVector( 3, 0, 0, 0, 0 )
            revive_bar:setShaderVector( 4, 0, 0, 0, 0 )
            revive_bar:linkToElementModel( self, "revive_progress", true, function ( model )
                  local f3_local0 = model:get()
                  if f3_local0 ~= nil then
                        revive_bar:setShaderVector( 0, CoD.GetVectorComponentFromString( f3_local0, 1 ), CoD.GetVectorComponentFromString( f3_local0, 2 ), CoD.GetVectorComponentFromString( f3_local0, 3 ), CoD.GetVectorComponentFromString( f3_local0, 4 ) )
                  end
            end )
            self:addElement( revive_bar )
            self.revive_bar = revive_bar
            
            local ReviveBarBG = LUI.UIImage.new( 0.5, 0.5, -148, 148, 1, 1, -340, -312 )
            ReviveBarBG:setImage( RegisterImage( @"uie_zm_hud_revive_meterbg" ) )
            self:addElement( ReviveBarBG )
            self.ReviveBarBG = ReviveBarBG
            
            local bleedout_bar = LUI.UIImage.new( 0.5, 0.5, -148, 148, 1, 1, -340, -312 )
            bleedout_bar:setImage( RegisterImage( @"uie_zm_hud_bleedout_meterfg" ) )
            bleedout_bar:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_wipe_normal" ) )
            bleedout_bar:setShaderVector( 1, 0, 0, 0, 0 )
            bleedout_bar:setShaderVector( 2, 1, 0, 0, 0 )
            bleedout_bar:setShaderVector( 3, 0, 0, 0, 0 )
            bleedout_bar:setShaderVector( 4, 0, 0.02, 0.05, 0 )
            bleedout_bar:linkToElementModel( self, "bleedout_progress", true, function ( model )
                  local f4_local0 = model:get()
                  if f4_local0 ~= nil then
                        bleedout_bar:setShaderVector( 0, CoD.GetVectorComponentFromString( f4_local0, 1 ), CoD.GetVectorComponentFromString( f4_local0, 2 ), CoD.GetVectorComponentFromString( f4_local0, 3 ), CoD.GetVectorComponentFromString( f4_local0, 4 ) )
                  end
            end )
            self:addElement( bleedout_bar )
            self.bleedout_bar = bleedout_bar
            
            local PerkList = LUI.UIList.new( f1_local1, f1_arg0, 16, 0, nil, false, false, false, false )
            PerkList:setLeftRight( 0.5, 0.5, -152, 152 )
            PerkList:setTopBottom( 1, 1, -477, -413 )
            PerkList:setWidgetType( CoD.Hud_ZM_LastStand_Bleedout_Perk_Bar_Item )
            PerkList:setHorizontalCount( 4 )
            PerkList:setSpacing( 16 )
            PerkList:setAlignment( Enum[@"luialignment"][@"lui_alignment_left"] )
            PerkList:setDataSource( "BleedoutPerkVapors" )
            self:addElement( PerkList )
            self.PerkList = PerkList
            
            self:mergeStateConditions( {
                  {
                        stateName = "Trials_HUDDeactivated",
                        condition = function ( menu, element, event )
                              return CoD.HUDUtility.IsAnyGameType( f1_arg0, "ztrials" ) and CoD.ModelUtility.IsGlobalModelValueEqualTo( "ZMHudGlobal.trials.hudDeactivated", 1 )
                        end
                  },
                  {
                        stateName = "Hidden",
                        condition = function ( menu, element, event )
                              local f6_local0 = Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_demo_all_game_hud_hidden"] )
                              if not f6_local0 then
                                    f6_local0 = Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_demo_camera_mode_moviecam"] )
                                    if not f6_local0 then
                                          f6_local0 = Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_final_killcam"] )
                                          if not f6_local0 then
                                                f6_local0 = Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_game_ended"] )
                                                if not f6_local0 then
                                                      if Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_hud_visible"] ) then
                                                            f6_local0 = Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_in_guided_missile"] )
                                                            if not f6_local0 then
                                                                  f6_local0 = Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_in_killcam"] )
                                                                  if not f6_local0 then
                                                                        f6_local0 = Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_nemesis_killcam"] )
                                                                        if not f6_local0 then
                                                                              f6_local0 = Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_play_of_the_match"] )
                                                                              if not f6_local0 then
                                                                                    f6_local0 = Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_round_end_killcam"] )
                                                                                    if not f6_local0 then
                                                                                          f6_local0 = Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_scoreboard_open"] )
                                                                                          if not f6_local0 then
                                                                                                f6_local0 = Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_stage_ended"] )
                                                                                                if not f6_local0 then
                                                                                                      f6_local0 = Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_ui_active"] )
                                                                                                      if not f6_local0 then
                                                                                                            f6_local0 = not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_weapon_hud_visible"] )
                                                                                                      end
                                                                                                end
                                                                                          end
                                                                                    end
                                                                              end
                                                                        end
                                                                  end
                                                            end
                                                      else
                                                            f6_local0 = true
                                                      end
                                                end
                                          end
                                    end
                              end
                              return f6_local0
                        end
                  },
                  {
                        stateName = "ServerPaused",
                        condition = function ( menu, element, event )
                              return CoD.ModelUtility.IsModelValueTrue( f1_arg0, "hudItems.serverPaused" )
                        end
                  },
                  {
                        stateName = "Revive",
                        condition = function ( menu, element, event )
                              return CoD.ModelUtility.IsSelfModelValueGreaterThan( element, f1_arg0, "revive_progress", 0 )
                        end
                  }
            } )
            local f1_local11 = self
            local f1_local12 = self.subscribeToModel
            local f1_local13 = Engine[@"getglobalmodel"]()
            f1_local12( f1_local11, f1_local13["ZMHudGlobal.trials.hudDeactivated"], function ( f9_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f9_arg0:get(),
                        modelName = "ZMHudGlobal.trials.hudDeactivated"
                  } )
            end, false )
            f1_local11 = self
            f1_local12 = self.subscribeToModel
            f1_local13 = Engine[@"getmodelforcontroller"]( f1_arg0 )
            f1_local12( f1_local11, f1_local13["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_demo_all_game_hud_hidden"]], function ( f10_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f10_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_demo_all_game_hud_hidden"]
                  } )
            end, false )
            f1_local11 = self
            f1_local12 = self.subscribeToModel
            f1_local13 = Engine[@"getmodelforcontroller"]( f1_arg0 )
            f1_local12( f1_local11, f1_local13["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_demo_camera_mode_moviecam"]], function ( f11_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f11_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_demo_camera_mode_moviecam"]
                  } )
            end, false )
            f1_local11 = self
            f1_local12 = self.subscribeToModel
            f1_local13 = Engine[@"getmodelforcontroller"]( f1_arg0 )
            f1_local12( f1_local11, f1_local13["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_final_killcam"]], function ( f12_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f12_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_final_killcam"]
                  } )
            end, false )
            f1_local11 = self
            f1_local12 = self.subscribeToModel
            f1_local13 = Engine[@"getmodelforcontroller"]( f1_arg0 )
            f1_local12( f1_local11, f1_local13["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_game_ended"]], function ( f13_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f13_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_game_ended"]
                  } )
            end, false )
            f1_local11 = self
            f1_local12 = self.subscribeToModel
            f1_local13 = Engine[@"getmodelforcontroller"]( f1_arg0 )
            f1_local12( f1_local11, f1_local13["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_hud_visible"]], function ( f14_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f14_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_hud_visible"]
                  } )
            end, false )
            f1_local11 = self
            f1_local12 = self.subscribeToModel
            f1_local13 = Engine[@"getmodelforcontroller"]( f1_arg0 )
            f1_local12( f1_local11, f1_local13["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_guided_missile"]], function ( f15_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f15_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_guided_missile"]
                  } )
            end, false )
            f1_local11 = self
            f1_local12 = self.subscribeToModel
            f1_local13 = Engine[@"getmodelforcontroller"]( f1_arg0 )
            f1_local12( f1_local11, f1_local13["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_killcam"]], function ( f16_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f16_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_killcam"]
                  } )
            end, false )
            f1_local11 = self
            f1_local12 = self.subscribeToModel
            f1_local13 = Engine[@"getmodelforcontroller"]( f1_arg0 )
            f1_local12( f1_local11, f1_local13["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_nemesis_killcam"]], function ( f17_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f17_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_nemesis_killcam"]
                  } )
            end, false )
            f1_local11 = self
            f1_local12 = self.subscribeToModel
            f1_local13 = Engine[@"getmodelforcontroller"]( f1_arg0 )
            f1_local12( f1_local11, f1_local13["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_play_of_the_match"]], function ( f18_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f18_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_play_of_the_match"]
                  } )
            end, false )
            f1_local11 = self
            f1_local12 = self.subscribeToModel
            f1_local13 = Engine[@"getmodelforcontroller"]( f1_arg0 )
            f1_local12( f1_local11, f1_local13["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_round_end_killcam"]], function ( f19_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f19_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_round_end_killcam"]
                  } )
            end, false )
            f1_local11 = self
            f1_local12 = self.subscribeToModel
            f1_local13 = Engine[@"getmodelforcontroller"]( f1_arg0 )
            f1_local12( f1_local11, f1_local13["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_scoreboard_open"]], function ( f20_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f20_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_scoreboard_open"]
                  } )
            end, false )
            f1_local11 = self
            f1_local12 = self.subscribeToModel
            f1_local13 = Engine[@"getmodelforcontroller"]( f1_arg0 )
            f1_local12( f1_local11, f1_local13["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_stage_ended"]], function ( f21_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f21_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_stage_ended"]
                  } )
            end, false )
            f1_local11 = self
            f1_local12 = self.subscribeToModel
            f1_local13 = Engine[@"getmodelforcontroller"]( f1_arg0 )
            f1_local12( f1_local11, f1_local13["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_ui_active"]], function ( f22_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f22_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_ui_active"]
                  } )
            end, false )
            f1_local11 = self
            f1_local12 = self.subscribeToModel
            f1_local13 = Engine[@"getmodelforcontroller"]( f1_arg0 )
            f1_local12( f1_local11, f1_local13["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_weapon_hud_visible"]], function ( f23_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f23_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_weapon_hud_visible"]
                  } )
            end, false )
            f1_local11 = self
            f1_local12 = self.subscribeToModel
            f1_local13 = Engine[@"getmodelforcontroller"]( f1_arg0 )
            f1_local12( f1_local11, f1_local13["hudItems.serverPaused"], function ( f24_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f24_arg0:get(),
                        modelName = "hudItems.serverPaused"
                  } )
            end, false )
            self:linkToElementModel( self, "revive_progress", true, function ( model )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = model:get(),
                        modelName = "revive_progress"
                  } )
            end )
            PerkList.id = "PerkList"
            self:processEvent( {
                  name = "menu_loaded",
                  controller = f1_arg0
            } )
            LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
            
            if PostLoadFunc then
                  PostLoadFunc( self, f1_arg0 )
            end
            
            f1_local12 = self
            CoD.ZMPerkUtility.SubscribeForBleedoutPerkModelUpdate( self, f1_arg0 )

            self:setRGB(1, 0, 1)
            RushPrintInfo("Called", "ZM Laststand")

            return self
      end
      
      CoD.zm_laststand_client.__resetProperties = function ( f26_arg0 )
            f26_arg0.DecorativeBGAnim:completeAnimation()
            f26_arg0.bleedout_bar:completeAnimation()
            f26_arg0.ReviveBarBG:completeAnimation()
            f26_arg0.bleedout_label:completeAnimation()
            f26_arg0.revive_clock:completeAnimation()
            f26_arg0.bleedout_clock:completeAnimation()
            f26_arg0.PerkList:completeAnimation()
            f26_arg0.revive_bar:completeAnimation()
            f26_arg0.ReviveBarBG2:completeAnimation()
            f26_arg0.DecorativeBGAnim:setAlpha( 1 )
            f26_arg0.DecorativeBGAnim:setScale( 1, 1 )
            f26_arg0.bleedout_bar:setAlpha( 1 )
            f26_arg0.bleedout_bar:setScale( 1, 1 )
            f26_arg0.ReviveBarBG:setAlpha( 1 )
            f26_arg0.ReviveBarBG:setScale( 1, 1 )
            f26_arg0.bleedout_label:setAlpha( 1 )
            f26_arg0.bleedout_label:setScale( 1, 1 )
            f26_arg0.revive_clock:setAlpha( 1 )
            f26_arg0.bleedout_clock:setAlpha( 0.9 )
            f26_arg0.PerkList:setAlpha( 1 )
            f26_arg0.revive_bar:setAlpha( 0 )
            f26_arg0.revive_bar:setScale( 0.8, 0.6 )
            f26_arg0.ReviveBarBG2:setAlpha( 0 )
            f26_arg0.ReviveBarBG2:setScale( 0.81, 0.6 )
      end
      
      CoD.zm_laststand_client.__clipsPerState = {
            DefaultState = {
                  DefaultClip = function ( f27_arg0, f27_arg1 )
                        f27_arg0:__resetProperties()
                        f27_arg0:setupElementClipCounter( 4 )
                        local f27_local0 = function ( f28_arg0 )
                              f27_arg0.DecorativeBGAnim:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_both"] )
                              f27_arg0.DecorativeBGAnim:setAlpha( 1 )
                              f27_arg0.DecorativeBGAnim:setScale( 1, 1 )
                              f27_arg0.DecorativeBGAnim:registerEventHandler( "interrupted_keyframe", f27_arg0.clipInterrupted )
                              f27_arg0.DecorativeBGAnim:registerEventHandler( "transition_complete_keyframe", f27_arg0.clipFinished )
                        end
                        
                        f27_arg0.DecorativeBGAnim:completeAnimation()
                        f27_arg0.DecorativeBGAnim:setAlpha( 0 )
                        f27_arg0.DecorativeBGAnim:setScale( 2, 2 )
                        f27_local0( f27_arg0.DecorativeBGAnim )
                        local f27_local1 = function ( f29_arg0 )
                              local f29_local0 = function ( f30_arg0 )
                                    f30_arg0:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_both"] )
                                    f30_arg0:setAlpha( 1 )
                                    f30_arg0:setScale( 1, 1 )
                                    f30_arg0:registerEventHandler( "transition_complete_keyframe", f27_arg0.clipFinished )
                              end
                              
                              f27_arg0.bleedout_label:beginAnimation( 100 )
                              f27_arg0.bleedout_label:registerEventHandler( "interrupted_keyframe", f27_arg0.clipInterrupted )
                              f27_arg0.bleedout_label:registerEventHandler( "transition_complete_keyframe", f29_local0 )
                        end
                        
                        f27_arg0.bleedout_label:completeAnimation()
                        f27_arg0.bleedout_label:setAlpha( 0 )
                        f27_arg0.bleedout_label:setScale( 2, 2 )
                        f27_local1( f27_arg0.bleedout_label )
                        local f27_local2 = function ( f31_arg0 )
                              local f31_local0 = function ( f32_arg0 )
                                    f32_arg0:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_both"] )
                                    f32_arg0:setAlpha( 1 )
                                    f32_arg0:setScale( 1, 1 )
                                    f32_arg0:registerEventHandler( "transition_complete_keyframe", f27_arg0.clipFinished )
                              end
                              
                              f27_arg0.ReviveBarBG:beginAnimation( 200 )
                              f27_arg0.ReviveBarBG:registerEventHandler( "interrupted_keyframe", f27_arg0.clipInterrupted )
                              f27_arg0.ReviveBarBG:registerEventHandler( "transition_complete_keyframe", f31_local0 )
                        end
                        
                        f27_arg0.ReviveBarBG:completeAnimation()
                        f27_arg0.ReviveBarBG:setAlpha( 0 )
                        f27_arg0.ReviveBarBG:setScale( 2, 2 )
                        f27_local2( f27_arg0.ReviveBarBG )
                        local f27_local3 = function ( f33_arg0 )
                              local f33_local0 = function ( f34_arg0 )
                                    f34_arg0:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_both"] )
                                    f34_arg0:setAlpha( 1 )
                                    f34_arg0:setScale( 1, 1 )
                                    f34_arg0:registerEventHandler( "transition_complete_keyframe", f27_arg0.clipFinished )
                              end
                              
                              f27_arg0.bleedout_bar:beginAnimation( 200 )
                              f27_arg0.bleedout_bar:registerEventHandler( "interrupted_keyframe", f27_arg0.clipInterrupted )
                              f27_arg0.bleedout_bar:registerEventHandler( "transition_complete_keyframe", f33_local0 )
                        end
                        
                        f27_arg0.bleedout_bar:completeAnimation()
                        f27_arg0.bleedout_bar:setAlpha( 0 )
                        f27_arg0.bleedout_bar:setScale( 2, 2 )
                        f27_local3( f27_arg0.bleedout_bar )
                  end
            },
            Trials_HUDDeactivated = {
                  DefaultClip = function ( f35_arg0, f35_arg1 )
                        f35_arg0:__resetProperties()
                        f35_arg0:setupElementClipCounter( 9 )
                        f35_arg0.DecorativeBGAnim:completeAnimation()
                        f35_arg0.DecorativeBGAnim:setAlpha( 0 )
                        f35_arg0.clipFinished( f35_arg0.DecorativeBGAnim )
                        f35_arg0.bleedout_clock:completeAnimation()
                        f35_arg0.bleedout_clock:setAlpha( 0 )
                        f35_arg0.clipFinished( f35_arg0.bleedout_clock )
                        f35_arg0.revive_clock:completeAnimation()
                        f35_arg0.revive_clock:setAlpha( 0 )
                        f35_arg0.clipFinished( f35_arg0.revive_clock )
                        f35_arg0.bleedout_label:completeAnimation()
                        f35_arg0.bleedout_label:setAlpha( 0 )
                        f35_arg0.clipFinished( f35_arg0.bleedout_label )
                        f35_arg0.ReviveBarBG2:completeAnimation()
                        f35_arg0.ReviveBarBG2:setAlpha( 0 )
                        f35_arg0.clipFinished( f35_arg0.ReviveBarBG2 )
                        f35_arg0.revive_bar:completeAnimation()
                        f35_arg0.revive_bar:setAlpha( 0 )
                        f35_arg0.clipFinished( f35_arg0.revive_bar )
                        f35_arg0.ReviveBarBG:completeAnimation()
                        f35_arg0.ReviveBarBG:setAlpha( 0 )
                        f35_arg0.clipFinished( f35_arg0.ReviveBarBG )
                        f35_arg0.bleedout_bar:completeAnimation()
                        f35_arg0.bleedout_bar:setAlpha( 0 )
                        f35_arg0.clipFinished( f35_arg0.bleedout_bar )
                        f35_arg0.PerkList:completeAnimation()
                        f35_arg0.PerkList:setAlpha( 0 )
                        f35_arg0.clipFinished( f35_arg0.PerkList )
                  end
            },
            Hidden = {
                  DefaultClip = function ( f36_arg0, f36_arg1 )
                        f36_arg0:__resetProperties()
                        f36_arg0:setupElementClipCounter( 9 )
                        f36_arg0.DecorativeBGAnim:completeAnimation()
                        f36_arg0.DecorativeBGAnim:setAlpha( 0 )
                        f36_arg0.clipFinished( f36_arg0.DecorativeBGAnim )
                        f36_arg0.bleedout_clock:completeAnimation()
                        f36_arg0.bleedout_clock:setAlpha( 0 )
                        f36_arg0.clipFinished( f36_arg0.bleedout_clock )
                        f36_arg0.revive_clock:completeAnimation()
                        f36_arg0.revive_clock:setAlpha( 0 )
                        f36_arg0.clipFinished( f36_arg0.revive_clock )
                        f36_arg0.bleedout_label:completeAnimation()
                        f36_arg0.bleedout_label:setAlpha( 0 )
                        f36_arg0.clipFinished( f36_arg0.bleedout_label )
                        f36_arg0.ReviveBarBG2:completeAnimation()
                        f36_arg0.ReviveBarBG2:setAlpha( 0 )
                        f36_arg0.clipFinished( f36_arg0.ReviveBarBG2 )
                        f36_arg0.revive_bar:completeAnimation()
                        f36_arg0.revive_bar:setAlpha( 0 )
                        f36_arg0.clipFinished( f36_arg0.revive_bar )
                        f36_arg0.ReviveBarBG:completeAnimation()
                        f36_arg0.ReviveBarBG:setAlpha( 0 )
                        f36_arg0.clipFinished( f36_arg0.ReviveBarBG )
                        f36_arg0.bleedout_bar:completeAnimation()
                        f36_arg0.bleedout_bar:setAlpha( 0 )
                        f36_arg0.clipFinished( f36_arg0.bleedout_bar )
                        f36_arg0.PerkList:completeAnimation()
                        f36_arg0.PerkList:setAlpha( 0 )
                        f36_arg0.clipFinished( f36_arg0.PerkList )
                  end
            },
            ServerPaused = {
                  DefaultClip = function ( f37_arg0, f37_arg1 )
                        f37_arg0:__resetProperties()
                        f37_arg0:setupElementClipCounter( 9 )
                        f37_arg0.DecorativeBGAnim:completeAnimation()
                        f37_arg0.DecorativeBGAnim:setAlpha( 0 )
                        f37_arg0.clipFinished( f37_arg0.DecorativeBGAnim )
                        f37_arg0.bleedout_clock:completeAnimation()
                        f37_arg0.bleedout_clock:setAlpha( 0 )
                        f37_arg0.clipFinished( f37_arg0.bleedout_clock )
                        f37_arg0.revive_clock:completeAnimation()
                        f37_arg0.revive_clock:setAlpha( 0 )
                        f37_arg0.clipFinished( f37_arg0.revive_clock )
                        f37_arg0.bleedout_label:completeAnimation()
                        f37_arg0.bleedout_label:setAlpha( 0 )
                        f37_arg0.clipFinished( f37_arg0.bleedout_label )
                        f37_arg0.ReviveBarBG2:completeAnimation()
                        f37_arg0.ReviveBarBG2:setAlpha( 0 )
                        f37_arg0.clipFinished( f37_arg0.ReviveBarBG2 )
                        f37_arg0.revive_bar:completeAnimation()
                        f37_arg0.revive_bar:setAlpha( 0 )
                        f37_arg0.clipFinished( f37_arg0.revive_bar )
                        f37_arg0.ReviveBarBG:completeAnimation()
                        f37_arg0.ReviveBarBG:setAlpha( 0 )
                        f37_arg0.clipFinished( f37_arg0.ReviveBarBG )
                        f37_arg0.bleedout_bar:completeAnimation()
                        f37_arg0.bleedout_bar:setAlpha( 0 )
                        f37_arg0.clipFinished( f37_arg0.bleedout_bar )
                        f37_arg0.PerkList:completeAnimation()
                        f37_arg0.PerkList:setAlpha( 0 )
                        f37_arg0.clipFinished( f37_arg0.PerkList )
                  end
            },
            Revive = {
                  DefaultClip = function ( f38_arg0, f38_arg1 )
                        f38_arg0:__resetProperties()
                        f38_arg0:setupElementClipCounter( 2 )
                        local f38_local0 = function ( f39_arg0 )
                              f38_arg0.ReviveBarBG2:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_both"] )
                              f38_arg0.ReviveBarBG2:setAlpha( 1 )
                              f38_arg0.ReviveBarBG2:setScale( 0.81, 0.6 )
                              f38_arg0.ReviveBarBG2:registerEventHandler( "interrupted_keyframe", f38_arg0.clipInterrupted )
                              f38_arg0.ReviveBarBG2:registerEventHandler( "transition_complete_keyframe", f38_arg0.clipFinished )
                        end
                        
                        f38_arg0.ReviveBarBG2:completeAnimation()
                        f38_arg0.ReviveBarBG2:setAlpha( 0 )
                        f38_arg0.ReviveBarBG2:setScale( 1.62, 1.2 )
                        f38_local0( f38_arg0.ReviveBarBG2 )
                        local f38_local1 = function ( f40_arg0 )
                              f38_arg0.revive_bar:beginAnimation( 200, Enum[@"luitween"][@"luitween_ease_both"] )
                              f38_arg0.revive_bar:setAlpha( 1 )
                              f38_arg0.revive_bar:setScale( 0.8, 0.6 )
                              f38_arg0.revive_bar:registerEventHandler( "interrupted_keyframe", f38_arg0.clipInterrupted )
                              f38_arg0.revive_bar:registerEventHandler( "transition_complete_keyframe", f38_arg0.clipFinished )
                        end
                        
                        f38_arg0.revive_bar:completeAnimation()
                        f38_arg0.revive_bar:setAlpha( 0 )
                        f38_arg0.revive_bar:setScale( 1.6, 1.2 )
                        f38_local1( f38_arg0.revive_bar )
                  end
            }
      }

      CoD.zm_laststand_client.__onClose = function ( f41_arg0 )
            f41_arg0.DecorativeBGAnim:close()
            f41_arg0.bleedout_label:close()
            f41_arg0.revive_bar:close()
            f41_arg0.bleedout_bar:close()
            f41_arg0.PerkList:close()
      end
      
      -- Perks Widget Laststand
      CoD.Hud_ZM_LastStand_Bleedout_Perk_Bar_Item = InheritFrom( LUI.UIElement )
      CoD.Hud_ZM_LastStand_Bleedout_Perk_Bar_Item.__defaultWidth = 64
      CoD.Hud_ZM_LastStand_Bleedout_Perk_Bar_Item.__defaultHeight = 64
      CoD.Hud_ZM_LastStand_Bleedout_Perk_Bar_Item.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            self:setClass( CoD.Hud_ZM_LastStand_Bleedout_Perk_Bar_Item )
            self.id = "Hud_ZM_LastStand_Bleedout_Perk_Bar_Item"
            self.soundSet = "default"
            self.anyChildUsesUpdateState = true
            
            local MetalFrame = LUI.UIImage.new( 0, 1, -2, 2, 0, 1, -2, 2 )
            MetalFrame:setImage( RegisterImage( @"uie_ui_zm_laboratory_buttonframe" ) )
            MetalFrame:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_nineslice_normal" ) )
            MetalFrame:setShaderVector( 0, 0, 0, 0, 0 )
            MetalFrame:setupNineSliceShader( 14, 14 )
            self:addElement( MetalFrame )
            self.MetalFrame = MetalFrame
            
            local PerkIcon = CoD.Hud_ZM_LastStand_Bleedout_Perk_Bar_Item_Perk.new( f1_arg0, f1_arg1, 0, 0, 0, 64, 0, 0, 0, 64 )
            PerkIcon:linkToElementModel( self, nil, false, function ( model )
                  PerkIcon:setModel( model, f1_arg1 )
            end )
            self:addElement( PerkIcon )
            self.PerkIcon = PerkIcon
            
            local PerkIconOveralay = LUI.UIImage.new( 0, 0, 0, 64, 0, 0, 0, 64 )
            PerkIconOveralay:setRGB( 1, 0.98, 0.73 )
            PerkIconOveralay:setAlpha( 0 )
            PerkIconOveralay:setZRot( 90 )
            PerkIconOveralay:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_wipe_normal" ) )
            PerkIconOveralay:setShaderVector( 0, 1, 0, 0, 0 )
            PerkIconOveralay:setShaderVector( 1, 0, 0, 0, 0 )
            PerkIconOveralay:setShaderVector( 3, 0, 0, 0, 0 )
            PerkIconOveralay:setShaderVector( 4, 0, 0, 0, 0 )
            PerkIconOveralay:linkToElementModel( self, "bleedoutProgress", true, function ( model )
                  local f3_local0 = model:get()
                  if f3_local0 ~= nil then
                        PerkIconOveralay:setShaderVector( 2, CoD.GetVectorComponentFromString( f3_local0, 1 ), CoD.GetVectorComponentFromString( f3_local0, 2 ), CoD.GetVectorComponentFromString( f3_local0, 3 ), CoD.GetVectorComponentFromString( f3_local0, 4 ) )
                  end
            end )
            self:addElement( PerkIconOveralay )
            self.PerkIconOveralay = PerkIconOveralay
            
            LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
            
            if PostLoadFunc then
                  PostLoadFunc( self, f1_arg1, f1_arg0 )
            end
            
            return self
      end
      
      CoD.Hud_ZM_LastStand_Bleedout_Perk_Bar_Item.__onClose = function ( f4_arg0 )
            f4_arg0.PerkIcon:close()
            f4_arg0.PerkIconOveralay:close()
      end

      -- Perk Icon Laststand
      CoD.Hud_ZM_LastStand_Bleedout_Perk_Bar_Item_Perk = InheritFrom( LUI.UIElement )
      CoD.Hud_ZM_LastStand_Bleedout_Perk_Bar_Item_Perk.__defaultWidth = 64
      CoD.Hud_ZM_LastStand_Bleedout_Perk_Bar_Item_Perk.__defaultHeight = 64
      CoD.Hud_ZM_LastStand_Bleedout_Perk_Bar_Item_Perk.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            self:setClass( CoD.Hud_ZM_LastStand_Bleedout_Perk_Bar_Item_Perk )
            self.id = "Hud_ZM_LastStand_Bleedout_Perk_Bar_Item_Perk"
            self.soundSet = "default"
            f1_arg0:addElementToPendingUpdateStateList( self )
            
            local StoneTiledBacking = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
            StoneTiledBacking:setRGB( 1, 0, 0 )
            StoneTiledBacking:setAlpha( 0.8 )
            StoneTiledBacking:setImage( RegisterImage( @"uie_ui_zm_laboratory_buttonbgtile" ) )
            StoneTiledBacking:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_16CBE95C250C6D15" ) )
            StoneTiledBacking:setShaderVector( 0, 0, 0, 0, 0 )
            StoneTiledBacking:setupNineSliceShader( 196, 88 )
            self:addElement( StoneTiledBacking )
            self.StoneTiledBacking = StoneTiledBacking
            
            local SkullImage = LUI.UIImage.new( 0, 0, 7, 57, 0, 0, 7, 57 )
            SkullImage:setAlpha( 0 )
            SkullImage:setImage( RegisterImage( @"ui_hud_zm_deathperception" ) )
            self:addElement( SkullImage )
            self.SkullImage = SkullImage
            
            local PerkIcon = LUI.UIImage.new( 0, 0, 7, 57, 0, 0, 7, 57 )
            PerkIcon:setRGB( 0.79, 0.79, 0.79 )
            PerkIcon:setScale( 1.45, 1.45 )
            PerkIcon:setAlpha( 0.5 )
            PerkIcon:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_saturation_normal" ) )
            PerkIcon:setShaderVector( 0, 0, 0, 0, 0 )
            PerkIcon:linkToElementModel( self, "itemIndex", true, function ( model )
                  local f2_local0 = model:get()
                  if f2_local0 ~= nil then
                        PerkIcon:setImage( RegisterImage( GetItemImageFromIndex( Enum[@"statindexoffset"][@"hash_49AF82A21BAD026D"], f2_local0 ) ) )
                  end
            end )
            self:addElement( PerkIcon )
            self.PerkIcon = PerkIcon
            
            local PerkIcon2 = LUI.UIImage.new( 0, 0, 7, 57, 0, 0, 7, 57 )
            PerkIcon2:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_wipe_normal" ) )
            PerkIcon2:setScale( 1.45, 1.45 )
            PerkIcon2:setShaderVector( 1, 0, 0, 0, 0 )
            PerkIcon2:setShaderVector( 2, 1, 0, 0, 0 )
            PerkIcon2:setShaderVector( 3, 0, 0, 0, 0 )
            PerkIcon2:setShaderVector( 4, 0, 0, 0, 0 )
            PerkIcon2:linkToElementModel( self, "itemIndex", true, function ( model )
                  local f3_local0 = model:get()
                  if f3_local0 ~= nil then
                        PerkIcon2:setImage( RegisterImage( GetItemImageFromIndex( Enum[@"statindexoffset"][@"hash_49AF82A21BAD026D"], f3_local0 ) ) )
                  end
            end )
            PerkIcon2:linkToElementModel( self, "bleedoutProgress", true, function ( model )
                  local f4_local0 = model:get()
                  if f4_local0 ~= nil then
                        PerkIcon2:setShaderVector( 0, CoD.GetVectorComponentFromString( f4_local0, 1 ), CoD.GetVectorComponentFromString( f4_local0, 2 ), CoD.GetVectorComponentFromString( f4_local0, 3 ), CoD.GetVectorComponentFromString( f4_local0, 4 ) )
                  end
            end )
            self:addElement( PerkIcon2 )
            self.PerkIcon2 = PerkIcon2
            
            self:mergeStateConditions( {
                  {
                        stateName = "Skull",
                        condition = function ( menu, element, event )
                              return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "isFirst" )
                        end
                  },
                  {
                        stateName = "Empty",
                        condition = function ( menu, element, event )
                              return CoD.ModelUtility.IsSelfModelValueEqualToEnumEitherValue( element, f1_arg1, "state", CoD.ZMPerkUtility.PerkVaporStates.DEFAULT, CoD.ZMPerkUtility.PerkVaporStates.HIDDEN )
                        end
                  },
                  {
                        stateName = "Perk",
                        condition = function ( menu, element, event )
                              return CoD.ModelUtility.IsSelfModelValueGreaterThan( element, f1_arg1, "bleedoutProgress", 0 )
                        end
                  }
            } )
            self:linkToElementModel( self, "isFirst", true, function ( model )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = model:get(),
                        modelName = "isFirst"
                  } )
            end )
            self:linkToElementModel( self, "state", true, function ( model )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = model:get(),
                        modelName = "state"
                  } )
            end )
            self:linkToElementModel( self, "bleedoutProgress", true, function ( model )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = model:get(),
                        modelName = "bleedoutProgress"
                  } )
            end )
            LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
            
            if PostLoadFunc then
                  PostLoadFunc( self, f1_arg1, f1_arg0 )
            end

            RushPrintInfo("Called", "ZM Laststand Perk Icons")

            return self
      end
      
      CoD.Hud_ZM_LastStand_Bleedout_Perk_Bar_Item_Perk.__resetProperties = function ( f11_arg0 )
            f11_arg0.PerkIcon:completeAnimation()
            f11_arg0.SkullImage:completeAnimation()
            f11_arg0.PerkIcon2:completeAnimation()
            f11_arg0.PerkIcon:setAlpha( 0.5 )
            f11_arg0.SkullImage:setAlpha( 0 )
            f11_arg0.PerkIcon2:setAlpha( 1 )
      end
      
      CoD.Hud_ZM_LastStand_Bleedout_Perk_Bar_Item_Perk.__clipsPerState = {
            DefaultState = {
                  DefaultClip = function ( f12_arg0, f12_arg1 )
                        f12_arg0:__resetProperties()
                        f12_arg0:setupElementClipCounter( 2 )
                        f12_arg0.SkullImage:completeAnimation()
                        f12_arg0.SkullImage:setAlpha( 0 )
                        f12_arg0.clipFinished( f12_arg0.SkullImage )
                        f12_arg0.PerkIcon:completeAnimation()
                        f12_arg0.PerkIcon:setAlpha( 0 )
                        f12_arg0.clipFinished( f12_arg0.PerkIcon )
                  end
            },
            Skull = {
                  DefaultClip = function ( f13_arg0, f13_arg1 )
                        f13_arg0:__resetProperties()
                        f13_arg0:setupElementClipCounter( 3 )
                        f13_arg0.SkullImage:completeAnimation()
                        f13_arg0.SkullImage:setAlpha( 1 )
                        f13_arg0.clipFinished( f13_arg0.SkullImage )
                        f13_arg0.PerkIcon:completeAnimation()
                        f13_arg0.PerkIcon:setAlpha( 0 )
                        f13_arg0.clipFinished( f13_arg0.PerkIcon )
                        f13_arg0.PerkIcon2:completeAnimation()
                        f13_arg0.PerkIcon2:setAlpha( 0 )
                        f13_arg0.clipFinished( f13_arg0.PerkIcon2 )
                  end
            },
            Empty = {
                  DefaultClip = function ( f14_arg0, f14_arg1 )
                        f14_arg0:__resetProperties()
                        f14_arg0:setupElementClipCounter( 2 )
                        f14_arg0.PerkIcon:completeAnimation()
                        f14_arg0.PerkIcon:setAlpha( 0 )
                        f14_arg0.clipFinished( f14_arg0.PerkIcon )
                        f14_arg0.PerkIcon2:completeAnimation()
                        f14_arg0.PerkIcon2:setAlpha( 0 )
                        f14_arg0.clipFinished( f14_arg0.PerkIcon2 )
                  end
            },
            Perk = {
                  DefaultClip = function ( f15_arg0, f15_arg1 )
                        f15_arg0:__resetProperties()
                        f15_arg0:setupElementClipCounter( 2 )
                        f15_arg0.SkullImage:completeAnimation()
                        f15_arg0.SkullImage:setAlpha( 0 )
                        f15_arg0.clipFinished( f15_arg0.SkullImage )
                        f15_arg0.PerkIcon:completeAnimation()
                        f15_arg0.PerkIcon:setAlpha( 1 )
                        f15_arg0.clipFinished( f15_arg0.PerkIcon )
                  end
            }
      }

      CoD.Hud_ZM_LastStand_Bleedout_Perk_Bar_Item_Perk.__onClose = function ( f16_arg0 )
            f16_arg0.PerkIcon:close()
            f16_arg0.PerkIcon2:close()
      end
            
      -- Self Revive Widget
      CoD.self_revive_visuals = InheritFrom( CoD.Menu )
      LUI.createMenu.self_revive_visuals = function ( f1_arg0, f1_arg1 )
            local self = CoD.Menu.NewForUIEditor( "self_revive_visuals", f1_arg0 )
            local f1_local1 = self
            self:setClass( CoD.self_revive_visuals )
            self.soundSet = "none"
            self:setOwner( f1_arg0 )
            self:setLeftRight( 0, 1, 0, 0 )
            self:setTopBottom( 0, 1, 0, 0 )
            self:playSound( "menu_open", f1_arg0 )
            self.ignoreCursor = true
            f1_local1:addElementToPendingUpdateStateList( self )
            
            local self_revive_progress_bar_fill = LUI.UIImage.new( 0.5, 0.5, -348, 348, 0.435, 0.435, 52.5, 86.5 ) -- changed
            self_revive_progress_bar_fill:setRGB( 0, 0.45, 1 )
            self_revive_progress_bar_fill:setImage( RegisterImage( @"uie_progress_bar_background" ) )
            self_revive_progress_bar_fill:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_wipe_normal" ) )
            self_revive_progress_bar_fill:setShaderVector( 1, 0, 0, 0, 0 )
            self_revive_progress_bar_fill:setShaderVector( 2, 1, 0, 0, 0 )
            self_revive_progress_bar_fill:setShaderVector( 3, 0, 0, 0, 0 )
            self_revive_progress_bar_fill:setShaderVector( 4, 0, 0, 0, 0 )
            self_revive_progress_bar_fill:linkToElementModel( self, "revive_progress", true, function ( model )
                  local f2_local0 = model:get()
                  if f2_local0 ~= nil then
                        self_revive_progress_bar_fill:setShaderVector( 0, CoD.GetVectorComponentFromString( f2_local0, 1 ), CoD.GetVectorComponentFromString( f2_local0, 2 ), CoD.GetVectorComponentFromString( f2_local0, 3 ), CoD.GetVectorComponentFromString( f2_local0, 4 ) )
                  end
            end )
            self:addElement( self_revive_progress_bar_fill )
            self.self_revive_progress_bar_fill = self_revive_progress_bar_fill
            
            local self_revive_progress_text = LUI.UIText.new( 0.5, 0.5, -218.5, 218.5, 0.5, 0.5, 15.5, 52.5 )
            self_revive_progress_text:setText( "^3" .. Engine[@"hash_4F9F1239CFD921FE"]( @"hash_3923A71AA4A500E1" ) .. "!!!" )
            self_revive_progress_text:setTTF( "ttmussels_regular" )
            self_revive_progress_text:setAlignment( Enum[@"luialignment"][@"lui_alignment_center"] )
            self_revive_progress_text:setAlignment( Enum[@"luialignment"][@"lui_alignment_bottom"] )
            self:addElement( self_revive_progress_text )
            self.self_revive_progress_text = self_revive_progress_text
            
            self:mergeStateConditions( {
                  {
                        stateName = "Hidden",
                        condition = function ( menu, element, event )
                              local f3_local0 = Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"hash_29BF57CE75A8755E"] )
                              if not f3_local0 then
                                    f3_local0 = Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_spectating_client"] )
                                    if not f3_local0 then
                                          f3_local0 = Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_ui_active"] )
                                    end
                              end
                              return f3_local0
                        end
                  }
            } )
            local f1_local4 = self
            local f1_local5 = self.subscribeToModel
            local f1_local6 = Engine[@"getmodelforcontroller"]( f1_arg0 )
            f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"hash_29BF57CE75A8755E"]], function ( f4_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f4_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"hash_29BF57CE75A8755E"]
                  } )
            end, false )
            f1_local4 = self
            f1_local5 = self.subscribeToModel
            f1_local6 = Engine[@"getmodelforcontroller"]( f1_arg0 )
            f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_spectating_client"]], function ( f5_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f5_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_spectating_client"]
                  } )
            end, false )
            f1_local4 = self
            f1_local5 = self.subscribeToModel
            f1_local6 = Engine[@"getmodelforcontroller"]( f1_arg0 )
            f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_ui_active"]], function ( f6_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f6_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_ui_active"]
                  } )
            end, false )
            self:processEvent( {
                  name = "menu_loaded",
                  controller = f1_arg0
            } )
            LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
            
            if PostLoadFunc then
                  PostLoadFunc( self, f1_arg0 )
            end
            
            self:setRGB(0, 1, 1)
            RushPrintInfo("Called", "Self Revive Visuals")

            return self
      end
      
      CoD.self_revive_visuals.__resetProperties = function ( f7_arg0 )
            f7_arg0.self_revive_progress_text:completeAnimation()
            f7_arg0.self_revive_progress_bar_fill:completeAnimation()
            f7_arg0.self_revive_progress_text:setAlpha( 1 )
            f7_arg0.self_revive_progress_bar_fill:setAlpha( 1 )
      end
      
      CoD.self_revive_visuals.__clipsPerState = {
            DefaultState = {
                  DefaultClip = function ( f8_arg0, f8_arg1 )
                        f8_arg0:__resetProperties()
                        f8_arg0:setupElementClipCounter( 0 )
                  end
            },
            Hidden = {
                  DefaultClip = function ( f9_arg0, f9_arg1 )
                        f9_arg0:__resetProperties()
                        f9_arg0:setupElementClipCounter( 2 )
                        f9_arg0.self_revive_progress_bar_fill:completeAnimation()
                        f9_arg0.self_revive_progress_bar_fill:setAlpha( 0 )
                        f9_arg0.clipFinished( f9_arg0.self_revive_progress_bar_fill )
                        f9_arg0.self_revive_progress_text:completeAnimation()
                        f9_arg0.self_revive_progress_text:setAlpha( 0 )
                        f9_arg0.clipFinished( f9_arg0.self_revive_progress_text )
                  end
            }
      }

      CoD.self_revive_visuals.__onClose = function ( f10_arg0 )
            f10_arg0.self_revive_progress_bar_fill:close()
      end
            
      -- Towers Crowd
      CoD.zm_towers_crowd_meter = InheritFrom( CoD.Menu )
      CoD.zm_towers_crowd_meter.__stateMap = {
            "DefaultState",
            "crowd_server_paused",
            "crowd_loathes",
            "crowd_hates",
            "crowd_no_love",
            "crowd_warm_up",
            "crowd_likes",
            "crowd_loves",
            "crowd_power_up_available_good",
            "crowd_power_up_available_bad",
            "crowd_power_up_available_good_partial",
            "crowd_power_up_available_bad_partial"
      }

      LUI.createMenu.zm_towers_crowd_meter = function ( f1_arg0, f1_arg1 )
            local self = CoD.Menu.NewForUIEditor( "zm_towers_crowd_meter", f1_arg0 )
            local f1_local1 = self
            self:setClass( CoD.zm_towers_crowd_meter )
            self.soundSet = "none"
            self:setOwner( f1_arg0 )
            self:setLeftRight( 0, 1, 0, 0 )
            self:setTopBottom( 0, 1, 0, 0 )
            self:playSound( "menu_open", f1_arg0 )
            self.ignoreCursor = true
            f1_local1:addElementToPendingUpdateStateList( self )
            
            local smokewidget = CoD.smokewidget.new( f1_local1, f1_arg0, 0, 0, 235, 508, 1, 1, -338, 19 )
            smokewidget:setRGB( 1, 0, 0 )
            smokewidget:setAlpha( 0 )
            smokewidget:setScale( 0.3, 0.6 )
            smokewidget:setRFTMaterial( LUI.UIImage.GetCachedMaterial( @"ui_add" ) )
            self:addElement( smokewidget )
            self.smokewidget = smokewidget
            
            local smokewidget2 = CoD.smokewidget.new( f1_local1, f1_arg0, 0, 0, 235, 508, 1, 1, -338, 19 )
            smokewidget2:setRGB( 1, 0, 0 )
            smokewidget2:setAlpha( 0 )
            smokewidget2:setScale( 0.3, 0.6 )
            smokewidget2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( @"ui_add" ) )
            self:addElement( smokewidget2 )
            self.smokewidget2 = smokewidget2
            
            local Image00 = LUI.UIImage.new( 0, 0, 327, 442, 1, 1, -245.5, -116.5 )
            Image00:setRGB( 0, 1, 0.17 )
            Image00:setAlpha( 0 )
            Image00:setImage( RegisterImage( @"uie_t7_zm_hud_rnd_spkseq1" ) )
            Image00:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_flipbook_add" ) )
            Image00:setShaderVector( 0, 10, 2, 0, 0 )
            Image00:setShaderVector( 1, 30, 0, 0, 0 )
            self:addElement( Image00 )
            self.Image00 = Image00
            
            local ZmAmmoParticleFX3right = CoD.ZmAmmo_ParticleFX.new( f1_local1, f1_arg0, 0, 0, 259, 474, 1, 1, -234.5, -122.5 )
            ZmAmmoParticleFX3right:setRGB( 0, 1, 0.17 )
            ZmAmmoParticleFX3right:setAlpha( 0 )
            ZmAmmoParticleFX3right:setZRot( 270 )
            ZmAmmoParticleFX3right:setScale( 0.7, 0.7 )
            ZmAmmoParticleFX3right:setRFTMaterial( LUI.UIImage.GetCachedMaterial( @"ui_add" ) )
            ZmAmmoParticleFX3right.p1:setAlpha( 0 )
            ZmAmmoParticleFX3right.p2:setAlpha( 0 )
            self:addElement( ZmAmmoParticleFX3right )
            self.ZmAmmoParticleFX3right = ZmAmmoParticleFX3right
            
            local ZmAmmoParticleFX2right = CoD.ZmAmmo_ParticleFX.new( f1_local1, f1_arg0, 0, 0, 264, 479, 1, 1, -258.5, -146.5 )
            ZmAmmoParticleFX2right:setRGB( 0, 1, 0.17 )
            ZmAmmoParticleFX2right:setAlpha( 0 )
            ZmAmmoParticleFX2right:setZRot( 270 )
            ZmAmmoParticleFX2right:setScale( 0.7, 0.7 )
            ZmAmmoParticleFX2right:setRFTMaterial( LUI.UIImage.GetCachedMaterial( @"ui_add" ) )
            ZmAmmoParticleFX2right.p1:setAlpha( 0 )
            ZmAmmoParticleFX2right.p3:setAlpha( 0 )
            self:addElement( ZmAmmoParticleFX2right )
            self.ZmAmmoParticleFX2right = ZmAmmoParticleFX2right
            
            local CrowdImageGlow = LUI.UIImage.new( 0, 0, 320, 404, 1, 1, -188.5, -104.5 )
            CrowdImageGlow:setAlpha( 0 )
            CrowdImageGlow:setScale( 0.7, 0.7 )
            CrowdImageGlow:setImage( RegisterImage( @"hash_1FD351064E08479" ) )
            self:addElement( CrowdImageGlow )
            self.CrowdImageGlow = CrowdImageGlow
            
            local CrowdImage = LUI.UIImage.new( 0, 0, 320, 404, 1, 1, -188.5, -104.5 )
            CrowdImage:setScale( 0.7, 0.7 )
            CrowdImage:setImage( RegisterImage( @"hash_1BA8B5F65C257C37" ) )
            self:addElement( CrowdImage )
            self.CrowdImage = CrowdImage
            
            local CrowdItem = LUI.UIText.new( 0, 0, 405, 1111, 1, 1, -143.5, -119.5 )
            CrowdItem:setAlpha( 0 )
            CrowdItem:setText( Engine[@"hash_4F9F1239CFD921FE"]( @"hash_363C7C5ACA8BCAFB" ) )
            CrowdItem:setTTF( "skorzhen" )
            CrowdItem:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_90D57B1E92D39D7" ) )
            CrowdItem:setShaderVector( 0, 0.5, 0, 0, 0 )
            CrowdItem:setShaderVector( 1, 0.5, 0, 0, 0 )
            CrowdItem:setShaderVector( 2, 0, 0, 0, 1 )
            CrowdItem:setAlignment( Enum[@"luialignment"][@"lui_alignment_left"] )
            CrowdItem:setAlignment( Enum[@"luialignment"][@"lui_alignment_top"] )
            self:addElement( CrowdItem )
            self.CrowdItem = CrowdItem
            
            local CrowdTitle = LUI.UIText.new( 0, 0, 405, 1111, 1, 1, -168.5, -144.5 )
            CrowdTitle:setAlpha( 0 )
            CrowdTitle:setText( LocalizeToUpperString( @"hash_7A0AD5A1910EF712" ) )
            CrowdTitle:setTTF( "skorzhen" )
            CrowdTitle:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_90D57B1E92D39D7" ) )
            CrowdTitle:setShaderVector( 0, 0,5, 0, 0, 0 )
            CrowdTitle:setShaderVector( 1, 0,5, 0, 0, 0 )
            CrowdTitle:setShaderVector( 2, 0, 0, 0, 1 )
            CrowdTitle:setAlignment( Enum[@"luialignment"][@"lui_alignment_left"] )
            CrowdTitle:setAlignment( Enum[@"luialignment"][@"lui_alignment_top"] )
            self:addElement( CrowdTitle )
            self.CrowdTitle = CrowdTitle
            
            LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller, f2_arg2, f2_arg3, f2_arg4 )
                  if not IsSelfInState( self, "crowd_server_paused" ) then
                        SetProperty( self, "_restoreState", f2_arg2 )
                  end
            end )
            self:subscribeToGlobalModel( f1_arg0, "GlobalModel", nil, function ( model )
                  local f3_local0 = self
                  CoD.ZMInventoryUtility.SetupHideIfVisBit( self, f1_arg0, Enum[@"uivisibilitybit"][@"bit_scoreboard_open"] )
            end )
            self:subscribeToGlobalModel( f1_arg0, "PerController", "hudItems.serverPaused", function ( model )
                  local f4_local0 = self
                  CoD.HUDUtility.UpdateZMTowersCrowdMeterState( self, model, f1_arg0 )
            end )
            self:processEvent( {
                  name = "menu_loaded",
                  controller = f1_arg0
            } )
            LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
            
            if PostLoadFunc then
                  PostLoadFunc( self, f1_arg0 )
            end
            
            local f1_local11 = self
            SizeToSafeArea( self, f1_arg0 )

            self:setRGB(1, 0, 1)
            RushPrintInfo("Called", "ZM Towers Crowd Meter")

            return self
      end
      
      CoD.zm_towers_crowd_meter.__resetProperties = function ( f5_arg0 )
            f5_arg0.CrowdImage:completeAnimation()
            f5_arg0.CrowdTitle:completeAnimation()
            f5_arg0.CrowdItem:completeAnimation()
            f5_arg0.CrowdImageGlow:completeAnimation()
            f5_arg0.ZmAmmoParticleFX2right:completeAnimation()
            f5_arg0.Image00:completeAnimation()
            f5_arg0.smokewidget2:completeAnimation()
            f5_arg0.smokewidget:completeAnimation()
            f5_arg0.ZmAmmoParticleFX3right:completeAnimation()
            f5_arg0.CrowdImage:setRGB( 1, 1, 1 )
            f5_arg0.CrowdImage:setAlpha( 1 )
            f5_arg0.CrowdImage:setZRot( 0 )
            f5_arg0.CrowdTitle:setRGB( 1, 1, 1 )
            f5_arg0.CrowdTitle:setAlpha( 0 )
            f5_arg0.CrowdTitle:setZRot( 0 )
            f5_arg0.CrowdItem:setRGB( 1, 1, 1 )
            f5_arg0.CrowdItem:setAlpha( 0 )
            f5_arg0.CrowdImageGlow:setRGB( 1, 1, 1 )
            f5_arg0.CrowdImageGlow:setAlpha( 0 )
            f5_arg0.CrowdImageGlow:setZRot( 0 )
            f5_arg0.CrowdImageGlow:setScale( 0.7, 0.7 )
            f5_arg0.ZmAmmoParticleFX2right:setLeftRight( 0, 0, 264, 479 )
            f5_arg0.ZmAmmoParticleFX2right:setTopBottom( 1, 1, -258.5, -146.5 )
            f5_arg0.ZmAmmoParticleFX2right:setAlpha( 0 )
            f5_arg0.Image00:setAlpha( 0 )
            f5_arg0.smokewidget2:setAlpha( 0 )
            f5_arg0.smokewidget:setAlpha( 0 )
            f5_arg0.ZmAmmoParticleFX3right:setLeftRight( 0, 0, 259, 474 )
            f5_arg0.ZmAmmoParticleFX3right:setTopBottom( 1, 1, -234.5, -122.5 )
            f5_arg0.ZmAmmoParticleFX3right:setAlpha( 0 )
      end
      
      CoD.zm_towers_crowd_meter.__clipsPerState = {
            DefaultState = {
                  DefaultClip = function ( f6_arg0, f6_arg1 )
                        f6_arg0:__resetProperties()
                        f6_arg0:setupElementClipCounter( 0 )
                  end,
                  Intro = function ( f7_arg0, f7_arg1 )
                        f7_arg0:__resetProperties()
                        f7_arg0:setupElementClipCounter( 2 )
                        local f7_local0 = function ( f8_arg0 )
                              f7_arg0.CrowdImage:beginAnimation( 990 )
                              f7_arg0.CrowdImage:setAlpha( 1 )
                              f7_arg0.CrowdImage:registerEventHandler( "interrupted_keyframe", f7_arg0.clipInterrupted )
                              f7_arg0.CrowdImage:registerEventHandler( "transition_complete_keyframe", f7_arg0.clipFinished )
                        end
                        
                        f7_arg0.CrowdImage:completeAnimation()
                        f7_arg0.CrowdImage:setAlpha( 0 )
                        f7_local0( f7_arg0.CrowdImage )
                        local f7_local1 = function ( f9_arg0 )
                              local f9_local0 = function ( f10_arg0 )
                                    local f10_local0 = function ( f11_arg0 )
                                          local f11_local0 = function ( f12_arg0 )
                                                local f12_local0 = function ( f13_arg0 )
                                                      local f13_local0 = function ( f14_arg0 )
                                                            f14_arg0:beginAnimation( 600 )
                                                            f14_arg0:setAlpha( 1 )
                                                            f14_arg0:registerEventHandler( "transition_complete_keyframe", f7_arg0.clipFinished )
                                                      end
                                                      
                                                      f13_arg0:beginAnimation( 189 )
                                                      f13_arg0:setAlpha( 0 )
                                                      f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
                                                end
                                                
                                                f12_arg0:beginAnimation( 210 )
                                                f12_arg0:setAlpha( 1 )
                                                f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
                                          end
                                          
                                          f11_arg0:beginAnimation( 199 )
                                          f11_arg0:setAlpha( 0 )
                                          f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
                                    end
                                    
                                    f10_arg0:beginAnimation( 210 )
                                    f10_arg0:setAlpha( 1 )
                                    f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
                              end
                              
                              f7_arg0.CrowdTitle:beginAnimation( 990 )
                              f7_arg0.CrowdTitle:registerEventHandler( "interrupted_keyframe", f7_arg0.clipInterrupted )
                              f7_arg0.CrowdTitle:registerEventHandler( "transition_complete_keyframe", f9_local0 )
                        end
                        
                        f7_arg0.CrowdTitle:completeAnimation()
                        f7_arg0.CrowdTitle:setAlpha( 0 )
                        f7_local1( f7_arg0.CrowdTitle )
                  end,
                  crowd_warm_up = function ( f15_arg0, f15_arg1 )
                        f15_arg0:__resetProperties()
                        f15_arg0:setupElementClipCounter( 2 )
                        local f15_local0 = function ( f16_arg0 )
                              f15_arg0.CrowdImage:beginAnimation( 1000 )
                              f15_arg0.CrowdImage:setRGB( 0.75, 0.91, 0.8 )
                              f15_arg0.CrowdImage:setZRot( 33 )
                              f15_arg0.CrowdImage:registerEventHandler( "interrupted_keyframe", f15_arg0.clipInterrupted )
                              f15_arg0.CrowdImage:registerEventHandler( "transition_complete_keyframe", f15_arg0.clipFinished )
                        end
                        
                        f15_arg0.CrowdImage:completeAnimation()
                        f15_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f15_arg0.CrowdImage:setZRot( 0 )
                        f15_local0( f15_arg0.CrowdImage )
                        local f15_local1 = function ( f17_arg0 )
                              f15_arg0.CrowdTitle:beginAnimation( 1000 )
                              f15_arg0.CrowdTitle:setRGB( 0.75, 0.91, 0.8 )
                              f15_arg0.CrowdTitle:registerEventHandler( "interrupted_keyframe", f15_arg0.clipInterrupted )
                              f15_arg0.CrowdTitle:registerEventHandler( "transition_complete_keyframe", f15_arg0.clipFinished )
                        end
                        
                        f15_arg0.CrowdTitle:completeAnimation()
                        f15_arg0.CrowdTitle:setRGB( 1, 1, 1 )
                        f15_local1( f15_arg0.CrowdTitle )
                  end,
                  crowd_hates = function ( f18_arg0, f18_arg1 )
                        f18_arg0:__resetProperties()
                        f18_arg0:setupElementClipCounter( 2 )
                        local f18_local0 = function ( f19_arg0 )
                              f18_arg0.CrowdImage:beginAnimation( 1000 )
                              f18_arg0.CrowdImage:setRGB( 0.97, 0.64, 0.64 )
                              f18_arg0.CrowdImage:setZRot( -45 )
                              f18_arg0.CrowdImage:registerEventHandler( "interrupted_keyframe", f18_arg0.clipInterrupted )
                              f18_arg0.CrowdImage:registerEventHandler( "transition_complete_keyframe", f18_arg0.clipFinished )
                        end
                        
                        f18_arg0.CrowdImage:completeAnimation()
                        f18_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f18_arg0.CrowdImage:setZRot( 0 )
                        f18_local0( f18_arg0.CrowdImage )
                        local f18_local1 = function ( f20_arg0 )
                              f18_arg0.CrowdTitle:beginAnimation( 1000 )
                              f18_arg0.CrowdTitle:setRGB( 1, 0.58, 0.58 )
                              f18_arg0.CrowdTitle:registerEventHandler( "interrupted_keyframe", f18_arg0.clipInterrupted )
                              f18_arg0.CrowdTitle:registerEventHandler( "transition_complete_keyframe", f18_arg0.clipFinished )
                        end
                        
                        f18_arg0.CrowdTitle:completeAnimation()
                        f18_arg0.CrowdTitle:setRGB( 1, 1, 1 )
                        f18_arg0.CrowdTitle:setZRot( 0 )
                        f18_local1( f18_arg0.CrowdTitle )
                  end
            },
            crowd_server_paused = {
                  DefaultClip = function ( f21_arg0, f21_arg1 )
                        f21_arg0:__resetProperties()
                        f21_arg0:setupElementClipCounter( 8 )
                        f21_arg0.smokewidget:completeAnimation()
                        f21_arg0.smokewidget:setAlpha( 0 )
                        f21_arg0.clipFinished( f21_arg0.smokewidget )
                        f21_arg0.smokewidget2:completeAnimation()
                        f21_arg0.smokewidget2:setAlpha( 0 )
                        f21_arg0.clipFinished( f21_arg0.smokewidget2 )
                        f21_arg0.Image00:completeAnimation()
                        f21_arg0.Image00:setAlpha( 0 )
                        f21_arg0.clipFinished( f21_arg0.Image00 )
                        f21_arg0.ZmAmmoParticleFX2right:completeAnimation()
                        f21_arg0.ZmAmmoParticleFX2right:setAlpha( 0 )
                        f21_arg0.clipFinished( f21_arg0.ZmAmmoParticleFX2right )
                        f21_arg0.CrowdImageGlow:completeAnimation()
                        f21_arg0.CrowdImageGlow:setAlpha( 0 )
                        f21_arg0.clipFinished( f21_arg0.CrowdImageGlow )
                        f21_arg0.CrowdImage:completeAnimation()
                        f21_arg0.CrowdImage:setAlpha( 0 )
                        f21_arg0.clipFinished( f21_arg0.CrowdImage )
                        f21_arg0.CrowdItem:completeAnimation()
                        f21_arg0.CrowdItem:setAlpha( 0 )
                        f21_arg0.clipFinished( f21_arg0.CrowdItem )
                        f21_arg0.CrowdTitle:completeAnimation()
                        f21_arg0.CrowdTitle:setAlpha( 0 )
                        f21_arg0.clipFinished( f21_arg0.CrowdTitle )
                  end
            },
            crowd_loathes = {
                  DefaultClip = function ( f22_arg0, f22_arg1 )
                        f22_arg0:__resetProperties()
                        f22_arg0:setupElementClipCounter( 5 )
                        f22_arg0.smokewidget:completeAnimation()
                        f22_arg0.smokewidget:setAlpha( 1 )
                        f22_arg0.clipFinished( f22_arg0.smokewidget )
                        f22_arg0.smokewidget2:completeAnimation()
                        f22_arg0.smokewidget2:setAlpha( 1 )
                        f22_arg0.clipFinished( f22_arg0.smokewidget2 )
                        f22_arg0.CrowdImageGlow:completeAnimation()
                        f22_arg0.CrowdImageGlow:setRGB( 1, 0, 0 )
                        f22_arg0.CrowdImageGlow:setAlpha( 1 )
                        f22_arg0.CrowdImageGlow:setZRot( 90 )
                        f22_arg0.clipFinished( f22_arg0.CrowdImageGlow )
                        f22_arg0.CrowdImage:completeAnimation()
                        f22_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f22_arg0.CrowdImage:setZRot( 90 )
                        f22_arg0.clipFinished( f22_arg0.CrowdImage )
                        f22_arg0.CrowdTitle:completeAnimation()
                        f22_arg0.CrowdTitle:setRGB( 0.88, 0.04, 0.04 )
                        f22_arg0.clipFinished( f22_arg0.CrowdTitle )
                  end,
                  crowd_hates = function ( f23_arg0, f23_arg1 )
                        f23_arg0:__resetProperties()
                        f23_arg0:setupElementClipCounter( 3 )
                        local f23_local0 = function ( f24_arg0 )
                              f23_arg0.CrowdImageGlow:beginAnimation( 1000 )
                              f23_arg0.CrowdImageGlow:setAlpha( 0.4 )
                              f23_arg0.CrowdImageGlow:setZRot( 40 )
                              f23_arg0.CrowdImageGlow:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
                              f23_arg0.CrowdImageGlow:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
                        end
                        
                        f23_arg0.CrowdImageGlow:completeAnimation()
                        f23_arg0.CrowdImageGlow:setRGB( 1, 0, 0 )
                        f23_arg0.CrowdImageGlow:setAlpha( 1 )
                        f23_arg0.CrowdImageGlow:setZRot( 90 )
                        f23_local0( f23_arg0.CrowdImageGlow )
                        local f23_local1 = function ( f25_arg0 )
                              f23_arg0.CrowdImage:beginAnimation( 1000 )
                              f23_arg0.CrowdImage:setZRot( 40 )
                              f23_arg0.CrowdImage:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
                              f23_arg0.CrowdImage:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
                        end
                        
                        f23_arg0.CrowdImage:completeAnimation()
                        f23_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f23_arg0.CrowdImage:setAlpha( 1 )
                        f23_arg0.CrowdImage:setZRot( 90 )
                        f23_local1( f23_arg0.CrowdImage )
                        local f23_local2 = function ( f26_arg0 )
                              f23_arg0.CrowdTitle:beginAnimation( 1000 )
                              f23_arg0.CrowdTitle:setRGB( 1, 0.58, 0.58 )
                              f23_arg0.CrowdTitle:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
                              f23_arg0.CrowdTitle:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
                        end
                        
                        f23_arg0.CrowdTitle:completeAnimation()
                        f23_arg0.CrowdTitle:setRGB( 0.88, 0.04, 0.04 )
                        f23_arg0.CrowdTitle:setZRot( 0 )
                        f23_local2( f23_arg0.CrowdTitle )
                  end
            },
            crowd_hates = {
                  DefaultClip = function ( f27_arg0, f27_arg1 )
                        f27_arg0:__resetProperties()
                        f27_arg0:setupElementClipCounter( 3 )
                        f27_arg0.CrowdImageGlow:completeAnimation()
                        f27_arg0.CrowdImageGlow:setRGB( 1, 0, 0 )
                        f27_arg0.CrowdImageGlow:setAlpha( 0.4 )
                        f27_arg0.CrowdImageGlow:setZRot( 40 )
                        f27_arg0.clipFinished( f27_arg0.CrowdImageGlow )
                        f27_arg0.CrowdImage:completeAnimation()
                        f27_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f27_arg0.CrowdImage:setZRot( 40 )
                        f27_arg0.clipFinished( f27_arg0.CrowdImage )
                        f27_arg0.CrowdTitle:completeAnimation()
                        f27_arg0.CrowdTitle:setRGB( 1, 0.58, 0.58 )
                        f27_arg0.CrowdTitle:setZRot( 0 )
                        f27_arg0.clipFinished( f27_arg0.CrowdTitle )
                  end,
                  crowd_no_love = function ( f28_arg0, f28_arg1 )
                        f28_arg0:__resetProperties()
                        f28_arg0:setupElementClipCounter( 3 )
                        local f28_local0 = function ( f29_arg0 )
                              f28_arg0.CrowdImageGlow:beginAnimation( 1000 )
                              f28_arg0.CrowdImageGlow:setAlpha( 0 )
                              f28_arg0.CrowdImageGlow:setZRot( 0 )
                              f28_arg0.CrowdImageGlow:registerEventHandler( "interrupted_keyframe", f28_arg0.clipInterrupted )
                              f28_arg0.CrowdImageGlow:registerEventHandler( "transition_complete_keyframe", f28_arg0.clipFinished )
                        end
                        
                        f28_arg0.CrowdImageGlow:completeAnimation()
                        f28_arg0.CrowdImageGlow:setRGB( 1, 0, 0 )
                        f28_arg0.CrowdImageGlow:setAlpha( 0.4 )
                        f28_arg0.CrowdImageGlow:setZRot( 40 )
                        f28_local0( f28_arg0.CrowdImageGlow )
                        local f28_local1 = function ( f30_arg0 )
                              f28_arg0.CrowdImage:beginAnimation( 1000 )
                              f28_arg0.CrowdImage:setZRot( 0 )
                              f28_arg0.CrowdImage:registerEventHandler( "interrupted_keyframe", f28_arg0.clipInterrupted )
                              f28_arg0.CrowdImage:registerEventHandler( "transition_complete_keyframe", f28_arg0.clipFinished )
                        end
                        
                        f28_arg0.CrowdImage:completeAnimation()
                        f28_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f28_arg0.CrowdImage:setZRot( 40 )
                        f28_local1( f28_arg0.CrowdImage )
                        local f28_local2 = function ( f31_arg0 )
                              f28_arg0.CrowdTitle:beginAnimation( 1000 )
                              f28_arg0.CrowdTitle:setRGB( 1, 1, 1 )
                              f28_arg0.CrowdTitle:registerEventHandler( "interrupted_keyframe", f28_arg0.clipInterrupted )
                              f28_arg0.CrowdTitle:registerEventHandler( "transition_complete_keyframe", f28_arg0.clipFinished )
                        end
                        
                        f28_arg0.CrowdTitle:completeAnimation()
                        f28_arg0.CrowdTitle:setRGB( 1, 0.58, 0.58 )
                        f28_arg0.CrowdTitle:setZRot( 0 )
                        f28_local2( f28_arg0.CrowdTitle )
                  end,
                  crowd_loathes = function ( f32_arg0, f32_arg1 )
                        f32_arg0:__resetProperties()
                        f32_arg0:setupElementClipCounter( 3 )
                        local f32_local0 = function ( f33_arg0 )
                              f32_arg0.CrowdImageGlow:beginAnimation( 1000 )
                              f32_arg0.CrowdImageGlow:setAlpha( 1 )
                              f32_arg0.CrowdImageGlow:setZRot( 90 )
                              f32_arg0.CrowdImageGlow:registerEventHandler( "interrupted_keyframe", f32_arg0.clipInterrupted )
                              f32_arg0.CrowdImageGlow:registerEventHandler( "transition_complete_keyframe", f32_arg0.clipFinished )
                        end
                        
                        f32_arg0.CrowdImageGlow:completeAnimation()
                        f32_arg0.CrowdImageGlow:setRGB( 1, 0, 0 )
                        f32_arg0.CrowdImageGlow:setAlpha( 0.4 )
                        f32_arg0.CrowdImageGlow:setZRot( 40 )
                        f32_local0( f32_arg0.CrowdImageGlow )
                        local f32_local1 = function ( f34_arg0 )
                              f32_arg0.CrowdImage:beginAnimation( 1000 )
                              f32_arg0.CrowdImage:setZRot( 90 )
                              f32_arg0.CrowdImage:registerEventHandler( "interrupted_keyframe", f32_arg0.clipInterrupted )
                              f32_arg0.CrowdImage:registerEventHandler( "transition_complete_keyframe", f32_arg0.clipFinished )
                        end
                        
                        f32_arg0.CrowdImage:completeAnimation()
                        f32_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f32_arg0.CrowdImage:setZRot( 40 )
                        f32_local1( f32_arg0.CrowdImage )
                        local f32_local2 = function ( f35_arg0 )
                              f32_arg0.CrowdTitle:beginAnimation( 1000 )
                              f32_arg0.CrowdTitle:setRGB( 0.88, 0.04, 0.04 )
                              f32_arg0.CrowdTitle:registerEventHandler( "interrupted_keyframe", f32_arg0.clipInterrupted )
                              f32_arg0.CrowdTitle:registerEventHandler( "transition_complete_keyframe", f32_arg0.clipFinished )
                        end
                        
                        f32_arg0.CrowdTitle:completeAnimation()
                        f32_arg0.CrowdTitle:setRGB( 1, 0.58, 0.58 )
                        f32_arg0.CrowdTitle:setZRot( 0 )
                        f32_local2( f32_arg0.CrowdTitle )
                  end
            },
            crowd_no_love = {
                  DefaultClip = function ( f36_arg0, f36_arg1 )
                        f36_arg0:__resetProperties()
                        f36_arg0:setupElementClipCounter( 0 )
                  end,
                  crowd_warm_up = function ( f37_arg0, f37_arg1 )
                        f37_arg0:__resetProperties()
                        f37_arg0:setupElementClipCounter( 3 )
                        local f37_local0 = function ( f38_arg0 )
                              f37_arg0.CrowdImageGlow:beginAnimation( 1000 )
                              f37_arg0.CrowdImageGlow:setAlpha( 0.33 )
                              f37_arg0.CrowdImageGlow:setZRot( -33 )
                              f37_arg0.CrowdImageGlow:registerEventHandler( "interrupted_keyframe", f37_arg0.clipInterrupted )
                              f37_arg0.CrowdImageGlow:registerEventHandler( "transition_complete_keyframe", f37_arg0.clipFinished )
                        end
                        
                        f37_arg0.CrowdImageGlow:completeAnimation()
                        f37_arg0.CrowdImageGlow:setRGB( 0, 1, 0.17 )
                        f37_arg0.CrowdImageGlow:setAlpha( 0 )
                        f37_arg0.CrowdImageGlow:setZRot( 0 )
                        f37_local0( f37_arg0.CrowdImageGlow )
                        local f37_local1 = function ( f39_arg0 )
                              f37_arg0.CrowdImage:beginAnimation( 1000 )
                              f37_arg0.CrowdImage:setZRot( -33 )
                              f37_arg0.CrowdImage:registerEventHandler( "interrupted_keyframe", f37_arg0.clipInterrupted )
                              f37_arg0.CrowdImage:registerEventHandler( "transition_complete_keyframe", f37_arg0.clipFinished )
                        end
                        
                        f37_arg0.CrowdImage:completeAnimation()
                        f37_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f37_arg0.CrowdImage:setZRot( 0 )
                        f37_local1( f37_arg0.CrowdImage )
                        local f37_local2 = function ( f40_arg0 )
                              f37_arg0.CrowdTitle:beginAnimation( 1000 )
                              f37_arg0.CrowdTitle:setRGB( 0.75, 0.91, 0.8 )
                              f37_arg0.CrowdTitle:registerEventHandler( "interrupted_keyframe", f37_arg0.clipInterrupted )
                              f37_arg0.CrowdTitle:registerEventHandler( "transition_complete_keyframe", f37_arg0.clipFinished )
                        end
                        
                        f37_arg0.CrowdTitle:completeAnimation()
                        f37_arg0.CrowdTitle:setRGB( 1, 1, 1 )
                        f37_local2( f37_arg0.CrowdTitle )
                  end,
                  crowd_hates = function ( f41_arg0, f41_arg1 )
                        f41_arg0:__resetProperties()
                        f41_arg0:setupElementClipCounter( 3 )
                        local f41_local0 = function ( f42_arg0 )
                              f41_arg0.CrowdImageGlow:beginAnimation( 1000 )
                              f41_arg0.CrowdImageGlow:setAlpha( 0.4 )
                              f41_arg0.CrowdImageGlow:setZRot( 40 )
                              f41_arg0.CrowdImageGlow:registerEventHandler( "interrupted_keyframe", f41_arg0.clipInterrupted )
                              f41_arg0.CrowdImageGlow:registerEventHandler( "transition_complete_keyframe", f41_arg0.clipFinished )
                        end
                        
                        f41_arg0.CrowdImageGlow:completeAnimation()
                        f41_arg0.CrowdImageGlow:setRGB( 1, 0, 0 )
                        f41_arg0.CrowdImageGlow:setAlpha( 0 )
                        f41_arg0.CrowdImageGlow:setZRot( 0 )
                        f41_local0( f41_arg0.CrowdImageGlow )
                        local f41_local1 = function ( f43_arg0 )
                              f41_arg0.CrowdImage:beginAnimation( 1000 )
                              f41_arg0.CrowdImage:setZRot( 40 )
                              f41_arg0.CrowdImage:registerEventHandler( "interrupted_keyframe", f41_arg0.clipInterrupted )
                              f41_arg0.CrowdImage:registerEventHandler( "transition_complete_keyframe", f41_arg0.clipFinished )
                        end
                        
                        f41_arg0.CrowdImage:completeAnimation()
                        f41_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f41_arg0.CrowdImage:setZRot( 0 )
                        f41_local1( f41_arg0.CrowdImage )
                        local f41_local2 = function ( f44_arg0 )
                              f41_arg0.CrowdTitle:beginAnimation( 1000 )
                              f41_arg0.CrowdTitle:setRGB( 1, 0.58, 0.58 )
                              f41_arg0.CrowdTitle:registerEventHandler( "interrupted_keyframe", f41_arg0.clipInterrupted )
                              f41_arg0.CrowdTitle:registerEventHandler( "transition_complete_keyframe", f41_arg0.clipFinished )
                        end
                        
                        f41_arg0.CrowdTitle:completeAnimation()
                        f41_arg0.CrowdTitle:setRGB( 1, 1, 1 )
                        f41_arg0.CrowdTitle:setZRot( 0 )
                        f41_local2( f41_arg0.CrowdTitle )
                  end
            },
            crowd_warm_up = {
                  DefaultClip = function ( f45_arg0, f45_arg1 )
                        f45_arg0:__resetProperties()
                        f45_arg0:setupElementClipCounter( 3 )
                        f45_arg0.CrowdImageGlow:completeAnimation()
                        f45_arg0.CrowdImageGlow:setRGB( 0, 1, 0.17 )
                        f45_arg0.CrowdImageGlow:setAlpha( 0.33 )
                        f45_arg0.CrowdImageGlow:setZRot( -33 )
                        f45_arg0.clipFinished( f45_arg0.CrowdImageGlow )
                        f45_arg0.CrowdImage:completeAnimation()
                        f45_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f45_arg0.CrowdImage:setZRot( -33 )
                        f45_arg0.clipFinished( f45_arg0.CrowdImage )
                        f45_arg0.CrowdTitle:completeAnimation()
                        f45_arg0.CrowdTitle:setRGB( 0.75, 0.91, 0.8 )
                        f45_arg0.clipFinished( f45_arg0.CrowdTitle )
                  end,
                  crowd_no_love = function ( f46_arg0, f46_arg1 )
                        f46_arg0:__resetProperties()
                        f46_arg0:setupElementClipCounter( 2 )
                        local f46_local0 = function ( f47_arg0 )
                              f46_arg0.CrowdImage:beginAnimation( 1000 )
                              f46_arg0.CrowdImage:setRGB( 1, 1, 1 )
                              f46_arg0.CrowdImage:setZRot( 0 )
                              f46_arg0.CrowdImage:registerEventHandler( "interrupted_keyframe", f46_arg0.clipInterrupted )
                              f46_arg0.CrowdImage:registerEventHandler( "transition_complete_keyframe", f46_arg0.clipFinished )
                        end
                        
                        f46_arg0.CrowdImage:completeAnimation()
                        f46_arg0.CrowdImage:setRGB( 0.75, 0.91, 0.8 )
                        f46_arg0.CrowdImage:setZRot( -33 )
                        f46_local0( f46_arg0.CrowdImage )
                        local f46_local1 = function ( f48_arg0 )
                              f46_arg0.CrowdTitle:beginAnimation( 1000 )
                              f46_arg0.CrowdTitle:setRGB( 1, 1, 1 )
                              f46_arg0.CrowdTitle:registerEventHandler( "interrupted_keyframe", f46_arg0.clipInterrupted )
                              f46_arg0.CrowdTitle:registerEventHandler( "transition_complete_keyframe", f46_arg0.clipFinished )
                        end
                        
                        f46_arg0.CrowdTitle:completeAnimation()
                        f46_arg0.CrowdTitle:setRGB( 0.75, 0.91, 0.8 )
                        f46_local1( f46_arg0.CrowdTitle )
                  end,
                  crowd_likes = function ( f49_arg0, f49_arg1 )
                        f49_arg0:__resetProperties()
                        f49_arg0:setupElementClipCounter( 3 )
                        local f49_local0 = function ( f50_arg0 )
                              f49_arg0.CrowdImageGlow:beginAnimation( 1000 )
                              f49_arg0.CrowdImageGlow:setAlpha( 0.66 )
                              f49_arg0.CrowdImageGlow:setZRot( -66 )
                              f49_arg0.CrowdImageGlow:registerEventHandler( "interrupted_keyframe", f49_arg0.clipInterrupted )
                              f49_arg0.CrowdImageGlow:registerEventHandler( "transition_complete_keyframe", f49_arg0.clipFinished )
                        end
                        
                        f49_arg0.CrowdImageGlow:completeAnimation()
                        f49_arg0.CrowdImageGlow:setRGB( 0, 1, 0.17 )
                        f49_arg0.CrowdImageGlow:setAlpha( 0.33 )
                        f49_arg0.CrowdImageGlow:setZRot( -33 )
                        f49_local0( f49_arg0.CrowdImageGlow )
                        local f49_local1 = function ( f51_arg0 )
                              f49_arg0.CrowdImage:beginAnimation( 1000 )
                              f49_arg0.CrowdImage:setZRot( -66 )
                              f49_arg0.CrowdImage:registerEventHandler( "interrupted_keyframe", f49_arg0.clipInterrupted )
                              f49_arg0.CrowdImage:registerEventHandler( "transition_complete_keyframe", f49_arg0.clipFinished )
                        end
                        
                        f49_arg0.CrowdImage:completeAnimation()
                        f49_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f49_arg0.CrowdImage:setZRot( -33 )
                        f49_local1( f49_arg0.CrowdImage )
                        local f49_local2 = function ( f52_arg0 )
                              f49_arg0.CrowdTitle:beginAnimation( 1000 )
                              f49_arg0.CrowdTitle:setRGB( 0.3, 0.87, 0.34 )
                              f49_arg0.CrowdTitle:registerEventHandler( "interrupted_keyframe", f49_arg0.clipInterrupted )
                              f49_arg0.CrowdTitle:registerEventHandler( "transition_complete_keyframe", f49_arg0.clipFinished )
                        end
                        
                        f49_arg0.CrowdTitle:completeAnimation()
                        f49_arg0.CrowdTitle:setRGB( 0.75, 0.91, 0.8 )
                        f49_local2( f49_arg0.CrowdTitle )
                  end
            },
            crowd_likes = {
                  DefaultClip = function ( f53_arg0, f53_arg1 )
                        f53_arg0:__resetProperties()
                        f53_arg0:setupElementClipCounter( 3 )
                        f53_arg0.CrowdImageGlow:completeAnimation()
                        f53_arg0.CrowdImageGlow:setRGB( 0, 1, 0.17 )
                        f53_arg0.CrowdImageGlow:setAlpha( 0.66 )
                        f53_arg0.CrowdImageGlow:setZRot( -66 )
                        f53_arg0.clipFinished( f53_arg0.CrowdImageGlow )
                        f53_arg0.CrowdImage:completeAnimation()
                        f53_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f53_arg0.CrowdImage:setZRot( -66 )
                        f53_arg0.clipFinished( f53_arg0.CrowdImage )
                        f53_arg0.CrowdTitle:completeAnimation()
                        f53_arg0.CrowdTitle:setRGB( 0.3, 0.87, 0.34 )
                        f53_arg0.clipFinished( f53_arg0.CrowdTitle )
                  end,
                  crowd_warm_up = function ( f54_arg0, f54_arg1 )
                        f54_arg0:__resetProperties()
                        f54_arg0:setupElementClipCounter( 3 )
                        local f54_local0 = function ( f55_arg0 )
                              f54_arg0.CrowdImageGlow:beginAnimation( 1000 )
                              f54_arg0.CrowdImageGlow:setAlpha( 0.33 )
                              f54_arg0.CrowdImageGlow:setZRot( -33 )
                              f54_arg0.CrowdImageGlow:registerEventHandler( "interrupted_keyframe", f54_arg0.clipInterrupted )
                              f54_arg0.CrowdImageGlow:registerEventHandler( "transition_complete_keyframe", f54_arg0.clipFinished )
                        end
                        
                        f54_arg0.CrowdImageGlow:completeAnimation()
                        f54_arg0.CrowdImageGlow:setRGB( 0, 1, 0.17 )
                        f54_arg0.CrowdImageGlow:setAlpha( 0.66 )
                        f54_arg0.CrowdImageGlow:setZRot( -66 )
                        f54_local0( f54_arg0.CrowdImageGlow )
                        local f54_local1 = function ( f56_arg0 )
                              f54_arg0.CrowdImage:beginAnimation( 1000 )
                              f54_arg0.CrowdImage:setZRot( -33 )
                              f54_arg0.CrowdImage:registerEventHandler( "interrupted_keyframe", f54_arg0.clipInterrupted )
                              f54_arg0.CrowdImage:registerEventHandler( "transition_complete_keyframe", f54_arg0.clipFinished )
                        end
                        
                        f54_arg0.CrowdImage:completeAnimation()
                        f54_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f54_arg0.CrowdImage:setZRot( -66 )
                        f54_local1( f54_arg0.CrowdImage )
                        local f54_local2 = function ( f57_arg0 )
                              f54_arg0.CrowdTitle:beginAnimation( 1000 )
                              f54_arg0.CrowdTitle:setRGB( 0.75, 0.91, 0.8 )
                              f54_arg0.CrowdTitle:registerEventHandler( "interrupted_keyframe", f54_arg0.clipInterrupted )
                              f54_arg0.CrowdTitle:registerEventHandler( "transition_complete_keyframe", f54_arg0.clipFinished )
                        end
                        
                        f54_arg0.CrowdTitle:completeAnimation()
                        f54_arg0.CrowdTitle:setRGB( 0.3, 0.87, 0.34 )
                        f54_local2( f54_arg0.CrowdTitle )
                  end,
                  crowd_loves = function ( f58_arg0, f58_arg1 )
                        f58_arg0:__resetProperties()
                        f58_arg0:setupElementClipCounter( 3 )
                        local f58_local0 = function ( f59_arg0 )
                              f58_arg0.CrowdImageGlow:beginAnimation( 990 )
                              f58_arg0.CrowdImageGlow:setAlpha( 1 )
                              f58_arg0.CrowdImageGlow:setZRot( -97 )
                              f58_arg0.CrowdImageGlow:registerEventHandler( "interrupted_keyframe", f58_arg0.clipInterrupted )
                              f58_arg0.CrowdImageGlow:registerEventHandler( "transition_complete_keyframe", f58_arg0.clipFinished )
                        end
                        
                        f58_arg0.CrowdImageGlow:completeAnimation()
                        f58_arg0.CrowdImageGlow:setRGB( 0, 1, 0.17 )
                        f58_arg0.CrowdImageGlow:setAlpha( 0.66 )
                        f58_arg0.CrowdImageGlow:setZRot( -66 )
                        f58_local0( f58_arg0.CrowdImageGlow )
                        local f58_local1 = function ( f60_arg0 )
                              f58_arg0.CrowdImage:beginAnimation( 1000 )
                              f58_arg0.CrowdImage:setZRot( -97 )
                              f58_arg0.CrowdImage:registerEventHandler( "interrupted_keyframe", f58_arg0.clipInterrupted )
                              f58_arg0.CrowdImage:registerEventHandler( "transition_complete_keyframe", f58_arg0.clipFinished )
                        end
                        
                        f58_arg0.CrowdImage:completeAnimation()
                        f58_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f58_arg0.CrowdImage:setZRot( -66 )
                        f58_local1( f58_arg0.CrowdImage )
                        local f58_local2 = function ( f61_arg0 )
                              f58_arg0.CrowdTitle:beginAnimation( 1000 )
                              f58_arg0.CrowdTitle:setRGB( 0, 0.84, 0.06 )
                              f58_arg0.CrowdTitle:registerEventHandler( "interrupted_keyframe", f58_arg0.clipInterrupted )
                              f58_arg0.CrowdTitle:registerEventHandler( "transition_complete_keyframe", f58_arg0.clipFinished )
                        end
                        
                        f58_arg0.CrowdTitle:completeAnimation()
                        f58_arg0.CrowdTitle:setRGB( 0.3, 0.87, 0.34 )
                        f58_local2( f58_arg0.CrowdTitle )
                  end
            },
            crowd_loves = {
                  DefaultClip = function ( f62_arg0, f62_arg1 )
                        f62_arg0:__resetProperties()
                        f62_arg0:setupElementClipCounter( 6 )
                        f62_arg0.Image00:completeAnimation()
                        f62_arg0.Image00:setAlpha( 0.81 )
                        f62_arg0.clipFinished( f62_arg0.Image00 )
                        f62_arg0.ZmAmmoParticleFX3right:completeAnimation()
                        f62_arg0.ZmAmmoParticleFX3right:setLeftRight( 0, 0, 59, 274 )
                        f62_arg0.ZmAmmoParticleFX3right:setTopBottom( 1, 1, -283, -171 )
                        f62_arg0.ZmAmmoParticleFX3right:setAlpha( 1 )
                        f62_arg0.clipFinished( f62_arg0.ZmAmmoParticleFX3right )
                        f62_arg0.ZmAmmoParticleFX2right:completeAnimation()
                        f62_arg0.ZmAmmoParticleFX2right:setLeftRight( 0, 0, 66, 281 )
                        f62_arg0.ZmAmmoParticleFX2right:setTopBottom( 1, 1, -266, -154 )
                        f62_arg0.ZmAmmoParticleFX2right:setAlpha( 1 )
                        f62_arg0.clipFinished( f62_arg0.ZmAmmoParticleFX2right )
                        f62_arg0.CrowdImageGlow:completeAnimation()
                        f62_arg0.CrowdImageGlow:setRGB( 0, 1, 0.17 )
                        f62_arg0.CrowdImageGlow:setAlpha( 1 )
                        f62_arg0.CrowdImageGlow:setZRot( -97 )
                        f62_arg0.clipFinished( f62_arg0.CrowdImageGlow )
                        f62_arg0.CrowdImage:completeAnimation()
                        f62_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f62_arg0.CrowdImage:setZRot( -97 )
                        f62_arg0.clipFinished( f62_arg0.CrowdImage )
                        f62_arg0.CrowdTitle:completeAnimation()
                        f62_arg0.CrowdTitle:setRGB( 0, 0.84, 0.06 )
                        f62_arg0.clipFinished( f62_arg0.CrowdTitle )
                  end,
                  crowd_likes = function ( f63_arg0, f63_arg1 )
                        f63_arg0:__resetProperties()
                        f63_arg0:setupElementClipCounter( 3 )
                        local f63_local0 = function ( f64_arg0 )
                              f63_arg0.CrowdImageGlow:beginAnimation( 1000 )
                              f63_arg0.CrowdImageGlow:setAlpha( 0.66 )
                              f63_arg0.CrowdImageGlow:setZRot( -66 )
                              f63_arg0.CrowdImageGlow:registerEventHandler( "interrupted_keyframe", f63_arg0.clipInterrupted )
                              f63_arg0.CrowdImageGlow:registerEventHandler( "transition_complete_keyframe", f63_arg0.clipFinished )
                        end
                        
                        f63_arg0.CrowdImageGlow:completeAnimation()
                        f63_arg0.CrowdImageGlow:setRGB( 0, 1, 0.17 )
                        f63_arg0.CrowdImageGlow:setAlpha( 1 )
                        f63_arg0.CrowdImageGlow:setZRot( -97 )
                        f63_local0( f63_arg0.CrowdImageGlow )
                        local f63_local1 = function ( f65_arg0 )
                              f63_arg0.CrowdImage:beginAnimation( 1000 )
                              f63_arg0.CrowdImage:setZRot( -66 )
                              f63_arg0.CrowdImage:registerEventHandler( "interrupted_keyframe", f63_arg0.clipInterrupted )
                              f63_arg0.CrowdImage:registerEventHandler( "transition_complete_keyframe", f63_arg0.clipFinished )
                        end
                        
                        f63_arg0.CrowdImage:completeAnimation()
                        f63_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f63_arg0.CrowdImage:setZRot( -97 )
                        f63_local1( f63_arg0.CrowdImage )
                        local f63_local2 = function ( f66_arg0 )
                              f63_arg0.CrowdTitle:beginAnimation( 1000 )
                              f63_arg0.CrowdTitle:setRGB( 0.3, 0.87, 0.34 )
                              f63_arg0.CrowdTitle:registerEventHandler( "interrupted_keyframe", f63_arg0.clipInterrupted )
                              f63_arg0.CrowdTitle:registerEventHandler( "transition_complete_keyframe", f63_arg0.clipFinished )
                        end
                        
                        f63_arg0.CrowdTitle:completeAnimation()
                        f63_arg0.CrowdTitle:setRGB( 0, 0.84, 0.06 )
                        f63_local2( f63_arg0.CrowdTitle )
                  end
            },
            crowd_power_up_available_good = {
                  DefaultClip = function ( f67_arg0, f67_arg1 )
                        f67_arg0:__resetProperties()
                        f67_arg0:setupElementClipCounter( 4 )
                        local f67_local0 = function ( f68_arg0 )
                              local f68_local0 = function ( f69_arg0 )
                                    local f69_local0 = function ( f70_arg0 )
                                          local f70_local0 = function ( f71_arg0 )
                                                f71_arg0:beginAnimation( 409 )
                                                f71_arg0:setAlpha( 0 )
                                                f71_arg0:setScale( 0.7, 0.7 )
                                                f71_arg0:registerEventHandler( "transition_complete_keyframe", f67_arg0.clipFinished )
                                          end
                                          
                                          f70_arg0:beginAnimation( 390 )
                                          f70_arg0:setAlpha( 1 )
                                          f70_arg0:setScale( 0.8, 0.8 )
                                          f70_arg0:registerEventHandler( "transition_complete_keyframe", f70_local0 )
                                    end
                                    
                                    f69_arg0:beginAnimation( 400 )
                                    f69_arg0:setAlpha( 0 )
                                    f69_arg0:setScale( 0.7, 0.7 )
                                    f69_arg0:registerEventHandler( "transition_complete_keyframe", f69_local0 )
                              end
                              
                              f67_arg0.CrowdImageGlow:beginAnimation( 400 )
                              f67_arg0.CrowdImageGlow:setAlpha( 1 )
                              f67_arg0.CrowdImageGlow:setScale( 0.8, 0.8 )
                              f67_arg0.CrowdImageGlow:registerEventHandler( "interrupted_keyframe", f67_arg0.clipInterrupted )
                              f67_arg0.CrowdImageGlow:registerEventHandler( "transition_complete_keyframe", f68_local0 )
                        end
                        
                        f67_arg0.CrowdImageGlow:completeAnimation()
                        f67_arg0.CrowdImageGlow:setRGB( 0, 1, 0.17 )
                        f67_arg0.CrowdImageGlow:setAlpha( 0 )
                        f67_arg0.CrowdImageGlow:setZRot( -97 )
                        f67_arg0.CrowdImageGlow:setScale( 0.7, 0.7 )
                        f67_local0( f67_arg0.CrowdImageGlow )
                        f67_arg0.CrowdImage:completeAnimation()
                        f67_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f67_arg0.CrowdImage:setAlpha( 1 )
                        f67_arg0.CrowdImage:setZRot( -97 )
                        f67_arg0.clipFinished( f67_arg0.CrowdImage )
                        f67_arg0.CrowdItem:completeAnimation()
                        f67_arg0.CrowdItem:setRGB( 0, 0.55, 0.09 )
                        f67_arg0.CrowdItem:setAlpha( 1 )
                        f67_arg0.clipFinished( f67_arg0.CrowdItem )
                        f67_arg0.CrowdTitle:completeAnimation()
                        f67_arg0.CrowdTitle:setRGB( 0, 0.55, 0.09 )
                        f67_arg0.CrowdTitle:setAlpha( 1 )
                        f67_arg0.clipFinished( f67_arg0.CrowdTitle )
                        f67_arg0.nextClip = "DefaultClip"
                  end
            },
            crowd_power_up_available_bad = {
                  DefaultClip = function ( f72_arg0, f72_arg1 )
                        f72_arg0:__resetProperties()
                        f72_arg0:setupElementClipCounter( 4 )
                        local f72_local0 = function ( f73_arg0 )
                              local f73_local0 = function ( f74_arg0 )
                                    local f74_local0 = function ( f75_arg0 )
                                          local f75_local0 = function ( f76_arg0 )
                                                f76_arg0:beginAnimation( 410 )
                                                f76_arg0:setAlpha( 0 )
                                                f76_arg0:setScale( 0.7, 0.7 )
                                                f76_arg0:registerEventHandler( "transition_complete_keyframe", f72_arg0.clipFinished )
                                          end
                                          
                                          f75_arg0:beginAnimation( 389 )
                                          f75_arg0:setAlpha( 1 )
                                          f75_arg0:setScale( 0.8, 0.8 )
                                          f75_arg0:registerEventHandler( "transition_complete_keyframe", f75_local0 )
                                    end
                                    
                                    f74_arg0:beginAnimation( 400 )
                                    f74_arg0:setAlpha( 0 )
                                    f74_arg0:setScale( 0.7, 0.7 )
                                    f74_arg0:registerEventHandler( "transition_complete_keyframe", f74_local0 )
                              end
                              
                              f72_arg0.CrowdImageGlow:beginAnimation( 390 )
                              f72_arg0.CrowdImageGlow:setAlpha( 1 )
                              f72_arg0.CrowdImageGlow:setScale( 0.8, 0.8 )
                              f72_arg0.CrowdImageGlow:registerEventHandler( "interrupted_keyframe", f72_arg0.clipInterrupted )
                              f72_arg0.CrowdImageGlow:registerEventHandler( "transition_complete_keyframe", f73_local0 )
                        end
                        
                        f72_arg0.CrowdImageGlow:completeAnimation()
                        f72_arg0.CrowdImageGlow:setRGB( 1, 0, 0 )
                        f72_arg0.CrowdImageGlow:setAlpha( 0 )
                        f72_arg0.CrowdImageGlow:setZRot( 90 )
                        f72_arg0.CrowdImageGlow:setScale( 0.7, 0.7 )
                        f72_local0( f72_arg0.CrowdImageGlow )
                        f72_arg0.CrowdImage:completeAnimation()
                        f72_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f72_arg0.CrowdImage:setAlpha( 1 )
                        f72_arg0.CrowdImage:setZRot( 90 )
                        f72_arg0.clipFinished( f72_arg0.CrowdImage )
                        f72_arg0.CrowdItem:completeAnimation()
                        f72_arg0.CrowdItem:setRGB( 0.78, 0, 0 )
                        f72_arg0.CrowdItem:setAlpha( 1 )
                        f72_arg0.clipFinished( f72_arg0.CrowdItem )
                        f72_arg0.CrowdTitle:completeAnimation()
                        f72_arg0.CrowdTitle:setRGB( 0.78, 0, 0 )
                        f72_arg0.CrowdTitle:setAlpha( 1 )
                        f72_arg0.clipFinished( f72_arg0.CrowdTitle )
                        f72_arg0.nextClip = "DefaultClip"
                  end
            },
            crowd_power_up_available_good_partial = {
                  DefaultClip = function ( f77_arg0, f77_arg1 )
                        f77_arg0:__resetProperties()
                        f77_arg0:setupElementClipCounter( 4 )
                        local f77_local0 = function ( f78_arg0 )
                              local f78_local0 = function ( f79_arg0 )
                                    local f79_local0 = function ( f80_arg0 )
                                          local f80_local0 = function ( f81_arg0 )
                                                f81_arg0:beginAnimation( 440 )
                                                f81_arg0:setAlpha( 0 )
                                                f81_arg0:setScale( 0.7, 0.7 )
                                                f81_arg0:registerEventHandler( "transition_complete_keyframe", f77_arg0.clipFinished )
                                          end
                                          
                                          f80_arg0:beginAnimation( 390 )
                                          f80_arg0:setAlpha( 1 )
                                          f80_arg0:setScale( 0.8, 0.8 )
                                          f80_arg0:registerEventHandler( "transition_complete_keyframe", f80_local0 )
                                    end
                                    
                                    f79_arg0:beginAnimation( 390 )
                                    f79_arg0:setAlpha( 0 )
                                    f79_arg0:setScale( 0.7, 0.7 )
                                    f79_arg0:registerEventHandler( "transition_complete_keyframe", f79_local0 )
                              end
                              
                              f77_arg0.CrowdImageGlow:beginAnimation( 370 )
                              f77_arg0.CrowdImageGlow:setAlpha( 1 )
                              f77_arg0.CrowdImageGlow:setScale( 0.8, 0.8 )
                              f77_arg0.CrowdImageGlow:registerEventHandler( "interrupted_keyframe", f77_arg0.clipInterrupted )
                              f77_arg0.CrowdImageGlow:registerEventHandler( "transition_complete_keyframe", f78_local0 )
                        end
                        
                        f77_arg0.CrowdImageGlow:completeAnimation()
                        f77_arg0.CrowdImageGlow:setRGB( 0, 1, 0.17 )
                        f77_arg0.CrowdImageGlow:setAlpha( 0 )
                        f77_arg0.CrowdImageGlow:setZRot( -33 )
                        f77_arg0.CrowdImageGlow:setScale( 0.7, 0.7 )
                        f77_local0( f77_arg0.CrowdImageGlow )
                        f77_arg0.CrowdImage:completeAnimation()
                        f77_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f77_arg0.CrowdImage:setAlpha( 1 )
                        f77_arg0.CrowdImage:setZRot( -33 )
                        f77_arg0.clipFinished( f77_arg0.CrowdImage )
                        f77_arg0.CrowdItem:completeAnimation()
                        f77_arg0.CrowdItem:setRGB( 0, 0.58, 0.08 )
                        f77_arg0.CrowdItem:setAlpha( 1 )
                        f77_arg0.clipFinished( f77_arg0.CrowdItem )
                        f77_arg0.CrowdTitle:completeAnimation()
                        f77_arg0.CrowdTitle:setRGB( 0, 0.58, 0.08 )
                        f77_arg0.CrowdTitle:setAlpha( 1 )
                        f77_arg0.clipFinished( f77_arg0.CrowdTitle )
                        f77_arg0.nextClip = "DefaultClip"
                  end
            },
            crowd_power_up_available_bad_partial = {
                  DefaultClip = function ( f82_arg0, f82_arg1 )
                        f82_arg0:__resetProperties()
                        f82_arg0:setupElementClipCounter( 4 )
                        local f82_local0 = function ( f83_arg0 )
                              local f83_local0 = function ( f84_arg0 )
                                    local f84_local0 = function ( f85_arg0 )
                                          local f85_local0 = function ( f86_arg0 )
                                                f86_arg0:beginAnimation( 430 )
                                                f86_arg0:setAlpha( 0 )
                                                f86_arg0:setScale( 0.7, 0.7 )
                                                f86_arg0:registerEventHandler( "transition_complete_keyframe", f82_arg0.clipFinished )
                                          end
                                          
                                          f85_arg0:beginAnimation( 390 )
                                          f85_arg0:setAlpha( 1 )
                                          f85_arg0:setScale( 0.8, 0.8 )
                                          f85_arg0:registerEventHandler( "transition_complete_keyframe", f85_local0 )
                                    end
                                    
                                    f84_arg0:beginAnimation( 409 )
                                    f84_arg0:setAlpha( 0 )
                                    f84_arg0:setScale( 0.7, 0.7 )
                                    f84_arg0:registerEventHandler( "transition_complete_keyframe", f84_local0 )
                              end
                              
                              f82_arg0.CrowdImageGlow:beginAnimation( 370 )
                              f82_arg0.CrowdImageGlow:setAlpha( 1 )
                              f82_arg0.CrowdImageGlow:setScale( 0.8, 0.8 )
                              f82_arg0.CrowdImageGlow:registerEventHandler( "interrupted_keyframe", f82_arg0.clipInterrupted )
                              f82_arg0.CrowdImageGlow:registerEventHandler( "transition_complete_keyframe", f83_local0 )
                        end
                        
                        f82_arg0.CrowdImageGlow:completeAnimation()
                        f82_arg0.CrowdImageGlow:setRGB( 1, 0, 0 )
                        f82_arg0.CrowdImageGlow:setAlpha( 0 )
                        f82_arg0.CrowdImageGlow:setZRot( 40 )
                        f82_arg0.CrowdImageGlow:setScale( 0.7, 0.7 )
                        f82_local0( f82_arg0.CrowdImageGlow )
                        f82_arg0.CrowdImage:completeAnimation()
                        f82_arg0.CrowdImage:setRGB( 1, 1, 1 )
                        f82_arg0.CrowdImage:setAlpha( 1 )
                        f82_arg0.CrowdImage:setZRot( 40 )
                        f82_arg0.clipFinished( f82_arg0.CrowdImage )
                        f82_arg0.CrowdItem:completeAnimation()
                        f82_arg0.CrowdItem:setRGB( 0.78, 0, 0 )
                        f82_arg0.CrowdItem:setAlpha( 1 )
                        f82_arg0.clipFinished( f82_arg0.CrowdItem )
                        f82_arg0.CrowdTitle:completeAnimation()
                        f82_arg0.CrowdTitle:setRGB( 0.78, 0, 0 )
                        f82_arg0.CrowdTitle:setAlpha( 1 )
                        f82_arg0.clipFinished( f82_arg0.CrowdTitle )
                        f82_arg0.nextClip = "DefaultClip"
                  end
            }
      }

      CoD.zm_towers_crowd_meter.__onClose = function ( f87_arg0 )
            f87_arg0.smokewidget:close()
            f87_arg0.smokewidget2:close()
            f87_arg0.ZmAmmoParticleFX3right:close()
            f87_arg0.ZmAmmoParticleFX2right:close()
      end
      
      -- Perks Icons
      CoD.ZMPerkVaporItem = InheritFrom( LUI.UIElement )
      CoD.ZMPerkVaporItem.__defaultWidth = 70
      CoD.ZMPerkVaporItem.__defaultHeight = 98
      CoD.ZMPerkVaporItem.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            self:setClass( CoD.ZMPerkVaporItem )
            self.id = "ZMPerkVaporItem"
            self.soundSet = "none"
            self.anyChildUsesUpdateState = true
            f1_arg0:addElementToPendingUpdateStateList( self )
            
            local VaporIcon = CoD.ZMPerkVaporIcon.new( f1_arg0, f1_arg1, 0, 0, 10, 60, 0, 0, 23.5, 73.5 )
            VaporIcon:setScale( 1.1, 1.1 )
            VaporIcon:linkToElementModel( self, nil, false, function ( model )
                  VaporIcon:setModel( model, f1_arg1 )
            end )
            self:addElement( VaporIcon )
            self.VaporIcon = VaporIcon
            
            local ModifierFrame = CoD.ZMPerkVaporModifierFrame.new( f1_arg0, f1_arg1, 0, 0, -1, 71, 0, 0, 13, 85 )
            ModifierFrame:linkToElementModel( self, nil, false, function ( model )
                  ModifierFrame:setModel( model, f1_arg1 )
            end )
            self:addElement( ModifierFrame )
            self.ModifierFrame = ModifierFrame
            
            local AltarName = LUI.UIText.new( 0.5, 1.5, -35, -35, 0, 0, 7, 24 )
            AltarName:setTTF( "skorzhen" )
            AltarName:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_56250C6FCAC36BD4" ) )
            AltarName:setShaderVector( 0, 0, 0, 0, 0 )
            AltarName:setShaderVector( 1, 0, 0, 0, 1 )
            AltarName:setLetterSpacing( 2 )
            AltarName:setAlignment( Enum[@"luialignment"][@"lui_alignment_center"] )
            AltarName:linkToElementModel( self, "altarName", true, function ( model )
                  local f4_local0 = model:get()
                  if f4_local0 ~= nil then
                        AltarName:setText( Engine[@"hash_4F9F1239CFD921FE"]( f4_local0 ) )
                  end
            end )
            self:addElement( AltarName )
            self.AltarName = AltarName
            
            local Charges = CoD.ZMPerkVaporItemChargeCountListWidget.new( f1_arg0, f1_arg1, 0, 0, 39, 75, 0, 0, 50.5, 74.5 )
            Charges:linkToElementModel( self, nil, false, function ( model )
                  Charges:setModel( model, f1_arg1 )
            end )
            self:addElement( Charges )
            self.Charges = Charges
            
            local DeadshotCharges = CoD.ZMPerkVaporDeadshotCountList.new( f1_arg0, f1_arg1, 0, 0, 14, 56, 0, 0, 26, 70 )
            DeadshotCharges:linkToElementModel( self, nil, false, function ( model )
                  DeadshotCharges:setModel( model, f1_arg1 )
            end )
            self:addElement( DeadshotCharges )
            self.DeadshotCharges = DeadshotCharges
            
            self:mergeStateConditions( {
                  {
                        stateName = "Hidden",
                        condition = function ( menu, element, event )
                              return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", CoD.ZMPerkUtility.PerkVaporStates.HIDDEN )
                        end
                  },
                  {
                        stateName = "Available",
                        condition = function ( menu, element, event )
                              return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", CoD.ZMPerkUtility.PerkVaporStates.DEFAULT )
                        end
                  },
                  {
                        stateName = "Consumed",
                        condition = function ( menu, element, event )
                              return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", CoD.ZMPerkUtility.PerkVaporStates.CONSUMED )
                        end
                  },
                  {
                        stateName = "CoolingDown",
                        condition = function ( menu, element, event )
                              return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", CoD.ZMPerkUtility.PerkVaporStates.COOLING_DOWN )
                        end
                  }
            } )
            self:linkToElementModel( self, "state", true, function ( model )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = model:get(),
                        modelName = "state"
                  } )
            end )
            self:linkToElementModel( self, "state", true, function ( model )
                  local f12_local0 = self
                  ForceNotifyControllerModel( f1_arg1, "PerkVaporStateUpdated" )
            end )
            self:linkToElementModel( self, "itemIndex", true, function ( model )
                  local f13_local0 = self
                  ForceNotifyControllerModel( f1_arg1, "PerkVaporStateUpdated" )
            end )
            LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
            
            if PostLoadFunc then
                  PostLoadFunc( self, f1_arg1, f1_arg0 )
            end
            
            --RushPrintInfo("Called", "ZM Perks Widget")

            return self
      end
      
      CoD.ZMPerkVaporItem.__resetProperties = function ( f14_arg0 )
            f14_arg0.AltarName:completeAnimation()
            f14_arg0.VaporIcon:completeAnimation()
            f14_arg0.ModifierFrame:completeAnimation()
            f14_arg0.DeadshotCharges:completeAnimation()
            f14_arg0.Charges:completeAnimation()
            f14_arg0.AltarName:setLeftRight( 0.5, 1.5, -35, -35 )
            f14_arg0.AltarName:setTopBottom( 0, 0, 7, 24 )
            f14_arg0.AltarName:setRGB( 1, 1, 1 )
            f14_arg0.AltarName:setAlpha( 1 )
            f14_arg0.VaporIcon:setAlpha( 1 )
            f14_arg0.ModifierFrame:setAlpha( 1 )
            f14_arg0.DeadshotCharges:setAlpha( 1 )
            f14_arg0.Charges:setAlpha( 1 )
      end
      
      CoD.ZMPerkVaporItem.__clipsPerState = {
            DefaultState = {
                  DefaultClip = function ( f15_arg0, f15_arg1 )
                        f15_arg0:__resetProperties()
                        f15_arg0:setupElementClipCounter( 5 )
                        f15_arg0.VaporIcon:completeAnimation()
                        f15_arg0.VaporIcon:setAlpha( 0 )
                        f15_arg0.clipFinished( f15_arg0.VaporIcon )
                        f15_arg0.ModifierFrame:completeAnimation()
                        f15_arg0.ModifierFrame:setAlpha( 0 )
                        f15_arg0.clipFinished( f15_arg0.ModifierFrame )
                        f15_arg0.AltarName:completeAnimation()
                        f15_arg0.AltarName:setAlpha( 0 )
                        f15_arg0.clipFinished( f15_arg0.AltarName )
                        f15_arg0.Charges:completeAnimation()
                        f15_arg0.Charges:setAlpha( 0 )
                        f15_arg0.clipFinished( f15_arg0.Charges )
                        f15_arg0.DeadshotCharges:completeAnimation()
                        f15_arg0.DeadshotCharges:setAlpha( 0 )
                        f15_arg0.clipFinished( f15_arg0.DeadshotCharges )
                  end
            },
            Hidden = {
                  DefaultClip = function ( f16_arg0, f16_arg1 )
                        f16_arg0:__resetProperties()
                        f16_arg0:setupElementClipCounter( 5 )
                        f16_arg0.VaporIcon:completeAnimation()
                        f16_arg0.VaporIcon:setAlpha( 0 )
                        f16_arg0.clipFinished( f16_arg0.VaporIcon )
                        f16_arg0.ModifierFrame:completeAnimation()
                        f16_arg0.ModifierFrame:setAlpha( 0 )
                        f16_arg0.clipFinished( f16_arg0.ModifierFrame )
                        f16_arg0.AltarName:completeAnimation()
                        f16_arg0.AltarName:setAlpha( 0 )
                        f16_arg0.clipFinished( f16_arg0.AltarName )
                        f16_arg0.Charges:completeAnimation()
                        f16_arg0.Charges:setAlpha( 0 )
                        f16_arg0.clipFinished( f16_arg0.Charges )
                        f16_arg0.DeadshotCharges:completeAnimation()
                        f16_arg0.DeadshotCharges:setAlpha( 0 )
                        f16_arg0.clipFinished( f16_arg0.DeadshotCharges )
                  end
            },
            Available = {
                  DefaultClip = function ( f17_arg0, f17_arg1 )
                        f17_arg0:__resetProperties()
                        f17_arg0:setupElementClipCounter( 4 )
                        f17_arg0.VaporIcon:completeAnimation()
                        f17_arg0.VaporIcon:setAlpha( 1 )
                        f17_arg0.clipFinished( f17_arg0.VaporIcon )
                        f17_arg0.AltarName:completeAnimation()
                        f17_arg0.AltarName:setLeftRight( 0.5, 1.5, -35, -35 )
                        f17_arg0.AltarName:setTopBottom( 0, 0, 7, 24 )
                        f17_arg0.AltarName:setRGB( 0.45, 0.45, 0.45 )
                        f17_arg0.clipFinished( f17_arg0.AltarName )
                        f17_arg0.Charges:completeAnimation()
                        f17_arg0.Charges:setAlpha( 0 )
                        f17_arg0.clipFinished( f17_arg0.Charges )
                        f17_arg0.DeadshotCharges:completeAnimation()
                        f17_arg0.DeadshotCharges:setAlpha( 0 )
                        f17_arg0.clipFinished( f17_arg0.DeadshotCharges )
                  end
            },
            Consumed = {
                  DefaultClip = function ( f18_arg0, f18_arg1 )
                        f18_arg0:__resetProperties()
                        f18_arg0:setupElementClipCounter( 3 )
                        f18_arg0.VaporIcon:completeAnimation()
                        f18_arg0.VaporIcon:setAlpha( 1 )
                        f18_arg0.clipFinished( f18_arg0.VaporIcon )
                        f18_arg0.AltarName:completeAnimation()
                        f18_arg0.AltarName:setRGB( 1, 1, 1 )
                        f18_arg0.clipFinished( f18_arg0.AltarName )
                        f18_arg0.DeadshotCharges:completeAnimation()
                        f18_arg0.DeadshotCharges:setAlpha( 1 )
                        f18_arg0.clipFinished( f18_arg0.DeadshotCharges )
                  end
            },
            CoolingDown = {
                  DefaultClip = function ( f19_arg0, f19_arg1 )
                        f19_arg0:__resetProperties()
                        f19_arg0:setupElementClipCounter( 3 )
                        f19_arg0.VaporIcon:completeAnimation()
                        f19_arg0.VaporIcon:setAlpha( 1 )
                        f19_arg0.clipFinished( f19_arg0.VaporIcon )
                        f19_arg0.AltarName:completeAnimation()
                        f19_arg0.AltarName:setRGB( 1, 1, 1 )
                        f19_arg0.clipFinished( f19_arg0.AltarName )
                        f19_arg0.DeadshotCharges:completeAnimation()
                        f19_arg0.DeadshotCharges:setAlpha( 1 )
                        f19_arg0.clipFinished( f19_arg0.DeadshotCharges )
                  end
            }
      }

      CoD.ZMPerkVaporItem.__onClose = function ( f20_arg0 )
            f20_arg0.VaporIcon:close()
            f20_arg0.ModifierFrame:close()
            f20_arg0.AltarName:close()
            f20_arg0.Charges:close()
            f20_arg0.DeadshotCharges:close()
      end
            
      -- ZM Revive
      CoD.ZM_Revive = InheritFrom( LUI.UIElement )
      CoD.ZM_Revive.__defaultWidth = 1
      CoD.ZM_Revive.__defaultHeight = 1
      CoD.ZM_Revive.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            self:setClass( CoD.ZM_Revive )
            self.id = "ZM_Revive"
            self.soundSet = "default"
            self.anyChildUsesUpdateState = true
            f1_arg0:addElementToPendingUpdateStateList( self )
            
            local playerName = LUI.UIText.new( 0, 0, 134, 402, 0, 0, -66, 9 )
            playerName:setRGB( 1, 0, 0.44 )
            playerName:setTTF( "notosans_regular" )
            playerName:setLetterSpacing( 1 )
            playerName:setAlignment( Enum[@"luialignment"][@"lui_alignment_left"] )
            playerName:linkToElementModel( self, "playerName", true, function ( model )
                  local f2_local0 = model:get()
                  if f2_local0 ~= nil then
                        playerName:setText( CoD.SocialUtility.CleanGamerTag( f2_local0 ) )
                  end
            end )
            self:addElement( playerName )
            self.playerName = playerName
            
            local prompt = LUI.UIText.new( 0, 0, 133, 267, 0, 0, 4, 64 )
            prompt:setTTF( "dinnext_regular" )
            prompt:setLetterSpacing( 1 )
            prompt:setRGB(0, 0, 1)
            prompt:setAlignment( Enum[@"luialignment"][@"lui_alignment_left"] )
            prompt:linkToElementModel( self, "prompt", true, function ( model )
                  local f3_local0 = model:get()
                  if f3_local0 ~= nil then
                        prompt:setText(Engine[@"hash_4F9F1239CFD921FE"]( f3_local0 ) .. "!!!!")
                  end
            end )
            self:addElement( prompt )
            self.prompt = prompt
            
            local ZMReviveWidget = CoD.ZM_ReviveWidget.new( f1_arg0, f1_arg1, 0, 0, -164, 166, 0, 0, -165, 165 )
            ZMReviveWidget:linkToElementModel( self, nil, false, function ( model )
                  ZMReviveWidget:setModel( model, f1_arg1 )
            end )
            self:addElement( ZMReviveWidget )
            self.ZMReviveWidget = ZMReviveWidget
            
            local ZMReviveClampedArrow = CoD.ZM_ReviveClampedArrow.new( f1_arg0, f1_arg1, 0.5, 0.5, -178, 212, 0.5, 0.5, -48, 48 )
            ZMReviveClampedArrow:linkToElementModel( self, "arrowAngle", true, function ( model )
                  local f5_local0 = model:get()
                  if f5_local0 ~= nil then
                        ZMReviveClampedArrow:setZRot( f5_local0 )
                  end
            end )
            self:addElement( ZMReviveClampedArrow )
            self.ZMReviveClampedArrow = ZMReviveClampedArrow
            
            local revivingText = LUI.UIText.new( 0, 0, -300, 300, 0, 0, 180, 260 )
            revivingText:setText("REVIVING!!!")
            revivingText:setTTF( "notosans_bold" )
            revivingText:setRGB(1, 0, 1)
            revivingText:setAlignment( Enum[@"luialignment"][@"lui_alignment_center"] )
            revivingText:setAlignment( Enum[@"luialignment"][@"lui_alignment_top"] )
            self:addElement( revivingText )
            self.revivingText = revivingText
            
            self:mergeStateConditions( {
                  {
                        stateName = "Hide",
                        condition = function ( menu, element, event )
                              return CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "hide", 1 )
                        end
                  },
                  {
                        stateName = "Hidden",
                        condition = function ( menu, element, event )
                              local f7_local0 = CoD.HUDUtility.IsAnyGameType( f1_arg1, "ztrials" )
                              if f7_local0 then
                                    f7_local0 = CoD.ModelUtility.IsGlobalModelValueEqualTo( "ZMHudGlobal.trials.hudDeactivated", 1 )
                                    if f7_local0 then
                                          f7_local0 = not CoD.ModelUtility.IsGlobalModelValueTrue( "ZMHudGlobal.trials.infoHidden" )
                                    end
                              end
                              return f7_local0
                        end
                  },
                  {
                        stateName = "Clamped",
                        condition = function ( menu, element, event )
                              local f8_local0 = IsBleedOutVisible( element, f1_arg1 )
                              if f8_local0 then
                                    f8_local0 = CoD.ModelUtility.IsSelfModelValueEnumBitSet( element, f1_arg1, "stateFlags", Enum[@"bleedoutstateflags"][@"bleedout_state_flag_clamped"] )
                                    if f8_local0 then
                                          f8_local0 = not CoD.HUDUtility.IsGameTypeEqualToString( "zstandard" )
                                    end
                              end
                              return f8_local0
                        end
                  },
                  {
                        stateName = "Visible_Reviving",
                        condition = function ( menu, element, event )
                              local f9_local0 = IsBleedOutVisible( element, f1_arg1 )
                              if f9_local0 then
                                    f9_local0 = CoD.ModelUtility.IsSelfModelValueEnumBitSet( element, f1_arg1, "stateFlags", Enum[@"bleedoutstateflags"][@"bleedout_state_flag_being_revived"] )
                                    if f9_local0 then
                                          f9_local0 = not CoD.HUDUtility.IsGameTypeEqualToString( "zstandard" )
                                    end
                              end
                              return f9_local0
                        end
                  },
                  {
                        stateName = "Visible",
                        condition = function ( menu, element, event )
                              return IsBleedOutVisible( element, f1_arg1 ) and not CoD.HUDUtility.IsGameTypeEqualToString( "zstandard" )
                        end
                  }
            } )
            self:linkToElementModel( self, "hide", true, function ( model )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = model:get(),
                        modelName = "hide"
                  } )
            end )
            local f1_local6 = self
            local f1_local7 = self.subscribeToModel
            local f1_local8 = Engine[@"getglobalmodel"]()
            f1_local7( f1_local6, f1_local8["ZMHudGlobal.trials.hudDeactivated"], function ( f12_arg0 )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = f12_arg0:get(),
                        modelName = "ZMHudGlobal.trials.hudDeactivated"
                  } )
            end, false )
            f1_local6 = self
            f1_local7 = self.subscribeToModel
            f1_local8 = Engine[@"getglobalmodel"]()
            f1_local7( f1_local6, f1_local8["ZMHudGlobal.trials.infoHidden"], function ( f13_arg0 )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = f13_arg0:get(),
                        modelName = "ZMHudGlobal.trials.infoHidden"
                  } )
            end, false )
            self:linkToElementModel( self, "bleedingOut", true, function ( model )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = model:get(),
                        modelName = "bleedingOut"
                  } )
            end )
            self:linkToElementModel( self, "beingRevived", true, function ( model )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = model:get(),
                        modelName = "beingRevived"
                  } )
            end )
            f1_local6 = self
            f1_local7 = self.subscribeToModel
            f1_local8 = Engine[@"getmodelforcontroller"]( f1_arg1 )
            f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_spectating_client"]], function ( f16_arg0 )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = f16_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_spectating_client"]
                  } )
            end, false )
            self:linkToElementModel( self, "stateFlags", true, function ( model )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = model:get(),
                        modelName = "stateFlags"
                  } )
            end )
            LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
            
            if PostLoadFunc then
                  PostLoadFunc( self, f1_arg1, f1_arg0 )
            end

            RushPrintInfo("Called", "ZM Revive")

            return self
      end
      
      CoD.ZM_Revive.__resetProperties = function ( f18_arg0 )
            f18_arg0.playerName:completeAnimation()
            f18_arg0.prompt:completeAnimation()
            f18_arg0.ZMReviveClampedArrow:completeAnimation()
            f18_arg0.revivingText:completeAnimation()
            f18_arg0.ZMReviveWidget:completeAnimation()
            f18_arg0.playerName:setAlpha( 1 )
            f18_arg0.prompt:setAlpha( 1 )
            f18_arg0.ZMReviveClampedArrow:setAlpha( 1 )
            f18_arg0.revivingText:setAlpha( 1 )
            f18_arg0.ZMReviveWidget:setAlpha( 1 )
      end
      
      CoD.ZM_Revive.__clipsPerState = {
            DefaultState = {
                  DefaultClip = function ( f19_arg0, f19_arg1 )
                        f19_arg0:__resetProperties()
                        f19_arg0:setupElementClipCounter( 4 )
                        f19_arg0.playerName:completeAnimation()
                        f19_arg0.playerName:setAlpha( 0 )
                        f19_arg0.clipFinished( f19_arg0.playerName )
                        f19_arg0.prompt:completeAnimation()
                        f19_arg0.prompt:setAlpha( 0 )
                        f19_arg0.clipFinished( f19_arg0.prompt )
                        f19_arg0.ZMReviveClampedArrow:completeAnimation()
                        f19_arg0.ZMReviveClampedArrow:setAlpha( 0 )
                        f19_arg0.clipFinished( f19_arg0.ZMReviveClampedArrow )
                        f19_arg0.revivingText:completeAnimation()
                        f19_arg0.revivingText:setAlpha( 0 )
                        f19_arg0.clipFinished( f19_arg0.revivingText )
                  end
            },
            Hide = {
                  DefaultClip = function ( f20_arg0, f20_arg1 )
                        f20_arg0:__resetProperties()
                        f20_arg0:setupElementClipCounter( 5 )
                        f20_arg0.playerName:completeAnimation()
                        f20_arg0.playerName:setAlpha( 0 )
                        f20_arg0.clipFinished( f20_arg0.playerName )
                        f20_arg0.prompt:completeAnimation()
                        f20_arg0.prompt:setAlpha( 0 )
                        f20_arg0.clipFinished( f20_arg0.prompt )
                        f20_arg0.ZMReviveWidget:completeAnimation()
                        f20_arg0.ZMReviveWidget:setAlpha( 0 )
                        f20_arg0.clipFinished( f20_arg0.ZMReviveWidget )
                        f20_arg0.ZMReviveClampedArrow:completeAnimation()
                        f20_arg0.ZMReviveClampedArrow:setAlpha( 0 )
                        f20_arg0.clipFinished( f20_arg0.ZMReviveClampedArrow )
                        f20_arg0.revivingText:completeAnimation()
                        f20_arg0.revivingText:setAlpha( 0 )
                        f20_arg0.clipFinished( f20_arg0.revivingText )
                  end
            },
            Hidden = {
                  DefaultClip = function ( f21_arg0, f21_arg1 )
                        f21_arg0:__resetProperties()
                        f21_arg0:setupElementClipCounter( 5 )
                        f21_arg0.playerName:completeAnimation()
                        f21_arg0.playerName:setAlpha( 0 )
                        f21_arg0.clipFinished( f21_arg0.playerName )
                        f21_arg0.prompt:completeAnimation()
                        f21_arg0.prompt:setAlpha( 0 )
                        f21_arg0.clipFinished( f21_arg0.prompt )
                        f21_arg0.ZMReviveWidget:completeAnimation()
                        f21_arg0.ZMReviveWidget:setAlpha( 0 )
                        f21_arg0.clipFinished( f21_arg0.ZMReviveWidget )
                        f21_arg0.ZMReviveClampedArrow:completeAnimation()
                        f21_arg0.ZMReviveClampedArrow:setAlpha( 0 )
                        f21_arg0.clipFinished( f21_arg0.ZMReviveClampedArrow )
                        f21_arg0.revivingText:completeAnimation()
                        f21_arg0.revivingText:setAlpha( 0 )
                        f21_arg0.clipFinished( f21_arg0.revivingText )
                  end
            },
            Clamped = {
                  DefaultClip = function ( f22_arg0, f22_arg1 )
                        f22_arg0:__resetProperties()
                        f22_arg0:setupElementClipCounter( 3 )
                        f22_arg0.playerName:completeAnimation()
                        f22_arg0.playerName:setAlpha( 0 )
                        f22_arg0.clipFinished( f22_arg0.playerName )
                        f22_arg0.prompt:completeAnimation()
                        f22_arg0.prompt:setAlpha( 0 )
                        f22_arg0.clipFinished( f22_arg0.prompt )
                        f22_arg0.revivingText:completeAnimation()
                        f22_arg0.revivingText:setAlpha( 0 )
                        f22_arg0.clipFinished( f22_arg0.revivingText )
                  end
            },
            Visible_Reviving = {
                  DefaultClip = function ( f23_arg0, f23_arg1 )
                        f23_arg0:__resetProperties()
                        f23_arg0:setupElementClipCounter( 3 )
                        f23_arg0.playerName:completeAnimation()
                        f23_arg0.playerName:setAlpha( 0 )
                        f23_arg0.clipFinished( f23_arg0.playerName )
                        f23_arg0.prompt:completeAnimation()
                        f23_arg0.prompt:setAlpha( 0 )
                        f23_arg0.clipFinished( f23_arg0.prompt )
                        f23_arg0.ZMReviveClampedArrow:completeAnimation()
                        f23_arg0.ZMReviveClampedArrow:setAlpha( 0 )
                        f23_arg0.clipFinished( f23_arg0.ZMReviveClampedArrow )
                  end
            },
            Visible = {
                  DefaultClip = function ( f24_arg0, f24_arg1 )
                        f24_arg0:__resetProperties()
                        f24_arg0:setupElementClipCounter( 2 )
                        f24_arg0.ZMReviveClampedArrow:completeAnimation()
                        f24_arg0.ZMReviveClampedArrow:setAlpha( 0 )
                        f24_arg0.clipFinished( f24_arg0.ZMReviveClampedArrow )
                        f24_arg0.revivingText:completeAnimation()
                        f24_arg0.revivingText:setAlpha( 0 )
                        f24_arg0.clipFinished( f24_arg0.revivingText )
                  end
            }
      }

      CoD.ZM_Revive.__onClose = function ( f25_arg0 )
            f25_arg0.playerName:close()
            f25_arg0.prompt:close()
            f25_arg0.ZMReviveWidget:close()
            f25_arg0.ZMReviveClampedArrow:close()
      end
            
      CoD.ZM_ReviveWidget = InheritFrom( LUI.UIElement )
      CoD.ZM_ReviveWidget.__defaultWidth = 330
      CoD.ZM_ReviveWidget.__defaultHeight = 330
      CoD.ZM_ReviveWidget.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
            self:setClass( CoD.ZM_ReviveWidget )
            self.id = "ZM_ReviveWidget"
            self.soundSet = "default"
            self.anyChildUsesUpdateState = true
            f1_arg0:addElementToPendingUpdateStateList( self )
            
            local GlowOrangeOver = LUI.UIImage.new( 0.5, 0.5, -120, 120, 0.5, 0.5, -190, 190 )
            GlowOrangeOver:setRGB( 1, 0, 0.31 )
            GlowOrangeOver:setAlpha( 0.4 )
            GlowOrangeOver:setZRot( 90 )
            GlowOrangeOver:setImage( RegisterImage( @"uie_t7_core_hud_mapwidget_panelglow" ) )
            GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( @"ui_add" ) )
            self:addElement( GlowOrangeOver )
            self.GlowOrangeOver = GlowOrangeOver
            
            local glow = LUI.UIImage.new( 0.5, 0.5, -105, 105, 0.5, 0.5, -105, 105 )
            glow:setImage( RegisterImage( @"i_mtl_p8_zm_vapor_altar_icon_01_quickrevive_c" ) )
            self:addElement( glow )
            self.glow = glow
            
            local RingGlow = LUI.UIImage.new( 0.5, 0.5, -105, 105, 0.5, 0.5, -105, 105 )
            RingGlow:setRGB( 1, 0, 0.72 )
            RingGlow:setAlpha( 0 )
            RingGlow:setImage( RegisterImage( @"uie_t7_zm_hud_revive_ringblur" ) )
            RingGlow:setMaterial( LUI.UIImage.GetCachedMaterial( @"ui_add" ) )
            self:addElement( RingGlow )
            self.RingGlow = RingGlow
            
            local RingMiddle = LUI.UIImage.new( 0.5, 0.5, -105, 105, 0.5, 0.5, -105, 105 )
            RingMiddle:setRGB( 1, 0, 0.45 )
            RingMiddle:setAlpha( 0.1 )
            RingMiddle:setImage( RegisterImage( @"uie_t7_zm_hud_revive_ringmiddle" ) )
            RingMiddle:setMaterial( LUI.UIImage.GetCachedMaterial( @"ui_add" ) )
            self:addElement( RingMiddle )
            self.RingMiddle = RingMiddle
            
            local RingTopBleedOut = LUI.UIImage.new( 0.5, 0.5, -105, 105, 0.5, 0.5, -105, 105 )
            RingTopBleedOut:setRGB( 1, 0, 0.92 )
            RingTopBleedOut:setImage( RegisterImage( @"uie_t7_zm_hud_revive_ringtop" ) )
            RingTopBleedOut:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_clock_add" ) )
            RingTopBleedOut:setShaderVector( 1, 0.5, 0, 0, 0 )
            RingTopBleedOut:setShaderVector( 2, 0.5, 0, 0, 0 )
            RingTopBleedOut:setShaderVector( 3, 0.05, 0, 0, 0 )
            RingTopBleedOut:setShaderVector( 4, 0, 0, 0, 0 )
            RingTopBleedOut:linkToElementModel( self, "bleedOutPercent", true, function ( model )
                  local f2_local0 = model:get()
                  if f2_local0 ~= nil then
                        RingTopBleedOut:setShaderVector( 0, CoD.GetVectorComponentFromString( f2_local0, 1 ), CoD.GetVectorComponentFromString( f2_local0, 2 ), CoD.GetVectorComponentFromString( f2_local0, 3 ), CoD.GetVectorComponentFromString( f2_local0, 4 ) )
                  end
            end )
            self:addElement( RingTopBleedOut )
            self.RingTopBleedOut = RingTopBleedOut
            
            local RingTopRevive = LUI.UIImage.new( 0.5, 0.5, -105, 105, 0.5, 0.5, -105, 105 )
            RingTopRevive:setRGB( 1, 0, 0.01 )
            RingTopRevive:setAlpha( 0 )
            RingTopRevive:setImage( RegisterImage( @"uie_t7_zm_hud_revive_ringtop" ) )
            RingTopRevive:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_clock_add" ) )
            RingTopRevive:setShaderVector( 1, 0.5, 0, 0, 0 )
            RingTopRevive:setShaderVector( 2, 0.65, 0, 0, 0 )
            RingTopRevive:setShaderVector( 3, 0.34, 0, 0, 0 )
            RingTopRevive:setShaderVector( 4, 0, 0, 0, 0 )
            RingTopRevive:linkToElementModel( self, "clockPercent", true, function ( model )
                  local f3_local0 = model:get()
                  if f3_local0 ~= nil then
                        RingTopRevive:setShaderVector( 0, CoD.GetVectorComponentFromString( f3_local0, 1 ), CoD.GetVectorComponentFromString( f3_local0, 2 ), CoD.GetVectorComponentFromString( f3_local0, 3 ), CoD.GetVectorComponentFromString( f3_local0, 4 ) )
                  end
            end )
            self:addElement( RingTopRevive )
            self.RingTopRevive = RingTopRevive
            
            local skull = LUI.UIImage.new( 0.5, 0.5, -105, 105, 0.5, 0.5, -105, 105 )
            skull:setImage( RegisterImage( @"i_mtl_p8_zm_vapor_altar_icon_01_quickrevive_c" ) )
            self:addElement( skull )
            self.skull = skull
            
            local AbilitySwirl = LUI.UIImage.new( 0.5, 0.5, -102, 103, 0.5, 0.5, -103, 102 )
            AbilitySwirl:setRGB( 1, 0, 0.64 )
            AbilitySwirl:setAlpha( 0 )
            AbilitySwirl:setScale( 1.3, 1.3 )
            AbilitySwirl:setImage( RegisterImage( @"uie_t7_core_hud_ammowidget_abilityswirl" ) )
            AbilitySwirl:setMaterial( LUI.UIImage.GetCachedMaterial( @"ui_add" ) )
            self:addElement( AbilitySwirl )
            self.AbilitySwirl = AbilitySwirl
            
            local ZMReviveBleedoutRedEyeGlow = CoD.ZM_ReviveBleedoutRedEyeGlow.new( f1_arg0, f1_arg1, 0.5, 0.5, -36, -10, 0.5, 0.5, 5, 32 )
            self:addElement( ZMReviveBleedoutRedEyeGlow )
            self.ZMReviveBleedoutRedEyeGlow = ZMReviveBleedoutRedEyeGlow
            
            local ZMReviveBleedoutRedEyeGlow0 = CoD.ZM_ReviveBleedoutRedEyeGlow.new( f1_arg0, f1_arg1, 0.5, 0.5, 9, 35, 0.5, 0.5, 5, 32 )
            self:addElement( ZMReviveBleedoutRedEyeGlow0 )
            self.ZMReviveBleedoutRedEyeGlow0 = ZMReviveBleedoutRedEyeGlow0
            
            local Glow0 = CoD.AmmoWidget_AbilityGlow.new( f1_arg0, f1_arg1, 0, 1, 6, -6, 0, 1, 6, -6 )
            Glow0:setRGB( 1, 0, 0.49 )
            Glow0:setAlpha( 0 )
            Glow0:setZoom( 13 )
            Glow0:setScale( 0.7, 0.7 )
            self:addElement( Glow0 )
            self.Glow0 = Glow0
            
            self:mergeStateConditions( {
                  {
                        stateName = "Reviving",
                        condition = function ( menu, element, event )
                              return CoD.ModelUtility.IsSelfModelValueEnumBitSet( element, f1_arg1, "stateFlags", Enum[@"bleedoutstateflags"][@"bleedout_state_flag_being_revived"] ) and not CoD.HUDUtility.IsGameTypeEqualToString( "zstandard" )
                        end
                  },
                  {
                        stateName = "BleedingOut_Low",
                        condition = function ( menu, element, event )
                              local f5_local0 = CoD.ModelUtility.IsSelfModelValueEnumBitSet( element, f1_arg1, "stateFlags", Enum[@"bleedoutstateflags"][@"bleedout_state_flag_bleeding_out"] )
                              if f5_local0 then
                                    f5_local0 = CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( element, f1_arg1, "bleedOutPercent", 0,3 )
                                    if f5_local0 then
                                          f5_local0 = not CoD.HUDUtility.IsGameTypeEqualToString( "zstandard" )
                                    end
                              end
                              return f5_local0
                        end
                  },
                  {
                        stateName = "BleedingOut",
                        condition = function ( menu, element, event )
                              return CoD.ModelUtility.IsSelfModelValueEnumBitSet( element, f1_arg1, "stateFlags", Enum[@"bleedoutstateflags"][@"bleedout_state_flag_bleeding_out"] ) and not CoD.HUDUtility.IsGameTypeEqualToString( "zstandard" )
                        end
                  }
            } )
            self:linkToElementModel( self, "stateFlags", true, function ( model )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = model:get(),
                        modelName = "stateFlags"
                  } )
            end )
            self:linkToElementModel( self, "bleedOutPercent", true, function ( model )
                  f1_arg0:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_arg0,
                        controller = f1_arg1,
                        modelValue = model:get(),
                        modelName = "bleedOutPercent"
                  } )
            end )
            LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
            
            if PostLoadFunc then
                  PostLoadFunc( self, f1_arg1, f1_arg0 )
            end

            RushPrintInfo("Called", "ZM Revive Widget")
            --self:setRGB(1, 0, 1)
            
            return self
      end
      
      CoD.ZM_ReviveWidget.__resetProperties = function ( f9_arg0 )
            f9_arg0.skull:completeAnimation()
            f9_arg0.RingTopBleedOut:completeAnimation()
            f9_arg0.RingMiddle:completeAnimation()
            f9_arg0.glow:completeAnimation()
            f9_arg0.GlowOrangeOver:completeAnimation()
            f9_arg0.ZMReviveBleedoutRedEyeGlow:completeAnimation()
            f9_arg0.ZMReviveBleedoutRedEyeGlow0:completeAnimation()
            f9_arg0.RingGlow:completeAnimation()
            f9_arg0.AbilitySwirl:completeAnimation()
            f9_arg0.Glow0:completeAnimation()
            f9_arg0.RingTopRevive:completeAnimation()
            f9_arg0.skull:setAlpha( 1 )
            f9_arg0.skull:setScale( 1, 1 )
            f9_arg0.RingTopBleedOut:setRGB( 1, 0, 0.92 )
            f9_arg0.RingTopBleedOut:setAlpha( 1 )
            f9_arg0.RingMiddle:setRGB( 1, 0, 0.45 )
            f9_arg0.RingMiddle:setAlpha( 0.1 )
            f9_arg0.glow:setRGB( 1, 1, 1 )
            f9_arg0.glow:setAlpha( 1 )
            f9_arg0.GlowOrangeOver:setRGB( 1, 0, 0.31 )
            f9_arg0.GlowOrangeOver:setAlpha( 0.4 )
            f9_arg0.ZMReviveBleedoutRedEyeGlow:setLeftRight( 0.5, 0.5, -36, -10 )
            f9_arg0.ZMReviveBleedoutRedEyeGlow:setTopBottom( 0.5, 0.5, 5, 32 )
            f9_arg0.ZMReviveBleedoutRedEyeGlow:setRGB( 1, 1, 1 )
            f9_arg0.ZMReviveBleedoutRedEyeGlow:setAlpha( 1 )
            f9_arg0.ZMReviveBleedoutRedEyeGlow0:setLeftRight( 0.5, 0.5, 9, 35 )
            f9_arg0.ZMReviveBleedoutRedEyeGlow0:setTopBottom( 0.5, 0.5, 5, 32 )
            f9_arg0.ZMReviveBleedoutRedEyeGlow0:setRGB( 1, 1, 1 )
            f9_arg0.ZMReviveBleedoutRedEyeGlow0:setAlpha( 1 )
            f9_arg0.RingGlow:setRGB( 1, 0, 0.72 )
            f9_arg0.RingGlow:setAlpha( 0 )
            f9_arg0.AbilitySwirl:setAlpha( 0 )
            f9_arg0.AbilitySwirl:setZRot( 0 )
            f9_arg0.AbilitySwirl:setScale( 1.3, 1.3 )
            f9_arg0.Glow0:setRGB( 1, 0, 0.49 )
            f9_arg0.Glow0:setAlpha( 0 )
            f9_arg0.RingTopRevive:setAlpha( 0 )
            f9_arg0.RingTopRevive:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_clock_add" ) )
            f9_arg0.RingTopRevive:setShaderVector( 1, 0.5, 0, 0, 0 )
            f9_arg0.RingTopRevive:setShaderVector( 2, 0.65, 0, 0, 0 )
            f9_arg0.RingTopRevive:setShaderVector( 3, 0.34, 0, 0, 0 )
            f9_arg0.RingTopRevive:setShaderVector( 4, 0, 0, 0, 0 )
      end
      
      CoD.ZM_ReviveWidget.__clipsPerState = {
            DefaultState = {
                  DefaultClip = function ( f10_arg0, f10_arg1 )
                        f10_arg0:__resetProperties()
                        f10_arg0:setupElementClipCounter( 7 )
                        f10_arg0.GlowOrangeOver:completeAnimation()
                        f10_arg0.GlowOrangeOver:setAlpha( 0 )
                        f10_arg0.clipFinished( f10_arg0.GlowOrangeOver )
                        f10_arg0.glow:completeAnimation()
                        f10_arg0.glow:setAlpha( 0 )
                        f10_arg0.clipFinished( f10_arg0.glow )
                        f10_arg0.RingMiddle:completeAnimation()
                        f10_arg0.RingMiddle:setAlpha( 0 )
                        f10_arg0.clipFinished( f10_arg0.RingMiddle )
                        f10_arg0.RingTopBleedOut:completeAnimation()
                        f10_arg0.RingTopBleedOut:setAlpha( 0 )
                        f10_arg0.clipFinished( f10_arg0.RingTopBleedOut )
                        f10_arg0.skull:completeAnimation()
                        f10_arg0.skull:setAlpha( 0 )
                        f10_arg0.clipFinished( f10_arg0.skull )
                        f10_arg0.ZMReviveBleedoutRedEyeGlow:completeAnimation()
                        f10_arg0.ZMReviveBleedoutRedEyeGlow:setAlpha( 0 )
                        f10_arg0.clipFinished( f10_arg0.ZMReviveBleedoutRedEyeGlow )
                        f10_arg0.ZMReviveBleedoutRedEyeGlow0:completeAnimation()
                        f10_arg0.ZMReviveBleedoutRedEyeGlow0:setAlpha( 0 )
                        f10_arg0.clipFinished( f10_arg0.ZMReviveBleedoutRedEyeGlow0 )
                  end,
                  BleedingOut = function ( f11_arg0, f11_arg1 )
                        f11_arg0:__resetProperties()
                        f11_arg0:setupElementClipCounter( 10 )
                        local f11_local0 = function ( f12_arg0 )
                              local f12_local0 = function ( f13_arg0 )
                                    local f13_local0 = function ( f14_arg0 )
                                          local f14_local0 = function ( f15_arg0 )
                                                f15_arg0:beginAnimation( 69 )
                                                f15_arg0:setAlpha( 0.4 )
                                                f15_arg0:registerEventHandler( "transition_complete_keyframe", f11_arg0.clipFinished )
                                          end
                                          
                                          f14_arg0:beginAnimation( 60 )
                                          f14_arg0:setAlpha( 0 )
                                          f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
                                    end
                                    
                                    f13_arg0:beginAnimation( 60 )
                                    f13_arg0:setAlpha( 1 )
                                    f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
                              end
                              
                              f11_arg0.GlowOrangeOver:beginAnimation( 320 )
                              f11_arg0.GlowOrangeOver:registerEventHandler( "interrupted_keyframe", f11_arg0.clipInterrupted )
                              f11_arg0.GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", f12_local0 )
                        end
                        
                        f11_arg0.GlowOrangeOver:completeAnimation()
                        f11_arg0.GlowOrangeOver:setAlpha( 0 )
                        f11_local0( f11_arg0.GlowOrangeOver )
                        local f11_local1 = function ( f16_arg0 )
                              local f16_local0 = function ( f17_arg0 )
                                    f17_arg0:beginAnimation( 190 )
                                    f17_arg0:setAlpha( 1 )
                                    f17_arg0:registerEventHandler( "transition_complete_keyframe", f11_arg0.clipFinished )
                              end
                              
                              f11_arg0.glow:beginAnimation( 430 )
                              f11_arg0.glow:registerEventHandler( "interrupted_keyframe", f11_arg0.clipInterrupted )
                              f11_arg0.glow:registerEventHandler( "transition_complete_keyframe", f16_local0 )
                        end
                        
                        f11_arg0.glow:completeAnimation()
                        f11_arg0.glow:setAlpha( 0 )
                        f11_local1( f11_arg0.glow )
                        local f11_local2 = function ( f18_arg0 )
                              f11_arg0.RingGlow:beginAnimation( 320 )
                              f11_arg0.RingGlow:registerEventHandler( "interrupted_keyframe", f11_arg0.clipInterrupted )
                              f11_arg0.RingGlow:registerEventHandler( "transition_complete_keyframe", f11_arg0.clipFinished )
                        end
                        
                        f11_arg0.RingGlow:completeAnimation()
                        f11_arg0.RingGlow:setAlpha( 0 )
                        f11_local2( f11_arg0.RingGlow )
                        local f11_local3 = function ( f19_arg0 )
                              f11_arg0.RingMiddle:beginAnimation( 320 )
                              f11_arg0.RingMiddle:setAlpha( 0.1 )
                              f11_arg0.RingMiddle:registerEventHandler( "interrupted_keyframe", f11_arg0.clipInterrupted )
                              f11_arg0.RingMiddle:registerEventHandler( "transition_complete_keyframe", f11_arg0.clipFinished )
                        end
                        
                        f11_arg0.RingMiddle:completeAnimation()
                        f11_arg0.RingMiddle:setAlpha( 0 )
                        f11_local3( f11_arg0.RingMiddle )
                        local f11_local4 = function ( f20_arg0 )
                              local f20_local0 = function ( f21_arg0 )
                                    f21_arg0:beginAnimation( 199 )
                                    f21_arg0:setAlpha( 1 )
                                    f21_arg0:registerEventHandler( "transition_complete_keyframe", f11_arg0.clipFinished )
                              end
                              
                              f20_arg0:beginAnimation( 120 )
                              f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
                        end
                        
                        f11_arg0.RingTopBleedOut:beginAnimation( 310 )
                        f11_arg0.RingTopBleedOut:setAlpha( 0 )
                        f11_arg0.RingTopBleedOut:registerEventHandler( "interrupted_keyframe", f11_arg0.clipInterrupted )
                        f11_arg0.RingTopBleedOut:registerEventHandler( "transition_complete_keyframe", f11_local4 )
                        local f11_local5 = function ( f22_arg0 )
                              local f22_local0 = function ( f23_arg0 )
                                    local f23_local0 = function ( f24_arg0 )
                                          f24_arg0:beginAnimation( 69 )
                                          f24_arg0:setAlpha( 1 )
                                          f24_arg0:setScale( 1, 1 )
                                          f24_arg0:registerEventHandler( "transition_complete_keyframe", f11_arg0.clipFinished )
                                    end
                                    
                                    f23_arg0:beginAnimation( 120 )
                                    f23_arg0:setAlpha( 0.63 )
                                    f23_arg0:setScale( 1.2, 1.2 )
                                    f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
                              end
                              
                              f11_arg0.skull:beginAnimation( 430 )
                              f11_arg0.skull:registerEventHandler( "interrupted_keyframe", f11_arg0.clipInterrupted )
                              f11_arg0.skull:registerEventHandler( "transition_complete_keyframe", f22_local0 )
                        end
                        
                        f11_arg0.skull:completeAnimation()
                        f11_arg0.skull:setAlpha( 0 )
                        f11_arg0.skull:setScale( 1, 1 )
                        f11_local5( f11_arg0.skull )
                        local f11_local6 = function ( f25_arg0 )
                              local f25_local0 = function ( f26_arg0 )
                                    local f26_local0 = function ( f27_arg0 )
                                          local f27_local0 = function ( f28_arg0 )
                                                f28_arg0:beginAnimation( 50 )
                                                f28_arg0:setScale( 1.4, 1.4 )
                                                f28_arg0:registerEventHandler( "transition_complete_keyframe", f11_arg0.clipFinished )
                                          end
                                          
                                          f27_arg0:beginAnimation( 40 )
                                          f27_arg0:setAlpha( 0 )
                                          f27_arg0:setZRot( 360 )
                                          f27_arg0:setScale( 1.33, 1.33 )
                                          f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
                                    end
                                    
                                    f26_arg0:beginAnimation( 199 )
                                    f26_arg0:setAlpha( 0.78 )
                                    f26_arg0:setZRot( 300 )
                                    f26_arg0:setScale( 1.28, 1.28 )
                                    f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
                              end
                              
                              f11_arg0.AbilitySwirl:beginAnimation( 390 )
                              f11_arg0.AbilitySwirl:registerEventHandler( "interrupted_keyframe", f11_arg0.clipInterrupted )
                              f11_arg0.AbilitySwirl:registerEventHandler( "transition_complete_keyframe", f25_local0 )
                        end
                        
                        f11_arg0.AbilitySwirl:completeAnimation()
                        f11_arg0.AbilitySwirl:setAlpha( 0 )
                        f11_arg0.AbilitySwirl:setZRot( 0 )
                        f11_arg0.AbilitySwirl:setScale( 1, 1 )
                        f11_local6( f11_arg0.AbilitySwirl )
                        f11_arg0.ZMReviveBleedoutRedEyeGlow:completeAnimation()
                        f11_arg0.ZMReviveBleedoutRedEyeGlow:setAlpha( 0 )
                        f11_arg0.clipFinished( f11_arg0.ZMReviveBleedoutRedEyeGlow )
                        f11_arg0.ZMReviveBleedoutRedEyeGlow0:completeAnimation()
                        f11_arg0.ZMReviveBleedoutRedEyeGlow0:setAlpha( 0 )
                        f11_arg0.clipFinished( f11_arg0.ZMReviveBleedoutRedEyeGlow0 )
                        local f11_local7 = function ( f29_arg0 )
                              local f29_local0 = function ( f30_arg0 )
                                    local f30_local0 = function ( f31_arg0 )
                                          f31_arg0:beginAnimation( 300 )
                                          f31_arg0:setAlpha( 0 )
                                          f31_arg0:registerEventHandler( "transition_complete_keyframe", f11_arg0.clipFinished )
                                    end
                                    
                                    f30_arg0:beginAnimation( 60 )
                                    f30_arg0:setAlpha( 0.2 )
                                    f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
                              end
                              
                              f11_arg0.Glow0:beginAnimation( 320 )
                              f11_arg0.Glow0:registerEventHandler( "interrupted_keyframe", f11_arg0.clipInterrupted )
                              f11_arg0.Glow0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
                        end
                        
                        f11_arg0.Glow0:completeAnimation()
                        f11_arg0.Glow0:setAlpha( 0 )
                        f11_local7( f11_arg0.Glow0 )
                  end
            },
            Reviving = {
                  DefaultClip = function ( f32_arg0, f32_arg1 )
                        f32_arg0:__resetProperties()
                        f32_arg0:setupElementClipCounter( 9 )
                        local f32_local0 = function ( f33_arg0 )
                              local f33_local0 = function ( f34_arg0 )
                                    local f34_local0 = function ( f35_arg0 )
                                          local f35_local0 = function ( f36_arg0 )
                                                local f36_local0 = function ( f37_arg0 )
                                                      f37_arg0:beginAnimation( 289 )
                                                      f37_arg0:setAlpha( 0.4 )
                                                      f37_arg0:registerEventHandler( "transition_complete_keyframe", f32_arg0.clipFinished )
                                                end
                                                
                                                f36_arg0:beginAnimation( 120 )
                                                f36_arg0:setAlpha( 0.7 )
                                                f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
                                          end
                                          
                                          f35_arg0:beginAnimation( 200 )
                                          f35_arg0:registerEventHandler( "transition_complete_keyframe", f35_local0 )
                                    end
                                    
                                    f34_arg0:beginAnimation( 300 )
                                    f34_arg0:setAlpha( 0.4 )
                                    f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
                              end
                              
                              f32_arg0.GlowOrangeOver:beginAnimation( 100 )
                              f32_arg0.GlowOrangeOver:setAlpha( 0.71 )
                              f32_arg0.GlowOrangeOver:registerEventHandler( "interrupted_keyframe", f32_arg0.clipInterrupted )
                              f32_arg0.GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", f33_local0 )
                        end
                        
                        f32_arg0.GlowOrangeOver:completeAnimation()
                        f32_arg0.GlowOrangeOver:setRGB( 1, 0, 0.01 )
                        f32_arg0.GlowOrangeOver:setAlpha( 0.4 )
                        f32_local0( f32_arg0.GlowOrangeOver )
                        f32_arg0.RingGlow:completeAnimation()
                        f32_arg0.RingGlow:setRGB( 1, 0, 0.01 )
                        f32_arg0.clipFinished( f32_arg0.RingGlow )
                        f32_arg0.RingMiddle:completeAnimation()
                        f32_arg0.RingMiddle:setRGB( 1, 0, 0.01 )
                        f32_arg0.RingMiddle:setAlpha( 0.06 )
                        f32_arg0.clipFinished( f32_arg0.RingMiddle )
                        f32_arg0.RingTopBleedOut:completeAnimation()
                        f32_arg0.RingTopBleedOut:setRGB( 1, 0, 0.01 )
                        f32_arg0.RingTopBleedOut:setAlpha( 0 )
                        f32_arg0.clipFinished( f32_arg0.RingTopBleedOut )
                        f32_arg0.RingTopRevive:completeAnimation()
                        f32_arg0.RingTopRevive:setAlpha( 1 )
                        f32_arg0.RingTopRevive:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_clock_add" ) )
                        f32_arg0.RingTopRevive:setShaderVector( 1, 0.5, 0, 0, 0 )
                        f32_arg0.RingTopRevive:setShaderVector( 2, 0.5, 0, 0, 0 )
                        f32_arg0.RingTopRevive:setShaderVector( 3, 0.05, 0, 0, 0 )
                        f32_arg0.RingTopRevive:setShaderVector( 4, 0, 0, 0, 0 )
                        f32_arg0.clipFinished( f32_arg0.RingTopRevive )
                        local f32_local1 = function ( f38_arg0 )
                              local f38_local0 = function ( f39_arg0 )
                                    f39_arg0:beginAnimation( 909 )
                                    f39_arg0:setScale( 1, 1 )
                                    f39_arg0:registerEventHandler( "transition_complete_keyframe", f32_arg0.clipFinished )
                              end
                              
                              f32_arg0.skull:beginAnimation( 100 )
                              f32_arg0.skull:setScale( 1.2, 1.2 )
                              f32_arg0.skull:registerEventHandler( "interrupted_keyframe", f32_arg0.clipInterrupted )
                              f32_arg0.skull:registerEventHandler( "transition_complete_keyframe", f38_local0 )
                        end
                        
                        f32_arg0.skull:completeAnimation()
                        f32_arg0.skull:setScale( 1, 1 )
                        f32_local1( f32_arg0.skull )
                        f32_arg0.ZMReviveBleedoutRedEyeGlow:completeAnimation()
                        f32_arg0.ZMReviveBleedoutRedEyeGlow:setAlpha( 0 )
                        f32_arg0.clipFinished( f32_arg0.ZMReviveBleedoutRedEyeGlow )
                        f32_arg0.ZMReviveBleedoutRedEyeGlow0:completeAnimation()
                        f32_arg0.ZMReviveBleedoutRedEyeGlow0:setAlpha( 0 )
                        f32_arg0.clipFinished( f32_arg0.ZMReviveBleedoutRedEyeGlow0 )
                        local f32_local2 = function ( f40_arg0 )
                              local f40_local0 = function ( f41_arg0 )
                                    f41_arg0:beginAnimation( 909 )
                                    f41_arg0:registerEventHandler( "transition_complete_keyframe", f32_arg0.clipFinished )
                              end
                              
                              f32_arg0.Glow0:beginAnimation( 100 )
                              f32_arg0.Glow0:setAlpha( 0.1 )
                              f32_arg0.Glow0:registerEventHandler( "interrupted_keyframe", f32_arg0.clipInterrupted )
                              f32_arg0.Glow0:registerEventHandler( "transition_complete_keyframe", f40_local0 )
                        end
                        
                        f32_arg0.Glow0:completeAnimation()
                        f32_arg0.Glow0:setRGB( 1, 0, 0.01 )
                        f32_arg0.Glow0:setAlpha( 0 )
                        f32_local2( f32_arg0.Glow0 )
                        f32_arg0.nextClip = "DefaultClip"
                  end
            },
            BleedingOut_Low = {
                  DefaultClip = function ( f42_arg0, f42_arg1 )
                        f42_arg0:__resetProperties()
                        f42_arg0:setupElementClipCounter( 9 )
                        local f42_local0 = function ( f43_arg0 )
                              local f43_local0 = function ( f44_arg0 )
                                    local f44_local0 = function ( f45_arg0 )
                                          local f45_local0 = function ( f46_arg0 )
                                                f46_arg0:beginAnimation( 290 )
                                                f46_arg0:setAlpha( 0.4 )
                                                f46_arg0:registerEventHandler( "transition_complete_keyframe", f42_arg0.clipFinished )
                                          end
                                          
                                          f45_arg0:beginAnimation( 69 )
                                          f45_arg0:setAlpha( 0.8 )
                                          f45_arg0:registerEventHandler( "transition_complete_keyframe", f45_local0 )
                                    end
                                    
                                    f44_arg0:beginAnimation( 70 )
                                    f44_arg0:setAlpha( 0.4 )
                                    f44_arg0:registerEventHandler( "transition_complete_keyframe", f44_local0 )
                              end
                              
                              f42_arg0.GlowOrangeOver:beginAnimation( 70 )
                              f42_arg0.GlowOrangeOver:setAlpha( 0.8 )
                              f42_arg0.GlowOrangeOver:registerEventHandler( "interrupted_keyframe", f42_arg0.clipInterrupted )
                              f42_arg0.GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", f43_local0 )
                        end
                        
                        f42_arg0.GlowOrangeOver:completeAnimation()
                        f42_arg0.GlowOrangeOver:setRGB( 0.61, 0, 0.01 )
                        f42_arg0.GlowOrangeOver:setAlpha( 0.4 )
                        f42_local0( f42_arg0.GlowOrangeOver )
                        f42_arg0.glow:completeAnimation()
                        f42_arg0.glow:setRGB( 1, 0, 0.38 )
                        f42_arg0.clipFinished( f42_arg0.glow )
                        f42_arg0.RingGlow:completeAnimation()
                        f42_arg0.RingGlow:setRGB( 1, 0, 0.12 )
                        f42_arg0.clipFinished( f42_arg0.RingGlow )
                        f42_arg0.RingMiddle:completeAnimation()
                        f42_arg0.RingMiddle:setRGB( 1, 0, 0 )
                        f42_arg0.RingMiddle:setAlpha( 0.06 )
                        f42_arg0.clipFinished( f42_arg0.RingMiddle )
                        f42_arg0.RingTopBleedOut:completeAnimation()
                        f42_arg0.RingTopBleedOut:setRGB( 1, 0, 0.06 )
                        f42_arg0.clipFinished( f42_arg0.RingTopBleedOut )
                        local f42_local1 = function ( f47_arg0 )
                              local f47_local0 = function ( f48_arg0 )
                                    f48_arg0:beginAnimation( 430 )
                                    f48_arg0:setScale( 1, 1 )
                                    f48_arg0:registerEventHandler( "transition_complete_keyframe", f42_arg0.clipFinished )
                              end
                              
                              f42_arg0.skull:beginAnimation( 70 )
                              f42_arg0.skull:setScale( 1.1, 1.1 )
                              f42_arg0.skull:registerEventHandler( "interrupted_keyframe", f42_arg0.clipInterrupted )
                              f42_arg0.skull:registerEventHandler( "transition_complete_keyframe", f47_local0 )
                        end
                        
                        f42_arg0.skull:completeAnimation()
                        f42_arg0.skull:setScale( 1, 1 )
                        f42_local1( f42_arg0.skull )
                        local f42_local2 = function ( f49_arg0 )
                              local f49_local0 = function ( f50_arg0 )
                                    f50_arg0:beginAnimation( 430 )
                                    f50_arg0:setLeftRight( 0.5, 0.5, -36, -10 )
                                    f50_arg0:setTopBottom( 0.5, 0.5, 5, 32 )
                                    f50_arg0:registerEventHandler( "transition_complete_keyframe", f42_arg0.clipFinished )
                              end
                              
                              f42_arg0.ZMReviveBleedoutRedEyeGlow:beginAnimation( 70 )
                              f42_arg0.ZMReviveBleedoutRedEyeGlow:setLeftRight( 0.5, 0.5, -39, -13 )
                              f42_arg0.ZMReviveBleedoutRedEyeGlow:setTopBottom( 0.5, 0.5, 7, 34 )
                              f42_arg0.ZMReviveBleedoutRedEyeGlow:registerEventHandler( "interrupted_keyframe", f42_arg0.clipInterrupted )
                              f42_arg0.ZMReviveBleedoutRedEyeGlow:registerEventHandler( "transition_complete_keyframe", f49_local0 )
                        end
                        
                        f42_arg0.ZMReviveBleedoutRedEyeGlow:completeAnimation()
                        f42_arg0.ZMReviveBleedoutRedEyeGlow:setLeftRight( 0.5, 0.5, -36, -10 )
                        f42_arg0.ZMReviveBleedoutRedEyeGlow:setTopBottom( 0.5, 0.5, 5, 32 )
                        f42_arg0.ZMReviveBleedoutRedEyeGlow:setAlpha( 1 )
                        f42_local2( f42_arg0.ZMReviveBleedoutRedEyeGlow )
                        local f42_local3 = function ( f51_arg0 )
                              local f51_local0 = function ( f52_arg0 )
                                    f52_arg0:beginAnimation( 430 )
                                    f52_arg0:setLeftRight( 0.5, 0.5, 9, 35 )
                                    f52_arg0:setTopBottom( 0.5, 0.5, 5, 32 )
                                    f52_arg0:registerEventHandler( "transition_complete_keyframe", f42_arg0.clipFinished )
                              end
                              
                              f42_arg0.ZMReviveBleedoutRedEyeGlow0:beginAnimation( 70 )
                              f42_arg0.ZMReviveBleedoutRedEyeGlow0:setLeftRight( 0.5, 0.5, 12, 38 )
                              f42_arg0.ZMReviveBleedoutRedEyeGlow0:setTopBottom( 0.5, 0.5, 7, 34 )
                              f42_arg0.ZMReviveBleedoutRedEyeGlow0:registerEventHandler( "interrupted_keyframe", f42_arg0.clipInterrupted )
                              f42_arg0.ZMReviveBleedoutRedEyeGlow0:registerEventHandler( "transition_complete_keyframe", f51_local0 )
                        end
                        
                        f42_arg0.ZMReviveBleedoutRedEyeGlow0:completeAnimation()
                        f42_arg0.ZMReviveBleedoutRedEyeGlow0:setLeftRight( 0.5, 0.5, 9, 35 )
                        f42_arg0.ZMReviveBleedoutRedEyeGlow0:setTopBottom( 0.5, 0.5, 5, 32 )
                        f42_arg0.ZMReviveBleedoutRedEyeGlow0:setAlpha( 1 )
                        f42_local3( f42_arg0.ZMReviveBleedoutRedEyeGlow0 )
                        local f42_local4 = function ( f53_arg0 )
                              local f53_local0 = function ( f54_arg0 )
                                    f54_arg0:beginAnimation( 430 )
                                    f54_arg0:setAlpha( 0.1 )
                                    f54_arg0:registerEventHandler( "transition_complete_keyframe", f42_arg0.clipFinished )
                              end
                              
                              f42_arg0.Glow0:beginAnimation( 70 )
                              f42_arg0.Glow0:setAlpha( 0.2 )
                              f42_arg0.Glow0:registerEventHandler( "interrupted_keyframe", f42_arg0.clipInterrupted )
                              f42_arg0.Glow0:registerEventHandler( "transition_complete_keyframe", f53_local0 )
                        end
                        
                        f42_arg0.Glow0:completeAnimation()
                        f42_arg0.Glow0:setRGB( 1, 0, 0 )
                        f42_arg0.Glow0:setAlpha( 0.1 )
                        f42_local4( f42_arg0.Glow0 )
                        f42_arg0.nextClip = "DefaultClip"
                  end,
                  Reviving = function ( f55_arg0, f55_arg1 )
                        f55_arg0:__resetProperties()
                        f55_arg0:setupElementClipCounter( 10 )
                        local f55_local0 = function ( f56_arg0 )
                              f55_arg0.GlowOrangeOver:beginAnimation( 200 )
                              f55_arg0.GlowOrangeOver:setRGB( 0, 1, 0.01 )
                              f55_arg0.GlowOrangeOver:registerEventHandler( "interrupted_keyframe", f55_arg0.clipInterrupted )
                              f55_arg0.GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", f55_arg0.clipFinished )
                        end
                        
                        f55_arg0.GlowOrangeOver:completeAnimation()
                        f55_arg0.GlowOrangeOver:setRGB( 0.61, 0, 0.01 )
                        f55_arg0.GlowOrangeOver:setAlpha( 0.4 )
                        f55_local0( f55_arg0.GlowOrangeOver )
                        local f55_local1 = function ( f57_arg0 )
                              f55_arg0.glow:beginAnimation( 200 )
                              f55_arg0.glow:registerEventHandler( "interrupted_keyframe", f55_arg0.clipInterrupted )
                              f55_arg0.glow:registerEventHandler( "transition_complete_keyframe", f55_arg0.clipFinished )
                        end
                        
                        f55_arg0.glow:completeAnimation()
                        f55_arg0.glow:setRGB( 1, 0, 0.38 )
                        f55_arg0.glow:setAlpha( 1 )
                        f55_local1( f55_arg0.glow )
                        local f55_local2 = function ( f58_arg0 )
                              f55_arg0.RingGlow:beginAnimation( 200 )
                              f55_arg0.RingGlow:setRGB( 0, 1, 0.01 )
                              f55_arg0.RingGlow:registerEventHandler( "interrupted_keyframe", f55_arg0.clipInterrupted )
                              f55_arg0.RingGlow:registerEventHandler( "transition_complete_keyframe", f55_arg0.clipFinished )
                        end
                        
                        f55_arg0.RingGlow:completeAnimation()
                        f55_arg0.RingGlow:setRGB( 1, 0, 0.12 )
                        f55_arg0.RingGlow:setAlpha( 0 )
                        f55_local2( f55_arg0.RingGlow )
                        local f55_local3 = function ( f59_arg0 )
                              f55_arg0.RingMiddle:beginAnimation( 200 )
                              f55_arg0.RingMiddle:setRGB( 0, 1, 0.01 )
                              f55_arg0.RingMiddle:registerEventHandler( "interrupted_keyframe", f55_arg0.clipInterrupted )
                              f55_arg0.RingMiddle:registerEventHandler( "transition_complete_keyframe", f55_arg0.clipFinished )
                        end
                        
                        f55_arg0.RingMiddle:completeAnimation()
                        f55_arg0.RingMiddle:setRGB( 1, 0, 0 )
                        f55_arg0.RingMiddle:setAlpha( 0.06 )
                        f55_local3( f55_arg0.RingMiddle )
                        local f55_local4 = function ( f60_arg0 )
                              f55_arg0.RingTopBleedOut:beginAnimation( 200 )
                              f55_arg0.RingTopBleedOut:setRGB( 0, 1, 0.01 )
                              f55_arg0.RingTopBleedOut:setAlpha( 0 )
                              f55_arg0.RingTopBleedOut:registerEventHandler( "interrupted_keyframe", f55_arg0.clipInterrupted )
                              f55_arg0.RingTopBleedOut:registerEventHandler( "transition_complete_keyframe", f55_arg0.clipFinished )
                        end
                        
                        f55_arg0.RingTopBleedOut:completeAnimation()
                        f55_arg0.RingTopBleedOut:setRGB( 1, 0, 0.06 )
                        f55_arg0.RingTopBleedOut:setAlpha( 1 )
                        f55_local4( f55_arg0.RingTopBleedOut )
                        local f55_local5 = function ( f61_arg0 )
                              f55_arg0.RingTopRevive:beginAnimation( 200 )
                              f55_arg0.RingTopRevive:setAlpha( 1 )
                              f55_arg0.RingTopRevive:registerEventHandler( "interrupted_keyframe", f55_arg0.clipInterrupted )
                              f55_arg0.RingTopRevive:registerEventHandler( "transition_complete_keyframe", f55_arg0.clipFinished )
                        end
                        
                        f55_arg0.RingTopRevive:completeAnimation()
                        f55_arg0.RingTopRevive:setAlpha( 0 )
                        f55_arg0.RingTopRevive:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_clock_add" ) )
                        f55_arg0.RingTopRevive:setShaderVector( 1, 0.5, 0, 0, 0 )
                        f55_arg0.RingTopRevive:setShaderVector( 2, 0.5, 0, 0, 0 )
                        f55_arg0.RingTopRevive:setShaderVector( 3, 0.05, 0, 0, 0 )
                        f55_arg0.RingTopRevive:setShaderVector( 4, 0, 0, 0, 0 )
                        f55_local5( f55_arg0.RingTopRevive )
                        local f55_local6 = function ( f62_arg0 )
                              local f62_local0 = function ( f63_arg0 )
                                    f63_arg0:beginAnimation( 100 )
                                    f63_arg0:setScale( 1, 1 )
                                    f63_arg0:registerEventHandler( "transition_complete_keyframe", f55_arg0.clipFinished )
                              end
                              
                              f55_arg0.skull:beginAnimation( 100 )
                              f55_arg0.skull:setScale( 1.1, 1.1 )
                              f55_arg0.skull:registerEventHandler( "interrupted_keyframe", f55_arg0.clipInterrupted )
                              f55_arg0.skull:registerEventHandler( "transition_complete_keyframe", f62_local0 )
                        end
                        
                        f55_arg0.skull:completeAnimation()
                        f55_arg0.skull:setAlpha( 1 )
                        f55_arg0.skull:setScale( 1, 1 )
                        f55_local6( f55_arg0.skull )
                        local f55_local7 = function ( f64_arg0 )
                              f55_arg0.ZMReviveBleedoutRedEyeGlow:beginAnimation( 200 )
                              f55_arg0.ZMReviveBleedoutRedEyeGlow:setAlpha( 0 )
                              f55_arg0.ZMReviveBleedoutRedEyeGlow:registerEventHandler( "interrupted_keyframe", f55_arg0.clipInterrupted )
                              f55_arg0.ZMReviveBleedoutRedEyeGlow:registerEventHandler( "transition_complete_keyframe", f55_arg0.clipFinished )
                        end
                        
                        f55_arg0.ZMReviveBleedoutRedEyeGlow:completeAnimation()
                        f55_arg0.ZMReviveBleedoutRedEyeGlow:setRGB( 1, 1, 1 )
                        f55_arg0.ZMReviveBleedoutRedEyeGlow:setAlpha( 1 )
                        f55_local7( f55_arg0.ZMReviveBleedoutRedEyeGlow )
                        local f55_local8 = function ( f65_arg0 )
                              f55_arg0.ZMReviveBleedoutRedEyeGlow0:beginAnimation( 200 )
                              f55_arg0.ZMReviveBleedoutRedEyeGlow0:setAlpha( 0 )
                              f55_arg0.ZMReviveBleedoutRedEyeGlow0:registerEventHandler( "interrupted_keyframe", f55_arg0.clipInterrupted )
                              f55_arg0.ZMReviveBleedoutRedEyeGlow0:registerEventHandler( "transition_complete_keyframe", f55_arg0.clipFinished )
                        end
                        
                        f55_arg0.ZMReviveBleedoutRedEyeGlow0:completeAnimation()
                        f55_arg0.ZMReviveBleedoutRedEyeGlow0:setRGB( 1, 1, 1 )
                        f55_arg0.ZMReviveBleedoutRedEyeGlow0:setAlpha( 1 )
                        f55_local8( f55_arg0.ZMReviveBleedoutRedEyeGlow0 )
                        local f55_local9 = function ( f66_arg0 )
                              f55_arg0.Glow0:beginAnimation( 200 )
                              f55_arg0.Glow0:setAlpha( 0 )
                              f55_arg0.Glow0:registerEventHandler( "interrupted_keyframe", f55_arg0.clipInterrupted )
                              f55_arg0.Glow0:registerEventHandler( "transition_complete_keyframe", f55_arg0.clipFinished )
                        end
                        
                        f55_arg0.Glow0:completeAnimation()
                        f55_arg0.Glow0:setRGB( 1, 0, 0.04 )
                        f55_arg0.Glow0:setAlpha( 0.1 )
                        f55_local9( f55_arg0.Glow0 )
                  end
            },
            BleedingOut = {
                  DefaultClip = function ( f67_arg0, f67_arg1 )
                        f67_arg0:__resetProperties()
                        f67_arg0:setupElementClipCounter( 5 )
                        local f67_local0 = function ( f68_arg0 )
                              local f68_local0 = function ( f69_arg0 )
                                    f69_arg0:beginAnimation( 900 )
                                    f69_arg0:setAlpha( 0.4 )
                                    f69_arg0:registerEventHandler( "transition_complete_keyframe", f67_arg0.clipFinished )
                              end
                              
                              f67_arg0.GlowOrangeOver:beginAnimation( 100 )
                              f67_arg0.GlowOrangeOver:setAlpha( 0.6 )
                              f67_arg0.GlowOrangeOver:registerEventHandler( "interrupted_keyframe", f67_arg0.clipInterrupted )
                              f67_arg0.GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", f68_local0 )
                        end
                        
                        f67_arg0.GlowOrangeOver:completeAnimation()
                        f67_arg0.GlowOrangeOver:setAlpha( 0.4 )
                        f67_local0( f67_arg0.GlowOrangeOver )
                        local f67_local1 = function ( f70_arg0 )
                              local f70_local0 = function ( f71_arg0 )
                                    f71_arg0:beginAnimation( 900 )
                                    f71_arg0:setScale( 1, 1 )
                                    f71_arg0:registerEventHandler( "transition_complete_keyframe", f67_arg0.clipFinished )
                              end
                              
                              f67_arg0.skull:beginAnimation( 100 )
                              f67_arg0.skull:setScale( 1.1, 1.1 )
                              f67_arg0.skull:registerEventHandler( "interrupted_keyframe", f67_arg0.clipInterrupted )
                              f67_arg0.skull:registerEventHandler( "transition_complete_keyframe", f70_local0 )
                        end
                        
                        f67_arg0.skull:completeAnimation()
                        f67_arg0.skull:setScale( 1, 1 )
                        f67_local1( f67_arg0.skull )
                        f67_arg0.ZMReviveBleedoutRedEyeGlow:completeAnimation()
                        f67_arg0.ZMReviveBleedoutRedEyeGlow:setAlpha( 0 )
                        f67_arg0.clipFinished( f67_arg0.ZMReviveBleedoutRedEyeGlow )
                        f67_arg0.ZMReviveBleedoutRedEyeGlow0:completeAnimation()
                        f67_arg0.ZMReviveBleedoutRedEyeGlow0:setAlpha( 0 )
                        f67_arg0.clipFinished( f67_arg0.ZMReviveBleedoutRedEyeGlow0 )
                        local f67_local2 = function ( f72_arg0 )
                              local f72_local0 = function ( f73_arg0 )
                                    f73_arg0:beginAnimation( 900 )
                                    f73_arg0:setAlpha( 0 )
                                    f73_arg0:registerEventHandler( "transition_complete_keyframe", f67_arg0.clipFinished )
                              end
                              
                              f67_arg0.Glow0:beginAnimation( 100 )
                              f67_arg0.Glow0:setAlpha( 0.3 )
                              f67_arg0.Glow0:registerEventHandler( "interrupted_keyframe", f67_arg0.clipInterrupted )
                              f67_arg0.Glow0:registerEventHandler( "transition_complete_keyframe", f72_local0 )
                        end
                        
                        f67_arg0.Glow0:completeAnimation()
                        f67_arg0.Glow0:setAlpha( 0 )
                        f67_local2( f67_arg0.Glow0 )
                        f67_arg0.nextClip = "DefaultClip"
                  end
            }
      }

      CoD.ZM_ReviveWidget.__onClose = function ( f74_arg0 )
            f74_arg0.RingTopBleedOut:close()
            f74_arg0.RingTopRevive:close()
            f74_arg0.ZMReviveBleedoutRedEyeGlow:close()
            f74_arg0.ZMReviveBleedoutRedEyeGlow0:close()
            f74_arg0.Glow0:close()
      end
       
end

local function LoadShitAgain()
      Engine[ @"PrintInfo" ](0, "^2Override Functions Called -> " .. tostring(LUI.createMenu["T7Hud_" .. Engine[@"getcurrentmap"]()] ~= nil))

      function ShouldOpenMessageDialog(f33_arg0, f33_arg1) -- fuck off error box
            RushPrintInfo("Called", "Should Open Message Dialog")

            if not Orignal_ShouldOpenMessageDialog(f33_arg0, f33_arg1) then
                  RushPrintInfo("Returned....", "Should Open Message Dialog")
                  return false
            end

            local CurrentError = GetErrorText(f33_arg1)

            if CurrentError == OldErrorText then -- check if already did the error (treyarche's fault here)
                  return false
            else
                  OldErrorText = CurrentError
            end
            
            if string.find( CurrentError, "get scammed" ) or string.find( CurrentError, "REAL ERROR!!!" ) then -- check if fake error lol
                  return true
            end
            
            -- here is fixing printing issues (kilo crash)
            if string.find( CurrentError, "script error" ) then -- client and server
                  CurrentError = string.sub(CurrentError, 2, 80) -- cut the stupid symbol that causes print errors
                  CurrentType = "Script Error"
                  RushPrintInfo("a Script Error Occurred! -> ^3" .. CurrentError)
            elseif string.find( CurrentError, "UI Error") then -- LUI only
                  CurrentError = string.sub(CurrentError, 1, 80) -- no symbol?
                  CurrentType = "UI Error"
                  RushPrintInfo("a LUI Error Occurred! -> ^3" .. CurrentError)
            end

            CurrentError = string.gsub(CurrentError, "\n", " ") -- kilo crash if \n
            CurrentError = CurrentError .. "... (see logs)"

            Dvar[@"rush_error_code"]:set(CurrentError) -- -> to gsc side
            Dvar[@"rush_error_code_type"]:set(CurrentType)
            return false
      end

      -- Create Overlay Detector
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
                              RushPrintInfo("Called", "Open OverlayUtility, Popup")
                        elseif f375_local3.openMethod == CoD.OverlayUtility.OpenMethods.Overlay then
                              f375_local0 = OpenOverlay( f375_arg1, f375_local4, f375_arg0 )
                              RushPrintInfo("Called", "Open OverlayUtility, Overlay")
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

      -- Location..
      CoD.zm_location = InheritFrom( CoD.Menu ) 
      LUI.createMenu.zm_location = function ( f1_arg0, f1_arg1 )
            local self = CoD.Menu.NewForUIEditor( "zm_location", f1_arg0 ) 
            local f1_local1 = self 
            self:setClass( CoD.zm_location ) 
            self.soundSet = "none" 
            self:setOwner( f1_arg0 ) 
            self:setLeftRight( 0, 1, 0, 0 ) 
            self:setTopBottom( 0, 1, 0, 0 ) 
            self:playSound( "menu_open", f1_arg0 ) 
            self.ignoreCursor = true 
            f1_local1:addElementToPendingUpdateStateList( self ) 
            
            local bgbGlowOrangeOver = LUI.UIImage.new( 0.5, 0.5, -923, -764, 0.5, 0.5, -629.5, -356.5 ) 
            bgbGlowOrangeOver:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b ) 
            bgbGlowOrangeOver:setAlpha( 0 ) 
            bgbGlowOrangeOver:setZRot( 90 ) 
            bgbGlowOrangeOver:setImage( RegisterImage( @"uie_t7_core_hud_mapwidget_panelglow" ) ) 
            bgbGlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( @"ui_add" ) ) 
            self:addElement( bgbGlowOrangeOver ) 
            self.bgbGlowOrangeOver = bgbGlowOrangeOver 
            
            local Location = LUI.UIText.new( 0, 0, 37, 237, 0.015, 0.015, 37, 69 ) 
            Location:setAlpha( 0.55 ) 
            Location:setTTF("ttmussels_regular") 
            Location:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_171E049B161CD00A" ) ) 
            Location:setAlignment( Enum[@"luialignment"][@"lui_alignment_left"] ) 
            Location:linkToElementModel( self, "location_name", true, function ( model )
                  local f2_local0 = model:get() 
                  if f2_local0 ~= nil then
                        Location:setText("^2-> " ..  "^" .. math.random(1, 9) .. Engine[@"hash_4F9F1239CFD921FE"](f2_local0)) 
                  else
                        Location:setText("^2-> " ..  "^" .. math.random(1, 9) .. "Unknown Location") 
                  end
            end ) 
            self:addElement( Location ) 
            self.Location = Location 
            
            local bgbAbilitySwirl = LUI.UIImage.new( 0.5, 0.5, -904, -796, 0, 0, -5, 101 ) 
            bgbAbilitySwirl:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b ) 
            bgbAbilitySwirl:setAlpha( 0 ) 
            bgbAbilitySwirl:setZRot( 330 ) 
            bgbAbilitySwirl:setScale( 1.65, 1.65 ) 
            bgbAbilitySwirl:setImage( RegisterImage( @"uie_t7_core_hud_ammowidget_abilityswirl" ) ) 
            bgbAbilitySwirl:setMaterial( LUI.UIImage.GetCachedMaterial( @"ui_add" ) ) 
            self:addElement( bgbAbilitySwirl ) 
            self.bgbAbilitySwirl = bgbAbilitySwirl 
            
            self:mergeStateConditions( {
                  {
                        stateName = "hiddenTutorial",
                        condition = function ( menu, element, event )
                              return CoD.HUDUtility.IsAnyGameType( f1_arg0, "ztutorial" ) and CoD.ModelUtility.IsGlobalModelValueEqualTo( "hudItems.ztut.showLocation", 0 )
                        end
                  },
                  {
                        stateName = "Trials_HUDDeactivated",
                        condition = function ( menu, element, event )
                              local f4_local0 = CoD.HUDUtility.IsAnyGameType( f1_arg0, "ztrials" ) 
                              if f4_local0 then
                                    f4_local0 = CoD.ModelUtility.IsGlobalModelValueEqualTo( "ZMHudGlobal.trials.hudDeactivated", 1 ) 
                                    if f4_local0 then
                                          f4_local0 = not CoD.ModelUtility.IsGlobalModelValueTrue( "ZMHudGlobal.trials.infoHidden" ) 
                                    end
                              end
                              return f4_local0
                        end
                  },
                  {
                        stateName = "ShowWithScoreboard",
                        condition = function ( menu, element, event )
                              local f5_local0 
                              if not CoD.HUDUtility.IsAnyGameType( f1_arg0, "zclassic" ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_demo_all_game_hud_hidden"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_demo_camera_mode_moviecam"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_emp_active"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_final_killcam"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_game_ended"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_hud_hardcore"] ) and Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_hud_visible"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_in_guided_missile"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_in_killcam"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_in_remote_killstreak_static"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"hash_29BF57CE75A8755E"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_in_vehicle"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_is_flash_banged"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_is_scoped"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_play_of_the_match"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_round_end_killcam"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_ui_active"] ) then
                                    f5_local0 = Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_weapon_hud_visible"] ) 
                              else
                                    f5_local0 = false 
                              end
                              return f5_local0
                        end
                  },
                  {
                        stateName = "Show",
                        condition = function ( menu, element, event )
                              local f6_local0 
                              if not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_demo_all_game_hud_hidden"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_demo_camera_mode_moviecam"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_emp_active"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_final_killcam"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_game_ended"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_hud_hardcore"] ) and Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_hud_visible"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_in_guided_missile"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_in_killcam"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_in_remote_killstreak_static"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"hash_29BF57CE75A8755E"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_in_vehicle"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_is_flash_banged"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_is_scoped"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_play_of_the_match"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_round_end_killcam"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_scoreboard_open"] ) and not Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_ui_active"] ) then
                                    f6_local0 = Engine[@"isvisibilitybitset"]( f1_arg0, Enum[@"uivisibilitybit"][@"bit_weapon_hud_visible"] ) 
                              else
                                    f6_local0 = false 
                              end
                              return f6_local0
                        end
                  }
            } ) 
            local f1_local5 = self 
            local f1_local6 = self.subscribeToModel 
            local f1_local7 = Engine[@"getglobalmodel"]() 
            f1_local6( f1_local5, f1_local7["hudItems.ztut.showLocation"], function ( f7_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f7_arg0:get(),
                        modelName = "hudItems.ztut.showLocation"
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getglobalmodel"]() 
            f1_local6( f1_local5, f1_local7["ZMHudGlobal.trials.hudDeactivated"], function ( f8_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f8_arg0:get(),
                        modelName = "ZMHudGlobal.trials.hudDeactivated"
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getglobalmodel"]() 
            f1_local6( f1_local5, f1_local7["ZMHudGlobal.trials.infoHidden"], function ( f9_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f9_arg0:get(),
                        modelName = "ZMHudGlobal.trials.infoHidden"
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg0 ) 
            f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_demo_all_game_hud_hidden"]], function ( f10_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f10_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_demo_all_game_hud_hidden"]
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg0 ) 
            f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_demo_camera_mode_moviecam"]], function ( f11_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f11_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_demo_camera_mode_moviecam"]
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg0 ) 
            f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_emp_active"]], function ( f12_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f12_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_emp_active"]
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg0 ) 
            f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_final_killcam"]], function ( f13_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f13_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_final_killcam"]
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg0 ) 
            f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_game_ended"]], function ( f14_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f14_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_game_ended"]
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg0 ) 
            f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_hud_hardcore"]], function ( f15_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f15_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_hud_hardcore"]
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg0 ) 
            f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_hud_visible"]], function ( f16_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f16_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_hud_visible"]
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg0 ) 
            f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_guided_missile"]], function ( f17_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f17_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_guided_missile"]
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg0 ) 
            f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_killcam"]], function ( f18_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f18_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_killcam"]
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg0 ) 
            f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_remote_killstreak_static"]], function ( f19_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f19_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_remote_killstreak_static"]
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg0 ) 
            f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"hash_29BF57CE75A8755E"]], function ( f20_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f20_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"hash_29BF57CE75A8755E"]
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg0 ) 
            f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_vehicle"]], function ( f21_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f21_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_vehicle"]
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg0 ) 
            f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_is_flash_banged"]], function ( f22_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f22_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_is_flash_banged"]
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg0 ) 
            f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_is_scoped"]], function ( f23_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f23_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_is_scoped"]
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg0 ) 
            f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_play_of_the_match"]], function ( f24_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f24_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_play_of_the_match"]
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg0 ) 
            f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_round_end_killcam"]], function ( f25_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f25_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_round_end_killcam"]
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg0 ) 
            f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_ui_active"]], function ( f26_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f26_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_ui_active"]
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg0 ) 
            f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_weapon_hud_visible"]], function ( f27_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f27_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_weapon_hud_visible"]
                  } ) 
            end, false ) 
            f1_local5 = self 
            f1_local6 = self.subscribeToModel 
            f1_local7 = Engine[@"getmodelforcontroller"]( f1_arg0 ) 
            f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_scoreboard_open"]], function ( f28_arg0 )
                  f1_local1:updateElementState( self, {
                        name = "model_validation",
                        menu = f1_local1,
                        controller = f1_arg0,
                        modelValue = f28_arg0:get(),
                        modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_scoreboard_open"]
                  } ) 
            end, false ) 
            self:processEvent( {
                  name = "menu_loaded",
                  controller = f1_arg0
            } ) 
            LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose ) 
            if PreLoadFunc then
                  PreLoadFunc( self, f1_arg0 ) 
            end
            f1_local6 = self 
            if not IsPC() then
                  SizeToSafeArea( f1_local6, f1_arg0 ) 
            elseif IsPC() then
                  SizeToHudArea( f1_local6, f1_arg0 ) 
            end
            return self
      end
      
      CoD.zm_location.__resetProperties = function ( f29_arg0 )
            f29_arg0.Location:completeAnimation() 
            f29_arg0.bgbAbilitySwirl:completeAnimation() 
            f29_arg0.bgbGlowOrangeOver:completeAnimation() 
            f29_arg0.Location:setAlpha( 0.55 ) 
            f29_arg0.bgbAbilitySwirl:setAlpha( 0 ) 
            f29_arg0.bgbAbilitySwirl:setZRot( 330 ) 
            f29_arg0.bgbGlowOrangeOver:setAlpha( 0 ) 
      end
      
      CoD.zm_location.__clipsPerState = {
            DefaultState = {
                  DefaultClip = function ( f30_arg0, f30_arg1 )
                        f30_arg0:__resetProperties() 
                        f30_arg0:setupElementClipCounter( 1 ) 
                        f30_arg0.Location:completeAnimation() 
                        f30_arg0.Location:setAlpha( 0 ) 
                        f30_arg0.clipFinished( f30_arg0.Location ) 
                  end,
                  Trials_HUDDeactivated = function ( f31_arg0, f31_arg1 )
                        f31_arg0:__resetProperties() 
                        f31_arg0:setupElementClipCounter( 1 ) 
                        local f31_local0 = function ( f32_arg0 )
                              f31_arg0.Location:beginAnimation( 3000 ) 
                              f31_arg0.Location:setAlpha( 0 ) 
                              f31_arg0.Location:registerEventHandler( "interrupted_keyframe", f31_arg0.clipInterrupted ) 
                              f31_arg0.Location:registerEventHandler( "transition_complete_keyframe", f31_arg0.clipFinished ) 
                        end
                        
                        f31_arg0.Location:completeAnimation() 
                        f31_arg0.Location:setAlpha( 0.55 ) 
                        f31_local0( f31_arg0.Location ) 
                  end
            },
            hiddenTutorial = {
                  DefaultClip = function ( f33_arg0, f33_arg1 )
                        f33_arg0:__resetProperties() 
                        f33_arg0:setupElementClipCounter( 1 ) 
                        f33_arg0.Location:completeAnimation() 
                        f33_arg0.Location:setAlpha( 0 ) 
                        f33_arg0.clipFinished( f33_arg0.Location ) 
                  end,
                  DefaultState = function ( f34_arg0, f34_arg1 )
                        f34_arg0:__resetProperties() 
                        f34_arg0:setupElementClipCounter( 3 ) 
                        local f34_local0 = function ( f35_arg0 )
                              local f35_local0 = function ( f36_arg0 )
                                    local f36_local0 = function ( f37_arg0 )
                                          local f37_local0 = function ( f38_arg0 )
                                                local f38_local0 = function ( f39_arg0 )
                                                      local f39_local0 = function ( f40_arg0 )
                                                            local f40_local0 = function ( f41_arg0 )
                                                                  f41_arg0:beginAnimation( 230 ) 
                                                                  f41_arg0:setAlpha( 0 ) 
                                                                  f41_arg0:registerEventHandler( "transition_complete_keyframe", f34_arg0.clipFinished ) 
                                                            end
                                                            
                                                            f40_arg0:beginAnimation( 110 ) 
                                                            f40_arg0:setAlpha( 0.7 ) 
                                                            f40_arg0:registerEventHandler( "transition_complete_keyframe", f40_local0 ) 
                                                      end
                                                      
                                                      f39_arg0:beginAnimation( 199 ) 
                                                      f39_arg0:setAlpha( 0 ) 
                                                      f39_arg0:registerEventHandler( "transition_complete_keyframe", f39_local0 ) 
                                                end
                                                
                                                f38_arg0:beginAnimation( 130 ) 
                                                f38_arg0:setAlpha( 0.7 ) 
                                                f38_arg0:registerEventHandler( "transition_complete_keyframe", f38_local0 ) 
                                          end
                                          
                                          f37_arg0:beginAnimation( 140 ) 
                                          f37_arg0:setAlpha( 0 ) 
                                          f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 ) 
                                    end
                                    
                                    f36_arg0:beginAnimation( 189 ) 
                                    f36_arg0:setAlpha( 0.7 ) 
                                    f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 ) 
                              end
                              
                              f34_arg0.bgbGlowOrangeOver:beginAnimation( 330 ) 
                              f34_arg0.bgbGlowOrangeOver:registerEventHandler( "interrupted_keyframe", f34_arg0.clipInterrupted ) 
                              f34_arg0.bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", f35_local0 ) 
                        end
                        
                        f34_arg0.bgbGlowOrangeOver:completeAnimation() 
                        f34_arg0.bgbGlowOrangeOver:setAlpha( 0 ) 
                        f34_local0( f34_arg0.bgbGlowOrangeOver ) 
                        local f34_local1 = function ( f42_arg0 )
                              local f42_local0 = function ( f43_arg0 )
                                    local f43_local0 = function ( f44_arg0 )
                                          f44_arg0:beginAnimation( 340 ) 
                                          f44_arg0:setAlpha( 0.55 ) 
                                          f44_arg0:registerEventHandler( "transition_complete_keyframe", f34_arg0.clipFinished ) 
                                    end
                                    
                                    f43_arg0:beginAnimation( 329 ) 
                                    f43_arg0:setAlpha( 0 ) 
                                    f43_arg0:registerEventHandler( "transition_complete_keyframe", f43_local0 ) 
                              end
                              
                              f42_arg0:beginAnimation( 330 ) 
                              f42_arg0:setAlpha( 1 ) 
                              f42_arg0:registerEventHandler( "transition_complete_keyframe", f42_local0 ) 
                        end
                        
                        f34_arg0.Location:beginAnimation( 330 ) 
                        f34_arg0.Location:setAlpha( 0 ) 
                        f34_arg0.Location:registerEventHandler( "interrupted_keyframe", f34_arg0.clipInterrupted ) 
                        f34_arg0.Location:registerEventHandler( "transition_complete_keyframe", f34_local1 ) 
                        local f34_local2 = function ( f45_arg0 )
                              local f45_local0 = function ( f46_arg0 )
                                    f46_arg0:beginAnimation( 199 ) 
                                    f46_arg0:setAlpha( 0 ) 
                                    f46_arg0:setZRot( 360 ) 
                                    f46_arg0:registerEventHandler( "transition_complete_keyframe", f34_arg0.clipFinished ) 
                              end
                              
                              f34_arg0.bgbAbilitySwirl:beginAnimation( 330 ) 
                              f34_arg0.bgbAbilitySwirl:setAlpha( 1 ) 
                              f34_arg0.bgbAbilitySwirl:setZRot( 240 ) 
                              f34_arg0.bgbAbilitySwirl:registerEventHandler( "interrupted_keyframe", f34_arg0.clipInterrupted ) 
                              f34_arg0.bgbAbilitySwirl:registerEventHandler( "transition_complete_keyframe", f45_local0 ) 
                        end
                        
                        f34_arg0.bgbAbilitySwirl:completeAnimation() 
                        f34_arg0.bgbAbilitySwirl:setAlpha( 0 ) 
                        f34_arg0.bgbAbilitySwirl:setZRot( 0 ) 
                        f34_local2( f34_arg0.bgbAbilitySwirl ) 
                  end
            },
            Trials_HUDDeactivated = {
                  DefaultClip = function ( f47_arg0, f47_arg1 )
                        f47_arg0:__resetProperties() 
                        f47_arg0:setupElementClipCounter( 1 ) 
                        f47_arg0.Location:completeAnimation() 
                        f47_arg0.Location:setAlpha( 0 ) 
                        f47_arg0.clipFinished( f47_arg0.Location ) 
                  end,
                  ShowWithScoreboard = function ( f48_arg0, f48_arg1 )
                        f48_arg0:__resetProperties() 
                        f48_arg0:setupElementClipCounter( 1 ) 
                        local f48_local0 = function ( f49_arg0 )
                              f48_arg0.Location:beginAnimation( 1000 ) 
                              f48_arg0.Location:setAlpha( 0.55 ) 
                              f48_arg0.Location:registerEventHandler( "interrupted_keyframe", f48_arg0.clipInterrupted ) 
                              f48_arg0.Location:registerEventHandler( "transition_complete_keyframe", f48_arg0.clipFinished ) 
                        end
                        
                        f48_arg0.Location:completeAnimation() 
                        f48_arg0.Location:setAlpha( 0 ) 
                        f48_local0( f48_arg0.Location ) 
                  end
            },
            ShowWithScoreboard = {
                  DefaultClip = function ( f50_arg0, f50_arg1 )
                        f50_arg0:__resetProperties() 
                        f50_arg0:setupElementClipCounter( 0 ) 
                  end,
                  Trials_HUDDeactivated = function ( f51_arg0, f51_arg1 )
                        f51_arg0:__resetProperties() 
                        f51_arg0:setupElementClipCounter( 1 ) 
                        local f51_local0 = function ( f52_arg0 )
                              f51_arg0.Location:beginAnimation( 3000 ) 
                              f51_arg0.Location:setAlpha( 0 ) 
                              f51_arg0.Location:registerEventHandler( "interrupted_keyframe", f51_arg0.clipInterrupted ) 
                              f51_arg0.Location:registerEventHandler( "transition_complete_keyframe", f51_arg0.clipFinished ) 
                        end
                        
                        f51_arg0.Location:completeAnimation() 
                        f51_arg0.Location:setAlpha( 0.55 ) 
                        f51_local0( f51_arg0.Location ) 
                  end
            },
            Show = {
                  DefaultClip = function ( f53_arg0, f53_arg1 )
                        f53_arg0:__resetProperties() 
                        f53_arg0:setupElementClipCounter( 0 ) 
                  end,
                  Trials_HUDDeactivated = function ( f54_arg0, f54_arg1 )
                        f54_arg0:__resetProperties() 
                        f54_arg0:setupElementClipCounter( 1 ) 
                        local f54_local0 = function ( f55_arg0 )
                              f54_arg0.Location:beginAnimation( 3000 ) 
                              f54_arg0.Location:setAlpha( 0 ) 
                              f54_arg0.Location:registerEventHandler( "interrupted_keyframe", f54_arg0.clipInterrupted ) 
                              f54_arg0.Location:registerEventHandler( "transition_complete_keyframe", f54_arg0.clipFinished ) 
                        end
                        
                        f54_arg0.Location:completeAnimation() 
                        f54_arg0.Location:setAlpha( 0.55 ) 
                        f54_local0( f54_arg0.Location ) 
                  end
            }
      } 

      CoD.zm_location.__onClose = function ( f56_arg0 )
            f56_arg0.Location:close() 
      end

      -- Gameover
      CoD.zm_game_over = InheritFrom( CoD.Menu ) 
      CoD.zm_game_over.__stateMap = {
            "DefaultState",
            "GatewayOpened" -- BOTD
      } 

      LUI.createMenu.zm_game_over = function ( f1_arg0, f1_arg1 )
            local self = CoD.Menu.NewForUIEditor( "zm_game_over", f1_arg0 ) 
            local f1_local1 = self 
            self:setClass( CoD.zm_game_over ) 
            self.soundSet = "none" 
            self:setOwner( f1_arg0 ) 
            self:setLeftRight( 0, 1, 0, 0 ) 
            self:setTopBottom( 0, 1, 0, 0 ) 
            self:playSound( "menu_open", f1_arg0 ) 
            self.anyChildUsesUpdateState = true 
            f1_local1:addElementToPendingUpdateStateList( self ) 
            
            local SceneBlur = LUI.UIImage.new( 0, 1, -4, 4, 0, 1, -4, 4 ) 
            SceneBlur:setRGB( 0, 0, 0 ) 
            SceneBlur:setAlpha( 0 ) 
            SceneBlur:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_381EEB1F96D4BE0A" ) ) 
            SceneBlur:setShaderVector( 0, 0, 0, 0, 0 ) 
            self:addElement( SceneBlur ) 
            self.SceneBlur = SceneBlur 
            
            local BackgroundOverlay = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 ) 
            BackgroundOverlay:setRGB( 0, 0, 0 ) 
            BackgroundOverlay:setAlpha( 0.7 ) 
            self:addElement( BackgroundOverlay ) 
            self.BackgroundOverlay = BackgroundOverlay 
            
            local CroppedZmBacking2 = LUI.UIImage.new( 0, 1, -9, 9, 0, 1, -18, 18 ) 
            CroppedZmBacking2:setAlpha( 0.5 ) 
            CroppedZmBacking2:setImage( RegisterImage( @"uie_ui_hud_zm_aar_reward_bg" ) ) 
            CroppedZmBacking2:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_1A02C44161370F6D" ) ) 
            CroppedZmBacking2:setShaderVector( 0, 0, 0, 0, 0 ) 
            CroppedZmBacking2:setShaderVector( 1, 1, 1, 0, 0 ) 
            CroppedZmBacking2:setShaderVector( 2, 0, 0, 0, 0 ) 
            self:addElement( CroppedZmBacking2 ) 
            self.CroppedZmBacking2 = CroppedZmBacking2 
            
            local NoiseTiledBacking = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 ) 
            NoiseTiledBacking:setAlpha( 0.4 ) 
            NoiseTiledBacking:setImage( RegisterImage( @"uie_ui_menu_specialist_hub_repeat_bg" ) ) 
            NoiseTiledBacking:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_16CBE95C250C6D15" ) ) 
            NoiseTiledBacking:setShaderVector( 0, 0, 0, 0, 0 ) 
            NoiseTiledBacking:setupNineSliceShader( 196, 88 ) 
            self:addElement( NoiseTiledBacking ) 
            self.NoiseTiledBacking = NoiseTiledBacking 
            
            local TitleSequence = CoD.zm_hud_gameover_titlesequence.new( f1_local1, f1_arg0, 0.5, 0.5, -400, 400, 0, 0, -80, 390 ) 
            TitleSequence:linkToElementModel( self, "rounds", true, function ( model )
                  local f2_local0 = model:get() 
                  if f2_local0 ~= nil then
                        TitleSequence.RoundsSurvived:setText( CoD.ZombieUtility.GetSurvivedRoundsText( f2_local0 ) ) 
                  end
            end ) 
            TitleSequence:setRGB(1, 0, 1)
            self:addElement( TitleSequence ) 
            self.TitleSequence = TitleSequence 

            self.TitleSequence.SmokeHorizontal:setRGB(0, 0, 1)
            self.TitleSequence.Title:setRGB(0.91, 0, 0.91)
            --self.TitleSequence.TitleShadow:setRGB(1, 0, 1)
            
            local RestartLevelPrompt = CoD.ZM_Restart_Level_Prompt.new( f1_local1, f1_arg0, 0.5, 0.5, -350, 350, 0.5, 0.5, 203, 338 ) 
            self:addElement( RestartLevelPrompt ) 
            self.RestartLevelPrompt = RestartLevelPrompt 

            self.RestartLevelPrompt:setRGB(1, 0, 1)
            
            local Scoreboard = CoD.Rush_Gameover_Scoreboard.new( f1_local1, f1_arg0, 0.5, 0.5, -500, 500, 0.5, 0.5, -219, 160 ) 
            self:addElement( Scoreboard ) 
            self.Scoreboard = Scoreboard 

            self.Scoreboard:setRGB(1, 0, 0)
            
            LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
                  if IsPC() and IsInTheaterMode() then
                        LockInput( self, f1_arg0, false ) 
                  end
            end ) 
            RestartLevelPrompt.id = "RestartLevelPrompt" 
            Scoreboard.id = "Scoreboard" 
            self:processEvent( {
                  name = "menu_loaded",
                  controller = f1_arg0
            } ) 
            self.__defaultFocus = RestartLevelPrompt 
            if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
                  self:restoreState( f1_arg0 ) 
            end
            LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose ) 
            if PostLoadFunc then
                  PostLoadFunc( self, f1_arg0 ) 
            end
            local f1_local9 = self 
            if IsPC() then
                  LockInput( self, f1_arg0, true ) 
            end
            return self
      end
      
      CoD.zm_game_over.__resetProperties = function ( f4_arg0 )
            f4_arg0.RestartLevelPrompt:completeAnimation() 
            f4_arg0.Scoreboard:completeAnimation() 
            f4_arg0.TitleSequence:completeAnimation() 
            f4_arg0.RestartLevelPrompt:setAlpha( 1 ) 
            f4_arg0.Scoreboard:setAlpha( 1 ) 
            f4_arg0.TitleSequence:setAlpha( 1 ) 
            f4_arg0.TitleSequence.TitleShadow:setText( Engine[@"hash_4F9F1239CFD921FE"]( @"zombie/game_over" ) ) 
            f4_arg0.TitleSequence.Title:setText( Engine[@"hash_4F9F1239CFD921FE"]( @"zombie/game_over" ) ) 
      end
      
      CoD.zm_game_over.__clipsPerState = {
            DefaultState = {
                  DefaultClip = function ( f5_arg0, f5_arg1 )
                        f5_arg0:__resetProperties() 
                        f5_arg0:setupElementClipCounter( 3 ) 
                        local f5_local0 = function ( f6_arg0 )
                              local f6_local0 = function ( f7_arg0 )
                                    f7_arg0:beginAnimation( 200 ) 
                                    f7_arg0:setAlpha( 1 ) 
                                    f7_arg0:registerEventHandler( "transition_complete_keyframe", f5_arg0.clipFinished ) 
                              end
                              
                              f5_arg0.TitleSequence:beginAnimation( 100 ) 
                              f5_arg0.TitleSequence:registerEventHandler( "interrupted_keyframe", f5_arg0.clipInterrupted ) 
                              f5_arg0.TitleSequence:registerEventHandler( "transition_complete_keyframe", f6_local0 ) 
                        end
                        
                        f5_arg0.TitleSequence:completeAnimation() 
                        f5_arg0.TitleSequence:setAlpha( 0 ) 
                        f5_local0( f5_arg0.TitleSequence ) 
                        local f5_local1 = function ( f8_arg0 )
                              local f8_local0 = function ( f9_arg0 )
                                    f9_arg0:beginAnimation( 190 ) 
                                    f9_arg0:setAlpha( 1 ) 
                                    f9_arg0:registerEventHandler( "transition_complete_keyframe", f5_arg0.clipFinished ) 
                              end
                              
                              f5_arg0.RestartLevelPrompt:beginAnimation( 530 ) 
                              f5_arg0.RestartLevelPrompt:registerEventHandler( "interrupted_keyframe", f5_arg0.clipInterrupted ) 
                              f5_arg0.RestartLevelPrompt:registerEventHandler( "transition_complete_keyframe", f8_local0 ) 
                        end
                        
                        f5_arg0.RestartLevelPrompt:completeAnimation() 
                        f5_arg0.RestartLevelPrompt:setAlpha( 0 ) 
                        f5_local1( f5_arg0.RestartLevelPrompt ) 
                        local f5_local2 = function ( f10_arg0 )
                              local f10_local0 = function ( f11_arg0 )
                                    f11_arg0:beginAnimation( 229 ) 
                                    f11_arg0:setAlpha( 1 ) 
                                    f11_arg0:registerEventHandler( "transition_complete_keyframe", f5_arg0.clipFinished ) 
                              end
                              
                              f5_arg0.Scoreboard:beginAnimation( 300 ) 
                              f5_arg0.Scoreboard:registerEventHandler( "interrupted_keyframe", f5_arg0.clipInterrupted ) 
                              f5_arg0.Scoreboard:registerEventHandler( "transition_complete_keyframe", f10_local0 ) 
                        end
                        
                        f5_arg0.Scoreboard:completeAnimation() 
                        f5_arg0.Scoreboard:setAlpha( 0 ) 
                        f5_local2( f5_arg0.Scoreboard ) 
                  end
            },
            GatewayOpened = {
                  DefaultClip = function ( f12_arg0, f12_arg1 )
                        f12_arg0:__resetProperties() 
                        f12_arg0:setupElementClipCounter( 1 ) 
                        f12_arg0.TitleSequence:completeAnimation() 
                        f12_arg0.TitleSequence.TitleShadow:completeAnimation() 
                        f12_arg0.TitleSequence.Title:completeAnimation() 
                        f12_arg0.TitleSequence.TitleShadow:setText( Engine[@"hash_4F9F1239CFD921FE"]( @"hash_386BC28CC483BDEE" ) ) 
                        f12_arg0.TitleSequence.Title:setText( Engine[@"hash_4F9F1239CFD921FE"]( @"hash_386BC28CC483BDEE" ) ) 
                        f12_arg0.clipFinished( f12_arg0.TitleSequence ) 
                  end
            }
      } 

      CoD.zm_game_over.__onClose = function ( f13_arg0 )
            f13_arg0.TitleSequence:close() 
            f13_arg0.RestartLevelPrompt:close() 
            f13_arg0.Scoreboard:close() 
      end

end

--[[
      -- enh mod uses this instead
      CoD.DemoUtility.AddHUDWidgets = function(HudRef, InstanceRef)
            --HudRef:setRGB(1, 0, 0)
            Engine[ @"PrintInfo" ](0, "^1Demo HUD Loaded....")

            LoadShitAgain() -- lua file gets loaded too early.., this will fix it
      end
]]

-- change loading screen
CoD.PC_Notif_Container = InheritFrom( LUI.UIElement )
CoD.PC_Notif_Container.__defaultWidth = 450
CoD.PC_Notif_Container.__defaultHeight = 100
CoD.PC_Notif_Container.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.PCUtility.StartAddingSticky( f1_arg0, self )
	CoD.PCNotificationsUtility.PreSetupNotificationWidget( self, f1_arg0, f1_arg1 )
	self:setUseCylinderMapping( false )
	self:setClass( CoD.PC_Notif_Container )
	self.id = "PC_Notif_Container"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	local PCNotif = nil
	
	PCNotif = CoD.PC_Notif.new( f1_arg0, f1_arg1, 0.5, 0.5, -225, 225, 0, 0, 0, 100 )
	self:addElement( PCNotif )
	self.PCNotif = PCNotif
	
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not CoD.PCNotificationsUtility.IsNotificationWidgetVisible( f1_arg1 )
			end
		}
	} )
	local f1_local2 = self
	local f1_local3 = self.subscribeToModel
	local f1_local4 = Engine[@"hash_4DF5CFBC1771947"]( f1_arg1 )
	f1_local3( f1_local2, f1_local4["PC.CurrentNotification.visibility"], function ( f3_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f3_arg0:get(),
			modelName = "PC.CurrentNotification.visibility"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller, f4_arg2, f4_arg3, f4_arg4 )
		if IsSelfInState( self, "Invisible" ) and IsElementPropertyValue( self, "__wasOpen", true ) then
			PlayClip( self, "Out", controller )
			SetElementProperty( self, "__wasOpen", false )
			SetLoseFocusToSelf( self, controller )
		elseif IsInDefaultState( element ) then
			PlayClip( self, "In", controller )
			SetElementProperty( self, "__wasOpen", true )
		end
	end )
	if CoD.isPC then
		PCNotif.id = "PCNotif"
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	f1_local3 = self
	CoD.PCNotificationsUtility.PrepareNotificationContainer( self, f1_arg1, f1_arg0, self.PCNotif )
	DisableKeyboardNavigationByElement( self )
	CoD.PCUtility.StopAddingSticky( f1_arg0 )

      --RushPrintInfo("Called", "PC Notif Container")

      if f1_arg0.LoadingScreenSharedCPZM ~= nil then 
            RushPrintInfo("Called", "PC Notif Container - > Loading_ZM -> LoadingScreenSharedCPZM")

            CoD.HUDUtility.StartPlay(no, fuckyou)

            local Loading_ZM = f1_arg0
            local LoadingShared = Loading_ZM.LoadingScreenSharedCPZM

            --Loading_ZM:setRGB(1, 0, 1)

            LoadingShared.loadingBar:setShaderVector(1.000000, 0.01, 0, 0, 0)
            LoadingShared.loadingBar:setShaderVector(2.000000, 1, 0, 0, 0)
            LoadingShared.loadingBar:setShaderVector(3.000000, 0, 0, 0, 0)

            LoadingShared.loadingBarAdd:setShaderVector(1.000000, 0.01, 0, 0, 0) 
            LoadingShared.loadingBarAdd:setShaderVector(2.000000, 1, 0, 0, 0)
            LoadingShared.loadingBarAdd:setShaderVector(3.000000, 0, 0, 0, 0)

            local ImageMainMap = GetImageMap(Engine[@"getcurrentmap"]())

            LoadingShared.loadingImageOrMovie:setImage(RegisterImage(ImageMainMap))
            LoadingShared.loadingImageOrMovie:setRGB(0.8, 0.8, 1)

            LoadingShared.MapName:subscribeToGlobalModel( f1_arg1, "LoadingScreenTeamInfo", "mapName", function ( model )
                  local f6_local0 = model:get()
                  if f6_local0 ~= nil then
                        LoadingShared.MapName:setText("^6Rush Mod - " .. f6_local0 )
                  end
            end )

            LoadingShared.GameType:subscribeToGlobalModel( f1_arg1, "LoadingScreenTeamInfo", "gameType", function ( model )
                  local f8_local0 = model:get()
                  if f8_local0 ~= nil then
                        LoadingShared.GameType:setText("^3Shield Client")
                  end
            end )

            LoadingShared.loadingBarBG:setRGB(0, 0.11, 0.25)
            
            LoadingShared.loadingBar:setImage( RegisterImage( @"hash_76D2FBF31F53910C" ) )
	      LoadingShared.loadingBar:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_wipe_normal" ) )
            LoadingShared.loadingBar:setScale(0.985)

            LoadingShared.loadingBar:subscribeToGlobalModel( f1_arg1, "LoadingScreenTeamInfo", "loadedFraction", function ( model )
                  local f3_local0 = model:get()
                  if f3_local0 ~= nil then

                        -- reload it multiple times to make sure this fucking shit gets loaded (changed lua hooks for coop and solo)
                        LoadShitAgainInit()
                        LoadShitAgain()

                        LoadingShared.loadingBar:setRGB(1, 0, 1)
                        LoadingShared.loadingBar:setShaderVector( 0, CoD.GetVectorComponentFromString( f3_local0, 1 ), CoD.GetVectorComponentFromString( f3_local0, 2 ), CoD.GetVectorComponentFromString( f3_local0, 3 ), CoD.GetVectorComponentFromString( f3_local0, 4 ) )
                  end
            end )

            LoadingShared.loadingBarAdd:setImage( RegisterImage( @"hash_76D2FBF31F53910C" ) )
	      LoadingShared.loadingBarAdd:setMaterial( LUI.UIImage.GetCachedMaterial( @"uie_wipe_normal" ) )
            LoadingShared.loadingBarAdd:setScale(0.985)

            LoadingShared.loadingBarAdd:subscribeToGlobalModel( f1_arg1, "LoadingScreenTeamInfo", "loadedFraction", function ( model )
                  local f4_local0 = model:get()
                  if f4_local0 ~= nil then
                        LoadingShared.loadingBarAdd:setRGB(1, 1, 0)
                        LoadingShared.loadingBarAdd:setShaderVector( 0, CoD.GetVectorComponentFromString( f4_local0, 1 ), CoD.GetVectorComponentFromString( f4_local0, 2 ), CoD.GetVectorComponentFromString( f4_local0, 3 ), CoD.GetVectorComponentFromString( f4_local0, 4 ) )
                  end
            end )

            local LoadingText = LUI.UIText.new(0.415, 0.415, -50, 0, 0.83, 0.83, 0, 100)
            LoadingText:setText("^1Loading")
            LoadingText:setTTF("notosans_bold")
            LoadingText:setLetterSpacing(1)
            LoadingText:setLineSpacing(1)
            LoadingText:setBackingType(1)
            LoadingText:setBackingWidget(CoD.ObituaryBlurBacking, self, f1_arg1)
            LoadingText:setBackingColor(0, 0, 0)
            LoadingText:setBackingAlpha(0.15)
            LoadingText:setBackingXPadding(14)
            Loading_ZM:addElement(LoadingText)
            Loading_ZM.LoadingText = LoadingText

            local AnimationLoadingWidget0 = CoD.AnimationLoadingWidget.new(Loading_ZM, self, 0.415, 0.415, -282 + 280, -66 + 280, 0.665, 0.665, -270 + 300, -54 + 300)
            AnimationLoadingWidget0:setScale(0.45, 0.45)
            AnimationLoadingWidget0:setRGB(1, 0, 1)
            Loading_ZM:addElement(AnimationLoadingWidget0)
            Loading_ZM.AnimationLoadingWidget0 = AnimationLoadingWidget0

		--BO4Spinner:sendInitializationEvents(f4_arg1, f4_local1)
      end

	return self
end

CoD.PC_Notif_Container.__resetProperties = function ( f5_arg0 )
	f5_arg0.PCNotif:completeAnimation()
	f5_arg0.PCNotif:setLeftRight( 0.5, 0.5, -225, 225 )
	f5_arg0.PCNotif:setAlpha( 1 )
end

CoD.PC_Notif_Container.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 1 )
			f6_arg0.PCNotif:completeAnimation()
			f6_arg0.PCNotif:setAlpha( 1 )
			f6_arg0.clipFinished( f6_arg0.PCNotif )
		end,
		In = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 1 )
			local f7_local0 = function ( f8_arg0 )
				f7_arg0.PCNotif:beginAnimation( 250, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
				f7_arg0.PCNotif:setLeftRight( 0.5, 0.5, -225, 225 )
				f7_arg0.PCNotif:setAlpha( 1 )
				f7_arg0.PCNotif:registerEventHandler( "interrupted_keyframe", f7_arg0.clipInterrupted )
				f7_arg0.PCNotif:registerEventHandler( "transition_complete_keyframe", f7_arg0.clipFinished )
			end
			
			f7_arg0.PCNotif:completeAnimation()
			f7_arg0.PCNotif:setLeftRight( 0.5, 0.5, -175, 275 )
			f7_arg0.PCNotif:setAlpha( 0 )
			f7_local0( f7_arg0.PCNotif )
		end
	},
	Invisible = {
		DefaultClip = function ( f9_arg0, f9_arg1 )
			f9_arg0:__resetProperties()
			f9_arg0:setupElementClipCounter( 1 )
			f9_arg0.PCNotif:completeAnimation()
			f9_arg0.PCNotif:setAlpha( 0 )
			f9_arg0.clipFinished( f9_arg0.PCNotif )
		end,
		Out = function ( f10_arg0, f10_arg1 )
			f10_arg0:__resetProperties()
			f10_arg0:setupElementClipCounter( 1 )
			local f10_local0 = function ( f11_arg0 )
				f10_arg0.PCNotif:beginAnimation( 250, Enum[@"hash_1F50FFF429AB1890"][@"hash_15193EA7825DC097"] )
				f10_arg0.PCNotif:setLeftRight( 0.5, 0.5, -205, 245 )
				f10_arg0.PCNotif:setAlpha( 0 )
				f10_arg0.PCNotif:registerEventHandler( "interrupted_keyframe", f10_arg0.clipInterrupted )
				f10_arg0.PCNotif:registerEventHandler( "transition_complete_keyframe", f10_arg0.clipFinished )
			end
			
			f10_arg0.PCNotif:completeAnimation()
			f10_arg0.PCNotif:setLeftRight( 0.5, 0.5, -225, 225 )
			f10_arg0.PCNotif:setAlpha( 1 )
			f10_local0( f10_arg0.PCNotif )
		end
	}
}

CoD.PC_Notif_Container.__onClose = function ( f12_arg0 )
	f12_arg0.PCNotif:close()
end

-- Start Menu (main one)
CoD.StartMenu_Main = InheritFrom( CoD.Menu )
LUI.createMenu.StartMenu_Main = function ( f1_arg0, f1_arg1 )
      local self = CoD.Menu.NewForUIEditor( "StartMenu_Main", f1_arg0 )
      local f1_local1 = self
      CoD.StartMenuUtility.InitDataForStartMenu( self, f1_local1, f1_arg0 )
      CoD.BaseUtility.InitControllerModelIfNotSet( f1_arg0, "hudItems.hasStartedWZMatch", false )
      CoD.BaseUtility.InitControllerModelIfNotSet( f1_arg0, "PositionDraft.stage", 0 )
      self:setClass( CoD.StartMenu_Main )
      self.soundSet = "ChooseDecal"
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
      
      local Background = CoD.StartMenuOptionsBackground.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
      Background:setAlpha( 0 )
      self:addElement( Background )
      self.Background = Background
      
      local BGEnhancement = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
      BGEnhancement:setRGB( 0, 0, 0 )
      BGEnhancement:setAlpha( 0.2 )
      self:addElement( BGEnhancement )
      self.BGEnhancement = BGEnhancement
      
      local TopBacking = LUI.UIImage.new( 0, 1, 0, 0, 0, 0, 0.5, 86.5 )
      TopBacking:setRGB( 0, 0, 0 )
      TopBacking:setAlpha( 0 )
      self:addElement( TopBacking )
      self.TopBacking = TopBacking
      
      local NoiseTiledBacking = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
      NoiseTiledBacking:setAlpha( 0 )
      NoiseTiledBacking:setImage( RegisterImage( @"hash_634839E8065B1E53" ) )
      NoiseTiledBacking:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_16CBE95C250C6D15" ) )
      NoiseTiledBacking:setShaderVector( 0, 0, 0, 0, 0 )
      NoiseTiledBacking:setupNineSliceShader( 196, 88 )
      self:addElement( NoiseTiledBacking )
      self.NoiseTiledBacking = NoiseTiledBacking
      
      local TabFrame = LUI.UIFrame.new( f1_local1, f1_arg0, 0, 0, false )
      TabFrame:setLeftRight( 0.5, 0.5, -960, 960 )
      TabFrame:setTopBottom( 0.5, 0.5, -390, 390 )
      self:addElement( TabFrame )
      self.TabFrame = TabFrame
      
      local MenuFrameIngame = CoD.MenuFrameIngame.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
      self:addElement( MenuFrameIngame )
      self.MenuFrameIngame = MenuFrameIngame
      
      local TiledPlusGrid = LUI.UIImage.new( 0, 0, -135, 1920, 0, 0, 0, 1080 )
      TiledPlusGrid:setAlpha( 0.05 )
      TiledPlusGrid:setImage( RegisterImage( @"hash_16E37BAE22631294" ) )
      TiledPlusGrid:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_67C9C02F608D0A75" ) )
      TiledPlusGrid:setShaderVector( 0, 0, 0, 0, 0 )
      TiledPlusGrid:setupNineSliceShader( 220, 220 )
      self:addElement( TiledPlusGrid )
      self.TiledPlusGrid = TiledPlusGrid
      
      local Box = LUI.UIImage.new( 0, 1, 0, 0, 0, 0, -21, 43 )
      Box:setRGB( 0, 0, 0 )
      Box:setAlpha( 0 )
      self:addElement( Box )
      self.Box = Box
      
      local DividerSolidBot = LUI.UIImage.new( 0, 1.01, -11, -11, 0, 0, 41, 45 )
      DividerSolidBot:setRGB( ColorSet.T8__BEIGE__HEADER.r, ColorSet.T8__BEIGE__HEADER.g, ColorSet.T8__BEIGE__HEADER.b )
      DividerSolidBot:setAlpha( 0 )
      DividerSolidBot:setImage( RegisterImage( @"hash_484B43D5B04D263A" ) )
      DividerSolidBot:setMaterial( LUI.UIImage.GetCachedMaterial( @"hash_16CBE95C250C6D15" ) )
      DividerSolidBot:setShaderVector( 0, 0, 0, 0, 0 )
      DividerSolidBot:setupNineSliceShader( 8, 4 )
      self:addElement( DividerSolidBot )
      self.DividerSolidBot = DividerSolidBot
      
      local SafeAreaContainer = CoD.StartMenu_SafeAreaContainer.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
      SafeAreaContainer.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( @"hash_704DC58203AB2DE0" ) )
      self:addElement( SafeAreaContainer )
      self.SafeAreaContainer = SafeAreaContainer
      
      local DirectorQuitButtonContainer = nil
      
      DirectorQuitButtonContainer = CoD.DirectorQuitButtonContainer.new( f1_local1, f1_arg0, 0.5, 0.5, 768, 968, 0, 0, 11, 47 )
      DirectorQuitButtonContainer:setAlpha( 0 )
      DirectorQuitButtonContainer:registerEventHandler( "gain_focus", function ( element, event )
            local f2_local0 = nil
            if element.gainFocus then
                  f2_local0 = element:gainFocus( event )
            elseif element.super.gainFocus then
                  f2_local0 = element.super:gainFocus( event )
            end
            CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"] )
            return f2_local0
      end )
      f1_local1:AddButtonCallbackFunction( DirectorQuitButtonContainer, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"], "MOUSE1", function ( element, menu, controller, model )
            if IsPC() then
                  OpenPCQuit( self, menu, self, controller )
                  return true
            else
                  
            end
      end, function ( element, menu, controller )
            if IsPC() then
                  CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_3755DA1E2E7C263F"], @"hash_0", nil, "MOUSE1" )
                  return false
            else
                  return false
            end
      end, false )
      self:addElement( DirectorQuitButtonContainer )
      self.DirectorQuitButtonContainer = DirectorQuitButtonContainer
      
      local PCKoreaContentDescriptorsContainer = nil
      
      PCKoreaContentDescriptorsContainer = CoD.PC_Korea_ContentDescriptors_Container.new( f1_local1, f1_arg0, 0.5, 0.5, 737, 926, 0, 0, 110, 446 )
      PCKoreaContentDescriptorsContainer:mergeStateConditions( {
            {
                  stateName = "Is15PlusFrontend",
                  condition = function ( menu, element, event )
                        local f5_local0 = IsPC()
                        if f5_local0 then
                              f5_local0 = InFrontend()
                              if f5_local0 then
                                    f5_local0 = CoD.PCKoreaUtility.IsInKorea()
                                    if f5_local0 then
                                          f5_local0 = IsGameTypeCombatTraining()
                                    end
                              end
                        end
                        return f5_local0
                  end
            },
            {
                  stateName = "Is15Plus",
                  condition = function ( menu, element, event )
                        local f6_local0 = IsPC()
                        if f6_local0 then
                              f6_local0 = CoD.PCKoreaUtility.IsInKorea()
                              if f6_local0 then
                                    f6_local0 = IsGameTypeCombatTraining()
                              end
                        end
                        return f6_local0
                  end
            }
      } )
      self:addElement( PCKoreaContentDescriptorsContainer )
      self.PCKoreaContentDescriptorsContainer = PCKoreaContentDescriptorsContainer
      
      TabFrame:linkToElementModel( SafeAreaContainer.TabBar.Tabs.grid, "tabWidget", true, function ( model )
            local f7_local0 = model:get()
            if f7_local0 ~= nil then
                  TabFrame:changeFrameWidget( f7_local0 )
            end
      end )
      self:mergeStateConditions( {
            {
                  stateName = "IsFrontEnd",
                  condition = function ( menu, element, event )
                        return InFrontend()
                  end
            },
            {
                  stateName = "Zombies",
                  condition = function ( menu, element, event )
                        return IsZombies()
                  end
            },
            {
                  stateName = "Campaign",
                  condition = function ( menu, element, event )
                        return IsCampaign()
                  end
            },
            {
                  stateName = "WZ",
                  condition = function ( menu, element, event )
                        return IsInGame() and IsWarzone()
                  end
            },
            {
                  stateName = "Ingame",
                  condition = function ( menu, element, event )
                        return IsInGame()
                  end
            }
      } )
      local f1_local15 = self
      local f1_local16 = self.subscribeToModel
      local f1_local17 = Engine[@"hash_78DF2E5447F384B9"]()
      f1_local16( f1_local15, f1_local17["lobbyRoot.lobbyNav"], function ( f13_arg0 )
            f1_local1:updateElementState( self, {
                  name = "model_validation",
                  menu = f1_local1,
                  controller = f1_arg0,
                  modelValue = f13_arg0:get(),
                  modelName = "lobbyRoot.lobbyNav"
            } )
      end, false )
      f1_local15 = self
      f1_local16 = self.subscribeToModel
      f1_local17 = Engine[@"hash_78DF2E5447F384B9"]()
      f1_local16( f1_local15, f1_local17["lobbyRoot.lobbyNav"], function ( f14_arg0, f14_arg1 )
            CoD.Menu.UpdateButtonShownState( f14_arg1, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_1E6DB407A2AF8B09"] )
            CoD.Menu.UpdateButtonShownState( f14_arg1, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3865DD2DB1EFE9F8"] )
            CoD.Menu.UpdateButtonShownState( f14_arg1, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3D2F467A6C6DA1AC"] )
      end, false )
      f1_local15 = self
      f1_local16 = self.subscribeToModel
      f1_local17 = Engine[@"hash_78DF2E5447F384B9"]()
      f1_local16( f1_local15, f1_local17["lobbyRoot.lobbyMainMode"], function ( f15_arg0, f15_arg1 )
            CoD.Menu.UpdateButtonShownState( f15_arg1, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3D2F467A6C6DA1AC"] )
      end, false )
      self:appendEventHandler( "input_source_changed", function ( f16_arg0, f16_arg1 )
            f16_arg1.menu = f16_arg1.menu or f1_local1
            CoD.Menu.UpdateButtonShownState( f16_arg0, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_222361E23588705A"] )
      end )
      f1_local15 = self
      f1_local16 = self.subscribeToModel
      f1_local17 = Engine[@"hash_4DF5CFBC1771947"]( f1_arg0 )
      f1_local16( f1_local15, f1_local17.LastInput, function ( f17_arg0, f17_arg1 )
            CoD.Menu.UpdateButtonShownState( f17_arg1, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_222361E23588705A"] )
      end, false )
      f1_local15 = self
      f1_local16 = self.subscribeToModel
      f1_local17 = Engine[@"hash_4DF5CFBC1771947"]( f1_arg0 )
      f1_local16( f1_local15, f1_local17["PositionDraft.stage"], function ( f18_arg0, f18_arg1 )
            CoD.Menu.UpdateButtonShownState( f18_arg1, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3865DD2DB1EFE9F8"] )
      end, false )
      self:appendEventHandler( "on_session_start", function ( f19_arg0, f19_arg1 )
            f19_arg1.menu = f19_arg1.menu or f1_local1
            CoD.Menu.UpdateButtonShownState( f19_arg0, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3865DD2DB1EFE9F8"] )
      end )
      self:appendEventHandler( "on_session_end", function ( f20_arg0, f20_arg1 )
            f20_arg1.menu = f20_arg1.menu or f1_local1
            CoD.Menu.UpdateButtonShownState( f20_arg0, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3865DD2DB1EFE9F8"] )
      end )
      f1_local15 = self
      f1_local16 = self.subscribeToModel
      f1_local17 = Engine[@"hash_4DF5CFBC1771947"]( f1_arg0 )
      f1_local16( f1_local15, f1_local17["hudItems.hasStartedWZMatch"], function ( f21_arg0, f21_arg1 )
            CoD.Menu.UpdateButtonShownState( f21_arg1, f1_local1, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3865DD2DB1EFE9F8"] )
      end, false )
      self:registerEventHandler( "menu_loaded", function ( self, event )
            local f22_local0 = nil
            if self.menuLoaded then
                  f22_local0 = self:menuLoaded( event )
            elseif self.super.menuLoaded then
                  f22_local0 = self.super:menuLoaded( event )
            end
            PlaySoundSetSound( self, "menu_enter" )
            FileshareGetSlots( self, self, f1_arg0 )
            SetHeadingKickerTextToGameMode()
            if not f22_local0 then
                  f22_local0 = self:dispatchEventToChildren( event )
            end
            return f22_local0
      end )
      self:registerEventHandler( "close_all_ingame_menus", function ( self, event )
            local f23_local0 = nil
            StartMenuGoBack( f1_local1, f1_arg0 )
            if not f23_local0 then
                  f23_local0 = self:dispatchEventToChildren( event )
            end
            return f23_local0
      end )
      self:registerEventHandler( "open_migration_menu", function ( self, event )
            local f24_local0 = nil
            StartMenuGoBack( f1_local1, f1_arg0 )
            if not f24_local0 then
                  f24_local0 = self:dispatchEventToChildren( event )
            end
            return f24_local0
      end )
      self:registerEventHandler( "occlusion_change", function ( self, event )
            local f25_local0 = nil
            if self.OcclusionChange then
                  f25_local0 = self:OcclusionChange( event )
            elseif self.super.OcclusionChange then
                  f25_local0 = self.super:OcclusionChange( event )
            end
            if IsPC() and IsWarzone() and IsInGame() then
                  CoD.WZUtility.ClosePCSplitterWidget( self, f1_local1, f1_arg0 )
            end
            if not f25_local0 then
                  f25_local0 = self:dispatchEventToChildren( event )
            end
            return f25_local0
      end )
      f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], nil, function ( element, menu, controller, model )
            if InFrontend() then
                  CoD.BaseUtility.SwitchModeOnMenu( controller )
                  RefreshLobbyRoom( menu, controller )
                  CoD.StartMenuUtility.CleanUpBarracksTab( menu, controller )
                  StartMenuGoBack( menu, controller )
                  CoD.LobbyUtility.SetMenuControllerRestriction( self, controller, 0 )
                  return true
            elseif not IsPC() and not IsDemoPlaying() then
                  CoD.BaseUtility.SwitchModeOnMenu( controller )
                  RefreshLobbyRoom( menu, controller )
                  StartMenuGoBack( menu, controller )
                  return true
            elseif IsPC() and not IsDemoPlaying() then
                  CoD.BaseUtility.SwitchModeOnMenu( controller )
                  RefreshLobbyRoom( menu, controller )
                  StartMenuGoBack( menu, controller )
                  return true
            elseif IsPC() and IsDemoPlaying() then
                  CoD.DemoUtility.RunPauseCommandIfNotPlayerPause( controller )
                  RefreshLobbyRoom( menu, controller )
                  StartMenuGoBack( menu, controller )
                  return true
            elseif IsDemoPlaying() and not IsPC() then
                  RefreshLobbyRoom( menu, controller )
                  StartMenuGoBack( menu, controller )
                  return true
            else
                  
            end
      end, function ( element, menu, controller )
            if InFrontend() then
                  CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_370A9FDC87CD3D48", nil, nil )
                  return true
            elseif not IsPC() and not IsDemoPlaying() then
                  CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_23996BAAC73C3F6D", nil, nil )
                  return true
            elseif IsPC() and not IsDemoPlaying() then
                  CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_370A9FDC87CD3D48", nil, nil )
                  return true
            elseif IsPC() and IsDemoPlaying() then
                  CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_370A9FDC87CD3D48", nil, nil )
                  return true
            elseif IsDemoPlaying() and not IsPC() then
                  CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1805EFA15E9E7E5A"], @"hash_370A9FDC87CD3D48", nil, nil )
                  return true
            else
                  return false
            end
      end, false )
      f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_1E6DB407A2AF8B09"], nil, function ( element, menu, controller, model )
            if IsWarzone() and IsInGame() and not IsDemoPlaying() then
                  CoD.WZUtility.NextWeapon( controller )
                  return true
            elseif IsInGame() and not IsLobbyNetworkModeLAN() and not IsDemoPlaying() and not IsPC() and not IsGameTypeCombatTraining() then
                  OpenOverlay( self, "Social_Main", controller, nil )
                  return true
            else
                  
            end
      end, function ( element, menu, controller )
            if IsWarzone() and IsInGame() and not IsDemoPlaying() then
                  CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1E6DB407A2AF8B09"], @"hash_0", nil, nil )
                  return false
            elseif IsInGame() and not IsLobbyNetworkModeLAN() and not IsDemoPlaying() and not IsPC() and not IsGameTypeCombatTraining() then
                  CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_1E6DB407A2AF8B09"], @"hash_478E0BA47CFB4A8", nil, nil )
                  return true
            else
                  return false
            end
      end, false )
      f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3865DD2DB1EFE9F8"], "weapnext", function ( element, menu, controller, model )
            if IsWarzone() and IsInGame() and not IsDemoPlaying() then
                  CoD.WZUtility.NextWeapon( controller )
                  return true
            else
                  
            end
      end, function ( element, menu, controller )
            if IsWarzone() and IsInGame() and not IsDemoPlaying() then
                  CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_3865DD2DB1EFE9F8"], @"hash_0", nil, "weapnext" )
                  return false
            else
                  return false
            end
      end, false )
      f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3865DD2DB1EFE9F8"], "weapprev", function ( element, menu, controller, model )
            if IsWarzone() and IsInGame() and not IsDemoPlaying() then
                  CoD.WZUtility.PrevWeapon( controller )
                  return true
            else
                  
            end
      end, function ( element, menu, controller )
            if IsWarzone() and IsInGame() and not IsDemoPlaying() then
                  CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_3865DD2DB1EFE9F8"], @"hash_0", nil, "weapprev" )
                  return false
            else
                  return false
            end
      end, false )
      f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3865DD2DB1EFE9F8"], "weapswitchprimary", function ( element, menu, controller, model )
            if IsPC() and IsWarzone() and IsInGame() and not IsDemoPlaying() then
                  CoD.WZUtility.SwitchToWeaponInSlot( controller, 0 )
                  return true
            else
                  
            end
      end, function ( element, menu, controller )
            if IsPC() and IsWarzone() and IsInGame() and not IsDemoPlaying() then
                  CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_3865DD2DB1EFE9F8"], @"hash_0", nil, "weapswitchprimary" )
                  return false
            else
                  return false
            end
      end, false )
      f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3865DD2DB1EFE9F8"], "weapswitchsecondary", function ( element, menu, controller, model )
            if IsPC() and IsWarzone() and IsInGame() and not IsDemoPlaying() then
                  CoD.WZUtility.SwitchToWeaponInSlot( controller, 1 )
                  return true
            else
                  
            end
      end, function ( element, menu, controller )
            if IsPC() and IsWarzone() and IsInGame() and not IsDemoPlaying() then
                  CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_3865DD2DB1EFE9F8"], @"hash_0", nil, "weapswitchsecondary" )
                  return false
            else
                  return false
            end
      end, false )
      f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3D2F467A6C6DA1AC"], "F1", function ( element, menu, controller, model )
            if not IsRepeatButtonPress( model ) and CoD.DirectorUtility.IsMainMode( controller, Enum[@"hash_89C1455C5032969"][@"hash_37E41449995CD57E"] ) and not InFrontend() and AlwaysFalse() then
                  CoD.StartMenuUtility.ShowClassSelectSlideout( menu, controller )
                  return true
            else
                  
            end
      end, function ( element, menu, controller )
            if not IsRepeatButtonPress( nil ) and CoD.DirectorUtility.IsMainMode( controller, Enum[@"hash_89C1455C5032969"][@"hash_37E41449995CD57E"] ) and not InFrontend() and AlwaysFalse() then
                  CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_3D2F467A6C6DA1AC"], @"hash_0", nil, "F1" )
                  return false
            else
                  return false
            end
      end, false )
      f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_222361E23588705A"], nil, function ( element, menu, controller, model )
            if IsPC() and IsGamepad( controller ) then
                  RefreshLobbyRoom( menu, controller )
                  StartMenuGoBack( menu, controller )
                  return true
            else
                  RefreshLobbyRoom( menu, controller )
                  StartMenuGoBack( menu, controller )
                  return true
            end
      end, function ( element, menu, controller )
            CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_222361E23588705A"], @"hash_0", nil, nil )
            return false
      end, false )
      f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_4C083113BC81F23F"], nil, function ( element, menu, controller, model )
            if CoD.StartMenuUtility.CanChangeWZStatsFilter( menu, self.TabFrame, controller ) then
                  CoD.PlayerStatsUtility.UpdateWZStatsFilter( controller )
                  PlaySoundAlias( "uin_stats_switch" )
                  return true
            else
                  
            end
      end, function ( element, menu, controller )
            if CoD.StartMenuUtility.CanChangeWZStatsFilter( menu, self.TabFrame, controller ) then
                  CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_4C083113BC81F23F"], @"hash_0", nil, nil )
                  return false
            else
                  return false
            end
      end, false )
      f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3865DD2DB1EFE9F8"], "ui_contextual_2", function ( element, menu, controller, model )
            if IsPC() and CoD.PCUtility.CanShowLeaveGameButton( menu, controller ) then
                  QuitPCGame_MP( self, controller, false )
                  return true
            else
                  
            end
      end, function ( element, menu, controller )
            if IsPC() and CoD.PCUtility.CanShowLeaveGameButton( menu, controller ) then
                  CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_3865DD2DB1EFE9F8"], @"hash_0", nil, "ui_contextual_2" )
                  return false
            else
                  return false
            end
      end, false )
      f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum[@"hash_3DD78803F918E9D"][@"hash_3865DD2DB1EFE9F8"], "ui_contextual_1", function ( element, menu, controller, model )
            if IsPC() and CoD.PCUtility.CanShowStartWarzoneButton( menu, controller ) then
                  CoD.WZUtility.StartWarzone( controller )
                  SetControllerModelValue( controller, "hudItems.hasStartedWZMatch", true )
                  return true
            else
                  
            end
      end, function ( element, menu, controller )
            if IsPC() and CoD.PCUtility.CanShowStartWarzoneButton( menu, controller ) then
                  CoD.Menu.SetButtonLabel( menu, Enum[@"hash_3DD78803F918E9D"][@"hash_3865DD2DB1EFE9F8"], @"hash_0", nil, "ui_contextual_1" )
                  return false
            else
                  return false
            end
      end, false )
      LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
            ClearMenuSavedState( f1_local1 )
      end )
      self:subscribeToGlobalModel( f1_arg0, "PerController", "factions.isCoDCaster", function ( model )
            local f49_local0 = self
            UpdateStartMenuTabsDatasource( f1_local1 )
      end )
      TabFrame.id = "TabFrame"
      MenuFrameIngame:setModel( self.buttonModel, f1_arg0 )
      if CoD.isPC then
            MenuFrameIngame.id = "MenuFrameIngame"
      end
      SafeAreaContainer.id = "SafeAreaContainer"
      if CoD.isPC then
            DirectorQuitButtonContainer.id = "DirectorQuitButtonContainer"
      end
      self:processEvent( {
            name = "menu_loaded",
            controller = f1_arg0
      } )
      self.__defaultFocus = TabFrame
      if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
            self:restoreState( f1_arg0 )
      end
      LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
      if PostLoadFunc then
            PostLoadFunc( self, f1_arg0 )
      end
      f1_local16 = self
      if IsInGame() and IsMultiplayer() then
            CoD.StartMenuUtility.AddClassSelectSlideout( f1_local1, f1_arg0 )
      end
      SizeToSafeArea( TabFrame, f1_arg0 )
      f1_local16 = SafeAreaContainer
      if not IsPC() then
            SizeToSafeArea( f1_local16, f1_arg0 )
      end

      RushPrintInfo("Called", "Pause Menu Main")
      self:setRGB(1, 0, 1)

      return self
end

CoD.StartMenu_Main.__resetProperties = function ( f50_arg0 )
      f50_arg0.TabFrame:completeAnimation()
      f50_arg0.Background:completeAnimation()
      f50_arg0.BGEnhancement:completeAnimation()
      f50_arg0.TiledPlusGrid:completeAnimation()
      f50_arg0.NoiseTiledBacking:completeAnimation()
      f50_arg0.DirectorQuitButtonContainer:completeAnimation()
      f50_arg0.DividerSolidBot:completeAnimation()
      f50_arg0.Box:completeAnimation()
      f50_arg0.SafeAreaContainer:completeAnimation()
      f50_arg0.TopBacking:completeAnimation()
      f50_arg0.TabFrame:setAlpha( 1 )
      f50_arg0.Background:setAlpha( 0 )
      f50_arg0.BGEnhancement:setRGB( 0, 0, 0 )
      f50_arg0.BGEnhancement:setAlpha( 0.2 )
      f50_arg0.TiledPlusGrid:setAlpha( 0.05 )
      f50_arg0.NoiseTiledBacking:setAlpha( 0 )
      f50_arg0.DirectorQuitButtonContainer:setAlpha( 0 )
      f50_arg0.DividerSolidBot:setTopBottom( 0, 0, 41, 45 )
      f50_arg0.DividerSolidBot:setAlpha( 0 )
      f50_arg0.Box:setTopBottom( 0, 0, -21, 43 )
      f50_arg0.Box:setAlpha( 0 )
      f50_arg0.SafeAreaContainer.CommonIdentityWidgetStreamlined:setAlpha( 1 )
      f50_arg0.TopBacking:setAlpha( 0 )
end

CoD.StartMenu_Main.__clipsPerState = {
      DefaultState = {
            DefaultClip = function ( f51_arg0, f51_arg1 )
                  f51_arg0:__resetProperties()
                  f51_arg0:setupElementClipCounter( 1 )
                  local f51_local0 = function ( f52_arg0 )
                        local f52_local0 = function ( f53_arg0 )
                              f53_arg0:beginAnimation( 150 )
                              f53_arg0:setAlpha( 1 )
                              f53_arg0:registerEventHandler( "transition_complete_keyframe", f51_arg0.clipFinished )
                        end
                        
                        f51_arg0.TabFrame:beginAnimation( 150 )
                        f51_arg0.TabFrame:registerEventHandler( "interrupted_keyframe", f51_arg0.clipInterrupted )
                        f51_arg0.TabFrame:registerEventHandler( "transition_complete_keyframe", f52_local0 )
                  end
                  
                  f51_arg0.TabFrame:completeAnimation()
                  f51_arg0.TabFrame:setAlpha( 0 )
                  f51_local0( f51_arg0.TabFrame )
            end
      },
      IsFrontEnd = {
            DefaultClip = function ( f54_arg0, f54_arg1 )
                  f54_arg0:__resetProperties()
                  f54_arg0:setupElementClipCounter( 1 )
                  f54_arg0.Background:completeAnimation()
                  f54_arg0.Background:setAlpha( 1 )
                  f54_arg0.clipFinished( f54_arg0.Background )
            end
      },
      Zombies = {
            DefaultClip = function ( f55_arg0, f55_arg1 )
                  f55_arg0:__resetProperties()
                  f55_arg0:setupElementClipCounter( 5 )
                  f55_arg0.Background:completeAnimation()
                  f55_arg0.Background:setAlpha( 1 )
                  f55_arg0.clipFinished( f55_arg0.Background )
                  f55_arg0.BGEnhancement:completeAnimation()
                  f55_arg0.BGEnhancement:setAlpha( 0 )
                  f55_arg0.clipFinished( f55_arg0.BGEnhancement )
                  f55_arg0.NoiseTiledBacking:completeAnimation()
                  f55_arg0.NoiseTiledBacking:setAlpha( 0.6 )
                  f55_arg0.clipFinished( f55_arg0.NoiseTiledBacking )
                  f55_arg0.TiledPlusGrid:completeAnimation()
                  f55_arg0.TiledPlusGrid:setAlpha( 0 )
                  f55_arg0.clipFinished( f55_arg0.TiledPlusGrid )
                  f55_arg0.DirectorQuitButtonContainer:completeAnimation()
                  f55_arg0.DirectorQuitButtonContainer:setAlpha( 1 )
                  f55_arg0.clipFinished( f55_arg0.DirectorQuitButtonContainer )
            end
      },
      Campaign = {
            DefaultClip = function ( f56_arg0, f56_arg1 )
                  f56_arg0:__resetProperties()
                  f56_arg0:setupElementClipCounter( 0 )
            end
      },
      WZ = {
            DefaultClip = function ( f57_arg0, f57_arg1 )
                  f57_arg0:__resetProperties()
                  f57_arg0:setupElementClipCounter( 6 )
                  f57_arg0.BGEnhancement:completeAnimation()
                  f57_arg0.BGEnhancement:setRGB( 0, 0, 0 )
                  f57_arg0.BGEnhancement:setAlpha( 0.94 )
                  f57_arg0.clipFinished( f57_arg0.BGEnhancement )
                  f57_arg0.TiledPlusGrid:completeAnimation()
                  f57_arg0.TiledPlusGrid:setAlpha( 0 )
                  f57_arg0.clipFinished( f57_arg0.TiledPlusGrid )
                  f57_arg0.Box:completeAnimation()
                  f57_arg0.Box:setTopBottom( 0, 0, -17, 47 )
                  f57_arg0.Box:setAlpha( 0.8 )
                  f57_arg0.clipFinished( f57_arg0.Box )
                  f57_arg0.DividerSolidBot:completeAnimation()
                  f57_arg0.DividerSolidBot:setTopBottom( 0, 0, 45, 49 )
                  f57_arg0.DividerSolidBot:setAlpha( 0.76 )
                  f57_arg0.clipFinished( f57_arg0.DividerSolidBot )
                  f57_arg0.SafeAreaContainer:completeAnimation()
                  f57_arg0.SafeAreaContainer.CommonIdentityWidgetStreamlined:completeAnimation()
                  f57_arg0.SafeAreaContainer.CommonIdentityWidgetStreamlined:setAlpha( 0 )
                  f57_arg0.clipFinished( f57_arg0.SafeAreaContainer )
                  f57_arg0.DirectorQuitButtonContainer:completeAnimation()
                  f57_arg0.DirectorQuitButtonContainer:setAlpha( 1 )
                  f57_arg0.clipFinished( f57_arg0.DirectorQuitButtonContainer )
            end
      },
      Ingame = {
            DefaultClip = function ( f58_arg0, f58_arg1 )
                  f58_arg0:__resetProperties()
                  f58_arg0:setupElementClipCounter( 4 )
                  f58_arg0.BGEnhancement:completeAnimation()
                  f58_arg0.BGEnhancement:setRGB( 0.63, 0.24, 0.24 )
                  f58_arg0.BGEnhancement:setAlpha( 0 )
                  f58_arg0.clipFinished( f58_arg0.BGEnhancement )
                  f58_arg0.TopBacking:completeAnimation()
                  f58_arg0.TopBacking:setAlpha( 0.8 )
                  f58_arg0.clipFinished( f58_arg0.TopBacking )
                  f58_arg0.SafeAreaContainer:completeAnimation()
                  f58_arg0.SafeAreaContainer.CommonIdentityWidgetStreamlined:completeAnimation()
                  f58_arg0.SafeAreaContainer.CommonIdentityWidgetStreamlined:setAlpha( 0 )
                  f58_arg0.clipFinished( f58_arg0.SafeAreaContainer )
                  f58_arg0.DirectorQuitButtonContainer:completeAnimation()
                  f58_arg0.DirectorQuitButtonContainer:setAlpha( 1 )
                  f58_arg0.clipFinished( f58_arg0.DirectorQuitButtonContainer )
            end
      }
}

CoD.StartMenu_Main.__onClose = function ( f59_arg0 )
      f59_arg0.TabFrame:close()
      f59_arg0.Background:close()
      f59_arg0.MenuFrameIngame:close()
      f59_arg0.SafeAreaContainer:close()
      f59_arg0.DirectorQuitButtonContainer:close()
      f59_arg0.PCKoreaContentDescriptorsContainer:close()
end

-- Custom Perks BG
CoD.PerksBGRush = InheritFrom( LUI.UIElement )
CoD.PerksBGRush.__defaultWidth = 1920
CoD.PerksBGRush.__defaultHeight = 1080
CoD.PerksBGRush.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
      local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.PerksBGRush )
	self.id = "PerksBGRush"
	self.soundSet = "FriendsMenu"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )

      -- Extra Perks
      local perkg_bg = LUI.UIImage.new(0.508, 0.645, 0, 100, 0.91, 0.91, -7.5, 60)
      perkg_bg:setImage(RegisterImage(@"$white"))
      perkg_bg:setRGB(0, 0, 0)
      perkg_bg:setMaterial(LUI.UIImage.GetCachedMaterial("ui_multiply"))
      perkg_bg:setAlpha(0.25)
      self:addElement(perkg_bg)
      self.perkg_bg = perkg_bg

      self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f12_local0 = Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_demo_all_game_hud_hidden"] )
				if not f12_local0 then
					f12_local0 = Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_demo_camera_mode_moviecam"] )
					if not f12_local0 then
						f12_local0 = Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_emp_active"] )
						if not f12_local0 then
							f12_local0 = Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_game_ended"] )
							if not f12_local0 then
								if Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_hud_visible"] ) then
									f12_local0 = Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_in_guided_missile"] )
									if not f12_local0 then
										f12_local0 = Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_in_remote_killstreak_static"] )
										if not f12_local0 then
											f12_local0 = Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_in_vehicle"] )
											if not f12_local0 then
												f12_local0 = Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_is_flash_banged"] )
												if not f12_local0 then
													f12_local0 = Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_is_scoped"] )
													if not f12_local0 then
														f12_local0 = Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_scoreboard_open"] )
														if not f12_local0 then
															f12_local0 = Engine[@"isvisibilitybitset"]( f1_arg1, Enum[@"uivisibilitybit"][@"bit_ui_active"] )
														end
													end
												end
											end
										end
									end
								else
									f12_local0 = true
								end
							end
						end
					end
				end
				return f12_local0
			end
		}
	} )
      
      local f1_local12 = self
	local f1_local13 = self.subscribeToModel
	local f1_local14 = Engine[@"getmodelforcontroller"]( f1_arg1 )
	f1_local13( f1_local12, f1_local14["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_demo_all_game_hud_hidden"]], function ( f13_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f13_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_demo_all_game_hud_hidden"]
		} )
	end, false )
	f1_local12 = self
	f1_local13 = self.subscribeToModel
	f1_local14 = Engine[@"getmodelforcontroller"]( f1_arg1 )
	f1_local13( f1_local12, f1_local14["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_demo_camera_mode_moviecam"]], function ( f14_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f14_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_demo_camera_mode_moviecam"]
		} )
	end, false )
	f1_local12 = self
	f1_local13 = self.subscribeToModel
	f1_local14 = Engine[@"getmodelforcontroller"]( f1_arg1 )
	f1_local13( f1_local12, f1_local14["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_emp_active"]], function ( f15_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f15_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_emp_active"]
		} )
	end, false )
	f1_local12 = self
	f1_local13 = self.subscribeToModel
	f1_local14 = Engine[@"getmodelforcontroller"]( f1_arg1 )
	f1_local13( f1_local12, f1_local14["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_game_ended"]], function ( f16_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f16_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_game_ended"]
		} )
	end, false )
	f1_local12 = self
	f1_local13 = self.subscribeToModel
	f1_local14 = Engine[@"getmodelforcontroller"]( f1_arg1 )
	f1_local13( f1_local12, f1_local14["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_hud_visible"]], function ( f17_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f17_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_hud_visible"]
		} )
	end, false )
	f1_local12 = self
	f1_local13 = self.subscribeToModel
	f1_local14 = Engine[@"getmodelforcontroller"]( f1_arg1 )
	f1_local13( f1_local12, f1_local14["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_guided_missile"]], function ( f18_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f18_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_guided_missile"]
		} )
	end, false )
	f1_local12 = self
	f1_local13 = self.subscribeToModel
	f1_local14 = Engine[@"getmodelforcontroller"]( f1_arg1 )
	f1_local13( f1_local12, f1_local14["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_remote_killstreak_static"]], function ( f19_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f19_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_remote_killstreak_static"]
		} )
	end, false )
	f1_local12 = self
	f1_local13 = self.subscribeToModel
	f1_local14 = Engine[@"getmodelforcontroller"]( f1_arg1 )
	f1_local13( f1_local12, f1_local14["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_vehicle"]], function ( f20_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f20_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_in_vehicle"]
		} )
	end, false )
	f1_local12 = self
	f1_local13 = self.subscribeToModel
	f1_local14 = Engine[@"getmodelforcontroller"]( f1_arg1 )
	f1_local13( f1_local12, f1_local14["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_is_flash_banged"]], function ( f21_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f21_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_is_flash_banged"]
		} )
	end, false )
	f1_local12 = self
	f1_local13 = self.subscribeToModel
	f1_local14 = Engine[@"getmodelforcontroller"]( f1_arg1 )
	f1_local13( f1_local12, f1_local14["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_is_scoped"]], function ( f22_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f22_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_is_scoped"]
		} )
	end, false )
	f1_local12 = self
	f1_local13 = self.subscribeToModel
	f1_local14 = Engine[@"getmodelforcontroller"]( f1_arg1 )
	f1_local13( f1_local12, f1_local14["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_scoreboard_open"]], function ( f23_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f23_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_scoreboard_open"]
		} )
	end, false )
	f1_local12 = self
	f1_local13 = self.subscribeToModel
	f1_local14 = Engine[@"getmodelforcontroller"]( f1_arg1 )
	f1_local13( f1_local12, f1_local14["UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_ui_active"]], function ( f24_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f24_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum[@"uivisibilitybit"][@"bit_ui_active"]
		} )
	end, false )

      LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )

      if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.PerksBGRush.__resetProperties = function ( f16_arg0 )
	f16_arg0.perkg_bg:completeAnimation()
	f16_arg0.perkg_bg:setAlpha(0.25)
end

CoD.PerksBGRush.__clipsPerState = {

	DefaultState = {
		DefaultClip = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties()
			f17_arg0:setupElementClipCounter( 0 )
		end,

            Hidden = function ( f18_arg0, f18_arg1 )
			f18_arg0:__resetProperties()
			f18_arg0:setupElementClipCounter( 1 )
			f18_arg0.perkg_bg:completeAnimation()
			f18_arg0.perkg_bg:setAlpha( 0 )
			f18_arg0.clipFinished( f18_arg0.perkg_bg )
		end
	},

	Hidden = {
		DefaultClip = function ( f18_arg0, f18_arg1 )
			f18_arg0:__resetProperties()
			f18_arg0:setupElementClipCounter( 1 )
			f18_arg0.perkg_bg:completeAnimation()
			f18_arg0.perkg_bg:setAlpha( 0 )
			f18_arg0.clipFinished( f18_arg0.perkg_bg )
		end
	}

}

CoD.PerksBGRush.__onClose = function ( f19_arg0 )
	f19_arg0.perkg_bg:close()
end

-- Should be injected after 2b23cf5ef446c848
LUI.createMenu["T7Hud_" .. Engine[@"getcurrentmap"]()] = function ( controller ) 
      local self = LUI.createMenu.T7Hud_zm_factory( controller )
      Engine[ @"PrintInfo" ](0, "^2Loading Rush Huds...")
      
      -- LUI.UIText.new(0.5, 0, 64, 0, 0.5, 0.5, 20 + (i - 1) * 30, 50 + (i - 1) * 30)
      -- LUI.UI????.new(leftAnchor, rightAnchor, left, right, topAnchor, bottomAnchor, top, bottom)

      -- Main HUD Editing...
      local SafeArea = self.SafeAreaContainer
      local CursorHint = self.CursorHint
      local DamageFeedback = self.DamageFeedback
      local ZMInventory = self.ZMInventory
      local PauseNotification = self.HUDZMServerPauseNotification
      local WaypointContainer = self.WaypointContainer
      local OverheadNameContainer = self.OverheadNameContainer
      local ZMTrialsContainer = SafeArea.HudZMTrialsContainer
      local ZMTimer = ZMTrialsContainer.HudZMTimer

      -- Perks
      local PerksLogic = SafeArea.ZMPerkVaporsContainer
      local PerksLogicDisabled = PerksLogic.CrossPerks

      -- Ammo, Riot Shield
      local AmmoWidget = SafeArea.AmmoWidgetZMContainer
      local AmmoWidgetMain = AmmoWidget.AmmoWidgetZM
      local RiotHealth = SafeArea.RiotShieldHealth

      -- Player Health, Score
      local PlayerWidget = SafeArea.PlayerWidget
      local ScorePC = SafeArea.ScorePC
      local Rounds = SafeArea.Rounds
      local ZMRounds = Rounds.ZmRnd
      local RndDigits = ZMRounds.RndDigits
      local DigitsInt = RndDigits.DigitsInt
      local ZmRndDigitWidget = DigitsInt.ZmRndDigitWidget
      local ZmRndDigitWidget0 = DigitsInt.ZmRndDigitWidget0
      local ZmRndDigitWidget1 = DigitsInt.ZmRndDigitWidget1
      local ZMHintTextContainer = SafeArea.ZMHintTextContainer
      local PowerUpsArea = SafeArea.PowerUpsArea

      -- Notifc
      local Notifications = SafeArea.Notifications
      local NotificationsBGB = SafeArea.ZmNotifBGBContainerFactory
      local GameoverScoreboard = SafeArea.GameoverScoreboard

      -- For Elixirs...
      local AmmoPC = SafeArea.AmmoPC
      local ZmAmmoFac = AmmoPC.ZmAmmo
      local ZmAmmoProb = ZmAmmoFac.ZmAmmoProp0
      local BGBFac = ZmAmmoProb.ZmAmmoBGBCarouselFactory

      local ElixirsPC = BGBFac.PCButtons -- pc
      local ElixirsConsole = BGBFac.buttons -- console...

      local FirstElixirPC = ElixirsPC.firstElixir
      local SecondElixirPC = ElixirsPC.secondElixir
      local ThirdElixirPC = ElixirsPC.thirdElixir
      local FourthElixirPC = ElixirsPC.fourthElixir

      local FirstElixirConsole = ElixirsPC.firstElixir
      local SecondElixirConsole = ElixirsPC.secondElixir
      local ThirdElixirConsole = ElixirsPC.thirdElixir
      local FourthElixirConsole = ElixirsPC.fourthElixir

      local ChatClient = SafeArea.IngameChatClientContainer

      -- ??
      --local = ??
      --self:setRGB(1, 0, 1)
      --SafeArea:setRGB(0, 1, 1)

      -- Other
      ZMTimer:setRGB(1, 0, 1)
      --ChatClient:setRGB(1, 0, 1)
      --CursorHint:setRGB(1, 0, 0)
      DamageFeedback:setRGB(1, 0, 1)
      ZMInventory:setRGB(1, 0, 1)
      PauseNotification:setRGB(1, 0, 0)
      WaypointContainer:setRGB(1, 0, 0)
      OverheadNameContainer:setRGB(1, 0, 0)

      -- Main Perks
      PerksLogic:setTopBottom(0, 0, 0, 0) -- fix
      PerksLogic.Image:setRGB(1, 0, 0) -- perks down image
      PerksLogic.Image:setTopBottom(0, 0, 80 - 20, 124 - 20)
      
      PerksLogic.bgbGlowOrangeOver:setTopBottom(0, 0, 80 - 73, 124 - 73)
      PerksLogic.bgbGlowOrangeOver:setRGB(1, 0, 0)
      PerksLogic.vapors:setTopBottom(0, 0, 80 - 73, 124 - 73)
      PerksLogic.vapors:setRGB(1, 0, 1)
      PerksLogic.bgbAbilitySwirl:setTopBottom(0, 0, 80 - 73, 124 - 73)
      PerksLogic.bgbAbilitySwirl:setRGB(1, 0, 1)

      -- Ammo Info
      AmmoWidgetMain.bgbGlowOrangeOver:setRGB(1, 1, 0)
      AmmoWidgetMain.TutorialHighlight:setRGB(0, 1, 1)
      AmmoWidgetMain.bgbAbilitySwirl:setRGB(0, 1, 1)
      AmmoWidgetMain.AmmoWidgetZMAmmoModifier:setRGB(0, 1, 1)
      AmmoWidgetMain.Backing:setRGB(0, 1, 0)
      AmmoWidgetMain.BackingBlur:setRGB(0, 1, 0)

      AmmoWidgetMain.MuleKick:setImage(RegisterImage(@"specialty_three_guns_zombies"))
      AmmoWidgetMain.MuleKick:setRGB(1, 0, 1)
      
      AmmoWidgetMain.WeaponAmmoCount:setRGB(1, 0, 0)
      AmmoWidgetMain.aatText:setRGB(1, 0, 0)

      AmmoWidgetMain.Equipment:setRGB(1, 0, 1)
      AmmoWidgetMain.Equipment:setTopBottom(-0.6, -0.6, 90.5, 149.5)
      AmmoWidgetMain.Equipment:setLeftRight(0.54, 0.54, 163.5, 235.5)

      AmmoWidgetMain.specialWeaponLevel:setRGB(0, 0, 1)
      AmmoWidgetMain.specialWeaponLevel:setTopBottom(-0.915, -0.915, 55, 190)
      AmmoWidgetMain.specialWeaponLevel:setLeftRight(0.327, 0.327, 280, 630)

      AmmoWidgetMain.AmmoWidgetZMAbilityOrWeaponContainer:setRGB(1, 1, 0) -- long fucking ass name
      AmmoWidgetMain.AmmoWidgetZMAbilityOrWeaponContainer:setTopBottom(-1.4, -1.4, 90.5, 149.5)
      AmmoWidgetMain.AmmoWidgetZMAbilityOrWeaponContainer:setLeftRight(0.675, 0.675, 84.5, 156.5)

      RiotHealth:setRGB(0, 1, 1)
      RiotHealth:setLeftRight(1, 1, -675 + 548.3, -600 + 548.3)
      RiotHealth:setTopBottom(1, 1, -128 - 363, -38 - 363)

      AmmoWidgetMain.WeaponEquippedList:setRGB(0, 1, 1)
      AmmoWidgetMain.HudZMWeaponDisabledContainer:setRGB(1, 0, 1) -- long ass name


      -- Main Health, Score, Extra Perks, etc...
      --PlayerWidget:setTopBottom(0, 0, 0, 0) -- fix

      PlayerWidget.Backing:setRGB(1, 0, 0)
      PlayerWidget.BackingBlur:setRGB(1, 0, 0)
      PlayerWidget.headshotBarBacking:setRGB(1, 0, 0)
      PlayerWidget.HealthValue:setRGB(0, 1, 0)
      PlayerWidget.ScoreShadow:setRGB(0, 0, 1)
      PlayerWidget.Score:setRGB(1, 0, 1)
      PlayerWidget.SelfReviveCounter:setRGB(1, 0, 1)

      -- Utils
      Notifications:setRGB(1, 0, 1)
      Notifications:setTopBottom(0.5, 0.5, 0, 0)
      NotificationsBGB:setRGB(1, 0, 1)
      NotificationsBGB:setTopBottom(0.5, 0.5, -9, 371)
      GameoverScoreboard:setRGB(1, 0, 1)

      ScorePC:setRGB(1, 0, 1)
      ZMHintTextContainer:setRGB(1, 0, 1)

      -- PowerUps
      --PowerUpsArea:setRGB(0.5, 0, 0)
      PowerUpsArea.PowerUpsList:setTopBottom(0.23, 0.23, -224, -152)
      PowerUpsArea.PowerUpsList:setLeftRight(0.76, 0.76, -472, 472)

      -- Used the Glowing one instead!!! (Replaced)
      Rounds:setRGB(1, 0, 1)
      Rounds:setTopBottom(0.80, 0.80, -36, 252)
      Rounds:setLeftRight(0.20, 0.20, -51, 285)
      ZMRounds:setRGB(1, 0, 1)
      ZMRounds.RndDigits:setRGB(1, 0, 1)

      -- Extra Perks
      local PerksBG = CoD.PerksBGRush.new(self, controller, 0, 1, 0, 0, 0, 1, 0, 0)
      self:addElement(PerksBG)
	self.PerksBG = PerksBG

      PlayerWidget.ZMExtraPerkVapors:setRGB(0, 1, 1)
      PlayerWidget.ZMExtraPerkVapors:setTopBottom(0.9185, 0.9185, -28.5, 69.5)
      PlayerWidget.ZMExtraPerkVapors:setLeftRight(0.634, 0.634, -28.5, 69.5)
      self:addElement(PlayerWidget.ZMExtraPerkVapors) -- hjack kinda works? lol

      -- Elixirs Stuff
      BGBFac:setTopBottom(0, 0, -200, 0) -- fix
      ElixirsPC:setTopBottom(0, 0, -200, 0)
      ElixirsConsole:setTopBottom(0, 0, -250, 0)

      ElixirsPC.FirstElixirFrame:setRGB(1, 0, 1)
      ElixirsPC.FirsttempGumName:setRGB(1, 0, 1)
      ElixirsPC.FirstElixirBGWipe:setRGB(1, 0, 1)
      ElixirsPC.FirstBGBKeybind:setRGB(1, 0, 1)
      ElixirsPC.FirstElixirBG:setRGB(1, 0, 1)
      ElixirsPC.firstElixir:setRGB(1, 0, 1)
      ElixirsPC.BBGumRingBackerFirst:setRGB(1, 0, 1)
      
      FirstElixirPC.ZMConsumableItemCountInGame:setRGB(1, 0, 1)
      FirstElixirPC.Cross:setRGB(1, 0, 1)
      FirstElixirPC.RingTimer:setRGB(1, 0, 1)
      FirstElixirPC.clockOverlay:setRGB(1, 0, 1)

      FirstElixirConsole.ZMConsumableItemCountInGame:setRGB(1, 0, 1)
      FirstElixirConsole.Cross:setRGB(1, 0, 1)
      FirstElixirConsole.RingTimer:setRGB(1, 0, 1)
      FirstElixirConsole.clockOverlay:setRGB(1, 0, 1)

      ElixirsPC.SecondElixirFrame:setRGB(0, 1, 1)
      ElixirsPC.SecondtempGumName:setRGB(0, 1, 1)
      ElixirsPC.SecondElixirBGWipe:setRGB(0, 1, 1)
      ElixirsPC.SecondBGBKeybind:setRGB(0, 1, 1)
      ElixirsPC.SecondElixirBG:setRGB(0, 1, 1)
      ElixirsPC.secondElixir:setRGB(0, 1, 1)
      ElixirsPC.BBGumRingBackerSecond:setRGB(1, 0, 1)
      
      SecondElixirPC.ZMConsumableItemCountInGame:setRGB(0, 1, 1)
      SecondElixirPC.Cross:setRGB(0, 1, 1)
      SecondElixirPC.RingTimer:setRGB(0, 1, 1)
      SecondElixirPC.clockOverlay:setRGB(0, 1, 1)

      SecondElixirConsole.ZMConsumableItemCountInGame:setRGB(0, 1, 1)
      SecondElixirConsole.Cross:setRGB(0, 1, 1)
      SecondElixirConsole.RingTimer:setRGB(0, 1, 1)
      SecondElixirConsole.clockOverlay:setRGB(0, 1, 1)

      ElixirsPC.ThirdElixirFrame:setRGB(1, 1, 0)
      ElixirsPC.ThirdtempGumName:setRGB(1, 1, 0)
      ElixirsPC.ThirdElixirBGWipe:setRGB(1, 1, 0)
      ElixirsPC.ThirdBGBKeybind:setRGB(1, 1, 0)
      ElixirsPC.ThirdElixirBG:setRGB(1, 1, 0)
      ElixirsPC.thirdElixir:setRGB(1, 1, 0)
      ElixirsPC.BBGumRingBackerThird:setRGB(1, 1, 0)

      ThirdElixirPC.ZMConsumableItemCountInGame:setRGB(1, 1, 0)
      ThirdElixirPC.Cross:setRGB(1, 1, 0)
      ThirdElixirPC.RingTimer:setRGB(1, 1, 0)
      ThirdElixirPC.clockOverlay:setRGB(1, 1, 0)

      ThirdElixirConsole.ZMConsumableItemCountInGame:setRGB(1, 1, 0)
      ThirdElixirConsole.Cross:setRGB(1, 1, 0)
      ThirdElixirConsole.RingTimer:setRGB(1, 1, 0)
      ThirdElixirConsole.clockOverlay:setRGB(1, 1, 0)

      ElixirsPC.FourthElixirFrame:setRGB(1, 0, 0)
      ElixirsPC.FourthtempGumName:setRGB(1, 0, 0)
      ElixirsPC.FourthElixirBGWipe:setRGB(1, 0, 0)
      ElixirsPC.ThirdBGBKeybind2:setRGB(1, 0, 0) -- nice one fucking treyarch
      --ElixirsPC.FourthBGBKeybind:setRGB(1, 1, 0)
      ElixirsPC.FourthElixirBG:setRGB(1, 0, 0)
      ElixirsPC.fourthElixir:setRGB(1, 0, 0)
      ElixirsPC.BBGumRingBackerFourth:setRGB(1, 0, 0)

      FourthElixirPC.ZMConsumableItemCountInGame:setRGB(1, 0, 0)
      FourthElixirPC.Cross:setRGB(1, 0, 0)
      FourthElixirPC.RingTimer:setRGB(1, 0, 0)
      FourthElixirPC.clockOverlay:setRGB(1, 0, 0)

      FourthElixirConsole.ZMConsumableItemCountInGame:setRGB(1, 0, 0)
      FourthElixirConsole.Cross:setRGB(1, 0, 0)
      FourthElixirConsole.RingTimer:setRGB(1, 0, 0)
      FourthElixirConsole.clockOverlay:setRGB(1, 0, 0)

      -- wont loop it since it breaks setAlpha()
      --FirstElixirPC.icon:setRGB(0, 0, 1)
      --SecondElixirPC.icon:setRGB(0, 1, 1)
      --ThirdElixirPC.icon:setRGB(1, 0, 1)
      --FourthElixirPC.icon:setRGB(1, 1, 0)

      --FirstElixirConsole.icon:setRGB(0, 0, 1)
      --SecondElixirConsole.icon:setRGB(0, 1, 1)
      --ThirdElixirConsole.icon:setRGB(1, 0, 1)
      --FourthElixirConsole.icon:setRGB(1, 1, 0)

      -- console here, the logic is diff, so other names instead....
      ElixirsConsole.DpadBackplate:setRGB(1, 1, 0)
      ElixirsConsole.ButtonPrompt:setRGB(0, 1, 0)

      ElixirsConsole.ElixirGlowStroke:setRGB(1, 0, 0)
      ElixirsConsole.ElixirBackerFrame:setRGB(0, 1, 1)
      ElixirsConsole.ElixirBackerMid:setRGB(1, 1, 0)
      ElixirsConsole.ElixirBackerMidBlurBG:setRGB(1, 0, 1)
      ElixirsConsole.ElixirBackerMidCooldownOverlay:setRGB(0, 0, 1)

      ElixirsConsole.tempGumLeftName:setRGB(1, 0, 0)
      ElixirsConsole.tempGumDownName:setRGB(1, 1, 0)
      ElixirsConsole.tempGumRightName:setRGB(0, 1, 1)
      ElixirsConsole.tempGumUpName:setRGB(1, 0, 1)

      ElixirsConsole.left:setRGB(1, 0, 0)
      ElixirsConsole.bottom:setRGB(1, 1, 0)
      ElixirsConsole.right:setRGB(0, 1, 1)
      ElixirsConsole.up:setRGB(1, 0, 1)

      ElixirsConsole.BBGumRingBackerLeft:setRGB(1, 0, 0)
      ElixirsConsole.BBGumRingBackerBtm:setRGB(1, 1, 0)
      ElixirsConsole.BBGumRingBackerRight:setRGB(0, 1, 1)
      ElixirsConsole.BBGumRingBackerTop:setRGB(1, 0, 1)

      -- Boss Huds here..
      local rush_boss = LUI.UIText.new(0.1, 0, 64, 0, 0.13, 0.13, 20, 50)
      rush_boss:setText("")
      rush_boss:setTTF("ttmussels_regular")
      rush_boss:subscribeToGlobalModel(controller, "PerController", "scriptNotify", function ( model )
            if CoD.ModelUtility.IsParamModelEqualToHashString( model, @"rush_boss" ) then
                  local scriptData = CoD.GetScriptNotifyData(model)
                        if scriptData[1] == 0 then
                              rush_boss:setText("") -- remove
                        elseif scriptData[1] == 1 then
                              rush_boss:setText("^1The Powerup Eyes")
                        elseif scriptData[1] == 1 and scriptData[2] == 1 then
                              rush_boss:setText("^1The Powerup Eyes ^4- Wipe Attacks: ^5".. scriptData[3] .. "^3/^6" .. "5")
                        elseif scriptData[1] == 2 and scriptData[2] == 2 then
                              rush_boss:setText("^1Pegasus ^4- ^3Phase 2")
                        elseif scriptData[1] == 2 then
                              rush_boss:setText("^1Pegasus ^4- ^3Phase 1")
                        elseif scriptData[1] == 3 then
                              rush_boss:setText("^1Spectre ^4- ^3Last Phase")
                        elseif scriptData[1] == 4 then
                              rush_boss:setText("^1The Elephant ^4- ^3Phase 1")
                        elseif scriptData[1] == 5 then
                              rush_boss:setText("^1The Elephant ^4- ^3Phase 2")
                        elseif scriptData[1] == 6 and scriptData[2] == 0 then
                              rush_boss:setText("^1Diego")
                        elseif scriptData[1] == 6 and scriptData[2] == 1 then
                              rush_boss:setText("^1Diego ^3- ^4Stunned")
                        elseif scriptData[1] == 7 then
                              rush_boss:setText("^1Scarlett")
                        elseif scriptData[1] == 8 then
                              rush_boss:setText("^1Zero")
                        elseif scriptData[1] == 9 and scriptData[2] == 10 then
                              rush_boss:setText("^1The Lockdown ^4- ^3Charging")
                        elseif scriptData[1] == 9 and scriptData[2] == 11 then
                              rush_boss:setText("^1The Lockdown ^4- ^3Final")
                        elseif scriptData[1] == 9 then
                              rush_boss:setText("^1The Lockdown")
                        elseif scriptData[1] == 10 then
                              rush_boss:setText("^1Rush Mode Completed!")
                        end
            end
      end)
      self:addElement(rush_boss)

      local rush_boss_health = LUI.UIText.new(0.1, 0, 64, 0, 0.16, 0.16, 20, 50)
      rush_boss_health:setText("")
      rush_boss_health:setTTF("ttmussels_regular")
      rush_boss_health:subscribeToGlobalModel(controller, "PerController", "scriptNotify", function ( model )
            if CoD.ModelUtility.IsParamModelEqualToHashString( model, @"rush_boss_health" ) then
                  local scriptData = CoD.GetScriptNotifyData(model)
                              if scriptData[1] == 0 then
                                    rush_boss_health:setText("") -- remove
                              elseif scriptData[1] == 1 and scriptData[2] == 1 and scriptData[3] == 1 and scriptData[4] == 1 then
                                    rush_boss_health:setText("^2Damage Dealt: ^7" .. "??" .. "^3/^9" .. "??") -- VOD Start
                              elseif scriptData[1] == 1 then
                                    rush_boss_health:setText("^2Damage Dealt: ^7" .. tostring(scriptData[2]) .. " (D)^4/^2" .. tostring(scriptData[3]) .. " (W)^4/^9" .. tostring(scriptData[4]) .. " (A) ^3(" .. scriptData[5] .. ")") -- VOD After
                              elseif scriptData[1] == 2 then
                                    rush_boss_health:setText("^2Damage Dealt: ^1" .. scriptData[2] .. "^5/^1" .. scriptData[3]) -- AE/DOTN After
                              elseif scriptData[1] == 3 then
                                    if scriptData[2] < 0 then -- check if nagative..
                                          rush_boss_health:setText("^5Health: ^3 Dead") -- IX After 
                                    else
                                          rush_boss_health:setText("^5Health: ^2" .. scriptData[2]) -- IX After
                                    end
                              elseif scriptData[1] == 4 then
                                    if scriptData[2] < 0 then -- check if nagative..
                                          rush_boss_health:setText("^5Health: ^4 Protected..." .. " ^2(" .. "Dead" .. ") ") -- IX After 
                                    else
                                          rush_boss_health:setText("^5Health: ^4 Protected..." .. " ^2(" .. scriptData[2] .. ") ") -- IX After (proc)
                                    end
                              elseif scriptData[1] == 5 then
                                    rush_boss_health:setText("^3Orbs Health: ^9??") -- Blood After
                              elseif scriptData[1] == 6 then
                                    rush_boss_health:setText("^3Orbs Health: ^9" .. scriptData[2]) -- Blood After
                              elseif scriptData[1] == 7 then
                                    rush_boss_health:setText("^3Souls Charged: ^1" .. scriptData[2] .. "^5/^460") -- AO After
                              elseif scriptData[1] == 8 then
                                    rush_boss_health:setText("^3Souls Charged: ^1" .. scriptData[2] .. "^5/^4" .. scriptData[3]) -- Tag After
                              elseif scriptData[1] == 10 then
                                    rush_boss_health:setText("^8____________________________________") -- Tag After
                              elseif scriptData[1] == 11 and scriptData[2] == 11 then
                                    rush_boss_health:setText("^2Current Phase: ^5Last Phase") -- VOD After
                              end
            end
      end)
      self:addElement(rush_boss_health)

      local rush_boss_phase = LUI.UIText.new(0.1, 0, 64, 0, 0.19, 0.19, 20, 50)
      rush_boss_phase:setText("")
      rush_boss_phase:setTTF("ttmussels_regular")
      rush_boss_phase:subscribeToGlobalModel(controller, "PerController", "scriptNotify", function ( model )
            if CoD.ModelUtility.IsParamModelEqualToHashString( model, @"rush_boss_phase" ) then
                  local scriptData = CoD.GetScriptNotifyData(model)

                        if scriptData[1] == 0 then
                              rush_boss_phase:setText("") -- remove
                        elseif scriptData[1] == 2 and scriptData[2] == 1 then
                              rush_boss_phase:setText("^8____________________________________")
                        elseif scriptData[1] == 3 then
                              rush_boss_phase:setText("^2Damage Dealt (Stunned): ^1" .. scriptData[2] .. "^5/^1" .. scriptData[3]) -- AE After
                        elseif scriptData[1] == 2 and scriptData[2] == 2 then
                              rush_boss_phase:setText("^2...") -- ...
                        elseif scriptData[1] == 1 and scriptData[2] == 1 then
                              rush_boss_phase:setText("^2Current Phase: ^5Phase One") -- VOD Start
                        elseif scriptData[1] == 1 and scriptData[2] == 2 then
                              rush_boss_phase:setText("^2Current Phase: ^5Phase Two") -- VOD After
                        elseif scriptData[1] == 1 and scriptData[2] == 3 then
                              rush_boss_phase:setText("^2Current Phase: ^5Phase Three") -- VOD After
                        elseif scriptData[1] == 1 and scriptData[2] == 4 then
                              rush_boss_phase:setText("^2Current Phase: ^5Phase Four") -- VOD After
                        elseif scriptData[1] == 1 and scriptData[2] == 5 then
                              rush_boss_phase:setText("^2Current Phase: ^5Phase Five") -- VOD After
                        elseif scriptData[1] == 1 and scriptData[2] == 6 then
                              rush_boss_phase:setText("^2Current Phase: ^5Phase Six") -- VOD After
                        elseif scriptData[1] == 1 and scriptData[2] == 7 then
                              rush_boss_phase:setText("^2Current Phase: ^5Phase Seven") -- VOD After
                        elseif scriptData[1] == 1 and scriptData[2] == 8 then
                              rush_boss_phase:setText("^2Current Phase: ^5Phase Eight") -- Blood After
                        elseif scriptData[1] == 1 and scriptData[2] == 9 then
                              rush_boss_phase:setText("^2Current Phase: ^5Phase Nine") -- VOD After
                        elseif scriptData[1] == 1 and scriptData[2] == 10 then
                              rush_boss_phase:setText("^2Current Phase: ^5Phase Ten") -- VOD After
                        elseif scriptData[1] == 1 and scriptData[2] == 11 then
                              rush_boss_phase:setText("^2Current Phase: ^5Last Phase") -- VOD After
                        elseif scriptData[1] == 1 and scriptData[2] == 15 then
                              rush_boss_phase:setTopBottom(0.12, 0.12, 20 + (4 - 1) * 30, 50 + (4 - 1) * 30)
                  end
            end
      end)
      self:addElement(rush_boss_phase)

      local rush_boss_wipes = LUI.UIText.new(0.1, 0, 64, 0, 0.22, 0.22, 20, 50)
      rush_boss_wipes:setText("")
      rush_boss_wipes:setTTF("ttmussels_regular")
      rush_boss_wipes:subscribeToGlobalModel(controller, "PerController", "scriptNotify", function ( model )
            if CoD.ModelUtility.IsParamModelEqualToHashString( model, @"rush_boss_wipes" ) then
                  local scriptData = CoD.GetScriptNotifyData(model)
            
                  if scriptData[1] == 0 then
                        rush_boss_wipes:setText("") -- remove
                  elseif scriptData[1] == 1 and scriptData[2] == 1 then
                        rush_boss_wipes:setText("^1...") -- kinda
                  elseif scriptData[1] == 2 then
                        rush_boss_wipes:setText("Wipe Attacks: ^5" .. scriptData[2] .. "^3/^6" .. "5") -- after
                  elseif scriptData[1] == 3 then
                        rush_boss_wipes:setText("^8____________________________________") -- For AE
                  elseif scriptData[1] == 4 then
                        rush_boss_wipes:setText("^2Current Phase: ^5Phase One") -- For DOTN
                  elseif scriptData[1] == 5 then
                        rush_boss_wipes:setText("^2Current Phase: ^5Lockdown Phase") -- For DOTN
                  elseif scriptData[1] == 6 then
                        rush_boss_wipes:setText("^2Current Phase: ^5Last Phase") -- For DOTN
                  elseif scriptData[1] == 7 and scriptData[2] == 1 then
                        rush_boss_wipes:setText("^2Current Phase: ^5Phase One") -- AO Start
                  elseif scriptData[1] == 7 and scriptData[2] == 2 then
                        rush_boss_wipes:setText("^2Current Phase: ^5Phase Two") -- AO After
                  elseif scriptData[1] == 7 and scriptData[2] == 3 then
                        rush_boss_wipes:setText("^2Current Phase: ^5Phase Three") -- AO After
                  elseif scriptData[1] == 7 and scriptData[2] == 4 then
                        rush_boss_wipes:setText("^2Current Phase: ^5Phase Four") -- AO After
                  elseif scriptData[1] == 1 and scriptData[2] == 15 then
                        rush_boss_wipes:setText("^2Current Speed: ^5Normal") -- Tag After
                  elseif scriptData[1] == 1 and scriptData[2] == 16 then
                        rush_boss_wipes:setText("^2Current Speed: ^5Slow") -- Tag After
                  elseif scriptData[1] == 1 and scriptData[2] == 17 then
                        rush_boss_wipes:setText("^2Current Speed: ^5Freezed") -- Tag After
                  elseif scriptData[1] == 1 and scriptData[2] == 18 then
                        rush_boss_wipes:setText("^2Current Speed: ^5Fast") -- Tag After
                  elseif scriptData[1] == 8 then -- VOD
                        rush_boss_wipes:setText("^2Phase Ends in: ^3" .. scriptData[2]) -- timer after start
                  elseif scriptData[1] == 9 then -- VOD
                        rush_boss_wipes:setText("^2Phase Ends in: ^3" .. "??") -- timer before start
                  elseif scriptData[1] == 10 then -- VOD
                        rush_boss_wipes:setText("^2Phase Ends in: ^1" .. "Ended..") -- timer end
                  end
            end
      end)
      self:addElement(rush_boss_wipes)

      local rush_boss_line = LUI.UIText.new(0.1, 0, 64, 0, 0.095, 0.095, 20, 50)
      rush_boss_line:setText("")
      rush_boss_line:setTTF("ttmussels_regular")
      rush_boss_line:subscribeToGlobalModel(controller, "PerController", "scriptNotify", function ( model )
            if CoD.ModelUtility.IsParamModelEqualToHashString( model, @"rush_boss_line" ) then
                  local scriptData = CoD.GetScriptNotifyData(model)

                  if scriptData[1] == 1 then
                        rush_boss_line:setText("^8____________________________________")
                  elseif scriptData[1] == 0 then
                        rush_boss_line:setText("") -- remove
                  end
            end
      end)
      self:addElement(rush_boss_line)

      local rush_boss_line_2 = LUI.UIText.new(0.1, 0, 64, 0, 0.25, 0.25, 20, 50)
      rush_boss_line_2:setText("")
      rush_boss_line_2:setTTF("ttmussels_regular")
      rush_boss_line_2:subscribeToGlobalModel(controller, "PerController", "scriptNotify", function ( model )
            if CoD.ModelUtility.IsParamModelEqualToHashString( model, @"rush_boss_line_2" ) then
                  local scriptData = CoD.GetScriptNotifyData(model)

                  if scriptData[1] == 1 then
                        rush_boss_line_2:setText("^8____________________________________")
                  elseif scriptData[1] == 0 then
                        rush_boss_line_2:setText("") -- remove
                  end
            end
      end)
      self:addElement(rush_boss_line_2)

      local rush_boss_health_bar_bg = LUI.UIImage.new(0.1, 0.2, 66 - 4, 155 + 4, 0.167, 0.167, 20 + 40 - 6, 50 + 30 + 6)
	rush_boss_health_bar_bg:setImage(RegisterImage(@"progress_bar_frame")) -- changed -> progress_bar_frame
      rush_boss_health_bar_bg:setMaterial(LUI.UIImage.GetCachedMaterial("ui_multiply"))
      rush_boss_health_bar_bg:setRGB(0, 0, 0)
      --rush_boss_health_bar_bg:setScale(1.25, 1.25)
      rush_boss_health_bar_bg:setAlpha(0)
      rush_boss_health_bar_bg:subscribeToGlobalModel(controller, "PerController", "scriptNotify", function ( model )
            if CoD.ModelUtility.IsParamModelEqualToHashString( model, @"rush_boss_health_bar_bg" ) then
                  local scriptData = CoD.GetScriptNotifyData(model)

                  if scriptData[1] == 0 then
                        rush_boss_health_bar_bg:setAlpha(0)

                  elseif scriptData[1] == 1 then
                        rush_boss_health_bar_bg:setAlpha(0.75)

                  elseif scriptData[1] == 2 then -- for DOTN/AO
                        rush_boss_health_bar_bg:setTopBottom(0.163, 0.163, 20 + 35 - 6, 50 + 25 + 6)

                  elseif scriptData[1] == 3 then -- for VOD
                        rush_boss_health_bar_bg:setTopBottom(0.21, 0.21, 20 + 45 - 4, 50 + 25 + 4)

                  elseif scriptData[1] == 4 then -- for AE
                        rush_boss_health_bar_bg:setTopBottom(0.20, 0.20, 20 + 35 - 6, 50 + 25 + 6)

                  elseif scriptData[1] == 5 then -- for BOTD
                        rush_boss_health_bar_bg:setTopBottom(0.205, 0.205, 20 + 35 - 6, 50 + 25 + 6)
                  
                  end
            end
      end)
      self:addElement(rush_boss_health_bar_bg)

      local HealthBar_L_Old = 0
      local rush_boss_health_bar_l = LUI.UIImage.new(0.1, 0.2, 66, 155, 0.167, 0.167, 20 + 40, 50 + 30)
	rush_boss_health_bar_l:setImage(RegisterImage(@"hash_76D2FBF31F53910C"))
      rush_boss_health_bar_l:setMaterial(LUI.UIImage.GetCachedMaterial(@"hash_4316E67E1DF2198E"))
      rush_boss_health_bar_l:setShaderVector(1.000000, 0.01, 0, 0, 0) 
      rush_boss_health_bar_l:setShaderVector(2.000000, 1, 0, 0, 0)   
      rush_boss_health_bar_l:setShaderVector(3.000000, 0, 0, 0, 0) 
      rush_boss_health_bar_l:setRGB(1, 1, 1)
      rush_boss_health_bar_l:setAlpha(0)
      rush_boss_health_bar_l:subscribeToGlobalModel(controller, "PerController", "scriptNotify", function ( model )
            if CoD.ModelUtility.IsParamModelEqualToHashString( model, @"rush_boss_health_bar_l" ) then
                  local scriptData = CoD.GetScriptNotifyData(model)

                  if scriptData[1] == 1 then
                        local HealthBar_L = scriptData[2] / 100
                        
                        if HealthBar_L == HealthBar_L_Old then -- check if same..
                              --rush_boss_health_bar_l:setRGB(0, 0, 0)
                        else
                              rush_boss_health_bar_l:beginAnimation("keyframe", 400, false, false, CoD.TweenType.Linear) -- 300 S
                              rush_boss_health_bar_l:setShaderVector(0.000000, HealthBar_L, 0, 0, 0)
                              HealthBar_L_Old = HealthBar_L
                        end
                        --rush_boss_health_bar_l:setRGB(1, 0, 0) -- revert for some reason
                        --rush_boss_health_bar_l:setImage(RegisterImage(@"$white"))
                  elseif scriptData[1] == 2 then
                        rush_boss_health_bar_l:setAlpha(0.25)
                        rush_boss_health_bar_l:setRGB(1, 1, 1)
                        rush_boss_health_bar_l:setShaderVector(0.000000, 1, 0, 0, 0)

                  elseif scriptData[1] == 3 then
                        rush_boss_health_bar_l:setAlpha(0.25)
                        rush_boss_health_bar_l:setRGB(1, 1, 1)

                  elseif scriptData[1] == 4 then
                        rush_boss_health_bar_l:setAlpha(0.25)
                        rush_boss_health_bar_l:setRGB(1, 1, 1)

                  elseif scriptData[1] == 5 then -- for DOTN/AO
                        rush_boss_health_bar_l:setTopBottom(0.163, 0.163, 20 + 35, 50 + 25)

                  elseif scriptData[1] == 6 then -- for VOD
                        rush_boss_health_bar_l:setTopBottom(0.21, 0.21, 20 + 45, 50 + 25)

                  elseif scriptData[1] == 7 then -- for AE
                        rush_boss_health_bar_l:setTopBottom(0.20, 0.20, 20 + 35, 50 + 25)

                  elseif scriptData[1] == 8 then -- for BOTD
                        rush_boss_health_bar_l:setTopBottom(0.205, 0.205, 20 + 35, 50 + 25)

                  elseif scriptData[1] == 0 then
                        rush_boss_health_bar_l:setAlpha(0) -- remove
                  end
            end
      end)
      self:addElement(rush_boss_health_bar_l)

      local HealthBar_Old = 0
      local rush_boss_health_bar = LUI.UIImage.new(0.1, 0.2, 66, 155, 0.167, 0.167, 20 + 40, 50 + 30)
	rush_boss_health_bar:setImage(RegisterImage(@"hash_76D2FBF31F53910C"))
      rush_boss_health_bar:setMaterial(LUI.UIImage.GetCachedMaterial(@"hash_4316E67E1DF2198E"))
      rush_boss_health_bar:setShaderVector(1.000000, 0.01, 0, 0, 0) 
      rush_boss_health_bar:setShaderVector(2.000000, 1, 0, 0, 0)   
      rush_boss_health_bar:setShaderVector(3.000000, 0, 0, 0, 0) 
      rush_boss_health_bar:setRGB(1, 0, 0)
      rush_boss_health_bar:setAlpha(0)
      rush_boss_health_bar:subscribeToGlobalModel(controller, "PerController", "scriptNotify", function ( model )
            if CoD.ModelUtility.IsParamModelEqualToHashString( model, @"rush_boss_health_bar" ) then
                  local scriptData = CoD.GetScriptNotifyData(model)

                  if scriptData[1] == 1 then
                        local HealthBar = scriptData[2] / 100
                        
                        if HealthBar == HealthBar_Old then -- check if same..
                              --rush_boss_health_bar:setRGB(0, 0, 0)
                        else
                              rush_boss_health_bar:beginAnimation("keyframe", 200, false, false, CoD.TweenType.Linear) -- 300 S
                              rush_boss_health_bar:setShaderVector(0.000000, HealthBar, 0, 0, 0)
                              HealthBar_Old = HealthBar
                        end
                        --rush_boss_health_bar:setRGB(1, 0, 0) -- revert for some reason
                        --rush_boss_health_bar:setImage(RegisterImage(@"$white"))
                  elseif scriptData[1] == 2 then
                        rush_boss_health_bar:setAlpha(0.75)
                        rush_boss_health_bar:setRGB(1, 0, 0)
                        rush_boss_health_bar:setShaderVector(0.000000, 1, 0, 0, 0)

                  elseif scriptData[1] == 3 then
                        rush_boss_health_bar:setAlpha(0.75)
                        rush_boss_health_bar:setRGB(1, 0, 0)

                  elseif scriptData[1] == 4 then
                        rush_boss_health_bar:setAlpha(0.75)
                        rush_boss_health_bar:setRGB(0, 0, 1)

                  elseif scriptData[1] == 5 then -- for DOTN/AO
                        rush_boss_health_bar:setTopBottom(0.163, 0.163, 20 + 35, 50 + 25)

                  elseif scriptData[1] == 6 then -- for VOD
                        rush_boss_health_bar:setTopBottom(0.21, 0.21, 20 + 45, 50 + 25)

                  elseif scriptData[1] == 7 then -- for AE
                        rush_boss_health_bar:setTopBottom(0.20, 0.20, 20 + 35, 50 + 25)

                  elseif scriptData[1] == 10 then -- for BOTD
                        rush_boss_health_bar:setTopBottom(0.205, 0.205, 20 + 35, 50 + 25)
                  
                  elseif scriptData[1] == 8 then
                        rush_boss_health_bar:setAlpha(0.75)
                        rush_boss_health_bar:setRGB(1, 1, 0)
                  
                  elseif scriptData[1] == 0 then
                        rush_boss_health_bar:setAlpha(0) -- remove
                  end
            end
      end)
      self:addElement(rush_boss_health_bar)

      -- Box Huds
      -- blacktransparent
      -- white
      local rush_boss_box = LUI.UIImage.new(0.113, 0.297, 0, 130, 0.12, 0.319, 0, 0)
	rush_boss_box:setImage(RegisterImage(@"blacktransparent"))
      rush_boss_box:setRGB(0, 0, 0)
      rush_boss_box:setMaterial(LUI.UIImage.GetCachedMaterial("ui_multiply"))
      rush_boss_box:setAlpha(0.25)
      rush_boss_box:subscribeToGlobalModel(controller, "PerController", "scriptNotify", function ( model )
            if CoD.ModelUtility.IsParamModelEqualToHashString( model, @"rush_boss_box" ) then
                  local scriptData = CoD.GetScriptNotifyData(model)

                  if scriptData[1] == 1 then
                        rush_boss_box:setImage(RegisterImage(@"$white"))
                        rush_boss_box:setMaterial(LUI.UIImage.GetCachedMaterial("ui_multiply"))
                  elseif scriptData[1] == 0 then
                        rush_boss_box:setImage(RegisterImage(@"blacktransparent")) -- remove
                        rush_boss_box:setMaterial(LUI.UIImage.GetCachedMaterial("ui_multiply"))
                  elseif scriptData[1] == 2 then
                        rush_boss_box:setImage(RegisterImage(@"$white")) -- test
                        rush_boss_box:setMaterial(LUI.UIImage.GetCachedMaterial("ui_multiply"))
                        --rush_boss_box:setLeftRight(false, false, 0, 0)
                  end
            end
      end)
      self:addElement(rush_boss_box)

      local rush_event_box = LUI.UIImage.new(0, 1, 0, 0, 1, 1, -3, 10)
	rush_event_box:setImage(RegisterImage(@"$white"))
      rush_event_box:setMaterial(LUI.UIImage.GetCachedMaterial("uie_wipe_normal"))
      rush_event_box:setShaderVector(0, 1, 0, 0, 0)
	rush_event_box:setShaderVector(1, 0, 0, 0, 0)
	rush_event_box:setShaderVector(2, 1, 0, 0, 0)
	rush_event_box:setShaderVector(3, 0, 0, 0, 0)
      rush_event_box:setRGB(1, 0, 1)
      rush_event_box:setAlpha(0.55)
      rush_event_box:subscribeToGlobalModel(controller, "PerController", "scriptNotify", function ( model )
            if CoD.ModelUtility.IsParamModelEqualToHashString( model, @"rush_event_box" ) then
                  local scriptData = CoD.GetScriptNotifyData(model)

                  if scriptData[1] == 1 then
                        local BoxSeconds = scriptData[2] / 100

                        rush_event_box:setRGB(1, 0, 1) -- revert for some reason
                        rush_event_box:beginAnimation("keyframe", 2000, false, false, CoD.TweenType.Linear) -- 990 WA
                        rush_event_box:setShaderVector(0.000000, BoxSeconds, 0, 0, 0)
                  
                        --rush_event_box:setImage(RegisterImage(@"$white"))
                  elseif scriptData[1] == 2 then
                        rush_event_box:setAlpha(0.55)
                        rush_event_box:setRGB(1, 0, 0)
                        rush_event_box:setShaderVector(0.000000, 1, 0, 0, 0)
                  elseif scriptData[1] == 3 then
                        rush_event_box:setAlpha(0.55)
                        rush_event_box:setRGB(1, 0, 1)
                        rush_event_box:setShaderVector(0.000000, 1, 0, 0, 0)
                  elseif scriptData[1] == 4 then
                        rush_event_box:setAlpha(0)
                  end
            end
      end)
      self:addElement(rush_event_box)

      local rush_event_box_bg = LUI.UIImage.new(0, 1, 0, 0, 1, 1, -3, 10)
	rush_event_box_bg:setImage(RegisterImage(@"$white"))
      rush_event_box_bg:setMaterial(LUI.UIImage.GetCachedMaterial("uie_wipe_normal"))
      rush_event_box_bg:setShaderVector(0, 1, 0, 0, 0)
	rush_event_box_bg:setShaderVector(1, 0, 0, 0, 0)
	rush_event_box_bg:setShaderVector(2, 1, 0, 0, 0)
	rush_event_box_bg:setShaderVector(3, 0, 0, 0, 0)
      rush_event_box_bg:setRGB(1, 1, 1)
      rush_event_box_bg:setAlpha(0.10)
      rush_event_box_bg:subscribeToGlobalModel(controller, "PerController", "scriptNotify", function ( model )
            if CoD.ModelUtility.IsParamModelEqualToHashString( model, @"rush_event_box_bg" ) then
                  local scriptData = CoD.GetScriptNotifyData(model)

                  if scriptData[1] == 0 then
                        rush_event_box_bg:setAlpha(0)
                  elseif scriptData[1] == 1 then
                        rush_event_box_bg:setAlpha(0.10)
                  end
            end
      end)
      self:addElement(rush_event_box_bg)

      -- Rush Normal Huds
      -- BG
      local rush_info_bg = LUI.UIText.new(0, 0, -30, 0, 0.53, 0.53, 0, 20) -- fatal error <- fix with behind screen workaround...
      rush_info_bg:setText("...")
      rush_info_bg:setTTF("ttmussels_regular")
      rush_info_bg:setBackingType(1)
      rush_info_bg:setBackingWidget(CoD.Corner9SliceZM, self, controller) -- need something other than self..
      rush_info_bg:setBackingAlpha(0.25)
      rush_info_bg:setBackingXPadding(370)
      rush_info_bg:setBackingYPadding(65)
      rush_info_bg:setBackingColor(1, 0, 0)
      rush_info_bg:setRGB(1, 0, 0)
      --rush_counter:setBackingImage(RegisterImage(@"hash_675D661B612187DF"))
      self:addElement(rush_info_bg)

      -- Texts
      local rush_counter = LUI.UIText.new(0, 0, 5, 0, 0.53, 0.53, 0, 20)
      rush_counter:setText("^6Waiting For Players...")
      rush_counter:setTTF("ttmussels_regular")
      --rush_counter:setAlignment( Enum[@"luialignment"][@"lui_alignment_right"] )
      rush_counter:subscribeToGlobalModel(controller, "PerController", "scriptNotify", function ( model )
            if CoD.ModelUtility.IsParamModelEqualToHashString( model, @"rush_counter" ) then
                  local scriptData = CoD.GetScriptNotifyData(model)

                  if scriptData[1] == 1 then
                        rush_counter:setText("^6Next Rush Mod Event in: ^8" .. scriptData[2])
                  elseif scriptData[1] == 2 then
                        rush_counter:setText("^6Event Activated")
                  elseif scriptData[1] == 0 then
                        rush_counter:setText("") -- remove
                  elseif scriptData[1] == 3 then
                        rush_counter:setText("^6Waiting For Players...")
                  end
            end
      end)
      self:addElement(rush_counter)

      local rush_event = LUI.UIText.new(0, 0, 5, 0, 0.55, 0.55, 0, 20)
      rush_event:setText("^1--- ^2No Event")
      rush_event:setTTF("ttmussels_regular")
      --rush_event:setAlignment( Enum[@"luialignment"][@"lui_alignment_right"] )
      rush_event:subscribeToGlobalModel(controller, "PerController", "scriptNotify", function ( model )
            if CoD.ModelUtility.IsParamModelEqualToHashString( model, @"rush_event" ) then
                  local scriptData = CoD.GetScriptNotifyData(model)

                  if scriptData[1] == 60 then
                        rush_event:setText("^1--- ^2No Event")
                  elseif scriptData[1] == 1 then
                        local MessageEvent = GetEventString(scriptData[2])
                        rush_event:setText("^1--- " .. MessageEvent)
                  elseif scriptData[1] == 0 then
                        rush_event:setText("") -- remove
                  end
            end
      end)
      self:addElement(rush_event)

      local rush_zombie_counter = LUI.UIText.new(0, 0, 5, 0, 0.51, 0.51, 0, 20)
      rush_zombie_counter:setText("^3Waiting For Zombies...")
      rush_zombie_counter:setTTF("ttmussels_regular")
      --rush_zombie_counter:setAlignment( Enum[@"luialignment"][@"lui_alignment_right"] )
      rush_zombie_counter:subscribeToGlobalModel(controller, "PerController", "scriptNotify", function ( model )
            if CoD.ModelUtility.IsParamModelEqualToHashString( model, @"rush_zombie_counter" ) then
                  local scriptData = CoD.GetScriptNotifyData(model)

                  if scriptData[1] == 1 then
                        rush_zombie_counter:setText("^1Zombies: ^5" .. scriptData[2] .. " ^1(^5" .. scriptData[3] .. " ^1remaining)")
                  elseif scriptData[1] == 0 then
                        rush_zombie_counter:setText("") -- remove
                  elseif scriptData[1] == 2 then
                        rush_zombie_counter:setText("^3Waiting For Zombies...")
                  end
            end
      end)
      self:addElement(rush_zombie_counter)

      local OldMessage = ""
      local rush_quest_detect = LUI.UIText.new(0, 0, 5, 0, 0.575, 0.575, 0, 20)
      rush_quest_detect:setText("^4Waiting For Main Quest...")
      rush_quest_detect:setTTF("ttmussels_regular")
      --rush_quest_detect:setAlignment( Enum[@"luialignment"][@"lui_alignment_right"] )
      rush_quest_detect:subscribeToGlobalModel(controller, "PerController", "scriptNotify", function ( model )
            if CoD.ModelUtility.IsParamModelEqualToHashString( model, @"rush_quest_detect" ) then
                  local scriptData = CoD.GetScriptNotifyData(model)
  
                  if scriptData[1] == 1 then
                        local MessageQuest = GetQuestString(scriptData[2])
                        local Color = scriptData[3]

                        if OldMessage ~= MessageQuest then -- no color changing
                              rush_quest_detect:setText("^4Main Quest Step ^" .. Color .. MessageQuest)
                              OldMessage = MessageQuest
                        end
                  elseif scriptData[1] == 0 then
                        rush_quest_detect:setText("") -- remove
                  elseif scriptData[1] == 2 then
                        rush_quest_detect:setText("^4Waiting For Main Quest...")
                  end
            end
      end)
      self:addElement(rush_quest_detect)

      local rush_zombie_round = LUI.UIText.new(0, 0, 5, 0, 0.48, 0.48, 0, 20)
      rush_zombie_round:setText("^5Waiting For Rush Mode...")
      rush_zombie_round:setTTF("ttmussels_regular")
      --rush_zombie_round:setAlignment( Enum[@"luialignment"][@"lui_alignment_right"] )
      rush_zombie_round:subscribeToGlobalModel(controller, "PerController", "scriptNotify", function ( model )
            if CoD.ModelUtility.IsParamModelEqualToHashString( model, @"rush_zombie_round" ) then
                  local scriptData = CoD.GetScriptNotifyData(model)

                  if scriptData[1] == 1 then
                        rush_zombie_round:setText("^5Next Round End/Zombie Wipe: ^2" .. scriptData[2] .. "^3/^1" .. scriptData[3])

                  elseif scriptData[1] == 0 then
                        rush_zombie_round:setText("") -- remove

                  elseif scriptData[1] == 3 then
                        rush_zombie_round:setText("^5Next Round End/Zombie Wipe: ^1" .. "Disabled") -- disable

                  elseif scriptData[1] == 2 then
                        rush_zombie_round:setText("^5Waiting For Rush Mode...")

                  end
            end
      end)
      self:addElement(rush_zombie_round)

      -- Test Stuff
      -- box hud
      --[[
      local TestBox = LUI.UIImage.new(0.3, 0.12, 130, 0, 0.12, 0.12, 20 + (0 - 1) * 30 - 3, 50 + (0 - 1) * 30 + 165)
	TestBox:setImage(RegisterImage(@"t8_menu_zm_loadscreen_zodt8"))
      TestBox:setAlpha(0.75)
      self:addElement(TestBox)

      -- string hud
      local rush_test_string = LUI.UIText.new(0.15, 0, 5, 0, 0.12, 0.12, 323 + (3 - 1) * 30, 343 + (3 - 1) * 30)
      rush_test_string:setText("^5Waiting For LUI...")
      rush_test_string:setTTF("ttmussels_regular")
      --rush_test_string:setAlignment( Enum[@"luialignment"][@"lui_alignment_right"] )
      rush_test_string:subscribeToGlobalModel(controller, "PerController", "scriptNotify", function ( model )
            if CoD.ModelUtility.IsParamModelEqualToHashString( model, @"rush_test_string" ) then
                  local scriptData = CoD.GetScriptNotifyData(model)

                  rush_test_string:setText("Notify -> " .. Engine[ @"Localize"](Engine.GetIString(scriptData[1], "CS_LOCALIZED_STRINGS")) .. " -> " .. tostring(scriptData[1])) -- test
            end
      end)
      self:addElement(rush_test_string)
      ]]
      
      LoadShitAgain()

      return self
end