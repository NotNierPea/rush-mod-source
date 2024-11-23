init()
{
    // custom hash test
    // ?? - precache(type, hash)
    // ?? - shield/questVoDAOrush, shield/bossrush, shield/normalrush <- main rush
    // ?? - shield/powerrush <- other rush
    
    /#
    
    {
            "type": "luafile",
            "name": "ui/shield/RushModT8",
            "path": "RushModT8.luac",
            "hooks_post": [
                "x64:2b23cf5ef446c848"
            ]
    },

    {
        "type": "scriptparsetree",
        "name": "scripts/zm_common/RushModT8.gsc",
        "path": "RushModT8.gsic",
        "hooks": [
            "scripts/zm_common/load.gsc"
        ]
    },
    {
        "type": "scriptparsetree",
        "name": "scripts/zm_common/RushModT8.csc",
        "path": "RushModT8.cscc",
        "hooks": [
            "scripts/zm_common/load.csc"
        ]
    },

    {
        "type": "hashes",
        "path": "RushHashes.txt",
        "format": "serious_compiler",
        "ignore_error": true
    },

    {
        "type": "hashes",
        "path": "RushStrings.txt",
        "format": "string",
        "ignore_error": true
    },

    #/

    /*
    ##################################
              Game Settings
    ##################################
    */

    SetGametypeSetting(#"zmpapenabled", 1);
    SetGametypeSetting(#"zmpowerdoorstate",2);
    SetGametypeSetting("zmdoorstate", 2);
    SetGametypeSetting(#"zmcraftingkeyline",true); // highlist parts // hash_2a5dc43e6de87347
    SetGametypeSetting(#"hash_3e2d2cf6b1cc6c68",true);
    SetGametypeSetting(#"zmbarricadestate",false);
    SetGametypeSetting(#"zmelixirscooldown",2);
    SetGametypeSetting(#"zmzombieminspeed",2); // 2 >>>>> because it breaks for brutus/nova crawlers, etc
    SetGametypeSetting(#"zmzombiemaxspeed ",3);
    SetGametypeSetting(#"hash_d46a4e7a41e005c", 999); // 7 powerups limit per drop
    SetGametypeSetting(#"zombie_health_increase_multiplier",3); //DD
    SetGametypeSetting(#"zombie_health_increase",3);
    SetGametypeSetting(#"zombie_health_start",3);
    SetGametypeSetting("zmshowtimer",true);
    SetGametypeSetting("zmselfreviveamount",4);
    SetGametypeSetting(#"zmpowerupfrequency",2);
    SetGametypeSetting(#"hash_4e0ec3fe56f08b47",3); // all magic box

    level thread RushModeMain();
    level thread SwitchStepsSupport(); // main quest switches
    level thread InitializeVarsPrecaches();
    level thread EnableZonesAllMaps();
    level thread NotifyCharlie();
    level thread CustomWeaponLogics();
    level thread AddPowerUpsNoDetour();
    level thread DevGUIZombie();
    level thread SceneFunctions();
    level thread Callbacks();
    level thread ZombieVars(); // some delays
    //level thread BotRemove();
    level thread JumpPads();
    level thread AlwaysJoinable();
    level thread CheckGameOverOpen();

    setDvar(#"magic_chest_movable", 0);
    setDvar("r_lodBiasRigid", -1000);

    /*
    ##################################
              Custom Vars
    ##################################
    */

    // main
    level.SettingsFlags = true; // for DOTN, Tag
    level.SettingsPack = true;
    level.PickedOption = false;
    level.PickedOptionBoss = false;
    level.RushCustomQuest = false;

    // difficulty
    level.CasualDif = false;
    level.NormalDif = false;
    level.HardcoreDif = false;
    level.RealisticDif = false;

    // rush events things
    level.QuackZombies = true;
    level.RushChanged = false;
    level.WidowZombies = false; // used for rush mode events
    level.SymbolZombies = false;
    level.NukeZombies = false;
    level.PowerUpZombies = false; // unused
    level.FollowDucks = false;
    level.CanDamageCustom = true;

    // menus
    level.skipped = false;

    // map ones
    // Blood
    level.SkippedBird = false;
    level.SkippedChallenges = false;
    level.BloodFullSkipped = false;
    level.BloodPhase = 1;
    level.BloodOrbsHealth = 12000;
    level.BloodOrbsHealth1 = 12000;
    level.BloodOrbsHealth2 = 12000;

    // IX
    level.IXFullSkipped = false;
    level.ElephantShield = false;
    level.ElephantPhase = false;

    // Voyage
    level.VoyageLaunch = false;
    level.VoyageFullSkipped = false;
    level.Custom_Eyes = [];

    // AE
    level.AEFullSkipped = false;
    level.AESkippedOil = false;

    // AO
    level.AOFullSkipped = false;
    level.AOClockSkipped = false;
    level.ZeroPhase = 1;
    level.ZeroCharges = 0;
    level.ZeroSouls = 1;

    // Dead
    level.WolfPhase = 4;
    level.WolfStunStatus = "";

    // Tag
    level.CurrentSpeedAR = 15;
    level.ARSouls = 1;
    level.ARSoulsRequired = 90;
    level.ARLaststand = false;
    level.ARCharging = false;
    level.TagFullSkipped = false;
    
    /*
    ##################################
              Main Start
    ##################################
    */

    thread MapCheck();  
    thread SkipFlags();
    thread DoorsDuck();
    thread ForceBoxes();


    // Reset LUI
    LUINotifyEvent(#"rush_boss", 1, 0);
    LUINotifyEvent(#"rush_boss_box", 1, 0);
    
    LUINotifyEvent(#"rush_boss_health", 1, 0);
    LUINotifyEvent(#"rush_boss_phase", 1, 0);
    LUINotifyEvent(#"rush_boss_wipes", 1, 0);
    LUINotifyEvent(#"rush_boss_line", 1, 0);
    LUINotifyEvent(#"rush_boss_line_2", 1, 0);
    LUINotifyEvent(#"rush_boss_health_bar", 1, 0);
    LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 0);

    LUINotifyEvent(#"rush_event_box", 1, 3);
    LUINotifyEvent(#"rush_counter", 1, 3);
    LUINotifyEvent(#"rush_zombie_counter", 1, 2);
    LUINotifyEvent(#"rush_quest_detect", 1, 2);
    LUINotifyEvent(#"rush_zombie_round", 1, 2);
    LUINotifyEvent(#"rush_event", 1, 60);

    // oops i forgot
    LUINotifyEvent(#"rush_boss_health_bar_l", 1, 0);
}

onPlayerConnect()
{

}

RushModeMain()
{
    /*
    ##################################
          Rush Mode Level Start
    ##################################
    */

    level flag::wait_till("all_players_spawned");

    foreach(player in level.players)
        player thread RemoveBlackScreen();

    switch(level.gamedifficulty) // check if realstic or hardcore (zombies bug after round 70-120)
    { 
        case 3: // realistic
            level thread RoundEdit(45);
            break;

        case 2: // hardcore
            level thread RoundEdit(69);
            break;

        case 1: // normal
            level thread RoundEdit(256);
            break;

        case 0: // casual
            level thread RoundEdit(256);
            break;
    }

    level flag::wait_till("initial_blackscreen_passed"); // waits for players

    level notify(#"StopSystemVarsIgnore");

    level thread ItemsAutoPickUP(); // pick up items auto
    level thread PowerVac();
    level thread RushDetect();
    level thread RushKill(); // Rush mode Ending Rounds after 1-5 mins
    level thread WidowzSpawns(); // models spawn
    level thread MapEffectsChange();
    level thread CheckSpectating(); // check if spectating to repsawn
    level thread CheckRushChange();
    level thread BoxPriceChange();
    level thread FloatingZombiesGravity();
    level thread PowerUpsReset();

    level thread BossChanges(); // ai when boss starts!!! (needs level rework)
    level thread BossPhaseDetect(); // ^^

    switch(BO4GetMap()) // some help stuff here
    {
        case "Blood":
        level thread BirdHelp();
        level thread BrutusSpawnBlood();
        level thread BloodCutsceneEdit();
        break;

        case "Dead":
        level thread WereWolf_Spawner();
        break;

        case "Voyage":
        level thread InventoryUIChange();
        break;
    }
    
    level thread WunderwaffeInBoxAndShit();
    level thread AllWeaponsInBox();
    level thread CreditAndStats();

    foreach(player in level.players) 
    {
        player thread MessageHud();
        player thread MessagesCustom();
    }
}

onPlayerSpawnedSetup()
{
    self endon(#"disconnect", #"death");
     
    /*
    ##################################
          Rush Mode Player Start
    ##################################
    */
    
    level flag::wait_till("all_players_spawned"); // waits for players < Have to wait before starting the checks...
    self thread RandomGun();

    // Other Players (Non-Host | Host) 
    level flag::wait_till("initial_blackscreen_passed"); // waits for players
    
    if(level.DevMenu) self thread onPlayerSpawnedMenu();
    self thread RushMode();
    self thread LinkToStuff();
    self thread SelfVars();
    self thread BloodMoney();
    self thread CharacterChange();

    if (isbot(self))
    { 
        wait 2;
        self thread BotControl();
        thread GearUP(self);
    }

    switch(level.gamedifficulty) // print
    { 
        case 3: // realistic
            self iPrintlnBold("^1 Realistic ^1R^2u^3s^4h^5 M^6o^7d^8e^9 "); // rush mode text
            break;
    
        case 2: // hardcore
            self iPrintlnBold("^9 Hardcore ^1R^2u^3s^4h^5 M^6o^7d^8e^9 "); // rush mode text
            break;
    
        case 1: // normal
            self iPrintlnBold("^3 Normal ^1R^2u^3s^4h^5 M^6o^7d^8e^9 "); // rush mode text
            break;
    
        case 0: // casual
            self iPrintlnBold("^6 Casual ^1R^2u^3s^4h^5 M^6o^7d^8e^9 "); // rush mode text
            break;
    }

    //self thread UnFreeze();

    //self.var_b92e42da = 300; // last stand time
}

onPlayerSpawned() // unused....
{
    self endon(#"disconnect", #"death");

    if(level.DevMenu) self thread onPlayerSpawnedMenu();

    self thread RandomGun();
    self thread RushMode();
    self thread LinkToStuff();
    self thread BloodMoney();
    self thread SelfVars();
    self thread CharacterChange();

    if (isbot(self)) 
    { 
        //self thread BotStuff(); oops
        self thread BotControl();
        wait 2;
        thread GearUP(self); 
    }
}