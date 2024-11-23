#ifdef _SUPPORTS_DETOURS // THANKS ATE!!!
init_detours() 
{
    compiler::detour();
	//am_log("Detours has been Used!");
}

detour zm<scripts\zm_common\zm.gsc>::initialblack()
{
    ShieldLog("^6Removed BlackScreen");
    return;
}

// for all maps except for botd (system::ignore)
detour zm_weap_homunculus<scripts\zm\weapons\zm_weap_homunculus.gsc>::function_67a145e5()
{
    ShieldLog("^1Homunculus Check Called");
    return true;
}

detour zm_weap_cymbal_monkey<scripts\zm\weapons\zm_weap_cymbal_monkey.gsc>::cymbal_monkey_exists()
{
    ShieldLog("^1Cymbal Monkey Check Called");
    return true;
}

detour zm<scripts\zm_common\zm.gsc>::player_too_many_players_check()
{
    ShieldLog("^4Called -> player_too_many_players_check_func");
    return;
}

detour zm_audio<scripts\zm_common\zm_audio.gsc>::function_6191af93(str_category, hash, hash2, hash3, hash4 = 0)
{
    ShieldLog("^4zm_audio Called -> " + str_category + " -> " + hash + " -> " + hash2 + " -> " + hash3 + " -> " + hash4);

    if(hash2 === "")
    {
        ShieldLog("^9zm_audio Returned...");
        return;
    }

    return [[ @zm_audio<scripts\zm_common\zm_audio.gsc>::function_6191af93 ]](str_category, hash, hash2, hash3, hash4);
}

detour zm_utility<scripts\zm_common\zm_utility.gsc>::is_ee_enabled() 
{
	return true;
}

