CreditAndStats() // credit me please lol
{
    //level endon(#"end_game", #"game_ended");

    while(true)
    {
       wait 450; // 450s
       foreach(player in level.players)
       {
            player iPrintln("^3Credits: Mod made by 'Peawhatever' : Functions by ATE47/Jek/GerardS0406/Gillam/SirCryptic/TheUnknownCod3r/futilitymen(NTC) (GitHub) : Compiler by Serious!");
            player iPrintLn("^5:: Game Stats ::");
            player iPrintLn("^2Game Total Zombies Killed: "+level.zombie_player_killed_count+"!");
            player iPrintLn("^2Game Total Score: "+level.score_total+"!");
            player iPrintLn("^2Player Downs: "+player.downs+"!");
       }
       //self iPrintLn("^5Game Total Zombies Killed: "+level.global_zombies_killed+"!"); < useless
    }
}

BloodMoney()
{
    self endon(#"disconnect", #"death");
    //level endon(#"end_game", #"game_ended");

    self.HDrainPoints = array(50, 100, 250, 500, 1000, 2500, 3000); // blood money
    self.DrainP = 1;

    if (!self IsHost()) return;

    if (!level.RealisticDif)
    {
        zm_player::register_player_damage_callback(&OnDamage);
    }
    else
    {
        while(true)
        {
            foreach(player in level.players)
            {
                player.armor = 0;
                wait 0.5;
            }
        }
    }
}

OutOfBounds()
{
    level flagsys::wait_till(#"load_main_complete");
    
    level.player_out_of_playable_area_monitor = 0; // no laughs please
    level notify(#"stop_player_out_of_playable_area_monitor");

    level.player_out_of_playable_area_monitor_callback = &ReturnFalse;
    level.player_out_of_playable_area_override = &ReturnFalse;
}

ChangeMap(Mapname)
{
    self iPrintLnBold("Map Changing To "+Mapname);
    wait 2;
    setDvar("ls_mapname", Mapname);
    setDvar("mapname", Mapname);
    setDvar("party_mapname", Mapname);
    setDvar("ui_mapname", Mapname);
    setDvar("ui_currentmap", Mapname);
    setDvar("ui_previewmap", Mapname);
    setDvar("ui_showmap", Mapname);
    wait 2;

    map(Mapname);
}

RefreshMap()
{
    MapName = level.script;

    self iPrintLnBold("Map Changing To "+MapName);

    wait 2;
    setDvar("ls_mapname", MapName);
    setDvar("mapname", MapName);
    setDvar("party_mapname", MapName);
    setDvar("ui_mapname", MapName);
    setDvar("ui_currentmap", MapName);
    setDvar("ui_previewmap", MapName);
    setDvar("ui_showmap", MapName);
    wait 2;

    map(Mapname);
}

ReturnTrue()
{
    return true;
}

ReturnFalse()
{
    return false;
}

no_delay() 
{
    return 0;
}

KillAllZombies(player) 
{
    level.zombie_total = 0;
    foreach(zombie in getaiarchetypearray(#"zombie")) 
    {
        if (isDefined(zombie)) zombie DoDamage(zombie.health + 99, zombie.origin);
    }

    KillAllZombiesChecks();
}

KillAllZombies_One(player) 
{
    level.zombie_total = 1;
    foreach(zombie in getaiarchetypearray(#"zombie")) 
    {
        if (isDefined(zombie)) zombie DoDamage(zombie.health + 99, zombie.origin);
    }
}

RemoveBlackScreen()
{
    self endon(#"disconnect", #"death"); // ``David 246 Violet Axe``

    level.var_ab367500 = 3; // fade 
    setmatchflag("disableIngameMenu", 0); // Remove black screen
    val::reset(#"initial_black", "ignoreme");
    val::reset(#"initial_black", "disablegadgets");
    val::reset(#"initial_black", "show_hud");
    val::reset(#"initial_black", "freezecontrols");
    val::reset(#"initial_black", "hide");
    initial_black = lui::get_luimenu("InitialBlack");
    initial_black initial_black::close(self);
    self thread CloseBlack(initial_black);
    level clientfield::set("sndZMBFadeIn", 1);
    self SetClientUIVisibilityFlag("hud_visible", 1);

    wait 10;
    self SetClientUIVisibilityFlag("hud_visible", 1);
    self iPrintLnBold("^1Loading......");

    for(i=0; i < 7; i++)
    {
        self iPrintLn("^1Loading......");
    }

    switch(level.gamedifficulty)
    {
        case 0:
        self iPrintLn("^9Loading...... (Casual Difficulty)");
        break;
        
        case 1:
        self iPrintLn("^9Loading...... (Normal Difficulty)");
        break;

        case 2:
        self iPrintLn("^9Loading...... (Hardcore Difficulty)");
        break;

        case 3:
        self iPrintLn("^9Loading...... (Super Realistic Difficulty)");
        break;
    }
    
    #ifdef _SUPPORTS_DETOURS
    self iPrintLn("^3Loading...... (Used Detours - Project BO4?)");
    #endif

    #ifdef _INJECT_CLIENT
    self iPrintLn("^9Loading...... (Used CSC)");
    #endif
    self iPrintLn("^9Loading...... (Please Wait...)");
    
    level flag::wait_till("initial_blackscreen_passed");
    self thread lui::screen_fade_in(level.var_ab367500);
}

CanGibZombies()
{
    foreach(player in level.players) player.can_gib_zombies = 0;
}

ActivateEntGun()
{
    self.EntGun = isDefined(self.EntGun) ? undefined : true;
    if (isDefined(self.EntGun))
    {
        self thread BulletTraceEnitity();
    } 
    else 
    {
        self notify("stop_ent");
    }
}

BulletTraceEnitity()
{
    self endon("stop_ent");
    level endon("game_ended");

    while(true)
    {
        self waittill("weapon_fired");
        tag_origin = self geteye();
        look = AnglesToForward(self GetPlayerAngles());
        tag_end = tag_origin + vectorscale(look, 10000);
        bullet_hit = bullettrace(tag_origin, tag_end, 1, self);

        Ent = bullet_hit[#"entity"]; // entity (entity)

        if(!isdefined(Ent))
        {
            iPrintLnBold("Can't Find it!");
        }
        else
        {
            iPrintLnBold("Ent : " + Ent.model);
            am_log("Ent : " + Ent.model);
            if(isdefined(Ent.targetname)) iPrintLnBold("Ent : " + Ent.targetname);
            if(isdefined(Ent.targetname)) am_log("Target : " + Ent.targetname);
        }
    }
}

CharacterChange(delay = true)
{
    self endon(#"StopCharacter_Change");
    self endon(#"disconnect", #"death");

    wait 1.5;

    EntN = self getEntityNumber();
    switch(EntN)
    {
        case 0:
        if(self IsAttached(#"c_t8_mp_spe_spectre_body1_skin1")) break;
        //self attach(#"c_t8_mp_spe_spectre_body1_skin1");
        //self attach("c_t8_mp_spe_spectre_head1", "j_head");
        break;

        case 1:
        if(self IsAttached(#"c_t8_mp_spe_hacker_body1")) break;
        //self attach(#"c_t8_mp_spe_hacker_body1");
        //self attach("c_t8_mp_spe_hacker_head1", "j_head");
        break;

        case 2:
        if(self IsAttached(#"c_t8_mp_spe_buffer_body1")) break;
        //self attach(#"c_t8_mp_spe_buffer_body1");
        //self attach("c_t8_mp_spe_buffer_paladin_head1", "j_head");
        break;

        case 3:
        if(self IsAttached(#"c_t8_mp_spe_reaper_body1")) break;
        //self attach(#"c_t8_mp_spe_reaper_body1");
        //self attach("c_t8_mp_spe_reaper_head1", "j_head");
        break;
    }

    if(delay) wait 30;

    switch(BO4GetMap())
    {
        case "IX": 
        while(true)
        {
            self setspecialistindex(randomIntRange(13, 17));
            wait(randomintrange(10, 20));
        }
        break;

        case "Dead": 
        while(true)
        {
            self setspecialistindex(randomIntRange(9, 13));
            wait(randomintrange(10, 20));
        }
        break;

        case "Voyage": 
        while(true)
        {
            self setspecialistindex(randomIntRange(1, 5));
            wait(randomintrange(10, 20));
        }
        break;

        case "Classified": 
        while(true)
        {
            self setspecialistindex(randomIntRange(17, 21));
            wait(randomintrange(10, 20));
        }
        break;
    
        case "Blood": 
        while(true)
        {
            wait(randomintrange(10, 20));
            
            if(isDefined(self.zombie_vars[#"zombie_powerup_zombie_blood_on"]) && self.zombie_vars[#"zombie_powerup_zombie_blood_on"]) // Prevent ~~ Charlie 332 Apocalyptic Theater ~~
            continue;

            self setspecialistindex(randomIntRange(5, 9));
        }
        break;

        case "AE": 
        while(true)
        {
            self setspecialistindex(randomIntRange(1, 5));
            wait(randomintrange(10, 20));
        }
        break;
    
        case "AO": 
        while(true)
        {
            self setspecialistindex(randomIntRange(21, 25));
            wait(randomintrange(10, 20));
        }
        break;
        
        case "Tag": 
        while(true)
        {
            self setspecialistindex(randomIntRange(25, 29));
            wait(randomintrange(10, 20));
        }
        break;
    }
}

CloseBlack(initial_black) 
{
    self endon(#"disconnect");
    for (i = 0; i < 5; i++)
    {
        initial_black initial_black::close(self);
        util::wait_network_frame(2);
    }
}

AlwaysJoinable()
{
    level flag::wait_till("all_players_spawned");
    level flag::wait_till("initial_blackscreen_passed");

    while(true)
    {
        ChangeAdvertisedStatus(1);
        wait 1;
    }
}

NotifyEndGame()
{
    level notify(#"end_game");
}

CheckGameOverOpen()
{
    wait 3;
    
    players = getplayers();
    for (i = 0; i < players.size; i++) 
    {
        if (level.var_7c7c6c35 zm_game_over::is_open(players[i])) 
        {
            level.var_7c7c6c35 zm_game_over::close(players[i]);
        }
    }
}

GameOverFunctions()
{
    util::preload_frontend();
    wait 0.5;

    changeadvertisedstatus(1);
    players = getplayers();
    for (i = 0; i < players.size; i++)
    {
        players[i] setclientuivisibilityflag("weapon_hud_visible", 1);
        players[i] setclientminiscoreboardhide(0);
        players[i] val::reset(#"game_end", "freezecontrols");
        players[i] val::reset(#"game_end", "disablegadgets");
        players[i] val::reset(#"end_of_game", "freezecontrols");
    }

    foreach(player in level.players)
    {
        player val::set(#"end_game", "ignoreme", 1);
    }

    setmatchflag("game_ended", 0);
    setmatchflag("disableIngameMenu", 0);
    level clientfield::set("gameplay_started", 1);
    level clientfield::set("zesn", 0);
    level notify(#"stop_intermission");
    luinotifyevent(#"force_scoreboard", 0);

    Restart_Menu();
}

Restart_Menu() 
{
    foreach (player in level.players) 
    {
        player thread CheckOptionClick();
    }
    level thread NotifyRestart();
    level waittill(#"resume_end_game");
    luinotifyevent(#"hash_3aa743d9ad6c8e19", 0);

    exitLevel(0);
    wait(666);
}

NotifyRestart() 
{
    level endon(#"resume_end_game");

    luinotifyevent(#"hash_1fc4832b89307895", 0);
}

CheckOptionClick() 
{
    level endon(#"resume_end_game");

    while (1) 
    {
        waitresult = undefined;
        waitresult = self waittill(#"menuresponse");
        response = waitresult.response;
        if (response == "restart_level_zm") 
        {
            /#
            if (BO4GetMap() == "Tag") 
            {
                level notify(#"resume_end_game");
                return; // fast restart doesn't work for tag...
            }
            #/
            map_restart(0);
            wait(666);
        } 
        else if (response == "resume_end_game")
        {
            level notify(#"resume_end_game");
        }
    }
}

OverrideQuest(quest_name, step_name, setup_func, cleanup_func = undefined, check_start = false, check_complete = false) // thanks to Scrappy (modifed it a little)
{
    while (!IsDefined(level._ee))
    {
        waitframe(1);
    }
    while (!isdefined(level._ee[quest_name]))
    {
        waitframe(1);
    }

    ee = level._ee[quest_name];
    foreach (step in ee.steps) 
    {
        if (step.name == step_name)
        {
            ee_step = step;
            break;
        }
    }

    if (!IsDefined(ee_step)) 
    {
        return;
    }

    if (IsDefined(setup_func)) 
    {
        ee_step.setup_func = setup_func;
    }

    if (IsDefined(cleanup_func)) 
    {
        ee_step.cleanup_func = cleanup_func;
    }

    if(check_start)
    {
        while(true)
        {
            wait 3;
            if (ee_step.started)
            {
                level notify(step_name + "Started");
                break;
            }
        }
    }

    if(!check_complete) return;
    while(true)
    {
        wait 3;
        if (ee_step.completed)
        {
            level notify(step_name + "Completed");
            level notify(#"StopHinting");
            break;
        }
    }
}

SkipQuestStep(quest_name, step_name)
{
    while (!IsDefined(level._ee))
    {
        waitframe(1);
    }
    while (!isdefined(level._ee[quest_name]))
    {
        waitframe(1);
    }

    ee = level._ee[quest_name];
    foreach (step in ee.steps) 
    {
        if (step.name == step_name)
        {
            ee_step = step;
            break;
        }
    }

    if (!IsDefined(ee_step)) 
    {
        return;
    }

    ee_step notify(#"end_early");
}

TagFastRestartFix()
{
    OverrideQuest(#"hash_729a1e4eb041be9b", "step_1", &FuckOffZebra);
}

FuckOffZebra(b_skipped)
{
    wait 3;
    [[ @zm_orange_ee_misc<scripts\zm\zm_orange_ee_misc.gsc>::trinket_quest ]](0);
}

VODFastRestartFix()
{
    level.var_58bc5d04 = getTime();
}

SpawnZombiesForever()
{
    //level endon(#"end_game", #"game_ended");

    while(!level.PickedOption) // wait for pick
    {
        wait 1;
    }

    while(true)
    {
        wait 5;
        level flag::set("spawn_zombies");
    }

}

DeleteSeconds() 
{
    wait(randomFloatRange(1, 3));
    if (isdefined(self)) 
    {
        self delete();
    }
}

DeleteSecondsFast() 
{
    wait(1);
    if (isdefined(self)) 
    {
        self delete();
    }
}

DeleteSecondsInstant()
{
    wait(0.01);
    if (isdefined(self)) 
    {
        self delete();
    }
}

SpawnAvocAO()
{
    level.custom_e_avogadro = zombie_utility::spawn_zombie(getent("avogadro_spawner", "targetname"), undefined, undefined);
    level.custom_e_avogadro.var_885c1824 = undefined;
    level.custom_e_avogadro.vol_no_charge = getent("vol_avogadro_no_charge", "targetname");
    level.custom_e_avogadro.vol_retreat = getent("vol_avogadro_retreat", "targetname");
    level.custom_e_avogadro.var_77ef4a35 = struct::get("avogadro_retreat_point", "targetname");
    level.custom_e_avogadro.name = "avog";
    level.custom_e_avogadro.isspeaking = 0;
    level.custom_e_avogadro.var_5b6ebfd0 = 0;
    level.custom_e_avogadro playloopsound(#"hash_43d41833f5950a8d");
    level.custom_e_avogadro forceteleport((self.origin) + (0, 200, 10), (0,0,0));
}

TestFunction()
{
    //GetSparks();
    FakeError();
    //GiveClientWeapon(#"cymbal_monkey", self);
    //self GiveHeroWeapon("hero_flamethrower_t8_lv1");
    // luinotifyevent(#"testlua_update_counter", 2, old_count, old_remaining);

    /#
    LUINotifyEvent(#"rush_boss", 1, 1);
    LUINotifyEvent(#"rush_boss_health", 4, 1, 1, 1, 1);
    LUINotifyEvent(#"rush_boss_phase", 2, 1, 1);
    LUINotifyEvent(#"rush_boss_wipes", 2, 1, 1);
    LUINotifyEvent(#"rush_boss_line", 1, 1);
    LUINotifyEvent(#"rush_boss_line_2", 1, 1);
    LUINotifyEvent(#"rush_boss_health_bar", 1, 3);
    LUINotifyEvent(#"rush_boss_health_bar", 1, 6); // for dotn only
    LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 1);
    LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 3);
    LUINotifyEvent(#"rush_boss_health_bar_l", 1, 3);
    LUINotifyEvent(#"rush_boss_health_bar_l", 1, 6);
    LUINotifyEvent(#"rush_boss_box", 1, 2); // bigger

    wait 3;

    LUINotifyEvent(#"rush_boss_health_bar", 2, 1, int(100 * 400 / 1500));
    #/

    //SpawnEyeCustom(self.origin + (0, 0, 300), (0, 90, 0));

    /#
    LUINotifyEvent(#"rush_boss", 1, 0);
    LUINotifyEvent(#"rush_boss_health", 4, 1, 1, 1, 1);
    LUINotifyEvent(#"rush_boss_phase", 1, 0);
    LUINotifyEvent(#"rush_boss_wipes", 1, 3);
    LUINotifyEvent(#"rush_boss_line", 1, 1);
    LUINotifyEvent(#"rush_boss_line_2", 1, 0);
    LUINotifyEvent(#"rush_boss_health_bar", 1, 3);
    LUINotifyEvent(#"rush_boss_health_bar_l", 1, 3);
    LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 1);
    LUINotifyEvent(#"rush_boss_box", 1, 1);

    wait 1;

    LUINotifyEvent(#"rush_boss_health", 2, 3, int(10000));
    LUINotifyEvent(#"rush_boss_health_bar", 2, 1, int(100 * 10000 / 40000)); // 40000 < max health
    LUINotifyEvent(#"rush_boss_health_bar_l", 2, 1, int(100 * 10000 / 40000));
    LUINotifyEvent(#"rush_boss_health_bar", 1, 3);

    wait 3;

    LUINotifyEvent(#"rush_boss_health", 2, 3, int(5000));
    LUINotifyEvent(#"rush_boss_health_bar", 2, 1, int(100 * 5000 / 40000)); // 40000 < max health
    LUINotifyEvent(#"rush_boss_health_bar_l", 2, 1, int(100 * 5000 / 40000));
    LUINotifyEvent(#"rush_boss_health_bar", 1, 3);

    wait 3;

    LUINotifyEvent(#"rush_boss_health", 2, 3, int(20000));
    LUINotifyEvent(#"rush_boss_health_bar", 2, 1, int(100 * 20000 / 40000)); // 40000 < max health
    LUINotifyEvent(#"rush_boss_health_bar_l", 2, 1, int(100 * 20000 / 40000));
    LUINotifyEvent(#"rush_boss_health_bar", 1, 3);

    /#
    //AimTest();
    //LUINotifyEvent(#"rush_boss", 2, 9, 11);

    /#
    LUINotifyEvent(#"rush_event_box", 2, 1, 15);
    wait 3;
    LUINotifyEvent(#"rush_event_box", 2, 1, 50);
    wait 3;
    LUINotifyEvent(#"rush_event_box", 2, 1, 150);
    wait 3;
    LUINotifyEvent(#"rush_event_box", 2, 1, 3);
    #/
    //self util::setClientSysState("descNotif", "" + 33 + "," + 44 + "," + "" + 5 + "," + "" + 1, self);

    /#
    LUINotifyEvent(#"rush_test_string", 1, #"shield/waitrush");
    wait 8;
    LUINotifyEvent(#"rush_test_string", 1, #"shield/waitrush");
    wait 8;
    LUINotifyEvent(#"rush_test_string", 1, "shield/waitrush");
    #/


    /#
    Duckie = util::spawn_model(#"p7_zm_vending_widows_wine", self.origin + (0, 0, 100), self.angles);
    Duckie thread RotateAndBobItem();
    Duckie thread AddLinkedObjective(true, Duckie);

    wait 5;

    Duckie Delete();
    #/

    /#
    Duckie.health = 15000 * util::get_active_players().size;
    Duckie setCanDamage(1);
    Duckie thread DamageCheckR();
    Duckie thread DamageDoneCheck();
    #/
}

DamageCheckR() // callback -> callback::function_9d78f548
{
    self endon(#"death");

    while(true)
    {
        s_notify = self waittill(#"damage");
        n_damage = s_notify.amount;
        w_weapon = s_notify.weapon;

        if (level.CanDamageCustom)
        {
            n_health_after_damage = self.health - n_damage;
            if (n_health_after_damage <= 5000) 
            {
                n_damage = 0;
                self notify(#"delete_me");
            }
        }

        if (n_damage > 0 && isalive(s_notify.attacker) && isplayer(s_notify.attacker)) 
        {
            s_notify.attacker util::show_hit_marker();
        }
    }
}

DamageDoneCheck()
{
    self waittill(#"delete_me");
    //playsoundatposition(#"hash_14e38e92efca6db0", self.origin);
    self notify(#"StopFollow");
    self delete();
}

SpawnZombieMenu()
{
    ai = zombie_utility::spawn_zombie(array::random(level.zombie_spawners));
    wait 2;
    if(isDefined(ai)) ai forceteleport(self.origin);
    wait 2;
    if(isDefined(ai)) ai forceteleport(self.origin);
}

SpawnBlightMenu()
{
    if(!BO4ChaosMap())
    {
        self iPrintLnBold("^1Not in Chaos Map!");
        return;
    }

    while (!isdefined(ai)) 
    {
        ai = zombie_utility::spawn_zombie(array::random(level.zombie_spawners));
        wait(0.5);
    }
    wait 3;
    if(!isDefined(ai)) return;
    
    [[ @zm_transform<scripts\zm_common\zm_transformation.gsc>::function_9acf76e6 ]](ai, #"blight_father", &SpawnTeleport);
    self iPrintLnBold("^2Spawned Blightfather!");
}

SpawnWerewolfMenu()
{
    if(BO4GetMap() != "Dead")
    {
        self iPrintLnBold("^1Not in DOTN!");
        return;
    }

    function_47a88a0c = @zombie_werewolf_util<script_387eab232fe22983.gsc>::function_47a88a0c; 
    level thread [[ function_47a88a0c ]](1, undefined, 1, undefined, 200);

    self iPrintLnBold("^2Spawned Werewolf!");
}

SpawnBlight()
{
    if(!BO4ChaosMap())
    {
        self iPrintLnBold("^1Error!");
        return;
    }

    while (!isdefined(ai))
    {
        ai = zombie_utility::spawn_zombie(array::random(level.zombie_spawners));
        wait 0.5;
    }
    
    if (!(isdefined(ai.completed_emerging_into_playable_area) && ai.completed_emerging_into_playable_area))
        ai waittill(#"completed_emerging_into_playable_area");
    
    if(!isDefined(ai)) return;
    [[ @zm_transform<scripts\zm_common\zm_transformation.gsc>::function_9acf76e6 ]](ai, #"blight_father");
}

SpawnTeleport(ai)
{
    ai endon(#"death");

    players = GetPlayers();
    Teleported = false;
    
    while(!Teleported)
    {
        ai ForceTeleport(players[0].origin, (0, 0, 0));
        Teleported = true;
        wait 1;
    }
}

TimeScale(Scale)
{
    setslowmotion(1, Scale, 0);
}

PauseZombieSpawn()
{
    level.PauseZombies = isDefined(level.PauseZombies) ? undefined : true;

    if(isDefined(level.PauseZombies))
    {
        thread KillAllZombies_One();
        level flag::clear(#"spawn_zombies");
    }
    else
    {
        level flag::set(#"spawn_zombies");
    }
}

NotifyCharlie() // not tested but maybe....
{
    //level endon(#"end_game", #"game_ended");

    /#
    while(true)
    {
        foreach(player in level.players) player iPrintLn("^0 Charlie Global Spawn Count is > ^9" + level.zombie_server_choke_ids_count);
        wait 5;
    }
    #/
}

UpgradeWeapon()
{
    weapon = self GetCurrentWeapon();

    if (!zm_weapons::can_upgrade_weapon(weapon))
    {
        if (zm_weapons::is_wonder_weapon(weapon))
        {
            return;
        }

        RandomAAT = array::randomize(array("zm_aat_frostbite", "zm_aat_kill_o_watt", "zm_aat_plasmatic_burst", "zm_aat_brain_decay"));
        RandomAATCurrent = RandomAAT[0];

        self thread aat::acquire(weapon, RandomAATCurrent);
        self zm_pap_util::repack_weapon(weapon, 4);
        return;
    }

    self TakeWeapon(weapon);
    self zm_weapons::weapon_give(self zm_weapons::get_upgrade_weapon(weapon, zm_weapons::weapon_supports_aat(weapon)));
}

ZombieVars() 
{
    //level endon(#"end_game", #"game_ended");

    /*
    ##################################
              Level Vars
    ##################################
    */

    // no saving stats (not even main quest)
    level.zm_disable_recording_stats = 1;

    level flagsys::wait_till(#"zombie_vars_init");
    
    level.var_2f57e2d2 = &WeaponsCheck; // multiple wonder weapons from box
    level.chest_min_move_usage = 255;
    level.custom_magic_box_selection_logic = &WonderBoxs;
    level.var_977f68ea = &Return1; // powerups delay remove

    level.player_out_of_playable_area_monitor = 0; // no laughs please
    level.zombie_anim_intro = 0;
    level.zombie_round_start_delay = 0;
    level notify(#"stop_player_out_of_playable_area_monitor");
    level.player_starting_points = 6969;
    level.zombie_ai_limit = 550;
    level.zombie_actor_limit = 550;

    switch (level.players.size)
    {
        case 1:
        level.zombie_vars["zombie_spawn_delay"] = 0.001; // zombies delay remove 0.001
        level.zombie_vars["zombie_between_round_time"] = 3; // 3
        level.zombie_vars["zombie_max_ai"] = 550;
        level.zombie_vars["zombie_ai_per_player"] = 550;

        case 2:
        case 3:
        case 4:
        level.zombie_vars["zombie_spawn_delay"] = 0.00001; // zombies delay remove 0.001
        level.zombie_vars["zombie_between_round_time"] = 1; // 3
        level.zombie_vars["zombie_max_ai"] = 950;
        level.zombie_vars["zombie_ai_per_player"] = 950;
    }

    level.disable_nuke_delay_spawning = 1;
    level.var_a1feaa28 = 3; // hero weapon charge
    level.var_43fb4347 = "super_sprint";
    
    level.var_77805e8 = &GameOverFunctions; // game over

    zombie_utility::set_zombie_var(#"zombie_spawn_delay", 0);
    zombie_utility::set_zombie_var(#"below_world_check", -8000);
    zombie_utility::set_zombie_var(#"zombie_intermission_time", 9); // game over
    zombie_utility::set_zombie_var(#"zombie_score_kill", 160);
    zombie_utility::set_zombie_var(#"zombie_score_bonus_melee", 90);
    zombie_utility::set_zombie_var(#"zombie_score_bonus_head", 50);
    zombie_utility::set_zombie_var(#"zombie_drop_item", 0);
    zombie_utility::set_zombie_var(#"zombie_timer_offset", 800);
    zombie_utility::set_zombie_var(#"zombie_timer_offset_interval", 30);
    zombie_utility::set_zombie_var(#"zombie_spawn_delay", 0.001);
    zombie_utility::set_zombie_var(#"zombie_between_round_time", 3);
    zombie_utility::set_zombie_var(#"zombie_max_ai", 550);

    switch(level.gamedifficulty)
    {
        case 0: // Casual
        zombie_utility::set_zombie_var(#"player_base_health", 269);
        level.CasualDif = true;
        break;

        case 1: // Normal
        zombie_utility::set_zombie_var(#"player_base_health", 169);
        level.NormalDif = true;
        break;
    
        case 2: // Hardcore
        zombie_utility::set_zombie_var(#"player_base_health", 159);
        level.HardcoreDif = true;
        break;

        case 3: // Realistic
        zombie_utility::set_zombie_var(#"player_base_health", 1);
        level.RealisticDif = true;
        break;
    }

    level flag::wait_till("initial_blackscreen_passed");
    
    level.magicbox_should_upgrade_weapon_override = &WeaponsBox; // upgraded box weapons // zebra crash
    foreach(chest in level.chests) chest._box_opened_by_fire_sale = undefined;
    if (level.RealisticDif) return;
}

CustomGameoverMusic()
{
    music_random = array("orange_death", "office_death", "white_death", "zodt8_death", "mansion_death", "towers_death", "red_death", "escape_death");
    music_random_play = array::randomize(music_random);

    music::setmusicstate(music_random_play[0]);

    ShieldLog("^4Played Stop Music -> " + music_random_play[0]);
    
    level waittill(#"end_game");

    // again...

    music_random_play = array::randomize(music_random);

    music::setmusicstate(music_random_play[0]);

    ShieldLog("^4Played End Music -> " + music_random_play[0]);
}

Return1(e_powerup) // delay timeout
{
    return 1;
}

PowerVac()
{
    //level endon(#"end_game", #"game_ended");

    #ifdef _SUPPORTS_DETOURS
    return;
    #endif

    while(true) // used for power vac/gift (might break other Timed Only exlixirs!!) + (without detours for base game)
    {
        self.bgb = "zm_bgb_power_vacuum";
        wait 0.5;
    }
}

FrontendMain() // frontend stuff here
{
    iPrintLn("gsc side in frontend..");
}

TestFunction2()
{
    LUINotifyEvent(#"rush_boss", 1, 0);
    LUINotifyEvent(#"rush_boss_health", 4, 1, 1, 1, 1);
    LUINotifyEvent(#"rush_boss_phase", 1, 0);
    LUINotifyEvent(#"rush_boss_wipes", 1, 3);
    LUINotifyEvent(#"rush_boss_line", 1, 1);
    LUINotifyEvent(#"rush_boss_line_2", 1, 0);
    LUINotifyEvent(#"rush_boss_health_bar", 1, 3);
    LUINotifyEvent(#"rush_boss_health_bar_l", 1, 3);
    LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 1);
    LUINotifyEvent(#"rush_boss_box", 1, 1);
}

RotateAndBobItem(bobbingTime = 3.5, bobbingHeightMin = 6, bobbingHeightMax = 9, rotateSpeedMin = 5.5, rotateSpeedMax = 7.5)
{
    self endon("death");

    self bobbing((0,0,1), bobbingTime, RandomIntRange(bobbingHeightMin, bobbingHeightMax));

    while(true)
    {
        rotationSpeed = RandomFloatRange(rotateSpeedMin, rotateSpeedMax);
        self RotateYaw(360, rotationSpeed);
        wait rotationSpeed;
    }
}

SpawnJumpPad(model, origin, angles, force, forceVolY, forceVolX) // still in testing < completed hopefully
{
    //level endon(#"end_game");

    Duckie = util::spawn_model(model, origin, angles);
    Duckie thread RotateInfFast();
    FMoving = false;

    Duckie endon(#"death");
    while(true)
    {
        foreach (player in util::get_active_players())
        {
            if(player IsTouching(Duckie))
            {
                //player iPrintLnBold("^1Jump Tested");
                
                angles = player getplayerangles();
                direction = anglesToForward(angles) * forceVolX;

                player setOrigin(player.origin + force);
                player SetVelocity((player GetVelocity()[0], player GetVelocity()[1], player GetVelocity()[2]) + forceVolY + direction);
                Earthquake(0.22, .9, player.origin, 850);
                player playsound(#"zmb_sq_souls_impact");
                
                if(!FMoving)
                {
                    FMoving = true;
                    Duckie moveZ(30, 0.5);
                    Duckie waittill(#"movedone");
                    Duckie moveZ(-30, 0.5);
                    Duckie waittill(#"movedone");
                    FMoving = false;
                }
            }
        }
        wait 0.1;
    }
}

RotateInf()
{
    self endon(#"death");

    while(true)
    {
        self rotateroll(360, 20);
        self waittill(#"rotatedone");
    }
}

RotateInfFast()
{
    self endon(#"death");

    while(true)
    {
        self rotateroll(360, 10);
        self waittill(#"rotatedone");
    }
}

GetXPMultiplier() 
{
    n_multiplier = zombie_utility::function_d2dfacfd(#"hash_1ab42b4d7db4cb3c");
    if (zm_utility::is_standard()) 
    {
        switch (level.players.size) 
        {
        case 1:
            n_multiplier = n_multiplier * 0.55;
            break;
        case 2:
            n_multiplier = n_multiplier * 0.75;
            break;
        case 3:
            n_multiplier = n_multiplier * 0.9;
            break;
        case 4:
            n_multiplier = n_multiplier * 1.1;
            break;
        }
    } 
    else 
    {
        switch (level.players.size) 
        {
        case 1:
            n_multiplier = n_multiplier * 0.63;
            break;
        case 2:
            n_multiplier = n_multiplier * 0.75;
            break;
        case 3:
            n_multiplier = n_multiplier * 0.8;
            break;
        case 4:
            n_multiplier = n_multiplier * 0.95;
            break;
        }
    }
    return n_multiplier;
}

SelfVars()
{
    self endon(#"disconnect", #"death");
    //level endon(#"end_game", #"game_ended");

    // shield durability
    self.var_9c2026aa = 0.45;
}

ForceBoxes() // thanks to "Jek"!!!
{
    switch(BO4GetMap())
    {
        case "Tag":
        level.forcethisweapon = #"ww_tesla_sniper_t8";
        level.customrandomweaponweights = &forceweapon;
        break;

        case "Voyage":
        level.forcethisweapon = #"ww_tricannon_earth_t8";
        level.customrandomweaponweights = &forceweapon;
        break;

        case "IX":
        level.forcethisweapon = #"ww_crossbow_charged_t8";
        level.customrandomweaponweights = &forceweapon;
        break;

        case "Dead":
        level.forcethisweapon = #"hash_138f002bb30be9a2";
        level.customrandomweaponweights = &forceweapon;
        break;
    }
}

forceweapon(a_keys)
{
    level.customrandomweaponweights = undefined;
    arrayinsert(a_keys, getweapon(level.forcethisweapon), 0);
    return a_keys;
}

NotifyRoundEnd(player) // good one 
{
    level notify(#"end_of_round");
    level notify(#"kill_round");
    level flag::clear("round_active");
    level flag::set("round_reset");
    level flag::set("round_active");
    level notify(#"between_round_over");
    level notify(#"start_of_round");
    level notify(#"zombie_total_set");
    level flag::set("start_zombie_round_logic");
    level.round_number++; // for VOD and AO
    dick = world.roundnumber ^ 115;
    dick++;
    world.roundnumber = dick ^ 115; // ^^
    /#
    zm_round_spawning = @zm_round_spawning<scripts\zm_common\zm_round_logic.gsc>::zm_round_spawning; // skip 

    if (!isdefined(zm_round_spawning))
    {
            self iPrintLnBold("^1Can't find function_ca3759b1! ");
            return;
    }
    level thread [[ zm_round_spawning ]](1);
    #/
}

AddZombies()
{
    level.zombie_total = 15000;
}

WeaponsBox(player, Weapon)
{
    if (!zm_weapons::can_upgrade_weapon(Weapon))
    {
        return 0;
    }

    if (!zm_weapons::is_wonder_weapon(Weapon))
    {
        return 0;
    }

    return 1;
}

WeaponsCheck(e_player)
{
    return 1;
}

WonderBoxs(Weapon, player)
{
    return 1;
}

BoxCheck()
{
    return 0;
}

KillAllZombiesChecks(player) // taken from nuke, but changed it a little
{
    level.zombie_total = 0;

    zombies = getaiteamarray(level.zombie_team);
    zombies_nuked = [];
    for (i = 0; i < zombies.size; i++) 
    {
        /#
        if (isdefined(zombies[i].ignore_nuke) && zombies[i].ignore_nuke) 
            continue;
        #/
        
        if (isdefined(zombies[i].marked_for_death) && zombies[i].marked_for_death) 
            continue;

        /#
        if (isdefined(zombies[i].b_ignore_cleanup) && zombies[i].b_ignore_cleanup) // breaks IX, removed
            continue;
        #/

        if (isdefined(zombies[i].disable_flame_fx) && zombies[i].disable_flame_fx) // ghost
            continue;

        if (isdefined(zombies[i].var_238b3806) && zombies[i].var_238b3806) // ghost
            continue;

        if (isdefined(zombies[i].ignore_enemy_count) && zombies[i].ignore_enemy_count) // for ix puzzle step
            continue;

        if (isdefined(zombies[i].ignore_round_spawn_failsafe) && zombies[i].ignore_round_spawn_failsafe)
            continue;

        if (zm_utility::is_magic_bullet_shield_enabled(zombies[i])) 
            continue;

        if (isDefined(zombies[i])) 
            zombies[i] DoDamage(zombies[i].health + 99, zombies[i].origin);
    }
}

KillEverything(player) // taken from nuke, but changed it a little
{
    level.zombie_total = 0;

    zombies = getaiteamarray(level.zombie_team);
    zombies_nuked = [];
    for (i = 0; i < zombies.size; i++) 
    {
        /#
        if (isdefined(zombies[i].ignore_nuke) && zombies[i].ignore_nuke) 
            continue;
        #/

        if (isdefined(zombies[i].marked_for_death) && zombies[i].marked_for_death) 
            continue;
        
        /#
        if (isdefined(zombies[i].b_ignore_cleanup) && zombies[i].b_ignore_cleanup) // breaks IX, removed
        {
            continue;
        }
        #/
        if (isdefined(zombies[i].disable_flame_fx) && zombies[i].disable_flame_fx) // ghost
            continue;
        
        if (isdefined(zombies[i].var_238b3806) && zombies[i].var_238b3806) // ghost
            continue;
        
        if (isdefined(zombies[i].ignore_enemy_count) && zombies[i].ignore_enemy_count) // for ix puzzle step
            continue;
        
        if (isdefined(zombies[i].ignore_round_spawn_failsafe) && zombies[i].ignore_round_spawn_failsafe)
            continue;
        
        if (zm_utility::is_magic_bullet_shield_enabled(zombies[i])) 
            continue;

        zombies[i].ai.var_126d7bef = 1;
        zombies[i].ignore_round_spawn_failsafe = 1;
        zombies[i].b_ignore_cleanup = 1;
        zombies[i].ignore_enemy_count = 1;
        zombies[i].exclude_cleanup_adding_to_total = 1;
        /#
        zombies[i] clientfield::set("zm_nuked", 1);
        zombies[i] zombie_utility::set_zombie_run_cycle_override_value("walk");
        #/
    }

    if(BO4GetMap() == "Dead")
        {
            for(a=0;a<3;a++) 
            {
                wolf = getaiarchetypearray(#"werewolf");

                for(z=0;z<wolf.size;z++)
                {
                    if(isDefined(wolf[z]) && IsAlive(wolf[z]))
                    wolf[z] DoDamage(wolf[z].health + 99, wolf[z].origin);
                }
            }
        }
}

SendRocket(weapon_name, Object, AOrigin, ObjectDest) // thanks to ate for this || self for killing the zombies
{
    tank_turret = getweapon(hash(weapon_name));
    if (!isdefined(tank_turret)) 
    {
        return;

    } 
    else 
    {
        rocket = magicbullet(tank_turret, Object.origin + AOrigin, ObjectDest.origin, self);
        if (!isdefined(rocket)) 
        {
            return;
        }
        return rocket;
    }
}

SpecialZombie()
{
    if (
    self.archetype === #"zombie_electric" || self.archetype === #"werewolf" || self.archetype === #"stoker"
    || self.archetype === #"catalyst" || self.archetype === #"brutus" || self.archetype === #"gladiator" || self.archetype === #"mannequin"
    || self.archetype === #"nosferatu" || self.archetype === #"bat")
    {
        return true;
    }

    return false;
}

BotStuff()
{
    bot_action::register_bulletweapon(#"ww_blundergat_t8");
    bot_action::register_bulletweapon(#"ww_blundergat_fire_t8");
    bot_action::register_bulletweapon(#"ww_blundergat_acid_t8");
    bot_action::register_bulletweapon(#"launcher_standard_t8_upgraded");
    bot_action::register_bulletweapon(#"smg_fastfire_t8_upgraded");
}

BotControl()
{
    self endon(#"disconnect", #"death");
    //level endon(#"end_game", #"game_ended");

    wait 3;
    GiveClientWeapon("smg_fastfire_t8", self); // added support
    while(true) // free armor for ai
    {
        self.armor = 100;
        wait(randomFloatRange(60, 120));
    }
}

TalkingTest()
{
    // VO
    self thread zm_vo::function_a2bd5a0c(#"hash_c393cb786feb084", 0, 0, 9999, 1);
}

SetRandomOrigin(origin, angles) // used to avoid death barriers
{
    self endon(#"disconnect");
    //level endon(#"end_game", #"game_ended");
    EntNumber = self getentitynumber();

    switch(EntNumber)
    {
        case 0:
        RandomOrigin = origin + (50, 0, 0);
        break;
        case 1:
        RandomOrigin = origin + (-50, 0, 0);
        break;
        case 2:
        RandomOrigin = origin + (0, 50, 0);
        break;
        case 3:
        RandomOrigin = origin + (0, -50, 0);
        break;
    }

    self setorigin(RandomOrigin);

    if(isdefined(angles))
    {
        self setPlayerAngles(angles);
    }
}

GearUp(player) // reworked for ai
{
    GiveInstantElixir("zm_bgb_shields_up");
    wait 0.5;
    GiveInstantElixir("zm_bgb_perkaholic");
}

LinkToStuff()
{
    self endon(#"disconnect", #"death");

    self enablelinkto();
    NukePlayer = util::spawn_model("p7_zm_power_up_nuke", self.origin + (0, 0, 0));
    NukePlayer SetScale(2);
    NukePlayer enablelinkto();
    NukePlayer linkto(self, "j_neck", (100, -30, 0), (0, 0, 0));
    NukePlayer notSolid();
    NukePlayer thread DeleteLogicLink();
    self.Nukie = NukePlayer;

    DuckPlayer = util::spawn_model("p8_zm_red_floatie_duck", self.origin + (0, 0, 0));
    DuckPlayer SetScale(0.6);
    DuckPlayer enablelinkto();
    DuckPlayer linkto(self, "j_spinelower", (0, 0, 0), (0, 0, 30));
    DuckPlayer notSolid();
    DuckPlayer thread DeleteLogicLink();
    self.Duckie = DuckPlayer;

    /#
    // callback delete logic doesn't work
    while(true)
    {
        self.Duckie waittill(#"forever");
    }
    #/
}

DeleteLogicLink()
{
    self endon(#"death");

    while(true)
    {
        if(isdefined(self))
        {
            Linked = self GetLinkedEnt();
            if(!isdefined(Linked)) self delete();
            wait 5;
        }
        else
        {
            iPrintLnBold("undefined player");
            break;
        }
    }
}

BrutusSpecialDuck()
{
    self enablelinkto();
    NukePlayer = util::spawn_model("p7_zm_power_up_nuke", self.origin + (0, 0, 0));
    NukePlayer SetScale(3);
    NukePlayer enablelinkto();
    NukePlayer linkto(self, "j_neck", (200, -30, 0), (0, 0, 0));
    NukePlayer notSolid();

    DuckPlayer = util::spawn_model("p8_zm_red_floatie_duck", self.origin + (0, 0, 0));
    DuckPlayer enablelinkto();
    DuckPlayer linkto(self, "j_spinelower", (0, 0, 0), (0, 0, 30));
    DuckPlayer notSolid();

    if(isdefined(self.dontchange)) return;
    self setmodel(#"c_t8_zmb_mob_ghoul_body1");
    if (isdefined(self.head))
    {
        self detach(self.head, "");
    }
    if (isdefined(self.hatmodel))
    {
        self detach(self.hatmodel, "");
    }
    self attach("c_t8_zmb_hero_scarlett_head1_cst", "");
    self attach("c_t8_zmb_hero_scarlett_lowerbody1_cst", "");
    self.dontchange = true;

    self waittill(#"death");
    NukePlayer delete();
    DuckPlayer delete();
}

SpawnModelTree()
{
    self enablelinkto();

    Widows = util::spawn_model("p7_zm_power_up_max_ammo", self.origin + (0, 0, 100));
    Widows SetScale(50);
    Widows enablelinkto();
    Widows linkto(self);
    Widows notSolid();
}

ObjectSpecialDuck()
{
    self enablelinkto();

    DuckPlayer = util::spawn_model("p8_zm_red_floatie_duck", self.origin + (0, 0, 0), (0, 0, 30));
    DuckPlayer SetScale(1.5);
    DuckPlayer enablelinkto();
    DuckPlayer linkto(self);
    DuckPlayer notSolid();

    Widows = util::spawn_model("p7_zm_vending_widows_wine", self.origin + (0, 0, 0));
    Widows SetScale(1);
    Widows enablelinkto();
    Widows linkto(self);
    Widows notSolid();
}

MaxZombies(max, n_round)
{
    max = 550;
    return max;
}

BO4GetMap()
{
    if(level.script == "zm_towers") return "IX";//
    else if(level.script == "zm_escape") return "Blood";//
    else if(level.script == "zm_red") return "AE";//
    else if(level.script == "zm_white") return "AO";//
    else if(level.script == "zm_mansion") return "Dead";//
    else if(level.script == "zm_orange") return "Tag";
    else if(level.script == "zm_office") return "Classified";//
    else if(level.script == "zm_zodt8") return "Voyage";//
}

BO4ChaosMap()
{
    if(level.script == "zm_towers") return true;
    else if(level.script == "zm_red") return true;
    else if(level.script == "zm_mansion") return true;
    else if(level.script == "zm_zodt8") return true;

    return false;
}

BO4AetherMap()
{
    if(level.script == "zm_escape") return true;
    else if(level.script == "zm_white") return true;
    else if(level.script == "zm_orange") return true;
    else if(level.script == "zm_office") return true;

    return false;
}

bo4_AddBotsToGame() 
{
    bvot = bot::add_bot(util::get_active_players()[0].team, "Rush Mod Bot", "Quak");
}

BotRemove()
{
    level thread bot::remove_bots(util::get_active_players()[0].team);
}

RandomGun()
{
    self endon(#"disconnect", #"death");
    //level endon(#"end_game", #"game_ended");

    if (IsBot(self)) // bots do glitch out sometimes..
    {
        return;
    }
    self takeallweapons();

    // random starting weapon
    weap = array::randomize(array("pistol_revolver_t8_upgraded", "pistol_burst_t8_upgraded", "ar_mg1909_t8_upgraded", "shotgun_pump_t8_upgraded", "ar_stealth_t8_upgraded", 
    "smg_fastfire_t8_upgraded", "lmg_standard_t8_upgraded", "smg_capacity_t8_upgraded", "smg_accurate_t8_upgraded", "smg_drum_pistol_t8_upgraded"));
    weapon = getweapon(weap[0]);
    self zm_weapons::weapon_give(weapon);

    self thread RandomHeroWeapon();

    wait 0.1;

    // random grenade
    grenades = array("claymore", "mini_turret", "eq_acid_bomb", "eq_wraith_fire", "eq_frag_grenade");

    if (BO4GetMap() != "Blood")
    {
        arrayinsert(grenades, "homunculus", 4);
    }

    if (BO4AetherMap())
    {
        arrayinsert(grenades, "cymbal_monkey", 4);
    }

    randomgernades = array::randomize(grenades);
    grenade = getweapon(randomgernades[0]);
    self zm_weapons::weapon_give(grenade);

    wait 0.1;

    GiveClientWeapon("bowie_knife", self);

    /#
    keys = GetArrayKeys(level.zombie_weapons_upgraded);
    weaps = array::randomize(keys);
    self zm_weapons::weapon_give(weaps[0]);
    #/
}

GiveHeroWeapon(weapon)
{
    hero_weapon = getweapon(weapon);
    self zm_hero_weapon::hero_give_weapon(hero_weapon, 0);
}

PrintGunAngles()
{
    Angles = self GetGunAngles();
    iPrintLnBold("^7 Gun Angles: "+ Angles);
}

RandomHeroWeapon()
{
    self endon(#"disconnect", #"death");
    //level endon(#"end_game", #"game_ended");

    switch(BO4GetMap()) // depending on maps, some hero weapons won't load
    {
        case "IX":
        case "Dead":
        case "Voyage":
        case "AE":
        while(true)
        {
            // spcialist weapon
            special = array::randomize(array(

            "hero_sword_pistol_lv1", "hero_sword_pistol_lv2", "hero_sword_pistol_lv3", 
            "hero_chakram_lv1", "hero_chakram_lv2", "hero_chakram_lv3",
            "hero_scepter_lv1", "hero_scepter_lv2",  "hero_scepter_lv3", 
            "hero_hammer_lv1", "hero_hammer_lv2", "hero_hammer_lv3"));

            special1 = getweapon(special[0]);

            CurrentWeapon = self GetCurrentWeapon();
            
            if (!zm_loadout::is_hero_weapon(CurrentWeapon))
            {
                self zm_hero_weapon::hero_give_weapon(special1, 0);
            }
            
            wait 45;
        }
        break;
        
        case "Classified":
        case "AO":
        case "Tag":
        while(true)
        {
            // spcialist weapon
            special = array::randomize(array(

            "hero_sword_pistol_lv1", "hero_sword_pistol_lv2", "hero_sword_pistol_lv3", 
            "hero_chakram_lv1", "hero_chakram_lv2", "hero_chakram_lv3",
            "hero_scepter_lv1", "hero_scepter_lv2",  "hero_scepter_lv3", 
            "hero_hammer_lv1", "hero_hammer_lv2", "hero_hammer_lv3", 
            "hero_flamethrower_t8_lv1", "hero_flamethrower_t8_lv2", "hero_flamethrower_t8_lv3", 
            "hero_gravityspikes_t8_lv1", "hero_gravityspikes_t8_lv2", "hero_gravityspikes_t8_lv3", 
            "hero_katana_t8_lv1", "hero_katana_t8_lv2", "hero_katana_t8_lv3", 
            "hero_minigun_t8_lv1", "hero_minigun_t8_lv2", "hero_minigun_t8_lv3"));

            special1 = getweapon(special[0]);

            CurrentWeapon = self GetCurrentWeapon();
            
            if (!zm_loadout::is_hero_weapon(CurrentWeapon))
            {
                self zm_hero_weapon::hero_give_weapon(special1, 0);
            }
            
            wait 45;
        }
        break;

        case "Blood":
        while(true)
        {
            // spcialist weapon
            special = array::randomize(array(

            "hero_flamethrower_t8_lv1", "hero_flamethrower_t8_lv2", "hero_flamethrower_t8_lv3", 
            "hero_gravityspikes_t8_lv1", "hero_gravityspikes_t8_lv2", "hero_gravityspikes_t8_lv3", 
            "hero_katana_t8_lv1", "hero_katana_t8_lv2", "hero_katana_t8_lv3", 
            "hero_minigun_t8_lv1", "hero_minigun_t8_lv2", "hero_minigun_t8_lv3"));

            special1 = getweapon(special[0]);

            CurrentWeapon = self GetCurrentWeapon();
            
            if (!zm_loadout::is_hero_weapon(CurrentWeapon))
            {
                self zm_hero_weapon::hero_give_weapon(special1, 0);
            }
            
            wait 45;
        }
        break;
    }
}

ItemsAutoPickUP()
{
    //level endon(#"end_game", #"game_ended");

    player = GetPlayers()[0]; // get host
    a_items = getitemarray();

    foreach (e_item in a_items)
    {
        if (isdefined(e_item.item))
        {
            util::spawn_model("p8_zm_red_floatie_duck", e_item.origin + (0, 0, 0));
            e_item SetInvisibleToAll();
            zm_items::player_pick_up(player, e_item.item);
        }
    }
}

FloatingZombiesGravity()
{
    setDvar("phys_gravity", 50);
}

PowerUpsReset() // infinite power ups i guess (taken from power vacuum)
{
    //level endon(#"end_game", #"game_ended");

    while(true)
	{
		level waittill(#"powerup_dropped");
		level.powerup_drop_count = 0;
        wait 1;
	}
}

end_game()
{
	level notify(#"end_game");
}

StopEndGame(b_bool = false) // Rework -> Detour Every Gameover from MainQuest/BossFight Scripts.....
{
    thread BotRemove();

    if(b_bool) level thread BossFightReturnLogic();
    wait 2;

    if(BO4GetMap() == "Tag") 
     level thread lui::screen_flash(0.4, 2, 0.5, 1, "white"); // fix too long white screen flash
     
    level flag::set("spawn_zombies");
    level flag::set("zombie_drop_powerups");

    foreach(player in level.players) 
     player iPrintLnBold("^8 Rush Mode has been Fully Completed!, You can now End The Game if you want or Continue Playing Endless Rounds! ");
    
    level thread CustomGameoverMusic();

    foreach(player in level.players)
    {
        if(isdefined(player))
        {
            // vals
            player val::reset(#"end_game", "ignoreme");
            player val::reset(#"outro", "takedamage");
            player val::reset(#"outro", "ignoreme");
            player val::reset(#"outro_igc", "freezecontrols");
            player val::reset(#"outro", "freezecontrols");
            player val::reset("game_over_man", "takedamage"); // fuck this bs -> zm_red

            // other things
            player disableInvulnerability();
            player thread StopFreeze(player);
            player EnableWeaponFire();
        }
    }
    
    wait 5;
    ResetBossFightVars();

    wait 3;
    if(BO4GetMap() == "Voyage" || BO4GetMap() == "Dead" || BO4GetMap() == "AO") // needed
     KillAllZombies();
}

BossFightReturnLogic() // godmode problem botd fix needed
{
    //level endon(#"end_game", #"game_ended");

    switch(BO4GetMap())
    {
        case "IX": 
        level thread Spawn_BossRushTrigger((-3430, -1.5, 0), "shield/goback", (0, 90, 0),#"p7_zm_vending_sleight", &AfterCutsceneSetUp);
        break;
    
        case "Blood":
        level thread Spawn_BossRushTrigger((10217, 10895, 451), "shield/goback", (0, 0, 0),#"p7_zm_vending_sleight", &ReturnBlood);
        break;

        case "AE":
        level thread Spawn_BossRushTrigger((20348, 22706, 982), "shield/goback", (0, 180, 0),#"p7_zm_vending_sleight", &AfterCutsceneSetUp);

        // oracle back
        Oracle = level.var_bb7822b7;
        foreach(Orc in Oracle) Orc Show();
        break;
        
        case "Tag":
        sam_spawner = getent("mq_gehen_s", "targetname");
        level thread Spawn_BossRushTrigger(sam_spawner.origin + (3000, -50, 0), "shield/goback", (0, 90, 0),#"p7_zm_vending_sleight", &AfterCutsceneSetUp);
        
        wait 30;
        //foreach(player in level.players) player iPrintLnBold("^8 Rush Mode has been Fully Completed!, You can now End The Game if you want or Continue Playing Endless Rounds! ");
        break;
    }

    // no need for voyage and other maps
}

ReturnBlood()
{
    level notify(#"RushBossPicked");
    mdl_door = getent("c29_door", "targetname");
    playsoundatposition("zmb_c29_door_open", mdl_door.origin);
    mdl_door movez(96, 1.6);
    
    level thread lui::screen_flash(0.4, 2, 0.5, 1, "white");
    wait 1.5;
    foreach(player in level.players) player SetRandomOrigin((10217, 11087, 451));
    wait 0.5;

    mdl_door = getent("c29_door", "targetname");
    playsoundatposition("zmb_c29_door_open", mdl_door.origin);
    mdl_door movez(-96, 1.6);

    wait 3;
    KillAllZombies();
    level flag::set(#"spawn_zombies");

    foreach(player in level.players) player disableInvulnerability();
}

ResetBossFightVars() // should work for ALL maps...
{
    powerup_keys = getarraykeys(level.zombie_powerups);
    for (powerup_key_index = 0; powerup_key_index < powerup_keys.size; powerup_key_index++) 
    {
        if (isdefined(level.zombie_powerups[powerup_keys[powerup_key_index]].client_field_name)) 
        {
            powerup_name = powerup_keys[powerup_key_index];
            level thread ShouldDropPowerUp(powerup_name);
        }
    }
    // some ones
    level thread ShouldDropPowerUp("free_perk");
    level thread ShouldDropPowerUp("zombie_blood");
    level thread ShouldDropPowerUp("bonus_points_player");
    level thread ShouldDropPowerUp("small_ammo");
    level thread ShouldDropPowerUp("minigun");
    level thread ShouldDropPowerUp("bonfire_sale");

    zm_bgb_anywhere_but_here::function_886fce8f(1);

    foreach (e_player in util::get_active_players()) 
    {
        e_player freezecontrols(0);
        e_player.var_16735873 = undefined;
        
        e_player notify("1306ae5632c8627a");
        e_player notify("4fe6867b112381d6");
    }

    level.custom_spawnplayer = undefined;
    level.var_c9f5947d = undefined; // vod cata
    level.var_eeb98313 = undefined;
    level.var_e120ae98 = undefined;
    level.var_5d1805c4 = undefined;
    level.zombie_ai_limit = 500;
    level.var_d6f059f7 = 255;
    level.var_b2b15659 = 0; // zm_vo
    level.powerup_vo_available = undefined;
    level.var_ea32773 = undefined;

    // AE FIX
    level.var_6f6cc58 = undefined;
    level.var_4e4950d1 = undefined;

    // AO
    if(BO4ChaosMap())
     level.zmannouncerprefix = "prst";
    else
    {
        switch(BO4GetMap())
        {
            case "Blood":
            level.zmannouncerprefix = "ward";
            break;

            case "AO":
            level.zmannouncerprefix = "avoa";
            break;
        }
    }

    zombie_utility::set_zombie_var(#"zombie_powerup_fire_sale_on", 1); // inf fire sale, intended bug as always
    zombie_utility::set_zombie_var(#"zombie_powerup_drop_max_per_round", 999);

    level flag::clear(#"infinite_round_spawning");
    level flag::clear(#"pause_round_timeout");
    if(BO4GetMap() == "AO") level flag::clear("world_is_paused");

    LUINotifyEvent(#"rush_quest_detect", 1, 0);
}

StopFreeze(player) // done with noclip
{
    player endon("disconnect");
    
    player DisableWeapons();
    player DisableOffHandWeapons();
    player.nocliplinker = spawnSM(player.origin, "tag_origin");
    player PlayerLinkTo(player.nocliplinker, "tag_origin");

    wait 0.01;
    player Unlink();
    player.nocliplinker delete();
    player EnableWeapons();
    player EnableOffHandWeapons();
}

InventoryUIChange()
{
    //level endon(#"end_game", #"game_ended");

    while(true)
    {
        level zm_ui_inventory::function_7df6bb60(#"zm_zodt8_sentinel_artifact", 0);
        wait 0.3;
        level zm_ui_inventory::function_7df6bb60(#"zm_zodt8_sentinel_artifact", 1);
        wait 0.3;
    }
}

UnFreeze()
{
    self endon(#"disconnect");
    //level endon(#"end_game", #"game_ended");

    while(true)
    {
        self val::reset(#"game_end", "freezecontrols");
        self val::reset(#"game_end", "disablegadgets");
        self val::reset(#"initial_black", "freezecontrols");
        self val::reset(#"initial_black", "hide");
        wait 2;
    }
}

AddObjective(b_on = 1, icon = #"hash_228d7ebefd8c2600") 
{
    if (isdefined(b_on) && b_on) 
    {
        self.objective_id = gameobjects::get_next_obj_id();
        objective_add(self.objective_id, "active", self.origin + (0, 0, 50), icon);
        function_da7940a3(self.objective_id, 1);
    }
    else 
    {
        gameobjects::release_obj_id(self.objective_id);
        objective_delete(self.objective_id);
        self.objective_id = undefined;
    }
}

// ok this is too many params looool
AddLinkedObjective(b_on = 1, model, icon = #"hash_228d7ebefd8c2600", varalt = false, customflag = undefined, delay = undefined, customflaglevel = undefined) 
{
    self endon(#"death"); // for that delay...

    if(isDefined(delay)) // mostly for botd orbs
     wait delay;
     
    if (isdefined(b_on) && b_on) 
    {
        if(!varalt)
        {
            self.objective_id = gameobjects::get_next_obj_id();
            if (Objective_State(self.objective_id) == "empty") 
            {
                //ShieldLog("Registering Objective ID: " + self.objective_id);
                Objective_Add(self.objective_id, "active", self, icon);
            }
            else
            {
                //ShieldLog("Re-configuring Objective ID: " + self.objective_id);
                Objective_OnEntity(self.objective_id, self);
                Objective_SetState(self.objective_id, "active");
            }
            objective_add(self.objective_id, "active", model, icon);
            function_da7940a3(self.objective_id, 1);

            if(!isDefined(customflag) && !isDefined(customflaglevel)) 
             self thread CheckDeathObjective(); // gotta thread..
        }
        else
        {
            level.objective_id_alt = gameobjects::get_next_obj_id();
            objective_add(level.objective_id_alt, "active", model, icon);
            function_da7940a3(level.objective_id_alt, 1);
        }
    }
    else 
    {
        gameobjects::release_obj_id(self.objective_id);
        objective_delete(self.objective_id);
        self.objective_id = undefined;
    }

    if(isdefined(b_on) && b_on && isDefined(customflag))
     self thread CheckDeathObjectiveCustom(customflag); // gotta thread..
    
    if(isdefined(b_on) && b_on && isDefined(customflaglevel))
     self thread CheckDeathObjectiveCustomLevel(customflaglevel);
}

CheckDeathObjective()
{
    self waittill(#"death");

    if (IsDefined(self.objective_id)) 
    {
        //ShieldLog("Releasing Objective ID: " + self.objective_id);
        gameobjects::release_obj_id(self.objective_id);
        Objective_SetState(self.objective_id, "invisible");
    }
}

CheckDeathObjectiveCustom(customflag)
{
    self waittill(#"death", customflag);

    if (IsDefined(self.objective_id)) 
    {
        //ShieldLog("Releasing Objective ID: " + self.objective_id);
        gameobjects::release_obj_id(self.objective_id);
        Objective_SetState(self.objective_id, "invisible");
    }
}

CheckDeathObjectiveCustomLevel(customflaglevel)
{
    level waittill(customflaglevel);

    if (IsDefined(self.objective_id)) 
    {
        //ShieldLog("Releasing Objective ID: " + self.objective_id);
        gameobjects::release_obj_id(self.objective_id);
        Objective_SetState(self.objective_id, "invisible");
    }
}


// icons
// hash_179c67d4ccb9f19f - to ?? lake - five
// hash_5cfdced70a5a5948 - use zipline - tag
// hash_410c56f34d7ed87 - zodt8 normal icon (no text)
// hash_228d7ebefd8c2600 - normal icon - Follow
// hash_423a75e2700a53ab - normal icon - No follow
// ............

/#
    // fix later for no more objectives (not deleting and reusing instead), thanks to Scappy
    
    add_new_objective(objective, str_waittill)
    {
        self.n_obj_id = gameobjects::get_next_obj_id();
        if (Objective_State(self.n_obj_id) == "empty") {
            ShieldLog("Registering Objective ID: " + self.n_obj_id);
            Objective_Add(self.n_obj_id, "active", self, objective);
        }
        else {
            ShieldLog("Re-configuring Objective ID: " + self.n_obj_id);
            Objective_OnEntity(self.n_obj_id, self);
            Objective_SetState(self.n_obj_id, "active");
        }
        function_da7940a3(self.n_obj_id, 1);
        self thread release_obj_on_death(str_waittill);
    }
    release_obj_on_death(str_waittill)
    {
        self util::waittill_any_ents(self, "death", level, "release_objs", self, str_waittill);
        if (IsDefined(self.n_obj_id)) {
            ShieldLog("Releasing Objective ID: " + self.n_obj_id);
            gameobjects::release_obj_id(self.n_obj_id);
            Objective_SetState(self.n_obj_id, "invisible");
        }
    }
#/

SystemVarsIgnore(str_name)
{
    level endon(#"StopSystemVarsIgnore");

    /#
    if(!BO4GetMap() == "Blood") 
     return;
    #/
    
    while(true)
    {
        if (isdefined(level.system_funcs) && isdefined(level.system_funcs[str_name])) 
        {
            ShieldLog("^1Test");
            level.system_funcs[str_name].ignore = false;
        }
        
        wait 0.1;
    }
}

SymbolCheckComplete()
{
    self endon(#"death");
    
    level flag::wait_till(#"combo_done");

    gameobjects::release_obj_id(self.objective_id);
    objective_delete(self.objective_id);
}

GetPlanetZone(str_planet_name) // taken from function_c3e929e8, changed names and removed arrays
{
    switch (str_planet_name) 
    {
        case #"sun":
            return "The Forecastle";
        case #"saturn":
            return "The Bridge";
        case #"neptune":
            return "The Aft Decks";
        case #"jupiter":
            return "The Engine Room";
        case #"moon":
            return "The Lower Grand Stairs";
        case #"uranus":
            return "The State Rooms";
        case #"mercury":
            return "The Mail Room";
        case #"mars":
            return "The Boiler Room";
        case #"venus":
            return "The Millionaire Suite Room";
    }

    return " -> i have no idea";
}

GetSparks()
{
    for (i = 0; i < level.a_s_sparks.size; i++)
        level.a_s_sparks[i] AddObjective(true, #"hash_410c56f34d7ed87");

    foreach(player in level.players) 
        player iPrintLn("^2Outlets/Sparks are Highlighted for this Step Only!");

    level flag::wait_till(#"catalyst_encounters_completed");

    for (i = 0; i < level.a_s_sparks.size; i++)
        level.a_s_sparks[i] AddObjective(false);
}

BO4newOrigin(Coords, Location)
{
    if(!isDefined(Location))
        Location = "Undefined";
    self SetOrigin(Coords);
    self S("^6Teleported To "+Location);
}

BO4newOriginNoPrint(Coords)
{
    self SetOrigin(Coords);
}

round_wait_override()
{
	level endon(#"restart_round");
	level endon( #"kill_round" );

	wait( 1 );

	while( 1 )
	{
		if( get_current_zombie_count() <= 0 || level.zombie_total <= 0 )
		{
			return;
		}			
			
		if( flag::get( "end_round_wait" ) )
		{
			return;
		}
		wait( 1.0 );
	}
}

FrostTheShield()
{
    wait 0.1;
    self aat::acquire(getweapon(#"zhield_frost_dw"), "zm_aat_frostbite");
    self zm_pap_util::repack_weapon(getweapon(#"zhield_frost_dw"), 4);
}

moveChest(origin, angles, col, plinth)
{
    if(!isdefined(col))
        col = 1;
    self.origin = origin;
    self.angles = angles;
    self.chest_box = getent( self.script_noteworthy + "_zbarrier", "script_noteworthy" );
    self.chest_box.origin = origin;
    self.chest_box.angles = angles;
    if(isdefined(plinth) && plinth)
    {
        struct::get(self.script_noteworthy + "_plinth", "targetname").origin = origin;
        struct::get(self.script_noteworthy + "_plinth", "targetname").angles = angles;
    }
    position = origin + (0,0,64);
    if(!col) return;
    col = spawn("script_model", position + AnglesToForward(angles)*30);
    col SetModel("collision_geo_32x32x128_standard");
    col.angles = angles;
    col Ghost();
    col = spawn("script_model", position);
    col SetModel("collision_geo_32x32x128_standard");
    col.angles = angles;
    col Ghost();
    col = spawn("script_model", position - AnglesToForward(angles)*30);
    col SetModel("collision_geo_32x32x128_standard");
    col.angles = angles;
    col Ghost();
}

movePerk(origin, angles, col)
{
    if(!isdefined(col))
        col = 1;
    self.origin = origin;
    self.angles = angles;
    if(isdefined(self.target))
    {
        struct::get(self.target, "targetname").origin = origin;
        struct::get(self.target, "targetname").angles = angles;
    }
    if(!col) return;
    col = spawn("script_model", origin + (0,0,64));
    col SetModel("collision_geo_cylinder_32x128_standard");
    col DisconnectPaths();
    col Ghost();
}

movePap(origin, angles, col)
{
    if(!isdefined(col))
        col = 1;
    getEntArray("zm_pack_a_punch", "targetname")[0].origin = origin;
    getEntArray("zm_pack_a_punch", "targetname")[0].angles = angles;
    col = spawn("script_model", origin + (0,0,64));
    col.angles = angles;
    col SetModel("collision_geo_64x64x128_standard");
    col DisconnectPaths();
    col Ghost();
}

power_on()
{
    SetGametypeSetting(#"zmpowerstate", 2);
}

pack_on()
{
    SetGametypeSetting(#"hash_19d48a0d4490b0a2",2);
}

get_current_zombie_count()
{
	enemies = get_round_enemy_array();
	return enemies.size;
}

get_round_enemy_array()
{
	a_ai_enemies = [];
	a_ai_valid_enemies = [];
	a_ai_enemies = getaiteamarray(level.zombie_team);
	for(i = 0; i < a_ai_enemies.size; i++)
	{
		if(isdefined(a_ai_enemies[i].ignore_enemy_count) && a_ai_enemies[i].ignore_enemy_count)
		{
			continue;
		}
		if(!isdefined(a_ai_valid_enemies))
		{
			a_ai_valid_enemies = [];
		}
		else if(!isarray(a_ai_valid_enemies))
		{
			a_ai_valid_enemies = array(a_ai_valid_enemies);
		}
		a_ai_valid_enemies[a_ai_valid_enemies.size] = a_ai_enemies[i];
	}
	return a_ai_valid_enemies;
}

speedupzambs()
{
    level endon(#"end_game");

    level flag::wait_till("all_players_spawned");
    level flag::wait_till("initial_blackscreen_passed");
    level.zombie_vars["zombie_between_round_time"] = 0;
    level.zombie_vars["zombie_spawn_delay"] = 0.1; 
    while(level.round_number <=8)
    {
        foreach(zombie in get_round_enemy_array())
            zombie zombie_utility::set_zombie_run_cycle_override_value("run");
        wait 1;
    }
}

debris_function()
{
    junk = getentarray(self.target, "targetname");
	for(i = 0; i < junk.size; i++)
	{
		if(isdefined(junk[i].script_noteworthy))
		{
			if(junk[i].script_noteworthy == "clip")
			{
				if(junk[i].script_string !== "skip_disconnectpaths")
				{
					junk[i] disconnectpaths();
				}
			}
		}
	}
    while(1)
    {
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        iprintln("Origin: " + self.origin);
        wait 1;
    }
}

door_function(door)
{
    iprintln("Origin: " + door.origin);
    return 1;
}

getboxes()
{
    level flag::wait_till("all_players_spawned");
    level flag::wait_till("initial_blackscreen_passed");
    foreach(chest in level.chests)
    {
        iprintln("" + chest.script_noteworthy);
    }
}

remove_buildables()
{
    foreach(item in getitemarray())
    {
        item.origin = (0,0,-10000);
    }
}

disableGobbles()
{
    //SetGametypeSetting(#"hash_3ab7cedcfef7eacc", 0);
    //SetGametypeSetting(#"hash_5374d50efd1e6b59", 0);
    //SetGametypeSetting(#"hash_5e1f08b8335a0ce0", 0);
    //SetGametypeSetting(#"hash_5746674cbab8264d", 0);
    //SetGametypeSetting(#"hash_7ea1426ffa93f34d", 0);

    SetGametypeSetting(#"hash_6230ef2b089aad7f",0);
}

BO4OriginPrint()
{
    current_origin = self.origin;
    current_angles = self.angles;
    self S("Coords: "+current_origin);
    self S("Angles: "+current_angles);

    thread am_log("origin > " + current_origin);
    thread am_log("angles > " + current_angles);
}

BoxPriceChange()
{
    //level endon(#"end_game", #"game_ended");
    player = GetPlayers()[0];
    while(true)
    {
        if (zombie_utility::function_d2dfacfd(#"zombie_powerup_fire_sale_on") == 1 && player [[ level._zombiemode_check_firesale_loc_valid_func ]]()) 
        {
            set_magixbox_price(350);
        }
        else
        {
            set_magixbox_price(2000);
        }
        wait 0.1;
    }
}

AllWeaponsInBox() // all (new one)
{
    foreach(weapon in level.zombie_weapons)
    {
        weapon.is_in_box = 1;

        if(isdefined(weapon.weapon.isriotshield) && weapon.weapon.isriotshield)
        {
            weapon.is_in_box = 1;
        }
    }

    if(BO4GetMap() == "AE") // just incase if they dont get included in box
    {
        Hand1 = GetWeapon("ww_hand_g");
        Hand2 = GetWeapon("ww_hand_c");
        Hand3 = GetWeapon("ww_hand_h");
        Hand4 = GetWeapon("ww_hand_o");
        Thu = GetWeapon(#"thunderstorm");
        Hand1.is_in_box = 1;
        Hand2.is_in_box = 1;
        Hand3.is_in_box = 1;
        Hand4.is_in_box = 1;
        Thu.is_in_box = 1;
    }
}

WunderwaffeInBoxAndShit()
{
    zm_weapons::include_zombie_weapon(#"hash_13a204ba6887b18f", 1);
    zm_weapons::include_zombie_weapon(#"hash_491ff8e9d1af03a8", 1);

    zm_weapons::include_zombie_weapon(#"homunculus", 1);
    zm_weapons::include_zombie_weapon(#"homunculus_upgraded", 1);
    zm_weapons::include_zombie_weapon(#"cymbal_monkey", 1);

    zm_weapons::add_zombie_weapon(#"hash_13a204ba6887b18f", #"hash_491ff8e9d1af03a8", 0, 0, undefined, undefined, 0, "", "special", 1, undefined, 1);
}

MessageHud()
{
    //level endon(#"end_game", #"game_ended");

    while(!level.PickedOption)
    {
        level.zm_location zm_location::set_location_name(self, #"shield/messagehud");
        wait 0.1;
    }
}

FollowPlayer() 
{
    level endon(#"end_game", #"StopNukeFriend");
    self endon(#"death", "StopFollow");
    level endon(#"StopNukeFriend", #"StopNukie");

    self.FollowPlayer = undefined;
    n_timer = 0;
    self.Follow = 1;

    while(true)
    {
        if (isdefined(self.FollowPlayer) && zm_utility::is_player_valid(self.FollowPlayer) && n_timer < 30) 
        {
            var_2f07de84 = self.FollowPlayer.origin + (randomintrange(60 * -1, 60), randomintrange(60 * -1, 60), 0);
            v_moveto = getclosestpointonnavmesh(var_2f07de84, 64, 16);
            if (isdefined(v_moveto)) 
            {
                v_moveto = v_moveto + vectorscale((0, 0, 1), 46);
                n_dist = distance2dsquared(self.origin, v_moveto);
            }
        } 
        else 
        {
            self.FollowPlayer = self GetClosestValidPlayer(22500);
        }
        if (isdefined(self.Follow) && self.Follow) 
        {
            self bobbing((0, 0, 1), 2, 3);
            self.Follow = 0;
        }
        if (isdefined(n_dist) && n_dist > 22500 * 4.5) 
        {
            self.Follow = 0;
            n_timer = n_timer + 0.25;
        } 
        else if (isdefined(n_dist) && n_dist > 22500) 
        {
            self moveto(v_moveto, 1.35);
            self thread CheckMove();
            n_timer = 0;
        } 
        else 
        {
            self.Follow = 0;
            n_timer = 0;
        }
        n_dist = undefined;
        wait(0.25);
    }

    foreach(player in level.players) player iPrintLnBold("Stopped!");
}

CheckMove() 
{
    self notify("399a1770792ffde7");
    self endon("399a1770792ffde7");
    self endon(#"death");
    self waittill(#"movedone");
    self.Follow = 1;
}

GetClosestValidPlayer(n_range_sq = 9000000) 
{
    a_players = util::get_active_players();
    closest = arraysortclosest(a_players, self.origin);
    foreach (player in closest) 
    {
        v_player = player getcentroid();
        n_dist = distance2dsquared(self.origin, v_player);
        if (zm_utility::is_player_valid(player) && n_dist < n_range_sq * 4.5) 
        {
            return player;
        }
    }
    return undefined;
}

AimTest()
{
	level endon("end_game");

    self thread AimAssist();
}

AimAssist()
{
	level endon("end_game");
	self endon("disconnect");

	for(;;)
	{
		if(self.sessionstate != "spectator")
		{
            if(self hasperk("specialty_deadshot")) // original perk check
                tag = "j_head";
            else
                tag = "j_spine4";

			view_pos = self GetWeaponMuzzlePoint();
			zombies = util::get_array_of_closest(view_pos, getaiarray(level.zombie_team));
			range_squared = 500 * 500;
			for ( i = 0; i < zombies.size; i++ )
			{
				if (!IsDefined(zombies[i]) || !IsAlive(zombies[i]))
				{
					continue;
				}

				enemy_origin = zombies[i].origin;
				test_range_squared = DistanceSquared(view_pos, enemy_origin);
				if (test_range_squared < range_squared)
				{
					if(zombies[i] player_can_see_me(self, tag))
					{
                        if(self adsButtonPressed() && !self IsReloading())
                        {
                            while(self playerADS() > 0 && self playerADS() < 1 && self adsButtonPressed())
                            {
                                if(IsAlive(zombies[i]))
                                {
                                    self setPlayerAngles(vectorToAngles((zombies[i] getTagOrigin(tag)) - (self getEye())));
                                }
                                wait .05;
                            }

                            while(self playerADS() > .9 && self adsButtonPressed())
                            {
                                wait .05;
                            }

                            break;
                        }
					}
				} 
			}
		}

		wait 0.5;
	}
}

player_can_see_me(player, tag)
{
    playerangles = player getplayerangles();
    playerforwardvec = anglesToForward(playerangles);
    playerunitforwardvec = vectornormalize(playerforwardvec);
    banzaipos = self.origin;
    playerpos = player getorigin();
    playertobanzaivec = banzaipos - playerpos;
    playertobanzaiunitvec = vectornormalize(playertobanzaivec);
    forwarddotbanzai = vectordot(playerunitforwardvec, playertobanzaiunitvec);

    if (forwarddotbanzai >= 1)
    {
        anglefromcenter = 0;
    }
    else if (forwarddotbanzai <= -1)
    {
        anglefromcenter = 180;
    }
    else
    {
        anglefromcenter = acos(forwarddotbanzai);
    }

    playerfov = getDvarFloat("cg_fov", 90);
    banzaivsplayerfovbuffer = 0.2;

	distance = self check_distance(player);

	playercanseeme = anglefromcenter <= ((playerfov * distance) * (1 - banzaivsplayerfovbuffer));

	if (IsDefined(self.isOnBus) && self.isOnBus)
		return playercanseeme;

    can_see = BulletTracePassed(player getEye(), self getTagOrigin(tag), false, self);

	if(can_see)
	    return playercanseeme;

    return 0;
}

check_distance(player)
{
	if(distance(self.origin, player.origin) < 90)
		return .45;
	if(distance(self.origin, player.origin) <= 100)
		return .4;
	if(distance(self.origin, player.origin) <= 150)
		return .3;
	if(distance(self.origin, player.origin) <= 200)
		return .25;
	if(distance(self.origin, player.origin) <= 250)
		return .225;
	if(distance(self.origin, player.origin) <= 300)
		return .2;
	if(distance(self.origin, player.origin) <= 350)
		return .175;
	if(distance(self.origin, player.origin) <= 400)
		return .15;
	return .125;
}