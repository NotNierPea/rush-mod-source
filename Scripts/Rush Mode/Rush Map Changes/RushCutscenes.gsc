BloodCutsceneEdit()
{
    wait 30;
    book = struct::get("s_p_s2_b");
    book.scene_ents[#"book"] attach("p8_zm_red_floatie_duck");
    wait 2;
    scene::add_scene_func(#"hash_722c4512700977d4", &DuckBrutus, "Shot 1");

    chair = getent("mechanical_chair", "targetname");
    chair attach("p8_zm_red_floatie_duck");
    chair SetScale(0.6);
    while(true)
    {
        wait 3;
        chair SetScale(0.6);
        wait 3;
        chair SetScale(1);
        wait 3;
        chair SetScale(0.4);
        wait 3;
        chair SetScale(0.3);
        wait 3;
        chair SetScale(0.7);
    }
}

PlayBloodScene()
{
    play_outro = @paschal<scripts\zm\zm_escape_paschal.gsc>::play_outro;

    level thread [[ play_outro ]]();
}

PlayBloodSceneIGC()
{
    //level scene::play(#"hash_55cf700c69e28ede", self);

    level thread scene::play(#"hash_38654bcdffc6d5ed", self);
}

ChangeBloodIGC(a_ents)
{
    wait 3;
    e_rec = [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::function_b1203924 ]]();

    foreach(player in level.players) player notify(#"StopCharacter_Change");
    if(isdefined(e_rec))
    {
        e_rec setspecialistindex(randomIntRange(25, 29));
    }
}

StopChangeBloodIGC(a_ents)
{
    wait 5;
    foreach(player in level.players)
    {
        player thread CharacterChange();
    }
}

BloodCutsceneStuff()
{
    // igc
    scene::add_scene_func(#"hash_38654bcdffc6d5ed", &ChangeBloodIGC, "play");
    scene::add_scene_func(#"hash_38654bcdffc6d5ed", &StopChangeBloodIGC, "done");

    // brutus
    a_str_shots = scene::get_all_shot_names(#"hash_4b825982d02adb40" + 1);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_4b825982d02adb40" + 1, &BrutusDuck, str_shot);
    }

    a_str_shots = scene::get_all_shot_names(#"hash_4b825982d02adb40" + 2);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_4b825982d02adb40" + 2, &BrutusDuck, str_shot);
    }

    a_str_shots = scene::get_all_shot_names(#"hash_4b825982d02adb40" + 3);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_4b825982d02adb40" + 3, &BrutusDuck, str_shot);
    }

    // main outro
    a_str_shots = scene::get_all_shot_names(#"hash_641ed02ad1d85897");
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_641ed02ad1d85897", &CutsceneDuckBlood, str_shot);
    }
}

BrutusDuck(a_ents)
{
    foreach (e_ent in a_ents)
    {
        if (isentity(e_ent)) // some ents are not entitys and will cause "racky goat" (caller is not an enitity)
        {
            if (!e_ent IsAttached(#"p8_zm_red_floatie_duck", "j_spinelower"))
            {
                e_ent attach(#"p8_zm_red_floatie_duck", "j_spinelower");
                thread am_log("attach duckie to > " + e_ent.model);
            }
        }
    }
}

TagPlayOutro()
{
    // outro
    function_d4147875 = @zm_orange_mq_mgr<scripts\zm\zm_orange_mq_mgr.gsc>::function_d4147875;
    level [[ function_d4147875 ]]();

    // clean
    function_895265b1 = @zm_orange_mq_mgr<scripts\zm\zm_orange_mq_mgr.gsc>::function_895265b1;
    level [[ function_895265b1 ]]();
}

TagEndCutsceneStuff() // sam
{
    hud_enable = @zm_orange_mq_mgr<scripts\zm\zm_orange_mq_mgr.gsc>::hud_enable;

    while(!isdefined(level.var_8a8728c6))
    {
        wait 1;
    }
    wait 1;
    samantha = level.var_8a8728c6[0];
    eddie = level.var_8a8728c6[1];

    samantha setmodel(#"c_t8_mp_spe_spectre_body1_skin1");
    samantha attach(#"p8_zm_red_floatie_duck", "j_spinelower");
    thread am_log("changed model main sam to > " + samantha.model);
    if (isdefined(samantha.hatmodel))
    {
        samantha detach(samantha.hatmodel, "");
    }
    if (isdefined(samantha.head))
    {
        samantha detach(samantha.head, "");
    }
    samantha attach("c_t8_mp_spe_spectre_head1", "j_head");

    wait 0.1;

    eddie setmodel(#"c_t8_mp_spe_hacker_body1");
    eddie attach(#"p8_zm_red_floatie_duck", "j_spinelower");
    thread am_log("changed model main eddie to > " + eddie.model);
    if (isdefined(eddie.hatmodel))
    {
        eddie detach(eddie.hatmodel, "");
    }
    if (isdefined(samantha.head))
    {
        eddie detach(eddie.head, "");
    }
    eddie attach("c_t8_mp_spe_hacker_head1", "j_head");

    wait 6;
    foreach (player in getplayers()) 
    {
        player function_e0c7d69(1);
        player allowcrouch(1);
        player clientfield::set_to_player("" + #"hash_668f474410d5c1d0", 0);
        player val::reset(#"gehen", "disable_weapons");
        player allowsprint(1);
        player allowcrouch(1);
        player allowprone(1);
        player allowmelee(1);
        player allowads(1);
        player show();
        player EnableWeapons();
        player EnableOffHandWeapons();

        wait 1;
        player thread StopFreeze(player);
    }

    wait 2;
    level thread [[ hud_enable ]]();
}

CutsceneDuckBlood(a_ents)
{
   foreach (e_ent in a_ents)
    {
        if (isentity(e_ent)) // some ents are not entitys and will cause "racky goat" (caller is not an enitity)
        {
            if (!e_ent IsAttached(#"p8_zm_red_floatie_duck", "j_spinelower"))
            {
                if(isdefined(e_ent.head) || isdefined(e_ent.hatmodel))
                {
                    //e_ent attach(#"p8_zm_red_floatie_duck", "j_spinelower");
                    thread am_log("attach head duckie to > " + e_ent.model);
                }
            }

            switch(e_ent.model)
            {
                case #"hash_3aa259c692642a7c": // main characters here
                e_ent thread ModelEntsBlood(1); // tak
                break;

                case #"hash_1ad66b628f785a2f": // nak
                e_ent thread ModelEntsBlood(2);
                break;

                case #"hash_57c6f8d18c24a8c5": // dempsey
                e_ent thread ModelEntsBlood(3);
                break;

                case #"hash_978f3bc506516d5": // ric rev
                case #"hash_6ed21338821521ef":
                e_ent thread ModelEntsBlood(4);
                break;

                case #"hash_2234f330d7ed502a": // ric blood
                e_ent thread ModelEntsBlood(5);
                break;

                case #"hash_38c716b7d185834f": // zombies
                case #"hash_38c717b7d1858502":
                e_ent thread ModelEntsBlood(7);
                thread am_log("changed model zombie > " + e_ent.model);
                break;

                default:
                thread am_log("couldn't find case > " + e_ent.model);
                break;
            }
        }
    }
}

ModelEntsBlood(id)
{
    switch(id)
    {
        case 1:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_zmb_mob_brutus_body");
        thread am_log("changed model brutus main to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
            self attach(#"c_t8_bo_hero_brutus_head1", "j_head");
        }
        self.dontchange = true;
        break;

        case 2:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_mp_spe_hacker_body1");
        thread am_log("changed model ghost to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
            thread am_log("detached a head to > " + self.head);
        }
        self attach(#"c_t8_mp_spe_hacker_head1", "j_head");
        self.dontchange = true; // kinda breaks sometimes lol
        break;

        case 3:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_zmb_mob_ghoul_body1");
        self attach(#"p8_zm_red_floatie_duck", "j_spinelower");
        thread am_log("changed model hacker to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self.dontchange = true; // kinda breaks sometimes lol
        break;

        case 4:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_mp_spe_spectre_body1_skin1");
        thread am_log("changed model spect to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
            self attach(#"c_t8_mp_spe_spectre_head1", "j_head");
        }
        self attach(#"p8_zm_red_floatie_duck", "j_spinelower");
        self attach(#"p7_zm_vending_widows_wine");
        self.dontchange = true;
        break;

        case 5:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_zmb_dlc0_hero_bruno_arms1_cst");
        thread am_log("changed model main zombie to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self attach(#"p7_zm_vending_widows_wine", "j_spinelower");
        self attach(#"c_t8_zmb_hero_bruno_lowerbody1_cst", "");
        self attach(#"c_t8_zmb_hero_bruno_head1_cst", "j_head"); 
        self.dontchange = true;
        break;

        case 6:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_zmb_hero_scarlett_arms1_viewbody1_cst");
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self attach(#"p8_zm_red_floatie_duck", "j_spinelower");
        self attach("c_t8_zmb_hero_scarlett_head1_cst", "");
        self attach("c_t8_zmb_hero_scarlett_lowerbody1_cst", "");
        self.dontchange = true;
        break;

        case 7:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_zmb_hero_scarlett_arms1_viewbody1_cst");
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self attach(#"p8_zm_red_floatie_duck", "j_spinelower");
        self attach("c_t8_zmb_hero_scarlett_head1_cst", "");
        self attach("c_t8_zmb_hero_scarlett_lowerbody1_cst", "");
        self.dontchange = true;
        break;
    }
}


DuckieWolf()
{
    level endon(#"hash_480ab8b0d38942cc");

    wait 1;
    wolf = level.s_boss.var_4944ec8;
    wolf enablelinkto();
    wolf thread ModelEntsDOTN(8);
    Widowszz = util::spawn_model("p8_zm_red_floatie_duck", wolf.origin + (0, 100, 100));
    Widowszz SetScale(50);
    Widowszz enablelinkto();
    Widowszz linkto(wolf);
    Widowszz notSolid();
    Widowszz rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    Widowszz1 = util::spawn_model("p7_zm_power_up_insta_kill", wolf.origin + (0, 100, 300));
    Widowszz1 SetScale(50);
    Widowszz1 enablelinkto();
    Widowszz1 linkto(wolf);
    Widowszz1 notSolid();

    Middle = level.s_boss.var_dcaafc8e[3];
    MainW = Middle.scene_ents[#"hash_5e9dee7036d632d2"];

    wolf thread AddLinkedObjective(1, wolf, #"hash_423a75e2700a53ab", false, undefined, undefined, #"hash_480ab8b0d38942cc");
    thread NukeLook(MainW.origin + (0, 0, 500), MainW.angles);

    while (!level flag::get(#"hash_480ab8b0d38942cc")) // checks for complete, so it doesn't pop up racky goat
    {
        level waittill(#"boss_captured");
        Widowszz rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
        wolf setModel(#"hash_36204bd34aa7c932");
        level waittilltimeout(10, #"hash_38f29f9cb03586ea");
        wolf setmodel(#"c_t8_zmb_dlc0_hero_diego_body1");
    }
}

RandomPlayerLook()
{
    level endon(#"end_game", #"game_ended");
    level endon(#"hash_25d8c88ff3f91ee5");
    
    if (level.players.size <= 3)
    {
        level.RandomPlayer = 0;
        return;
    }

    while(true)
    {
        level.RandomPlayer = randomIntRange(0, 4);
        wait 15;
    }
}

FiveCutscene()
{
    level thread scene::play("cin_zm_office_outro");
}

FiveCutsceneStuff()
{
    level.naktime = 0;

    a_str_shots = scene::get_all_shot_names(#"cin_zm_office_outro");
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"cin_zm_office_outro", &CutsceneDuckFive, str_shot);
    }
}

CutsceneDuckFive(a_ents)
{
   foreach (e_ent in a_ents)
    {
        if (isentity(e_ent)) // some ents are not entitys and will cause "racky goat" (caller is not an enitity)
        {
            if (!e_ent IsAttached(#"p8_zm_red_floatie_duck", "j_spinelower"))
            {
                if(isdefined(e_ent.head) || isdefined(e_ent.hatmodel))
                {
                    //e_ent attach(#"p8_zm_red_floatie_duck", "j_spinelower");
                    thread am_log("attach ent duckie to > " + e_ent.model);
                }
            }

            switch(e_ent.model)
            {
                case #"hash_732152fddbefdc39": // later (log)
                e_ent ModelEntsFive(1);
                break;

                case #"hash_a4489e4c3336b21": // later (log)
                e_ent ModelEntsFive(2);
                break;

                case #"hash_76f3e1982163b898": // later (log)
                e_ent ModelEntsFive(3);
                break;

                case #"hash_57953d697ca2dfa8": // later (log)
                e_ent ModelEntsFive(4);
                break;

                case #"hash_6e9c2d9f9bc6fc2b":
                case #"hash_1ad66b628f785a2f":
                e_ent ModelEntsFive(5);
                break;

                case #"hash_57c6f8d18c24a8c5":
                e_ent ModelEntsFive(6);
                break;

                case #"hash_73f4183c28161af3":
                e_ent ModelEntsFive(7);
                break;

                case #"hash_3aa259c692642a7c":
                e_ent ModelEntsFive(8);
                break;

                default:
                thread am_log("couldn't find ent case > " + e_ent.model);
                break;
            }
        }
    }
}

ModelEntsFive(id)
{
    switch(id)
    {
        case 1:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_mp_spe_buffer_body1");
        thread am_log("changed model buffer main to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self attach(#"c_t8_mp_spe_buffer_paladin_head1", "j_head");
        self.dontchange = true;
        break;

        case 2:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_zmb_hero_diego_arms1_cst");
        thread am_log("changed model diego main to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self attach(#"c_t8_zmb_dlc0_hero_diego_lowerbody1_cst", "");
        self attach(#"c_t8_zmb_dlc0_hero_diego_head1_cst", "j_head"); 
        self.dontchange = true; // kinda breaks sometimes lol
        break;

        case 3:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_mp_spe_reaper_body1");
        thread am_log("changed model reaper to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
            self attach(#"c_t8_mp_spe_reaper_head1", "j_head");
        }
        self.dontchange = true; // kinda breaks sometimes lol
        break;

        case 4:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_mp_spe_hacker_body1");
        thread am_log("changed model hacker to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
            self attach(#"c_t8_mp_spe_hacker_head1", "j_head");
        }
        self detach(#"p8_zm_red_floatie_duck", "j_spinelower");
        self.dontchange = true;
        break;

        case 5:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        if (level.naktime === 0)
        {
            self setmodel(#"c_t8_zmb_hero_diego_arms1_cst");
            thread am_log("changed model diego main to > " + self.model);
            if (isdefined(self.hatmodel))
            {
                self detach(self.hatmodel, "");
            }
            if (isdefined(self.head))
            {
                self detach(self.head, "");
            }
            self attach(#"c_t8_zmb_dlc0_hero_diego_lowerbody1_cst", "");
            self attach(#"c_t8_zmb_dlc0_hero_diego_head1_cst", "j_head"); 
            self.dontchange = true; // kinda breaks sometimes lol
            level.naktime++;
        }
        else
        {
            self setmodel(#"c_t8_zmb_dlc0_hero_bruno_arms1_cst");
            self attach(#"p8_zm_red_floatie_duck", "j_spinelower");
            thread am_log("changed model main bruno to > " + self.model);
            if (isdefined(self.hatmodel))
            {
                self detach(self.hatmodel, "");
            }
            if (isdefined(self.head))
            {
                self detach(self.head, "");
            }
            self attach(#"c_t8_zmb_hero_bruno_lowerbody1_cst", "");
            self attach(#"c_t8_zmb_hero_bruno_head1_cst", "j_head"); 
            self.dontchange = true;
        }
        break;

        case 6:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_zmb_dlc0_hero_stanton_arms1_viewbody1_cst");
        self attach(#"p8_zm_red_floatie_duck", "j_spinelower");
        thread am_log("changed model main shaw to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self attach(#"c_t8_zmb_hero_stanton_lowerbody1_cst", "");
        self attach(#"c_t8_zmb_dlc0_hero_stanton_head1_cst", "j_head"); 
        self attach(#"c_t8_zmb_dlc0_hero_stanton_torso1_viewbody1_cst"); // armor
        self.dontchange = true;
        break;

        case 7:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_mp_spe_spectre_body1_skin1");
        self attach(#"p8_zm_red_floatie_duck", "j_spinelower");
        thread am_log("changed model main spectre to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self attach("c_t8_mp_spe_spectre_head1", "j_head");
        self.dontchange = true;
        break;

        case 8:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_zmb_hero_scarlett_arms1_viewbody1_cst");
        self attach(#"p8_zm_red_floatie_duck", "j_spinelower");
        thread am_log("changed model main scarlett to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self attach("c_t8_zmb_hero_scarlett_head1_cst", "");
        self attach("c_t8_zmb_hero_scarlett_lowerbody1_cst", "");
        self.dontchange = true;
        break;
    }
}


DuckBrutus(a_ents)
{
    Brutus = a_ents[#"brutus"];
    a_ents[#"brutus"] waittill(#"b_at_l");
    Brutus thread BrutusSpecialDuck();
}

SceneFunctions()
{
    if (BO4ChaosMap())
    {
        level flag::wait_till("initial_blackscreen_passed"); // waits for players
        
        thread HomunculusDuck();
    }
    else
    {
        level flag::wait_till("initial_blackscreen_passed"); // waits for players
        
        thread MonkeyBombDuck();
    }

    if(BO4GetMap() == "Tag")
    {
        thread SamanthaDuck();
    }
}

HomunculusDuck()
{
    while(true)
    {
        for (i = 0; i < level.a_homunculus.size; i++) 
        {
            if (isdefined(level.a_homunculus[i]) && !isdefined(level.a_homunculus[i].modelset))
            {
                level.a_homunculus[i].var_69e642c7 attach(#"p8_zm_red_floatie_duck", "j_head");
                level.a_homunculus[i].mdl_anchor attach(#"p7_zm_power_up_nuke", "j_head");
                thread am_log("a_homunculus changed " + level.a_homunculus[i].model);
                level.a_homunculus[i].modelset = true;
            }
        }
        wait 0.1;
    }
}

SamanthaDuck()
{
    a_str_shots = scene::get_all_shot_names(#"hash_67030b23e27f4303");
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_67030b23e27f4303", &ChangeSam, str_shot);
    }
}

ChangeSam(a_ents)
{
    foreach (e_ent in a_ents)
    {
        if (isentity(e_ent)) // some ents are not entitys and will cause "racky goat" (caller is not an enitity)
        {
            if (!e_ent IsAttached(#"p8_zm_red_floatie_duck", "j_spinelower"))
            {
                thread am_log("attach head duckie/model chenged to > " + e_ent.model);
                
                e_ent setmodel(#"c_t8_mp_spe_spectre_body1_skin1");
                e_ent attach(#"p8_zm_red_floatie_duck", "j_spinelower");
                e_ent attach(#"c_t8_mp_spe_spectre_head1", "j_head");
            }
        }
    }
}

MonkeyBombDuck()
{
    while(true)
    {
        for (i = 0; i < level.cymbal_monkeys.size; i++)
        {
            if (isdefined(level.cymbal_monkeys[i]) && !isdefined(level.cymbal_monkeys[i].modelset))
            {
                level.cymbal_monkeys[i].var_bdd70f6a attach(#"p8_zm_red_floatie_duck", "j_head");
                level.cymbal_monkeys[i].var_bdd70f6a attach(#"p7_zm_power_up_nuke", "j_head");
                thread am_log("cymbal_monkeys changed " + level.cymbal_monkeys[i].model);
                level.cymbal_monkeys[i].modelset = true;
            }
        }
        wait 0.1;
    }
}

HomunculusScene(a_ents) // unused
{
    a_ents[#"homunculus"] endon(#"death");
    a_ents[#"homunculus"] setModel(#"p7_zm_power_up_nuke");
}

IXCutSceneSetUp()
{
    level.WidowZombies = false;
    level.SymbolZombies = false;
    level.NukeZombies = false;

    play_outro = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_138874e8; // skip
    //level thread scene::function_d8a83a50(#"hash_18b88682c325ad3d", &AfterCutsceneSetUp, "done");

    if (!isdefined(play_outro))
    {
        iPrintLnBold("^1Can't find play_outro! ");
        return;
    }

    level thread [[ play_outro ]]();

    wait 10;
    level flag::set("spawn_zombies");
}

AECutscenePlayIGC()
{
    level thread scene::play(#"hash_53792003d706a2e");
}

AECutscenePlay()
{
    play_outro = @zm_red<scripts\zm\zm_red.gsc>::play_outro; // skip

    if (!isdefined(play_outro))
    {
            self iPrintLnBold("^1Can't find play_outro! ");
            return;
    }

    level thread [[ play_outro ]]();
}

AECutscenePlay_FromBoss()
{
    play_outro_boss = @red_boss_battle<scripts\zm\zm_red_boss_battle.gsc>::function_ce82050b; // skip

    if (!isdefined(play_outro_boss))
    {
        self iPrintLnBold("^1Can't find play_outro! ");
        return;
    }

    level thread [[ play_outro_boss ]]();
}

MainAESceneFunction()
{
    // from play_outro in zm_red here ->

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
}

AESkipIGSC()
{
    level thread OverrideQuest(#"main_quest", "play", &OverrideHitMarks, &OverrideHitMarksClean);
}

OverrideHitMarks(b_skipped)
{
    foreach(player in level.players) player iPrintLnBold("Skipped Test");
    return;
}

OverrideHitMarksClean(b_skipped, something)
{
    foreach(player in level.players) player iPrintLnBold("Skipped Test");
    return;
}

IXCutsceneStuff()
{
    a_str_shots = scene::get_all_shot_names(#"hash_18b88682c325ad3d");
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_18b88682c325ad3d", &Ducks, str_shot);
    }
}

DOTNCutsceneStuff() // 36204bd34aa7c932 < wolf
{
    // wolf's
    a_str_shots = scene::get_all_shot_names(#"hash_5d38967a11d27f6");
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_5d38967a11d27f6", &CutsceneDuckDOTN, str_shot);
    }

    // main cutscene

    scene::add_scene_func(#"hash_3f0bec2bc9216cd4", &ScarDuck, "sh240");

    a_str_shots1 = scene::get_all_shot_names(#"hash_12cf1a9d1efe9bde");
    a_str_shots2 = scene::get_all_shot_names(#"hash_ab97b28f47828e9");
    a_str_shots3 = scene::get_all_shot_names(#"hash_231df2f485c6e30");
    a_str_shots4 = scene::get_all_shot_names(#"hash_3f0bec2bc9216cd4");

    foreach (str_shot in a_str_shots1)
    {
        scene::add_scene_func(#"hash_12cf1a9d1efe9bde", &CutsceneDuckDOTN, str_shot);
    }
    foreach (str_shot in a_str_shots2)
    {
        scene::add_scene_func(#"hash_ab97b28f47828e9", &CutsceneDuckDOTN, str_shot);
    }
    foreach (str_shot in a_str_shots3)
    {
        scene::add_scene_func(#"hash_231df2f485c6e30", &CutsceneDuckDOTN, str_shot);
    }
    foreach (str_shot in a_str_shots4)
    {
        scene::add_scene_func(#"hash_3f0bec2bc9216cd4", &CutsceneDuckDOTN, str_shot);
    }

    level flag::wait_till(#"boss_fight_started");

    // wolf's 1
    var_efc198c = 1;
    var_45e1b44b = level.s_boss.var_dcaafc8e[var_efc198c];
    
    a_str_shots = scene::get_all_shot_names(#"hash_44e932e9dc79e15a" + var_efc198c);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_44e932e9dc79e15a" + var_efc198c, &CutsceneDuckDOTN, str_shot);
    }

    var_efc198c = 2;
    var_45e1b44b = level.s_boss.var_dcaafc8e[var_efc198c];
    
    a_str_shots = scene::get_all_shot_names(#"hash_44e932e9dc79e15a" + var_efc198c);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_44e932e9dc79e15a" + var_efc198c, &CutsceneDuckDOTN, str_shot);
    }

    var_efc198c = 3;
    var_45e1b44b = level.s_boss.var_dcaafc8e[var_efc198c];
    
    a_str_shots = scene::get_all_shot_names(#"hash_44e932e9dc79e15a" + var_efc198c);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_44e932e9dc79e15a" + var_efc198c, &CutsceneDuckDOTN, str_shot);
    }

    // wolf's 2
    var_efc198c = 1;
    var_45e1b44b = level.s_boss.var_dcaafc8e[var_efc198c];
    
    a_str_shots = scene::get_all_shot_names(#"hash_3aeb4ff93f2cbf0" + var_efc198c);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_3aeb4ff93f2cbf0" + var_efc198c, &CutsceneDuckDOTN, str_shot);
    }

    var_efc198c = 2;
    var_45e1b44b = level.s_boss.var_dcaafc8e[var_efc198c];
    
    a_str_shots = scene::get_all_shot_names(#"hash_3aeb4ff93f2cbf0" + var_efc198c);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_3aeb4ff93f2cbf0" + var_efc198c, &CutsceneDuckDOTN, str_shot);
    }

    var_efc198c = 3;
    var_45e1b44b = level.s_boss.var_dcaafc8e[var_efc198c];
    
    a_str_shots = scene::get_all_shot_names(#"hash_3aeb4ff93f2cbf0" + var_efc198c);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_3aeb4ff93f2cbf0" + var_efc198c, &CutsceneDuckDOTN, str_shot);
    }

    /#
    a_str_shots = scene::get_all_shot_names(#"hash_ac762d2e540b674");
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_ac762d2e540b674", &CutsceneDuckDOTN, str_shot);
    }
    #/

    a_str_shots = scene::get_all_shot_names(#"hash_655a09e7ca7bca49");
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_655a09e7ca7bca49", &CutsceneDuckDOTN, str_shot);
    }

    var_6bbd958f = "2";
    var_6bbd958f = var_6bbd958f + "_l";
    var_b3160934 = #"hash_44e932e9dc79e15a" + var_6bbd958f;

    a_str_shots = scene::get_all_shot_names(var_b3160934);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(var_b3160934, &CutsceneDuckDOTN, str_shot);
    }

    a_str_shots = scene::get_all_shot_names(#"hash_37e4811f1b6881d1" + var_6bbd958f);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_37e4811f1b6881d1" + var_6bbd958f, &CutsceneDuckDOTN, str_shot);
    }

    var_6bbd958f = "1";
    var_6bbd958f = var_6bbd958f + "_l";
    var_b3160934 = #"hash_44e932e9dc79e15a" + var_6bbd958f;

    a_str_shots = scene::get_all_shot_names(var_b3160934);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(var_b3160934, &CutsceneDuckDOTN, str_shot);
    }

    a_str_shots = scene::get_all_shot_names(#"hash_37e4811f1b6881d1" + var_6bbd958f);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_37e4811f1b6881d1" + var_6bbd958f, &CutsceneDuckDOTN, str_shot);
    }

    var_6bbd958f = "3";
    var_6bbd958f = var_6bbd958f + "_l";
    var_b3160934 = #"hash_44e932e9dc79e15a" + var_6bbd958f;

    a_str_shots = scene::get_all_shot_names(var_b3160934);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(var_b3160934, &CutsceneDuckDOTN, str_shot);
    }

    a_str_shots = scene::get_all_shot_names(#"hash_37e4811f1b6881d1" + var_6bbd958f);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_37e4811f1b6881d1" + var_6bbd958f, &CutsceneDuckDOTN, str_shot);
    }

    var_6bbd958f = "4";
    var_6bbd958f = var_6bbd958f + "_l";
    var_b3160934 = #"hash_44e932e9dc79e15a" + var_6bbd958f;

    a_str_shots = scene::get_all_shot_names(var_b3160934);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(var_b3160934, &CutsceneDuckDOTN, str_shot);
    }
    
    a_str_shots = scene::get_all_shot_names(#"hash_37e4811f1b6881d1" + var_6bbd958f);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_37e4811f1b6881d1" + var_6bbd958f, &CutsceneDuckDOTN, str_shot);
    }

    // other wolf
    a_str_shots = scene::get_all_shot_names(#"hash_44e932e9dc79e15a" + 1);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_44e932e9dc79e15a" + 1, &CutsceneDuckDOTN, str_shot);
    }

    a_str_shots = scene::get_all_shot_names(#"hash_44e932e9dc79e15a" + 2);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_44e932e9dc79e15a" + 2, &CutsceneDuckDOTN, str_shot);
    }

    a_str_shots = scene::get_all_shot_names(#"hash_44e932e9dc79e15a" + 3);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_44e932e9dc79e15a" + 3, &CutsceneDuckDOTN, str_shot);
    }

    a_str_shots = scene::get_all_shot_names(#"hash_44e932e9dc79e15a" + 4);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_44e932e9dc79e15a" + 4, &CutsceneDuckDOTN, str_shot);
    }

    // 2
    a_str_shots = scene::get_all_shot_names(#"hash_94e18f7f5f5b927" + 1);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_94e18f7f5f5b927" + 1, &CutsceneDuckDOTN, str_shot);
    }

    a_str_shots = scene::get_all_shot_names(#"hash_94e18f7f5f5b927" + 2);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_94e18f7f5f5b927" + 2, &CutsceneDuckDOTN, str_shot);
    }

    a_str_shots = scene::get_all_shot_names(#"hash_94e18f7f5f5b927" + 3);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_94e18f7f5f5b927" + 3, &CutsceneDuckDOTN, str_shot);
    }

    a_str_shots = scene::get_all_shot_names(#"hash_94e18f7f5f5b927" + 4);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_94e18f7f5f5b927" + 4, &CutsceneDuckDOTN, str_shot);
    }

    // 3
    a_str_shots = scene::get_all_shot_names(#"hash_7650e56337eed7be" + 1);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_7650e56337eed7be" + 1, &CutsceneDuckDOTN, str_shot);
    }

    a_str_shots = scene::get_all_shot_names(#"hash_7650e56337eed7be" + 2);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_7650e56337eed7be" + 2, &CutsceneDuckDOTN, str_shot);
    }

    a_str_shots = scene::get_all_shot_names(#"hash_7650e56337eed7be" + 3);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_7650e56337eed7be" + 3, &CutsceneDuckDOTN, str_shot);
    }

    a_str_shots = scene::get_all_shot_names(#"hash_7650e56337eed7be" + 4);
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_7650e56337eed7be" + 4, &CutsceneDuckDOTN, str_shot);
    }
}

AECutsceneStuff()
{
    scene::add_scene_func(#"hash_53792003d706a2e", &AEDoorScenePlay, "play");
    scene::add_scene_func(#"hash_53792003d706a2e", &AEDoorSceneEnd, "done");

    a_str_shots = scene::get_all_shot_names(#"hash_1d24068626b3915e");
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_1d24068626b3915e", &PegasusDuck, str_shot);
    }
    
    a_str_shots = scene::get_all_shot_names(#"hash_be0d30822a1c21b");
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_be0d30822a1c21b", &CutsceneDuckAE, str_shot);
    }

    a_str_shots = scene::get_all_shot_names(#"hash_649bf4517c6d8d25");
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_649bf4517c6d8d25", &CutsceneDuckAE, str_shot);
    }

    a_str_shots = scene::get_all_shot_names(#"hash_29e069a70818e58f");
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_29e069a70818e58f", &CutsceneDuckAE, str_shot);
    }

    a_str_shots = scene::get_all_shot_names(#"hash_29e068a70818e3dc");
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_29e068a70818e3dc", &CutsceneDuckAE, str_shot);
    }

    a_str_shots = scene::get_all_shot_names(#"hash_29e067a70818e229");
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"hash_29e067a70818e229", &CutsceneDuckAE, str_shot);
    }

    wait 15;
    
    // oracle change
    Oracle = level.var_bb7822b7;
    if(isDefined(Oracle))
    {
        Oracle[0] setmodel(#"c_t8_zmb_ofc_hero_richtofen_arms1_viewbody1_cst");
        Oracle[0] attach(#"c_t8_zmb_ofc_hero_richtofen_head1_cst", "j_head");
        Oracle[0] attach(#"c_t8_zmb_mob_hero_richtofen_lowerbody1_viewbody1_cst", ""); // legs
        Oracle[0] attach(#"c_t8_zmb_mob_hero_richtofen_torso1_viewbody1_cst", ""); // stuff

        Oracle[1] hide();
        Oracle[2] hide();
        Oracle[3] hide();
        Oracle[4] hide();
    }
}

AEFixIGC()
{
    level waittill(#"flag_prophecy_completed");
    level notify(#"Stop_DetectSpawn");
    foreach(player in level.players)
    {
        player notify(#"StopCharacter_Change");
    }

    level waittill(#"IGC_Done");

    foreach(player in level.players)
    {
        player thread CharacterChange(false);
    }

    level thread CheckSpectating();
}

AEDoorScenePlay(a_ents)
{
    wait 4;
    a_e_players = [[ @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::function_e3142c13 ]]();
    e_stanton = a_e_players[#"stanton"];
    e_bruno = a_e_players[#"bruno"];

    if (!isdefined(e_stanton)) return;
    e_stanton notify(#"StopCharacter_Change");
    e_stanton setcharacterbodytype(7);
    e_stanton detachAll();

    if (!isdefined(e_bruno)) return;
    e_bruno notify(#"StopCharacter_Change");
    e_bruno setcharacterbodytype(12);
    e_bruno detachAll();
}

AEDoorSceneEnd(a_ents)
{
    level notify(#"IGC_Done");
    wait 1;

    /#
    foreach(player in level.players)
    {
        player val::reset(#"blood_takedamage", "takedamage");
        player val::reset(#"blood_ignoreme", "ignoreme");
        player val::reset(#"blood_ignoreall", "ignoreall");
        player val::reset(#"blood_disable_weapons", "disable_weapons");
        player dontinterpolate();
        player SetRandomOrigin((-1149, 5500, 1232));
    }
    #/
}

VODCutsceneStuff()
{
    a_str_shots = scene::get_all_shot_names(#"cin_zm_zod_outro");
    foreach (str_shot in a_str_shots)
    {
        scene::add_scene_func(#"cin_zm_zod_outro", &CutsceneDuckVOD, str_shot);
    }
}

CutsceneDuckVOD(a_ents)
{
   foreach (e_ent in a_ents)
    {
        if (isentity(e_ent)) // some ents are not entitys and will cause "racky goat" (caller is not an enitity)
        {
            if (!e_ent IsAttached(#"p8_zm_red_floatie_duck", "j_spinelower"))
            {
                if(isdefined(e_ent.head) || isdefined(e_ent.hatmodel) || e_ent.model === #"hash_3c1b917eaa4c8e63")
                {
                    e_ent attach(#"p8_zm_red_floatie_duck", "j_spinelower");
                    thread am_log("attach head duckie to > " + e_ent.model);
                }
                thread am_log("no head duckie to > " + e_ent.model);
            }

            switch(e_ent.model)
            {
                case #"hash_2b07cb39389caa8f":
                thread am_log("changed model to > " + e_ent.model);
                e_ent thread ModelEntsVOD(1);
                break;

                case #"hash_381356bc00b1f32f":
                thread am_log("changed model to > " + e_ent.model);
                e_ent thread ModelEntsVOD(2);
                break;

                case #"hash_49d459ffcfcb7a82":
                thread am_log("changed model to > " + e_ent.model);
                e_ent thread ModelEntsVOD(3);
                break;

                case #"hash_3f40f18c3ccc4c58":
                thread am_log("changed model to > " + e_ent.model);
                e_ent thread ModelEntsVOD(4);
                break;


                //man ents
                case #"hash_7c02eb29e369ceba":
                case #"hash_3cb1ea2836429795":
                case #"hash_6a0c5130c0bfd5bb":
                case #"hash_576eef2e67f03dd":
                case #"hash_6a905f227281a5c4":
                case #"hash_2fffa3163d9e39b2":
                case #"hash_7ca600aa518d9e65":
                case #"hash_299ef8e4250dc5d7":
                case #"hash_6da2ad01703e5a78":
                case #"hash_4f6bd73fcfc994e1":
                case #"hash_d630b4dab4824d6":
                case #"hash_4dc792850ff0b46c":
                case #"hash_3f40f18c3ccc4c58":
                case #"hash_4ffac247769031ef":

                e_ent thread ModelEntsVOD(5);
                break;


                // woman ents
                case #"hash_7f4b2e2d2e56e249":
                case #"hash_241feee0d1d621dc":
                case #"hash_53f590170deb4f70":
                case #"hash_3a8c87077c49b4b5":
                case #"hash_5530e2dc791ec6e2":
                case #"hash_8fc26fe2f1f5739":
                case #"hash_20f1a51a3af22d93":
                e_ent thread ModelEntsVOD(6);
                break;

                default:
                thread am_log("couldn't find case > " + e_ent.model);
                break;
            }
        }
    }
}

ModelEntsVOD(id)
{
    switch(id)
    {
        case 1:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_mp_spe_ruin_body1_skin1");
        thread am_log("changed model fire to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self attach(#"c_t8_mp_spe_ruin_heist_head1", "j_head");
        self.dontchange = true;
        break;

        case 2:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_zmb_titanic_stoker_body1");
        thread am_log("changed model stoker to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
            thread am_log("detached a head to > " + self.head);
        }
        self.dontchange = true; // kinda breaks sometimes lol
        break;

        case 3:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_mp_spe_reaper_body1");
        thread am_log("changed model reaper to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
            self attach(#"c_t8_mp_spe_reaper_head1", "j_head");
        }
        self.dontchange = true; // kinda breaks sometimes lol
        break;

        case 4:
        self detach(#"p8_zm_red_floatie_duck", "j_spinelower");
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"hash_49d459ffcfcb7a82");
        thread am_log("changed model eye/man to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
            //self attach(#"c_t8_mp_spe_hacker_head1", "j_head");
        }
        eye = util::spawn_model(#"hash_32a51dafb1c7344f", self.origin, self.angles, undefined, 0);
        eye linkTo(self, "j_head", (2.08, 4.25, 0), (-180, -90, 90)); // needs a little changes
        eye SetScale(0.08);
        self.dontchange = true;
        break;

        case 5:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"hash_3f40f18c3ccc4c58");
        thread am_log("changed model man to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self attach(#"c_t8_zmb_dlc0_hero_diego_head1_cst", "j_head");
        self.dontchange = true;
        break;

        case 6:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_zom_dlc1_skeleton_zombie_body");
        thread am_log("changed model woman to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self attach("c_t8_zmb_dlc0_hero_scarlett_head1_cst", "j_head");
        self.dontchange = true;
        break;
    }
}

CutsceneDuckAE(a_ents)
{
   foreach (e_ent in a_ents)
    {
        if (isentity(e_ent)) // some ents are not entitys and will cause "racky goat" (caller is not an enitity)
        {
            if (!e_ent IsAttached(#"p8_zm_red_floatie_duck", "j_spinelower"))
            {
                if(isdefined(e_ent.head) || isdefined(e_ent.hatmodel) || e_ent.model === #"hash_3c1b917eaa4c8e63")
                {
                    e_ent attach(#"p8_zm_red_floatie_duck", "j_spinelower");
                    thread am_log("attach head duckie to > " + e_ent.model);
                }
                thread am_log("no head duckie to > " + e_ent.model);
            }

            switch(e_ent.model)
            {
                case #"hash_2b07cb39389caa8f":
                case #"hash_128230ace76a7bce": // alistar???
                case #"hash_56d8d8893aae3e0":  // preist??
                thread am_log("changed model to > " + e_ent.model);
                e_ent thread ModelEntsAE(1);
                break;

                case #"hash_381356bc00b1f32f":
                case #"hash_656d8d8893aae3e0": // preist
                thread am_log("changed model to > " + e_ent.model);
                e_ent thread ModelEntsAE(2);
                break;

                case #"hash_49d459ffcfcb7a82":
                thread am_log("changed model to > " + e_ent.model);
                e_ent thread ModelEntsAE(3);
                break;

                case #"hash_3f40f18c3ccc4c58":
                thread am_log("changed model to > " + e_ent.model);
                e_ent thread ModelEntsAE(4);
                break;

                case #"hash_77bcac59f3591a33": // before (need more maybe)
                case #"hash_7982a18296afce46":
                case #"hash_532f80bab345f6f0":
                case #"hash_d8eb4e9e250cdc3":
                case #"hash_3a05f4a919bf3c97":
                case #"hash_14f052d22f6ca06":
                case #"hash_df4ab51775c3101":
                case #"hash_391c19832e6f113d":
                case #"hash_79aa254f79b6a612": // before
                case #"hash_51705235210610ab": // main after
                thread am_log("changed model to > " + e_ent.model);
                e_ent thread ModelEntsAE(5);
                break;

                case #"hash_5c9af34faff2aa4c":
                case #"hash_5f7c65dd09cb4a37":
                case #"hash_21d77c10ef3b2328":
                e_ent hide();
                e_ent delete();
                break;

                case #"c_t8_zmb_dlc2_perseus_fb1": // for boss fight
                e_ent thread ModelEntsAE(6);
                break;

                case #"hash_121569c36dd42e75": // peag
                e_ent thread ModelEntsAE(7);
                break;

                case #"hash_61790877a7f8e580": // peag
                e_ent thread ModelEntsAE(8);
                break;

                case #"hash_1cd365685eb76aec": // shield
                e_ent setModel(#"p7_zm_vending_widows_wine");
                break;

                case #"hash_39b17285015a6944":
                case #"hash_3e9aca2f85523d28": // pan
                e_ent setModel(#"p8_zm_red_floatie_duck");
                break;

                default:
                thread am_log("couldn't find case > " + e_ent.model);
                break;
            }
        }
    }
}

ModelEntsAE(id)
{
    switch(id)
    {
        case 1:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_zmb_mob_hero_dempsey_arms1_viewbody1_cst");
        thread am_log("changed model demp to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
            //self attach(#"c_t8_zmb_dlc0_hero_diego_head1", "");
        }
        self attach(#"c_t8_zmb_mob_hero_dempsey_head1_cst", "j_head");
        self attach(#"c_t8_zmb_mob_hero_dempsey_lowerbody1_cst", "");
        self attach(#"c_t8_zmb_ofc_hero_dempsey_torso1_cst", "");
        self.dontchange = true;
        break;

        case 2:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"hash_391c19832e6f113d");
        thread am_log("changed model oracle to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
            thread am_log("detached a head to > " + self.head);
            //self attach(#"c_t8_zmb_dlc0_hero_scarlett_head1", "");
        }
        self.dontchange = true; // kinda breaks sometimes lol
        break;

        case 3:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_zmb_dlc2_perseus_fb1");
        thread am_log("changed model perseus to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self.dontchange = true; // kinda breaks sometimes lol
        break;

        case 4:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_zmb_dlc2_gegenees_fb1");
        thread am_log("changed model gegenees to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self.dontchange = true;
        break;

        case 5:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters // ric
        self setmodel(#"c_t8_zmb_ofc_hero_richtofen_arms1_viewbody1_cst");
        thread am_log("changed model ric to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self attach(#"c_t8_zmb_ofc_hero_richtofen_head1_cst", "j_head");
        self attach(#"c_t8_zmb_mob_hero_richtofen_lowerbody1_viewbody1_cst", ""); // legs
        self attach(#"c_t8_zmb_mob_hero_richtofen_torso1_viewbody1_cst", ""); // stuff
        self.dontchange = true;
        break;

        case 6:
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"c_t8_mp_spe_spectre_body1_skin1");
        thread am_log("changed model diago to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self attach(#"c_t8_mp_spe_spectre_head1", "j_head");
        self.dontchange = true; // kinda breaks sometimes lol
        break;

        case 7: // peag 1 before
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"hash_381356bc00b1f32f");
        duck = util::spawn_model("p7_zm_power_up_insta_kill", self.origin);
        duck SetScale(50);
        duck enablelinkto();
        duck linkto(self);
        duck notSolid();
        thread am_log("changed model peag 1 before to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self.dontchange = true; // kinda breaks sometimes lol
        break;

        case 8: // peag 2 after
        if(isdefined(self.dontchange) && self.dontchange) return; // if one of main characters
        self setmodel(#"hash_381356bc00b1f32f");
        duck = util::spawn_model("p8_zm_red_floatie_duck", self.origin);
        duck SetScale(50);
        duck enablelinkto();
        duck linkto(self);
        duck notSolid();

        duck1 = util::spawn_model("p7_zm_power_up_insta_kill", self.origin);
        duck1 SetScale(50);
        duck1 enablelinkto();
        duck1 linkto(self);
        duck1 notSolid();

        level.DeleteLogic[level.DeleteLogic.size] = duck;
        level.DeleteLogic[level.DeleteLogic.size] = duck1;

        thread am_log("changed model peag 2 after to > " + self.model);
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self.dontchange = true; // kinda breaks sometimes lol
        break;
    }
}

CutsceneDuckDOTN(a_ents) // 28ae389c66249846 < women, 
{
   foreach (e_ent in a_ents)
    {
        if (isentity(e_ent)) // some ents are not entitys and will cause "racky goat" (caller is not an enitity)
        {
            if (!e_ent IsAttached(#"p8_zm_red_floatie_duck", "j_spinelower"))
            {
                if(isdefined(e_ent.head) || isdefined(e_ent.hatmodel))
                {
                    e_ent attach(#"p8_zm_red_floatie_duck", "j_spinelower");
                    thread am_log("attach head duckie to > " + e_ent.model);
                }
                else thread am_log("no head duckie to > " + e_ent.model);
            }

            switch(e_ent.model)
            {
                case #"hash_5b168f8d846f5330":
                thread am_log("changed model to > " + e_ent.model);
                e_ent thread ModelEntsDOTN(1);
                break;

                case #"hash_15790cb5841cfd3d":
                thread am_log("changed model to > " + e_ent.model);
                e_ent thread ModelEntsDOTN(2);
                break;

                case #"hash_58d4e73a16859fce":
                thread am_log("changed model to > " + e_ent.model);
                e_ent thread ModelEntsDOTN(3);
                break;

                case #"hash_28ae389c66249846":
                thread am_log("changed model to > " + e_ent.model);
                e_ent thread ModelEntsDOTN(4);
                break;

                case #"hash_2ca16ba132e540dd":
                thread am_log("changed head to > " + e_ent.model);
                e_ent setModel(#"c_t8_mp_spe_reaper_head1");
                e_ent attach(#"c_t8_mp_spe_reaper_head1");
                break;

                case #"hash_2a92f1695394c8c6":
                case #"hash_67cc2d78b9a203a7":
                case #"hash_7a33e9af2a69a687":
                case #"hash_3570eb500417bb3a":
                e_ent thread ModelEntsDOTN(5);
                break;

                case #"hash_617060aa9cf1216a":
                case #"hash_59557f9ec25ca3eb":
                case #"hash_6a0c5130c0bfd5bb":
                case #"hash_6da2ad01703e5a78":
                e_ent thread ModelEntsDOTN(6);
                break;

                case #"hash_7d35afb61b0951bb":
                e_ent thread ModelEntsDOTN(7);
                break;

                case #"hash_36204bd34aa7c932":
                e_ent thread ModelEntsDOTN(8);
                break;

                default:
                thread am_log("no case > " + e_ent.model);
                break;
            }
        }
        //e_ent thread ModelEntsAE();
    }
}

Ducks(a_ents)
{
    foreach (e_ent in a_ents)
    {
        if (isentity(e_ent)) // some ents are not entitys and will cause "racky goat" (caller is not an enitity)
        {
            if (!e_ent IsAttached(#"p8_zm_red_floatie_duck", "j_spinelower"))
            {
                if(e_ent.model == #"hash_7ae080619872654e" || e_ent.model == #"hash_75580be51613ffd7" || e_ent.model == #"hash_4f6c3c01ecd7b43f" 
                || e_ent.model == #"hash_6c5381961b45b2d7" || e_ent.model == #"hash_119fdcf3e238a978" || e_ent.model == #"hash_5aa20be4217014f1" 
                || e_ent.model == #"hash_2b458f17054945d9" || e_ent.model == #"hash_11d00220470db280" || e_ent.model == #"hash_50813a66e4b4e2b3" 
                || e_ent.model == #"hash_697b10947df3a153" || e_ent.model == #"hash_3be85cfd2fbfc6e1" || e_ent.model == #"hash_57c60091689d66d2" 
                || e_ent.model == #"hash_5dd8abee2d470359" || e_ent.model == #"hash_18a44b6afa971a22")
                {
                    e_ent attach(#"p8_zm_red_floatie_duck", "j_spinelower");
                    thread am_log("attach duckie to > " + e_ent.model);
                }
            }

            switch(e_ent.model)
            {
                // hash_18a44b6afa971a22 < priest after shot 1, 5aa20be4217014f1 < priest in shot 1
                case #"hash_5aa20be4217014f1":
                case #"hash_2b458f17054945d9":
                case #"hash_11d00220470db280":
                case #"hash_50813a66e4b4e2b3":
                case #"hash_697b10947df3a153":
                case #"hash_3be85cfd2fbfc6e1":
                case #"hash_57c60091689d66d2":
                case #"hash_5dd8abee2d470359":
                case #"hash_18a44b6afa971a22":
                e_ent thread ModelEntsIX(0);
                thread am_log("changed model 0 > " + e_ent.model);
                break;
                
                case #"hash_119fdcf3e238a978": // scar
                e_ent thread ModelEntsIX(1);
                thread am_log("changed model 1 > " + e_ent.model);
                break;

                case #"hash_6c5381961b45b2d7": // scar
                e_ent thread ModelEntsIX(2);
                thread am_log("changed model 2 > " + e_ent.model);
                break;

                case #"hash_4f6c3c01ecd7b43f": // bruno
                e_ent thread ModelEntsIX(3);
                thread am_log("changed model 2 > " + e_ent.model);
                break;

                case #"hash_75580be51613ffd7": // diego
                e_ent thread ModelEntsIX(4);
                thread am_log("changed model 2 > " + e_ent.model);
                break;

                case #"hash_7ae080619872654e": // shaw
                case #"hash_1034a375fec90657": // after
                e_ent thread ModelEntsIX(5);
                thread am_log("changed model 2 > " + e_ent.model);
                break;

                case #"hash_1936c9a858079ed9": // preist allys
                e_ent thread ModelEntsIX(6);
                thread am_log("changed model 2 > " + e_ent.model);
                break;

                case #"hash_68afd73a6d5c8314": // diego head after shot172
                thread am_log("changed diego head to > " + e_ent.model);
                e_ent setModel(#"hash_70f1aafdf8d06953");
                e_ent attach(#"hash_70f1aafdf8d06953", "j_head");
                e_ent thread MaskLogicIX();
                break;
                
                default:
                thread am_log("no case for > " + e_ent.model);
                break;

            }
        }
        //e_ent thread ModelEntsAE();
    }
}

ModelEntsIX(id)
{
    switch(id)
    {
        case 0:
        if(isdefined(self.dontchange) && self.dontchange) return;
        self setmodel(#"c_t8_zmb_dlc0_hero_scarlett_body1_igc");
        if (isdefined(self.hatmodel))
        {
            thread am_log("detached a hat called > " + self.hatmodel);
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
            thread am_log("detached a head called > " + self.head);
        }
        self attach(#"c_t8_zmb_dlc0_hero_scarlett_head1_cst", "");
        self.dontchange = true;
        break;

        case 1: 
        self setmodel(#"c_t8_zmb_ofc_hero_richtofen_arms1_viewbody1_cst"); // hacker < ric
        if (isdefined(self.hatmodel))
        {
            thread am_log("detached a hat called > " + self.hatmodel);
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            thread am_log("detached a head called > " + self.head);
            self detach(self.head, "");
        }
        self attach(#"c_t8_zmb_ofc_hero_richtofen_head1_cst", "j_head");
        self attach(#"c_t8_zmb_mob_hero_richtofen_lowerbody1_viewbody1_cst", ""); // legs
        self attach(#"c_t8_zmb_mob_hero_richtofen_torso1_viewbody1_cst", ""); // stuff
        self thread MaskLogicIX();
        break;

        case 2: 
        if(isdefined(self.dontchange) && self.dontchange) return; // scar
        self setmodel(#"c_t8_mp_spe_reaper_body1");
        if (isdefined(self.hatmodel))
        {
            thread am_log("detached a hat called > " + self.hatmodel);
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            thread am_log("detached a head called > " + self.head);
            self detach(self.head, "");
        }
        self attach(#"c_t8_mp_spe_reaper_head1", "j_head");
        self.dontchange = true;
        break;

        case 3: 
        if(isdefined(self.dontchange) && self.dontchange) return; // bruno
        self setmodel(#"hash_18a44b6afa971a22");
        if (isdefined(self.hatmodel))
        {
            thread am_log("detached a hat called > " + self.hatmodel);
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            thread am_log("detached a head called > " + self.head);
            self detach(self.head, "");
        }
        self attach(#"hash_70f1aafdf8d06953", "j_head");
        self.dontchange = true;
        break;

        case 4: 
        if(isdefined(self.dontchange) && self.dontchange) return; // deigo
        self setmodel(#"hash_1936c9a858079ed9");
        if (isdefined(self.hatmodel))
        {
            thread am_log("detached a hat called > " + self.hatmodel);
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            thread am_log("detached a head called > " + self.head);
            self detach(self.head, "");
        }
        self.dontchange = true;
        break;

        case 5: 
        if(isdefined(self.dontchange) && self.dontchange) return; // shaw
        self setmodel(#"c_t8_mp_spe_hacker_body1");
        if (isdefined(self.hatmodel))
        {
            thread am_log("detached a hat called > " + self.hatmodel);
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            thread am_log("detached a head called > " + self.head);
            self detach(self.head, "");
        }
        self attach(#"c_t8_mp_spe_hacker_head1", "j_head");
        self.dontchange = true;
        break;

        case 6: 
        if(isdefined(self.dontchange) && self.dontchange) return; // allys
        self setmodel(#"c_t8_mp_spe_buffer_body1");
        if (isdefined(self.hatmodel))
        {
            thread am_log("detached a hat called > " + self.hatmodel);
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            thread am_log("detached a head called > " + self.head);
            self detach(self.head, "");
        }
        self attach(#"c_t8_mp_spe_buffer_paladin_head1", "j_head");
        //self thread MaskLogicIX();
        self.dontchange = true;
        break;

        default:
        thread am_log("unchanged model (did you forget the ID?) > " + self.model);
        break;
    }
}

ModelEntsDOTN(id)
{
    switch(id)
    {
        case 1:
        if(isdefined(self.dontchange) && self.dontchange) return;
        self setmodel(#"c_t8_zmb_dlc0_hero_diego_body1");
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
            self attach(#"c_t8_zmb_dlc0_hero_diego_head1", "");
        }
        self.dontchange = true;
        break;

        case 2:
        if(isdefined(self.dontchange) && self.dontchange) return;
        self setmodel(#"c_t8_zmb_dlc0_hero_scarlett_body1");
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self attach(#"c_t8_zmb_dlc0_hero_scarlett_head1", "j_head");
        self.dontchange = true;
        break;

        case 3:
        if(isdefined(self.dontchange) && self.dontchange) return;
        self setmodel(#"c_t8_zmb_titanic_stoker_body1");
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self.dontchange = true;
        break;

        case 4:
        if(isdefined(self.dontchange) && self.dontchange) return;
        self setmodel(#"c_t8_mp_spe_reaper_body1");
        self attach(#"p7_zm_vending_widows_wine", "j_spinelower");
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self attach(#"c_t8_mp_spe_reaper_head1", "j_head");
        self.dontchange = true;
        break;

        case 5:
        if(isdefined(self.dontchange) && self.dontchange) return;
        self setModel(#"c_t8_zmb_dlc0_hero_scarlett_head1");
        thread am_log("changed model airp to > " + self.model);
        self.dontchange = true;
        break;

        case 6:
        if(isdefined(self.dontchange) && self.dontchange) return;
        self setmodel(#"c_t8_zmb_dlc0_hero_diego_body1");
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self attach("c_t8_zmb_dlc0_hero_diego_head1", "");
        self.dontchange = true;
        break;

        case 7:
        if(isdefined(self.dontchange) && self.dontchange) return;
        self setmodel(#"p8_zm_red_floatie_duck");
        duck = util::spawn_model("p8_zm_red_floatie_duck", self.origin);
        duck SetScale(50);
        duck enablelinkto();
        duck linkto(self);
        duck notSolid();
        self.dontchange = true;
        break;

        case 8:
        if(isdefined(self.dontchange) && self.dontchange) return;
        self setmodel(#"c_t8_zmb_dlc0_hero_diego_body1");
        self attach(#"p8_zm_red_floatie_duck", "j_spinelower");
        if (isdefined(self.hatmodel))
        {
            self detach(self.hatmodel, "");
        }
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self attach("c_t8_zmb_dlc0_hero_diego_head1", "");
        self.dontchange = true;
        break;
    }
}

ScenePlayTest()
{
    
}

VODCutSceneSetUp()
{
    level.WidowZombies = false;
    level.SymbolZombies = false;
    level.NukeZombies = false;

    level clientfield::set("" + #"hash_3c58464f16d8a1be", 1);
	getent("mov_ship_rob", "targetname") clientfield::set("" + #"hash_6e41de51a0092771", 0);
    scene::function_d8a83a50("cin_zm_zod_outro", &AfterCutsceneSetUp, "done");
    level thread scene::play("cin_zm_zod_outro");
    wait 10;

    level flag::set("spawn_zombies");
}

AfterCutsceneSetUp()
{
    level flag::set("spawn_zombies");
	level flag::clear(#"pause_round_timeout");

    switch(BO4GetMap())
    {
        case "Voyage":
        wait 1;
        StopEndGame();
        /#
        foreach(player in level.players)
        {
            player iPrintLnBold(
            "^8 Rush Mode has been Fully Completed!, You can now End The Game if you want or Continue Playing Endless Rounds! "
            );
        }
        level zm_audio::sndmusicsystem_playstate("game_over");

        wait 5;
        KillAllZombies();
        foreach(player in level.players) player disableInvulnerability();
        LUINotifyEvent(#"rush_quest_detect", 1, 0);
        #/
        break;

        case "IX":
        level notify(#"RushBossPicked");

        level thread lui::screen_flash(0.4, 2, 0.5, 1, "white");
        foreach(player in level.players) // for print messages
        {
            wait 0.5;
            player SetRandomOrigin((151.776, 1802.6, -365.875)); // teleport to the pit
        }

        wait 5;
        KillAllZombies();
        foreach(player in level.players) player disableInvulnerability();
        LUINotifyEvent(#"rush_quest_detect", 1, 0);
        break;

        case "Classified":
        wait 1;
        break;

        case "AE":
        level notify(#"RushBossPicked");

        level thread lui::screen_flash(0.4, 2, 0.5, 1, "white");
        foreach(player in level.players) // for print messages
        {
            wait 0.5;
            player SetRandomOrigin((-2327, -2763, -255)); // teleport to the pit
        }

        wait 6;
        KillAllZombies();
        LUINotifyEvent(#"rush_quest_detect", 1, 0);
        level.var_5d1805c4 = undefined; // reset health
        foreach(player in level.players) player disableInvulnerability();
        break;

        case "Tag":
        level notify(#"RushBossPicked");

        level thread lui::screen_flash(0.4, 2, 0.5, 1, "white");
        foreach(player in level.players)
        {
            wait 0.5;
            player dontinterpolate();
            player SetRandomOrigin((2320,-2799,303));
            player disableInvulnerability();
        }
        
        LUINotifyEvent(#"rush_quest_detect", 1, 0);
        break;
    }
}

ScarDuck(a_ents)
{
    wait 1;
    scar = level.e_scarlett;

    scar setmodel(#"c_t8_zmb_dlc1_catherine_ghost_body"); //c_t8_zmb_dlc1_catherine_ghost_body
    if (isdefined(scar.hatmodel))
    {
        scar detach(scar.hatmodel, "");
    }
    if (isdefined(scar.head))
    {
        scar detach(scar.head, "");
    }

    scar enablelinkto();
    Widowszz1 = util::spawn_model("p7_zm_power_up_nuke", scar.origin + (0, 0, 0));
    Widowszz1 SetScale(1);
    Widowszz1 enablelinkto();
    Widowszz1 linkto(scar, "j_neck", (0, 0, 0), (0, 0, 0));
    Widowszz1 notSolid();
    wait 1;

    quack1 = util::spawn_model("p8_zm_red_floatie_duck", scar.origin + (0, 0, 0));
    quack1 SetScale(1);
    quack1 enablelinkto();
    quack1 linkto(scar, "j_spinelower", (0, 0, 0), (0, 0, 0));
    quack1 notSolid();
    wait 1;

    quack2 = util::spawn_model("zombie_pickup_perk_bottle", scar.origin + (0, 0, 0));
    quack2 SetScale(5);
    quack2 enablelinkto(); 
    quack2 linkto(scar, "j_spine4", (100, -30, 0));
    quack2 notSolid();
}

PegasusDuck(a_ents)
{
    e_pegasus = self.scene_ents[#"pegasus"];

    e_pegasus enableLinkTo();
    level.e_pegasus = e_pegasus;

    if(!isDefined(level.PegasusObj))
    {
        thread AddLinkedObjective(true, level.e_pegasus, #"hash_423a75e2700a53ab", true);
        level.PegasusObj = true;
    }
    
    //e_pegasus attach("p7_zm_vending_widows_wine");

    duck = util::spawn_model("p8_zm_red_floatie_duck", e_pegasus.origin);
    duck SetScale(50);
    duck enablelinkto();
    duck linkto(e_pegasus);
    duck notSolid();

    duck1 = util::spawn_model("p7_zm_power_up_insta_kill", e_pegasus.origin);
    duck1 SetScale(50);
    duck1 enablelinkto();
    duck1 linkto(e_pegasus);
    duck1 notSolid();

    level.DeleteLogic[level.DeleteLogic.size] = duck;
    level.DeleteLogic[level.DeleteLogic.size] = duck1;

    PQuack1 = util::spawn_model("p8_zm_red_floatie_duck", e_pegasus.origin + (0, -300, 0), (90, 0, 0));
    PQuack1 SetScale(50);
    PQuack1 enablelinkto();
    PQuack1 linkto(e_pegasus);
    PQuack1 notSolid();

    PQuack2 = util::spawn_model("p8_zm_red_floatie_duck", e_pegasus.origin + (0, 300, 0), (90, 0, 0));
    PQuack2 SetScale(50);
    PQuack2 enablelinkto();
    PQuack2 linkto(e_pegasus);
    PQuack2 notSolid();

    wait 3;

    PQuack1 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    PQuack2 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);

    wait 3;

    PQuack1 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    PQuack2 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);

    wait 3;

    PQuack1 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);
    PQuack2 rotateTo((randomint(120), randomint(120), randomint(120)), 0.5);

    level.DeleteLogic[level.DeleteLogic.size] = PQuack2;
    level.DeleteLogic[level.DeleteLogic.size] = PQuack1;
}