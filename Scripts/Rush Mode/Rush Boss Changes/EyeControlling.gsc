EyeControlMenu(id)
{
    level endon(#"StopEyeDuck");

    if(BO4GetMap() == "Voyage")
    {
        if(!isDefined(level.e_boss.var_6efcc8c1))
        {
            level.e_boss.var_6efcc8c1 = 0;
            level.e_boss.var_6efcc8c1 = 0;
            level.e_boss.var_18acfe18 = 0;
            level.e_boss.var_57badb98 = 0;
            level.e_boss.var_914750d = 0; // causes issues with bm attack..
            level.e_boss.var_19261dce = 1;
            level.e_boss.var_c962047c = -1;
            level.e_boss.var_59cdb7b9 = 49000; // normal att
            level.e_boss.var_f881e30f = 52000; // wipe
            level.e_boss.var_ba36376c = 5 * 16500;
            level.e_boss.var_7954bf70 = 5 * 19000;
            level.e_boss.var_6a30a892 = 8 * 40000 / 4;

            level.e_boss [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_5e792125 ]]();
        }
        
        switch(id)
        {
            case 1:
            level.e_boss Eye_DoWhiteAttack();
            break;

            case 2:
            level.e_boss Eye_DoCombo();
            break;

            case 3:
            level.e_boss Eye_DoBM();
            break;
            
            case 4:
            level.e_boss Eye_DoMST();
            break;

            case 5:
            level.e_boss EyeBossMove();
            break;

            case 6:
            level.e_boss EyeBossArrive();
            break;

            case 7:
            level.e_boss EyeBossLeave();
            break;
        }
    }
    else
    {
        self iPrintLnBold("^5 Can't find level.e_boss!");
    }
}

