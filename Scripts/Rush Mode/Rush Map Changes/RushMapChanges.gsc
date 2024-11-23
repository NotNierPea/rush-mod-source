MapEffectsChange()
{
    if (BO4GetMap() == "Dead")
    {
        wait 10;
        while(true)
        {
            util::set_lighting_state(0);
            wait 30;
            util::set_lighting_state(1);
            wait 30;
        }
    }

    if(BO4GetMap() == "Voyage")
    {
        level endon(#"hash_25d8c88ff3f91ee5");
        level notify(#"force_transformations");
        while(true) // flashing
        {
            level clientfield::set("bs_gr_fog_fx_cf", 0);
            level clientfield::set("poop_deck_chillout_decals", 0);
            level clientfield::set("state_rooms_chillout_decals", 0);
            foreach(player in level.players) player clientfield::set("bs_player_snow_cf", 3);
            foreach(player in level.players) player clientfield::set("bs_player_ice_br_cf", 1);
            wait 15;
            level clientfield::set("bs_gr_fog_fx_cf", 1);
            level clientfield::set("poop_deck_chillout_decals", 1);
            level clientfield::set("state_rooms_chillout_decals", 1);
            foreach(player in level.players) player clientfield::set("bs_player_snow_cf", 1);
            foreach(player in level.players) player clientfield::set("bs_player_ice_br_cf", 0);
            wait 15;
        }
    }

    if(BO4GetMap() == "IX")
    {
        wait 10;
        e_gateW = getent("arena_gate_west", "targetname");
        v_amount = vectorscale(e_gateW.script_vector, 1);
        e_gateW moveto(e_gateW.origin + v_amount, 3);
        e_gateW playsound(#"hash_1259041350e5f60d");
        e_gateE = getent("arena_gate_east", "targetname");
        v_amount = vectorscale(e_gateE.script_vector, 1);
        e_gateE moveto(e_gateE.origin + v_amount, 3);
        e_gateE playsound(#"hash_1259041350e5f60d");

        wait 5;
        while(true) // lightning state
        {
            wait 30;
            level clientfield::set("special_round_smoke", 1);
            level notify(#"kill_special_round_fog");
            util::set_lighting_state(1);
            wait 30;
            level clientfield::set("special_round_smoke", 0);
            util::set_lighting_state(0);
        }
    }

    if(BO4GetMap() == "Tag") // hell
    {
        while(true)
        {
            wait 60;
            setlightingstate(0);
            wait 60;
            setlightingstate(1);
        }
    }

    if(BO4GetMap() == "AE") // fix
    {
        wait 10;
        level.var_6e5099bb = 3;
    }

    if(BO4GetMap() == "Blood") // random stuff
    {
        level.lighting_state = 0;
        util::set_lighting_state(level.lighting_state);
        //level clientfield::set("dog_round_fog_bank", 0);
        wait 30;
        level.lighting_state = 2;
        util::set_lighting_state(level.lighting_state);
        //level clientfield::set("dog_round_fog_bank", 1);
        wait 30;
    }
}

DOTNDvar()
{
    setdvar(#"hash_44340be18f159be3", 1);
}

DoorsDuck()
{
    zombie_doors = getentarray("zombie_door", "targetname");

    for (i = 0; i < zombie_doors.size; i++) 
    {
        if (RandomIntRange(0, 3) == 0)
        {
            Duck = util::spawn_model("p8_zm_red_floatie_duck", zombie_doors[i].origin + (0, 0, 0));
            Duck rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
        }
    }
}

SpawnPointsIXRandom()
{
    self endon(#"disconnect");
    level endon(#"end_game", #"game_ended");

    randomspawn = randomIntRange(1, 5);
    randomspawn2 = randomIntRange(1, 5);
    randomspawn3 = randomIntRange(1, 5);
    randomspawn4 = randomIntRange(1, 5);

    NumberEnitity = self getentitynumber();
    switch (NumberEnitity)
    {
        case 0:
        switch(randomspawn)
        {
            case 1:
            v_position = (151.776, 1802.6, -365.875) + (randomIntRange(10, 20), 0, 0);
            break;

            case 2:
            v_position = (1993.89, -479.343, 212.125) + (randomIntRange(10, 20), 0, 0);
            break;

            case 3:
            v_position = (2020.7, 341.974, 215.125) + (randomIntRange(10, 20), 0, 0);
            break;

            case 4:
            v_position = (58.3157, -24.4512, 80.125) + (randomIntRange(10, 20), 0, 0);
            break;
        }
        break;
        case 1:
        switch(randomspawn2)
            {
                case 1:
                v_position = (151.776, 1802.6, -365.875) + (randomIntRange(10, 20), 0, 0);
                break;

                case 2:
                v_position = (1993.89, -479.343, 212.125) + (randomIntRange(10, 20), 0, 0);
                break;

                case 3:
                v_position = (2020.7, 341.974, 215.125) + (randomIntRange(10, 20), 0, 0);
                break;

                case 4:
                v_position = (58.3157, -24.4512, 80.125) + (randomIntRange(10, 20), 0, 0);
                break;
            }
        break;
        case 2:
        switch(randomspawn3)
            {
                case 1:
                v_position = (151.776, 1802.6, -365.875) + (randomIntRange(10, 20), 0, 0);
                break;

                case 2:
                v_position = (1993.89, -479.343, 212.125) + (randomIntRange(10, 20), 0, 0);
                break;

                case 3:
                v_position = (2020.7, 341.974, 215.125) + (randomIntRange(10, 20), 0, 0);
                break;

                case 4:
                v_position = (58.3157, -24.4512, 80.125) + (randomIntRange(10, 20), 0, 0);
                break;
            }
        break;
        case 3:
        switch(randomspawn4)
            {
                case 1:
                v_position = (151.776, 1802.6, -365.875) + (randomIntRange(10, 20), 0, 0);
                break;

                case 2:
                v_position = (1993.89, -479.343, 212.125) + (randomIntRange(10, 20), 0, 0);
                break;

                case 3:
                v_position = (2020.7, 341.974, 215.125) + (randomIntRange(10, 20), 0, 0);
                break;

                case 4:
                v_position = (58.3157, -24.4512, 80.125) + (randomIntRange(10, 20), 0, 0);
                break;
            }
            break;
            }
        if (isdefined(v_position))
        {
            self thread SetRandomOrigin(v_position);
            if (randomIntRange(0, 2) == 1)
            {
                self thread zm_vo::function_a2bd5a0c(#"hash_30b4404eefd745f5", 0, 0, 9999, 1);
            }
            else
            {
                self thread zm_vo::function_a2bd5a0c(#"hash_671a04c9b101659c", 0, 0, 9999, 1);
            }
        }
}

DeadRandomSpawns()
{
        randomspawn = randomIntRange(1, 5);
        randomspawn2 = randomIntRange(1, 5);
        randomspawn3 = randomIntRange(1, 5);
        randomspawn4 = randomIntRange(1, 5);

        NumberEnitity = self getentitynumber();
        switch (NumberEnitity) 
        {
        case 0:
        switch(randomspawn)
        {
            case 1:
            v_position = (-2.56008, -928.784, -7.875) + (randomIntRange(10, 20), 0, 0);
            break;

            case 2:
            v_position = (1727.24, 1165.29, -7.875) + (randomIntRange(10, 20), 0, 0);
            break;

            case 3:
            v_position = (-13.9522, 5562.84, -783.936) + (randomIntRange(10, 20), 0, 0);
            break;

            case 4:
            v_position = (4356.48, -73.3307, -439.875) + (randomIntRange(10, 20), 0, 0);
            break;
        }
        break;
        case 1:
        switch(randomspawn2)
        {
            case 1:
            v_position = (-2.56008, -928.784, -7.875) + (randomIntRange(10, 20), 0, 0);
            break;

            case 2:
            v_position = (1727.24, 1165.29, -7.875) + (randomIntRange(10, 20), 0, 0);
            break;

            case 3:
            v_position = (-13.9522, 5562.84, -783.936) + (randomIntRange(10, 20), 0, 0);
            break;

            case 4:
            v_position = (4356.48, -73.3307, -439.875) + (randomIntRange(10, 20), 0, 0);
            break;
        }
        break;
        case 2:
        switch(randomspawn3)
        {
            case 1:
            v_position = (-2.56008, -928.784, -7.875) + (randomIntRange(10, 20), 0, 0);
            break;

            case 2:
            v_position = (1727.24, 1165.29, -7.875) + (randomIntRange(10, 20), 0, 0);
            break;

            case 3:
            v_position = (-13.9522, 5562.84, -783.936) + (randomIntRange(10, 20), 0, 0);
            break;

            case 4:
            v_position = (4356.48, -73.3307, -439.875) + (randomIntRange(10, 20), 0, 0);
            break;
        }
        break;
        case 3:
        switch(randomspawn4)
        {
            case 1:
            v_position = (-2.56008, -928.784, -7.875) + (randomIntRange(10, 20), 0, 0);
            break;

            case 2:
            v_position = (1727.24, 1165.29, -7.875) + (randomIntRange(10, 20), 0, 0);
            break;

            case 3:
            v_position = (-13.9522, 5562.84, -783.936) + (randomIntRange(10, 20), 0, 0);
            break;

            case 4:
            v_position = (4356.48, -73.3307, -439.875) + (randomIntRange(10, 20), 0, 0);
            break;
        }
        break;
        }
        if (isdefined(v_position))
        {
            self SetRandomOrigin(v_position);
        }
}

AlphaOmegaSpawnPoints()
{
    struct::get_array("initial_spawn", "script_noteworthy")[0].origin = (42,-6255,-73);
    struct::get_array("initial_spawn", "script_noteworthy")[0].angles = (0,90,0);
    struct::get_array("initial_spawn", "script_noteworthy")[1].origin = (42,-6375,-73);
    struct::get_array("initial_spawn", "script_noteworthy")[1].angles = (0,90,0);
    struct::get_array("initial_spawn", "script_noteworthy")[2].origin = (42,-6215,-73);
    struct::get_array("initial_spawn", "script_noteworthy")[2].angles = (0,90,0);
    struct::get_array("initial_spawn", "script_noteworthy")[3].origin = (42,-6315,-73);
    struct::get_array("initial_spawn", "script_noteworthy")[3].angles = (0,90,0);

    // triggers
    thread Spawn_RushTrigger((-71,-5900,-70), "shield/questVoDAOrush", (0,0,0),#"p7_zm_vending_widows_wine", &SkipAOClock, 5, true);
    thread Spawn_RushTrigger((30,-5900,-70), "shield/normalrush", (0,0,0),#"p7_zm_vending_packapunch", &NonSkipAOClock, 5);
    thread Spawn_RushTrigger((137,-5900,-70), "shield/bossrush", (0,0,0),#"p7_zm_vending_sleight", &BossSkipAO, 5);

    thread Spawn_RushNormalTrigger((-71,-6483,-70), "shield/rushpap", (0,180,0),#"p7_zm_vending_packapunch", &UpgradeWeapon, undefined, 1);
    thread Spawn_RushNormalTrigger((137,-6483,-70), "shield/powerrush", (0,180,0),#"p7_zm_vending_widows_wine", &GearUpPower);

    // weapons and stuff
    thread Spawn_RushWeapon((-250,-5930,-50),(0,45,0),#"cymbal_monkey");
    thread Spawn_RushWeapon((-300,-5930,-50),(0,-90,0),#"zhield_dw");
    thread Spawn_RushWeapon((-350,-5930,-50),(0,-90,0),#"launcher_standard_t8");

    thread Spawn_RushWeapon((-400,-5930,-50),(0,-90,0),#"ray_gun_mk2v");
    thread Spawn_RushWeapon((-400,-5960,-50),(0,-90,0),#"ray_gun_mk2x");
    thread Spawn_RushWeapon((-400,-5990,-50),(0,-90,0),#"ray_gun_mk2y");
    thread Spawn_RushWeapon((-400,-6020,-50),(0,-90,0),#"ray_gun_mk2z");
    thread Spawn_RushWeapon((-400,-6050,-50),(0,-90,0),#"ray_gun");
    thread Spawn_RushWeapon((-400,-6080,-50),(0,-90,0),#"ray_gun_mk2");

    thread Spawn_RushWeapon((-450,-5930,-50),(0,45,0),#"special_ballisticknife_t8_dw");
    thread Spawn_RushWeapon((-450,-5960,-50),(0,45,0),#"special_crossbow_t8");
    thread Spawn_RushWeapon((-450,-5990,-50),(0,45,0),#"shotgun_pump_t8");
    thread Spawn_RushWeapon((-450,-6020,-50),(0,45,0),#"shotgun_semiauto_t8");
    thread Spawn_RushWeapon((-450,-6050,-50),(0,45,0),#"shotgun_trenchgun_t8");
    thread Spawn_RushWeapon((-450,-6080,-50),(0,45,0),#"shotgun_fullauto_t8");
    thread Spawn_RushWeapon((-450,-6110,-503),(0,45,0),#"shotgun_precision_t8");

    thread Spawn_RushWeapon((-500,-5930,-50),(0,45,0),#"ar_accurate_t8");
    thread Spawn_RushWeapon((-500,-5960,-50),(0,45,0),#"ar_fastfire_t8");
    thread Spawn_RushWeapon((-500,-5990,-50),(0,45,0),#"ar_damage_t8");
    thread Spawn_RushWeapon((-500,-6020,-50),(0,45,0),#"ar_stealth_t8");
    thread Spawn_RushWeapon((-500,-6050,-50),(0,45,0),#"ar_modular_t8");
    thread Spawn_RushWeapon((-500,-6080,-50),(0,45,0),#"ar_mg1909_t8");
    thread Spawn_RushWeapon((-500,-6110,-50),(0,45,0),#"ar_standard_t8");
    thread Spawn_RushWeapon((-500,-6140,-50),(0,45,0),#"ar_galil_t8");
    thread Spawn_RushWeapon((-500,-6170,-50),(0,45,0),#"ar_peacekeeper_t8");
    thread Spawn_RushWeapon((-500,-6200,-50),(0,45,0),#"ar_doublebarrel_t8");
    thread Spawn_RushWeapon((-500,-6230,-50),(0,45,0),#"ar_an94_t8");

    thread Spawn_RushWeapon((-550,-5930,-50),(0,45,0),#"smg_folding_t8");
    thread Spawn_RushWeapon((-550,-5960,-50),(0,45,0),#"smg_drum_pistol_t8");
    thread Spawn_RushWeapon((-550,-5990,-50),(0,45,0),#"smg_accurate_t8");
    thread Spawn_RushWeapon((-550,-6020,-50),(0,45,0),#"smg_fastfire_t8");
    thread Spawn_RushWeapon((-550,-6050,-50),(0,45,0),#"smg_capacity_t8");
    thread Spawn_RushWeapon((-550,-6080,-50),(0,45,0),#"smg_handling_t8");
    thread Spawn_RushWeapon((-550,-6110,-50),(0,45,0),#"smg_standard_t8");
    thread Spawn_RushWeapon((-550,-6140,-50),(0,45,0),#"smg_minigun_t8");
    thread Spawn_RushWeapon((-550,-6170,-50),(0,45,0),#"smg_vmp_t8");
    thread Spawn_RushWeapon((-550,-6200,-50),(0,45,0),#"smg_fastburst_t8");
    thread Spawn_RushWeapon((-550,-6230,-50),(0,45,0),#"smg_mp40_t8");
    //thread Spawn_RushWeapon((-6481,-750,-1650),(0,45,0),#"smg_thompson_t8");

    thread Spawn_RushWeapon((-600,-5930,-50),(0,45,0),#"tr_powersemi_t8");
    thread Spawn_RushWeapon((-600,-5960,-50),(0,45,0),#"tr_longburst_t8");
    thread Spawn_RushWeapon((-600,-5990,-50),(0,45,0),#"tr_midburst_t8");
    thread Spawn_RushWeapon((-600,-6020,-50),(0,45,0),#"lmg_heavy_t8");
    thread Spawn_RushWeapon((-600,-6050,-50),(0,45,0),#"lmg_spray_t8");
    thread Spawn_RushWeapon((-600,-6080,-50),(0,45,0),#"lmg_standard_t8");
    thread Spawn_RushWeapon((-600,-6110,-50),(0,45,0),#"pistol_standard_t8");
    thread Spawn_RushWeapon((-600,-6140,-50),(0,45,0),#"pistol_topbreak_t8");
    thread Spawn_RushWeapon((-600,-6170,-50),(0,45,0),#"tr_damageburst_t8");
    thread Spawn_RushWeapon((-600,-6200,-50),(0,45,0),#"tr_leveraction_t8");
    thread Spawn_RushWeapon((-600,-6230,-50),(0,45,0),#"tr_flechette_t8");

    thread Spawn_RushWeapon((-650,-5930,-50),(0,45,0),#"sniper_fastrechamber_t8");
    thread Spawn_RushWeapon((-650,-5960,-50),(0,45,0),#"sniper_powerbolt_t8");
    thread Spawn_RushWeapon((-650,-5990,-50),(0,45,0),#"sniper_powersemi_t8");
    thread Spawn_RushWeapon((-650,-6020,-50),(0,45,0),#"sniper_quickscope_t8");
    thread Spawn_RushWeapon((-650,-6050,-50),(0,45,0),#"sniper_mini14_t8");
    thread Spawn_RushWeapon((-650,-6080,-50),(0,45,0),#"sniper_locus_t8");
    thread Spawn_RushWeapon((-650,-6110,-50),(0,45,0),#"sniper_damagesemi_t8");
    thread Spawn_RushWeapon((-650,-6140,-50),(0,45,0),#"pistol_revolver_t8");
    thread Spawn_RushWeapon((-650,-6170,-50),(0,45,0),#"pistol_burst_t8");
    thread Spawn_RushWeapon((-650,-6200,-50),(0,45,0),#"pistol_fullauto_t8");
    thread Spawn_RushWeapon((-650,-6230,-50),(0,45,0),#"lmg_double_t8");
    thread Spawn_RushWeapon((-650,-6260,-50),(0,45,0),#"lmg_stealth_t8");

    thread AOMessage();

    comp = struct::get("hal_trigger", "targetname");
    duckie = util::spawn_model("p8_zm_red_floatie_duck", comp.origin + (0, 0, 50), comp.angles);
    duckie SetScale(2);

    s_switch = struct::get("crawler_switch", "targetname");

    duckie = util::spawn_model("p8_zm_red_floatie_duck", s_switch.origin + (0, 0, 50), comp.angles);
    duckie SetScale(2);
}

EnableZonesAllMaps()
{
    if(BO4GetMap() == "Tag")
    {
        level flag::wait_till("all_players_spawned");
        zm_zonemgr::enable_zone("beach");
    }

    if(BO4GetMap() == "Voyage")
    {
        level flag::wait_till("all_players_spawned");
        zm_zonemgr::enable_zone("zone_galley");
        zm_zonemgr::enable_zone("zone_dining_hall_aft");
        zm_zonemgr::enable_zone("zone_dining_hall_fore");
        zm_zonemgr::enable_zone("zone_aft_deck");
        zm_zonemgr::enable_zone("zone_aft_deck_lower");
        zm_zonemgr::enable_zone("zone_sun_deck_port");
        zm_zonemgr::enable_zone("zone_mid_deck");
        zm_zonemgr::enable_zone("zone_fore_deck");
        zm_zonemgr::enable_zone("zone_poop_deck_lower");
        zm_zonemgr::enable_zone("zone_poop_deck");
    }

    if(BO4GetMap() == "AO")
    {
        level flag::wait_till("all_players_spawned");
        zm_zonemgr::enable_zone("zone_culdesac_green");
        zm_zonemgr::enable_zone("zone_culdesac_yellow");
        zm_zonemgr::enable_zone("zone_angled_house");
    }  

    if(BO4GetMap() == "Blood")
    {
        level flag::wait_till("all_players_spawned");
        zm_zonemgr::enable_zone("zone_dock");
        zm_zonemgr::enable_zone("zone_dock_gondola");
        level.zones["zone_model_industries"].is_enabled = 0;
	    level.zones["zone_model_industries"].is_spawning_allowed = 0;
        level.zones["zone_model_industries_upper"].is_enabled = 0;
	    level.zones["zone_model_industries_upper"].is_spawning_allowed = 0;  
    }
    
}

JumpPads()
{
    level flag::wait_till("all_players_spawned"); // waits for players 
    level flag::wait_till("initial_blackscreen_passed"); // waits for players
    
    switch(BO4GetMap())
    {
        case "Tag":
        // random
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-1543.19, 4576.18, 1433.18), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-4087.37, 4802.5, 1316.36), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-1452.37, 500.957, 12.7913), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-667.053, 939.655, 528), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);

        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (1138.76, 3435.28, 61.7958), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (1910.84, 916.73, 11.6805), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (2481.11, -923.239, 39.8119), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (1580.27, -2009.92, -6.79497), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        break;

        case "Voyage":
        // random
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (0.289241, 4670.89, 1120.67), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-347.33, 3578.26, 989.176), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (232.99, -817.706, 1410.96), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-0.840481, -2234, 1329.7), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);

        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (278.511, -4409.04, 962.509), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-270.61, -4409.18, 962.509), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-195.414, -3175.34, 961.261), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (1.28835, 556.764, 353.155), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        break;

        case "IX":
        // main arena
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-159.317, -446.463, 68.4196), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (221.456, -446.246, 68.2741), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-159.875, 428.535, 67.1858), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (221.875, 428.535, 67.1858), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);

        // ra, danu
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-1496.12, 755.103, 250.207), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-1496.04, -786.757, 250.358), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);

        // zues, odin
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (1495.47, 779.247, 250), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (1495.26, -786.996, 250), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        break;

        case "Dead":
        // random
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (13440.6, -7173.75, -1804.15), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (7.63285, 5436.86, -745.676), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (535.398, -913.951, -395.989), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-3.68543, 709.413, -180.533), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);

        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (10.8896, 2131.04, -274.475), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-4059.27, 948.917, 143.535), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-0.292905, -81.9342, -184.524), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (4722.96, -272.602, -406.281), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        break;

        case "AE":
        // random
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (1102.65, -1003.56, -83.5404), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (788.938, -3964.62, -788.271), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-2933.92, -1944.22, -122.338), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-2026.98, 1194.98, 287.929), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);

        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-672.943, 7199.71, 778.651), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-2006.35, 7182.12, 816.314), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-1221.47, 6322.89, 978.611), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-1635.29, 8949.66, 352.215), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        break;

        case "AO":
        // random
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-200.732, 289.395, -31.2958), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-294.091, 1434.92, -388.435), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (1249.13, 585.689, -25.3926), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (158.489, -1112.84, -32.0466), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);

        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-1503.79, -842.796, -29.0249), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-802.018, -2491.04, -232.362), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (1051.96, -663.52, -379.82), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-136.921, -1111.34, -380.365), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        break;

        case "Blood":
        // random
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (8986.16, 10963, 483.633), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (2165.92, 9575.22, 1180.53), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (681.252, 8426.78, 590.263), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-286.327, 7884.54, 209.164), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);

        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-315.127, 5804.91, 52.3422), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-1173.02, 8229.42, 1323.91), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (688.786, 9151.22, 1372.23), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (2633.72, 10161.4, 1186.63), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        break;

        case "Classified":
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-1179.67, 1703.2, -478.596), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-1179.2, 2357.2, -475.702), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);

        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-1107, 2044.4, 52.6326), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-797.862, 5244.19, -678.16), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        level thread SpawnJumpPad(#"p7_zm_power_up_nuke", (-329.059, 1951.58, -476.362), (-90, 0, 0), (0, 10, 10), (0, 0, 500), 300);
        break;
    }
}

IXSpawnPoints()
{
    // in player spawned is spawn points

    middelthing = getent("mdl_maelstrom_initiate", "targetname");
    movepap(middelthing.origin + (0,-120,0), (0,180,0), 1);

    // triggers
    thread Spawn_RushTrigger((3822,-70,0), "shield/bossrush", (0,90,0), #"p7_zm_vending_sleight", &BossSkipIX, 5);
    thread Spawn_RushTrigger((3822,90,2.5), "shield/normalrush", (0,90,0), #"p7_zm_vending_nuke", &NormalIX, 5);

    // toggle custom quest
    //thread Spawn_RushExtraQuestTrigger((3822, -250, 2.5), #"shield/customquesttoggle", (0, 0, 0), middelthing.model, &ToggleRushExtraQuests);

    util::spawn_model(#"c_t8_zmb_dlc0_elephant_body1", (3641,-6,100), (0, 0, 0));

    thread Spawn_RushNormalTrigger((4100,-311,0.15), "shield/rushpap", (0,180,0),#"p7_zm_vending_packapunch", &UpgradeWeapon, undefined, 1);
    thread Spawn_RushNormalTrigger((3950,-311,0.15), "shield/powerrush", (0,180,0),#"p7_zm_vending_widows_wine", &GearUpPower);

    // weapons
    //thread Spawn_RushWeapon((4100,200,13),(0,45,0),#"homunculus_upgraded");
    thread Spawn_RushWeapon((4100,250,13),(0,45,0),#"homunculus");
    thread Spawn_RushWeapon((4100,350,25),(0,-90,0),#"hash_243cd42eb1bd6e10");
    thread Spawn_RushWeapon((4100,450,13),(0,-90,0),#"launcher_standard_t8");

    thread Spawn_RushWeapon((4050,250,13),(0,45,0),#"ww_crossbow_charged_t8");
    thread Spawn_RushWeapon((4050,280,13),(0,45,0),#"ww_crossbow_t8");
    thread Spawn_RushWeapon((4050,310,13),(0,45,0),#"special_ballisticknife_t8_dw");
    thread Spawn_RushWeapon((4050,340,13),(0,45,0),#"special_crossbow_t8");
    thread Spawn_RushWeapon((4050,370,13),(0,45,0),#"shotgun_pump_t8");
    thread Spawn_RushWeapon((4050,400,13),(0,45,0),#"shotgun_semiauto_t8");
    thread Spawn_RushWeapon((4050,430,13),(0,45,0),#"shotgun_trenchgun_t8");
    thread Spawn_RushWeapon((4050,460,13),(0,45,0),#"shotgun_fullauto_t8");
    thread Spawn_RushWeapon((4050,490,13),(0,45,0),#"shotgun_precision_t8");

    thread Spawn_RushWeapon((4000,250,13),(0,45,0),#"ar_accurate_t8");
    thread Spawn_RushWeapon((4000,280,13),(0,45,0),#"ar_fastfire_t8");
    thread Spawn_RushWeapon((4000,310,13),(0,45,0),#"ar_damage_t8");
    thread Spawn_RushWeapon((4000,340,13),(0,45,0),#"ar_stealth_t8");
    thread Spawn_RushWeapon((4000,370,13),(0,45,0),#"ar_modular_t8");
    thread Spawn_RushWeapon((4000,400,13),(0,45,0),#"ar_mg1909_t8");
    thread Spawn_RushWeapon((4000,430,13),(0,45,0),#"ar_standard_t8");
    thread Spawn_RushWeapon((4000,460,13),(0,45,0),#"ar_galil_t8");
    thread Spawn_RushWeapon((4000,490,13),(0,45,0),#"ar_peacekeeper_t8");
    thread Spawn_RushWeapon((4000,520,13),(0,45,0),#"ar_doublebarrel_t8");
    thread Spawn_RushWeapon((4000,550,13),(0,45,0),#"ar_an94_t8");

    thread Spawn_RushWeapon((3950,250,13),(0,45,0),#"smg_folding_t8");
    thread Spawn_RushWeapon((3950,280,13),(0,45,0),#"smg_drum_pistol_t8");
    thread Spawn_RushWeapon((3950,310,13),(0,45,0),#"smg_accurate_t8");
    thread Spawn_RushWeapon((3950,340,13),(0,45,0),#"smg_fastfire_t8");
    thread Spawn_RushWeapon((3950,370,13),(0,45,0),#"smg_capacity_t8");
    thread Spawn_RushWeapon((3950,400,13),(0,45,0),#"smg_handling_t8");
    thread Spawn_RushWeapon((3950,430,13),(0,45,0),#"smg_standard_t8");
    thread Spawn_RushWeapon((3950,460,13),(0,45,0),#"smg_minigun_t8");
    thread Spawn_RushWeapon((3950,490,13),(0,45,0),#"smg_vmp_t8");
    thread Spawn_RushWeapon((3950,520,13),(0,45,0),#"smg_fastburst_t8");
    thread Spawn_RushWeapon((3950,550,13),(0,45,0),#"smg_mp40_t8");
    //thread Spawn_RushWeapon((-6481,-750,-1650),(0,45,0),#"smg_thompson_t8");

    thread Spawn_RushWeapon((3900,250,13),(0,45,0),#"tr_powersemi_t8");
    thread Spawn_RushWeapon((3900,280,13),(0,45,0),#"tr_longburst_t8");
    thread Spawn_RushWeapon((3900,310,13),(0,45,0),#"tr_midburst_t8");
    thread Spawn_RushWeapon((3900,340,13),(0,45,0),#"lmg_heavy_t8");
    thread Spawn_RushWeapon((3900,370,13),(0,45,0),#"lmg_spray_t8");
    thread Spawn_RushWeapon((3900,400,13),(0,45,0),#"lmg_standard_t8");
    thread Spawn_RushWeapon((3900,430,13),(0,45,0),#"pistol_standard_t8");
    thread Spawn_RushWeapon((3900,460,13),(0,45,0),#"pistol_topbreak_t8");
    thread Spawn_RushWeapon((3900,490,13),(0,45,0),#"tr_damageburst_t8");
    thread Spawn_RushWeapon((3900,520,13),(0,45,0),#"tr_leveraction_t8");
    thread Spawn_RushWeapon((3900,550,13),(0,45,0),#"tr_flechette_t8");

    thread Spawn_RushWeapon((3850,250,13),(0,45,0),#"sniper_fastrechamber_t8");
    thread Spawn_RushWeapon((3850,280,13),(0,45,0),#"sniper_powerbolt_t8");
    thread Spawn_RushWeapon((3850,310,13),(0,45,0),#"sniper_powersemi_t8");
    thread Spawn_RushWeapon((3850,340,13),(0,45,0),#"sniper_quickscope_t8");
    thread Spawn_RushWeapon((3850,370,13),(0,45,0),#"sniper_mini14_t8");
    thread Spawn_RushWeapon((3850,400,13),(0,45,0),#"sniper_locus_t8");
    thread Spawn_RushWeapon((3850,430,13),(0,45,0),#"sniper_damagesemi_t8");
    thread Spawn_RushWeapon((3850,460,13),(0,45,0),#"pistol_revolver_t8");
    thread Spawn_RushWeapon((3850,490,13),(0,45,0),#"pistol_burst_t8");
    thread Spawn_RushWeapon((3850,520,13),(0,45,0),#"pistol_fullauto_t8");
    thread Spawn_RushWeapon((3850,550,13),(0,45,0),#"lmg_double_t8");
    thread Spawn_RushWeapon((3850,580,13),(0,45,0),#"lmg_stealth_t8");

    thread IXMessage();

    level flag::wait_till("all_players_spawned"); // waits for players 
    foreach(player in level.players)
    {       
        player dontinterpolate();
        player SetRandomOrigin((4125,-22,0.125), (0, 180, 0));
    }

    level flag::wait_till("initial_blackscreen_passed"); // waits for players
    foreach(player in level.players)
    {       
        player dontinterpolate();
        player SetRandomOrigin((4125,-22,0.125), (0, 180, 0));
    }
    thread IXCutsceneStuff();
    
    while(!level.PickedOption)
    {
        wait 1;
    }
    wait 1;
    thread FastEE_IX();
    if (level.skipped) return;
    foreach(player in level.players)
    {
        player SpawnPointsIXRandom(); // spawn point random change for some maps (all players)
    }

}

FastEE_IX()
{
    wait 5;
    setDvar(#"zm_debug_ee", 1);
    //level flag::wait_till(#"hash_498204258011f15e");
    //setDvar(#"zm_debug_ee", 0);
}

IXMessage()
{
    level flag::wait_till("initial_blackscreen_passed"); // waits for players
    wait 6;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^2 Welcome to Rush Mode!, Choose your GameMode From Here....");
    }
    wait 3;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^3 PhD Flopper - Start Normal Rush Mode! ");
    }
    wait 3;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^3 Speed Cola - Start Rush Mode with Boss Fight Skip! ");
    }
}

DOTNSpawnPoints_Flags()
{
    foreach(spawn in struct::get_array("initial_spawn_points", "targetname"))
    {
        spawn.origin = (125,-26510,-5530);
        spawn.angles = (0,90,0);
    }   

    // triggers
    thread Spawn_RushTrigger((35,-26218,-5530), "shield/bossrush", (0,0,0),#"p7_zm_vending_sleight", &BossSkipDOTN, 5);
    thread Spawn_RushTrigger((220,-26211,-5530), "shield/normalrush", (0,0,0),#"p7_zm_vending_widows_wine", &NormalDOTN, 5, true);

    thread Spawn_RushNormalTrigger((520,-26330,-5530), "shield/rushpap", (0,-90,0),#"p7_zm_vending_packapunch", &UpgradeWeapon, undefined, 1);
    thread Spawn_RushNormalTrigger((520,-26475,-5500), "shield/powerrush", (0,90,0),#"zombie_pickup_perk_bottle", &GearUpPower);

    // weapons
    thread Spawn_RushWeapon((-200,-26200,-5515),(0,45,0),#"launcher_standard_t8");
    thread Spawn_RushWeapon((-200,-26230,-5515),(0,45,0),#"homunculus");
    thread Spawn_RushWeapon((-200,-26260,-5515),(0,45,0),#"hash_138f002bb30be9a2");
    thread Spawn_RushWeapon((-200,-26290,-5515),(0,45,0),#"hash_138f012bb30beb55");
    thread Spawn_RushWeapon((-200,-26320,-5515),(0,45,0),#"hash_138efe2bb30be63c");
    thread Spawn_RushWeapon((-200,-26350,-5515),(0,45,0),#"special_ballisticknife_t8_dw");
    thread Spawn_RushWeapon((-200,-26380,-5515),(0,45,0),#"special_crossbow_t8");

    stakefunction = @mansion_a_skeet_fink<scripts\zm\zm_mansion_a_skeet_fink.gsc>::function_db526700;
    thread Spawn_RushWeapon((-200,-26410,-5515),(0,45,0),#"stake_knife", #"hash_166ccb55e49e33a0", stakefunction, 1, 15);

    thread Spawn_RushWeapon((-250,-26200,-5515),(0,45,0),#"shotgun_pump_t8");
    thread Spawn_RushWeapon((-250,-26230,-5515),(0,45,0),#"shotgun_semiauto_t8");
    thread Spawn_RushWeapon((-250,-26260,-5515),(0,45,0),#"shotgun_trenchgun_t8");
    thread Spawn_RushWeapon((-250,-26290,-5515),(0,45,0),#"shotgun_fullauto_t8");
    thread Spawn_RushWeapon((-250,-26320,-5515),(0,45,0),#"shotgun_precision_t8");

    thread Spawn_RushWeapon((-300,-26200,-5515),(0,45,0),#"ar_accurate_t8");
    thread Spawn_RushWeapon((-300,-26230,-5515),(0,45,0),#"ar_fastfire_t8");
    thread Spawn_RushWeapon((-300,-26260,-5515),(0,45,0),#"ar_damage_t8");
    thread Spawn_RushWeapon((-300,-26290,-5515),(0,45,0),#"ar_stealth_t8");
    thread Spawn_RushWeapon((-300,-26320,-5515),(0,45,0),#"ar_modular_t8");
    thread Spawn_RushWeapon((-300,-26350,-5515),(0,45,0),#"ar_mg1909_t8");
    thread Spawn_RushWeapon((-300,-26380,-5515),(0,45,0),#"ar_standard_t8");
    thread Spawn_RushWeapon((-300,-26410,-5515),(0,45,0),#"ar_galil_t8");
    thread Spawn_RushWeapon((-300,-26440,-5515),(0,45,0),#"ar_peacekeeper_t8");
    thread Spawn_RushWeapon((-300,-26470,-5515),(0,45,0),#"ar_doublebarrel_t8");
    thread Spawn_RushWeapon((-300,-26500,-5515),(0,45,0),#"ar_an94_t8");

    thread Spawn_RushWeapon((-350,-26200,-5515),(0,45,0),#"smg_folding_t8");
    thread Spawn_RushWeapon((-350,-26230,-5515),(0,45,0),#"smg_drum_pistol_t8");
    thread Spawn_RushWeapon((-350,-26260,-5515),(0,45,0),#"smg_accurate_t8");
    thread Spawn_RushWeapon((-350,-26290,-5515),(0,45,0),#"smg_fastfire_t8");
    thread Spawn_RushWeapon((-350,-26320,-5515),(0,45,0),#"smg_capacity_t8");
    thread Spawn_RushWeapon((-350,-26350,-5515),(0,45,0),#"smg_handling_t8");
    thread Spawn_RushWeapon((-350,-26380,-5515),(0,45,0),#"smg_standard_t8");
    thread Spawn_RushWeapon((-350,-26410,-5515),(0,45,0),#"smg_minigun_t8");
    thread Spawn_RushWeapon((-350,-26440,-5515),(0,45,0),#"smg_vmp_t8");
    thread Spawn_RushWeapon((-350,-26470,-5515),(0,45,0),#"smg_fastburst_t8");
    thread Spawn_RushWeapon((-350,-26500,-5515),(0,45,0),#"smg_mp40_t8");
    //thread Spawn_RushWeapon((-6481,-750,-1650),(0,45,0),#"smg_thompson_t8");

    thread Spawn_RushWeapon((-400,-26200,-5515),(0,45,0),#"tr_powersemi_t8");
    thread Spawn_RushWeapon((-400,-26230,-5515),(0,45,0),#"tr_longburst_t8");
    thread Spawn_RushWeapon((-400,-26260,-5515),(0,45,0),#"tr_midburst_t8");
    thread Spawn_RushWeapon((-400,-26290,-5515),(0,45,0),#"lmg_heavy_t8");
    thread Spawn_RushWeapon((-400,-26320,-5515),(0,45,0),#"lmg_spray_t8");
    thread Spawn_RushWeapon((-400,-26350,-5515),(0,45,0),#"lmg_standard_t8");
    thread Spawn_RushWeapon((-400,-26380,-5515),(0,45,0),#"pistol_standard_t8");
    thread Spawn_RushWeapon((-400,-26410,-5515),(0,45,0),#"pistol_topbreak_t8");
    thread Spawn_RushWeapon((-400,-26440,-5515),(0,45,0),#"tr_damageburst_t8");
    thread Spawn_RushWeapon((-400,-26470,-5515),(0,45,0),#"tr_leveraction_t8");
    thread Spawn_RushWeapon((-400,-26500,-5515),(0,45,0),#"tr_flechette_t8");

    thread Spawn_RushWeapon((-450,-26200,-5515),(0,45,0),#"sniper_fastrechamber_t8");
    thread Spawn_RushWeapon((-450,-26230,-5515),(0,45,0),#"sniper_powerbolt_t8");
    thread Spawn_RushWeapon((-450,-26260,-5515),(0,45,0),#"sniper_powersemi_t8");
    thread Spawn_RushWeapon((-450,-26290,-5515),(0,45,0),#"sniper_quickscope_t8");
    thread Spawn_RushWeapon((-450,-26320,-5515),(0,45,0),#"sniper_mini14_t8");
    thread Spawn_RushWeapon((-450,-26350,-5515),(0,45,0),#"sniper_locus_t8");
    thread Spawn_RushWeapon((-450,-26380,-5515),(0,45,0),#"sniper_damagesemi_t8");
    thread Spawn_RushWeapon((-450,-26410,-5515),(0,45,0),#"pistol_revolver_t8");
    thread Spawn_RushWeapon((-450,-26440,-5515),(0,45,0),#"pistol_burst_t8");
    thread Spawn_RushWeapon((-450,-26470,-5515),(0,45,0),#"pistol_fullauto_t8");
    thread Spawn_RushWeapon((-450,-26500,-5515),(0,45,0),#"lmg_double_t8");
    thread Spawn_RushWeapon((-450,-26530,-5515),(0,45,0),#"lmg_stealth_t8");

    level flag::wait_till("all_players_spawned"); // waits for players

    foreach(player in level.players)
    {       
        player dontinterpolate();
        player SetRandomOrigin((125,-26510,-5530), (0, 90, 0));
    }

    // setup the area
    ShowMiscModels("end_igc");
    level clientfield::set("" + #"hash_7fcdc47572bdbafa", 1);
    level clientfield::set("" + #"hash_2709d50a7b0a2b01", 1);
    setdvar(#"hash_44340be18f159be3", 0);
    level.var_ea32773 = &DOTNDvar;

    level thread DOTNCutsceneStuff();
    //level thread ZoneFix();

    level notify(#"hash_75e5d46ef453bd62"); // avoid zebra crash when thowing gerenade before black screen, some random useless ee
    level flag::wait_till("initial_blackscreen_passed"); // waits for players

    wait 3;
    thread DOTNMessage();
    thread DuckRingStuff();
    thread DuckKnights();
    thread GhostDuck();
    thread DOTNPaP();

    while(!level.PickedOption)
    {
        wait 1;
    }
    wait 2;

    thread DOTNKillStartWolf();
    foreach(player in level.players)
    {
        player DeadRandomSpawns();
    }
}

DOTNKillStartWolf()
{
    level flag::wait_till("power_on666");
    wait 5;
    wolf = getaiarchetypearray(#"werewolf");

    for(z=0;z<wolf.size;z++)
    {
        if(isDefined(wolf[z]) && IsAlive(wolf[z]))
        wolf[z] DoDamage(wolf[z].health + 99, wolf[z].origin);
    }
}

ZoneFix()
{
    level flag::wait_till("start_zombie_round_logic");
    foreach(player in level.players)
    {
        player SetRandomOrigin((-2.56008, -928.784, -7.875));
    }
}

DuckKnights()
{
    wait 3;

    thread DuckKnightMainHall();
    thread DuckKnightCemetery();
    thread DuckKnightGreenHouse();
}

DuckKnightMainHall()
{
    wait 10;
    while(!isdefined(level.var_fbcb1d5b))
    {
        wait 1;
    }
    wait 2;

    level.var_fbcb1d5b attach("p8_zm_red_floatie_duck");
}

DuckKnightCemetery()
{
    wait 10;
    while(!isdefined(level.var_abe1b67c))
    {
        wait 1;
    }
    wait 2;

    level.var_abe1b67c attach("p8_zm_red_floatie_duck");
}

DuckKnightGreenHouse()
{
    wait 10;
    while(!isdefined(level.var_c22f75e6))
    {
        wait 1;
    }
    wait 2;

    level.var_c22f75e6 attach("p8_zm_red_floatie_duck");
}

GhostDuck()
{
    wait 10;
    while(!isdefined(level.e_guide))
    {
        wait 1;
    }
    wait 2;

    level.e_guide attach("p8_zm_red_floatie_duck");
    level.e_guide ObjectSpecialDuck();
}

DuckRingStuff()
{
    /#
    Outer = getent("ring_outer", "targetname");
    Middle = getent("ring_middle", "targetname");
    inner = getent("ring_inner", "targetname");

    Outer enableLinkTo();
    Middle enableLinkTo();
    inner enableLinkTo();

    quack = util::spawn_model("p8_zm_red_floatie_duck", Outer.origin + (0, 0, 0));
    quack SetScale(50);
    quack enablelinkto();
    quack linkto(Outer);
    quack notSolid();

    quack1 = util::spawn_model("p8_zm_red_floatie_duck", Middle.origin + (0, 0, 0));
    quack1 SetScale(50);
    quack1 enablelinkto();
    quack1 linkto(Middle);
    quack1 notSolid();

    quack2 = util::spawn_model("p8_zm_red_floatie_duck", inner.origin + (0, 0, 0));
    quack2 SetScale(50);
    quack2 enablelinkto();
    quack2 linkto(inner);
    quack2 notSolid();

    #/
    
    wait 1;

    stonelibrary = getent("gazing_stone_library", "targetname");
    stonemain = getent("gazing_stone_main_hall", "targetname");
    stonecellar = getent("gazing_stone_cellar", "targetname");

    stonelibrary attach("p8_zm_red_floatie_duck");
    stonemain attach("p8_zm_red_floatie_duck");
    stonecellar attach("p8_zm_red_floatie_duck");

    wait 1;
    BeamMan = getent("beam_man", "targetname");
    BeamObs = getent("beam_obs", "targetname");

    quack3 = util::spawn_model("p8_zm_red_floatie_duck", BeamMan.origin + (0, 0, 0));
    quack3 SetScale(50);
    quack3 enablelinkto();
    quack3 linkto(BeamMan);
    quack3 notSolid();

    quack4 = util::spawn_model("p8_zm_red_floatie_duck", BeamObs.origin + (0, 0, 0));
    quack4 SetScale(50);
    quack4 enablelinkto();
    quack4 linkto(BeamObs);
    quack4 notSolid();

    wait 3;

    rings = struct::get_array(#"control_ring", "script_string");
    foreach (ringscontrol in rings) 
    {
        quack5 = util::spawn_model("p8_zm_red_floatie_duck", ringscontrol.origin + (0, 0, 0));
        quack5 SetScale(2);
        quack5 notSolid();
    }

    e_trap = getent("werewolfer_trap_touch", "targetname");

    e_trap attach("p8_zm_red_floatie_duck");

    StoneObs = getent("stone_obs", "targetname");

    StoneObs attach("p8_zm_red_floatie_duck");

    wait 1;

    e_stone = getent("stone_forest", "targetname");

    e_stone attach("p8_zm_red_floatie_duck");

    knight_model_cemetery = getent("knight_model_cemetery", "targetname");
    knight_model_cemetery showPart("tag_stone_01", "p8_zm_man_statue_kisa_stone_01", 1);
    knight_model_main_hall = getent("knight_model_main_hall", "targetname");
    knight_model_main_hall showPart("tag_stone_02", "p8_zm_man_statue_kisa_stone_02", 1);
    knight_model_greenhouse = getent("knight_model_greenhouse", "targetname");
    knight_model_greenhouse showPart("tag_stone_03", "p8_zm_man_statue_kisa_stone_03", 1);

    quack6 = util::spawn_model("p8_zm_red_floatie_duck", knight_model_cemetery.origin + (0, 0, 0));
    quack6 SetScale(50);
    quack6 enablelinkto();
    quack6 linkto(knight_model_cemetery);
    quack6 notSolid();

    quack7 = util::spawn_model("p8_zm_red_floatie_duck", knight_model_main_hall.origin + (0, 0, 0));
    quack7 SetScale(50);
    quack7 enablelinkto();
    quack7 linkto(knight_model_main_hall);
    quack7 notSolid();

    quack8 = util::spawn_model("p8_zm_red_floatie_duck", knight_model_greenhouse.origin + (0, 0, 0));
    quack8 SetScale(50);
    quack8 enablelinkto();
    quack8 linkto(knight_model_greenhouse);
    quack8 notSolid();

    wait 1;

    /#
    relicgreen = getent("relic_greenhouse", "targetname");
    reliccem = getent("relic_cemetery", "targetname");
    relicforest = getent("relic_forest", "targetname");

    relicgreen attach("p8_zm_red_floatie_duck");
    reliccem attach("p8_zm_red_floatie_duck");
    relicforest attach("p8_zm_red_floatie_duck");
    #/

    stonehealth = getent("health_stone", "targetname");
    stonehealth SetVisibleToAll();
    stonehealth attach("p8_zm_red_floatie_duck");

    wait 1;
    livingtree = getentarray("living_tree", "targetname");
    array::run_all(livingtree, &SpawnModelTree);

    wait 1;
    sticks = getentarray("stick_man_stick", "script_noteworthy");
    array::run_all(sticks, &ObjectSpecialDuck);

    stickguide = getent("stick_guide", "targetname");

    stickguide attach("p8_zm_red_floatie_duck");

    e_bush = getent("burning_man_shrub", "targetname");

    e_bush ObjectSpecialDuck();
}

DOTNPaP()
{
    /#
    function_a7faeaaf = @mansion_pap<scripts\zm\zm_mansion_pap_quest.gsc>::function_a7faeaaf; // skip

    if (!isdefined(function_a7faeaaf))
    {
            self iPrintLnBold("^1Can't find function_a7faeaaf! ");
            return;
    }

    level thread [[ function_a7faeaaf ]]();
    #/

    s_scene = struct::get(#"p8_fxanim_zm_man_ooze_clump_bundle", "scriptbundlename");
    s_scene thread scene::play(#"p8_fxanim_zm_man_ooze_clump_bundle", "clump01_rise");
    s_scene thread scene::play(#"p8_fxanim_zm_man_ooze_clump_bundle", "clump02_rise");
    s_scene thread scene::play(#"p8_fxanim_zm_man_ooze_clump_bundle", "clump03_rise");

    level.var_a6583e6d = util::spawn_model(#"p8_zm_red_floatie_duck", (0, 0, 0));
    wait 5;
    level flag::set("crystal_main_hall");
    level flag::set("crystal_library");
    level flag::set("crystal_greenhouse");
    level flag::set("crystal_main_hall_key");
    level flag::set("crystal_library_key");
    level flag::set("crystal_greenhouse_key");
    level flag::set("power_on666"); //DOTN <<<
    level flag::set("unlock_pap_gate");
    level flag::set("open_pap"); // DOTN
    level flag::set("unlock_pap_gate");
    zm_power::turn_power_on_and_open_doors(666);
}

DOTNMessage()
{
    level flag::wait_till("initial_blackscreen_passed"); // waits for players
    wait 6;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^2 Welcome to Rush Mode!, Choose your GameMode From Here....");
    }
    wait 3;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^3 Widows Wine - Start Normal Rush Mode! ");
    }
    wait 3;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^3 Speed Cola - Start Rush Mode with Boss Fight Skip! ");
    }
}

ClassifiedSpawnPoints()
{
    struct::get_array("initial_spawn", "script_noteworthy")[0].origin = (233,1201,-511);
    struct::get_array("initial_spawn", "script_noteworthy")[0].angles = (0,90,0);
    struct::get_array("initial_spawn", "script_noteworthy")[1].origin = (220,1251,-511);
    struct::get_array("initial_spawn", "script_noteworthy")[1].angles = (0,90,0);
    struct::get_array("initial_spawn", "script_noteworthy")[2].origin = (240,1291,-511);
    struct::get_array("initial_spawn", "script_noteworthy")[2].angles = (0,90,0);
    struct::get_array("initial_spawn", "script_noteworthy")[3].origin = (210,1201,-511);
    struct::get_array("initial_spawn", "script_noteworthy")[3].angles = (0,90,0);

    thread FiveCutsceneStuff();
}

VODSpawnPoints()
{
    spawn = struct::get_array("initial_spawn", "script_noteworthy");

    spawn[0].origin = (-6815,-738,-1663); //1088
    spawn[0].angles = (0,90,0);
    spawn[1].origin = (-6765,-738,-1663); //1088
    spawn[1].angles = (0,90,0);
    spawn[2].origin = (-6715,-738,-1663); //1088
    spawn[2].angles = (0,90,0);
    spawn[3].origin = (-6815,-698,-1663); //1088
    spawn[3].angles = (0,90,0);
    spawn[4].origin = (-6815,-798,-1663); //1088
    spawn[4].angles = (0,90,0);
    spawn[5].origin = (-6890,-788,-1663); //1088
    spawn[5].angles = (0,90,0);
    spawn[6].origin = (-6890,-700,-1663); //1088
    spawn[6].angles = (0,90,0);
    spawn[7].origin = (-6890,-600,-1663); //1088
    spawn[7].angles = (0,90,0);

    //Light = util::spawn_model("p8_news_mod_light_stagelight", (-6815,-738,-1600), (0, 0, 0));

    // Setup
    // Walls and Floors
    Floor = util::spawn_model("collision_nosight_wall_512x512x10", (-6815,-738,-1663), (90, 0, 0));
    Floor1 = util::spawn_model("collision_nosight_wall_512x512x10", (-6815,-1170,-1663), (90, 0, 0));
    Floor2 = util::spawn_model("collision_nosight_wall_512x512x10", (-6815,-1400,-1663), (90, 0, 0));
    Floor3 = util::spawn_model("collision_nosight_wall_512x512x10", (-7300,-738,-1663), (90, 0, 0));
    Floor4 = util::spawn_model("collision_nosight_wall_512x512x10", (-6340,-738,-1663), (90, 0, 0));
    Wall = util::spawn_model("collision_nosight_wall_512x512x10", (-6825,-477,-1750), (0, 90, 0));
    //MainEye = util::spawn_model(#"hash_32a51dafb1c7344f", (-6818,-475,-1524), (0, -93.5, 0));
    //MainEye SetScale(0.45);

    level thread SpawnEyeLooking((-6825, -350, -1200), (0, -90, 0));

    // Weapons and Triggers
    thread Spawn_RushTrigger((-7020,-568,-1663), "shield/questVoDAOrush", (0,0,0),#"p7_zm_vending_widows_wine", &SkipVODClock, 5, true);
    thread Spawn_RushTrigger((-6820,-568,-1663), "shield/normalrush", (0,0,0),#"p7_zm_vending_packapunch", &NonSkipVODClock, 5);
    thread Spawn_RushTrigger((-6620,-568,-1663), "shield/bossrush", (0,0,0),#"hash_55657a69ddb2f287" + "full", &BossSkipVOD, 5);

    thread Spawn_RushWeapon((-6650,-1550,-1663),(0,90,0),#"zhield_dw");
    thread Spawn_RushWeapon((-6650,-1500,-1663),(0,90,0),#"zhield_frost_dw", undefined, &FrostTheShield);
    thread Spawn_RushNormalTrigger((-6800,-1550,-1658), "shield/rushpap", (0,0,0),#"p8_zm_zod_teleport_symbol", &UpgradeWeapon);
    thread Spawn_RushNormalTrigger((-6970,-1550,-1625), "shield/powerrush", (0,90,0),#"hash_3cdbd25e43a09930", &GearUpPower);

    thread Spawn_RushWeapon((-6451,-900,-1650),(0,45,0),#"launcher_standard_t8");
    thread Spawn_RushWeapon((-6451,-800,-1650),(0,45,0),#"homunculus");

    thread Spawn_RushWeapon((-6151,-950,-1650),(0,45,0),#"ww_tricannon_t8");
    thread Spawn_RushWeapon((-6181,-950,-1650),(0,45,0),#"ww_tricannon_fire_t8");
    thread Spawn_RushWeapon((-6211,-950,-1650),(0,45,0),#"ww_tricannon_earth_t8");
    thread Spawn_RushWeapon((-6241,-950,-1650),(0,45,0),#"ww_tricannon_water_t8");
    thread Spawn_RushWeapon((-6271,-950,-1650),(0,45,0),#"ww_tricannon_air_t8");
    thread Spawn_RushWeapon((-6301,-950,-1650),(0,45,0),#"special_ballisticknife_t8_dw");
    thread Spawn_RushWeapon((-6331,-950,-1650),(0,45,0),#"special_crossbow_t8");
    thread Spawn_RushWeapon((-6361,-950,-1650),(0,45,0),#"shotgun_pump_t8");
    thread Spawn_RushWeapon((-6391,-950,-1650),(0,45,0),#"shotgun_semiauto_t8");
    thread Spawn_RushWeapon((-6421,-950,-1650),(0,45,0),#"shotgun_trenchgun_t8");
    thread Spawn_RushWeapon((-6451,-950,-1650),(0,45,0),#"shotgun_fullauto_t8");
    thread Spawn_RushWeapon((-6481,-950,-1650),(0,45,0),#"shotgun_precision_t8");

    thread Spawn_RushWeapon((-6151,-850,-1650),(0,45,0),#"ar_accurate_t8");
    thread Spawn_RushWeapon((-6181,-850,-1650),(0,45,0),#"ar_fastfire_t8");
    thread Spawn_RushWeapon((-6211,-850,-1650),(0,45,0),#"ar_damage_t8");
    thread Spawn_RushWeapon((-6241,-850,-1650),(0,45,0),#"ar_stealth_t8");
    thread Spawn_RushWeapon((-6271,-850,-1650),(0,45,0),#"ar_modular_t8");
    thread Spawn_RushWeapon((-6301,-850,-1650),(0,45,0),#"ar_mg1909_t8");
    thread Spawn_RushWeapon((-6331,-850,-1650),(0,45,0),#"ar_standard_t8");
    thread Spawn_RushWeapon((-6361,-850,-1650),(0,45,0),#"ar_galil_t8");
    thread Spawn_RushWeapon((-6391,-850,-1650),(0,45,0),#"ar_peacekeeper_t8");
    thread Spawn_RushWeapon((-6421,-850,-1650),(0,45,0),#"ar_doublebarrel_t8");
    thread Spawn_RushWeapon((-6451,-850,-1650),(0,45,0),#"ar_an94_t8");

    thread Spawn_RushWeapon((-6151,-750,-1650),(0,45,0),#"smg_folding_t8");
    thread Spawn_RushWeapon((-6181,-750,-1650),(0,45,0),#"smg_drum_pistol_t8");
    thread Spawn_RushWeapon((-6211,-750,-1650),(0,45,0),#"smg_accurate_t8");
    thread Spawn_RushWeapon((-6241,-750,-1650),(0,45,0),#"smg_fastfire_t8");
    thread Spawn_RushWeapon((-6271,-750,-1650),(0,45,0),#"smg_capacity_t8");
    thread Spawn_RushWeapon((-6301,-750,-1650),(0,45,0),#"smg_handling_t8");
    thread Spawn_RushWeapon((-6331,-750,-1650),(0,45,0),#"smg_standard_t8");
    thread Spawn_RushWeapon((-6361,-750,-1650),(0,45,0),#"smg_minigun_t8");
    thread Spawn_RushWeapon((-6391,-750,-1650),(0,45,0),#"smg_vmp_t8");
    thread Spawn_RushWeapon((-6421,-750,-1650),(0,45,0),#"smg_fastburst_t8");
    thread Spawn_RushWeapon((-6451,-750,-1650),(0,45,0),#"smg_mp40_t8");
    //thread Spawn_RushWeapon((-6481,-750,-1650),(0,45,0),#"smg_thompson_t8");

    thread Spawn_RushWeapon((-6151,-650,-1650),(0,45,0),#"tr_powersemi_t8");
    thread Spawn_RushWeapon((-6181,-650,-1650),(0,45,0),#"tr_longburst_t8");
    thread Spawn_RushWeapon((-6211,-650,-1650),(0,45,0),#"tr_midburst_t8");
    thread Spawn_RushWeapon((-6241,-650,-1650),(0,45,0),#"lmg_heavy_t8");
    thread Spawn_RushWeapon((-6271,-650,-1650),(0,45,0),#"lmg_spray_t8");
    thread Spawn_RushWeapon((-6301,-650,-1650),(0,45,0),#"lmg_standard_t8");
    thread Spawn_RushWeapon((-6331,-650,-1650),(0,45,0),#"pistol_standard_t8");
    thread Spawn_RushWeapon((-6361,-650,-1650),(0,45,0),#"pistol_topbreak_t8");
    thread Spawn_RushWeapon((-6391,-650,-1650),(0,45,0),#"tr_damageburst_t8");
    thread Spawn_RushWeapon((-6421,-650,-1650),(0,45,0),#"tr_leveraction_t8");
    thread Spawn_RushWeapon((-6451,-650,-1650),(0,45,0),#"tr_flechette_t8");

    thread Spawn_RushWeapon((-6151,-550,-1650),(0,45,0),#"sniper_fastrechamber_t8");
    thread Spawn_RushWeapon((-6181,-550,-1650),(0,45,0),#"sniper_powerbolt_t8");
    thread Spawn_RushWeapon((-6211,-550,-1650),(0,45,0),#"sniper_powersemi_t8");
    thread Spawn_RushWeapon((-6241,-550,-1650),(0,45,0),#"sniper_quickscope_t8");
    thread Spawn_RushWeapon((-6271,-550,-1650),(0,45,0),#"sniper_mini14_t8");
    thread Spawn_RushWeapon((-6301,-550,-1650),(0,45,0),#"sniper_locus_t8");
    thread Spawn_RushWeapon((-6331,-550,-1650),(0,45,0),#"sniper_damagesemi_t8");
    thread Spawn_RushWeapon((-6361,-550,-1650),(0,45,0),#"pistol_revolver_t8");
    thread Spawn_RushWeapon((-6391,-550,-1650),(0,45,0),#"pistol_burst_t8");
    thread Spawn_RushWeapon((-6421,-550,-1650),(0,45,0),#"pistol_fullauto_t8");
    thread Spawn_RushWeapon((-6451,-550,-1650),(0,45,0),#"lmg_double_t8");
    thread Spawn_RushWeapon((-6481,-550,-1650),(0,45,0),#"lmg_stealth_t8");

    thread VoyageMessage();
    thread VoyageOfDucks();
    thread VODCutsceneStuff();
    thread ScaleHidePlanets();
    thread SunSpawner();
    thread VehicleLogicSetup();
    thread WaterLogic();

    setdvar(#"hash_6ec233a56690f409", 0);
    setdvar(#"player_shallowwaterwadescale", 0);
    setdvar(#"player_waistwaterwadescale", 0);
    setdvar(#"player_deepwaterwadescale", 0);

    
    level.musicsystemoverride = 1;
    music::setmusicstate("location_underwater");

    while(!level.PickedOption)
    {
        wait 1;
    }

    wait 1;
    level.musicsystemoverride = 1;
    music::setmusicstate("zodt8_roundstart_first_1"); // play the start first music manually
}

WaterLogic()
{
    water = getEnt("ocean_water_hidden", "script_noteworthy");
    water_array = getentarray("ocean_water", "targetname");

    while(true)
    {
        foreach(walter in water_array) if(isdefined(walter)) walter SetInvisibleToAll();
        water SetInvisibleToAll();
        wait 10;
    }
}

VehicleLogicSetup()
{
    thread VehicleLogicMove(1, 1);
    thread VehicleLogicMove(30, 2);
    thread VehicleLogicMove(60, 3);
}

VehicleLogicMove(seconds, id)
{
    MainVeh = util::spawn_model(#"p7_zm_power_up_nuke", (0, 0, 0));
    MainVeh val::set("boney_jones_car", "takedamage", 0);

    veh_car = spawner::simple_spawn_single(getent("veh_fasttravel_cam", "targetname"));
    veh_car val::set("boney_jones_car", "takedamage", 0);
    MainVeh.origin = veh_car.origin;
    MainVeh linkto(veh_car);
    nd_start = getvehiclenode("jones_start_node", "targetname");
    MainVeh clientfield::set("" + #"car_fx", 1);
    wait(seconds);
    MainVeh thread VehiclePlanet(id);
    MainVeh thread RandomChanceSound();
    while (true) 
    {
        //MainVeh playsound(#"hash_785ac4e15d8585c4");
        MainVeh.var_e7bd7062 = 1;
        veh_car vehicle::get_on_and_go_path(nd_start);
        MainVeh notify(#"reached_end_node");
        MainVeh.var_e7bd7062 = 0;
    }
}

RandomChanceSound()
{
    while(true)
    {
        wait 15;
        if (randomIntRange(0, 100) < 10)
        {
            self playloopsound(#"hash_58eb809a42974bb0", 0.1);
            wait 60;
            self stoploopsound(0.1);
        }
    }
}

VehiclePlanet(id)
{
    switch(id)
    {
        case 1:
        FlyingSun = util::spawn_model("p8_zm_zod_planets_uranus_large", self.origin + (0, 0, 0));
        FlyingSun SetScale(0.15);
        FlyingSun enablelinkto();
        FlyingSun linkto(self);
        FlyingSun notSolid();

        FlyingSun1 = util::spawn_model("p8_zm_red_floatie_duck", self.origin + (0, 0, 0));
        FlyingSun1 SetScale(50);
        FlyingSun1 enablelinkto();
        FlyingSun1 linkto(self);
        FlyingSun1 notSolid();
        break;

        case 2:
        FlyingSun = util::spawn_model("p7_zm_power_up_nuke", self.origin + (0, 0, 0));
        FlyingSun SetScale(50);
        FlyingSun enablelinkto();
        FlyingSun linkto(self);
        FlyingSun notSolid();

        FlyingSun1 = util::spawn_model("p8_zm_red_floatie_duck", self.origin + (0, 0, 0));
        FlyingSun1 SetScale(50);
        FlyingSun1 enablelinkto();
        FlyingSun1 linkto(self);
        FlyingSun1 notSolid();
        break;

        case 3:
        FlyingSun = util::spawn_model(#"hash_32a51dafb1c7344f", self.origin + (0, -10, 0), (0, 180, 0));
        FlyingSun SetScale(1);
        FlyingSun enablelinkto();
        FlyingSun linkto(self);
        FlyingSun notSolid();

        FlyingSun1 = util::spawn_model(#"hash_32a51dafb1c7344f", self.origin + (0, 10, 0));
        FlyingSun1 SetScale(1);
        FlyingSun1 enablelinkto();
        FlyingSun1 linkto(self);
        FlyingSun1 notSolid();
        break;
    }
}

/#
// used for later
Pack = util::spawn_model("p7_zm_vending_packapunch", (-6800,-800,-1663), (0, 90, 0));
Pack zm_unitrigger::create(&Conds, 256, undefined, undefined, 1);
Pack thread checking();
Conds()
{
    cursor_hint = "HINT_NOICON";
    self setcursorhint(cursor_hint);
    self.hint_string = #"Test Herezzzz";
    self setHintString(self.hint_string);
    return 1;
}
checking()
{
    self endon(#"death");
    while(1)
    {
        self waittill(#"trigger_activated");

        foreach(player in level.players)
        {
            player iPrintLnBold("^5 Test");
        }
    }
}
#/

SunSpawner()
{
    level flag::wait_till("initial_blackscreen_passed");

    level.SunPlanet = util::spawn_model(#"p8_zm_zod_planets_sun_large", (0, 0, 8000));
    SunPlanet = level.SunPlanet;
    SunPlanet setCanDamage(1);

    foreach(player in level.players)
    {
        player thread DamageCheck();
    }

    callback::on_spawned(&DamageCheck); // if the player dies

    wait 3;
    while(true)
    {
        SunPlanet moveto((0, 5000, 8000) + vectorscale((0, 0, 1), 20), 9, 5, 0.5);
        SunPlanet rotateTo((randomint(180), randomint(180), randomint(180)), 9);
        SunPlanet waittill(#"movedone");
        SunPlanet moveto((0, -5000, 8000) + vectorscale((0, 0, 1), 20), 9, 5, 0.5);
        SunPlanet rotateTo((randomint(180), randomint(180), randomint(180)), 9);
        SunPlanet waittill(#"movedone");
        SunPlanet moveto((5000, 0, 8000) + vectorscale((0, 0, 1), 20), 9, 5, 0.5);
        SunPlanet rotateTo((randomint(180), randomint(180), randomint(180)), 9);
        SunPlanet waittill(#"movedone");
        SunPlanet moveto((-5000, 0, 8000) + vectorscale((0, 0, 1), 20), 9, 5, 0.5);
        SunPlanet rotateTo((randomint(180), randomint(180), randomint(180)), 9);
        SunPlanet waittill(#"movedone");
        SunPlanet moveto((0, 0, 8000) + vectorscale((0, 0, 1), 20), 9, 5, 0.5);
        SunPlanet rotateTo((randomint(180), randomint(180), randomint(180)), 9);
        SunPlanet waittill(#"movedone");
    }
}

DamageCheck()
{
    self endon(#"death");

    while (true)
    {
        s_result = undefined;
        s_result = self waittill(#"weapon_fired");

        v_forward = self getweaponforwarddir();
        v_start = self getweaponmuzzlepoint();
        sunny = level.SunPlanet;

        v_end = v_start + v_forward * 200000;
        b_hit = self CheckHitPlanet(sunny, v_start, v_end, v_forward);
        if (b_hit) 
        {
            v_trace_end = v_start + v_forward * 10000;
            a_trace = bullettrace(v_start, v_trace_end, 1, self);
            self util::show_hit_marker(1);
            
            switch (randomIntRange(1, 6))
            {
                case 1:
                foreach(player in level.players)
                {
                    player iPrintLn("^4 The Sun: Nothing here....");
                }
                break;

                case 2:
                foreach(player in level.players)
                {
                    player iPrintLn("^4 The Sun: Stop it!");
                }
                break;

                case 3:
                foreach(player in level.players)
                {
                    player iPrintLn("^4 The Sun: No...");
                }
                break;

                case 4:
                foreach(player in level.players)
                {
                    player iPrintLn("^4 The Sun: ...");
                }
                break;

                case 5:
                if (!level.PickedOption) break;
                if (level flag::get(#"boss_fight_started")) break;
                RandomLoc = randomIntRange(0, 4);
                switch(RandomLoc)
                {
                    case 0:
                    Location = "eng";
                    break;

                    case 1:
                    Location = "st";
                    break;

                    case 2:
                    Location = "pro";
                    break;

                    case 3:
                    Location = "pd";
                    break;
                }
                players = getplayers();
                players[0] [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::boss_teleport_players ]](Location);

                foreach(player in level.players)
                {
                    player iPrintLn("^1 The Sun: Fine!");
                }
                break;
            }

            self thread zm_audio::create_and_play_dialog(#"m_quest", #"hash_45e36c01ad8ad25c", 0, 1);
        }
        wait 2;
    }
}

CheckHitPlanet(planet, v_start, v_end, v_forward) 
{
    v_target = planet.origin;
    n_min_dist = 1048576;

    v_shot = pointonsegmentnearesttopoint(v_start, v_end, v_target);
    n_dist_squared = distancesquared(v_shot, v_target);
    if (n_dist_squared < n_min_dist)
    {
        return 1;
    }

    return 0;
}

VoyageOfDucks()
{
    level flag::wait_till("initial_blackscreen_passed"); // waits for players

    wait 3;

    a_iceberg = getentarray("forget_what_you_know", "targetname");
    foreach (mdl in a_iceberg) 
    {
        mdl SetScale(2);
        mdl.origin = (13500, -3000, 10000);
        mdl RotateTo((0, 0, 90), 0.5);
    }

    /#
    a_s_telegraphs = struct::get_array(#"s_telegraph");
    foreach (s_telegraph in a_s_telegraphs) 
    {
        quack4 = util::spawn_model("p8_zm_red_floatie_duck", s_telegraph.origin + (0, 0, 0));
        quack4 SetScale(50);
        quack4 notSolid();
        quack4 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    }

    mdlshort = getentarray("mdl_short", "targetname");
    mdllong = getentarray("mdl_long", "targetname");

    foreach (mdls in mdlshort) 
    {
        quack5 = util::spawn_model("p8_zm_red_floatie_duck", mdls.origin + (0, 0, 0));
        quack5 SetScale(50);
        quack5 notSolid();
        //quack5 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    }
    foreach (mdll in mdllong)
    {
        quack6 = util::spawn_model("p8_zm_red_floatie_duck", mdll.origin + (0, 0, 0));
        quack6 SetScale(50);
        quack6 notSolid();
        //quack6 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    }

    secretshhh = getent("secret_device", "targetname");

    secretshhh enableLinkTo();
    quack7 = util::spawn_model("p8_zm_red_floatie_duck", secretshhh.origin + (0, 0, 0));
    quack7 SetScale(50);
    quack7 notSolid();
    quack7 linkTo(secretshhh);

    special_entity = getent("special_entity", "targetname");

    special_entity enableLinkTo();
    quack8 = util::spawn_model("p8_zm_red_floatie_duck", special_entity.origin + (0, 0, 0));
    quack8 SetScale(50);
    quack8 notSolid();
    quack8 linkTo(special_entity);

    #/

    moonthing = getent("veh_fasttravel_cam", "targetname");
    duck1 = util::spawn_model("p8_zm_red_floatie_duck", moonthing.origin + (0, 0, 0));

    icebergwater = getent("iceberg_water", "targetname");
    duck2 = util::spawn_model("p8_zm_red_floatie_duck", icebergwater.origin + (0, 0, 0));

    waterendcut = getent("mov_ship_rob", "targetname");
    waterendcut enableLinkTo();
    quack10 = util::spawn_model("p8_zm_red_floatie_duck", waterendcut.origin + (0, 0, 0));
    quack10 SetScale(50);
    quack10 notSolid();
    quack10 linkTo(waterendcut);

    planetsthings = struct::get_array(#"planet_glyph", "script_noteworthy");
    foreach (s_loc in planetsthings) 
    {
        s_loc util::spawn_model("p8_zm_red_floatie_duck", s_loc.origin + (0, 0, 0));
    }

    sun = struct::get(#"loc_sun");
    quack11 = util::spawn_model("p8_zm_red_floatie_duck", sun.origin + (0, 0, 0));
    quack11 SetScale(50);
    quack11 notSolid();

    duck1 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck2 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    //quack4 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    //quack5 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    //quack6 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    //quack7 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    //quack8 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    //quack9 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    quack10 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    quack11 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
}

ScaleHidePlanets() // not an array key happens here sometimes..
{
    level endon(#"planet_step_completed");

    while(!isdefined(level.a_planets))
    {
        wait 1;
    }

    wait 3;
    while(!level flag::get(#"planet_step_completed"))
    {
        if(!isDefined(level.a_planets) || level.a_planets.size < 1)
        {
            wait 5;
            continue;
        }

        for (i = 0; i < level.a_planets.size; i++) 
        {
            wait 0.3;
            
            if (isDefined(level.a_planets[i]) && isDefined(level.a_planets[i].var_ddb0a5b4) && level.a_planets[i].var_ddb0a5b4 !== 0) // has been shot
             level.a_planets[i] SetScale(randomIntRange(1, 11));
        }
        wait 1;
    }
}

VoyageMessage()
{
    level flag::wait_till("initial_blackscreen_passed"); // waits for players

    wait 6;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^2 Welcome to Rush Mode!, Choose your GameMode From Here....");
    }
    wait 3;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^3 Widows Wine - Start Rush Mode with Skipped Clock Step! ");
    }
    wait 3;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^3 PaP - Start Rush Mode with Normal Clock Step! ");
    }
    wait 3;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^3 Iceberg - Start Rush Mode with Boss Fight Skip! ");
    }
}

AOMessage()
{
    level flag::wait_till("initial_blackscreen_passed"); // waits for players
    wait 3;

    wait 3;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^2 Welcome to Rush Mode!, Choose your GameMode From Here....");
    }
    wait 3;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^3 Widows Wine - Start Rush Mode with Skipped Clock Step! ");
    }
    wait 3;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^3 PaP - Start Rush Mode with Normal Clock Step! ");
    }
    wait 3;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^3 Speed Cola - Start Rush Mode with Boss Fight Skip! ");
    }
}

TagChange()
{
    foreach(player in level.players) player iPrintlnBold("^9 Well....... "); // rush mode text
    wait 2; // from here is hell setup
    level thread lui::screen_flash(0.2, 0.5, 1, 1, "white");
    wait(0.1);
    setlightingstate(1);
    level clientfield::set("" + #"lava_control", 1);
    level clientfield::set("" + #"hash_5e69ee96304ec40b", 1);
    if (!level flag::get(#"hash_4466889733a90df2")) 
    {
        level flag::set(#"hash_4466889733a90df2");
        foreach (var_59bd23de in level.var_eb7fcc70) 
        {
            var_59bd23de show();
            var_59bd23de solid();
        }
        level.var_71435e8 = 1;
        if (level.var_43c25ad2 !== 1) 
        {
            level.var_43c25ad2 = 1;
        }
        level flag::set(#"hash_198bc172b5af7f25");
        level flag::set(#"hash_69a9d00e65ee6c40");
    }
}

TagSpawnPoints()
{
    foreach(spawn in struct::get_array("initial_spawn", "script_noteworthy"))
    {
        spawn.origin = (-800,700,1085);
        spawn.angles = (0,90,0);
    }

    // triggers
    Floor = util::spawn_model("collision_nosight_wall_512x512x10", (-800,700,1080), (90, 0, 0));
    Floor1 = util::spawn_model("collision_nosight_wall_512x512x10", (-800,268,1080), (90, 0, 0));
    Floor2 = util::spawn_model("collision_nosight_wall_512x512x10", (-1285,700,1080), (90, 0, 0));
    Floor3 = util::spawn_model("collision_nosight_wall_512x512x10", (-425,700,1080), (90, 0, 0));

    Floor thread TriggerDeleteCheck();
    Floor1 thread TriggerDeleteCheck();
    Floor2 thread TriggerDeleteCheck();
    Floor3 thread TriggerDeleteCheck();

    // not needed (custom)
    //str_hint = zm_utility::function_d6046228(#"hash_1ea67965f84fd306", #"hash_4ca32e791c5048a2");

    thread Spawn_RushTrigger((-800,850,1080), "shield/normalrush", (0,0,0),#"p7_zm_vending_packapunch", &TagNormal, 5);
    thread Spawn_RushTrigger((-600,850,1080), "shield/bossrush", (0,0,0),#"p7_zm_vending_sleight", &TagSkipLockDown, 5);

    thread Spawn_RushNormalTrigger((-900,100,1080), "shield/rushpap", (0,180,0),#"p7_zm_vending_packapunch", &UpgradeWeapon, undefined, 1);
    thread Spawn_RushNormalTrigger((-700,100,1080), "shield/powerrush", (0,180,0),#"p7_zm_vending_widows_wine", &GearUpPower);

    // weapons and stuff
    thread Spawn_RushWeapon((-1150,650,1100),(0,45,0),#"cymbal_monkey");
    thread Spawn_RushWeapon((-1150,680,1100),(0,-90,0),#"launcher_standard_t8");

    thread Spawn_RushWeapon((-1100,500,1100),(0,-90,0),#"thundergun", undefined, undefined, false, 5); // crash if shot too fast
    thread Spawn_RushWeapon((-1100,555,1100),(0,-90,0),#"ww_tesla_gun_t8", undefined, undefined, false, 5);
    thread Spawn_RushWeapon((-1100,585,1100),(0,-90,0),#"ww_tesla_sniper_t8", undefined, undefined, false, 5);
    thread Spawn_RushWeapon((-1100,620,1100),(0,-90,0),#"tundragun", undefined, undefined, false, 5);
    thread Spawn_RushWeapon((-1100,660,1100),(0,-90,0),#"ray_gun");
    thread Spawn_RushWeapon((-1100,700,1100),(0,-90,0),#"ray_gun_mk2");
    thread Spawn_RushWeapon((-1100,740,1100),(0,-90,0),#"music_box");
    thread Spawn_RushWeapon((-1100,780,1100),(0,0,0),#"zhield_dw");
    thread Spawn_RushWeapon((-1100,820,1100),(0,0,0),#"snowball_yellow_upgraded");
    thread Spawn_RushWeapon((-1100,860,1100),(0,0,0),#"hash_7a42b57be462143f");
    thread Spawn_RushWeapon((-1100,885,1100),(0,45,0),#"special_ballisticknife_t8_dw");
    thread Spawn_RushWeapon((-1100,915,1100),(0,45,0),#"special_crossbow_t8");

    thread Spawn_RushWeapon((-1150,500,1100),(0,45,0),#"shotgun_pump_t8");
    thread Spawn_RushWeapon((-1150,530,1100),(0,45,0),#"shotgun_semiauto_t8");
    thread Spawn_RushWeapon((-1150,560,1100),(0,45,0),#"shotgun_trenchgun_t8");
    thread Spawn_RushWeapon((-1150,590,1100),(0,45,0),#"shotgun_fullauto_t8");
    thread Spawn_RushWeapon((-1150,620,1100),(0,45,0),#"shotgun_precision_t8");
    
    thread Spawn_RushWeapon((-1200,500,1100),(0,45,0),#"ar_accurate_t8");
    thread Spawn_RushWeapon((-1200,530,1100),(0,45,0),#"ar_fastfire_t8");
    thread Spawn_RushWeapon((-1200,560,1100),(0,45,0),#"ar_damage_t8");
    thread Spawn_RushWeapon((-1200,590,1100),(0,45,0),#"ar_stealth_t8");
    thread Spawn_RushWeapon((-1200,620,1100),(0,45,0),#"ar_modular_t8");
    thread Spawn_RushWeapon((-1200,650,1100),(0,45,0),#"ar_mg1909_t8");
    thread Spawn_RushWeapon((-1200,680,1100),(0,45,0),#"ar_standard_t8");
    thread Spawn_RushWeapon((-1200,710,1100),(0,45,0),#"ar_galil_t8");
    thread Spawn_RushWeapon((-1200,740,1100),(0,45,0),#"ar_peacekeeper_t8");
    thread Spawn_RushWeapon((-1200,770,1100),(0,45,0),#"ar_doublebarrel_t8");
    thread Spawn_RushWeapon((-1200,800,1100),(0,45,0),#"ar_an94_t8");

    thread Spawn_RushWeapon((-1250,500,1100),(0,45,0),#"smg_folding_t8");
    thread Spawn_RushWeapon((-1250,530,1100),(0,45,0),#"smg_drum_pistol_t8");
    thread Spawn_RushWeapon((-1250,560,1100),(0,45,0),#"smg_accurate_t8");
    thread Spawn_RushWeapon((-1250,590,1100),(0,45,0),#"smg_fastfire_t8");
    thread Spawn_RushWeapon((-1250,620,1100),(0,45,0),#"smg_capacity_t8");
    thread Spawn_RushWeapon((-1250,650,1100),(0,45,0),#"smg_handling_t8");
    thread Spawn_RushWeapon((-1250,680,1100),(0,45,0),#"smg_standard_t8");
    thread Spawn_RushWeapon((-1250,710,1100),(0,45,0),#"smg_minigun_t8");
    thread Spawn_RushWeapon((-1250,740,1100),(0,45,0),#"smg_vmp_t8");
    thread Spawn_RushWeapon((-1250,770,1100),(0,45,0),#"smg_fastburst_t8");
    thread Spawn_RushWeapon((-1250,800,1100),(0,45,0),#"smg_mp40_t8");
    //thread Spawn_RushWeapon((-6481,-750,-1650),(0,45,0),#"smg_thompson_t8");

    thread Spawn_RushWeapon((-1300,500,1100),(0,45,0),#"tr_powersemi_t8");
    thread Spawn_RushWeapon((-1300,530,1100),(0,45,0),#"tr_longburst_t8");
    thread Spawn_RushWeapon((-1300,560,1100),(0,45,0),#"tr_midburst_t8");
    thread Spawn_RushWeapon((-1300,590,1100),(0,45,0),#"lmg_heavy_t8");
    thread Spawn_RushWeapon((-1300,620,1100),(0,45,0),#"lmg_spray_t8");
    thread Spawn_RushWeapon((-1300,650,1100),(0,45,0),#"lmg_standard_t8");
    thread Spawn_RushWeapon((-1300,680,1100),(0,45,0),#"pistol_standard_t8");
    thread Spawn_RushWeapon((-1300,710,1100),(0,45,0),#"pistol_topbreak_t8");
    thread Spawn_RushWeapon((-1300,740,1100),(0,45,0),#"tr_damageburst_t8");
    thread Spawn_RushWeapon((-1300,770,1100),(0,45,0),#"tr_leveraction_t8");
    thread Spawn_RushWeapon((-1300,800,1100),(0,45,0),#"tr_flechette_t8");

    thread Spawn_RushWeapon((-1350,500,1100),(0,45,0),#"sniper_fastrechamber_t8");
    thread Spawn_RushWeapon((-1350,530,1100),(0,45,0),#"sniper_powerbolt_t8");
    thread Spawn_RushWeapon((-1350,560,1100),(0,45,0),#"sniper_powersemi_t8");
    thread Spawn_RushWeapon((-1350,590,1100),(0,45,0),#"sniper_quickscope_t8");
    thread Spawn_RushWeapon((-1350,620,1100),(0,45,0),#"sniper_mini14_t8");
    thread Spawn_RushWeapon((-1350,650,1100),(0,45,0),#"sniper_locus_t8");
    thread Spawn_RushWeapon((-1350,680,1100),(0,45,0),#"sniper_damagesemi_t8");
    thread Spawn_RushWeapon((-1350,710,1100),(0,45,0),#"pistol_revolver_t8");
    thread Spawn_RushWeapon((-1350,740,1100),(0,45,0),#"pistol_burst_t8");
    thread Spawn_RushWeapon((-1350,770,1100),(0,45,0),#"pistol_fullauto_t8");
    thread Spawn_RushWeapon((-1350,800,1100),(0,45,0),#"lmg_double_t8");
    thread Spawn_RushWeapon((-1350,830,1100),(0,45,0),#"lmg_stealth_t8");
    
    level flag::wait_till("all_players_spawned"); // waits for players 

    foreach(player in level.players)
    {       
        player SetRandomOrigin((-750,700,1085), (0,90,0));
    }

    level flag::wait_till("initial_blackscreen_passed"); // waits for players

    thread TagEndCutsceneStuff();
    thread TagMessage();
}

TagMessage()
{
    wait 6;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^2 Welcome to Rush Mode!, Choose your GameMode From Here....");
    }
    wait 3;
    foreach(player in level.players)
    {
        player iPrintLnBold("^3 PaP - Start Normal Rush Mode! ");
    }
    wait 3;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^3 Speed Cola - Start Rush Mode with Final Lockdown Skip! ");
    }
    zm_audio::sndannouncerplayvox(#"freeze_mode"); // "Don't Freeze!"
}

AncientEvilSpawnPoints()
{
    foreach(spawn in struct::get_array("initial_spawn", "script_noteworthy"))
    {
        spawn.origin = (2379,-4500,-819);
        spawn.angles = (0,180,0);
    }

    // triggers < not needed (custom)
    //HintString = zm_utility::function_d6046228(#"hash_cb9ec6ff4ccecb8", #"hash_2bbe0121500d0f4");
    // old > zm_utility::function_d6046228(#"hash_7b3248a20689a28d", #"hash_10f3f07d744bca73");

    thread Spawn_RushTrigger((2122,-4650,-805), "shield/questAErush", (0,90,0),#"p7_zm_vending_widows_wine", &SkipAEOil, 5, true);
    thread Spawn_RushTrigger((2122,-4500,-805), "shield/normalrush", (0,90,0),#"p7_zm_vending_packapunch", &NonSkipAEOil, 5);
    thread Spawn_RushTrigger((2122,-4350,-805), "shield/bossrush", (0,90,0),#"p7_zm_vending_sleight", &BossSkipAE, 5);

    thread Spawn_RushNormalTrigger((2450,-4660,-820), "shield/rushpap", (0,180,0),#"p7_zm_vending_packapunch", &UpgradeWeapon, undefined, 1);
    thread Spawn_RushNormalTrigger((2330,-4660,-820), "shield/powerrush", (0,180,0),#"p7_zm_vending_widows_wine", &GearUpPower);

    // weapons and stuff
    thread Spawn_RushWeapon((2950,-4220,-805),(0,45,0),#"homunculus");
    thread Spawn_RushWeapon((2920,-4220,-805),(0,-90,0),#"zhield_zpear_dw");
    thread Spawn_RushWeapon((2890,-4220,-805),(0,-90,0),#"launcher_standard_t8");
    thread Spawn_RushWeapon((2860,-4220,-805),(0,-90,0),#"Thunderstorm");

    thread Spawn_RushWeapon((2900,-4280,-805),(0,-90,0),#"ww_hand_c");
    thread Spawn_RushWeapon((2860,-4280,-805),(0,-90,0),#"ww_hand_g");
    thread Spawn_RushWeapon((2830,-4280,-805),(0,-90,0),#"ww_hand_h");
    thread Spawn_RushWeapon((2800,-4280,-805),(0,-90,0),#"ww_hand_o");

    thread Spawn_RushWeapon((2950,-4160,-805),(0,45,0),#"special_ballisticknife_t8_dw");
    thread Spawn_RushWeapon((2920,-4160,-805),(0,45,0),#"special_crossbow_t8");
    thread Spawn_RushWeapon((2890,-4160,-805),(0,45,0),#"shotgun_pump_t8");
    thread Spawn_RushWeapon((2860,-4160,-805),(0,45,0),#"shotgun_semiauto_t8");
    thread Spawn_RushWeapon((2830,-4160,-805),(0,45,0),#"shotgun_trenchgun_t8");
    thread Spawn_RushWeapon((2800,-4160,-805),(0,45,0),#"shotgun_fullauto_t8");
    thread Spawn_RushWeapon((2770,-4160,-805),(0,45,0),#"shotgun_precision_t8");

    thread Spawn_RushWeapon((2950,-4100,-805),(0,45,0),#"ar_accurate_t8");
    thread Spawn_RushWeapon((2920,-4100,-805),(0,45,0),#"ar_fastfire_t8");
    thread Spawn_RushWeapon((2890,-4100,-805),(0,45,0),#"ar_damage_t8");
    thread Spawn_RushWeapon((2860,-4100,-805),(0,45,0),#"ar_stealth_t8");
    thread Spawn_RushWeapon((2830,-4100,-805),(0,45,0),#"ar_modular_t8");
    thread Spawn_RushWeapon((2800,-4100,-805),(0,45,0),#"ar_mg1909_t8");
    thread Spawn_RushWeapon((2770,-4100,-805),(0,45,0),#"ar_standard_t8");
    thread Spawn_RushWeapon((2740,-4100,-805),(0,45,0),#"ar_galil_t8");
    thread Spawn_RushWeapon((2710,-4100,-805),(0,45,0),#"ar_peacekeeper_t8");
    thread Spawn_RushWeapon((2680,-4100,-805),(0,45,0),#"ar_doublebarrel_t8");
    thread Spawn_RushWeapon((2650,-4100,-805),(0,45,0),#"ar_an94_t8");

    thread Spawn_RushWeapon((2950,-4040,-805),(0,45,0),#"smg_folding_t8");
    thread Spawn_RushWeapon((2920,-4040,-805),(0,45,0),#"smg_drum_pistol_t8");
    thread Spawn_RushWeapon((2890,-4040,-805),(0,45,0),#"smg_accurate_t8");
    thread Spawn_RushWeapon((2860,-4040,-805),(0,45,0),#"smg_fastfire_t8");
    thread Spawn_RushWeapon((2830,-4040,-805),(0,45,0),#"smg_capacity_t8");
    thread Spawn_RushWeapon((2800,-4040,-805),(0,45,0),#"smg_handling_t8");
    thread Spawn_RushWeapon((2770,-4040,-805),(0,45,0),#"smg_standard_t8");
    thread Spawn_RushWeapon((2740,-4040,-805),(0,45,0),#"smg_minigun_t8");
    thread Spawn_RushWeapon((2710,-4040,-805),(0,45,0),#"smg_vmp_t8");
    thread Spawn_RushWeapon((2680,-4040,-805),(0,45,0),#"smg_fastburst_t8");
    thread Spawn_RushWeapon((2650,-4040,-805),(0,45,0),#"smg_mp40_t8");
    //thread Spawn_RushWeapon((-6481,-750,-1650),(0,45,0),#"smg_thompson_t8");

    thread Spawn_RushWeapon((2950,-3980,-805),(0,45,0),#"tr_powersemi_t8");
    thread Spawn_RushWeapon((2920,-3980,-805),(0,45,0),#"tr_longburst_t8");
    thread Spawn_RushWeapon((2890,-3980,-805),(0,45,0),#"tr_midburst_t8");
    thread Spawn_RushWeapon((2860,-3980,-805),(0,45,0),#"lmg_heavy_t8");
    thread Spawn_RushWeapon((2830,-3980,-805),(0,45,0),#"lmg_spray_t8");
    thread Spawn_RushWeapon((2800,-3980,-805),(0,45,0),#"lmg_standard_t8");
    thread Spawn_RushWeapon((2770,-3980,-805),(0,45,0),#"pistol_standard_t8");
    thread Spawn_RushWeapon((2740,-3980,-805),(0,45,0),#"pistol_topbreak_t8");
    thread Spawn_RushWeapon((2710,-3980,-805),(0,45,0),#"tr_damageburst_t8");
    thread Spawn_RushWeapon((2680,-3980,-805),(0,45,0),#"tr_leveraction_t8");
    thread Spawn_RushWeapon((2650,-3980,-805),(0,45,0),#"tr_flechette_t8");

    thread Spawn_RushWeapon((2950,-3920,-805),(0,45,0),#"sniper_fastrechamber_t8");
    thread Spawn_RushWeapon((2920,-3920,-805),(0,45,0),#"sniper_powerbolt_t8");
    thread Spawn_RushWeapon((2890,-3920,-805),(0,45,0),#"sniper_powersemi_t8");
    thread Spawn_RushWeapon((2860,-3920,-805),(0,45,0),#"sniper_quickscope_t8");
    thread Spawn_RushWeapon((2830,-3920,-805),(0,45,0),#"sniper_mini14_t8");
    thread Spawn_RushWeapon((2800,-3920,-805),(0,45,0),#"sniper_locus_t8");
    thread Spawn_RushWeapon((2770,-3920,-805),(0,45,0),#"sniper_damagesemi_t8");
    thread Spawn_RushWeapon((2740,-3920,-805),(0,45,0),#"pistol_revolver_t8");
    thread Spawn_RushWeapon((2710,-3920,-805),(0,45,0),#"pistol_burst_t8");
    thread Spawn_RushWeapon((2680,-3920,-805),(0,45,0),#"pistol_fullauto_t8");
    thread Spawn_RushWeapon((2650,-3920,-805),(0,45,0),#"lmg_double_t8");
    thread Spawn_RushWeapon((2620,-3920,-805),(0,45,0),#"lmg_stealth_t8");

    thread DucksAncient();
    
    movepap((-1350,-975,64), (0,10,0) + (0,90,0), 1);
    
    level flag::wait_till("all_players_spawned"); // waits for players 

    foreach(player in level.players)
    {       
        player SetRandomOrigin((2379,-4500,-819));
    }

    level flag::wait_till("initial_blackscreen_passed"); // waits for players
    thread AEMessage();
    thread AECutsceneStuff();
    thread AEFixIGC();
    thread AEFlameActivate();
}

AEFlameActivate()
{
    wait 5;

    level.var_705db276 = 3;
    [[ @namespace_c8efdadc<script_6c983b627f4a3d51.gsc>::function_9c8540b4 ]](level.players[0]); // player, amount
}

DucksAncient()
{
    level flag::wait_till("initial_blackscreen_passed"); // waits for players

    for (i = 1; i <= 3; i++) 
    {
        rune = getent("rune_" + i, "targetname");
        duck = util::spawn_model("p8_zm_red_floatie_duck", rune.origin + (0, 0, 0));
        duck SetScale(50);
    }

    cavedoor = getent("cave_door", "targetname");

    duck1 = util::spawn_model("p8_zm_red_floatie_duck", cavedoor.origin + (0, 0, 0));
    duck1 SetScale(3);

    vol = getent("vol_reflect", "targetname");

    duck2 = util::spawn_model("p8_zm_red_floatie_duck", vol.origin + (0, 0, 0));
    duck2 SetScale(3);

    codeeasy = getent("mdl_prophecy_code_easy", "targetname");
    codemed = getent("mdl_prophecy_code_medium", "targetname");
    codehard = getent("mdl_prophecy_code_hard", "targetname");

    block = getent("mdl_prophecy_block", "targetname");

    duck3 = util::spawn_model("p8_zm_red_floatie_duck", codeeasy.origin + (0, 0, 0));
    duck3 SetScale(3);
    duck4 = util::spawn_model("p8_zm_red_floatie_duck", codemed.origin + (0, 0, 0));
    duck4 SetScale(3);
    duck5 = util::spawn_model("p8_zm_red_floatie_duck", codehard.origin + (0, 0, 0));
    duck5 SetScale(3);
    duck6 = util::spawn_model("p8_zm_red_floatie_duck", block.origin + (0, 0, 0));
    duck6 SetScale(3);

    t_close = getent("t_light_fuel_ignite_close", "targetname");
    t_far = getent("t_light_fuel_ignite_far", "targetname");

    duck7 = util::spawn_model("p8_zm_red_floatie_duck", t_close.origin + (0, 0, 0));
    duck7 SetScale(3);
    duck8 = util::spawn_model("p8_zm_red_floatie_duck", t_far.origin + (0, 0, 0));
    duck8 SetScale(3);

    brush = getent("script_brush_hole_blend_01", "targetname");

    duck9 = util::spawn_model("p8_zm_red_floatie_duck", brush.origin + (0, 0, 0));
    duck9 SetScale(3);

    mdlplay = getent("mdl_play_leave", "targetname");

    duck10 = util::spawn_model("p8_zm_red_floatie_duck", mdlplay.origin + (0, 0, 0));
    duck10 SetScale(3);

    vol_stage = getent("vol_play_away", "targetname");
    vol_home = getent("vol_play_home", "targetname");

    duck11 = util::spawn_model("p8_zm_red_floatie_duck", vol_stage.origin + (0, 0, 0));
    duck11 SetScale(3);
    duck12 = util::spawn_model("p8_zm_red_floatie_duck", vol_home.origin + (0, 0, 0));
    duck12 SetScale(3);

    mdl_door = getent("mdl_blood_code", "targetname");

    duck13 = util::spawn_model("p8_zm_red_floatie_duck", mdl_door.origin + (0, 0, 0));
    duck13 SetScale(1.3);

    mdl_weapon_clip = getent("mdl_blood_bounce", "targetname");

    duck14 = util::spawn_model("p8_zm_red_floatie_duck", mdl_weapon_clip.origin + (0, 0, 0));
    duck14 SetScale(1.3);

    mdl_door1 = getent("portico_model", "targetname");

    duck15 = util::spawn_model("p8_zm_red_floatie_duck", mdl_door1.origin + (0, 0, 0));
    duck15 SetScale(1.3);

    foreach(port in getentarray("portico_clip", "targetname"))
    {
        duck16 = util::spawn_model("p8_zm_red_floatie_duck", port.origin + (0, 0, 0));
        duck16 SetScale(3);
    }

    sunlight = struct::get(#"hash_4625361373037689");
    sunlight1 = struct::get(#"hash_9e0e9cf53602f0a");

    duck17 = util::spawn_model("p8_zm_red_floatie_duck", sunlight.origin + (0, 0, 0));
    duck17 SetScale(3);
    duck18 = util::spawn_model("p8_zm_red_floatie_duck", sunlight1.origin + (0, 0, 0));
    duck18 SetScale(3);

    s_mirror = struct::get(#"split_mirror");

    duck20 = util::spawn_model("p8_zm_red_floatie_duck", s_mirror.origin + (0, 0, 0));
    duck20 SetScale(50);

    split = struct::get(#"split_final");

    duck22 = util::spawn_model("p8_zm_red_floatie_duck", split.origin + (0, 0, 0));
    duck22 SetScale(50);

    s_fountain = struct::get(#"split_center");

    duck23 = util::spawn_model("p8_zm_red_floatie_duck", s_fountain.origin + (0, 0, 0));
    duck23 SetScale(50);

    s_target = struct::get(#"hash_2419db3559d2bbcb");

    duck24 = util::spawn_model("p8_zm_red_floatie_duck", s_target.origin + (0, 0, 0));
    duck24 SetScale(3);

    a_s_spotlights1 = struct::get(#"hash_11302005e130b7eb");
    a_s_spotlights2 = struct::get(#"hash_2b292979020933aa");
    a_s_spotlights3 = struct::get(#"hash_286a392e24892dee");
    a_s_spotlights4 = struct::get(#"hash_5ae30fa5823821ee");
    a_s_spotlights5 = struct::get(#"hash_2038ad2a6cbb9188");
    a_s_spotlights6 = struct::get(#"hash_2038b02a6cbb96a1");
    a_s_spotlights7 = struct::get(#"hash_2038af2a6cbb94ee");
    a_s_spotlights8 = struct::get(#"hash_2038b22a6cbb9a07");

    duck25 = util::spawn_model("p8_zm_red_floatie_duck", a_s_spotlights1.origin + (0, 0, 0));
    duck25 SetScale(2);
    duck26 = util::spawn_model("p8_zm_red_floatie_duck", a_s_spotlights2.origin + (0, 0, 0));
    duck26 SetScale(2);
    duck27 = util::spawn_model("p8_zm_red_floatie_duck", a_s_spotlights3.origin + (0, 0, 0));
    duck27 SetScale(2);
    duck28 = util::spawn_model("p8_zm_red_floatie_duck", a_s_spotlights4.origin + (0, 0, 0));
    duck28 SetScale(2);
    duck29 = util::spawn_model("p8_zm_red_floatie_duck", a_s_spotlights5.origin + (0, 0, 0));
    duck29 SetScale(2);
    duck30 = util::spawn_model("p8_zm_red_floatie_duck", a_s_spotlights6.origin + (0, 0, 0));
    duck30 SetScale(2);
    duck31 = util::spawn_model("p8_zm_red_floatie_duck", a_s_spotlights7.origin + (0, 0, 0));
    duck31 SetScale(2);
    duck32 = util::spawn_model("p8_zm_red_floatie_duck", a_s_spotlights8.origin + (0, 0, 0));
    duck32 SetScale(2);

    duck1 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck2 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck3 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck4 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck5 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck6 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck7 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck8 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck9 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck10 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck11 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck12 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck13 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck14 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck15 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck16 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck17 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck18 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck20 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck22 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck23 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck24 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck25 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck26 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck27 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck28 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck29 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck30 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck31 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    duck32 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
}

AEMessage()
{
    wait 6;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^2 Welcome to Rush Mode!, Choose your GameMode From Here....");
    }
    wait 3;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^3 Widows Wine - Start Rush Mode with Skipped Oil Step! ");
    }
    wait 3;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^3 PaP - Start Rush Mode with Normal Oil Step! ");
    }
    wait 3;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^3 Speed Cola - Start Rush Mode with Boss Fight Skip! ");
    }
}

BloodSpawnPoints()
{
    // hash_4c75fc5691b181cc
    // spawn = 2208,8706,1144 angles = 0,-180,0
    // perk = 1848

    foreach(spawn in struct::get_array("initial_spawn", "script_noteworthy"))
    {
        spawn.origin = (2208,8706,1144);
        spawn.angles = (0,-180,0);
    }

    // triggers
    thread Spawn_RushTrigger((1848,8506,1144), "shield/questBOTDbird", (0,90,0),#"p7_zm_vending_widows_wine", &BirdSkipBlood, 5, true);
    thread Spawn_RushTrigger((1848,8706,1144), "shield/normalrush", (0,90,0),#"p7_zm_vending_packapunch", &NormalBlood, 5);
    thread Spawn_RushTrigger((1658, 8583, 1336), "shield/questBOTDchall", (0,90,0),#"p7_zm_vending_sleight", &ChallengesSkipBlood, 5);
    thread Spawn_RushTrigger((2000,8406,1144), "shield/bossrush", (0,-180,0),#"p7_zm_vending_nuke", &FullSkipBlood, 5);

    thread Spawn_RushNormalTrigger((2370,9180,1145), "shield/rushpap", (0,0,0),#"p7_zm_vending_packapunch", &UpgradeWeapon, undefined, 1);
    thread Spawn_RushNormalTrigger((2510,9180,1185), "shield/powerrush", (0,0,0),#"zombie_pickup_perk_bottle", &GearUpPower);

    // weapons
    thread Spawn_RushWeapon((2900,8800,1165),(0,45,0),#"ww_blundergat_fire_t8");
    thread Spawn_RushWeapon((2900,8830,1165),(0,45,0),#"ww_blundergat_acid_t8");
    thread Spawn_RushWeapon((2900,8860,1165),(0,45,0),#"ww_blundergat_t8");
    thread Spawn_RushWeapon((2900,8890,1165),(0,45,0),#"launcher_standard_t8");
    thread Spawn_RushWeapon((2900,8920,1165),(0,145,0),#"cymbal_monkey");
    thread Spawn_RushWeapon((2900,8950,1165),(0,45,0),#"special_ballisticknife_t8_dw");
    thread Spawn_RushWeapon((2900,8980,1165),(0,45,0),#"special_crossbow_t8");
    thread Spawn_RushWeapon((2900,9010,1165),(0,45,0),#"ray_gun_mk2");
    thread Spawn_RushWeapon((2900,9040,1165),(0,45,0),#"ray_gun");

    thread Spawn_RushWeapon((2850,8800,1165),(0,45,0),#"shotgun_pump_t8");
    thread Spawn_RushWeapon((2850,8830,1165),(0,45,0),#"shotgun_semiauto_t8");
    thread Spawn_RushWeapon((2850,8860,1165),(0,45,0),#"shotgun_trenchgun_t8");
    thread Spawn_RushWeapon((2850,8890,1165),(0,45,0),#"shotgun_fullauto_t8");
    thread Spawn_RushWeapon((2850,8920,1165),(0,45,0),#"shotgun_precision_t8");

    thread Spawn_RushWeapon((2800,8800,1165),(0,45,0),#"ar_accurate_t8");
    thread Spawn_RushWeapon((2800,8830,1165),(0,45,0),#"ar_fastfire_t8");
    thread Spawn_RushWeapon((2800,8860,1165),(0,45,0),#"ar_damage_t8");
    thread Spawn_RushWeapon((2800,8890,1165),(0,45,0),#"ar_stealth_t8");
    thread Spawn_RushWeapon((2800,8920,1165),(0,45,0),#"ar_modular_t8");
    thread Spawn_RushWeapon((2800,8950,1165),(0,45,0),#"ar_mg1909_t8");
    thread Spawn_RushWeapon((2800,8980,1165),(0,45,0),#"ar_standard_t8");
    thread Spawn_RushWeapon((2800,9010,1165),(0,45,0),#"ar_galil_t8");
    thread Spawn_RushWeapon((2800,9040,1165),(0,45,0),#"ar_peacekeeper_t8");
    thread Spawn_RushWeapon((2800,9070,1165),(0,45,0),#"ar_doublebarrel_t8");
    thread Spawn_RushWeapon((2800,9100,1165),(0,45,0),#"ar_an94_t8");

    thread Spawn_RushWeapon((2750,8800,1165),(0,45,0),#"smg_folding_t8");
    thread Spawn_RushWeapon((2750,8830,1165),(0,45,0),#"smg_drum_pistol_t8");
    thread Spawn_RushWeapon((2750,8860,1165),(0,45,0),#"smg_accurate_t8");
    thread Spawn_RushWeapon((2750,8890,1165),(0,45,0),#"smg_fastfire_t8");
    thread Spawn_RushWeapon((2750,8920,1165),(0,45,0),#"smg_capacity_t8");
    thread Spawn_RushWeapon((2750,8950,1165),(0,45,0),#"smg_handling_t8");
    thread Spawn_RushWeapon((2750,8980,1165),(0,45,0),#"smg_standard_t8");
    thread Spawn_RushWeapon((2750,9010,1165),(0,45,0),#"smg_minigun_t8");
    thread Spawn_RushWeapon((2750,9040,1165),(0,45,0),#"smg_vmp_t8");
    thread Spawn_RushWeapon((2750,9070,1165),(0,45,0),#"smg_fastburst_t8");
    thread Spawn_RushWeapon((2750,9100,1165),(0,45,0),#"smg_mp40_t8");
    //thread Spawn_RushWeapon((-6481,-750,-1650),(0,45,0),#"smg_thompson_t8");

    thread Spawn_RushWeapon((2700,8800,1165),(0,45,0),#"tr_powersemi_t8");
    thread Spawn_RushWeapon((2700,8830,1165),(0,45,0),#"tr_longburst_t8");
    thread Spawn_RushWeapon((2700,8860,1165),(0,45,0),#"tr_midburst_t8");
    thread Spawn_RushWeapon((2700,8890,1165),(0,45,0),#"lmg_heavy_t8");
    thread Spawn_RushWeapon((2700,8920,1165),(0,45,0),#"lmg_spray_t8");
    thread Spawn_RushWeapon((2700,8950,1165),(0,45,0),#"lmg_standard_t8");
    thread Spawn_RushWeapon((2700,8980,1165),(0,45,0),#"pistol_standard_t8");
    thread Spawn_RushWeapon((2700,9010,1165),(0,45,0),#"pistol_topbreak_t8");
    thread Spawn_RushWeapon((2700,9040,1165),(0,45,0),#"tr_damageburst_t8");
    thread Spawn_RushWeapon((2700,9070,1165),(0,45,0),#"tr_leveraction_t8");
    thread Spawn_RushWeapon((2700,9100,1165),(0,45,0),#"tr_flechette_t8");

    thread Spawn_RushWeapon((2650,8800,1165),(0,45,0),#"sniper_fastrechamber_t8");
    thread Spawn_RushWeapon((2650,8830,1165),(0,45,0),#"sniper_powerbolt_t8");
    thread Spawn_RushWeapon((2650,8860,1165),(0,45,0),#"sniper_powersemi_t8");
    thread Spawn_RushWeapon((2650,8890,1165),(0,45,0),#"sniper_quickscope_t8");
    thread Spawn_RushWeapon((2650,8920,1165),(0,45,0),#"sniper_mini14_t8");
    thread Spawn_RushWeapon((2650,8950,1165),(0,45,0),#"sniper_locus_t8");
    thread Spawn_RushWeapon((2650,8980,1165),(0,45,0),#"sniper_damagesemi_t8");
    thread Spawn_RushWeapon((2650,9010,1165),(0,45,0),#"pistol_revolver_t8");
    thread Spawn_RushWeapon((2650,9040,1165),(0,45,0),#"pistol_burst_t8");
    thread Spawn_RushWeapon((2650,9070,1165),(0,45,0),#"pistol_fullauto_t8");
    thread Spawn_RushWeapon((2650,9100,1165),(0,45,0),#"lmg_double_t8");
    thread Spawn_RushWeapon((2650,9130,1165),(0,45,0),#"lmg_stealth_t8");

    thread Spawn_RushWeapon((2267,9077,1150),(0,145,0),#"tomahawk_t8_upgraded");
    thread Spawn_RushWeapon((1846, 8820, 1144),(0,145,0),#"zhield_spectral_dw_upgraded");
    thread Spawn_RushWeapon((1846, 8865, 1144),(0,145,0),#"spknifeork", #"hash_22b0dee6b3f9865b");

    OldOrigin = struct::get("t_tom_pos", "targetname").origin;
    OldOriginV = struct::get("tom_pil").origin;

    struct::get("t_tom_pos", "targetname").origin = (2267,9077,1144);
    struct::get("tom_pil").origin = (2267,9077,1144);

    level flag::wait_till("all_players_spawned"); // waits for players 

    foreach(player in level.players)
    {       
        player SetRandomOrigin((2208,8706,1144));
    }

    level flag::wait_till("initial_blackscreen_passed"); // waits for players

    thread BloodMessage();
    thread BloodCutsceneStuff();
    thread BloodDucks();

    while(level.PickedOption == false)
    {
        wait 1;
    }

    wait 1;
    foreach(player in level.players)
    {
        player SetRandomOrigin((1345,10603,1330));
    }

    // skip the wall step
    struct::get("t_tom_pos", "targetname").origin = OldOrigin;
    struct::get("tom_pil").origin = OldOriginV;
    thread BirdDuck();
    //thread customTomahawkPickup(); no 19 error please
}

BirdDuck()
{
    wait 3;

    if (level.SkippedBird)
    {
        return;
    }

    while(!isdefined(level.var_dcc985c4))
    {
        wait 1;
    }

    bird = level.var_dcc985c4;
    mainbird = bird.var_e5c7e01a;

    mainbird enableLinkTo();
    Duck = util::spawn_model("p8_zm_red_floatie_duck", mainbird.origin + (0, 0, 0));
    Duck enableLinkTo();
    Duck linkTo(mainbird);
    Duck SetScale(2.5);

    wait 10;

    foreach(player in level.players)
    {
        player iPrintLnBold("^5Helping - ^2The Bird is in ^9"+bird.script_string+"! ");
    }

    level waittill(#"seagull_blasted");
    wait 10;

    bird = level.var_dcc985c4;
    mainbird = bird.var_e5c7e01a;

    foreach(player in level.players)
    {
        player iPrintLnBold("^2Helping - ^2The Bird is in ^9"+bird.script_string+"! ");
    }

    Duck = util::spawn_model("p8_zm_red_floatie_duck", mainbird.origin + (0, 0, 0));
    Duck enableLinkTo();
    Duck linkTo(mainbird);
    Duck SetScale(2.5);

    level waittill(#"seagull_blasted");
    wait 10;

    bird = level.var_dcc985c4;
    mainbird = bird.var_e5c7e01a;

    foreach(player in level.players)
    {
        player iPrintLnBold("^8Helping - ^2The Bird is in ^9"+bird.script_string+"! ");
    }

    Duck = util::spawn_model("p8_zm_red_floatie_duck", mainbird.origin + (0, 0, 0));
    Duck enableLinkTo();
    Duck linkTo(mainbird);
    Duck SetScale(2.5);

    level waittill(#"seagull_blasted");
    wait 10;

    bird = level.var_dcc985c4;
    mainbird = bird.var_e5c7e01a;

    foreach(player in level.players)
    {
        player iPrintLnBold("^6Helping - ^2The Bird is in ^9"+bird.script_string+"! ");
    }

    Duck = util::spawn_model("p8_zm_red_floatie_duck", mainbird.origin + (0, 0, 0));
    Duck enableLinkTo();
    Duck linkTo(mainbird);
    Duck SetScale(2.5);

    level waittill(#"seagull_blasted");
    wait 10;

    bird = level.var_dcc985c4;
    mainbird = bird.var_e5c7e01a;

    foreach(player in level.players)
    {
        player iPrintLnBold("^1Helping - ^2The Bird is in ^9"+bird.script_string+"! ");
    }

    Duck = util::spawn_model("p8_zm_red_floatie_duck", mainbird.origin + (0, 0, 0));
    Duck enableLinkTo();
    Duck linkTo(mainbird);
    Duck SetScale(2.5);
}

BloodDucks()
{
    wall = getent("w_h_h_d_clip_m", "targetname");
    wall2 = getent("w_h_h_d_clip", "targetname");

    Duck1 = util::spawn_model("p8_zm_red_floatie_duck", wall.origin + (0, 0, 0));
    Duck1 SetScale(3);
    Duck2 = util::spawn_model("p8_zm_red_floatie_duck", wall2.origin + (0, 0, 0));
    Duck2 SetScale(3);

    lockup_door_1 = getent("lockup_door_1", "targetname");
    lockup_door_2 = getent("lockup_door_2", "targetname");
    lockup_door_3 = getent("lockup_door_3", "targetname");
    lockup_door_4 = getent("lockup_door_4", "targetname");

    Duck4 = util::spawn_model("p8_zm_red_floatie_duck", lockup_door_1.origin + (0, 0, 50));
    Duck4 SetScale(3);
    Duck5 = util::spawn_model("p8_zm_red_floatie_duck", lockup_door_2.origin + (0, 0, 50));
    Duck5 SetScale(3);
    Duck6 = util::spawn_model("p8_zm_red_floatie_duck", lockup_door_3.origin + (0, 0, 50));
    Duck6 SetScale(3);
    Duck7 = util::spawn_model("p8_zm_red_floatie_duck", lockup_door_4.origin + (0, 0, 50));
    Duck7 SetScale(3);

    mdl_door = getent("c29_door", "targetname");

    Duck10 = util::spawn_model("p8_zm_red_floatie_duck", mdl_door.origin + (0, 0, 0));
    Duck10 SetScale(3);

    Duck15 = util::spawn_model("p8_zm_red_floatie_duck", (-1850, 9142, 2466), (90, 0, 0));
    Duck15 SetScale(50);

    Duck1 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    Duck2 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    Duck4 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    Duck5 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    Duck6 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    Duck7 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    //Duck8 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    //Duck9 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    Duck10 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    //Duck11 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    //Duck12 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    //Duck13 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    //Duck14 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
}

SkipWall()
{
    wait 10;
    level notify(#"hash_4aedd2f50e5e307");
    wait 2;
    level notify(#"hash_703a48e58dfd43d6");

    Walls = struct::get(#"hash_1fb558842bdc2690");
    Wall = Walls.scene_ents[#"prop 1"];
    Wall clientfield::set("" + #"hash_376c030aee1d6ccb", 1);
}

BloodMessage()
{
    wait 5;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^2 Welcome to Rush Mode!, Choose your GameMode From Here....");
    }
    wait 2;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^3 Widows Wine - Start Rush Mode with Skipped Finding Bird Step! ");
    }
    wait 2;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^3 PaP - Start Rush Mode Without Skips! ");
    }
    wait 2;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^3 Speed Cola - Start Rush Mode with Skipped All 5 Main Quest Challenges! ");
    }
    wait 1;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^3 PhD Flopper - Start Rush Mode with Boss Fight Skip! ");
    }
}

WidowzSpawns() // random spawns
{
    if(BO4GetMap() == "Voyage")
    {
        a_iceberg = getentarray("forget_what_you_know", "targetname"); // < funny iceberg in aft deck
	    foreach(mdl in a_iceberg)
	    {
		    mdl show();
	    }

        Widowz1 = util::spawn_model("p7_zm_power_up_max_ammo", (-888,2236,1330) + (1, 1, 0));
        Widowz1 SetScale(50);
        Widowz3 = util::spawn_model("p7_zm_vending_widows_wine", (-870,4700,1052), (0, 90, 0));
        Widowz3 SetScale(50);
        Widowz3 solid();
        Widowz4 = util::spawn_model("p7_zm_power_up_nuke", (7.087039948,5266.535156,1471.730713) + (1, 1, 0));
        Widowz4 SetScale(50);
        Widowz5 = util::spawn_model("p7_zm_vending_revive", (830,4700,1052), (0, -90, 0));
        Widowz5 solid();
        Widowz5 SetScale(50);
        Widowz6 = util::spawn_model("p7_zm_power_up_double_points", (969.6124878,3154.832764,1800.91394) + (1, 1, 0));
        Widowz6 SetScale(50);
        Widowz7 = util::spawn_model("p7_zm_vending_packapunch", (1300.687866,-237.8532715,1300.284424) + (1, 1, 0));
        Widowz7 SetScale(50);
        Widowz8 = util::spawn_model("zombie_pickup_perk_bottle", (1111.448486,-2753.073486,1636.033813) + (1, 1, 0));
        Widowz8 SetScale(50);
        Widowz9 = util::spawn_model("p7_zm_vending_marathon", (300,5620,1464), (0, 0, 0));
        Widowz9 SetScale(50);
        Widowz9 solid();
        /#
        Widowz10 = util::spawn_model("p7_zm_vending_three_gun", (-1500.772949,2116.550537,1317.049072), (0, 90, 0));
        Widowz10 SetScale(50);
        Widowz10 solid();
        #/
        Widowz11 = util::spawn_model("p7_zm_power_up_insta_kill", (-45.92668915,-5651.702148,1630.978271) + (1, 1, 0));
        Widowz11 SetScale(50);
        Widowz12 = util::spawn_model("p7_zm_vending_sleight", (-45.92668915,-4651.702148,1550.978271) + (1, 1, 0));
        Widowz12 SetScale(50);

        wait 10;

        while(true) // moving stuff for VOD
        {
            Widowz3 moveto(Widowz3.origin + (0, -700, 0), 3, 2, 0.5);
            Widowz4 moveto(Widowz4.origin + (0, -2000, 0), 3, 2, 0.5);
            Widowz1 moveto(Widowz1.origin + (0, -2000, 0), 3, 2, 0.5);
            Widowz11 moveto(Widowz11.origin + (0, 2000, 0), 3, 2, 0.5);
            Widowz5 moveto(Widowz5.origin + (0, -700, 0), 3, 2, 0.5);
            Widowz6 moveto(Widowz6.origin + (0, 2000, 0), 3, 2, 0.5);
            Widowz7 moveto(Widowz7.origin + (0, 2000, 0), 3, 2, 0.5);
            //Widowz10 moveto(Widowz10.origin + (0, -1600, 0), 3, 2, 0.5);
            Widowz9 moveto(Widowz9.origin + (-600, 0, 0), 3, 2, 0.5);
            wait 3;
            Widowz3 moveto(Widowz3.origin + (0, 700, 0), 3, 2, 0.5);
            Widowz4 moveto(Widowz4.origin + (0, 2000, 0), 3, 2, 0.5);
            Widowz1 moveto(Widowz1.origin + (0, 2000, 0), 3, 2, 0.5);
            Widowz11 moveto(Widowz11.origin + (0, -2000, 0), 3, 2, 0.5);
            Widowz5 moveto(Widowz5.origin + (0, 700, 0), 3, 2, 0.5);
            Widowz6 moveto(Widowz6.origin + (0, -2000, 0), 3, 2, 0.5);
            Widowz7 moveto(Widowz7.origin + (0, -2000, 0), 3, 2, 0.5);
            //Widowz10 moveto(Widowz10.origin + (0, 1600, 0), 3, 2, 0.5);
            Widowz9 moveto(Widowz9.origin + (600, 0, 0), 3, 2, 0.5);
            wait 3;
        }
    }

    if(BO4GetMap() == "AO")
    {
        Widowz1 = util::spawn_model("p7_zm_power_up_max_ammo", (-888,2236,1330) + (1, 1, 0));
        Widowz1 SetScale(50);
        Widowz3 = util::spawn_model("p7_zm_vending_widows_wine", (-870,4700,1052), (0, 90, 0));
        Widowz3 SetScale(50);
        Widowz3 solid();
        Widowz4 = util::spawn_model("p7_zm_power_up_nuke", (7.087039948,5266.535156,1471.730713) + (1, 1, 0));
        Widowz4 SetScale(50);
        Widowz5 = util::spawn_model("p7_zm_vending_revive", (830,4700,1052), (0, -90, 0));
        Widowz5 solid();
        Widowz5 SetScale(50);
        Widowz6 = util::spawn_model("p7_zm_power_up_double_points", (969.6124878,3154.832764,1800.91394) + (1, 1, 0));
        Widowz6 SetScale(50);
        Widowz7 = util::spawn_model("p7_zm_vending_packapunch", (1300.687866,-237.8532715,1300.284424) + (1, 1, 0));
        Widowz7 SetScale(50);
        Widowz8 = util::spawn_model("zombie_pickup_perk_bottle", (1111.448486,-2753.073486,1636.033813) + (1, 1, 0));
        Widowz8 SetScale(50);
        Widowz9 = util::spawn_model("p7_zm_vending_marathon", (300,5620,1464), (0, 0, 0));
        Widowz9 SetScale(50);
        Widowz9 solid();
        Widowz10 = util::spawn_model("p7_zm_vending_three_gun", (-1500.772949,2116.550537,1317.049072), (0, 90, 0));
        Widowz10 SetScale(50);
        Widowz10 solid();
        Widowz11 = util::spawn_model("p7_zm_power_up_insta_kill", (-45.92668915,-5651.702148,1630.978271) + (1, 1, 0));
        Widowz11 SetScale(50);
        Widowz12 = util::spawn_model("p7_zm_vending_sleight", (-45.92668915,-4651.702148,1550.978271) + (1, 1, 0));
        Widowz12 SetScale(50);

        wait 10;

        while(true) // moving stuff for VOD
        {
            Widowz3 moveto(Widowz3.origin + (0, -700, 0), 3, 2, 0.5);
            Widowz4 moveto(Widowz4.origin + (0, -2000, 0), 3, 2, 0.5);
            Widowz1 moveto(Widowz1.origin + (0, -2000, 0), 3, 2, 0.5);
            Widowz11 moveto(Widowz11.origin + (0, 2000, 0), 3, 2, 0.5);
            Widowz5 moveto(Widowz5.origin + (0, -700, 0), 3, 2, 0.5);
            Widowz6 moveto(Widowz6.origin + (0, 2000, 0), 3, 2, 0.5);
            Widowz7 moveto(Widowz7.origin + (0, 2000, 0), 3, 2, 0.5);
            Widowz10 moveto(Widowz10.origin + (0, -1600, 0), 3, 2, 0.5);
            Widowz9 moveto(Widowz9.origin + (-600, 0, 0), 3, 2, 0.5);
            wait 3;
            Widowz3 moveto(Widowz3.origin + (0, 700, 0), 3, 2, 0.5);
            Widowz4 moveto(Widowz4.origin + (0, 2000, 0), 3, 2, 0.5);
            Widowz1 moveto(Widowz1.origin + (0, 2000, 0), 3, 2, 0.5);
            Widowz11 moveto(Widowz11.origin + (0, -2000, 0), 3, 2, 0.5);
            Widowz5 moveto(Widowz5.origin + (0, 700, 0), 3, 2, 0.5);
            Widowz6 moveto(Widowz6.origin + (0, -2000, 0), 3, 2, 0.5);
            Widowz7 moveto(Widowz7.origin + (0, -2000, 0), 3, 2, 0.5);
            Widowz10 moveto(Widowz10.origin + (0, 1600, 0), 3, 2, 0.5);
            Widowz9 moveto(Widowz9.origin + (600, 0, 0), 3, 2, 0.5);
            wait 3;
        }
    }

    if(BO4GetMap() == "IX")
    {
        Widowz1 = util::spawn_model("p7_zm_power_up_max_ammo", (-607.5174561,-912.2840576,502.4177551) + (1, 1, 0));
        Widowz1 SetScale(50);
        Widowz3 = util::spawn_model("p7_zm_vending_widows_wine", (-970.2046509,40.90392685,400.9035645) + (1, 1, 0));
        Widowz3 SetScale(50);
        Widowz4 = util::spawn_model("p7_zm_power_up_nuke", (5.468861103,885.6711426,696.1477051) + (1, 1, 0));
        Widowz4 SetScale(50);
        Widowz5 = util::spawn_model("p7_zm_vending_revive", (1002.812073,-154.2467804,564.6618042) + (1, 1, 0));
        Widowz5 SetScale(50);
        Widowz6 = util::spawn_model("p7_zm_power_up_double_points", (-4387.297363,16.33662033,567.8972778) + (1, 1, 0));
        Widowz6 SetScale(50);
        Widowz7 = util::spawn_model("p7_zm_vending_packapunch", (-2890.538818,5.496827126,588.8236694) + (1, 1, 0));
        Widowz7 SetScale(50);
        Widowz8 = util::spawn_model("zombie_pickup_perk_bottle", (1591.694702,14.77487564,1468.162109) + (1, 1, 0));
        Widowz8 SetScale(50);
        Widowz9 = util::spawn_model("p7_zm_vending_marathon", (-1112.68103,1426.498901,648.9675293) + (1, 1, 0));
        Widowz9 SetScale(50);
        Widowz10 = util::spawn_model("p7_zm_vending_three_gun", (-1681.120361,-16.85972977,1364.780029) + (1, 1, 0));
        Widowz10 SetScale(50);
        Widowz11 = util::spawn_model("p7_zm_power_up_insta_kill", (-885.2129517,-1280.602905,567.1100464) + (1, 1, 0));
        Widowz11 SetScale(50);
        Widowz12 = util::spawn_model("p7_zm_vending_sleight", (-4180.323242,644.9738159,581.8706055) + (1, 1, 0)); // test
        Widowz12 SetScale(50);
        wait 10;
        while(true) // moving stuff for IX
        {
            Widowz4 moveto(Widowz4.origin + (0, -2000, 0), 3, 2, 0.5);
            Widowz1 moveto(Widowz1.origin + (0, 2000, 0), 3, 2, 0.5);
            Widowz11 moveto(Widowz11.origin + (0, 2000, 0), 3, 2, 0.5);
            Widowz5 moveto(Widowz5.origin + (0, 2000, 0), 3, 2, 0.5);
            Widowz6 moveto(Widowz6.origin + (0, 2000, 0), 3, 2, 0.5);
            Widowz7 moveto(Widowz7.origin + (0, 2000, 0), 3, 2, 0.5);
            wait 3;
            Widowz4 moveto(Widowz4.origin + (0, 2000, 0), 3, 2, 0.5);
            Widowz1 moveto(Widowz1.origin + (0, -2000, 0), 3, 2, 0.5);
            Widowz11 moveto(Widowz11.origin + (0, -2000, 0), 3, 2, 0.5);
            Widowz5 moveto(Widowz5.origin + (0, -2000, 0), 3, 2, 0.5);
            Widowz6 moveto(Widowz6.origin + (0, -2000, 0), 3, 2, 0.5);
            Widowz7 moveto(Widowz7.origin + (0, -2000, 0), 3, 2, 0.5);
            wait 3;
        }
    }

    if(BO4GetMap() == "AE")
    {
        Widowz1 = util::spawn_model("p7_zm_power_up_max_ammo", (-607.5174561,-912.2840576,502.4177551) + (1, 1, 0));
        Widowz1 SetScale(50);
        Widowz3 = util::spawn_model("p7_zm_vending_widows_wine", (-970.2046509,40.90392685,400.9035645) + (1, 1, 0));
        Widowz3 SetScale(50);
        Widowz4 = util::spawn_model("p7_zm_power_up_nuke", (5.468861103,885.6711426,696.1477051) + (1, 1, 0));
        Widowz4 SetScale(50);
        Widowz5 = util::spawn_model("p7_zm_vending_revive", (1002.812073,-154.2467804,564.6618042) + (1, 1, 0));
        Widowz5 SetScale(50);
        Widowz6 = util::spawn_model("p7_zm_power_up_double_points", (-4387.297363,16.33662033,567.8972778) + (1, 1, 0));
        Widowz6 SetScale(50);
        Widowz7 = util::spawn_model("p7_zm_vending_packapunch", (-2890.538818,5.496827126,588.8236694) + (1, 1, 0));
        Widowz7 SetScale(50);
        Widowz8 = util::spawn_model("zombie_pickup_perk_bottle", (1591.694702,14.77487564,1468.162109) + (1, 1, 0));
        Widowz8 SetScale(50);
        Widowz9 = util::spawn_model("p7_zm_vending_marathon", (-1112.68103,1426.498901,648.9675293) + (1, 1, 0));
        Widowz9 SetScale(50);
        Widowz10 = util::spawn_model("p7_zm_vending_three_gun", (-1681.120361,-16.85972977,1364.780029) + (1, 1, 0));
        Widowz10 SetScale(50);
        Widowz11 = util::spawn_model("p7_zm_power_up_insta_kill", (-885.2129517,-1280.602905,567.1100464) + (1, 1, 0));
        Widowz11 SetScale(50);
        Widowz12 = util::spawn_model("p7_zm_vending_sleight", (-4180.323242,644.9738159,581.8706055) + (1, 1, 0)); // test
        Widowz12 SetScale(50);
        wait 10;
        while(true) // moving stuff for IX
        {
            Widowz4 moveto(Widowz4.origin + (0, -2000, 0), 3, 2, 0.5);
            Widowz1 moveto(Widowz1.origin + (0, 2000, 0), 3, 2, 0.5);
            Widowz11 moveto(Widowz11.origin + (0, 2000, 0), 3, 2, 0.5);
            Widowz5 moveto(Widowz5.origin + (0, 2000, 0), 3, 2, 0.5);
            Widowz6 moveto(Widowz6.origin + (0, 2000, 0), 3, 2, 0.5);
            Widowz7 moveto(Widowz7.origin + (0, 2000, 0), 3, 2, 0.5);
            wait 3;
            Widowz4 moveto(Widowz4.origin + (0, 2000, 0), 3, 2, 0.5);
            Widowz1 moveto(Widowz1.origin + (0, -2000, 0), 3, 2, 0.5);
            Widowz11 moveto(Widowz11.origin + (0, -2000, 0), 3, 2, 0.5);
            Widowz5 moveto(Widowz5.origin + (0, -2000, 0), 3, 2, 0.5);
            Widowz6 moveto(Widowz6.origin + (0, -2000, 0), 3, 2, 0.5);
            Widowz7 moveto(Widowz7.origin + (0, -2000, 0), 3, 2, 0.5);
            wait 3;
        }
    }

    if(BO4GetMap() == "Blood") //blood test
    {
        /#
        Widowz1 = util::spawn_model("p7_zm_power_up_max_ammo", (2340,8688,1800) + (1, 1, 0));
        Widowz1 SetScale(50);
        Widowz3 = util::spawn_model("p7_zm_vending_widows_wine", (-1395,8927,1201) + (1, 1, 0));
        Widowz3 SetScale(50);
        Widowz4 = util::spawn_model("p7_zm_power_up_nuke", (-1000,10688,1800) + (1, 1, 0));
        Widowz4 SetScale(50);
        Widowz5 = util::spawn_model("p7_zm_vending_revive", (-2340,9688,1800) + (1, 1, 0));
        Widowz5 SetScale(50);
        Widowz6 = util::spawn_model("p7_zm_power_up_double_points", (-4340,8688,1800) + (1, 1, 0));
        Widowz6 SetScale(50);
        Widowz7 = util::spawn_model("p7_zm_vending_packapunch", (2340,6688,1800) + (1, 1, 0));
        Widowz7 SetScale(50);
        Widowz8 = util::spawn_model("zombie_pickup_perk_bottle", (-1000,8688,1800) + (1, 1, 0));
        Widowz8 SetScale(50);
        Widowz9 = util::spawn_model("p7_zm_vending_marathon", (0,8688,1800) + (1, 1, 0));
        Widowz9 SetScale(50);
        Widowz10 = util::spawn_model("p7_zm_vending_three_gun", (4340,8688,1800) + (1, 1, 0));
        Widowz10 SetScale(50);
        Widowz11 = util::spawn_model("p7_zm_power_up_insta_kill", (1340,8688,1800) + (1, 1, 0));
        Widowz11 SetScale(50);
        Widowz12 = util::spawn_model("p7_zm_vending_sleight", (3340,8688,1800) + (1, 1, 0)); // test
        Widowz12 SetScale(50);

        #/
        // in boss area
        Widowz20 = util::spawn_model("p7_zm_vending_widows_wine", (10253,10413,451) + (1, 1, 0));
        Widowz20 SetScale(2);
        Widowz21 = util::spawn_model("p7_zm_vending_widows_wine", (10161,10000,431) + (1, 1, 0));
        Widowz21 SetScale(2);
        Widowz22 = util::spawn_model("p7_zm_vending_widows_wine", (9716,9930,430) + (1, 1, 0));
        Widowz22 SetScale(2);
        Widowz23 = util::spawn_model("p7_zm_vending_widows_wine", (9600,10339,430) + (1, 1, 0));
        Widowz23 SetScale(2);
        Widowz24 = util::spawn_model("p7_zm_vending_widows_wine", (10085,10072,421) + (1, 1, 0));
        Widowz24 SetScale(2);
        Widowz25 = util::spawn_model("p7_zm_vending_widows_wine", (9748,10104,413) + (1, 1, 0));
        Widowz25 SetScale(2);
        Widowz26 = util::spawn_model("p7_zm_vending_widows_wine", (10100,10745,450) + (1, 1, 0));
        Widowz26 SetScale(2);

        wait 10;
        while(true) // moving stuff for blood
        {
            wait 3;
            Widowz20 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
            Widowz21 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
            Widowz22 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
            Widowz23 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
            Widowz24 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
            Widowz25 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
            Widowz26 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
        }
    }

    // return
}