detour zm_player<scripts\zm_common\zm_player.gsc>::player_out_of_playable_area_monitor() 
{
	self notify(#"stop_player_out_of_playable_area_monitor");
}

detour zm_powerups<scripts\zm_common\zm_powerups.gsc>::func_should_never_drop()
{
	return 1;
}

detour bgb<scripts\zm_common\zm_bgb.gsc>::is_team_enabled(bgb_name)
{
	if (bgb_name == #"zm_bgb_power_vacuum" && !level.RealisticDif) return true;

    return [[ @bgb<scripts\zm_common\zm_bgb.gsc>::is_team_enabled ]](bgb_name);
}

detour zm_magicbox<scripts\zm_common\zm_magicbox.gsc>::function_db355791(player, weapon, var_21b5a3f4 = 1) 
{
	if (player zm_weapons::has_weapon_or_upgrade(weapon)) 
	{
        return 0;
    }

    return 1;
}

detour util<scripts\core_common\util_shared.gsc>::spawn_model(model_name, origin = (0, 0, 0), angles = (0, 0, 0), n_spawnflags = 0, b_throttle = 0)
{
	if(!level.DevMenu)
	return [[ @util<scripts\core_common\util_shared.gsc>::spawn_model ]](model_name, origin, angles, n_spawnflags, b_throttle);

	while(true) 
	{
        if (b_throttle) 
		{
            spawner::global_spawn_throttle(4);
        }
        model = spawn("script_model", origin, n_spawnflags);
        if (isdefined(model)) 
		{
            break;
        }
		else 
		{

        }
        waitframe(1);
    }
    
    model setmodel(model_name);
    model.angles = angles;
	level.ObjectsLimits[level.ObjectsLimits.size] = model;
    return model;
}

// fix dotn
detour zm_mansion_zones<scripts\zm\zm_mansion_zones.gsc>::function_d274c574()
{
    return;
}

// bosses
detour archetypeelephant<scripts\core_common\ai\archetype_elephant.gsc>::function_f51431a9(elephant) 
{
	elephant endon(#"death");

	elephant.health = 250000;
    level.ElephantPhase = false;

    level.ElpehantMaxHealth = elephant.maxhealth;

	while(true)
	{
		shieldcheck = elephant.health <= 40000;
        deathcheck = elephant.health <= 20000;

        currentstate = elephant.ai.var_112ec817;
        switch (currentstate) 
		{
            case #"hash_8e170ae91588f20":
            if (deathcheck)
            {
                level thread [[ @archetypeelephant<scripts\core_common\ai\archetype_elephant.gsc>::elephantstartdeath ]](elephant);

                if(level.CurrentElephantNumber == 2) // boss fight done
                {
                    wait 5;
                    level notify("eleph_dead");
                }
                else
                 level.ElephantPhase = false; // next elephant
                
                return;
            }
            break;

            case #"hash_8e173ae91589439":
            if (shieldcheck)
            {
                level.ElephantPhase = true;

                elephant thread [[ @archetypeelephant<scripts\core_common\ai\archetype_elephant.gsc>::function_4d479d22 ]](elephant);
            }
            break;
        }

        if(level.ElephantPhase) level.ElpehantMaxHealth = 430000 + 20000;
        else level.ElpehantMaxHealth = 250000;

        wait(1);
	}
}

// ancient evil flame
detour namespace_c8efdadc<script_6c983b627f4a3d51>::function_9c8540b4(e_player, n_amount)
{
    e_player endon(#"death");
    if (level.var_705db276 >= 5)
        return;

    level.var_705db276 = 5;


    level.var_d5ba7324 clientfield::set("" + #"hash_74fc30de57a0657a", level.var_705db276);
    level flag::set("fl_oracle_unlocked");

    foreach (player in getplayers())
        player zm_vo::vo_say(#"hash_4c29e41ef47ad9b2", 0, 1, 9999, 1, 1, 1);

    ShieldLog("^1AE Challange Flame Function -> Called");
}

// scarlett
detour paschal<scripts\zm\zm_escape_paschal.gsc>::function_2aa1c625(hash, var_1f61bd3e)
{
    level endon(#"hash_77922c6d618e505a");
    level.var_ed0d6c7d = 0;
    level.s_orbs = [];
    damagecheck = @paschal<scripts\zm\zm_escape_paschal.gsc>::function_2ffe7896;
    for (i = 1; i <= 22; i++) 
    {
        s_orb = struct::get(hash + "_" + randomIntRange(1, 4));
        s_orbEnd = util::spawn_model(#"hash_6d68fe0dc773635f", s_orb.origin, s_orb.angles);
        s_orbEnd setcandamage(1);
        s_orbEnd.health = 3000 * util::get_active_players().size;
        s_orbEnd.var_1f61bd3e = var_1f61bd3e;
        s_orbEnd.done_h = false;
        //s_orbEnd thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_bceb2f4c ]]();
        s_orbEnd thread OrbsLogicDestroyed(); // custom
        s_orbEnd thread OrbsSetDamageCallback_Delay(damagecheck); // custom
        s_orbEnd thread AddLinkedObjective(true, s_orbEnd, #"hash_423a75e2700a53ab", undefined, #"delete_me", 1.75);
        self thread scene::play(#"hash_4b825982d02adb40" + randomIntRange(1, 4), "Shot 1", s_orbEnd);

        if (!isdefined(level.s_orbs))
            level.s_orbs = [];
        else if (!isarray(level.s_orbs))
            level.s_orbs = array(level.s_orbs);

        level.s_orbs[level.s_orbs.size] = s_orbEnd;
        s_orbEnd thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_5d55d8d0 ]](self, randomIntRange(1, 4));
        s_orbEnd.indexs = i;

        wait 0.70; // till another orb comes
    }
}

// wall block
detour paschal<scripts\zm\zm_escape_paschal.gsc>::function_f2f59362()
{
    return;
}

// no gib for samantha box removed here 
detour music_box<script_1c28a77967267c7a>::function_9d9bff80(pos, attacker)
{
    self endon(#"death");
    level endon(#"end_game");

    posF = pos + vectorscale((0, 0, 1), 64);
    self playsound("vox_musicbox_start_sama_" + randomint(3));
    wait(1);
    e_sam = util::spawn_model("p8_zm_music_box_samantha_trap", self.var_1a61db89.origin, (0, self.angles[1] + 180, 0));
    a_zombies = getaiteamarray(level.zombie_team);
    a_zombies = arraysortclosest(a_zombies, pos, 25, 0, 350);
    foreach (e_zombie in a_zombies) 
    {
        if (isalive(e_zombie) && e_zombie.marked_for_death !== 1 && e_zombie.var_46d39f48 !== 1) 
        {
            if (e_zombie.var_6f84b820 === #"popcorn") 
            {
                e_zombie dodamage(e_zombie.maxhealth, e_zombie.origin, attacker, self, 0, "MOD_GRENADE", 0, self.weapon);
            }
            else
            {
                e_zombie.var_42d5176d = 1;
                e_zombie.marked_for_death = 1;
                e_floater = util::spawn_model("tag_origin", e_zombie getcentroid(), e_zombie.angles);
                e_zombie linkto(e_floater);
                e_zombie.e_floater = e_floater;
                e_zombie thread util::delete_on_death(e_zombie.e_floater);
                e_floater moveto(e_floater.origin + (0, 0, randomfloatrange(16, 64)), 0.5);
                if (e_zombie.archetype === #"zombie") 
                {
                    e_floater thread [[ @music_box<script_1c28a77967267c7a.gsc>::function_3710157f ]](e_zombie);
                }
            }
        }
    }
    e_sam thread scene::play(#"hash_67030b23e27f4303", "one_shot", e_sam);
    wait(0.5);
    self.var_1a61db89 hide();
    self.var_1a61db89 clientfield::set("" + #"hash_136e9d44e7e2e888", 0);
    wait(1);
    foreach (e_zombie in a_zombies) 
    {
        if (isalive(e_zombie)) 
        {
            var_c0225146 = posF + vectornormalize(e_zombie getcentroid() - posF) * 80;
            n_distance = distance(e_zombie getcentroid(), posF);
            e_zombie.e_floater moveto(var_c0225146, n_distance / 100);
            var_358047f1 = vectortoangles(e_zombie getcentroid() - posF);
            e_zombie.e_floater rotateto(var_358047f1, 1);
        } 
        else if (isdefined(e_zombie) && isdefined(e_zombie.e_floater)) 
        {
            e_zombie [[ @music_box<script_1c28a77967267c7a.gsc>::function_4ada560e ]]();
        }
    }
    wait(2);
    foreach (e_zombie in a_zombies) 
    {
        if (isalive(e_zombie)) 
        {
            e_zombie [[ @music_box<script_1c28a77967267c7a.gsc>::function_4ada560e ]]();
        }
    }
    waitframe(1);
    foreach (e_zombie in a_zombies)
    {
        if (isalive(e_zombie)) 
        {
            e_zombie startragdoll(1);
            var_23ef51ef = vectornormalize(e_zombie getcentroid() - posF) * randomfloatrange(150, 250);
            e_zombie launchragdoll(var_23ef51ef + vectorscale((0, 0, 1), 32));
            e_zombie dodamage(e_zombie.maxhealth, e_zombie.origin, attacker, self, 0, "MOD_GRENADE", 0, self.weapon);
            e_zombie clientfield::set("" + #"hash_4881cb6bc59fdc49", 1);
        }
    }
    self playrumbleonentity("talon_spike");
    dist = distance(level.var_f1907c72.origin, posF);
    if (isdefined(level.var_f1907c72) && dist <= 160) 
    {
        level.var_f1907c72 notify(#"music_box");
    }
    e_sam playsound("vox_musicbox_end_sama_" + randomint(3));
    wait(1.5);
    e_sam thread scene::stop();
    e_sam delete();
    self.var_1a61db89 delete();
    level thread [[ @music_box<script_1c28a77967267c7a.gsc>::function_6b8c9160 ]]();
}

// vod planet hit
detour zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_53a78cbd()
{
    self notify("27434ec2d49bebb3");
    self endon("27434ec2d49bebb3");
    self endon(#"death");

    Time = gettime();
    weapons_check = level.hero_weapon[#"chakram"];

    while (!level flag::get(#"hash_1a742576c41a0ab9")) 
    {
        s_result = undefined;
        s_result = self waittill(#"weapon_fired");
        if (!isdefined(level.a_planets) || level.a_planets.size == 0)
            continue;
        
        if (gettime() - Time < 100)
            continue;
        
        var_6203d9be = 0;
        foreach (weapon in weapons_check) 
        {
            if (weapon.dualwieldweapon == s_result.weapon || weapon == s_result.weapon) 
            {
                var_6203d9be = 1;
                break;
            }
        }

        if (var_6203d9be)
            continue;
        
        v_forward = self getweaponforwarddir();
        v_start = self getweaponmuzzlepoint();

        foreach (mdl_planet in level.a_planets) 
        {
            if (!isdefined(mdl_planet.str_object_name) || v_forward[2] < 0.3 && mdl_planet.str_object_name != #"neptune" || v_forward[2] > 0.1 && mdl_planet.str_object_name == #"neptune") 
                continue;

            if (mdl_planet.var_ddb0a5b4 !== 1) 
                continue;

            v_end = v_start + v_forward * 200000;
            b_hit = self [[ @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_370a9e5 ]](mdl_planet, v_start, v_end, v_forward);
            if (b_hit) 
            {
                if(level flag::get(#"hash_63a102a7ae564e99") && isDefined(level.CurrentPlanet)) // done all planets to start shooting
                {
                    if(isdefined(mdl_planet.str_object_name) && mdl_planet.str_object_name != #"sun")
                    {
                        //ShieldLog("^1 Test: " + mdl_planet.str_object_name);
                        if(mdl_planet.str_object_name === level.CurrentPlanet)
                        {
                            foreach(player in level.players)
                            {
                                player iPrintLn("^2Right Planet " + ToUpper(mdl_planet.str_object_name) + " has been Hit!, Next Planet is " + ToUpper(level.NextPlanet));
                                player iPrintLnBold("^2Right Planet " + ToUpper(mdl_planet.str_object_name) + " has been Hit!, Next Planet is " + ToUpper(level.NextPlanet));

                                player iPrintLn("^2The Planet's Orb will Drop in " + GetPlanetZone(mdl_planet.str_object_name) + "!");
                                player iPrintLnBold("^2The Planet's Orb will Drop in " + GetPlanetZone(mdl_planet.str_object_name) + "!");
                            }
                        }
                        else
                        {
                            foreach(player in level.players)
                            {
                                player iPrintLn("^1Wrong Planet has been Hit.. (Was " + ToUpper(level.CurrentPlanet) + " and not " + ToUpper(mdl_planet.str_object_name) + "!)");
                                player iPrintLnBold("^1Wrong Planet has been Hit.. (Was " + ToUpper(level.CurrentPlanet) + " and not " + ToUpper(mdl_planet.str_object_name) + "!)");
                            }
                        }
                    }

                    if(mdl_planet.str_object_name === #"sun" && mdl_planet.str_object_name === level.CurrentPlanet)
                    {
                        foreach(player in level.players)
                        {
                            player iPrintLn("^2Planet Step Completed!");
                            player iPrintLnBold("^2Planet Step Completed!");
                        }                
                    }
                }
                 
                v_trace_end = v_start + v_forward * 10000;
                a_trace = bullettrace(v_start, v_trace_end, 1, self);
                if (isdefined(a_trace[#"entity"]) || a_trace[#"surfacetype"] !== "default" && a_trace[#"surfacetype"] !== "none")
                    break;
                
                self util::show_hit_marker(1);
                self thread zm_audio::create_and_play_dialog(#"m_quest", #"hash_45e36c01ad8ad25c", 0, 1);

                if (isdefined(mdl_planet.var_44c99f3b))
                {
                    mdl_planet unlink();
                    mdl_planet.var_44c99f3b delete();
                }
                
                level thread [[ @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_acc65da4 ]](mdl_planet);
                break;
            }
        }
        Time = gettime();
    }
}

// vod planet random logic
detour zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_7711ae4b(a_glyphs, mdl_light)
{
    level endon(#"hash_77f76266b597a1f7");

    level.NextPlanet = "undefined";
    Times = 0;

    for (i = 0; i < a_glyphs.size; i++)
    {
        str_planet_name = a_glyphs[i].targetname;
        level.CurrentPlanet = str_planet_name;

        if(i < 7) // sun is weird fucked up targetname for some reason lol
        {
            str_next_planet_name = a_glyphs[i + 1].targetname;
            level.NextPlanet = str_next_planet_name;
        }
        else
         level.NextPlanet = "sun";

        level flag::init(str_planet_name + "_done");
        level flag::wait_till(str_planet_name + "_done");
        level thread [[ @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_50b3a576 ]](str_planet_name, i + 1);
        level flag::delete(str_planet_name + "_done");
    }

    level flag::set(#"hash_1a742576c41a0ab9");
    level thread [[ @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_996d1a4c ]](a_glyphs, mdl_light);
    waitframe(1);
    level notify(#"hash_e9d5238dbce48ca");
}

detour zm_white_toast<scripts\zm\zm_white_toast.gsc>::soul_captured(var_f0e6c7a2, ent)
{
    level.ZeroSouls++;
    var_f0e6c7a2.n_captured++;

    if(isDefined(level.ZeroSkipSouls)) // for dev menu
    {
        level.ZeroSouls = level.ZeroSkipSouls;
        var_f0e6c7a2.n_captured = level.ZeroSkipSouls;
        
        level.ZeroSkipSouls = undefined;
    }

    /#
        if (level flag::get(#"soul_fill")) {
            var_f0e6c7a2.n_captured = 28;
        }
    #/

    level notify(#"toast_captured");
    canister = getent(var_f0e6c7a2.soul_goo, "script_noteworthy");
    if (var_f0e6c7a2.n_captured >= 60)  // 28 original
    {
        level.ZeroCharges++;
        level.ZeroSouls = 0; // revert

        var_f0e6c7a2.charged = 1;
        var_f0e6c7a2.fx_handle clientfield::set("soul_capture_filled", 1);
        [[ @namespace_617a54f4<script_3e5ec44cfab7a201.gsc>::function_2a94055d ]](var_f0e6c7a2.script_string);
        //namespace_617a54f4::function_2a94055d(var_f0e6c7a2.script_string);
    }
}

detour zm_white_toast<scripts\zm\zm_white_toast.gsc>::function_10dde0dd() // stop decresse
{
    return;
}

// detouring it is better
detour zm_white_private_mannequin<scripts\zm\zm_white_private_mannequin.gsc>::private_mannequin_step1_setup(b_skipped)
{
    ShieldLog("^1Soldier Boy -> Skipped");

    wait 3;
}

// dotn beem numbers helper
detour namespace_a8113e97<script_9af9e17217da6e6>::function_8ced5d5b()
{
    a_n_numbers = array(7, 9, 11, 13, 15);
    nums_array = [];

    for (i = 0; i < 3; i++) 
    {
        n_num = array::random(a_n_numbers);
        nums_array[nums_array.size] = n_num;
        arrayremovevalue(a_n_numbers, n_num);
    }

    sort_values = array::sort_by_value(nums_array, 1);
    for (i = 0; i < 3; i++) 
    {
        level.var_d181080c[i].origin = level.var_d181080c[i].s_loc.origin;
        level.var_d181080c[i].angles = level.var_d181080c[i].s_loc.angles;
        level.var_d181080c[i].var_19d827d = sort_values[i]; // used for wolf scratches, 7 - 9 - 11 - 13 - 15...
        level.var_d181080c[i] thread [[ @namespace_a8113e97<script_9af9e17217da6e6.gsc>::function_7cc34fef ]](); // wolf scratches go here...
        level.var_d181080c[i] thread AddLinkedObjective(true, level.var_d181080c[i], #"hash_410c56f34d7ed87", undefined, undefined, 3); // make it easier
        level.var_d181080c[i] thread SymbolCheckComplete();
    }

    foreach(player in level.players) 
        player iPrintLn("^2Symbols are Highlighted for this Step Only!");
}

// voyage snd voice fix
detour zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_51e51897(hash)
{
    ShieldLog("^1Eye Debug: Boss Started...");

    level flag::clear("spawn_zombies");
    level flag::clear("zombie_drop_powerups");
    level flag::clear(#"hash_21921ed511559aa3");
    level flag::set(#"disable_fast_travel");
    level flag::set("pause_round_timeout");
    level flag::set(#"boss_fight_started");
    level zm_bgb_anywhere_but_here::function_886fce8f(0);

    /#
    arrayremoveindex(level.sndplayervox, #"elixir", 1);
    arrayremoveindex(level.sndplayervox, #"blight_father", 1);
    arrayremoveindex(level.sndplayervox, #"powerup", 1);
    arrayremoveindex(level.sndplayervox, #"stoker", 1);
    arrayremoveindex(level.sndplayervox, #"kill", 1);
    arrayremoveindex(level.sndplayervox, #"fast_travel", 1);
    arrayremoveindex(level.sndplayervox, #"hash_50660c7d730b03a1", 1);
    arrayremoveindex(level.sndplayervox, #"hash_695932a4ae89574f", 1);
    arrayremoveindex(level.sndplayervox, #"hash_4433242e2d225df8", 1);
    arrayremoveindex(level.sndplayervox, #"hash_4c7748b237c6fcbe", 1);
    #/

    func1 = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_714f8756;
    func2 = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_9bc4f8cb;
    func3 = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_e9b8eaff;

    level.var_923e8cb4 = struct::get_array("pd", "script_teleport");
    level.var_eeb98313 = func1;
    level.custom_spawnplayer = func2;
    level.disable_nuke_delay_spawning = 1;
    level notify(#"disable_nuke_delay_spawning");
    level [[ @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_77a859a8 ]](1);
    level.var_d6f059f7 = max(level.round_number, 25);
    zm_spawner::register_zombie_death_event_callback(func3);
    level.var_c9f5947d = 1;
    level notify(#"force_transformations");

    /#
        util::wait_network_frame();
        level notify(#"hash_fbdf766a8b47229");
    #/
    
    level.e_boss [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_500cb0be ]](#"hash_678aaf8e37498e9a", #"p8_fxanim_zm_zod_eye_01_bundle");
    level thread [[ @zm_zodt8<scripts\zm\zm_zodt8.gsc>::change_water_height_aft ]](1);
    if (!hash) 
    {
        level thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_482a7a01 ]]();
        level.musicsystemoverride = 1;
        music::setmusicstate("boss_1");
        level.e_boss [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_8f3497ee ]](1, "pd");
        level thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_de60e752 ]]();
        level thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_f6e1e56f ]](10, 3);
        level thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_776c95e2 ]](50, 1);
        level thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_ee223250 ]](2);
        array_v = [];
        level.e_boss [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_bb612e31 ]](array_v, 0, -1);
    }
}

// BOTD snd fixes and wall block too
detour paschal<scripts\zm\zm_escape_paschal.gsc>::step_5_cleanup(skipped, hash)
{
    ShieldLog("^2Step 5 Clean-Up -> Called");

    level flag::set(#"activate_west_side_exterior_stairs");
    level flag::set(#"hash_4fac802bd5dcebf4");
    level flag::clear("zombie_drop_powerups");

    zm_zonemgr::enable_zone("zone_west_side_exterior_upper_03");
    level thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::pause_zombies ]](1);

    mdl_door = getent("jar_1", "targetname");
    if (isdefined(mdl_door.s_interact))
        zm_unitrigger::unregister_unitrigger(mdl_door.s_interact.s_unitrigger);
    
    [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_37838b09 ]]();
    exploder::stop_exploder("lgtexp_richtofenspod_on");
    level scene::stop(#"aib_vign_zm_mob_idle_inside_pod");
    level scene::function_f81475ae(#"aib_vign_zm_mob_idle_inside_pod");
    //[[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_f2f59362 ]](); <- wall block in spawn...

    //arrayremoveindex(level.sndplayervox, "elixir", 1); // snd fixes
    //arrayremoveindex(level.sndplayervox, "powerup", 1);
}

// voyage eye wipe
detour zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_ae4a013d()
{
    level.EyeWipeCurrent = true;
    level.EyeDoingAttack = true;
    ShieldLog("^2Eye Debug: LUI Wipe Attack -> " + level.EyeWipeCurrent);
    
    level endoncallback(&StopEyeVarsWipe, #"hash_38f29f9cb03586ea", #"hash_2e4b6b86e99b024b", #"intermission");

    self.var_18acfe18 = 0;

    func = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_d775bddd;
    boss_done = 0;
    damaged = 0;

    while (true) 
    {
        s_notify = self.e_damage waittill(#"damage");
        n_damage = s_notify.amount;

        if (isalive(s_notify.attacker) && isplayer(s_notify.attacker)) 
        {
            s_notify.attacker util::show_hit_marker();
            if (s_notify.attacker hasperk(#"specialty_mod_awareness"))
                n_damage = int(n_damage * 1.1);
        }

        self.var_18acfe18 = self.var_18acfe18 + n_damage;
        if (self.var_18acfe18 >= self.var_f881e30f) 
        {
            self [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_26e02ac9]](0);
            util::wait_network_frame();

            if (level flag::get(#"hash_62b951a213a3945e")) // first phase bug
            {
                ShieldLog("^2Eye Debug: Wipe Attack Plus -> " + self.var_6efcc8c1);

                self.var_6efcc8c1++;

                if (self.var_6efcc8c1 >= 3) 
                {
                    boss_done = 1;
                    damaged = 0;
                }
            }

            self clientfield::set("bs_att_blst_tll", 0);

            if(self == level.e_boss) // stop other eyes doing this
             level notify(#"hash_14400d2bff068132");

            if (!damaged) 
            {
                self.var_914750d++;
                self scene::play(self.str_scene, "pain", self);
                level thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_f74b38da]]("zm_power_on_rumble");
                playsoundatposition(#"hash_6040f3b85932670c", self.origin);
                self.var_e21ca032 = func;
            }

            if (boss_done) 
            {
                level notify(#"hash_38f29f9cb03586ea");
            }

            break;
        }
    }

    level.EyeWipeCurrent = false;
    level.EyeDoingAttack = false;
    
    ShieldLog("^2Eye Debug: LUI Wipe Attack -> " + level.EyeWipeCurrent);
}

// voyage blockers
detour zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_c8f90603(hash, b_solid)
{
    ShieldLog("^2Eye Debug: Removed Blockers -> " + hash + " -> " + b_solid);
}

// voyage timer phase 1 -> 3 only...
detour zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_98198f98(str_archetype)
{
    ShieldLog("^2Eye Debug: Timer Called -> " + str_archetype);
}

// voyage check phase 1 -> 3 only...
detour zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_ee223250(hash)
{
    ShieldLog("^2Eye Debug: Timer Check Called -> " + hash);
}

// voyage blight spawning phase 1, 3
detour zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_776c95e2(hash, hash2)
{
    level endon(#"hash_38f29f9cb03586ea", #"spawn_zombies", #"intermission");

    hashA = isdefined(hash2) ? hash2 : "undefined..";
    ShieldLog("^2Eye Debug: Blight Check Called -> " + hash + " -> " + hash2);

    blight_s = struct::get_array(#"blightfather_spawn");
    ai_blightfather = undefined;

    while(true)
    {
        [[ @zm_transform<scripts\zm_common\zm_transformation.gsc>::function_bdd8aba6 ]](#"hash_9ecf8085fb7a68f");
        //foreach(player in level.players) player iPrintLnBold("^1Blight Spawned..."); // test
        wait(randomfloatrange(10, 25));
    }

    //function_98198f98(#"blight_father");
}

// voyage blight spawning other phases
detour zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_770486e1(hash)
{
    level endon(#"hash_38f29f9cb03586ea", #"spawn_zombies", #"intermission");

    ShieldLog("^2Eye Debug: Blight Check Other Called -> " + hash);

    blight_s = struct::get_array(#"blightfather_spawn");
    ai_blightfather = undefined;

    while(true)
    {
        [[ @zm_transform<scripts\zm_common\zm_transformation.gsc>::function_bdd8aba6 ]](#"hash_9ecf8085fb7a68f");
        //foreach(player in level.players) player iPrintLnBold("^1Blight Spawned..."); // test
        wait(randomfloatrange(14, 30));
    }

    //function_98198f98(#"blight_father");
}

// voyage stoker spawning every phase
detour zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_f6e1e56f(hash1, hash2 = 0, hash3)
{
    level endon(#"hash_38f29f9cb03586ea", #"spawn_zombies", #"intermission");
    
    hash3A = isdefined(hash3) ? "Array (Phase 2?)..." : "undefined..";
    ShieldLog("^2Eye Debug: Stoker Check Called -> " + hash1 + " -> " + hash2 + " -> " + hash3A);

    StokerChecks = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_6c4ef5c9;
    a_players = util::get_active_players();

    if (a_players.size > 0) 
    {
        s_zone = a_players[0] zm_utility::get_current_zone(1);
    }
    if (!isdefined(s_zone))
    {
        s_zone = level.zones[#"zone_poop_deck"];
    }

    zones = struct::get_array(s_zone.name + "_spawns");
    zones = arraycombine(zones, struct::get_array(s_zone.name + "_spawner"), 0, 0);
    c_zones = getarraykeys(s_zone.adjacent_zones);
    foreach (str_zone in c_zones) 
    {
        if (isdefined(s_zone.adjacent_zones[str_zone]) && s_zone.adjacent_zones[str_zone].is_connected) 
        {
            zones = arraycombine(zones, struct::get_array(str_zone + "_spawns"), 0, 0);
            zones = arraycombine(zones, struct::get_array(str_zone + "_spawner"), 0, 0);
        }
    }

    if (isdefined(hash3)) 
    {
        foreach (str_zone in hash3) 
        {
            zones = arraycombine(zones, struct::get_array(str_zone + "_spawns"), 0, 0);
            zones = arraycombine(zones, struct::get_array(str_zone + "_spawner"), 0, 0);
        }
    }

    zones = array::filter(zones, 0, StokerChecks);
    times = 0;

    while(true)
    {
        ai_stoker = [[ @zm_ai_stoker<scripts\zm\ai\zm_ai_stoker.gsc>::spawn_single ]](1, zones[times], 255);
        times++;

        if (times + 1 >= zones.size)
            times = 0;
        else 
            times++;

        //foreach(player in level.players) player iPrintLnBold("^1Stoker Spawned..."); // test
        wait(randomfloatrange(10, 20));
    }
    //function_98198f98(#"blight_father");
}

// voyage zombies spawning every phase
detour zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_de60e752(hash)
{
    level endon(#"hash_38f29f9cb03586ea", #"spawn_zombies", #"intermission");

    ZombieChecks = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_62b1d725;
    hashA = isdefined(hash) ? "Array (Phase 2 Probably..)" : "undefined.."; // oops

    ShieldLog("^2Eye Debug: Zombies Check Called -> " + hashA);

    // transformers
    level.var_9eaf1031 = 0;
    level.var_83c0592c = 0;
    level thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_f5b2d086 ]]();

    a_players = util::get_active_players();
    if (a_players.size > 0) 
    {
        s_zone = a_players[0] zm_utility::get_current_zone(1);
    }
    if (!isdefined(s_zone)) 
    {
        s_zone = level.zones[#"zone_poop_deck"];
    }

    a_s_spawnpoints = struct::get_array(s_zone.name + "_spawns");
    a_s_spawnpoints = arraycombine(a_s_spawnpoints, struct::get_array(s_zone.name + "_spawner"), 0, 0);
    strZ = getarraykeys(s_zone.adjacent_zones);

    foreach (str_zone in strZ)
    {
        if (isdefined(s_zone.adjacent_zones[str_zone]) && s_zone.adjacent_zones[str_zone].is_connected) 
        {
            a_s_spawnpoints = arraycombine(a_s_spawnpoints, struct::get_array(str_zone + "_spawns"), 0, 0);
            a_s_spawnpoints = arraycombine(a_s_spawnpoints, struct::get_array(str_zone + "_spawner"), 0, 0);
        }
    }

    if (isdefined(hash)) 
    {
        foreach (str_zone in hash) 
        {
            a_s_spawnpoints = arraycombine(a_s_spawnpoints, struct::get_array(str_zone + "_spawns"), 0, 0);
            a_s_spawnpoints = arraycombine(a_s_spawnpoints, struct::get_array(str_zone + "_spawner"), 0, 0);
        }
    }

    a_s_spawnpoints = array::filter(a_s_spawnpoints, 0, ZombieChecks);
    RZones = array::randomize(a_s_spawnpoints);
    n_index = 0;
    while(true)
    {
        while (getaiteamarray(level.zombie_team).size >= 33) // if very high, no transformers or blights....
            util::wait_network_frame();

        spawner = array::random(level.zombie_spawners);
        s_spawnpoint = RZones[n_index];

        if (n_index + 1 >= RZones.size)
            n_index = 0;
        else 
            n_index++;

        e_zombie = zombie_utility::spawn_zombie(spawner, spawner.targetname, s_spawnpoint, 255);
        wait(0.1);
    }

    //function_98198f98(#"blight_father");
}

// voyage transforms
detour zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_f5b2d086()
{
    level endon(#"hash_38f29f9cb03586ea", #"spawn_zombies", #"hash_71fd67248b9a37ca", #"intermission");

    ShieldLog("^2Eye Debug: Transformers Check Called");
    wait 6;

    level.var_8a64ef3a = 0; // fix random crash ( -- XRay 384 Metallic Apocalypse -- )
    forms = array(#"hash_7c89b1397a38e3ad", #"hash_7c89ae397a38de94", #"hash_7c89af397a38e047", #"hash_7c89ac397a38db2e");
    while(true) 
    {
        c_forms = array::random(forms);
        if (![[ @zm_transform<scripts\zm_common\zm_transformation.gsc>::function_abf1dcb4 ]](c_forms))
        {
            [[ @zm_transform<scripts\zm_common\zm_transformation.gsc>::function_bdd8aba6 ]](c_forms);
            level.var_9eaf1031--;
        }
        wait 5;
    }
}

// voyage custom eyes
// beam caller (need on self instead of level - unmatching types)
detour zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_d07ce2a9(n_path_id, hash, hash2) // worst code i have ever fucking seen
{
    level endon(#"hash_14400d2bff068132", #"intermission");
    
    ShieldLog("^2Eye Debug: Beam Caller Called -> " + n_path_id + " -> " + hash + " -> " + hash2);

    v_loc = self.var_3c63665[n_path_id][0].origin;
    tag_orig = self gettagorigin("tag_fx_beam");
    ang_orig = vectortoangles(v_loc - self.origin);
    v_forward = anglestoforward(ang_orig);
    a_trace = beamtrace(tag_orig, tag_orig + v_forward * 20000, 0, self, 1, 1);
    trace_pos = a_trace[#"position"];

    self SetupOrMoveEyeBeam(trace_pos); // self
    self thread scene::play(self.str_scene, "charge", self);
    self clientfield::set("bs_att_bm_cf", 1);
    wait(1);
    self clientfield::set("bs_att_bm_tell_cf", 1);
    wait(0.4);
    self clientfield::set("bs_att_bm_tell_fx_cf", 1);
    wait(0.1);
    self clientfield::set("bs_att_bm_tell_cf", 2);
    self playsound(#"hash_2af120dbf3e870e8");
    self [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_26e02ac9 ]](1);

    if (!hash && randomint(100) > 30) 
        [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_abbfbdff ]](array(level.var_d748689e, level.var_99d2b056));
    
    if (hash)
        self thread TrackCurrentBeam(1);
    else if (hash2)
        self thread TrackCurrentBeam(0, 1);
    else 
        self thread TrackCurrentBeam(0);
    
    self SetupEyeBeemMoving(n_path_id, hash, hash2);
    
    if(self == level.e_boss) // bruh
     level notify(#"hash_ba0b98df6573d80");
}

detour zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_c7c928e9(hash = 0, hash2 = 0, hash3)
{
    level endon(#"hash_14400d2bff068132", #"intermission");

    hash3A = isdefined(hash3) ? "Array (Attack)" : "undefined..";
    ShieldLog("^2Eye Debug: Attack Called -> " + hash + " -> " + hash2 + " -> " + hash3A);

    self thread CheckEyeAttacking();

    SetUpEyeAttack(hash, hash2, hash3);
}

detour zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_7e30d4b5() // beam attack time
{
    ShieldLog("^2Eye Debug: Main Eye Wait Attacking -> Called");

    // custom eyes can stop the main eye attack, this will fix it hopefully

    if(self != level.e_boss)
    {
        ShieldLog("^1Eye Debug: Wait Attacking -> Returned....");
        return;
    }

    level.EyeDoingAttack = true;

    level waittill(#"hash_38f29f9cb03586ea", #"hash_14400d2bff068132", #"hash_ba0b98df6573d80", #"intermission");
    level.e_boss [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_26e02ac9 ]](0);
    level.e_boss clientfield::set("bs_att_bm_tell_fx_cf", 0);
    level.e_boss clientfield::set("bs_att_bm_cf", 0);
    level.e_boss clientfield::set("bs_att_mst_tell_cf", 0);
    level.e_boss notify(#"hash_2bb8be6b846aed93");

    level.EyeDoingAttack = false;
}

detour zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_1acc1d3()
{
    ShieldLog("^2Eye Debug: Wipe Timer -> Called");
    level endon(#"hash_14400d2bff068132", #"intermission");

    self thread EyeResetFx();

    [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_1acc1d3 ]]();
}

detour zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_3d8879d7(hash)
{
    ShieldLog("^2Eye Debug: Break Function -> Called");
    self endon(#"death");

    self clientfield::set("bs_bdy_str_cf", 0);

    if (!isdefined(hash)) 
    {
        self clientfield::set("bs_bdy_str_cf", 2);
        util::wait_network_frame(8);
        self clientfield::set("bs_bdy_dmg_fx_cf", 0);
        self.str_idle = "ilde";
        self.str_arrive = "arrive";
        self.str_depart = "leave";
    } 
    else if (hash == "crack") 
    {
        self clientfield::set("bs_bdy_str_cf", 1);
        util::wait_network_frame(8);
        self clientfield::set("bs_bdy_dmg_fx_cf", self.var_914750d);
        self scene::play(self.str_scene, "crack", self);
        self animation::stop(0);
        self.str_arrive = "crack_arrive";
        self.str_depart = "crack_leave";
    } 
    else if (hash == "break") 
    {
        self clientfield::set("bs_bdy_str_cf", 1);
        util::wait_network_frame(8);
        self clientfield::set("bs_bdy_dmg_fx_cf", self.var_914750d);
        self scene::play(self.str_scene, "break", self);
        self animation::stop(0);
        self.str_arrive = "break_arrive";
        self.str_depart = "break_leave";
    }

    util::wait_network_frame(2);
    self clientfield::set("bs_bdy_str_cf", 0);
}

detour zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_3d6eaad5() // fix fourth attack not damaging
{
    level endon(#"hash_38f29f9cb03586ea", #"hash_14400d2bff068132", #"intermission");
    self notify("470dfc850103a920");
    self endon("470dfc850103a920");

    ShieldLog("^2Eye Debug: Attack One -> Called");

    self.var_18acfe18 = 0;
    damaged = 0;

    while (true) 
    {
        b_cancelled = 0;
        s_notify = self.e_damage waittill(#"damage");
        n_damage = s_notify.amount;
        w_weapon = s_notify.weapon;

        if (isdefined(w_weapon) && zm_weapons::is_wonder_weapon(w_weapon))
            n_damage = n_damage * 0.1;
        
        if (isalive(s_notify.attacker) && isplayer(s_notify.attacker)) 
        {
            s_notify.attacker util::show_hit_marker();
            if (s_notify.attacker hasperk(#"specialty_mod_awareness")) 
                n_damage = int(n_damage * 1.1);
        }

        self.var_18acfe18 = self.var_18acfe18 + n_damage;
        if (self.var_18acfe18 >= self.var_7954bf70) 
        {
            self [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_26e02ac9]](0);
            b_cancelled = 1;
            util::wait_network_frame();
        }

        self.var_57badb98 = self.var_57badb98 + n_damage;

        if (self.var_57badb98 >= self.var_ba36376c) 
        {
            self.var_575f3097 = 1;
            self.var_57badb98 = 0;
            self [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_26e02ac9]](0);
            b_cancelled = 1;
            damaged = 1;
        }

        if (b_cancelled) 
        {
            if(self == level.e_boss) // stop other eyes doing it
             level notify(#"hash_14400d2bff068132");

            if (!damaged) 
            {
                [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_abbfbdff]](level.var_73f9d759, 0.5);
                playsoundatposition(#"hash_6040f3b85932670c", self.origin);
                self scene::play(self.str_scene, "pain", self);
                level thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_f74b38da]]("zm_power_on_rumble");
            }
            break;
        }
    }
}

detour zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_bb528a4b() // fix fourth attack not damaging
{
    level endon(#"hash_38f29f9cb03586ea", #"intermission");
    ShieldLog("^2Eye Debug: Attack Two -> Called");

    self notify("541847c2acc31617");
    self endon("541847c2acc31617");

    func1 = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_c85b83f3;
    finished_attack = 0;
    self.var_18acfe18 = 0;

    if (!isdefined(self.var_c962047c) || self.var_c962047c <= 0)
        damaged = 1;
    else
    {
        damaged = 0;

        if (level flag::get(#"hash_bd3b222f6d8329d")) 
         times_before_finish = 3;
        else
         times_before_finish = 4;

        if (!isdefined(self.var_914750d)) 
        {
            self.var_914750d = 0;
            //times_before_finish = times_before_finish - 1; // bruh (3 att only)
        }

        if (level flag::get(#"hash_bd3b222f6d8329d") && self.var_914750d == 1 && !isDefined(self.phase_4_fix)) // phase 4 fix
        {
            self.var_914750d = 0;
            self.phase_4_fix = true;
        }

        var_3b922743 = self.var_c962047c / 4;
        if (!isdefined(self.var_6a30a892))
            self.var_6a30a892 = var_3b922743;
    }
    
    while (true)
    {
        b_cancelled = 0;
        s_notify = undefined;
        s_notify = self.e_damage waittill(#"damage");
        n_damage = s_notify.amount;
        w_weapon = s_notify.weapon;

        if (isdefined(w_weapon) && zm_weapons::is_wonder_weapon(w_weapon))
            n_damage = n_damage * 0.1;
        
        if (isalive(s_notify.attacker) && isplayer(s_notify.attacker)) 
        {
            s_notify.attacker util::show_hit_marker();
            if (s_notify.attacker hasperk(#"specialty_mod_awareness")) 
                n_damage = int(n_damage * 1.1);
        }

        self.var_18acfe18 = self.var_18acfe18 + n_damage;
        if (isdefined(self.var_59cdb7b9) && self.var_59cdb7b9 > 0 && self.var_18acfe18 >= self.var_59cdb7b9) 
        {
            b_cancelled = 1;
            self [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_26e02ac9 ]](0);
            util::wait_network_frame();
        }

        if (!damaged)
        {
            self.var_57badb98 = self.var_57badb98 + n_damage;
            if (self.var_914750d < times_before_finish && self.var_57badb98 > self.var_6a30a892) 
            {
                self.var_914750d++;
                self.var_6a30a892 = self.var_6a30a892 + var_3b922743;
                b_cancelled = 1;
                self.var_e21ca032 = func1;
            }
            
            if (self.var_57badb98 >= self.var_c962047c) 
            {
                b_cancelled = 1;
                finished_attack = 1;
            }
        }

        if (b_cancelled) 
        {
            if(self == level.e_boss)
             level notify(#"hash_14400d2bff068132");

            if (finished_attack)
            {
                self.var_914750d = undefined;
                self.var_6a30a892 = undefined;
                level notify(#"hash_38f29f9cb03586ea");
            } 
            else 
            {
                [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_abbfbdff ]](level.var_73f9d759, 0.5);
                playsoundatposition(#"hash_6040f3b85932670c", self.origin);
                self scene::play(self.str_scene, "pain", self);
                level thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_f74b38da ]]("zm_power_on_rumble");
            }
            break;
        }
    }
}

// tag cutscene freeze
detour zm_orange_mq_mgr<scripts\zm\zm_orange_mq_mgr.gsc>::hud_disable()
{
    ShieldLog("^2Tag Hud Disable -> Removed");
}

detour zm_orange_mq_mgr<scripts\zm\zm_orange_mq_mgr.gsc>::function_c40f70df(hash)
{
    ShieldLog("^2Tag Freeze -> Removed -> " + hash);
}

detour red_boss_battle<scripts\zm\zm_red_boss_battle.gsc>::function_3de660a0()
{
    ShieldLog("^2AE Vals -> Stopped");
}

// AO PAP
detour zm_white_special_rounds<scripts\zm\zm_white_special_rounds.gsc>::function_d4e24379(e_player)
{
    return 0;
}

// Tag PAP
/#
detour zm_orange_pap<scripts\zm\zm_orange_pap.gsc>::function_56db9cdc()
{   
    ShieldLog("^2Tag PAP -> Stopped");
    return;
}
#/

detour zm_orange_pablo<scripts\zm\zm_orange_pablo.gsc>::pablo_intro()
{   
    ShieldLog("^2Tag Pablo Intro -> Stopped");
    level.var_f6f7a368 = 2;

    level flag::set(#"pablo_intro");
    level flag::set(#"hash_641f14d0b2fd57d7");

    level.pablo_npc thread [[ @zm_orange_pablo<scripts\zm\zm_orange_pablo.gsc>::function_1dc9b29a ]]();
    level.pablo_npc thread [[ @zm_orange_pablo<scripts\zm\zm_orange_pablo.gsc>::function_57c115a8 ]]();
    return;
}

// BOTD boss teleport fix
detour paschal<scripts\zm\zm_escape_paschal.gsc>::function_fd915ab5()
{
    ShieldLog("^2Teleport Function -> Called");

    // if normal ee ->
    [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_fd915ab5 ]]();
}

// Blood Boss Spawns
detour paschal<scripts\zm\zm_escape_paschal.gsc>::function_37d4f9(hash, n_brutus = 0, hash3 = 0, hash4 = 0, n_zombies_max)
{
    level endon(#"end_game", #"game_ended", #"main_quest_completed");

    hash3A = isdefined(hash3) ? hash3 : "undefined..";
    hash4A = isdefined(hash4) ? hash4 : "undefined..";
    n_zombies_maxA = isdefined(n_zombies_max) ? n_zombies_max : "undefined..";

    // Vic 504 Pale Fury -> not an array...
    //2024-02-09 03:19:06	[ INFO ] [ GSC VM ] ^2Scarlett Spawning Called -> 2 -> 4 -> 0 -> 0 -> undefined..
    ShieldLog("^2Scarlett Spawning Called -> " + hash + " -> " + n_brutus + " -> " + hash3A + " -> " + hash4A + " -> " + n_zombies_maxA);

    // TBC....
    times = 40;
    level.var_dcff743c = 1;
    level.n_brutus_spawned = 0;

    /#
    if (hash3 > 0) 
    {
        level thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_65cd27ea ]](hash3);
    }
    #/
    level thread StartCirclingRed(19); // 19 structs array only...

    if (hash4) 
        level thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_f1eda79e ]]();

    if (n_brutus != 0) 
        level thread BrutusSpawnLogicMain(20, hash4);
        //level thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_a4e995fb ]](20, hash4);

    wait_time = 0.15;
    //[[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_9a1e357b ]](hash);
    checks = 0;
    stime = 0;
    
    Spawns_S = struct::get_array(#"hash_12b8ce4101a20d47");
    Spawns_S = array::randomize(Spawns_S);

    if (isdefined(n_zombies_max)) 
    {
        for (i = 0; i < Spawns_S.size; i++) 
        {
            if (Spawns_S[i].script_noteworthy == "riser_location")
                Spawns_S[i] = undefined;
        }
        Spawns_S = array::remove_undefined(Spawns_S);
        wait(1.6);
    }

    while(level.var_dcff743c) 
    {
        counts = getaiteamarray(level.zombie_team).size;
        if (util::get_active_players().size == 1 && level flag::get(#"richtofen_sacrifice") && !level flag::get(#"hash_68a1656980e771da"))
        {
            if (counts >= 31)
            {
                wait(wait_time);
                continue;
            }
        }
        if (isdefined(n_zombies_max) && counts >= n_zombies_max)
        {
            wait(wait_time);
            continue;
        }
        if (stime == Spawns_S.size)
        {
            stime = 0;
            Spawns_S = array::randomize(Spawns_S);
        }
        s_spawn_loc = Spawns_S[stime];
        if (isdefined(s_spawn_loc) && isdefined(s_spawn_loc.script_noteworthy) && counts < 31) // had to nerf it lol
        {
            if (s_spawn_loc.script_noteworthy == "riser_location") 
                ai_zombie = zombie_utility::spawn_zombie(level.zombie_spawners[0], undefined, s_spawn_loc);
                //ai_zombie thread function_8d744628();
            else if (s_spawn_loc.script_noteworthy == "dog_location" && !isdefined(level.var_e3522ee)) 
            {
                ai_zombie = zombie_utility::spawn_zombie(level.dog_spawners[0]);
                ai_zombie thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_23bd9529 ]](s_spawn_loc);
            }
        }

        if (isdefined(ai_zombie))
            checks++;

        stime++;
        if (n_brutus == 0)
        {
            if (checks > times) 
                level.var_dcff743c = 0;
        }

        wait(wait_time);
    }
    if (!isdefined(n_zombies_max))
    {
        counts = getaiteamarray(level.zombie_team).size;
        while (counts > 0) 
        {
            wait 1.6;
            counts = getaiteamarray(level.zombie_team).size;
        }
        powerL = struct::get_array(#"hash_3ea8e97c5c09e1a5", "variantname");
        s_location = array::random(powerL);
        level.var_ebd424be = s_location.script_int;
        if (!hash4)
        {
            if ([[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_efbccd91 ]]())
                e_powerup = zm_powerups::specific_powerup_drop("carpenter", s_location.origin + vectorscale((1, 0, 0), 31));
            else
            {
                shieldA = util::spawn_model(#"hash_5892f7f4c9a9720e", s_location.origin + (31, 0, 61));
                shieldA notsolid();
                t_shield = spawn("trigger_radius_new", s_location.origin + (31, 0, 61), 0, 16);
                t_shield thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::give_player_shield ]](shieldA);
            }
            e_powerup = zm_powerups::specific_powerup_drop("full_ammo", s_location.origin + vectorscale((-1, 0, 0), 31));
        }
    }

}

// fix brutus behavior
detour paschal<scripts\zm\zm_escape_paschal.gsc>::function_a4e995fb(n_brutus, hash = 0)
{
    level endon(#"end_game", #"game_ended", #"main_quest_completed");
    ShieldLog("^1Brutus Spawning Called -> " + n_brutus + " -> " + hash);

    BrutusSpawnLogicMain(20, hash);
}

detour paschal<scripts\zm\zm_escape_paschal.gsc>::function_30febada()
{
    ShieldLog("^2Brutus Special Attack -> Called");

    BrutusDoSpecialAttack();
}


// s_could fix
detour paschal<scripts\zm\zm_escape_paschal.gsc>::function_65cd27ea(hash)
{
    level endon(#"end_game", #"game_ended", #"main_quest_completed");

    wait(2.6);
    while (level.var_dcff743c) 
    {
        circle_area = struct::get_array(#"hash_238da2de7cf910d9", "variantname");
        circle_area = array::randomize(circle_area);
        for (i = 0; i < hash; i++) 
        {
            s_cloud = circle_area[i];
            //function_645562a2(s_cloud);
            SpawnCircleRed(s_cloud);
            wait(randomfloatrange(1.6, 3));
        }
        wait 7;
    }
}

detour paschal<scripts\zm\zm_escape_paschal.gsc>::function_645562a2(s_cloud)
{
    level endon(#"end_game", #"game_ended", #"main_quest_completed");
    
    circle = util::spawn_model("tag_origin", s_cloud.origin, s_cloud.angles + vectorscale((1, 0, 0), 270));
    circle clientfield::set("" + #"ritual_gobo", 1);
    circle thread [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_a67f95bd ]](); // clientfield
    wait 7.6;
    foreach (player in util::get_active_players()) 
    {
        if (distance2dsquared(circle.origin, player.origin) < 5041) 
         player dodamage(player.health + 16, player.origin);
    }

    circle delete();
}

// DOTN logic
detour mansion_boss_ww<scripts\zm\zm_mansion_boss_ww.gsc>::function_de60e752()
{
    level endon(#"hash_38f29f9cb03586ea", #"end_game", #"intermission", #"end_game");

    ShieldLog("^6DOTN Zombie Spawning -> Called");

    n_round = level.var_d6f059f7;
    a_s_spawnpoints = struct::get_array("boss_zombie_spawnpoint", "targetname");
    wait_time = 0.05;
    n_max_active_ai = 35;
    level.var_9eaf1031 = 0;
    level.var_83c0592c = 0;

    level thread DOTNTransformersLogic();
    s_zone = level.zones[#"zone_arena"];
    a_s_spawnpoints = struct::get_array(s_zone.name + "_spawns");
    a_s_spawnpoints = arraycombine(a_s_spawnpoints, struct::get_array(s_zone.name + "_spawner"), 0, 0);
    main_zones = getarraykeys(s_zone.adjacent_zones);

    foreach (str_zone in main_zones) 
    {
        if (isdefined(s_zone.adjacent_zones[str_zone]) && s_zone.adjacent_zones[str_zone].is_connected)
        {
            a_s_spawnpoints = arraycombine(a_s_spawnpoints, struct::get_array(str_zone + "_spawns"), 0, 0);
            a_s_spawnpoints = arraycombine(a_s_spawnpoints, struct::get_array(str_zone + "_spawner"), 0, 0);
        }
    }

    while (1) 
    {
        while (getaiteamarray(level.zombie_team).size >= n_max_active_ai)
            util::wait_network_frame();
        
        spawner = array::random(level.zombie_spawners);
        e_zombie = zombie_utility::spawn_zombie(spawner, spawner.targetname, undefined, n_round);
        wait(wait_time);
    }

    level notify(#"hash_71fd67248b9a37ca");
}

// speicals
detour mansion_boss_ww<scripts\zm\zm_mansion_boss_ww.gsc>::function_e9cc6379(hash, hash1 = 0)
{
    level endon(#"hash_38f29f9cb03586ea", #"spawn_zombies", #"end_game", #"intermission");

    ShieldLog("^6DOTN Specials Spawning -> Called");

    n_round = level.var_d6f059f7;
    var_574e94ee = struct::get_array(#"hash_49002dbb418e71a1");
    n_max_active_ai = 38;
    times_max = 15;
    times_n = 0;

    while (1) 
    {
        wait(randomfloatrange(5, 15));
        times = 0;
        while (times < times_max) 
        {
            while (getaiteamarray(level.zombie_team).size >= n_max_active_ai) 
            {
                util::wait_network_frame();
                level [[ @mansion_boss_ww<scripts\zm\zm_mansion_boss_ww.gsc>::boss_cleanup_zombie ]]();
            }

            ai_nosferatu = [[ @zm_ai_nosferatu<scripts\zm\ai\zm_ai_nosferatu.gsc>::function_74f25f8a ]](1, undefined, 1, n_round);
            if (isalive(ai_nosferatu)) 
            {
                ai_nosferatu.var_85480576 = 1;
                times++;
                wait(randomfloatrange(3, 6));
            }
        }

        nosferatus = getaiarchetypearray(#"nosferatu");
        checks = nosferatus.size;
        while (checks > 0) 
        {
            foreach (nosferatu in nosferatus) 
            {
                if (!isalive(nosferatu))
                    checks--;
            }
            util::wait_network_frame(2);
        }

        times_n++;
        if (hash1 > 0) 
        {
            if (!level flag::get(#"hash_f4dfa99c5e22bc6") && times_n >= hash1)
                level flag::set(#"hash_f4dfa99c5e22bc6");
            
            times_n = 0;
        }
        
        util::wait_network_frame();
    }
}

// werewolf
detour mansion_boss_ww<scripts\zm\zm_mansion_boss_ww.gsc>::function_29de7388()
{
    level endon(#"hash_38f29f9cb03586ea", #"spawn_zombies", #"end_game", #"intermission");

    ShieldLog("^6DOTN Werewolfs Spawning -> Called");

    n_max_active_ai = 35;
    times_max = 10;
    times = 0;

    while(times < times_max)
    {
        while (getaiteamarray(level.zombie_team).size >= n_max_active_ai) 
        {
            util::wait_network_frame();
            level [[ @mansion_boss_ww<scripts\zm\zm_mansion_boss_ww.gsc>::boss_cleanup_zombie ]]();
        }

        while (level.var_1821f542 >= 3)
        {
            util::wait_network_frame(2);
        }

        ai_werewolf = [[ @zombie_werewolf_util<script_387eab232fe22983.gsc>::function_47a88a0c ]](1, undefined, 1, undefined, level.var_d6f059f7);
        if (isdefined(ai_werewolf)) 
        {
            level.var_1821f542++;
            times++;
        }

        wait 2;
    }

    level flag::set(#"hash_67757a8cb27cb8aa");
}

// IX Logic
detour zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::boss_fight() // i honestly hate this retarded function
{
    ShieldLog("^1IX Boss Fight Function -> Called");
    level endon(#"end_game");
    level notify(#"hash_4a06aa98c6c7b671");

    [[ @zm_towers_crowd<scripts\zm\zm_towers_crowd.gsc>::function_5c1184e ]](0);
    [[ @zm_towers_crowd<scripts\zm\zm_towers_crowd.gsc>::function_aec5ec5a ]](1);

    func = @zm_towers_crowd<scripts\zm\zm_towers_crowd.gsc>::function_51ea46f3;
    array::thread_all(level.players, func, 0, 1);

    level.var_9a992b09 = 1;
    level.var_b2b15659 = 1;
    //level.powerup_vo_available = &return_false;

    /#
    level zm_audio::function_6191af93(#"general", #"gib", "", "");
    level zm_audio::function_6191af93(#"elixir", #"drink", "", "");
    level zm_audio::function_6191af93(#"blight_father", #"weak_points", "", "");
    level zm_audio::function_6191af93(#"catalyst_transform", #"react", "", "");
    level zm_audio::function_6191af93(#"catalyst_water", #"react", "", "");
    level zm_audio::function_6191af93(#"catalyst_electric", #"react", "", "");
    level zm_audio::function_6191af93(#"catalyst_plasma", #"react", "", "");
    level zm_audio::function_6191af93(#"catalyst_corrosive", #"react", "", "");
    level zm_audio::function_6191af93(#"catalyst_corrosive", #"react", "", "");
    level zm_audio::function_6191af93(#"kill", #"gladiator_destroyer", "", "");
    level zm_audio::function_6191af93(#"kill", #"gladiator_marauder", "", "");
    level zm_audio::function_6191af93(#"kill", #"tiger", "", "");
    level zm_audio::function_6191af93(#"gladiator_marauder", #"react", "", "");
    level zm_audio::function_6191af93(#"gladiator_destroyer", #"react", "", "");
    level zm_audio::function_6191af93(#"tiger", #"react", "", "");
    level zm_audio::function_6191af93(#"tiger", #"react", "", "");
    level.zmannouncervox[#"hash_5f0f1e699aa7e761"] = "";

    #/

    switch (level.players.size) 
    {
    case 1:
        level.var_ced6f061 = 12;
        break;
    case 2:
        level.var_ced6f061 = 15;
        break;
    case 3:
    case 4:
        level.var_ced6f061 = 18;
        break;
    }

    zombie_utility::set_zombie_var(#"zombie_powerup_drop_max_per_round", 9);
    level flag::set(#"hash_4f293396150d2c00");
    level [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_45ac4bb8 ]](1, 0);

    var_3a6fab91 = zm_round_spawning::function_f6cd912d();
    if (isdefined(var_3a6fab91))
        zm_round_spawning::function_d36196b1(var_3a6fab91.n_round);

    level thread [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_3a3bf6e8 ]]();
    zm_bgb_anywhere_but_here::function_886fce8f(0);
    level flag::set("pause_round_timeout");
    [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::pause_zombies ]](1);
    level flag::init("both_towers_bosses_killed");

    if (!getdvar(#"hash_2b64162aa40fe2bb", 0)) 
    {
        spawnerfunc = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_81c5a136;
        spawnerfunc2 = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_ef2a451c;

        [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_2a9ec1e9 ]]();
        zm_round_spawning::function_c1571721(spawnerfunc);
        zm_round_spawning::function_54fee373(spawnerfunc2); 
        level.var_153e9058 = 1;
        level.var_ff68dee = 0;
        level.var_1643d0d = arraycopy(level.var_3ecc60fc);
    }

    foreach (player in level.players)
        player clientfield::set_to_player("snd_crowd_react", 11);

    zm_zonemgr::enable_zone("zone_boss_battle");
    level thread [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_13576d14 ]]();

    dvartime = getdvar(#"hash_3065419bcba97739", 0);
    if (!dvartime)
        wait(8);
    
    if (getdvar(#"hash_2b64162aa40fe2bb", 0)) 
    {
        scene::play("p8_fxanim_zm_towers_boss_arena_gate_raise_bundle", "Shot 1");
        scene::play("p8_fxanim_zm_towers_boss_arena_gate_raise_bundle", "Shot 2");
        scene::play("p8_fxanim_zm_towers_boss_arena_gate_raise_bundle", "Shot 3");
    } 
    else
    {
        level thread [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_e9d463a0 ]]();
        level waittill(#"hash_12768f75609d32ca");
    }

    level clientfield::set("crowd_react_boss", 0);

    if (!dvartime)
        wait(6);

    level.var_ff68dee = 15;

    // THIS IS BAD!!!!!!!!!!! (changed it)
    funcsetup = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_f9da4403;
    loca = struct::get("towers_boss_location_1", "script_noteworthy");
    spawner_ab = getEntArray("zombie_towers_boss_spawner", "script_noteworthy"); // zombie_towers_boss2_spawner
    elephant_spawner = spawner_ab[level.ElephantsSpawned];
    trigger::wait_till("large_gate_l_trigger", "targetname");
    e_elephant = spawner::simple_spawn_single(elephant_spawner, funcsetup, loca, #"hash_266f53fb994e6120");

    while (!isdefined(e_elephant.ai.riders) || e_elephant.ai.riders.size < 2)
        wait(0.1);
    
    e_elephant thread [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_1a05e10c ]](#"towers_boss_ground_attack", #"m_quest", #"shockwave_warn");

    level.CurrentElephantNumber = 1;

    level util::delay(2, undefined, &clientfield::set, "crowd_react_boss", 1);
    level.var_3395fcab = 1;
    level thread [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_ae1cbf2e ]]();

    animfunc = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_a407b7bc;
    animation::add_global_notetrack_handler("tower_contact", animfunc, 0);
    e_elephant.takedamage = 0;
    scene::play(#"aib_vign_cust_zm_twrs_ent_hllpht_00", array(e_elephant));
    e_elephant.takedamage = 1;
    e_elephant notify(#"entrace_done");

    funcsetplayer = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_3d487e02;
    level thread [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_4d682898 ]]();
    level thread [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_92e1954c ]]();
    level thread [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_1a05e10c ]](#"hash_5c38f322b9e6a58d", #"m_quest", #"missile_warn");
    level thread [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_1a05e10c ]](#"hash_1a3fb5566689f319", #"m_quest", #"missile_track");
    level thread [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_1a05e10c ]](#"hash_1580cd3b2c801f46", #"m_quest", #"charge_warn");
    level thread [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_c64fc074 ]]();
    level thread [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_95785950 ]](45, level.var_49328379, #"armor_nag", #"hash_634700dd42db02d8");
    level thread [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_95785950 ]](90, level.var_8b66546e, #"basket_nag", #"hash_634700dd42db02d8");
    array::thread_all(level.players, funcsetplayer);
    wait(2);

    [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_14833fc2 ]]();
    if (!getdvar(#"hash_2b64162aa40fe2bb", 0)) 
    {
        [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::pause_zombies ]](0);
        level flag::set(#"infinite_round_spawning");
    }
    e_elephant waittill(#"death");

    [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::pause_zombies ]](1, 0);
    foreach (player in level.players)
        player clientfield::set_to_player("snd_crowd_react", 13);
    
    wait(1);
    level thread [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_e50623f ]]();
    wait(15);
    [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_14833fc2 ]]();
    trigger::wait_till("large_gate_r_trigger", "targetname");
    level notify(#"hash_5d826e11ebe4b6e7");
    level.var_a52a5487 = 1;

    loca = struct::get("towers_boss_location_2", "script_noteworthy");
    sp_spawner = getent("zombie_towers_boss2_spawner", "script_noteworthy");
    e_elephant = spawner::simple_spawn_single(sp_spawner, funcsetup, loca, #"hash_266f56fb994e6639");
    e_elephant thread [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_1a05e10c ]](#"towers_boss_ground_attack", #"m_quest", #"shockwave_warn");

    while (!isdefined(e_elephant.ai.riders) || e_elephant.ai.riders.size < 4)
        wait(0.1);

    level.CurrentElephantNumber = 2;

    foreach (player in level.players)
        player clientfield::set_to_player("snd_crowd_react", 12);
    
    animfunc2 = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_b2e7b40d;
    animation::add_global_notetrack_handler("tower_contact_2", animfunc2, 0);
    
    level scene::play("p8_fxanim_zm_towers_boss_arena_gate_destroy_bundle", "shot 1");
    e_elephant notify(#"hash_6537a2364ba9dcb3");
    level thread scene::play("p8_fxanim_zm_towers_boss_arena_gate_destroy_bundle", "shot 2");
    e_elephant.takedamage = 0;
    scene::play(#"aib_vign_cust_zm_twrs_ent_hllpht_01", array(e_elephant));
    e_elephant.takedamage = 1;
    e_elephant notify(#"entrace_done");
    level.var_3395fcab = 2;
    level thread [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_4550c346 ]]();
    wait(2);

    if (!getdvar(#"hash_2b64162aa40fe2bb", 0)) 
    {
        [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::pause_zombies ]](0);
        level flag::set(#"infinite_round_spawning");
        level.var_153e9058 = 0;
    }

    //level flag::wait_till("both_towers_bosses_killed");
    //e_elephant waittill(#"death"); // instead
    level waittill(#"eleph_dead");

    level.var_2d744147 = gettime();
    [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::pause_zombies ]](1, 0);
    level flag::clear(#"infinite_round_spawning");

    foreach (player in level.players)
        player clientfield::set_to_player("snd_crowd_react", 13);
    
    level notify(#"boss_battle_done");

    callfunc = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_d4e923e7;
    callback::remove_on_spawned(callfunc);
}

detour zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_e9d463a0()
{
    level endon(#"hash_12768f75609d32ca");

    ShieldLog("^2IX Spawning -> Called");

    level.var_263754a7 = randomintrangeinclusive(9, 20);
    n_wait_amount = 0.3;
    level thread [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_b3e0a008 ]]();
    wait 10;

    func = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_2e309b5c;
    callback::on_ai_killed(func);

    level clientfield::set("crowd_react_boss", 1);
    foreach (player in level.players) 
    {
        player clientfield::set_to_player("snd_crowd_react", 12);
        player [[ @zm_towers_challenges<scripts\zm\zm_towers_challenges.gsc>::function_fd8a137e ]]();
    }

    level thread scene::play("boss_battle_tempo", "targetname");
    level thread [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_432247a7 ]]();
    [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_c84b435 ]]();
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
        if (level flag::get(#"hash_353dcb95f778ad73")) 
            n_toggle = randomintrangeinclusive(0, 2);
        else 
            n_toggle = randomintrangeinclusive(0, 1);
        
        while (getaiteamarray(level.zombie_team).size >= 28) 
            util::wait_network_frame();
        
        switch (n_toggle) 
        {
            case 0:
            spawn_zones = array::random(s_zones);
            level thread [[ @zombie_gladiator_util<script_684097158a90b5c3.gsc>::function_69f309b ]](1, "melee", undefined, 1, spawn_zones, 255);
            break;

            case 1:
            spawn_zones = array::random(s_zones);
            level thread [[ @zombie_gladiator_util<script_684097158a90b5c3.gsc>::function_69f309b ]](1, "ranged", undefined, 1, spawn_zones,255);
            break;

            case 2:
            for (i = 0; i < 8; i++) 
            {
                spawn_zones = [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_30868c0b ]](a_s_spawners, "tiger_location");
                tiger_zones = getspawnerarray("zombie_spawner_tiger", "targetname")[0];
                ai = undefined;
                while (!isdefined(ai)) 
                {
                    ai = zombie_utility::spawn_zombie(tiger_zones, "boss_filler", spawn_zones, 255);
                    waitframe(1);
                }

                wait(0.5);
                s_teleport = array::random(struct::get_array("boss_temp_gate_tele", "targetname"));
                ai forceteleport(s_teleport.origin);
            }
            break;

            default:
            break;
        }
        wait(n_wait_amount);
    }
}

// Stop Endgame here
// IX
detour zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::end_game()
{
    ShieldLog("^6IX EndGame Scene -> Stopped");

    //level notify(#"end_game");
    level thread StopEndGame(true);

    // needed
    LUINotifyEvent(#"rush_boss", 1, 0);
    LUINotifyEvent(#"rush_boss_box", 1, 0);
    LUINotifyEvent(#"rush_boss_health", 1, 0);
}

// DOTN
detour zm_mansion<scripts\zm\zm_mansion.gsc>::play_outro_igc()
{
    ShieldLog("^6DOTN EndGame Scene -> Stopped");

    setdvar(#"hash_44340be18f159be3", 0);
    func = @zm_mansion<scripts\zm\zm_mansion.gsc>::function_7f493481;
    level.var_ea32773 = func;

    level thread scene::init_streamer(#"cin_zm_mansion_outro_butler", #"allies", 0, 0);
    func1 = @zm_mansion<scripts\zm\zm_mansion.gsc>::function_8b76623;
    func2 = @zm_mansion<scripts\zm\zm_mansion.gsc>::function_9419b975;
    func3 = @zm_mansion<scripts\zm\zm_mansion.gsc>::function_4e94caa8;
    func4 = @zm_mansion<scripts\zm\zm_mansion.gsc>::function_34273b53;
    func5 = @zm_mansion<scripts\zm\zm_mansion.gsc>::function_f996845d;
    scene::add_scene_func(#"cin_zm_mansion_outro_butler", func1, "play");
    scene::add_scene_func(#"cin_zm_mansion_outro_butler", func2, "sh195");
    scene::add_scene_func(#"cin_zm_mansion_outro_butler", func3, "sh240");
    scene::add_scene_func(#"cin_zm_mansion_outro_exit_mansion", func4, "play");
    scene::add_scene_func(#"cin_zm_mansion_outro_car_chase", func5, "play");
    
    foreach (e_player in util::get_active_players()) 
    {
        if (e_player laststand::player_is_in_laststand())
         e_player thread zm_laststand::auto_revive(e_player, 0, 0);
    }
      
    //e_player freezecontrols(1);
    //e_player.var_16735873 = 1;
    //e_player val::set(#"outro", "takedamage", 0);
    //e_player val::set(#"outro", "ignoreme", 1);
    //e_player notify(#"bgb_update");
    //function_b7f33afa();

    //level flag::clear("spawn_zombies");
    //level flag::set(#"pause_round_timeout");

    level lui::screen_fade_out(1.1, "white");
    //level util::delay(1.6, "end_game", &zm_utility::function_9ad5aeb1, 0, 0, 1, 0, 0);

    wait 1.6;
    level thread [[ @zm_mansion<scripts\zm\zm_mansion.gsc>::function_5bfd87e9 ]](); // return logic

    if (!isdefined(level.e_scarlett)) // spawn it
        level.e_scarlett = util::spawn_anim_model(#"hash_68e43aaeda249da8");
    
    level.e_scarlett.targetname = "mansion_hero";
    level.e_scarlett hide();

    level zm_vo::function_3c173d37((0, 0, 0), 2147483647);
    level zm_audio::sndvoxoverride(1);

    clientfield::set("" + #"hash_7fcdc47572bdbafa", 1);
    //hidemiscmodels("end_igc");
    zombie_utility::clear_all_corpses();
    util::set_lighting_state(0);

    level zm_utility::create_streamer_hint((-100, -26800, -5550), (12, -39, 0), 1, 180);
    scene::play(#"cin_zm_mansion_outro_butler");
    scene::play(#"cin_zm_mansion_outro_exit_mansion");
    scene::play(#"cin_zm_mansion_outro_car_chase");
    scene::play(#"cin_zm_mansion_outro_aftermath");

    level thread StopEndGame(true);
    //level notify(#"end_game");
}

// AE
detour zm_red<scripts\zm\zm_red.gsc>::play_outro()
{
    ShieldLog("^6AE EndGame Scene -> Stopped");

    /#
    foreach (player in getplayers()) 
    {
        if (isdefined(player))
            player disableweaponfire();

        if (player clientfield::get("" + #"hash_9d9fb6cf3d5d3a6"))
            player clientfield::set("" + #"hash_9d9fb6cf3d5d3a6", 0);
    }
    #/
    [[ @namespace_c8efdadc<script_6c983b627f4a3d51.gsc>::function_53bac096 ]](1);

    foreach (e_player in util::get_active_players()) 
    {
        //e_player val::set(#"outro", "freezecontrols", 1);
        //e_player.var_16735873 = 1;
        if (e_player laststand::player_is_in_laststand())
            e_player thread zm_laststand::auto_revive(e_player, 0, 0);

        //e_player val::set(#"outro", "takedamage", 0);
        //e_player val::set(#"outro", "ignoreme", 1);
        //e_player notify(#"bgb_update");
    }
    /#
        zm_devgui::zombie_devgui_open_sesame();
    #/
    level zm_vo::function_3c173d37((0, 0, 0), 2147483647);
    level zm_audio::sndvoxoverride(1);
    zombie_utility::clear_all_corpses();
    util::set_lighting_state(0);

    scene::play(#"cin_zm_red_outro_temple");
    scene::play(#"cin_zm_red_outro_temple_part2");
    scene::play(#"hash_29e068a70818e3dc");
    scene::play(#"hash_29e067a70818e229");
    level scene::function_f81475ae(#"hash_29e067a70818e229");

    foreach (player in getplayers())
     player enableweaponfire();

    level thread StopEndGame(true);
    //level notify(#"end_game");
}

// AE again -> had to detour another one thanks to fucking treyarch (added two notifies for endgame flag)
detour red_boss_battle<scripts\zm\zm_red_boss_battle.gsc>::function_ce82050b()
{
    ShieldLog("^6AE EndGame Scene -> Stopped (Boss Function)");

    level flag::set(#"boss_battle_complete");
    if (zm_utility::is_trials())
        return;

    //level [[ @zm_red<scripts\zm\zm_red.gsc>::play_outro ]](); -> DOES NOT WORK (orignal one will be called instead...)
    level MainAESceneFunction();

    //level notify(#"end_game");
}

// VOD
detour zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::end_game()
{
    ShieldLog("^6VOD EndGame Scene -> Stopped");

    //level notify(#"end_game");
    level thread StopEndGame(true);
}

// AO
detour zm_white_main_quest<scripts\zm\zm_white_main_quest.gsc>::play_outro()
{
    ShieldLog("^6AO EndGame Scene -> Stopped");

    exploder::exploder_stop("fxexp_nuke_event");
    level exploder::stop_exploder("fxexp_script_power_on");
    level exploder::stop_exploder("fxexp_script_power_on_bunker");
    exploder::stop_exploder("fxexp_script_power_on_lgt_exterior");
    waitframe(1);
    exploder::stop_exploder("fxexp_script_power_on_lgt_house_green");
    waitframe(1);
    exploder::stop_exploder("fxexp_script_power_on_lgt_house_hammond");
    waitframe(1);
    exploder::stop_exploder("fxexp_script_power_on_lgt_house_hoggatt");
    waitframe(1);
    exploder::stop_exploder("fxexp_script_power_on_lgt_house_obrien");
    waitframe(1);
    exploder::stop_exploder("fxexp_script_power_on_lgt_house_red");
    waitframe(1);
    exploder::stop_exploder("fxexp_script_power_on_lgt_house_reinsel");
    level.var_1fff8fd2 stoploopsound();
    waitframe(1);
    exploder::stop_exploder("fxexp_script_power_on_lgt_house_shed");
    waitframe(1);
    exploder::stop_exploder("fxexp_script_power_on_lgt_house_yellow");
    waitframe(1);

    [[ @zm_white<scripts\zm\zm_white.gsc>::function_4f60590c ]]();
    [[ @zm_white_special_rounds<scripts\zm\zm_white_special_rounds.gsc>::function_217e3c0f ]]();

    level exploder::stop_exploder("fxexp_power_on");
    level zm_vo::function_3c173d37((0, 0, 0), 2147483647);
    level zm_audio::sndvoxoverride(1);

    level thread lui::play_movie(#"zm_white_outro", "fullscreen", 1, 0, 0, #"hash_c210390aecd8cc", 157, 0);
    level waittill(#"movie_done");

    level thread StopEndGame(true);
    //level notify(#"end_game");
}

// Tag
detour zm_orange_mq_mgr<scripts\zm\zm_orange_mq_mgr.gsc>::function_895265b1(hash, ended_early)
{
    hash3A = isdefined(hash) ? hash : "undefined..";
    ended_earlyA = isdefined(ended_early) ? ended_early : "undefined..";
    
    ShieldLog("^6Tag EndGame Scene -> Stopped ->" + hash3A + " -> " + ended_earlyA); 
    // should be always defined from -> [[ @zm_sq ]] // <- never fucking mind then

    [[ @zm_orange_trophies<scripts\zm\zm_orange_trophies.gsc>::function_ea67bd7c ]]();
    level.var_9441bf02 delete();
    level.musicsystemoverride = 0;
    music::setmusicstate("none");
    wait 2;
    
    level thread StopEndGame(true);
    //level notify(#"end_game");
}

// Blood <- oops i forgot about it lol
detour paschal<scripts\zm\zm_escape_paschal.gsc>::play_outro()
{
    ShieldLog("^6BOTD EndGame Scene -> Stopped"); 

    level zm_vo::function_3c173d37((0, 0, 0), 2147483647);
    level zm_audio::sndvoxoverride(1);
    level scene::play(#"hash_641ed02ad1d85897");

    foreach (e_player in util::get_players())
    {
        e_player clientfield::set("" + #"hash_b8601726e1e4a6a", 0);
        level.var_7c7c6c35 zm_game_over::set_state(e_player, #"gatewayopened"); 
        // had it in #include... (script_190d6b82bcca0908 -> zm_game_over)
    }
    level thread StopEndGame(true);
    //level notify(#"end_game");
}


#endif