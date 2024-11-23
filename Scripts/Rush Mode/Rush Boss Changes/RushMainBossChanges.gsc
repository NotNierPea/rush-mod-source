BossChanges() // funny stuff when boss starts...
{
    //level endon(#"end_game", #"game_ended");

    if(BO4GetMap() == "Voyage")
    {
        level flag::wait_till(#"boss_fight_started");
        thread bo4_AddBotsToGame();
        thread bo4_AddBotsToGame();
        thread bo4_AddBotsToGame();
        level.var_d6f059f7 = 255; // what round? (Might bug out HardCore diff)
        level.round_number = 255; // ^^
        level.var_c9f5947d = 1;
        level.var_f3c4bd00 = 4; // number of players
        level clientfield::set("" + #"hash_3c58464f16d8a1be", 1);
	    getent("mov_ship_rob", "targetname") clientfield::set("" + #"hash_6e41de51a0092771", 0);

        switch(level.gamedifficulty) // check what diff
        {
            case 3: // realistic
                level thread RoundEdit(254);
                NotifyRoundEnd();
                break;
        
            case 2: // hardcore
                level thread RoundEdit(254);
                NotifyRoundEnd();
                break;
        
            case 1: // normal
                level thread RoundEdit(254);
                NotifyRoundEnd();
                break;
        
            case 0: // casual (might change later)
                level thread RoundEdit(254);
                NotifyRoundEnd();
                break;
        }
        wait 1;

        thread EyeFakeAttackScale();

        wait 15;
        level thread lui::screen_flash(0.8, 4.5, 0.8, 1, "white");
        level notify(#"Start_HealthEye");

        //self playsound("zmb_eyeball_vox_intro_s5");
        level flag::set("zombie_drop_powerups");
        //level flag::set(#"hash_21921ed511559aa3"); // idk what the fuck does this do?
        //level flag::set("spawn_zombies");
        level flag::clear("pause_round_timeout");
        level flag::clear(#"disable_fast_travel");
        level.var_d6f059f7 = 255; // what round? (Might bug out HardCore diff)
        level.round_number = 255; // ^^
        level.var_c9f5947d = 1;
        level.var_f3c4bd00 = 4; // number of players
        wait 25;
        level.var_f3c4bd00 = 4; // number of players (must set more than once)

        //thread DoSoundEye();
    }

    if(BO4GetMap() == "IX")
    {
        wait 5;

        // fix early crash
        if(!isDefined(level.ai[#"axis"]))
         level.ai[#"axis"] = [];
        
        while(!zm_zonemgr::any_player_in_zone("zone_boss_battle")) { wait 1; }

        level notify(#"hash_12768f75609d32ca");
        thread bo4_AddBotsToGame();
        thread bo4_AddBotsToGame();
        thread bo4_AddBotsToGame();
        level thread RoundEdit(254);
        NotifyRoundEnd();
        wait 5;
        level flag::set("zombie_drop_powerups");
        level flag::set(#"kill_special_round_fog");
        wait 17;

        foreach(player in level.players)
        {
            player iPrintLnBold("^3 Lockdown! ");
        }
        wait 3;

        level thread lui::screen_flash(0.2, 1.5, 0.3, 1, "white");
        ElephantCustom_1 = SpawnElephantIX(2, (-3970, 925, 15), (0, -90, 0));
        ElephantCustom_2 = SpawnElephantIX(2, (-2700, 380, 15), (0, -150, 0));

        ElephantCustom_1 thread AddLinkedObjective(true, ElephantCustom_1, #"hash_410c56f34d7ed87");
        ElephantCustom_2 thread AddLinkedObjective(true, ElephantCustom_2, #"hash_410c56f34d7ed87");

        DuckRing = util::spawn_model("p8_zm_red_floatie_duck", ElephantCustom_2.origin + (0, 0, 150));
        DuckRing SetScale(50);
        DuckRing enablelinkto();
        DuckRing linkTo(ElephantCustom_2, "", (0, 0, 150), (180, 180, 180));
        DuckRing notSolid();

        DuckRing = util::spawn_model("p8_zm_red_floatie_duck", ElephantCustom_1.origin + (0, 0, 150));
        DuckRing SetScale(50);
        DuckRing enablelinkto();
        DuckRing linkTo(ElephantCustom_1, "", (0, 0, 150), (180, 180, 180));
        DuckRing notSolid();
        
        //level waittill(#"hash_12768f75609d32ca"); //hash_4a06aa98c6c7b671 < old + broken
        //trigger::wait_till("large_gate_l_trigger", "targetname");

        while(!isdefined(level.e_elephant))
        {
            wait 1;
        }
        wait 3;

        level notify(#"StartHealthHud");
        level thread lui::screen_flash(0.4, 2.5, 0.5, 1, "white");
        wait 1;
        eleph = level.e_elephant;
        eleph enablelinkto();

        DuckRing = util::spawn_model("p8_zm_red_floatie_duck", eleph.origin + (0, 0, 150));
        DuckRing SetScale(50);
        DuckRing enablelinkto();
        DuckRing linkTo(eleph, "", (0, 0, 150), (180, 180, 180));
        DuckRing notSolid();

        //Widowszz1 = util::spawn_model("p7_zm_power_up_nuke", eleph.origin + (0, 0, 0));
        //Widowszz1 SetScale(50);
        //Widowszz1 enablelinkto();
        //Widowszz1 linkto(eleph);
        //Widowszz1 notSolid();

        wait 2;
        foreach(player in level.players)
            player iPrintlnBold("^1 Boss Fight! ");
        
        eleph thread AddLinkedObjective(true, eleph, #"hash_423a75e2700a53ab");
        eleph thread ElephantDamage();
        callback::on_ai_damage(&ElephantCheckHighDamage, eleph);

        level thread IXSpawnMiniBoss();

        wait 3;
        //Widowszz rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
        //Widowszz1 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
        level waittill(#"hash_5d826e11ebe4b6e7"); // <
        wait 5;
        level thread lui::screen_flash(0.8, 2.5, 0.8, 1, "white");
        wait 3;
        
        eleph = level.e_elephant;
        eleph enablelinkto();

        DuckRing = util::spawn_model("p8_zm_red_floatie_duck", eleph.origin + (0, 0, 150));
        DuckRing SetScale(50);
        DuckRing enablelinkto();
        DuckRing linkTo(eleph, "", (0, 0, 150), (180, 180, 180));
        DuckRing notSolid();

        eleph thread ElephantFast();
        eleph thread AddLinkedObjective(true, eleph, #"hash_423a75e2700a53ab");
        callback::on_ai_damage(&ElephantCheckHighDamage, eleph);

        wait 2;
        foreach(player in level.players)
            player iPrintlnBold("^1 Boss Fight! ");
        
        wait 5;
        eleph thread ElephantDamage();

        level waittill(#"eleph_dead"); // because fuck treyarch's one
        //level waittill(#"boss_battle_done");

        ElephantCustom_1.takedamage = true;
        ElephantCustom_2.takedamage = true;

        ElephantCustom_1 dodamage(ElephantCustom_1.health + 666, ElephantCustom_1.origin);
        ElephantCustom_2 dodamage(ElephantCustom_2.health + 666, ElephantCustom_2.origin);

        //Widowszz1 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    }

    if(BO4GetMap() == "Dead")
    {
        level flag::wait_till(#"boss_fight_started");
        switch(level.gamedifficulty) // check what diff
        { 
            case 3: // realistic
                level thread RoundEdit(254);
                thread NotifyRoundEnd();
                break;
        
            case 2: // hardcore
                level thread RoundEdit(254);
                thread NotifyRoundEnd();
                break;
        
            case 1: // normal (might change later)
                level thread RoundEdit(254);
                thread NotifyRoundEnd();
                break;
        
            case 0: // casual (might change later)
                level thread RoundEdit(254);
                thread NotifyRoundEnd();
                break;
        }

        wait 3;
        level thread WolfBuff();
        thread DuckieWolf();
        thread bo4_AddBotsToGame();
        thread bo4_AddBotsToGame();
        thread bo4_AddBotsToGame();
        level.var_d6f059f7 = 255;

        level notify(#"StopQuestDetect");
        LUINotifyEvent(#"rush_quest_detect", 3, 1, 62, randomIntRange(1, 10));

        wait 30;
        level flag::clear(#"disable_fast_travel");
        level flag::set("zombie_drop_powerups");

        // self.var_c962047c damage that needs to be done
        while(true)
        {
            level waittill(#"boss_captured");
            foreach(player in level.players) player iPrintLnBold("^4 Wolf is Stunned! ");
            wait 3;
        }
    }

    if(BO4GetMap() == "AE")
    {
        scene::add_scene_func(#"hash_be0d30822a1c21b", &AddBots_AELogic, "done");
        scene::add_scene_func("aib_vign_cust_zm_red_boss2_intro_exit", &PegasusDuck);
        scene::add_scene_func(#"hash_534b26f900cdba5", &PegasusDuck, "play"); // should work

        zm_zonemgr::zone_wait_till_enabled("zone_boss_plateau_3"); // better than flag wait
        level thread AEModels();
        zm_round_logic::set_round_number(229);
        level notify(#"kill_round_wait");

        BigMan = level.s_boss_battle.var_3edd432d;
        BigMan enablelinkto();

        Widowszz1 = util::spawn_model("p7_zm_power_up_insta_kill", BigMan.origin + (0, 0, 1000), (0, 90, 0));
        Widowszz1 SetScale(50);
        Widowszz1 enablelinkto();
        Widowszz1 linkto(BigMan);
        Widowszz1 notSolid();

        BigMan thread AddLinkedObjective(true, BigMan, #"hash_423a75e2700a53ab", undefined, #"disable_perseus_objective"); // perseus_defeated, no var
        thread UpdateAEObjective();
        BigMan SetModel(#"c_t8_mp_spe_spectre_body1_skin1");

        if (isdefined(BigMan.hatmodel))
        {
            BigMan detach(BigMan.hatmodel, "");
        }
        if (isdefined(BigMan.head))
        {
            BigMan detach(BigMan.head, "");
        }
        
        BigMan attach(#"c_t8_mp_spe_spectre_head1", "j_head");
        BigMan attach(#"p8_zm_red_floatie_duck", "j_spinelower");
        level.s_boss_battle.var_5e9e4c15 SetModel(#"p8_zm_red_floatie_duck");
        level.s_boss_battle.var_c67e8352 SetModel(#"p7_zm_vending_widows_wine");

        level flag::wait_till(#"perseus_attacking");
        BigMan thread NukeLook(BigMan.origin + (0, 0, 500), BigMan.angles, undefined, undefined, 50);

        // vars
        level.s_boss_battle.var_b7fe5d46 = 26000; // pers health for stun
        level.s_boss_battle.var_7fc7f236 = 29000; // peag or pers for next phase
        level.s_boss_battle.var_1e4f5dab = 21000; // pers health for stun
        level.s_boss_battle.var_407b6d64 = 21000; // pers health
        level.s_boss_battle.var_dc656db3 = 3;

        level.zombie_ai_limit = 255;
        level flag::wait_till(#"pegasus_attacking");
        level thread SpawnMiniBossAELoop();
        level notify(#"StartHealthHud");
        wait 5;
        
        level.s_boss_battle.var_b7fe5d46 = 26000; // pers health for stun
        level.s_boss_battle.var_7fc7f236 = 29000; // peag or pers for next phase
        level.s_boss_battle.var_1e4f5dab = 21000; // pers health for stun
        level.s_boss_battle.var_407b6d64 = 21000; // pers health
        level.s_boss_battle.var_4652a428 = 3; // peag next attack wait time
        level.zombie_ai_limit = 255;
        wait 10;
        level.zombie_ai_limit = 255;
    }
    
    if(BO4GetMap() == "AO")
    {
        level flag::wait_till(#"boss_fight_started");
        wait 1;
        thread bo4_AddBotsToGame();
        thread bo4_AddBotsToGame();
        thread bo4_AddBotsToGame();
        level thread RoundEdit(254);
        zm_round_logic::set_round_number(254);
        NotifyRoundEnd();
        wait 5;
        level flag::clear(#"infinite_round_spawning");
        level flag::clear(#"pause_round_timeout");
        level flag::clear("world_is_paused");

        while(!isdefined(level.e_avogadro)) { util::wait_network_frame(1); }

        bigelecMan = level.e_avogadro;
        
        level.ElecModel = bigelecMan.model;
        bigelecMan enablelinkto();
        bigelecMan SetModel(#"c_t8_mp_spe_hacker_body1");
        if (isdefined(bigelecMan.hatmodel))
        {
            bigelecMan detach(BigMan.hatmodel, "");
        }
        if (isdefined(bigelecMan.head))
        {
            bigelecMan detach(bigelecMan.head, "");
        }
        bigelecMan attach(#"c_t8_mp_spe_hacker_head1", "j_head");
        bigelecMan attach(#"p8_zm_red_floatie_duck", "j_spinelower");
        bigelecMan thread ModelCheckZero();
        bigelecMan thread NukeLook(bigelecMan.origin, bigelecMan.angles, bigelecMan, (0, 0, 95), 0.6);
        bigelecMan thread AddLinkedObjective(true, bigelecMan, #"hash_423a75e2700a53ab");

        level thread GetZeroPhase();
        level.e_avogadro waittill(#"intro_done"); // i guess it works?

        wait 15;
        level.zombie_ai_limit = 255;

        // from here is removing the doors
        a_doors = getentarray("apd_lockdown", "script_string");
        foreach (door in a_doors)
        {
            door moveasshole();
            door hide();
        }

        a_doors = getentarray("boss_lockdown", "script_string");
        foreach (door in a_doors)
        {
            door moveasshole();
            door hide();
        }

        a_e_lockdown_doors = getentarray("lockdown_door", "targetname");
        foreach (e_lockdown_door in a_e_lockdown_doors)
        {
            e_lockdown_door moveasshole();
            e_lockdown_door hide();
        }

        // here is fixing some bugs with zombies not spawning
        FixAOBossZombies();
    }
    
    if(BO4GetMap() == "Blood")
    {
        level waittill(#"hash_3bb155b55ea4338a"); // boss fight when teleporting
        level.var_69ff31e1 = level.zombie_vars[#"zombie_health_start"];
        level thread RoundEdit(254);
        zm_round_logic::set_round_number(254);

        wait 5;
        thread bo4_AddBotsToGame();
        thread bo4_AddBotsToGame();
        thread bo4_AddBotsToGame();
        NotifyRoundEnd();
        level.zombie_vars["zombie_max_ai"] = 500;
        level.zombie_ai_limit = 400;
        level.zombie_actor_limit = 400;

        level thread BloodChanges();

        wait 3;
        s_portal = struct::get(#"hash_4f3ae1de39c4b3e3");
        for (i = 1; i <= util::get_active_players().size; i++) 
        {
            v_facing = s_portal.origin - util::get_active_players()[i - 1].origin;
            v_angle = vectortoangles(v_facing);
            s_teleport = struct::get(#"c29_teleport_" + i);

            if(!IsBot(util::get_active_players()[i - 1]))
             continue;
            
            util::get_active_players()[i - 1] setorigin(s_teleport.origin);
            util::get_active_players()[i - 1] setplayerangles(v_angle);
        }

        KillAllZombies(); // some zombies are outside?
    }

    if(BO4GetMap() == "Tag") // done and works perfectly
    {
        level flag::wait_till(#"hell_on_earth");
        level thread RoundEdit(254);
        zm_round_logic::set_round_number(254);
        NotifyRoundEnd();

        wait 5;
        thread bo4_AddBotsToGame();
        thread bo4_AddBotsToGame();
        thread bo4_AddBotsToGame();

        level.StopRandomObjects = true;
        level.zombie_vars["zombie_max_ai"] = 600;
        level.zombie_ai_limit = 500;
        level.zombie_actor_limit = 500;

        // attach stuff
        BigBallThing = level.var_5d5b7e8e.var_a41818b5;
        BigBallThingHolder = level.var_5d5b7e8e.var_a41818b5.var_e70e15ad;
        BigBallThing enablelinkto();
        BigBallThing SetScale(50);
        level thread lui::screen_flash(0.4, 4.5, 0.5, 1, "white");
        wait 2;

        Widowszz = util::spawn_model("p8_zm_red_floatie_duck", BigBallThingHolder.origin + (0, 0, 0), (0, 0, 90));
        Widowszz SetScale(50);
        Widowszz enablelinkto();
        Widowszz linkto(BigBallThingHolder, "", (0, 0, 0), (-90, -90, 90));
        Widowszz notSolid();
        //Widowszz thread RotateInf(); // wow? (changing angles and origin does not work on linked...)
        wait 1;

        BigBallThing thread NukeLook(BigBallThing.origin, BigBallThing.angles, BigBallThing, (0, 0, 0), 2.2);
        BigBallThing thread AddLinkedObjective(true, BigBallThing, #"hash_423a75e2700a53ab");
        [[ @zm_orange_mq_hell<scripts\zm\zm_orange_mq_hell.gsc>::function_5c135d54 ]](275); // small circle
        //BigBallThingHolder thread RotateAndBobItem(); // this should work - linked so no
    }

    // no classified/five
}

IXSpawnMiniBoss()
{
    level endon(#"boss_battle_done");

    ShieldLog("^3 IX Spawning MiniBoss -> Called");

    a_s_spawners = struct::get_array("boss_battle_spawns");
    a_s_spawners = arraycombine(a_s_spawners, struct::get_array("boss_temp_gate_tele", "targetname"), 0, 0);
    s_zones = [];
    foreach (s_spawn in a_s_spawners) 
    {
        if (s_spawn.script_noteworthy === "gladiator_location") 
        {
            if (!isdefined(s_zones))
                s_zones = [];

            else if (!isarray(s_zones))
                s_zones = array(s_zones);
            
            if (!isinarray(s_zones, s_spawn))
                s_zones[s_zones.size] = s_spawn;
        }
    }

    while(true)
    {
        while (getaiteamarray(level.zombie_team).size >= 36) 
            util::wait_network_frame();

        switch(randomIntRange(1, 3))
        {
            case 1:
            location = array::random(struct::get_array("boss_temp_gate_tele", "targetname"));

            level thread [[ @zombie_gladiator_util<script_684097158a90b5c3.gsc>::function_69f309b ]](1, "ranged", undefined, 1, location, 255);
            level thread [[ @zombie_gladiator_util<script_684097158a90b5c3.gsc>::function_69f309b ]](1, "melee", undefined, 1, location, 255);
            break;

            case 2:
            spawn_zones = array::random(s_zones);

            level thread [[ @zombie_gladiator_util<script_684097158a90b5c3.gsc>::function_69f309b ]](1, "ranged", undefined, 1, spawn_zones, 255);
            level thread [[ @zombie_gladiator_util<script_684097158a90b5c3.gsc>::function_69f309b ]](1, "melee", undefined, 1, spawn_zones, 255);
            break;
        }
        wait 9;
    }
}

DOTNTransformersLogic()
{
    level endon(#"hash_38f29f9cb03586ea", #"spawn_zombies", #"hash_71fd67248b9a37ca", #"end_game", #"intermission");

    ShieldLog("^6DOTN Transformers Spawning -> Called");

    wait 5;

    formers = array(#"hash_7c89b1397a38e3ad", #"hash_7c89ae397a38de94", #"hash_7c89af397a38e047", #"hash_7c89ac397a38db2e");
    level.var_8a64ef3a = 0;

    while (1) 
    {
        form = array::random(formers);
        if (![[ @zm_transform<scripts\zm_common\zm_transformation.gsc>::function_abf1dcb4 ]](form))
            [[ @zm_transform<scripts\zm_common\zm_transformation.gsc>::function_bdd8aba6 ]](form);
        
        wait 4;
    }
}

SpawnMiniBossAELoop()
{
    level endon(#"perseus_defeated");

    while(true)
    {
        wait 10;
        switch(randomIntRange(1, 3))
        {
            case 1: // blight
            [[ @zm_transform<scripts\zm_common\zm_transformation.gsc>::function_bdd8aba6 ]](#"blight_father");
            s_waitresult = undefined;
            s_waitresult = level waittilltimeout(10, #"transformation_complete");

            if(randomIntRange(1, 3) == 1 && s_waitresult._notify != "timeout") // reduce talking
             [[ @red_boss_battle<scripts\zm\zm_red_boss_battle.gsc>::function_8b1f9518 ]]();
            break;

            case 2: // zombie_gegenees
            str_scene = array::random(level.s_boss_battle.var_2624492f);
            level scene::play(str_scene, "targetname");

            if(randomIntRange(1, 3) == 1) 
             [[ @red_boss_battle<scripts\zm\zm_red_boss_battle.gsc>::function_8b1f9518 ]]();
            break;
        }
    }
}

UpdateAEObjective()
{
    while(!level flag::get(#"hash_7be183aa6a4cbe7"))
    {
        if(isDefined(level.e_pegasus)) 
        {
            objective_onentity(level.objective_id_alt, level.e_pegasus);
            objective_setstate(level.objective_id_alt, "active");
        }
        else
            objective_setstate(level.objective_id_alt, "invisible");

        wait 1.5;
    }
    util::wait_network_frame(1);

    gameobjects::release_obj_id(level.objective_id_alt); // remove
    level.objective_id_alt = undefined;
}

FixAOBossZombies()
{
    level endon(#"avog_captured");

    while (true)
    {
        shit = zm_round_logic::get_round_number();
        level flag::set(#"infinite_round_spawning");
        level flag::clear(#"pause_round_timeout");
        level flag::clear("world_is_paused");
        //level.zombie_total = 0;
        zm_round_logic::set_round_number(shit + 1);
        wait 10;
    }
}

EyePhaseTimer()
{
    level endon(#"intermission");

    if(!level flag::get(#"hash_62b951a213a3945e")) // phase 1 check
     level thread PhaseTimerKillLogic();

    level.PhaseTimerEye = 300;
    for(i = level.PhaseTimerEye; level.PhaseTimerEye > 0; level.PhaseTimerEye--)
    {
        LUINotifyEvent(#"rush_boss_wipes", 2, 8, level.PhaseTimerEye);
        if(isDefined(level.SkipPhaseEye) && level.SkipPhaseEye) break;
        wait 1;
    }

    LUINotifyEvent(#"rush_boss_wipes", 1, 10);
    level notify(#"hash_38f29f9cb03586ea");
}

PhaseTimerKillLogic()
{
    level endon(#"end_game", #"hash_38f29f9cb03586ea");

    while(true)
    {
        wait 3;
        level waittill(#"hash_14400d2bff068132");
        level.PhaseTimerEye -= 15;
        foreach(player in level.players) 
         player iPrintlnBold("^2 Phase Time Reduced! (15 Seconds) "); // text
    }
}

AddBots_AELogic(a_ents)
{
    thread bo4_AddBotsToGame();
    thread bo4_AddBotsToGame();
    thread bo4_AddBotsToGame();

    // teleport logic (ai spawn too far away for some reason)
    wait 1.3;
    level thread lui::screen_flash(0.4, 2, 0.4, 1, "white");
    wait 0.5;
    TeleportThing = struct::get_array("s_boss_arena_teleport");
    a_players = getplayers();
    for (i = 0; i < a_players.size; i++) 
    {
        a_players[i] setorigin(TeleportThing[i].origin);
        a_players[i] setplayerangles(TeleportThing[i].angles);
    }
    
    foreach(player in level.players) 
     player notify(#"StopCharacter_Change");

    level notify(#"StopQuestDetect");
    LUINotifyEvent(#"rush_quest_detect", 3, 1, 62, randomIntRange(1, 10));
    // done
}

AEModels()
{
    level endon(#"perseus_defeated");

    BigMan = level.s_boss_battle.var_3edd432d;
    
    WidowszzZ3 = util::spawn_model("p7_zm_power_up_insta_kill", BigMan.origin + (0, 1000, 0));
    WidowszzZ4 = util::spawn_model("p7_zm_power_up_nuke", BigMan.origin + (0, -1000, 0));
    WidowszzZ5 = util::spawn_model("p8_zm_red_floatie_duck", BigMan.origin + (1000, 0, 0));
    WidowszzZ6 = util::spawn_model("p8_zm_red_floatie_duck", BigMan.origin + (-1000, 0, 0));
    wait 1;
    WidowszzZ3 SetScale(50);
    WidowszzZ4 SetScale(50);
    WidowszzZ5 SetScale(50);
    WidowszzZ6 SetScale(50);
    wait 1;
    WidowszzZ9 = util::spawn_model("p7_zm_power_up_insta_kill", BigMan.origin + (0, 2000, 0));
    WidowszzZ10 = util::spawn_model("p7_zm_power_up_nuke", BigMan.origin + (0, -2000, 0));
    WidowszzZ11 = util::spawn_model("p8_zm_red_floatie_duck", BigMan.origin + (2000, 0, 0));
    WidowszzZ12 = util::spawn_model("p8_zm_red_floatie_duck", BigMan.origin + (-2000, 0, 0));
    wait 1;
    WidowszzZ9 SetScale(50);
    WidowszzZ10 SetScale(50);
    WidowszzZ11 SetScale(50);
    WidowszzZ12 SetScale(50);
    
    while(true) 
    {
        wait 5;
        level flag::set("spawn_zombies");
    }
}

BloodChanges() // tested (kinda)
{
    //level endon(#"end_game", #"game_ended");

    //level.StopRandomObjects = true;
    s_portal = struct::get(#"hash_4f3ae1de39c4b3e3");
    Widowszz0 = util::spawn_model(#"p8_zm_red_floatie_duck", s_portal.origin + (0, 0, 0), (0, 0, 0));
    Widowszz1 = util::spawn_model(#"p8_zm_red_floatie_duck", s_portal.origin + (0, 0, 0), (90, 90, 90));
    Widowszz1 SetScale(50);
    Widowszz1 enablelinkto();
    Widowszz1 notSolid();
    Widowszz0 thread RotateInf();
    Widowszz1 thread RotateInf();

    wait 5;
    foreach(player in level.players) player notify(#"StopCharacter_Change");
    players = GetPlayers();
    players[0] setspecialistindex(5); // ric player needed or crash
    players[1] thread CharacterChange(false);
    players[2] thread CharacterChange(false);
    players[3] thread CharacterChange(false);

    s_portal thread NukeLook(s_portal.origin + (0, 0, 300), s_portal.angles, undefined, undefined, 10);
    level flag::set("zombie_drop_powerups");
    level.brutus_round_count = 10;
    level.zombie_vars["zombie_max_ai"] = 500;
    level.zombie_ai_limit = 400;
    level.zombie_actor_limit = 400;
    level.var_977f68ea = &Return1; // powerups delay remove

    Times = 1;
    level thread OrbsHealthLogic();
    //level thread CircleRedLogic();

    while(Times < 6) // here is extending phases (7)
    {
        if (level.var_a36cbfaf == 1)
        {
            wait 0.1;
            level.var_a36cbfaf = 0;
            Times++;
            foreach(player in level.players)
            {
                player iPrintLnBold("^8 Phase "+Times+"! ");
            }
            level thread GetScarlettPhase(Times);
            wait 5;
            level flag::set("zombie_drop_powerups");
        }
        wait 2;
    }
    wait 1;
    while(level.var_a36cbfaf != 1)
    {
        wait 1;
    }
    foreach(player in level.players)
    {
        player iPrintLnBold("^8 Phase 7! ");
    }
    level thread GetScarlettPhase(7);
    wait 5;
    level flag::set("zombie_drop_powerups");
    while(level.var_a36cbfaf != 2)
    {
        wait 1;
    }
    foreach(player in level.players)
    {
        player iPrintLnBold("^8 Last Phase! ");
    }
    level thread GetScarlettPhase(8);
    wait 5;
    level flag::set("zombie_drop_powerups");
}

EyeFakeAttackScale()
{
    level endon(#"hash_25d8c88ff3f91ee5"); // checks for complete, so it doesn't pop up the error model

    while(!isdefined(level.e_boss))
    {
        wait 1;
    }
    wait 0.5;
    level.e_boss thread EyeLoop();
    level.e_boss thread NukieAttack();
    wait 15;
    thread EyeActivateBuffs();
}

NukieAttack()
{
    self endon(#"death");
    level endon(#"hash_25d8c88ff3f91ee5");

    wait 2;
    self thread NukeLook(self.origin, self.angles, self, (0, 0, 550));
}

EyeLoop()
{
    self endon(#"death");
    level endon(#"hash_25d8c88ff3f91ee5"); // checks for complete, so it doesn't pop up the error model
    level endon(#"StopEyeDuck");    
        
    self enablelinkto();

    self.var_6efcc8c1 = 0;
    self.var_914750d = 0; // causes issues with bm attack..

    PowerNuke = util::spawn_model("p7_zm_power_up_nuke", self.origin + (0, 0, 0));
    PowerNuke SetScale(50);
    PowerNuke enablelinkto();
    PowerNuke linkto(self);
    PowerNuke notSolid();
    self.NukeLink = PowerNuke;

    DuckNuke = util::spawn_model("p8_zm_red_floatie_duck", self.origin + (0, 0, 0));
    DuckNuke SetScale(50);
    DuckNuke enablelinkto();
    DuckNuke linkto(self);
    DuckNuke notSolid();
    self.DuckNukeLink = DuckNuke;
    
    self SetScale(0.1);
    self thread AddLinkedObjective(1, self, #"hash_423a75e2700a53ab"); // works lol
    
    wait 6.50;
    level thread SpawnEyeCustom(self.origin + (500, 0, 0), self.angles, true);
    level thread SpawnEyeCustom(self.origin + (-500, 0, 0), self.angles, true);

    wait 1;
    level.RedEye = level.Custom_Eyes[0];
    level.GreenEye = level.Custom_Eyes[1];

    level.RedEye enablelinkto();
    level.GreenEye enablelinkto();

    InstaPower = util::spawn_model("p7_zm_power_up_insta_kill", level.RedEye.origin + (0, 0, 0));
    InstaPower SetScale(50);
    InstaPower enablelinkto();
    InstaPower linkto(level.RedEye);
    InstaPower notSolid();
    level.RedEye.InstaLink = InstaPower;
    
    DuckNukeInsta = util::spawn_model("p8_zm_red_floatie_duck", level.RedEye.origin + (0, 0, 0));
    DuckNukeInsta SetScale(50);
    DuckNukeInsta enablelinkto();
    DuckNukeInsta linkto(level.RedEye);
    DuckNukeInsta notSolid();
    level.RedEye.DuckLink = DuckNukeInsta;

    MaxAmmoPower = util::spawn_model("p7_zm_power_up_max_ammo", level.GreenEye.origin + (0, 0, 0));
    MaxAmmoPower SetScale(50);
    MaxAmmoPower enablelinkto();
    MaxAmmoPower linkto(level.GreenEye);
    MaxAmmoPower notSolid();
    level.GreenEye.MaxLink = MaxAmmoPower;

    DuckNukeMax = util::spawn_model("p8_zm_red_floatie_duck", level.GreenEye.origin + (0, 0, 0));
    DuckNukeMax SetScale(50);
    DuckNukeMax enablelinkto();
    DuckNukeMax linkto(level.GreenEye);
    DuckNukeMax notSolid();
    level.GreenEye.DuckLink = DuckNukeMax;

    level.RedEye thread AddLinkedObjective(1, level.RedEye, #"hash_423a75e2700a53ab", false, #"stop_objective");
    level.GreenEye thread AddLinkedObjective(1, level.GreenEye, #"hash_423a75e2700a53ab", false, #"stop_objective");

    level.GreenEye SetScale(0.1);
    level.RedEye SetScale(0.1);

    wait 30;
    self.var_6efcc8c1 = 0;
    self.var_18acfe18 = 0;
    self.var_57badb98 = 0;
    self.var_914750d = 0; // causes issues with bm attack..
    level.var_19261dce = 1;
    self.var_c962047c = -1;
    self.var_59cdb7b9 = 49000; // normal att
    self.var_f881e30f = 52000; // wipe
    self.var_ba36376c = 5 * 16500;
    self.var_7954bf70 = 5 * 19000;
    self.var_6a30a892 = 8 * 40000 / 4;
    level.EyeAngles = (0, 0, 0); // unused

    self thread EyeChangeColor();
    self thread CheckEndBoss();

    level.RedEye thread RandomAttackTimeing();
    level.GreenEye thread RandomAttackTimeing();

    while (true)
    {
        wait 5;

        thread DoSoundEye();
        if (!level flag::get(#"hash_62b951a213a3945e") || level flag::get(#"hash_50113a36d2c6bb73") && !level flag::get(#"hash_25d8c88ff3f91ee5") && self.var_6efcc8c1 != 3) // eye moving
        {
            self thread EyeRandomMove();
            level.GreenEye thread EyeRandomMove();
            level.RedEye thread EyeRandomMove();
        }

        if (level flag::get(#"hash_bd3b222f6d8329d") && !level flag::get(#"hash_50113a36d2c6bb73") && !level flag::get(#"hash_25d8c88ff3f91ee5") && self.var_6efcc8c1 != 3) // eye moving phase 4
        {
            self thread EyeRandomMove(true);
            level.GreenEye thread EyeRandomMove(true);
            level.RedEye thread EyeRandomMove(true);
        }

        wait 5;
        if (!level flag::get(#"hash_62b951a213a3945e") || level flag::get(#"hash_bd3b222f6d8329d") && !level flag::get(#"hash_25d8c88ff3f91ee5") && self.var_6efcc8c1 != 3)
        {
            self RandomEyeAttack();
            level.RedEye RandomEyeAttack();
            level.GreenEye RandomEyeAttack();
        }

        self thread Eye_DoMST();
        //self SetScale(0.2);
        self.e_damage SetScale(0.2);
        DuckNuke rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
        DuckNukeInsta rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
        DuckNukeMax rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);

        if (level flag::get(#"hash_bd3b222f6d8329d") && !level flag::get(#"hash_50113a36d2c6bb73") && !level flag::get(#"hash_25d8c88ff3f91ee5") && self.var_6efcc8c1 != 3) // eye moving phase 4
        {
            self thread EyeRandomMove(true);
            level.GreenEye thread EyeRandomMove(true);
            level.RedEye thread EyeRandomMove(true);
        }

        wait 5;   
        //self SetScale(0.6);
        self.e_damage SetScale(0.6);
        DuckNuke rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
        DuckNukeInsta rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
        DuckNukeMax rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);

        wait 5;
        if (!level flag::get(#"hash_62b951a213a3945e") || level flag::get(#"hash_bd3b222f6d8329d") && !level flag::get(#"hash_25d8c88ff3f91ee5") && self.var_6efcc8c1 != 3) // eye moving
        {
            self thread EyeRandomMove();
            level.GreenEye thread EyeRandomMove();
            level.RedEye thread EyeRandomMove();
        }

        if (level flag::get(#"hash_bd3b222f6d8329d") && !level flag::get(#"hash_50113a36d2c6bb73") && !level flag::get(#"hash_25d8c88ff3f91ee5") && self.var_6efcc8c1 != 3) // eye moving phase 4
        {
            self thread EyeRandomMove(true);
            level.GreenEye thread EyeRandomMove(true);
            level.RedEye thread EyeRandomMove(true);
        }

        self thread Eye_DoMST();
        //self SetScale(2);
        self.e_damage SetScale(2);
        DuckNuke rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
        DuckNukeInsta rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
        DuckNukeMax rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
        
        if (level flag::get(#"hash_bd3b222f6d8329d") && !level flag::get(#"hash_50113a36d2c6bb73") && !level flag::get(#"hash_25d8c88ff3f91ee5") && self.var_6efcc8c1 != 3) // eye moving phase 4
        {
            self thread EyeRandomMove(true);
            level.GreenEye thread EyeRandomMove(true);
            level.RedEye thread EyeRandomMove(true);
        }

        wait 5;
        //self SetScale(4);
        self.e_damage SetScale(4);
        DuckNuke rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
        DuckNukeInsta rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
        DuckNukeMax rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);

        wait 5;
        if (!level flag::get(#"hash_62b951a213a3945e") || level flag::get(#"hash_50113a36d2c6bb73") && !level flag::get(#"hash_25d8c88ff3f91ee5") && self.var_6efcc8c1 != 3) // eye moving
        {
            self thread EyeRandomMove();
            level.GreenEye thread EyeRandomMove();
            level.RedEye thread EyeRandomMove();
        }

        if (level flag::get(#"hash_bd3b222f6d8329d") && !level flag::get(#"hash_50113a36d2c6bb73") && !level flag::get(#"hash_25d8c88ff3f91ee5") && self.var_6efcc8c1 != 3) // eye moving phase 4
        {
            self thread EyeRandomMove(true);
            level.GreenEye thread EyeRandomMove(true);
            level.RedEye thread EyeRandomMove(true);
        }

        self thread Eye_DoMST();
        //self SetScale(6);
        self.e_damage SetScale(6);
        DuckNuke rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
        DuckNukeInsta rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
        DuckNukeMax rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);

        wait 5;
        if (!level flag::get(#"hash_62b951a213a3945e") || level flag::get(#"hash_50113a36d2c6bb73") && !level flag::get(#"hash_25d8c88ff3f91ee5") && self.var_6efcc8c1 != 3) // eye moving
        {
            self thread EyeRandomMove();
            level.GreenEye thread EyeRandomMove();
            level.RedEye thread EyeRandomMove();
        }

        if (level flag::get(#"hash_bd3b222f6d8329d") && !level flag::get(#"hash_50113a36d2c6bb73") && !level flag::get(#"hash_25d8c88ff3f91ee5") && self.var_6efcc8c1 != 3) // eye moving phase 4
        {
            self thread EyeRandomMove(true);
            level.GreenEye thread EyeRandomMove(true);
            level.RedEye thread EyeRandomMove(true);
        }

        self thread Eye_DoMST();
        //self SetScale(9);
        self.e_damage SetScale(9);
        DuckNuke rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
        DuckNukeInsta rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
        DuckNukeMax rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    }
}

CheckEndBoss()
{
    self endon(#"death");

    while(self.var_6efcc8c1 != 3)
    {
        wait 0.1;
    }

    level notify(#"StopEyeDuck");
    wait 2;

    // csc issue -> function_da0759d0
    self notify(#"hash_2bb8be6b846aed93");
    level.RedEye notify(#"hash_2bb8be6b846aed93");
    level.GreenEye notify(#"hash_2bb8be6b846aed93");

    // stop other csc funcs
    self notify(#"boss_end_snow_fx");
    level.RedEye notify(#"boss_end_snow_fx");
    level.GreenEye notify(#"boss_end_snow_fx");

    self notify(#"hash_7541447588c20db8");
    level.RedEye notify(#"hash_7541447588c20db8");
    level.GreenEye notify(#"hash_7541447588c20db8");

    wait 3.5; // wait <- caller is not an entity on boss_move and other functions
    level.RedEye.InstaLink delete();
    level.RedEye.DuckLink delete();
    level.GreenEye.MaxLink delete();
    level.GreenEye.DuckLink delete();

    level.GreenEye hide(); // if its attacking beem or anything, it will 100% crash with csc funcs
    level.RedEye hide();

    level.RedEye notify(#"stop_objective");
    level.GreenEye notify(#"stop_objective");

    self.NukeLink delete();
    self.DuckNukeLink delete();

    wait 30; // better to wait it out..

    level.GreenEye delete();
    level.RedEye delete();
}

moveasshole() // MOVE DOOR
{
    self moveto((0, 0, -99999), 0.5, 0.05, 0.05);
    return 1;
}

/#
WidowzEye() // eye widows
{
    if(BO4GetMap() == "Voyage")
    {
        wait 5;
            foreach(eye in getentarray("bs_bdy_mdl", "targetname")) 
            {
                if (isDefined(eye)) eye SetModel("p7_zm_vending_packapunch");
            }
    }
}
#/

WidowzHideShow() // eye show and hide
{
    level endoncallback(&WidowsPhase4, #"hash_fa1fa6cc9b17c7c"); // phase 4 check
    wait 5;

    if(BO4GetMap() == "Voyage")
    {      
        while(true)
        {
            wait 10;
            foreach(eye in getentarray("bs_bdy_mdl", "targetname"))
            {
                if (isDefined(eye)) eye show();
                wait 30;
                if (isDefined(eye)) eye hide();
                wait 2;
            }
        }
    }
}

WidowsPhase4(str_notify)
{
    level endon(#"hash_25d8c88ff3f91ee5"); // checks for complete, so it doesn't pop up the error model

    while(true)
    {
        foreach(eye in getentarray("bs_bdy_mdl", "targetname")) 
        {
            if (isDefined(eye)) eye hide();
        }
        wait 1;
    }
}

BossPhaseDetect() // i need to rework this bullshit later on
{
    //level endon(#"end_game", #"game_ended"); im dumb sometimes
    //foreach(player in level.players) // uhhhhhhhhhhhhh

    if(BO4GetMap() == "Voyage") // done
    {
        level flag::wait_till(#"boss_fight_started");
        wait 5;

        level.musicsystemoverride = 1;
        music::setmusicstate("location_tree");
        level thread EyePhaseTimer();

        wait 15;
        foreach(player in level.players) 
         player iPrintlnBold("^1 Boss Fight! "); // text
        wait 0.5;

        level.musicsystemoverride = 1;
        music::setmusicstate("frozen");

        wait 3;
        foreach(player in level.players) 
         player iPrintlnBold("^1 You can still Escape Poop Deck! "); // text

        wait 1.5;

        foreach(player in level.players) player
         iPrintlnBold("^2 Damage The ~Main~ Eye to Reduce Phase Time! "); // text

        // hash_62b951a213a3945e < phase 2, hash_bd3b222f6d8329d phase 3 (orignal unmodified ones)
        level flag::wait_till(#"hash_62b951a213a3945e");

        level.GreenEye thread EyeMoveFunction((0, 500, -10000), (0, 0, 0));
        level.RedEye thread EyeMoveFunction((0, -500, -10000), (0, 0, 0));

        wait 15;
        
        foreach(player in level.players) 
         player iPrintlnBold("^1 Phase 2 "); // text
        
        level.GreenEye thread EyeMoveFunction((806, -4409, 1245), (0, 165, 0));
        level.RedEye thread EyeMoveFunction((-885, -4421, 1248), (0, 20, 0));

        wait 6;
        LUINotifyEvent(#"rush_boss_wipes", 1, 9);
        level.musicsystemoverride = 1;
        music::setmusicstate("boss_1");

        //self playsound("zmb_eyeball_vox_intro_s3"); // ?????????????????? what
        level.e_boss playsound("zmb_eyeball_vox_intro_s3");

        wait 3;
        level flag::wait_till(#"hash_fa1fa6cc9b17c7c");
        wait 15;

        level.musicsystemoverride = 1;
        music::setmusicstate("quest_catalyst_portals");
        level thread EyePhaseTimer();

        //self playsound("zmb_eyeball_vox_intro_s4"); // ?? what
        level.e_boss playsound("zmb_eyeball_vox_intro_s4");
        foreach(player in level.players) 
         player iPrintlnBold("^1 Phase 3 "); // text

        level.GreenEye thread EyeMoveFunction((5, 860, 550), (0, 90, 0));
        level.RedEye thread EyeMoveFunction((-5, 1385, 500), (0, 90, 0));

        wait 4; // wait so no crash
        level thread lui::screen_flash(0.8, 4.5, 0.8, 1, "white");
        //WidowzEye();
        wait 5;
        foreach(player in level.players) 
         player iPrintlnBold("^1 You can still Escape The Engine Room! "); // text

        level flag::wait_till(#"hash_bd3b222f6d8329d");
        wait 15;

        level.musicsystemoverride = 1;
        LUINotifyEvent(#"rush_boss_wipes", 1, 9);
        music::setmusicstate("boss_2");

        foreach(player in level.players) player iPrintlnBold("^1 Phase 4 "); // text
        level.e_boss playsound("zmb_eyeball_vox_intro_s2");

        wait 3;
        level flag::wait_till(#"hash_50113a36d2c6bb73");
        wait 20;

        foreach(player in level.players) 
         player iPrintlnBold("^1 Phase 5 "); // text
        level.e_boss playsound("zmb_eyeball_vox_intro_s1");

        wait 17;
        level.e_boss thread EyeExtendPhasesLogic();
        
        wait 5;
        level flag::wait_till(#"hash_25d8c88ff3f91ee5");
        level thread lui::screen_flash(0.33, 0.33, 0.33, 0.8, "white");
        foreach(player in level.players) 
         player iPrintlnBold("^1 Rush Mode Completed! "); // text

        LUINotifyEvent(#"rush_boss", 1, 10);
        LUINotifyEvent(#"rush_boss_health", 1, 0);
        LUINotifyEvent(#"rush_boss_phase", 1, 0);
        LUINotifyEvent(#"rush_boss_wipes", 1, 0);
        LUINotifyEvent(#"rush_boss_line", 1, 0);
        LUINotifyEvent(#"rush_boss_line_2", 1, 0);

        LUINotifyEvent(#"rush_boss_health_bar", 1, 0);
        LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 0);
        LUINotifyEvent(#"rush_boss_health_bar_l", 1, 0);

        /#
        ShieldHudElemSetText(#"rush_boss", "Rush Mode Completed!");

        ShieldHudElemSetText(#"rush_boss_health", ""); // hide
        ShieldHudElemSetText(#"rush_boss_phase", ""); // hide
        ShieldHudElemSetText(#"rush_boss_wipes", ""); // hide
        ShieldHudElemSetText(#"rush_boss_line", ""); // hide
        ShieldHudElemSetText(#"rush_boss_line_2", "");
        #/

        foreach(player in level.players) player GivePowerup("nuke");
        wait 2;
        if (level.skipped) // check if you skipped or not, so it doesn't ruin the original!
        {
            VODCutSceneSetUp();
            wait 5;
            BotRemove(); // with skipped -> i forgot
            //level flag::clear("boss_fight_started");
            //thread RushKill();
        }

        wait 10;
        LUINotifyEvent(#"rush_boss", 1, 0);
        LUINotifyEvent(#"rush_boss_box", 1, 0);
        //ShieldHudElemSetText(#"rush_boss", ""); // hide
        level flag::set("spawn_zombies");
        //if (!level.skipped && self IsHost()) level thread StopEndGame();
        
        if (!level.skipped) // not skipped
        {
            foreach(player in level.players) // for print messages
            {
                wait 1;
                player iPrintlnBold("^3 You have Completed the Main Quest! "); // rush mode text
                player iPrintln("^2 The Main Quest has been Completed...... "); // rush mode text
            }
        }
    }

    if(BO4GetMap() == "IX") // done
    {
        wait 5;
        level waittill(#"boss_battle_done");
        wait 4;
        level thread lui::screen_flash(0.33, 0.33, 0.33, 0.8, "white");
        foreach(player in level.players) 
         player iPrintlnBold("^1 Rush Mode Completed! "); // text

        //ShieldHudElemSetText(#"rush_boss", "^1 Rush Mode Completed!"); // hide
        foreach(player in level.players) player GivePowerup("nuke");

        if (level.skipped) // check if you skipped or not, so it doesn't ruin the original!
            IXCutSceneSetUp();
        
        //if(self IsHost()) level thread StopEndGame(true);

        LUINotifyEvent(#"rush_boss", 1, 10);
        LUINotifyEvent(#"rush_boss_health", 1, 0);
        LUINotifyEvent(#"rush_boss_phase", 1, 0);
        LUINotifyEvent(#"rush_boss_wipes", 1, 0);
        LUINotifyEvent(#"rush_boss_line", 1, 0);
        LUINotifyEvent(#"rush_boss_line_2", 1, 0);

        LUINotifyEvent(#"rush_boss_health_bar", 1, 0);
        LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 0);
        LUINotifyEvent(#"rush_boss_health_bar_l", 1, 0);
        
        /#
        ShieldHudElemSetText(#"rush_boss_health", ""); // hide
        ShieldHudElemSetText(#"rush_boss", ""); // hide
        ShieldHudElemSetText(#"rush_boss_phase", ""); // hide
        ShieldHudElemSetText(#"rush_boss_wipes", ""); // hide
        ShieldHudElemSetText(#"rush_boss_line", ""); // hide
        ShieldHudElemSetText(#"rush_boss_line_2", "");
        #/
        
        wait 3;
        LUINotifyEvent(#"rush_boss", 1, 0);
        LUINotifyEvent(#"rush_boss_box", 1, 0);
        LUINotifyEvent(#"rush_boss_health", 1, 0);

        wait 10;
        level flag::set("spawn_zombies");
        if (!level.skipped) // not skipped
        {
            foreach(player in level.players) // for print messages
            {
                wait 1;
                player iPrintlnBold("^3 You have Completed the Main Quest! "); // rush mode text
                player iPrintln("^2 The Main Quest has been Completed...... "); // rush mode text
            }
        }

        wait 3;
        LUINotifyEvent(#"rush_boss", 1, 0);
        LUINotifyEvent(#"rush_boss_box", 1, 0);
        LUINotifyEvent(#"rush_boss_health", 1, 0);
        
        //wait 60; // ?? lol
    }

    if(BO4GetMap() == "Dead") // done
    {
        level flag::wait_till(#"boss_fight_started");
        wait 8;
        foreach(player in level.players) 
         player iPrintlnBold("^1 Boss Fight! "); // text

        foreach(player in level.players) 
         player notify(#"6d0604ca8ddb9571");
        
        level thread GetWolfPhase();
        wait 1;
        level waittill(#"hash_54f2e7b4cb8826a");

        foreach(player in level.players) 
         player iPrintlnBold("^1 Lockdown Phase! "); // text

        wait 5;
        level waittill(#"Phase3Wolf");

        foreach(player in level.players) 
         player iPrintlnBold("^1 Last Phase! "); // text

        level flag::wait_till(#"hash_25d8c88ff3f91ee5"); // boss fight completed // old : hash_480ab8b0d38942cc
        wait 3;

        foreach(player in level.players) 
         player iPrintlnBold("^1 Rush Mode Completed! "); // text

        foreach(player in level.players) player notify(#"6d0604ca8ddb9571");

        LUINotifyEvent(#"rush_boss", 1, 10);
        LUINotifyEvent(#"rush_boss_health", 1, 0);
        LUINotifyEvent(#"rush_boss_phase", 1, 0);
        LUINotifyEvent(#"rush_boss_wipes", 1, 0);
        LUINotifyEvent(#"rush_boss_line", 1, 0);
        LUINotifyEvent(#"rush_boss_line_2", 1, 0);

        LUINotifyEvent(#"rush_boss_health_bar", 1, 0);
        LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 0);
        LUINotifyEvent(#"rush_boss_health_bar_l", 1, 0);

        /#
        ShieldHudElemSetText(#"rush_boss_health", "^4Rush Mode Completed!"); // hide
        ShieldHudElemSetText(#"rush_boss", ""); // hide
        ShieldHudElemSetText(#"rush_boss_phase", ""); // hide
        ShieldHudElemSetText(#"rush_boss_wipes", ""); // hide
        ShieldHudElemSetText(#"rush_boss_line", ""); // hide
        ShieldHudElemSetText(#"rush_boss_line_2", "");
        #/

        level thread lui::screen_flash(0.33, 0.33, 0.33, 0.8, "white");

        foreach(player in level.players) 
         player iPrintln("^3 The Main Quest has been Completed...... "); // rush mode text
        
        //if(self IsHost()) level thread StopEndGame(true);
        level flag::wait_till(#"hash_480ab8b0d38942cc");
        LUINotifyEvent(#"rush_boss", 1, 0);
        LUINotifyEvent(#"rush_boss_box", 1, 0);
        //ShieldHudElemSetText(#"rush_boss_health", ""); // hide

        /#
        wait 20;
        foreach (e_player in util::get_active_players()) 
        {
            e_player freezecontrols(0);
            e_player.var_16735873 = 0;
        }
        #/

        wait 15;
        level flag::set("spawn_zombies");
        wait 25;
        level flag::set("spawn_zombies");
        wait 15;
        level flag::set("spawn_zombies");
    }

    if(BO4GetMap() == "AE") // done
    {
        zm_zonemgr::zone_wait_till_enabled("zone_boss_plateau_3");
        
        foreach(player in level.players) 
         player iPrintlnBold("^1 Boss Fight! "); // text

        wait 10;
        level.musicsystemoverride = 1;
        music::setmusicstate("boss_battle_stage_1");

        level flag::wait_till(#"hash_7be183aa6a4cbe7");
        foreach(player in level.players) 
         player iPrintlnBold("^1 Phase 2! "); // text

        level waittill(#"perseus_defeated");
        level.s_boss_battle.var_3edd432d notify(#"disable_perseus_objective");

        level notify(#"StopNukie");

        LUINotifyEvent(#"rush_boss", 1, 10);
        LUINotifyEvent(#"rush_boss_health", 1, 0);
        LUINotifyEvent(#"rush_boss_phase", 1, 0);
        LUINotifyEvent(#"rush_boss_wipes", 1, 0);
        LUINotifyEvent(#"rush_boss_line", 1, 0);
        LUINotifyEvent(#"rush_boss_line_2", 1, 0);

        LUINotifyEvent(#"rush_boss_health_bar", 1, 0);
        LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 0);
        LUINotifyEvent(#"rush_boss_health_bar_l", 1, 0);

        /#
        ShieldHudElemSetText(#"rush_boss", "Rush Mode Completed!"); // hide
        ShieldHudElemSetText(#"rush_boss_health", "");
        ShieldHudElemSetText(#"rush_boss_phase", ""); // hide
        ShieldHudElemSetText(#"rush_boss_wipes", ""); // hide
        ShieldHudElemSetText(#"rush_boss_line", ""); // hide
        #/

        foreach(player in level.players) 
         player iPrintlnBold("^1 Rush Mode Completed! "); // text
        
        wait 5;
        foreach(player in level.players) // for print messages
        {
            player iPrintlnBold("^3 You have Completed the Main Quest! "); // rush mode text
            player iPrintln("^2 The Main Quest has been Completed...... "); // rush mode text
        }

        //if(self IsHost()) level thread StopEndGame(true);

        LUINotifyEvent(#"rush_boss", 1, 0);
        LUINotifyEvent(#"rush_boss_box", 1, 0);
        //ShieldHudElemSetText(#"rush_boss", ""); // hide
        level flag::wait_till(#"boss_battle_complete");

        wait 30;
        level flag::set("spawn_zombies");
    }

    if(BO4GetMap() == "Blood") // done
    {
        level waittill(#"hash_3bb155b55ea4338a"); // boss fight when teleporting
        level thread lui::screen_flash(0.33, 0.33, 0.33, 0.8, "white");
        wait 2;
        foreach(player in level.players) 
         player iPrintlnBold("^1 Boss Fight! "); // text

        wait 15;
        level.musicsystemoverride = 1;
        music::setmusicstate("boss"); // ai somehow breaks the music, so restarting it will fix it

        level flag::wait_till(#"richtofen_sacrifice");

        foreach(player in level.players)
        {
            player iPrintlnBold("^2 MOVEEEEEEEEEE"); // text
            player iPrintlnBold("^3 MOVEEEEEEEEEE"); // text
            player iPrintlnBold("^4 MOVEEEEEEEEEE"); // text
        }

        level flag::wait_till(#"main_quest_completed"); // tested and working perfectly

        LUINotifyEvent(#"rush_boss", 1, 10);
        LUINotifyEvent(#"rush_boss_health", 1, 0);
        LUINotifyEvent(#"rush_boss_phase", 1, 0);
        LUINotifyEvent(#"rush_boss_wipes", 1, 0);
        LUINotifyEvent(#"rush_boss_line", 1, 0);
        LUINotifyEvent(#"rush_boss_line_2", 1, 0);

        LUINotifyEvent(#"rush_boss_health_bar", 1, 0);
        LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 0);
        LUINotifyEvent(#"rush_boss_health_bar_l", 1, 0);

        /#
        ShieldHudElemSetText(#"rush_boss", "^4 Rush Mode Completed!");
        ShieldHudElemSetText(#"rush_boss_health", "");
        ShieldHudElemSetText(#"rush_boss_phase", "");
        ShieldHudElemSetText(#"rush_boss_line", "");
        ShieldHudElemSetText(#"rush_boss_wipes", "");
        #/

        level notify(#"StopNukie");
        //if(self IsHost()) level thread StopEndGame(true);
        foreach(player in level.players)
        {
            player iPrintlnBold("^1 Rush Mode Completed! "); // text
            player iPrintln("^2 The Main Quest has been Completed...... "); // rush mode text
        }
        wait 5;

        LUINotifyEvent(#"rush_boss", 1, 0);
        LUINotifyEvent(#"rush_boss_box", 1, 0);
        //ShieldHudElemSetText(#"rush_boss", "");
        
        wait 15;
        level flag::set("spawn_zombies");
    }

    if(BO4GetMap() == "Classified") // done - hell
    {
        while(level.round_number != 300)
        {
            wait 1;
        }
        wait 5;
        scene::add_scene_func("cin_zm_office_outro", &AfterCutsceneSetUp, "done");
        level thread scene::play("cin_zm_office_outro");
    }
    
    if(BO4GetMap() == "AO") // done
    {
        level flag::wait_till(#"boss_fight_started");
        wait 30;
        level.e_avogadro waittill(#"intro_done");
        wait 3;
        level thread lui::screen_flash(0.33, 0.33, 0.33, 0.8, "white");
        wait 3;
        foreach(player in level.players) 
         player iPrintlnBold("^1 Boss Fight! "); // text

        level waittill(#"avog_captured");

        foreach(player in level.players) 
         player iPrintlnBold("^1 Rush Mode Completed! "); // text
         
        //if(self IsHost()) level thread StopEndGame(true);

        LUINotifyEvent(#"rush_boss", 1, 10);
        LUINotifyEvent(#"rush_boss_health", 1, 0);
        LUINotifyEvent(#"rush_boss_phase", 1, 0);
        LUINotifyEvent(#"rush_boss_wipes", 1, 0);
        LUINotifyEvent(#"rush_boss_line", 1, 0);
        LUINotifyEvent(#"rush_boss_line_2", 1, 0);

        LUINotifyEvent(#"rush_boss_health_bar", 1, 0);
        LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 0);
        LUINotifyEvent(#"rush_boss_health_bar_l", 1, 0);

        /#
        ShieldHudElemSetText(#"rush_boss", "^1Rush Mode Completed!");
        ShieldHudElemSetText(#"rush_boss_health", "");
        ShieldHudElemSetText(#"rush_boss_phase", "");
        ShieldHudElemSetText(#"rush_boss_line", "");
        ShieldHudElemSetText(#"rush_boss_wipes", "");
        #/

        wait 5;
        level thread lui::screen_flash(0.33, 0.33, 0.33, 0.8, "white");
        foreach(player in level.players) player iPrintln("^2 The Main Quest has been Completed...... "); // rush mode text
        LUINotifyEvent(#"rush_boss", 1, 0);
        LUINotifyEvent(#"rush_boss_box", 1, 0);
        //ShieldHudElemSetText(#"rush_boss", "");
    }

    if(BO4GetMap() == "Tag") // done
    {
        level flag::wait_till(#"hell_on_earth");
        wait 1;
        foreach(player in level.players) 
         player iPrintlnBold("^1 Lockdown! "); // text < its not a boss? i guess i will call it a lockdown instead lol
        wait 8;
        level.musicsystemoverride = 1; // ai stop ruining music
        music::setmusicstate("hell_on_earth_1");
        wait 3;

        level.var_5d5b7e8e.var_a41818b5 thread SpeedSlow();
        level.var_5d5b7e8e.var_a41818b5 waittill(#"defend");
        foreach(player in level.players) player iPrintlnBold("^1 Charging Now! ");
        level.ARCharging = true;
        level thread GetARSouls("1");
        level.CurrentSpeedAR = 15;
        level waittill(#"StopSoulsCount");

        level.var_5d5b7e8e.var_a41818b5 thread SpeedSlow();
        level.var_5d5b7e8e.var_a41818b5 waittill(#"defend");
        foreach(player in level.players) player iPrintlnBold("^1 Charging Now! ");
        level.ARCharging = true;
        level thread GetARSouls("2");
        level.CurrentSpeedAR = 15;
        level waittill(#"StopSoulsCount");
        
        level.var_5d5b7e8e.var_a41818b5 thread SpeedSlow();
        level.var_5d5b7e8e.var_a41818b5 waittill(#"defend");
        foreach(player in level.players) player iPrintlnBold("^1 Charging Now! ");
        level.ARCharging = true;
        level thread GetARSouls("4");
        level.CurrentSpeedAR = 15;
        level waittill(#"StopSoulsCount");

        level.var_5d5b7e8e.var_a41818b5 thread SpeedSlow();
        level.var_5d5b7e8e.var_a41818b5 waittill(#"last_stand");
        level.ARLaststand = true;
        foreach(player in level.players) player iPrintlnBold("^1 Final Lock Down! ");
        level.CurrentSpeedAR = 15;
        level flag::wait_till(#"hold_round_end");
        wait 3;
        foreach(player in level.players) player iPrintlnBold("^1 Rush Mode Completed! "); // text

        /#
        ShieldHudElemSetText(#"rush_boss", "^1Rush Mode Completed!");
        ShieldHudElemSetText(#"rush_boss_health", "");
        ShieldHudElemSetText(#"rush_boss_phase", "");
        ShieldHudElemSetText(#"rush_boss_line", "");
        ShieldHudElemSetText(#"rush_boss_wipes", "");
        #/

        LUINotifyEvent(#"rush_boss", 1, 10);
        LUINotifyEvent(#"rush_boss_health", 1, 0);
        LUINotifyEvent(#"rush_boss_phase", 1, 0);
        LUINotifyEvent(#"rush_boss_wipes", 1, 0);
        LUINotifyEvent(#"rush_boss_line", 1, 0);
        LUINotifyEvent(#"rush_boss_line_2", 1, 0);

        LUINotifyEvent(#"rush_boss_health_bar", 1, 0);
        LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 0);
        LUINotifyEvent(#"rush_boss_health_bar_l", 1, 0);

        wait 5;
        foreach(player in level.players) // for print messages
        {
            wait 1;
            player iPrintlnBold("^3 You have Completed the Main Quest! "); // rush mode text
            player iPrintln("^2 The Main Quest has been Completed...... "); // rush mode text
        }

        LUINotifyEvent(#"rush_boss", 1, 0);
        LUINotifyEvent(#"rush_boss_box", 1, 0);
        //ShieldHudElemSetText(#"rush_boss", "");

        wait 190;
        //if(self IsHost()) level thread StopEndGame(true);
    }
}

SpeedSlow() // for tag
{
    self endon(#"death");
    self endon(#"defend");
    self endon(#"last_stand");
    level endon(#"end_game");

    wait 10;

    while(true)
    {
        wait 5;
        self setspeed(3);
        level.CurrentSpeedAR = 15;
        wait 5;
        self setspeed(1);
        level.CurrentSpeedAR = 16;
        wait 5;
        self setspeed(0);
        level.CurrentSpeedAR = 17;
        wait 5;
        self setspeed(7);
        level.CurrentSpeedAR = 18;
    }
}