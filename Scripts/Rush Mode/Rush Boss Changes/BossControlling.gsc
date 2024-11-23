BloodBrutusSkip()
{
    self endon(#"disconnect", "death");
    
    level.var_a36cbfaf = 1;
}


SpawnElephantIX(Phase, Origin, Angles)
{
    if(!isDefined(level.ElephantsSpawned))
     level.ElephantsSpawned = 0;
    
    if(!isDefined(Origin) && Angles)
    {
        Origin = self.origin + (100, 100, 0);
        Angles = self.angles;
    }

    if(Phase == 2)
     Phase = #"hash_266f56fb994e6639";
    else
     Phase = #"hash_266f53fb994e6120";
    
    elephant = undefined;
    spawner_ab = getEntArray("zombie_towers_boss_spawner", "script_noteworthy"); // zombie_towers_boss2_spawner
    elephant_spawner = spawner_ab[level.ElephantsSpawned];

    //iPrintLnBold("^2THIS IS A MAIN PROBLEM ---->>>>> ^3" + spawner_ab.size);

    while(!isDefined(elephant))
    {
        wait 0.1;
        elephant = zombie_utility::spawn_zombie(elephant_spawner);
    }
    elephant.ai.phase = phase;
    elephant.takedamage = false;

    wait 0.3;
    elephant forceteleport(Origin, Angles);
    level.ElephantsSpawned++;

    return elephant;

    /#
    spawnloc = struct::get("towers_boss_location_2", "script_noteworthy");
    sp_spawner = getent("zombie_towers_boss2_spawner", "script_noteworthy");
    e_elephant = spawner::simple_spawn_single(sp_spawner, &ElephSetUp, spawnloc, #"hash_266f56fb994e6639");
    e_elephant forceteleport((self.origin) + (0, 200, 10), (0,0,0));
    #/
}

ElephantFast()
{
    self endon(#"death");

    while(true)
    {
        self namespace_9ff9f642::slowdown(#"zm_trial_zombie_speed_changes", 2);
        wait 0.1;
    }
}

ElephSetUp(s_spawn, phase) 
{
    self endon(#"death");
    self.ai.phase = phase;
    level.e_custom_elephant = self;
    self.instakill_func = &zm_powerups::function_16c2586a;
}

ElephantCheckHighDamage(var_386e5658, s_info) // no high random damage / instakill bug
{
    //ShieldLog("^1Elephant Test -> Called");
    
    if (!isdefined(s_info) || self != var_386e5658) 
        n_damage = 0;
    else
    {
        n_damage = s_info.idamage;

        //ShieldLog("^2Elephant Test -> Checked -> " + n_damage);

        if (n_damage > 10000)
         return 0;
    }

    return n_damage;
}

ElephantDamage() // no killing it instantly 
{
    self endoncallback(&ProtectLUINotify, #"death");
    
    self thread NukeLook(self.origin, self.angles, self, (0, 0, 550));
    while(true)
    {
        wait 13;
        self.takedamage = 0;
        level.ElephantShield = true;
        wait 35;
        self.takedamage = 1;
        level.ElephantShield = false;
    }
}

ProtectLUINotify(str_notify)
{
    level.ElephantShield = false;
    
    LUINotifyEvent(#"rush_boss_health_bar", 2, 1, 0);
    LUINotifyEvent(#"rush_boss_health_bar", 1, 3);
    LUINotifyEvent(#"rush_boss_health_bar_l", 2, 1, 0);
    LUINotifyEvent(#"rush_boss_health", 2, 3, 0);
}

ElephLowHealth()
{
    if(isDefined(level.e_elephant))
     level.e_elephant.health = 50000;
}

ElephSkip()
{
    setDvar(#"hash_2b64162aa40fe2bb", 1);
}

WolfSetHealth(Int)
{
    level.s_boss.var_57badb98 = Int; // dealt
}

SpecSkip1()
{
    level flag::set(#"hash_15ba89b2357ff618");
}

SpecSkip2()
{
    level flag::set(#"hash_6dab61ca45a8eaea");
}

SpecHealthDown(Int)
{
    level.s_boss_battle.var_ad3f929f = Int;
}

SpecHealthDownStun(Int)
{
    level.s_boss_battle.var_5dc26e42 = Int;
}

OrbsHealthLogic() // fucking more stupid logic
{
    if(!isDefined(level.s_orbs)) level.s_orbs = [];
    for (i = 0; i <= 21; i++)
     level.BloodOrbMainH[i] = 0;
    
    while(true)
    {
        for (i = 0; i <= 21; i++)
        {
            if(isDefined(level.s_orbs[i]) && !level.s_orbs[i].done_h)
                level.BloodOrbMainH[i] = level.s_orbs[i].health;
            else
                level.BloodOrbMainH[i] = 0; // dead
        }

        level.BloodOrbsHealth = 0; // reset it
        for (i = 0; i <= 21; i++)
         level.BloodOrbsHealth += level.BloodOrbMainH[i]; // better way

        /#
        level.BloodOrbsHealth // honestly, i dont know if there is a better way to do this fucking shit (too many orbs lol)
        = level.BloodOrbMainH[0] + level.BloodOrbMainH[1]
        + level.BloodOrbMainH[2] + level.BloodOrbMainH[3]
        + level.BloodOrbMainH[4] + level.BloodOrbMainH[5]
        + level.BloodOrbMainH[6] + level.BloodOrbMainH[7]
        + level.BloodOrbMainH[8] + level.BloodOrbMainH[9]
        + level.BloodOrbMainH[10] + level.BloodOrbMainH[11]
        + level.BloodOrbMainH[12] + level.BloodOrbMainH[13]
        + level.BloodOrbMainH[14] + level.BloodOrbMainH[15]
        + level.BloodOrbMainH[16] + level.BloodOrbMainH[17]
        + level.BloodOrbMainH[18] + level.BloodOrbMainH[19]
        + level.BloodOrbMainH[20] + level.BloodOrbMainH[21];
        #/   
        util::wait_network_frame(1);
    }
}

OrbsSetDamageCallback_Delay(damagecheck)
{
    wait 3;
    callback::function_9d78f548(damagecheck, self);
}

OrbsLogicDestroyed()
{
    self waittill(#"delete_me");
    self.done_h = true; // for health logic

    self clientfield::set("" + #"orb_explosion", 1);
    self ghost();
    level.var_ed0d6c7d++;
    if (level.var_ed0d6c7d == 22) // 3 -> 22
    {
        level notify(#"boss_loses");
        if (!level.var_f493ed9d)
            level.var_7fe331bf = 1;
    }

    playsoundatposition(#"hash_14e38e92efca6db0", self.origin);
    wait(1.6);
    self delete();
}

OrbMoveRandom()
{
    self endon(#"death");

    wait 5;
    self moveto(self.origin + (randomIntRange(50, 150), randomIntRange(50, 150), randomIntRange(50, 150)), 3, 2, 0.5);

    wait 5;
    self moveto(self.origin + (randomIntRange(50, 150), randomIntRange(50, 150), randomIntRange(50, 150)), 3, 2, 0.5);
}

BrutusSpawnLogic()
{
    level endon(#"end_game", #"game_ended");
    level endon(#"StopSpawners");

    attempt_brutus_spawn = @zombie_brutus_util<script_7c62f55ce3a557ff.gsc>::attempt_brutus_spawn;
    level thread BrutusZombieWatcher();
    while(true)
    {
        wait 7;
        level thread [[ attempt_brutus_spawn ]](1, "zone_west_side_exterior_upper_03", 1);
        //foreach(player in level.players) player iPrintLnBold("Brutus done"); // test
    }
}

BrutusSpawnLogicMain(n_brutus, hash = 0)
{
    level endon(#"end_game", #"game_ended", #"main_quest_completed");
    ShieldLog("^1Brutus Spawning Called -> " + n_brutus + " -> " + hash);

    if (hash)
        level flag::wait_till_timeout(61, #"hash_68a1656980e771da");

    wait 1.6;

    done_flag = false;
    spawns_a = array("brutus_spawned", "brutus_spawn_failed");
    func = @paschal<scripts\zm\zm_escape_paschal.gsc>::function_bba62242;

    while (level.var_dcff743c) 
    {
        [[ @zombie_brutus_util<script_7c62f55ce3a557ff.gsc>::attempt_brutus_spawn ]](1, "zone_west_side_exterior_upper_03", 1);
        s_waittill = undefined;
        s_waittill = level waittill(spawns_a);

        if (isdefined(s_waittill.ai_brutus))
        {
            level.n_brutus_spawned++;
            s_waittill.ai_brutus.var_ece4a895 = func;
            s_waittill.ai_brutus ai::set_behavior_attribute("can_ground_slam", 1);
            s_waittill.ai_brutus.var_db8b3627 = 1;

            if (n_brutus != -1 && level.n_brutus_spawned >= n_brutus)
             level.var_dcff743c = 0;
            else
             wait 6;

            if(level.n_brutus_spawned > 10 && !done_flag)
            {
                //level thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_30febada ]](); // brutus attack
                level thread BrutusDoSpecialAttack(false);
                done_flag = true;
            }
        }
    }
}

ZombieSpawnLogic()
{
    level endon(#"end_game", #"game_ended");
    level endon(#"StopSpawners");

    Spawn = struct::get_array(#"hash_12b8ce4101a20d47");
    while(true)
    {
        wait 1;
        Spawn = array::randomize(Spawn);
        s_spawn_loc = Spawn[0];
        ai_zombie = zombie_utility::spawn_zombie(level.zombie_spawners[0], undefined, s_spawn_loc);
    }
}

CircleRedLogic() // its a loop, so not good for charlie...
{
    level endon(#"end_game", #"game_ended", #"main_quest_completed");

    while(true)
    {
        wait 7;
        level thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_65cd27ea ]](1);
        //foreach(player in level.players) player iPrintLnBold("Circle done"); // test
    }
}

StartCirclingRed(hash) // instead this better
{
    level endon(#"end_game", #"game_ended", #"main_quest_completed");

    wait(2.6);
    while (level.var_dcff743c) 
    {
        circle_area = struct::get_array(#"hash_238da2de7cf910d9", "variantname");
        circle_area = array::randomize(circle_area);
        for (i = 0; i < hash; i++) 
        {
            //iPrintLnBold(circle_area.size); -> 19

            s_cloud = circle_area[i];
            //function_645562a2(s_cloud);
            thread SpawnCircleRed(s_cloud); // !! -> using thread
            wait(randomfloatrange(2.5, 5));
        }
        wait 7;
    }
}

SpawnCircleRed(s_cloud) // used instead of detour
{
    level endon(#"end_game", #"game_ended"); // no main quest complete to avoid crashing in cutscene...

    circle = util::spawn_model("tag_origin", s_cloud.origin, s_cloud.angles + vectorscale((1, 0, 0), 270));
    circle clientfield::set("" + #"ritual_gobo", 1);
    circle thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_a67f95bd ]](); // clientfield
    wait 7.6;

    foreach (player in util::get_active_players()) 
    {
        if (distance2dsquared(circle.origin, player.origin) < 5041) 
         player dodamage(player.health + 16, player.origin);
    }
    circle delete(); // should reduce charlie
}

BrutusZombieWatcher()
{
    level endon(#"end_game", #"game_ended");
    wait 30;
    level notify(#"StopSpawners");
}

BrutusDoSpecialAttack(StopSpawn = true)
{
    //level thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_30febada ]](); // brutus attack
    ShieldLog("^2Brutus Special Attack -> Called");

    struct_arrays = array("energy_location_up", "energy_location_right", "energy_location_left", "energy_location_bottom");
    if (!isdefined(level.var_ebd424be))
        level.var_ebd424be = randomintrange(1, 5);
    
    random_int_l = randomintrange(1, 5);
    while (random_int_l == level.var_ebd424be)
    {
        waitframe(1);
        random_int_l = randomintrange(1, 5);
    }

    attack_struct = struct::get("sbrutus_attack_" + random_int_l);
    shieldfx = util::spawn_model(#"p8_fxp_cylinder_shield", attack_struct.origin + vectorscale((0, 0, -1), 61), attack_struct.angles);
    level.var_7fe331bf = 0;
    level.var_f493ed9d = 0;
    level.var_e22ef7ff = 0;
    level.var_e7184999 = 0;

    spawner_brutus = [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_708bfb60 ]]();
    scene_func = @paschal<scripts\zm\zm_escape_paschal.gsc>::function_6546242b;
    scene_func2 = @paschal<scripts\zm\zm_escape_paschal.gsc>::function_9c59bce1;

    scene::add_scene_func(#"hash_5d4bfbee934372eb", scene_func, "init");
    attack_struct thread scene::play(spawner_brutus);
    spawner_brutus thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_2aa1c625 ]](struct_arrays[random_int_l - 1], attack_struct.origin);
    wait(1.6);

    exploder::exploder("fxexp_poison_0" + random_int_l);
    foreach (e_player in util::get_players())
        e_player thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_4e2f5d87 ]](attack_struct.origin);
    
    //level thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_37d4f9 ]](3, 0, 0, 0, util::get_active_players().size);
    level waittilltimeout(21.5, #"boss_loses");
    if(StopSpawn) level.var_dcff743c = 0;
    level.var_e7184999 = 1;
    shieldfx delete();

    if (level.var_7fe331bf) 
    {
        scene::add_scene_func(#"aib_vign_zm_mob_brutus_grand_attack_fail", scene_func2, "play");
        spawner_brutus scene::play(#"aib_vign_zm_mob_brutus_grand_attack_fail", spawner_brutus);
        level thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_17b00ca4 ]](1);
        level waittilltimeout(6.1, #"hash_6721db7073dcfe48");
        level notify(#"hash_77922c6d618e505a");

        if (level.var_e22ef7ff) 
        {
            playsoundatposition(#"hash_b04b76e47de1e9d", (9915, 10161, 617));
            level.var_a36cbfaf++;
            level thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_7cfcac59 ]]();
        }

        level thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_17b00ca4 ]](0);
    } 
    else 
    {
        level.var_a36cbfaf--;
        level thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_6f05bd7c ]]();
        scene::add_scene_func(#"hash_dc3b3b48b040137", scene_func2, "play");
        level notify(#"hash_430c557748eea7b8");
        spawner_brutus thread scene::play(#"hash_dc3b3b48b040137", spawner_brutus);

        wait(1);
        level notify(#"hash_7dc902a6d75721a1");
    }

    exploder::kill_exploder("fxexp_poison_0" + random_int_l);
    [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_360daff1 ]]();
}

GetZeroPhase()
{
    charges = array("cp_toast_lounge", "cp_toast_diner", "cp_toast_storage", "cp_toast_beds");

    /#
    foreach (str in charges) 
    {
        chr = struct::get(str, "script_noteworthy");
        chr thread CheckPhaseCharge();
        chr thread BuffPhaseCharge();
    }
    #/

    while(!level flag::get(#"toast_final_charge"))
    {
        switch(level.ZeroCharges)
        {
            case 1:
            level.ZeroPhase = 2;
            break;

            case 2:
            level.ZeroPhase = 3;
            break;

            case 3:
            level.ZeroPhase = 4;
            break;

            case 4:
            level.ZeroPhase = 11;
            wait 3;
            level.e_avogadro ModelCheckZeroAfter();
            break;
        }
        wait 1;
    }
}

ZeroSoulsMenu(Int)
{
    level.ZeroSkipSouls = Int;
}

CheckPhaseCharge() // unused
{
    self endon(#"death");

    while(!self.charged) { wait 1; }
    level.ZeroCharges++;
}

BuffPhaseCharge()
{
    self endon(#"death");
    self waittill(#"trigger_activated");
    
    Buffs = 0;
    while(Buffs < 33)
    {
        level waittill(#"toast_captured");
        self notify(#"hash_4d9ae187d6e333c7"); // stop decrease
        self.n_captured = 1;
        Buffs++;
        level.ZeroSouls++;
    }

    while(!self.charged)
    {
        level waittill(#"toast_captured");
        self notify(#"hash_4d9ae187d6e333c7"); // stop decrease
        level.ZeroSouls++;
    }

    level.ZeroSouls = 0;
}

ModelCheckZero()
{
    self endon(#"death");

    while(true)
    {
        if(self.model === level.ElecModel)
        {
            self SetModel(#"c_t8_mp_spe_hacker_body1");

            self.no_gib = 1;
            level.ZeroModelAfter = self.model;
        }

        if(!self IsAttached(#"c_t8_mp_spe_hacker_head1", "j_head")) self attach(#"c_t8_mp_spe_hacker_head1", "j_head");
        if(!self IsAttached(#"p8_zm_red_floatie_duck", "j_spinelower")) self attach(#"p8_zm_red_floatie_duck", "j_spinelower");
        wait 1;
    }
}

ModelCheckZeroAfter()
{
    while(isdefined(self))
    {
        if(self.model !== level.ZeroModelAfter)
        {
            self SetModel(#"c_t8_mp_spe_hacker_body1");

            self.no_gib = 1;
        }
        if(!self IsAttached(#"c_t8_mp_spe_hacker_head1", "j_head")) self attach(#"c_t8_mp_spe_hacker_head1", "j_head");
        if(!self IsAttached(#"p8_zm_red_floatie_duck", "j_spinelower")) self attach(#"p8_zm_red_floatie_duck", "j_spinelower");
        wait 1;
    }
}

GetScarlettPhase(Phase)
{
    switch(Phase)
    {
        case 2:
        level.BloodPhase = 2;
        break;

        case 3:
        level.BloodPhase = 3;
        break;

        case 4:
        level.BloodPhase = 4;
        break;

        case 5:
        level.BloodPhase = 5;
        break;

        case 6:
        level.BloodPhase = 6;
        break;

        case 7:
        level.BloodPhase = 7;
        break;

        case 8:
        level.BloodPhase = 11; // last
        break;

        default:
        level.BloodPhase = 0;
        break;
    }
}

GetWolfPhase()
{
    level thread GetWolfStun();
    level waittill(#"hash_54f2e7b4cb8826a");
    level.WolfPhase = 5; // 2

    ee = level._ee[#"zm_mansion_ww"];
    foreach (step in ee.steps) 
    {
        if (step.name == #"step_3")
        {
            ee_step = step;
            break;
        }
    }

    while(!step.started) { wait 1; }
    level notify(#"Phase3Wolf");
    
    level.WolfPhase = 6; // 3
}

GetWolfStun()
{
    level endon(#"hash_25d8c88ff3f91ee5"); // dead

    while(true)
    {
        level waittill(#"boss_captured");
        level.WolfStunStatus = 1;
        level waittilltimeout(10, #"hash_38f29f9cb03586ea");
        level.WolfStunStatus = 0;
    }
}

WolfBuff()
{
    level.s_boss.var_c962047c = 120000;
    wait 3;
    level.s_boss.var_c962047c = 120000;
    wait 10;
    level.s_boss.var_c962047c = 120000;
    wait 30;
    level waittill(#"Phase3Wolf");
    wait 5;
    level.s_boss.var_c962047c = 220000;
    wait 10;
    level.s_boss.var_c962047c = 220000;
    wait 20;
    level.s_boss.var_c962047c = 220000;
}

GetARSouls(Num)
{
    level endon(#"StopSoulsCount");

    s_sc = struct::get("sc_lantern_" + Num, "script_noteworthy");

    if(!isDefined(s_sc)) return;
    s_sc endon(#"death");
    s_sc thread StopSouls();
    s_sc thread BuffSouls();

    wait 0.3;
    while(true)
    {
        level.ARSouls = s_sc.var_7944be4a;
        level.ARSoulsRequired = s_sc.var_71561996;

        if(isDefined(level.ARSoulsCustom))
        {
            s_sc.var_7944be4a = level.ARSoulsCustom;
            level.ARSoulsCustom = undefined;
        }
        
        util::wait_network_frame(1);
    }
}

BuffSouls()
{
    self endon(#"death");

    self.var_71561996 = 90;
}

StopSouls()
{
    self endon(#"death");
    
    wait 10;
    while(true)
    {
        if(level.ARSouls >= level.ARSoulsRequired)
        {
            level notify(#"StopSoulsCount");
            //foreach(player in level.players) player iPrintLnBold("Done test");
            level.ARCharging = false;
            break;
        }
        util::wait_network_frame(1);
    }
}

SpeedUpAR(Speed)
{
    level.var_5d5b7e8e.var_a41818b5 setspeed(Speed);
}

ARChangeSoul(Int)
{
    level.ARSoulsCustom = Int;
}