// beam
SetupOrMoveEyeBeam(v_loc, n_time)
{
    level endon(#"hash_14400d2bff068132", #"intermission");

    n_timeA = isdefined(n_time) ? "Time Array" : "undefined.."; // oops

    ShieldLog("^2Eye Debug: Beam Attack Called -> " + v_loc + " -> " + n_timeA);

    if (!isdefined(self.current_beam)) 
    {
        self.current_beam = util::spawn_model("tag_origin", v_loc);
        util::wait_network_frame(4);
        self.current_beam clientfield::set("bs_att_bm_targ_ini_cf", 1);
        util::wait_network_frame(4);
    }

    if (isdefined(n_time)) 
    {
        self.current_beam moveto(v_loc, n_time);
        wait(n_time);
        return;
    }

    self.current_beam.origin = v_loc;
}

SetupEyeBeemMoving(n_paths, hash, hash2)
{
    level endon(#"hash_14400d2bff068132", #"intermission");

    ShieldLog("^2Eye Debug: Beam Setup Called -> " + n_paths + " -> " + hash + " -> " + hash2);

    dist_array = [];
    dist_time = 0;
    a_path = arraycopy(self.var_3c63665[n_paths]);

    var_d9ad5cc8 = a_path[0];
    while (isdefined(var_d9ad5cc8.linkto)) 
    {
        var_cd22b387 = var_d9ad5cc8.origin;
        var_d9ad5cc8 = struct::get(var_d9ad5cc8.linkto, "linkname");
        n_dist = distance(var_d9ad5cc8.origin, var_cd22b387);
        dist_time = dist_time + n_dist;
        if (!isdefined(dist_array)) {
            dist_array = [];
        } else if (!isarray(dist_array)) {
            dist_array = array(dist_array);
        }
        dist_array[dist_array.size] = n_dist;
    }

    a_n_times = [];
    if (hash2)
        n_total_time = 2;
    else if (hash)
        n_total_time = 7.5;
    else
        n_total_time = 9;

    for (i = 0; i < dist_array.size; i++) 
    {
        n_time = n_total_time * dist_array[i] / dist_time;
        
        if (!isdefined(a_n_times))
            a_n_times = [];
        else if (!isarray(a_n_times))
            a_n_times = array(a_n_times);
        
        a_n_times[a_n_times.size] = n_time;
    }

    for (i = 1; i < a_path.size; i++)
        self SetupOrMoveEyeBeam(a_path[i].origin, a_n_times[i - 1]); // self instead
}

// beam tracking
TrackCurrentBeam(hash, hash2 = 0) // worst code i have ever fucking seen
{
    level endon(#"hash_14400d2bff068132", #"intermission");
    ShieldLog("^2Eye Debug: Beam Tracking Called -> " + hash + " -> " + hash2);

    self endon(#"hash_2bb8be6b846aed93");

    while (true)
    {
        v_source = self gettagorigin("tag_fx_beam");
        v_target = self.current_beam.origin; // self instead..
        a_beamtrace = beamtrace(v_source, v_target, 0, self, 1, 1);
        dist = distance(v_source, a_beamtrace[#"position"]);
        unused_var = dist * dist; // why is this unused???
        
        a_players = array::get_all_closest(v_source, level.players, undefined, undefined, dist);
        if (a_players.size <= 0) 
        {
            foreach (player in level.players) 
            {
                player notify(#"hash_27a44c71de4b4cb8");
                player.var_39ef0b7f = 0;
            }
            util::wait_network_frame();
            continue;
        }

        // idk what the fuck is this shit
        bad_code = [];
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_helmet";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_head";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_neck";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_spine_upper";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_spine_lower";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_shoulder_le";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_shoulder_ri";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_spine4";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "tag_aim";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_elbow_le";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_elbow_ri";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_wrist_le";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_wrist_ri";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_hiptwist_le";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_hiptwist_ri";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_knee_bulge_le";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_knee_bulge_ri";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_ankle_le";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_ankle_ri";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_ball_le";
        if (!isdefined(bad_code)) {
            bad_code = [];
        } else if (!isarray(bad_code)) {
            bad_code = array(bad_code);
        }
        bad_code[bad_code.size] = "j_ball_ri";
        
        players_hits = [];
        foreach (player in a_players) 
        {
            if (zm_utility::is_player_valid(player) && !player issliding()) 
            {
                cent_d = player getcentroid();
                v_player_origin = player getorigin();
                unused_var1 = distancesquared(v_source, cent_d); // unused again..
                unused_var2 = distancesquared(v_source, v_player_origin);
                point1 = pointonsegmentnearesttopoint(v_source, v_target, cent_d);
                point2 = pointonsegmentnearesttopoint(v_source, v_target, v_player_origin);
                b_is_valid_target = 0;

                if (distancesquared(cent_d, point1) <= 324 || distancesquared(v_player_origin, point2) <= 324)
                    b_is_valid_target = 1;
                else 
                {
                    foreach (str_tag in bad_code) 
                    {
                        v_hitloc = player gettagorigin(str_tag);
                        if (isdefined(v_hitloc)) 
                        {
                            point3 = pointonsegmentnearesttopoint(v_source, v_target, v_hitloc);
                            temp_dist = distancesquared(v_hitloc, point3);
                            if (distancesquared(v_hitloc, point3) <= 324) 
                            {
                                b_is_valid_target = 1;
                                break;
                            }
                        }
                    }
                }
            }

            if (isdefined(b_is_valid_target) && b_is_valid_target) 
            {
                if (!isdefined(players_hits))
                    players_hits = [];
                else if (!isarray(players_hits))
                    players_hits = array(players_hits);
                
                players_hits[players_hits.size] = player;
            }
        }
        if (players_hits.size > 0) 
        {
            foreach (player in players_hits) 
            {
                if (!zm_utility::is_player_valid(player)) 
                    continue;
                
                if (isdefined(player)) 
                {
                    if (hash2) 
                    {
                        if (!(isdefined(player.var_13e995b6) && player.var_13e995b6)) 
                            player thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_d8d597c ]]();
                        
                        util::wait_network_frame();
                        continue;
                    }
                    if (!(isdefined(player.var_39ef0b7f) && player.var_39ef0b7f)) 
                    {
                        player.var_39ef0b7f = 1;
                        player thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_583f7d85 ]](hash);
                    }
                    player thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_c542a237 ]]();
                }
            }
        }
        util::wait_network_frame();
    }
}

Eye_DoWhiteAttack()
{
    level endon(#"hash_25d8c88ff3f91ee5");
    level endon(#"StopEyeDuck");
    level endon(#"hash_38f29f9cb03586ea");

    function_1acc1d3 = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_1acc1d3; // attack boss stuff
    function_5e792125 = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_5e792125; // attack boss stuff

    if (!isdefined(function_1acc1d3) || self.var_6efcc8c1 == 3)
    {
        self iPrintLnBold("^1Can't find it noob! ");
        return;
    }

    self thread [[ function_5e792125 ]]();
    self thread [[ function_1acc1d3 ]]();
}

Eye_DoCombo()
{
    level endon(#"hash_25d8c88ff3f91ee5");
    level endon(#"StopEyeDuck");
    level endon(#"hash_38f29f9cb03586ea");

    function_371e0929 = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_371e0929; // attack boss stuff
    function_5e792125 = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_5e792125; // attack boss stuff

    if (!isdefined(function_371e0929) || self.var_6efcc8c1 == 3)
    {
        self iPrintLnBold("^1Can't find it noob! ");
        return;
    }

    self thread [[ function_5e792125 ]]();
    self thread [[ function_371e0929 ]]();
}

Eye_DoBM()
{
    level endon(#"hash_25d8c88ff3f91ee5");
    level endon(#"StopEyeDuck");
    level endon(#"hash_38f29f9cb03586ea");

    function_c7c928e9 = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_c7c928e9; // attack boss stuff
    function_5e792125 = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_5e792125; // attack boss stuff

    if (!isdefined(function_c7c928e9) || self.var_6efcc8c1 == 3)
    {
        self iPrintLnBold("^1Can't find it noob! ");
        return;
    }

    self thread [[ function_5e792125 ]]();
    self thread [[ function_c7c928e9 ]]();
}

Eye_DoMST()
{
    level endon(#"hash_25d8c88ff3f91ee5");
    level endon(#"StopEyeDuck");
    level endon(#"hash_38f29f9cb03586ea");

    function_ff69c896 = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_ff69c896; // attack boss stuff
    function_5e792125 = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_5e792125; // attack boss stuff

    if (!isdefined(function_ff69c896) || self.var_6efcc8c1 == 3)
    {
        self iPrintLnBold("^1Can't find it noob! ");
        return;
    }

    self thread [[ function_5e792125 ]]();
    self thread [[ function_ff69c896 ]]();
}

DoSoundEye()
{
    level endon(#"hash_25d8c88ff3f91ee5");
    level endon(#"StopEyeDuck");
    level endon(#"hash_38f29f9cb03586ea");

    switch(randomIntRange(1, 6))
    {
        case 1:
        level.e_boss playsound(#"hash_6040f3b85932670c");
        break;

        case 2:
        level.e_boss playsound(#"hash_2af120dbf3e870e8");
        break;

        case 3:
        level.e_boss playsound(#"zmb_eyeball_vox_intro_s3");
        break;

        case 4:
        level.e_boss playsound(#"zmb_eyeball_swrath_burst");
        break;

        case 5:
        level.e_boss playsound(#"zmb_eyeball_vox_outro_s4");
        break;
    }
}

StopEyeVarsWipe(str)
{
    ShieldLog("^3Eye Debug: Endoncallback Called -> " + level.EyeWipeCurrent);

    level.EyeWipeCurrent = false;
    level.EyeDoingAttack = false;

    ShieldLog("^2Eye Debug: LUI Wipe Attack -> " + level.EyeWipeCurrent);
}

SpawnEyeLooking(Cords, Angles) // move already "spawned" eye
{
    //level.e_boss.var_451ab1a6 = 0;

    level.e_boss.origin = Cords;
    level.e_boss.angles = Angles;

    // csc error - unmatching types <- too early
    level flag::wait_till("all_players_spawned");
    level.e_boss [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_500cb0be ]](#"hash_678aaf8e37498e9a", #"p8_fxanim_zm_zod_eye_01_bundle");
    level.e_boss [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::boss_arrive ]]();

    level.e_boss animation::stop(0);
    level.e_boss thread scene::play(level.e_boss.str_scene, level.e_boss.str_idle, level.e_boss); // idle anim

    while(!level.PickedOption)
        wait 1;

    level.e_boss animation::stop(0);
    level.e_boss [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::boss_leave ]](0); // 0 -> ghost();
}

SpawnEyeCustom(Cords, Angles, levelvar = false) // custom one
{
    CustomEye = util::spawn_model(#"tag_origin", Cords, Angles);
    CustomEye enablelinkto();
    CustomEye notsolid();
    CustomEye hide();

    CustomEye.e_damage = util::spawn_model(#"tag_origin", Cords, Angles);
    CustomEye.e_damage.takedamage = 1;
    CustomEye.e_damage function_2baad8fc(); // engine func hashed
    CustomEye.e_damage.var_6f84b820 = #"boss";
    CustomEye.e_damage enablelinkto();
    CustomEye.e_damage linkto(CustomEye);
    CustomEye.e_damage notsolid();

    CustomEye.var_451ab1a6 = 0;

    CustomEye.origin = Cords;
    CustomEye.angles = Angles;

    if(levelvar)
     level.Custom_Eyes[level.Custom_Eyes.size] = CustomEye;

    // unmatching types if not!
    CustomEye.str_scene = #"p8_fxanim_zm_zod_eye_01_bundle"; // for the debug func
    CustomEye.var_6efcc8c1 = 0;
    CustomEye.var_18acfe18 = 0;
    CustomEye.var_57badb98 = 0;
    CustomEye.var_914750d = 0; // causes issues with bm attack..
    CustomEye.var_c962047c = -1;
    CustomEye.var_59cdb7b9 = 49000; // normal att
    CustomEye.var_f881e30f = 52000; // wipe
    CustomEye.var_ba36376c = 5 * 16500;
    CustomEye.var_7954bf70 = 5 * 19000;
    CustomEye.var_6a30a892 = 8 * 40000 / 4;

    // setmodel and clientfields here
    CustomEye [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_500cb0be ]](#"hash_678aaf8e37498e9a", #"p8_fxanim_zm_zod_eye_01_bundle");

    // this func is used for defining messing vars, probably debug
    CustomEye thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_5e792125 ]]();

    CustomEye thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_71f63a19 ]]("pd"); // first phase areas for attack
    CustomEye thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_1b11b43 ]]("pd"); // other ones needed (array of locations)
    CustomEye thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_a55a0339 ]]("pd");

    array_nothing = [];
    CustomEye thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_bb612e31 ]](array_nothing, 0, -1);

    CustomEye [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::boss_arrive ]]();
    CustomEye show();
    CustomEye animation::stop(0);
    CustomEye thread scene::play(CustomEye.str_scene, CustomEye.str_idle, CustomEye); // idle anim
}

CheckEyeAttacking() 
{
    ShieldLog("^2Eye Debug: Attack Timer -> Called");

    if(self == level.e_boss) // already gets it in another func...
    {
        ShieldLog("^1Eye Debug: Attack Timer -> Returned....");
        return;
    }

    wait self.AttackTiming;
    self [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_26e02ac9 ]](0);
    self clientfield::set("bs_att_bm_tell_fx_cf", 0);
    self clientfield::set("bs_att_bm_cf", 0);
    self clientfield::set("bs_att_mst_tell_cf", 0);
    self notify(#"hash_2bb8be6b846aed93");
}

SetUpEyeAttack(hash, hash2, hash3)
{
    level endon(#"hash_14400d2bff068132", #"intermission");

    self thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_7e30d4b5 ]](); // self instead

    main_path = [];

    if (isdefined(hash3))
        n_path = hash3;
    else if (self.var_e6621b81.size > 0)
        n_path = self [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_5382ba1b ]](self.var_e6621b81);
    else
        n_path = randomint(self.var_3c63665.size);
    
    main_path = self.var_3c63665[n_path];
    self thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_c48e93c1 ]](n_path);

    pathing = main_path[0].script_int;
    self [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::boss_move ]](pathing);
    
    if (hash)
        self thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_3d6eaad5 ]]();
    else if (!hash2)
        self thread [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_bb528a4b ]]();
    
    self [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_d07ce2a9 ]](n_path, hash, hash2);
}

EyeResetFx()
{
    level endon(#"intermission");
    ShieldLog("^2Eye Debug: Check Fxs -> Called");

    if(self == level.e_boss)
    {
        ShieldLog("^1Eye Debug: Check Fxs -> Returned....");
        return;
    }

    self endon(#"death");

    wait self.AttackTiming;

    self clientfield::set("bs_att_blst_tll", 0);
    exploder::exploder_stop("fxexp_be_f_ovf_b");
    exploder::exploder_stop("fxexp_be_f_a");
    exploder::exploder_stop("fxexp_be_f_b");
    exploder::exploder_stop("fxexp_be_f_c");

    self [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_26e02ac9 ]](0);
    self animation::stop(0);
    self stopsound("zmb_eyeball_swrath_charge");

    wait 1;
    self clientfield::set("bs_att_blst", 0);
}

RandomAttackTimeing()
{
    level endon(#"hash_25d8c88ff3f91ee5");
    level endon(#"StopEyeDuck");
    self endon(#"death");

    while(true)
    {
        self.AttackTiming = randomFloatRange(8, 16);
        wait 15;
    }
}

RandomEyeAttack()
{
    if (level flag::get(#"hash_bd3b222f6d8329d") && self == level.e_boss) // phase 4 no need
     return;

    if(level flag::get(#"hash_bd3b222f6d8329d") && !level flag::get(#"hash_50113a36d2c6bb73"))
    {
        self [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_71f63a19 ]]("pro"); // fourth phase areas for attack
        self [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_1b11b43 ]]("pro"); // other ones needed (array of locations)
        self [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_a55a0339 ]]("pro");

        RandomChanceEye = RandomIntRange(0, 2);
        switch(RandomChanceEye)
        {
            case 0: // combo attack
            self thread DoSoundEye();
            self thread Eye_DoCombo();
            wait 1.5;
            self EyeRandomMove(true);
            break;

            case 1: // bm attack
            self thread DoSoundEye();
            self thread Eye_DoBM();
            self EyeRandomMove(true);
            break;

            default:
            foreach(player in level.players) 
            player iPrintLnBold("what the fuck?");
            break;
        }
    }
    else
    {
        self [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_71f63a19 ]]("pd"); // first phase areas for attack
        self [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_1b11b43 ]]("pd"); // other ones needed (array of locations)
        self [[ @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_a55a0339 ]]("pd");

        RandomChanceEye = RandomIntRange(0, 4);
        switch(RandomChanceEye)
        {
            case 0: // combo attack
            self thread DoSoundEye();
            self thread Eye_DoCombo();
            wait 1.5;
            self EyeRandomMove();
            break;

            case 1: // bm attack
            self thread DoSoundEye();
            self thread Eye_DoBM();
            self EyeRandomMove();
            break;

            case 2: // eye go crazy
            self thread DoSoundEye();
            self thread Eye_DoBM();
            self thread FakeWhiteAttack();
            self thread EyeGoCrazy();
            break;

            case 3: // wipe
            if(self != level.e_boss) // you can't damage the custom eyes, so no
            break;
            
            self thread Eye_DoWhiteAttack();
            break;

            default:
            foreach(player in level.players) 
            player iPrintLnBold("what the fuck?");
            break;
        }
    }
}

EyeRandomMove(b_bool = false)
{
    RandomMove = self GetEyeRandomMove(b_bool);
    self thread EyeMoveFunction(RandomMove, self.EyeAngles);
}

GetEyeRandomMove(PhaseFour = false)
{
    if(PhaseFour)
    {
        switch(randomIntRange(1, 9))
        {
            case 1:
            self.EyeAngles = (0, 0, 0);
            return (-2086, 249, 2039);
            break;

            case 2:
            self.EyeAngles = (0, 0, 0);
            return (-1928, 861, 1969);
            break;

            case 3:
            self.EyeAngles = (0, 0, 0);
            return (-1417, 1494, 1655);
            break;

            case 4:
            self.EyeAngles = (0, 0, 0);
            return (-1579, -5, 1305);
            break;

            case 5:
            self.EyeAngles = (0, 0, 0);
            return (-1947, 1688, 1759);
            break;

            case 6:
            self.EyeAngles = (0, 0, 0);
            return (-1936, 1249, 1194);
            break;

            case 7:
            self.EyeAngles = (0, 0, 0);
            return (-1691, 356, 1407);
            break;

            case 8:
            self.EyeAngles = (0, 0, 0);
            return (-1614, 2134, 1395);
            break;

            default:
            self.EyeAngles = (0, 0, 0);
            return (0, 0, 0);
            break;
        }
    }
    else
    {
        switch(randomIntRange(1, 11))
        {
            case 1:
            self.EyeAngles = (0, 90, 0);
            return (429, 3667, 1324);
            break;

            case 2:
            self.EyeAngles = (0, 90, 0);
            return (-409, 3693, 1326);
            break;

            case 3:
            self.EyeAngles = (0, 0, 0);
            return (-697, 4658, 1365);
            break;

            case 4:
            self.EyeAngles = (0, 180, 0);
            return (795, 4549, 1459);
            break;

            case 5:
            self.EyeAngles = (0, -50, 0);
            return (-515, 5535, 1394);
            break;

            case 6:
            self.EyeAngles = (0, -135, 0);
            return (454, 5332, 1283);
            break;

            case 7:
            self.EyeAngles = (0, 35, 0);
            return (-1069, 3668, 1376);
            break;

            case 8:
            self.EyeAngles = (0, 90, 0);
            return (-6, 3506, 1252);
            break;

            case 9:
            self.EyeAngles = (0, 0, 0);
            return (-732, 4547, 1230);
            break;

            case 10:
            self.EyeAngles = (0, 0, 0);
            return (-801, 4317, 1236);
            break;

            default:
            self.EyeAngles = (0, 0, 0);
            return (0, 0, 0);
            break;
        }
    }
}

FakeWhiteAttack()
{
    level endon(#"hash_25d8c88ff3f91ee5");
    level endon(#"StopEyeDuck");
    level endon(#"hash_38f29f9cb03586ea");
    self endon(#"disconnect", #"death");

    level.e_boss playsound("zmb_eyeball_swrath_charge");
}

EyeGoCrazy()
{
    level endon(#"hash_25d8c88ff3f91ee5");
    level endon(#"StopEyeDuck");
    level endon(#"hash_38f29f9cb03586ea");

    boss_move = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::boss_move; // move phase boss
    boss_leave = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::boss_leave; // move phase boss
    boss_arrive = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::boss_arrive; // move phase boss

    if (!isdefined(boss_move) || self.var_6efcc8c1 == 3)
    {
        self iPrintLnBold("^1Can't find it noob! ");
        return;
    }

    for(i = 0; i < 7; i++)
    {
        self thread EyeRandomMove();
        wait 1;
    }
}

EyeBossLeave()
{
    level endon(#"hash_25d8c88ff3f91ee5");
    level endon(#"StopEyeDuck");
    level endon(#"hash_38f29f9cb03586ea");

    boss_leave = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::boss_leave; // move phase boss

    if (!isdefined(boss_leave) || self.var_6efcc8c1 == 3)
    {
            self iPrintLnBold("^1Can't find it noob! ");
            return;
    }

    self thread [[ boss_leave ]]();
}

EyeBossMove()
{
    level endon(#"hash_25d8c88ff3f91ee5");
    level endon(#"StopEyeDuck");
    level endon(#"hash_38f29f9cb03586ea");

    boss_move = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::boss_move; // move phase boss

    if (!isdefined(boss_move) || self.var_6efcc8c1 == 3)
    {
            self iPrintLnBold("^1Can't find it noob! ");
            return;
    }

    self thread [[ boss_move ]](0, 0);
}

EyeBossArrive()
{
    level endon(#"hash_25d8c88ff3f91ee5");
    level endon(#"StopEyeDuck");
    level endon(#"hash_38f29f9cb03586ea");

    boss_arrive = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::boss_arrive; // move phase boss

    if (!isdefined(boss_arrive) || self.var_6efcc8c1 == 3)
    {
            self iPrintLnBold("^1Can't find it noob! ");
            return;
    }

    self thread [[ boss_arrive ]]();
}

GetEyePhase()
{
    if (level flag::get(#"hash_25d8c88ff3f91ee5")) return 0;
    if (level flag::get(#"hash_50113a36d2c6bb73")) return 11; // orig -> 5
    if (level flag::get(#"hash_bd3b222f6d8329d")) return 4;
    if (level flag::get(#"hash_fa1fa6cc9b17c7c")) return 3;
    if (level flag::get(#"hash_62b951a213a3945e")) return 2;

    return 1;
}

EyeSkip()
{
    level notify(#"hash_38f29f9cb03586ea"); // phase ended
}

EyeSkipTimer()
{
    level.SkipPhaseEye = true;
    wait 3;
    level.SkipPhaseEye = undefined;
}

EyeActivateBuffs()
{
    level endon(#"hash_25d8c88ff3f91ee5");
    level endon(#"StopEyeDuck");

    level.e_boss thread EyeBuffsPhase345();
}

EyeMenuBuff(BuffID)
{
    level endon(#"StopEyeDuck");

    switch(BuffID)
    {
        case 1:
        level.e_boss thread EyeBuffLow();
        break;

        case 2:
        level.e_boss thread EyeBuffHigh();
        break;
    }
}

EyeBuffLow()
{
    level endon(#"StopEyeDuck");
    self endon(#"death");
    
    self.var_7954bf70 = 5 * 9000;
    self.var_ba36376c = 5 * 22500;
    self.var_f881e30f = 5 * 9000;
    //self.var_6efcc8c1 = 8;
    self.var_59cdb7b9 = 6 * 18000;
    self.var_c962047c = 8 * 16000;
}

EyeBuffHigh()
{
    level endon(#"StopEyeDuck");
    self endon(#"death");

    self.var_7954bf70 = 5 * 15000;
    self.var_ba36376c = 5 * 28500;
    self.var_f881e30f = 5 * 15000; // wipe
    //self.var_6efcc8c1 = 8;
    self.var_59cdb7b9 = 6 * 26000;
    self.var_c962047c = 8 * 28000;
}

EyeBuffsPhase345() // phase 5,4,3
{
    level endon(#"StopEyeDuck");
    level endon(#"hash_25d8c88ff3f91ee5");

    self endon(#"death");

    self.var_6efcc8c1 = 0;
    
    level flag::wait_till(#"hash_62b951a213a3945e"); // phase 1 
    

    while(self.var_6efcc8c1 != 3)
    {
        if (level flag::get(#"hash_50113a36d2c6bb73")) // if phase 5
        {
            wait 10;
            self.var_7954bf70 = 5 * 11000;
            self.var_ba36376c = 5 * 11000;
            self.var_f881e30f = 7 * 9500;
            self.var_59cdb7b9 = 5 * 11000;
            self.var_c962047c = 5 * 11000;
            wait 10;
            self.var_7954bf70 = 5 * 11000;
            self.var_ba36376c = 5 * 11000;
            self.var_f881e30f = 7 * 9500;
            self.var_59cdb7b9 = 5 * 11000;
            self.var_c962047c = 5 * 11000;
            wait 10;
            self.var_7954bf70 = 5 * 11000;
            self.var_ba36376c = 5 * 11000;
            self.var_f881e30f = 7 * 9500;
            self.var_59cdb7b9 = 5 * 11000;
            self.var_c962047c = 5 * 11000;
            wait 10;
            self.var_7954bf70 = 5 * 11000;
            self.var_ba36376c = 5 * 11000;
            self.var_f881e30f = 7 * 9500;
            self.var_59cdb7b9 = 5 * 11000;
            self.var_c962047c = 5 * 11000;
            break;
        }
        else // other ones
        {
            self.var_7954bf70 = 8 * 40000;
            self.var_ba36376c = 8 * 40000;
            self.var_f881e30f = 5 * 18500;
            self.var_59cdb7b9 = 8 * 40000;
            self.var_c962047c = 8 * 40000;
        }
        wait 5;
    }
}

EyeSkipWipes()
{
    level endon(#"StopEyeDuck");
    level endon(#"hash_25d8c88ff3f91ee5");

    level.e_boss thread SkipWipes();
}

SkipWipes()
{
    level endon(#"StopEyeDuck");
    level endon(#"hash_25d8c88ff3f91ee5");

    self.var_6efcc8c1 = 2;
}

EyeExtendPhasesLogic() // how many wipe attacks before finish
{
    level endon(#"StopEyeDuck");
    level endon(#"hash_25d8c88ff3f91ee5");

    self endon(#"death");

    while (self.var_6efcc8c1 == 0)
    {
        waitframe(1);
    }
    self.var_6efcc8c1 = 0;
    self.wipes = 1;
    foreach(player in level.players)
    {
        player iPrintLn("^3 The Duck Eye: Ouch!!!!!!!!!");
    }
    while (self.var_6efcc8c1 == 0)
    {
        waitframe(1);
    }
    self.var_6efcc8c1 = 0;
    self.wipes = 2;
    foreach(player in level.players)
    {
        player iPrintLn("^3 The Duck Eye: Ouch!!!!!!!!!");
    }
    while (self.var_6efcc8c1 == 0)
    {
        waitframe(1);
    }
    self.wipes = 3;
    foreach(player in level.players)
    {
        player iPrintLn("^3 The Duck Eye: Ouch!!!!!!!!!");
    }
    while (self.var_6efcc8c1 == 1)
    {
        waitframe(1);
    }
    self.wipes = 4;
    foreach(player in level.players)
    {
        player iPrintLn("^1 The Duck Eye: Ouch!!!!!!!!!");
    }
    while (self.var_6efcc8c1 == 2)
    {
        waitframe(1);
    }
    self.wipes = 5;
    foreach(player in level.players)
    {
        player iPrintLn("^1 The Duck Eye: Ouch!!!!!!!!! (that hurts)");
    }

    // it doesn't display 5 in the hud logic for some reason?
    LUINotifyEvent(#"rush_boss_wipes", 2, 2, int(self.wipes));
    //ShieldHudElemSetText(#"rush_boss_wipes", "Wipe Attacks: ^5" + self.wipes + "^3/^6" + "5");
}

EyeMenuMove()
{
    level endon(#"StopEyeDuck");

    level.e_boss thread EyeMoveFunction((-870,4700,1052), (0, 0, 0));
}

EyeMoveFunction(origin, angles)
{
    level endon(#"StopEyeDuck");
    level endon(#"hash_25d8c88ff3f91ee5");
    self endon(#"death");
    level endon(#"hash_38f29f9cb03586ea");

    boss_move = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::boss_move; // move phase boss
    boss_leave = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::boss_leave; // move phase boss
    boss_arrive = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::boss_arrive; // move phase boss

    if (!isdefined(boss_move) && !isdefined(boss_leave) && !isdefined(boss_arrive) || self.var_6efcc8c1 == 3)
    {
        return;
    }

    self thread [[ boss_leave ]]();
    self.origin = origin;
    self.angles = angles;
    wait 2;
    self thread [[ boss_arrive ]]();

}

EyeChangeColor()
{
    level endon(#"StopEyeDuck");
    level endon(#"hash_25d8c88ff3f91ee5");
    self endon(#"death");
    function_3d8879d7 = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_3d8879d7; // attack boss stuff

    if (!isdefined(function_3d8879d7) || self.var_6efcc8c1 == 3)
    {
        self iPrintLnBold("^1Error! ");
        return;
    }

    while(self.var_6efcc8c1 != 3)
    {
        self clientfield::set("bs_bdy_str_cf", 1);
        util::wait_network_frame(8);
        self clientfield::set("bs_bdy_dmg_fx_cf", 2);
        wait 15;
    }
}