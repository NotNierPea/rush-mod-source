CreateHuds() // special thanks to ATE47!
{
    // Aligns
    /#
        - x, 0 = left | 1 = center | 2 = right
        - y, 0 = top  | 1 = middle | 2 = bottom
    #/

    /#
    ShieldRegisterHudElem(#"zombies_counter", "^6waiting for the zombies...", 
        0xFFFFC0EB, // color red
        10, 10, // x/y
        0, 0, // anchor x/y
        0, 0, // align x/y
        0.50 // scale
    );
    #/

    // menu stuff
    level.DevMenu = true;
    if(level.DevMenu) level thread DevMenuHudsActivate();

    // rush stuff
    level thread RushHudsActivate();

    // update logic
    level thread UpdateZombieCounter();
    level thread UpdateQuestHud();
    level thread UpdateBossHealthHud();
}

RushHudsActivate()
{
    // rush things
    // rounds
    /#
    ShieldRegisterHudElem(#"rush_round_waiting", "^5Waiting For Rush Mode...", 0xFFFFC0EB, 
        10, -30,
        0, 1,
        0, 0,
        0.50
    );
    #/

    // boss
    ShieldRegisterHudElem(#"rush_boss", "^4Waiting For Boss Flag...", 0xFFFFC0EB, 
        300, 120,
        0, 0,
        0, 0,
        0.60
    );

    ShieldRegisterHudElem(#"rush_boss_health", "^4Waiting For Boss Flag...", 0xFFFFC0EB, 
        300, 160,
        0, 0,
        0, 0,
        0.60
    );

    ShieldRegisterHudElem(#"rush_boss_phase", "^4Waiting For Boss Flag...", 0xFFFFC0EB, 
        300, 200,
        0, 0,
        0, 0,
        0.60
    );

    ShieldRegisterHudElem(#"rush_boss_wipes", "^4Waiting For Boss Flag...", 0xFFFFC0EB, 
        300, 240,
        0, 0,
        0, 0,
        0.60
    );

    ShieldRegisterHudElem(#"rush_boss_line", "^4Waiting For Boss Flag...", 0xFFFFC0EB, 
        300, 80,
        0, 0,
        0, 0,
        0.60
    );

    ShieldRegisterHudElem(#"rush_boss_line_2", "^4Waiting For Boss Flag...", 0xFFFFC0EB, 
        300, 280,
        0, 0,
        0, 0,
        0.60
    );

    // others moved to CSC
}

DevMenuHudsActivate()
{
    // pos
    level.XMenu = 1700;

    // colors (mostly for rbg)
    level.VerifyColor = "^9";
    level.LineColor = "^8";
    level.TitleBColor = "^6";
    level.TitleColor = "^3";
    level.SelectedSTRColor = "^4";
    level.STRSColor = "^2";

    // debug stuff

    // title
    ShieldRegisterHudElem(#"menu_title_1", "^4Waiting For Players (Menu)...", 0xFFFFC0EB, 
        515 - 200, 120 - 40,
        1, 0,
        0, 0,
        0.50
    );

    // menu line X
    // X Up
    for (i = 0; i < 32; i++)
        ShieldRegisterHudElem(#"menu_lineX_1_" + i, "^8_", 0xFFFFC0EB,
        500 - 200 + i * 10, 85 - 40,
        1, 0,
        0, 0,
        0.50
        );

    // X Down
    for (i = 0; i < 32; i++)
        ShieldRegisterHudElem(#"menu_lineX_2_" + i, "^8_", 0xFFFFC0EB,
        500 - 200 + i * 10, 825 - 40,
        1, 0,
        0, 0,
        0.50
        );

    /#
    ShieldRegisterHudElem(#"menu_lineX_1", "^8____________________________", 0xFFFFC0EB, 
        1685, 85,
        0, 0,
        0, 0,
        0.50
    );

    ShieldRegisterHudElem(#"menu_lineX_2", "^8____________________________", 0xFFFFC0EB, 
        1685, 825,
        0, 0,
        0, 0,
        0.50
    );
    #/

    // menu line Y
    // < Y
    for (i = 0; i < 37; i++)
        ShieldRegisterHudElem(#"menu_lineY_1_" + i, "^8|", 0xFFFFC0EB,
        498 - 200, 105 + i * 20 - 40,
        1, 0,
        0, 0,
        0.50
        );

    // Y >
    for (i = 0; i < 37; i++)
        ShieldRegisterHudElem(#"menu_lineY_2_" + i, "^8|", 0xFFFFC0EB,
        818 - 200, 105 + i * 20 - 40,
        1, 0,
        0, 0,
        0.50
        );

    // str's
    for (i = 0; i < 21; i++)
        ShieldRegisterHudElem(#"menu_str_2_" + i, "()", 0xFFFFC0EB,
        515 - 200, 160 + i * 30 - 40,
        1, 0,
        0, 0,
        0.50
        );

    // verify
    ShieldRegisterHudElem(#"menu_verify", "^4Waiting For Players (Menu)...", 0xFFFFC0EB, 
        515 - 200, 800 - 40,
        1, 0,
        0, 0,
        0.50
    );

    // debug huds for dev menu
    ShieldRegisterHudElem(#"menu_test_debug1", "^4Waiting For Players (Menu)...", 0xFFFFC0EB, 
        10, -120,
        0, 1,
        0, 0,
        0.50
    );

    ShieldRegisterHudElem(#"menu_test_debug2", "^4Waiting For Players (Menu)...", 0xFFFFC0EB, 
        10, -90,
        0, 1,
        0, 0,
        0.50
    );

    wait 3;
    DestroyOpts(); // menu

    ShieldHudElemSetText(#"menu_test_debug1", "");
    ShieldHudElemSetText(#"menu_test_debug2", "");
}

DevDebugHud()
{
    self.DebugHuds = isdefined(self.DebugHuds) ? undefined : true;

    self thread ObjectsLimits();
    self thread DevDebugHealth();
}

DevDebugHealth()
{
    self.HealthHud = isdefined(self.HealthHud) ? undefined : true;

    ShieldHudElemSetScale("menu_test_debug2", 0.60);
    if(isDefined(self.HealthHud))
    {
        while(isDefined(self.HealthHud))
        {
            ShieldHudElemSetText(#"menu_test_debug2", "^4Test Health: ^9" + level.ObjectsLimits.size + "/^2" + level.global_spawn_count);
            util::wait_network_frame(1);
        }
    }
    else
    {
        ShieldHudElemSetText(#"menu_test_debug2", "");
    }
}

ObjectsLimits()
{
    self.ObjectsHud = isdefined(self.ObjectsHud) ? undefined : true;

    ShieldHudElemSetScale("menu_test_debug1", 0.60);
    if(isDefined(self.ObjectsHud))
    {
        while(isDefined(self.ObjectsHud))
        {
            ShieldHudElemSetText(#"menu_test_debug1", "^6Charlie's Limit (G_Spawn): ^9" + level.ObjectsLimits.size + "/^2 350-380^1/" + level.global_spawn_count);
            util::wait_network_frame(1);
        }
    }
    else
    {
        ShieldHudElemSetText(#"menu_test_debug1", "");
    }
}

DeleteObjects(Obj)
{
    if(!isDefined(Obj)) return 0;
    else return 1;
}

UpdateBossHealthHud()
{
    level endon(#"hash_25d8c88ff3f91ee5"); // voyage // dead
    level endon(#"StopEyeDuck"); // some maps
    level endon(#"boss_battle_done", #"eleph_dead"); // ix
    level endon(#"perseus_defeated"); // ae
    level endon(#"main_quest_completed"); // blood
    level endon(#"avog_captured"); // AO
    
    wait 3;
    ShieldHudElemSetText(#"rush_boss_health", ""); // hide
    ShieldHudElemSetText(#"rush_boss", ""); // hide
    ShieldHudElemSetText(#"rush_boss_phase", ""); // hide
    ShieldHudElemSetText(#"rush_boss_wipes", ""); // hide
    ShieldHudElemSetText(#"rush_boss_line", ""); // hide
    ShieldHudElemSetText(#"rush_boss_line_2", "");

    switch(BO4GetMap())
    {
        case "IX":
        level waittill(#"StartHealthHud");
        if(!isDefined(level.e_elephant)) break;

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
        
        //ShieldHudElemSetText(#"rush_boss_line", "^8___________________________");
        //ShieldHudElemSetText(#"rush_boss_phase", "^8___________________________"); // hide
        level.ElpehantMaxHealth = 250000;
        
        MainTimeWhite = GetTime();
        MainTimeRed = GetTime();
        while(true)
        {
            Eleph = level.e_elephant;

            if(isDefined(Eleph))
            {
                if(!level.ElephantPhase) LUINotifyEvent(#"rush_boss", 1, 4);
                //ShieldHudElemSetText(#"rush_boss", "^1The Elephant - Phase 2");
                else LUINotifyEvent(#"rush_boss", 1, 5);
                //ShieldHudElemSetText(#"rush_boss", "^1The Elephant - Phase 1");

                if(level.ElephantPhase)
                {
                    ElephHealth = Eleph.health - 20000;
                    ElephMaxHealth = level.ElpehantMaxHealth - 20000;
                }
                else 
                {
                    ElephHealth = Eleph.health - 40000;
                    ElephMaxHealth = level.ElpehantMaxHealth - 40000;
                }

                if(!level.ElephantShield)
                {
                    // red one
                    if(MainTimeRed < getTime() - 225)
                    {
                        LUINotifyEvent(#"rush_boss_health_bar", 2, 1, int(100 * ElephHealth / ElephMaxHealth)); // 250000 < max health
                        LUINotifyEvent(#"rush_boss_health_bar", 1, 3);
                        MainTimeRed = GetTime();
                    }

                    // white one
                    if(MainTimeWhite < getTime() - 425)
                    {
                        LUINotifyEvent(#"rush_boss_health_bar_l", 2, 1, int(100 * ElephHealth / ElephMaxHealth));
                        MainTimeWhite = GetTime();
                    }

                    LUINotifyEvent(#"rush_boss_health", 2, 3, int(ElephHealth));
                }
                else 
                {
                    LUINotifyEvent(#"rush_boss_health_bar", 2, 1, int(100 * ElephHealth / ElephMaxHealth)); // 250000 < max health
                    LUINotifyEvent(#"rush_boss_health_bar_l", 2, 1, int(100 * ElephHealth / ElephMaxHealth));

                    LUINotifyEvent(#"rush_boss_health_bar", 1, 4);
                    LUINotifyEvent(#"rush_boss_health", 2, 4, int(ElephHealth));
                }

                //ShieldHudElemSetText(#"rush_boss_health", "^1Health: ^2"
                //+ ElephHealth);
                //ShieldHudElemSetText(#"rush_boss_health", "^1Health: ^4 Protected..."
                //+ " ^2(" + ElephHealth + ") ");

                //ShieldHudElemSetText(#"rush_boss_phase", "^2Origin (debug): ^3" + Eleph.origin);
            }

            util::wait_network_frame(1);
        }
        break;

        case "Voyage":
        level flag::wait_till(#"boss_fight_started");

        if(!isDefined(level.e_boss)) break;
        Eye = level.e_boss;

        LUINotifyEvent(#"rush_boss", 1, 1);
        LUINotifyEvent(#"rush_boss_health", 4, 1, 1, 1, 1);
        LUINotifyEvent(#"rush_boss_phase", 2, 1, 1);
        LUINotifyEvent(#"rush_boss_wipes", 1, 9);
        LUINotifyEvent(#"rush_boss_line", 1, 1);
        LUINotifyEvent(#"rush_boss_line_2", 1, 1);
        LUINotifyEvent(#"rush_boss_health_bar", 1, 3);
        LUINotifyEvent(#"rush_boss_health_bar", 1, 6); // for dotn only
        LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 1);
        LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 3);
        LUINotifyEvent(#"rush_boss_health_bar_l", 1, 3);
        LUINotifyEvent(#"rush_boss_health_bar_l", 1, 6);
        LUINotifyEvent(#"rush_boss_box", 1, 2); // bigger

        /#
        ShieldHudElemSetText(#"rush_boss", "^1The Duck Eye");
        ShieldHudElemSetText(#"rush_boss_health", "^2Damage Dealt: ^7" + "??" + "^3/^9" + "??");
        ShieldHudElemSetText(#"rush_boss_phase", "^2Current Phase: ^5Phase One");
        ShieldHudElemSetText(#"rush_boss_line", "^8___________________________");
        ShieldHudElemSetText(#"rush_boss_line_2", "^8___________________________");
        #/
        
        level.EyeWipeCurrent = false;
        level.EyeDoingAttack = false;

        Eye.wipes = 0;
        Eye.var_59cdb7b9 = 25000; // fix box

        //Eye.e_damage waittill(#"damage");
        level waittill(#"Start_HealthEye");
        
        MainTimeWhite = GetTime();
        MainTimeRed = GetTime();
        while(true)
        {
            //HealthDealt = Eye.var_18acfe18; // && !level flag::get(#"hash_50113a36d2c6bb73")
            if(level flag::get(#"hash_62b951a213a3945e") && !level.EyeWipeCurrent) // && !level.EyeWipeCurrent <- ???
             HealthDealt = Eye.var_57badb98; // damage plus <- phase 1 check
            else
             HealthDealt = Eye.var_18acfe18; // normal damage

            TimesDamaged = Eye.var_914750d;

            //HealthMainDealt = HealthDealt + HealthDealt1;
            //HealthWipe2 = Eye.var_ba36376c;
            //HealthWipe3 = Eye.var_7954bf70;

            HealthDealtNeedWipe = Eye.var_f881e30f; // wipe attack

            //HealthDealtNeed1 = Eye.var_59cdb7b9;

            if(level flag::get(#"hash_62b951a213a3945e") && !level flag::get(#"hash_50113a36d2c6bb73")) 
             HealthDealtNeedAttack = Eye.var_6a30a892; // bm attack or combo attack damage plus needed
            else if(level flag::get(#"hash_50113a36d2c6bb73")) 
             HealthDealtNeedAttack = Eye.var_7954bf70;
            else 
             HealthDealtNeedAttack = Eye.var_59cdb7b9;

            if(level.EyeWipeCurrent) 
             HealthDealtNeedBox = HealthDealtNeedWipe;
            else
             HealthDealtNeedBox = HealthDealtNeedAttack;


            if(level.EyeDoingAttack)
             LUINotifyEvent(#"rush_boss_health_bar", 1, 3); // red (attcking)
            else
             LUINotifyEvent(#"rush_boss_health_bar", 1, 4); // blue (not attacking)

            if(isdefined(HealthDealt) && isdefined(HealthDealtNeedWipe) && isdefined(HealthDealtNeedAttack) && isdefined(HealthDealtNeedBox)) 
            {
                if(!isDefined(TimesDamaged))
                 TimesDamaged = 0;
                
                LUINotifyEvent(#"rush_boss_health", 5, 1, int(HealthDealt), int(HealthDealtNeedWipe), int(HealthDealtNeedAttack), int(TimesDamaged));

                // health bar
                HealthDealtBox = HealthDealtNeedBox - HealthDealt;

                // red one
                if(MainTimeRed < getTime() - 225)
                {
                    LUINotifyEvent(#"rush_boss_health_bar", 2, 1, int(100 * HealthDealtBox / HealthDealtNeedBox)); // max health
                    //LUINotifyEvent(#"rush_boss_health_bar", 1, 3);
                    MainTimeRed = GetTime();
                }

                // white one
                if(MainTimeWhite < getTime() - 425)     
                {
                    LUINotifyEvent(#"rush_boss_health_bar_l", 2, 1, int(100 * HealthDealtBox / HealthDealtNeedBox));
                    MainTimeWhite = GetTime();
                }
            }
            
            /#
            ShieldHudElemSetText(#"rush_boss_health",
            "^2Damage Dealt: ^7"
            + HealthDealt1 + " (Dealt) ^4/^2 "
            + HealthDealtNeed + " (Wipe) ^4/^9 "
            + HealthDealtNeed2 + " (Attacks) "); // show
            #/

            LUINotifyEvent(#"rush_boss_phase", 2, 1, GetEyePhase());

            //ShieldHudElemSetText(#"rush_boss_phase", "^2Current Phase: ^5" + GetEyePhase());

            if (level flag::get(#"hash_50113a36d2c6bb73")) // phase 5 check
             LUINotifyEvent(#"rush_boss_wipes", 2, 2, int(Eye.wipes));
            //ShieldHudElemSetText(#"rush_boss_wipes", "Wipe Attacks: ^5" + Eye.wipes + "^3/^6" + "5");

            util::wait_network_frame(1);
        }
        break;

        case "AE":
        level waittill(#"StartHealthHud");

        LUINotifyEvent(#"rush_boss", 1, 2);
        LUINotifyEvent(#"rush_boss_health", 4, 1, 1, 1, 1);
        LUINotifyEvent(#"rush_boss_phase", 2, 2, 2);
        LUINotifyEvent(#"rush_boss_wipes", 1, 0);
        LUINotifyEvent(#"rush_boss_line", 1, 1);
        LUINotifyEvent(#"rush_boss_line_2", 1, 1);
        LUINotifyEvent(#"rush_boss_health_bar", 1, 3);
        LUINotifyEvent(#"rush_boss_health_bar", 1, 7);
        LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 1);
        LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 4);
        LUINotifyEvent(#"rush_boss_health_bar_l", 1, 3);
        LUINotifyEvent(#"rush_boss_health_bar_l", 1, 7);
        LUINotifyEvent(#"rush_boss_box", 1, 1);

        /#
        ShieldHudElemSetText(#"rush_boss", "^1Pegasus - Phase 1");
        ShieldHudElemSetText(#"rush_boss_wipes", "^8___________________________");
        ShieldHudElemSetText(#"rush_boss_line", "^8___________________________");
        #/
        b_bool = false;
        b_bool2 = false;

        MainTimeWhite = GetTime();
        MainTimeRed = GetTime();
        while(true)
        {
            if (level flag::get(#"hash_6dab61ca45a8eaea"))
            {
                LUINotifyEvent(#"rush_boss", 1, 3);

                //ShieldHudElemSetText(#"rush_boss", "^1Spectre - Phase 2");

                b_bool = true;
            }

            if (level flag::get(#"hash_15ba89b2357ff618") && !b_bool2)
            {
                LUINotifyEvent(#"rush_boss", 2, 2, 2);
                b_bool2 = true; // only once
            }

            PegasusHealthNeeded = level.s_boss_battle.var_b7fe5d46;
            PegasusHealthDealt = level.s_boss_battle.var_36f0e240;

            SpectreHealthNeeded = level.s_boss_battle.var_407b6d64; // var_1e4f5dab
            SpectreHealthDealt = level.s_boss_battle.var_ad3f929f;
            
            if (!level flag::get(#"hash_15ba89b2357ff618"))
            PegasusHealthNeededDown = level.s_boss_battle.var_7fc7f236 / 2; // fuck you lua

            else
             PegasusHealthNeededDown = level.s_boss_battle.var_7fc7f236;
            PegasusHealthDealtDown = level.s_boss_battle.var_5dc26e42;

            if (!level flag::get(#"hash_6dab61ca45a8eaea") && !b_bool)
            LUINotifyEvent(#"rush_boss_health", 3, 2, int(PegasusHealthDealt), int(PegasusHealthNeeded));

            //ShieldHudElemSetText(#"rush_boss_health", "^2Damage Dealt: ^1"
            //+ PegasusHealthDealt + "^5/^1" + SpectreHealthNeeded);

            else
            {
                // changed PegasusHealthNeeded -> SpectreHealthNeeded <-
                LUINotifyEvent(#"rush_boss_health", 3, 2, int(SpectreHealthDealt), int(SpectreHealthNeeded));

                //ShieldHudElemSetText(#"rush_boss_health", "^2Damage Dealt: ^1"
                //+ SpectreHealthDealt + "^5/^1" + PegasusHealthNeeded);
            }
            
            if (!level flag::get(#"hash_6dab61ca45a8eaea") && !b_bool)
            {
                LUINotifyEvent(#"rush_boss_phase", 3, 3, int(PegasusHealthDealtDown), int(PegasusHealthNeededDown));

                // health bar
                BoxHealth = PegasusHealthNeededDown - PegasusHealthDealtDown;

                if(MainTimeRed < getTime() - 225)
                {
                    LUINotifyEvent(#"rush_boss_health_bar", 2, 1, int(100 * BoxHealth / PegasusHealthNeededDown)); // max health
                    LUINotifyEvent(#"rush_boss_health_bar", 1, 3);
                    MainTimeRed = GetTime();
                }

                // white one
                if(MainTimeWhite < getTime() - 425)     
                {
                    LUINotifyEvent(#"rush_boss_health_bar_l", 2, 1, int(100 * BoxHealth / PegasusHealthNeededDown));
                    MainTimeWhite = GetTime();
                }
            }

            //ShieldHudElemSetText(#"rush_boss_phase", "^2Damage Dealt (Stunned): ^1"
            //+ PegasusHealthDealtDown + "^5/^1" + PegasusHealthNeededDown);

            else 
            {
                LUINotifyEvent(#"rush_boss_phase", 3, 3, int(PegasusHealthDealtDown), SpectreHealthNeeded);

                // health bar
                BoxHealth = SpectreHealthNeeded - PegasusHealthDealtDown;

                if(MainTimeRed < getTime() - 225)
                {
                    LUINotifyEvent(#"rush_boss_health_bar", 2, 1, int(100 * BoxHealth / SpectreHealthNeeded)); // max health
                    LUINotifyEvent(#"rush_boss_health_bar", 1, 3);
                    MainTimeRed = GetTime();
                }

                // white one
                if(MainTimeWhite < getTime() - 425)     
                {
                    LUINotifyEvent(#"rush_boss_health_bar_l", 2, 1, int(100 * BoxHealth / SpectreHealthNeeded));
                    MainTimeWhite = GetTime();
                }
                
                //ShieldHudElemSetText(#"rush_boss_phase", "^2Damage Dealt (Stunned): ^1"
                //+ PegasusHealthDealtDown + "^5/^1" + "25000");
            }
            
            util::wait_network_frame(1);
        }
        break;

        case "Dead":
        level flag::wait_till(#"boss_fight_started");

        wait 15;
        if(!isDefined(level.s_boss.var_4944ec8)) break;
        Wolf = level.s_boss.var_4944ec8;
        WolfLogic = level.s_boss;

        /#
        ShieldHudElemSetText(#"rush_boss", "^1Diego");
        ShieldHudElemSetText(#"rush_boss_health", "^2Damage Dealt: ^7" + "??" + "^3/^9" + "??");
        ShieldHudElemSetText(#"rush_boss_phase", "^2Current Phase: ^4Phase One");
        ShieldHudElemSetText(#"rush_boss_line", "^8___________________________");
        ShieldHudElemSetText(#"rush_boss_wipes", "^8___________________________");
        #/

        LUINotifyEvent(#"rush_boss", 2, 6, 0);
        LUINotifyEvent(#"rush_boss_health", 4, 1, 1, 1, 1);
        LUINotifyEvent(#"rush_boss_phase", 1, 0);
        LUINotifyEvent(#"rush_boss_wipes", 1, 4);
        LUINotifyEvent(#"rush_boss_line", 1, 1);
        LUINotifyEvent(#"rush_boss_line_2", 1, 1);
        LUINotifyEvent(#"rush_boss_health_bar", 1, 3);
        LUINotifyEvent(#"rush_boss_health_bar", 1, 5); // for dotn only
        LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 1);
        LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 2);
        LUINotifyEvent(#"rush_boss_health_bar_l", 1, 3);
        LUINotifyEvent(#"rush_boss_health_bar_l", 1, 5);
        LUINotifyEvent(#"rush_boss_box", 1, 1);
        
        MainTimeWhite = GetTime();
        MainTimeRed = GetTime();
        while(true)
        {
            LUINotifyEvent(#"rush_boss", 2, 6, level.WolfStunStatus);

            HealthDealt = WolfLogic.var_57badb98;
            HealthDealtNeed = WolfLogic.var_c962047c;
            MainHealth = HealthDealtNeed - HealthDealt;

            if(isdefined(HealthDealt) && isdefined(HealthDealtNeed))
            {
                LUINotifyEvent(#"rush_boss_health", 3, 2, int(HealthDealt), int(HealthDealtNeed));
                //ShieldHudElemSetText(#"rush_boss_health",
                //"^2Damage Dealt: ^7"
                //+ HealthDealt + "^4/^2"
                //+ HealthDealtNeed); // show

                // red one
                if(MainTimeRed < getTime() - 200)
                {
                    LUINotifyEvent(#"rush_boss_health_bar", 2, 1, int(100 * MainHealth / HealthDealtNeed)); // max health
                    LUINotifyEvent(#"rush_boss_health_bar", 1, 3);
                    MainTimeRed = GetTime();
                }

                // white one
                if(MainTimeWhite < getTime() - 400)
                {
                    LUINotifyEvent(#"rush_boss_health_bar_l", 2, 1, int(100 * MainHealth / HealthDealtNeed));
                    MainTimeWhite = GetTime();
                }
            }
            
            LUINotifyEvent(#"rush_boss_wipes", 1, level.WolfPhase);
            //ShieldHudElemSetText(#"rush_boss_phase", "^2Current Phase: ^5" + level.WolfPhase + " " + level.WolfStunStatus);
            util::wait_network_frame(1);
        }
        break;

        case "Blood":
        level waittill(#"hash_3bb155b55ea4338a"); // boss fight when teleporting
        
        /#
        ShieldHudElemSetText(#"rush_boss", "^1Scarlett");
        ShieldHudElemSetText(#"rush_boss_health", "^2Current Phase: ^4Phase One");
        ShieldHudElemSetText(#"rush_boss_phase", "^3Orbs Health: ^9??");
        ShieldHudElemSetText(#"rush_boss_line", "^8___________________________");
        ShieldHudElemSetText(#"rush_boss_wipes", "^8___________________________");
        #/

        // phase and health are SWAPPED!!!

        LUINotifyEvent(#"rush_boss", 1, 7);
        LUINotifyEvent(#"rush_boss_health", 1, 5);
        LUINotifyEvent(#"rush_boss_phase", 2, 1, 15);
        LUINotifyEvent(#"rush_boss_wipes", 1, 0);
        LUINotifyEvent(#"rush_boss_line", 1, 1);
        LUINotifyEvent(#"rush_boss_line_2", 1, 1);
        LUINotifyEvent(#"rush_boss_health_bar", 1, 3);
        LUINotifyEvent(#"rush_boss_health_bar", 1, 10); // test?
        LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 1);
        LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 5);
        LUINotifyEvent(#"rush_boss_health_bar_l", 1, 3);
        LUINotifyEvent(#"rush_boss_health_bar_l", 1, 8);
        LUINotifyEvent(#"rush_boss_box", 1, 1);

        MainTimeWhite = GetTime();
        MainTimeRed = GetTime();
        while(true)
        {
            LUINotifyEvent(#"rush_boss_phase", 2, 1, level.BloodPhase);

            //ShieldHudElemSetText(#"rush_boss_health", "^2Current Phase: ^5" + level.BloodPhase);

            LUINotifyEvent(#"rush_boss_health", 2, 6, int(level.BloodOrbsHealth));

            //ShieldHudElemSetText(#"rush_boss_phase", "^3Orbs Health: ^9"
            //+ level.BloodOrbsHealth
            //+ "^3/^9" + level.BloodOrbsHealth1
            //+ "^3/^9" + level.BloodOrbsHealth2);

            OrbsHealthBox = level.BloodOrbsHealth;

            if(MainTimeRed < getTime() - 225) // 264,000 -> 22 orbs and everyone of those has 12,000 health...
            {
                LUINotifyEvent(#"rush_boss_health_bar", 2, 1, int(100 * OrbsHealthBox / 264000)); // 3 * 12000 -> 3000 * 4 -> max health
                LUINotifyEvent(#"rush_boss_health_bar", 1, 3);
                MainTimeRed = GetTime();
            }

            // white one
            if(MainTimeWhite < getTime() - 425)     
            {
                LUINotifyEvent(#"rush_boss_health_bar_l", 2, 1, int(100 * OrbsHealthBox / 264000));
                MainTimeWhite = GetTime();
            }

            util::wait_network_frame(1);
        }
        break;

        case "AO":
        level flag::wait_till(#"boss_fight_started");

        /#
        ShieldHudElemSetText(#"rush_boss", "^1Zero");
        ShieldHudElemSetText(#"rush_boss_health", "^2Current Phase: ^4Phase One");
        ShieldHudElemSetText(#"rush_boss_phase", "^3 Souls Charged: " + level.ZeroSouls + "^5/^460");
        ShieldHudElemSetText(#"rush_boss_line", "^8___________________________");
        ShieldHudElemSetText(#"rush_boss_wipes", "^8___________________________");
        #/

        // phase and health are SWAPPED!!!

        LUINotifyEvent(#"rush_boss", 1, 8);
        LUINotifyEvent(#"rush_boss_health", 2, 7, level.ZeroSouls);
        LUINotifyEvent(#"rush_boss_phase", 1, 0);
        LUINotifyEvent(#"rush_boss_wipes", 2, 7, 1);
        LUINotifyEvent(#"rush_boss_line", 1, 1);
        LUINotifyEvent(#"rush_boss_line_2", 1, 1);
        LUINotifyEvent(#"rush_boss_health_bar", 1, 3);
        LUINotifyEvent(#"rush_boss_health_bar", 1, 5); // for dotn/ao only
        LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 1);
        LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 2);
        LUINotifyEvent(#"rush_boss_health_bar_l", 1, 3);
        LUINotifyEvent(#"rush_boss_health_bar_l", 1, 5);
        LUINotifyEvent(#"rush_boss_box", 1, 1);

        MainTimeWhite = GetTime();
        MainTimeRed = GetTime();
        while(true)
        {
            //ShieldHudElemSetText(#"rush_boss_health", "^2Current Phase: ^5" + level.ZeroPhase);
            //ShieldHudElemSetText(#"rush_boss_phase", "^3Souls Charged: ^1" + level.ZeroSouls + "^5/^460");

            if(level.ZeroCharges < 4)
            {
                LUINotifyEvent(#"rush_boss_health", 2, 7, level.ZeroSouls); 

                // red one
                if(MainTimeRed < getTime() - 225)
                {
                    LUINotifyEvent(#"rush_boss_health_bar", 2, 1, int(100 * level.ZeroSouls / 60)); // max souls
                    LUINotifyEvent(#"rush_boss_health_bar", 1, 4);
                    MainTimeRed = GetTime();
                }

                // white one
                if(MainTimeWhite < getTime() - 425)     
                {
                    LUINotifyEvent(#"rush_boss_health_bar_l", 2, 1, int(100 * level.ZeroSouls / 60));
                    MainTimeWhite = GetTime();
                }

                LUINotifyEvent(#"rush_boss_wipes", 2, 7, level.ZeroPhase);
            }
            else
            {
                LUINotifyEvent(#"rush_boss_health", 2, 11, 11); // last
                LUINotifyEvent(#"rush_boss_phase", 2, 2, 1); // line
                LUINotifyEvent(#"rush_boss_wipes", 1, 0);
                LUINotifyEvent(#"rush_boss_line_2", 1, 0);

                LUINotifyEvent(#"rush_boss_health_bar", 1, 0);
                LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 0);
                LUINotifyEvent(#"rush_boss_health_bar_l", 1, 0);
                //LUINotifyEvent(#"rush_boss_phase", 0);
                //ShieldHudElemSetText(#"rush_boss_phase", "^8___________________________");
                //ShieldHudElemSetText(#"rush_boss_wipes", "");
            }

            util::wait_network_frame(1);
        }
        break;

        case "Tag":
        level flag::wait_till(#"hell_on_earth");
        level endon(#"hold_round_end");

        /#
        ShieldHudElemSetText(#"rush_boss", "^1The Lockdown");
        ShieldHudElemSetText(#"rush_boss_health", "^2Current Speed: ^4??");
        ShieldHudElemSetText(#"rush_boss_phase", "^3 Souls Charged: " + level.ARSouls + "^5/^4" + level.ARSoulsRequired);
        ShieldHudElemSetText(#"rush_boss_line", "^8___________________________");
        ShieldHudElemSetText(#"rush_boss_wipes", "^8___________________________");
        #/

        // phase and health are SWAPPED!!!

        LUINotifyEvent(#"rush_boss", 1, 9);
        LUINotifyEvent(#"rush_boss_health", 3, 8, level.ARSouls, level.ARSoulsRequired);
        LUINotifyEvent(#"rush_boss_phase", 1, 0);
        LUINotifyEvent(#"rush_boss_wipes", 1, 15);
        LUINotifyEvent(#"rush_boss_line", 1, 1);
        LUINotifyEvent(#"rush_boss_line_2", 1, 1);
        LUINotifyEvent(#"rush_boss_health_bar", 1, 3);
        LUINotifyEvent(#"rush_boss_health_bar", 1, 5);
        LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 1);
        LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 2);
        LUINotifyEvent(#"rush_boss_health_bar_l", 1, 3);
        LUINotifyEvent(#"rush_boss_health_bar_l", 1, 5);
        LUINotifyEvent(#"rush_boss_box", 1, 1);

        MainTimeWhite = GetTime();
        MainTimeRed = GetTime();
        while(true)
        {
            // ShieldHudElemSetText(#"rush_boss", "^1The Lockdown - ^3Charging");

            if(!level.ARLaststand)
            {
                if(level.ARCharging) LUINotifyEvent(#"rush_boss", 2, 9, 10);
                else LUINotifyEvent(#"rush_boss", 1, 9);

                //LUINotifyEvent(#"rush_boss", 1, 9);
                LUINotifyEvent(#"rush_boss_wipes", 2, 1, level.CurrentSpeedAR);
                LUINotifyEvent(#"rush_boss_health", 3, 8, level.ARSouls, level.ARSoulsRequired);

                if(MainTimeRed < getTime() - 225)
                {
                    LUINotifyEvent(#"rush_boss_health_bar", 2, 1, int(100 * level.ARSouls / level.ARSoulsRequired)); // max souls
                    LUINotifyEvent(#"rush_boss_health_bar", 1, 4);
                    MainTimeRed = GetTime();
                }

                // white one
                if(MainTimeWhite < getTime() - 425)     
                {
                    LUINotifyEvent(#"rush_boss_health_bar_l", 2, 1, int(100 * level.ARSouls / level.ARSoulsRequired));
                    MainTimeWhite = GetTime();
                }
            }
            else
            {
                LUINotifyEvent(#"rush_boss", 2, 9, 11);
                LUINotifyEvent(#"rush_boss_wipes", 1, 0);
                LUINotifyEvent(#"rush_boss_line_2", 1, 0);
                LUINotifyEvent(#"rush_boss_health", 1, 10);
                
                LUINotifyEvent(#"rush_boss_health_bar", 1, 0);
                LUINotifyEvent(#"rush_boss_health_bar_bg", 1, 0);
                LUINotifyEvent(#"rush_boss_health_bar_l", 1, 0);
                //ShieldHudElemSetText(#"rush_boss", "^1The Lockdown - ^3Final");
                //ShieldHudElemSetText(#"rush_boss_phase", "");
                //ShieldHudElemSetText(#"rush_boss_wipes", "");
                //ShieldHudElemSetText(#"rush_boss_health", "^8___________________________");
            }
            
            //ShieldHudElemSetText(#"rush_boss", "^1The Lockdown");
            //ShieldHudElemSetText(#"rush_boss_health", "^2Current Speed: ^5" + level.CurrentSpeedAR);
            //ShieldHudElemSetText(#"rush_boss_phase", "^3Souls Charged: ^1" + level.ARSouls + "^5/^4" + level.ARSoulsRequired);

            util::wait_network_frame(1);
        }
        break;
    }

    //UpdateBossHealthHud(); // ---> stack overflow
}

UpdateQuestHud()
{
    level endon(#"StopQuestDetect");

    wait 30;

    level flag::wait_till("all_players_spawned");
    level flag::wait_till("initial_blackscreen_passed"); // waits for players
    switch(BO4GetMap())
    {
        case "IX":
        case "Voyage":
        case "AE":
        case "Tag":
        MainQuest = level._ee[#"main_quest"];
        break;

        case "AO":
        MainQuest = level._ee[#"zm_white_main_quest"];
        break;

        case "Dead":
        MainQuest1 = level._ee[#"zm_mansion_triad"];
        MainQuest2 = level._ee[#"hash_578d0d7709a00e6e"];
        MainQuest3 = level._ee[#"hash_559b7237b8acece2"];
        break;
    }

    if(!isdefined(MainQuest) && !isdefined(MainQuest1))
    {
        LUINotifyEvent(#"rush_quest_detect", 1, 0);
        //foreach(player in level.players) player clientfield::set_to_player("" + #"rush_quest_detect_text", 61); // remove
        return;
    }

    while(true)
    {
        if(isDefined(MainQuest))
        {
            foreach (Step in MainQuest.steps)
            {
                if(isdefined(Step))
                {
                    if (Step.started && !Step.completed)
                    {
                        if(isdefined(Step.name)) ee_step_name_hash = Step.name;
                        break;
                    }
                }  
            }
        }
        
        // DOTN Logic
        if(isDefined(MainQuest1)) 
        {
            foreach (Step in MainQuest1.steps)
            {
                if(isdefined(Step))
                {
                    if (Step.started && !Step.completed)
                    {
                        if(isdefined(Step.var_e788cdd7)) ee_step_name_hash = Step.var_e788cdd7;
                        break;
                    }
                }  
            }
        }

        if(isDefined(MainQuest2))
        {
            foreach (Step in MainQuest2.steps)
            {
                if(isdefined(Step))
                {
                    if (Step.started && !Step.completed)
                    {
                        if(isdefined(Step.var_e788cdd7)) ee_step_name_hash1 = Step.var_e788cdd7;
                        break;
                    }
                }  
            }
        }

        if(isDefined(MainQuest3))
        {
            foreach (Step in MainQuest3.steps)
            {
                if(isdefined(Step))
                {
                    if (Step.started && !Step.completed)
                    {
                        if(isdefined(Step.var_e788cdd7)) ee_step_name_hash2 = Step.var_e788cdd7;
                        break;
                    }
                }  
            }
        }
        
        if(isdefined(ee_step_name_hash))
        {
            if(!isDefined(ee_step_name_hash1)) ee_step_name = GetMainQuestStep(ee_step_name_hash);
            else ee_step_name = GetMainQuestStep(ee_step_name_hash, ee_step_name_hash1, ee_step_name_hash2);

            LUINotifyEvent(#"rush_quest_detect", 3, 1, ee_step_name, randomIntRange(1, 10));
            //foreach(player in level.players) player clientfield::set_to_player("" + #"rush_quest_detect_text", ee_step_name);
            //ShieldHudElemSetText(#"rush_quest_detect", "^4Current Main Quest Step " + ee_step_name);
        }
        else
        {
            if (BO4GetMap() == "AE") // ae has an issue with fast restart first step
            {
                LUINotifyEvent(#"rush_quest_detect", 3, 1, 11, randomIntRange(1, 10));
                //foreach(player in level.players) player clientfield::set_to_player("" + #"rush_quest_detect_text", 11); // push bow
                //ShieldHudElemSetText(#"rush_quest_detect", "^4Current Main Quest Step " + ee_step_name);
            }
            else
            {
                LUINotifyEvent(#"rush_quest_detect", 3, 1, 60, randomIntRange(1, 10));
                //foreach(player in level.players) player clientfield::set_to_player("" + #"rush_quest_detect_text", 60); // unknown
                //ShieldHudElemSetText(#"rush_quest_detect", "^4Current Main Quest Step " + ee_step_name);
            }
        }
        wait 1;
    } 
}

GetMainQuestStep(QuestStep, QuestStep1 = undefined, QuestStep2 = undefined)
{
    switch(BO4GetMap())
    {
        case "IX":
        switch(QuestStep)
        {
            case #"boss_battle":
            ee_step_name = 62;
            break;

            case #"collect_ingredients":
            ee_step_name = 21;
            break;

            case #"mix_fertilizer":
            ee_step_name = 22;
            break;

            case #"place_fertilizer":
            ee_step_name = 23;
            break;

            case #"hash_c165871a3fda034":
            ee_step_name = 24;
            break;

            case #"activate_bulls":
            ee_step_name = 25;
            break;

            case #"activate_puzzle":
            ee_step_name = 26;
            break;

            case #"hash_1cf74a26bf73d769":
            ee_step_name = 27;
            break;

            case #"hash_73c85b5a7924fcfb":
            ee_step_name = 28;
            break;

            case #"activate_lightning_balls":
            ee_step_name = 29;
            break;

            case #"gladiator_round":
            ee_step_name = 30;
            break;

            case #"maelstrom_completed":
            ee_step_name = 31;
            break;

            case #"light_runes":
            ee_step_name = 32;
            break;

            case #"pressure_plate":
            ee_step_name = 33;
            break;

            case #"trilane_defend":
            ee_step_name = 34;
            break;
        }
        if(!isDefined(ee_step_name)) ee_step_name = 60;
        break;

        case "Voyage":
        switch(QuestStep)
        {
            case #"step_3":
            ee_step_name = 16;
            break;

            case #"step_4":
            ee_step_name = 17;
            break;

            case #"step_5":
            ee_step_name = 18;
            break;

            case #"step_6":
            ee_step_name = 19;
            break;

            case #"step_7":
            ee_step_name = 20;
            break;

            case #"step_8":
            ee_step_name = 61;
            break;

            case #"step_9":
            ee_step_name = 62;
            break;
        }
        if(!isDefined(ee_step_name)) ee_step_name = 60;
        break;

        case "Tag":
        switch(QuestStep)
        {
            case #"hash_86e283359f19a5f":
            ee_step_name = 49;
            break;

            case #"hash_467104204a4803ad":
            ee_step_name = 50;
            break;

            case #"hash_7c16d3a3e4250b9a":
            ee_step_name = 51;
            break;

            case #"hash_2dfcd4264b2c2340":
            ee_step_name = 52;
            break;

            case #"hash_c2e45a40a675911":
            ee_step_name = 49;
            break;

            case #"hash_72bc0ec65f4afcca":
            ee_step_name = 50;
            break;

            case #"hash_28c88f40ace27a7b":
            ee_step_name = 53;
            break;

            case #"hash_382d731d4de07ed3":
            ee_step_name = 54;
            break;

            case #"hash_2c00866b95e17ff5":
            ee_step_name = 55;
            break;

            case #"hash_ebca448700872b8":
            ee_step_name = 49;
            break;

            case #"hash_810019231f11ea1":
            ee_step_name = 50;
            break;

            case #"hash_11c4f1ecb0dd5a34":
            ee_step_name = 56;
            break;

            case #"hash_d0bf3cf30a07a84":
            ee_step_name = 57;
            break;

            case #"hash_13b9abe1bd17294c":
            ee_step_name = 48;
            break;

            case #"hash_7d78cef11f6afb5e":
            ee_step_name = 58;
            break;

            case #"hash_2bd81e2b05fccbed":
            ee_step_name = 59;
            break;
        }
        if(!isDefined(ee_step_name)) ee_step_name = 60;
        break;

        case "AE":
        switch(QuestStep)
        {
            case #"teleport":
            ee_step_name = 8;
            break;

            case #"blood":
            ee_step_name = 9;
            break;

            case #"split":
            ee_step_name = 10;
            break;

            case #"oil":
            ee_step_name = 11;
            break;
            
            case #"hash_1b1abb2af5960bfe":
            ee_step_name = 12;
            break;

            case #"play":
            ee_step_name = 13;
            break;

            case #"reflect":
            ee_step_name = 14;
            break;

            case #"cleanse":
            ee_step_name = 15;
            break;
        }
        if(!isDefined(ee_step_name)) ee_step_name = 60;
        break;

        case "AO":
        switch(QuestStep)
        {
            case #"hash_482ab5c3c8c111fc":
            ee_step_name = 1;
            break;

            case #"mq2_cv1":
            ee_step_name = 2;
            break;

            case #"mq3_cv2":
            ee_step_name = 3;
            break;

            case #"mq4_cv3":
            ee_step_name = 4;
            break;

            case #"mq5_cv4":
            ee_step_name = 5;
            break;

            case #"mq6_cv5":
            ee_step_name = 6;
            break;

            case #"hash_3a3d5f6df2a45005":
            ee_step_name = 7;
            break;

            case #"hash_12ea405f7c5f915c":
            ee_step_name = 62;
            break;
        }
        if(!isDefined(ee_step_name)) ee_step_name = 60;
        break;

        case "Dead": // I FUCKING HATE THIS LOGIC!!!
        // this is not step.name, but "step.var_e788cdd7" instead...
        if(!level flag::get(#"gazed_main_hall") && !level flag::get(#"gazed_library") && !level flag::get(#"gazed_greenhouse"))
         ee_step_name = 46; // activate any

        if(level flag::get(#"gazed_main_hall") && !level flag::get(#"forest_complete"))
        {
            switch(QuestStep)
            {
                case #"triad_step_1": // knights
                ee_step_name = 35;
                break;

                case #"triad_step_2":
                ee_step_name = 36;
                break;

                case #"triad_step_3":
                ee_step_name = 37;
                break;

                case #"triad_step_4":
                ee_step_name = 38;
                break;
            }
        }

        if(level flag::get(#"gazed_library") && !level flag::get(#"greenhouse_open"))
        {
            switch(QuestStep2)
            {
                case #"hash_2388f47d8d90bdfb": // rings\beam
                ee_step_name = 42;
                break;

                case #"hash_2388f57d8d90bfae":
                ee_step_name = 43;
                break;

                case #"hash_2388f67d8d90c161":
                ee_step_name = 44;
                break;

                case #"hash_2388f77d8d90c314":
                ee_step_name = 45;
                break;
            }
        }

        if(level flag::get(#"gazed_greenhouse") && !level flag::get(#"cemetery_done"))
        {
            switch(QuestStep1)
            {
                case #"hash_6e38611b5382ee7f": // stick
                ee_step_name = 39;
                break;

                case #"hash_6e38621b5382f032":
                ee_step_name = 40;
                break;

                case #"hash_6e38631b5382f1e5":
                ee_step_name = 41;
                break;
            }
        }

        if(level flag::get(#"cemetery_open") && level flag::get(#"forest_done") && level flag::get(#"greenhouse_open")) // all ee done
         ee_step_name = 47;
        
        if(!isDefined(ee_step_name)) ee_step_name = 46; // unknown <- activate stone
        break;
    }

    return ee_step_name;
}

UpdateZombieCounter() 
{
    //level endon(#"end_game", #"game_ended");

    // wait zombie team
    while (!isdefined(level.zombie_team)) waitframe(1);

    level flag::wait_till("all_players_spawned"); // wait for lua
    level flag::wait_till("initial_blackscreen_passed"); // waits for players

    old_count = -1;
    old_remaining = -1;

    while (true) 
    {
        zombies = GetAITeamArray(level.zombie_team);
        count = 0;

        foreach (zmb in zombies) 
        {
            if (isdefined(zmb.ignore_enemy_count) && zmb.ignore_enemy_count) continue;
            count++;
        }

        old_remaining = level.zombie_total;

        LUINotifyEvent(#"rush_zombie_counter", 3, 1, count, old_remaining);
        util::wait_network_frame(1);

        /#
        if (count != old_count) 
        {
            old_count = count;
            foreach (plt in getplayers()) 
            {
                plt clientfield::set_to_player("" + #"zombies_counter_alive", count);
            }
        }

        if (level.zombie_total != old_remaining) 
        {
            old_remaining = level.zombie_total;
            foreach (plt in getplayers()) 
            {
                plt clientfield::set_to_player("" + #"zombies_counter_remaining", old_remaining);
            }
        }
        #/
    }
}

UpdateRushCounter(Seconds)
{
    //level endon(#"end_game", #"game_ended");
    self endon(#"death"); // oops i forgot

    for (i = Seconds; i >= 2; i--)
    {
        self LUINotifyEvent(#"rush_counter", 2, 1, i);
        self LUINotifyEvent(#"rush_event_box", 2, 1, int(100 * i / Seconds));
        //ShieldHudElemSetText(#"rush_counter", "^6Next Rush Mod Event in: ^8" + i);
        wait 1;
    }
    
    self LUINotifyEvent(#"rush_counter", 2, 1, 1);
    self LUINotifyEvent(#"rush_event_box", 2, 1, 0);
    wait 1;

    self LUINotifyEvent(#"rush_counter", 1, 2);
    self LUINotifyEvent(#"rush_event_box", 1, 2);

    /#
    // a little delay -> (csc)
    self LUINotifyEvent(#"rush_counter", 2, 1, 1);
    self LUINotifyEvent(#"rush_event_box", 2, 1, 1);
    //ShieldHudElemSetText(#"rush_counter", "^6Next Rush Mod Event in: ^8" + 1);
    wait 0.8;
    #/
    //ShieldHudElemSetText(#"rush_counter", "^6Event Activated");

    //self clientfield::set_to_player("" + #"rush_counter_int", Seconds);
}

UpdateRushEvent(MsgMain, WaitTime, ID)
{
    self endon(#"death"); // oops i forgot for fucking second time
    //level endon(#"end_game", #"game_ended");

    //Ent = self getEntityNumber();

    self LUINotifyEvent(#"rush_event", 2, 1, ID);
    //self thread clientfield::set_to_player("" + #"rush_event_text", ID);

    wait(WaitTime);
    self LUINotifyEvent(#"rush_event", 1, 60); // ^1--- ^2No Event
    //self thread clientfield::set_to_player("" + #"rush_event_text", 60); // ^1--- ^2No Event
}

CustomErrorMessage(Msg)
{
    self endon(#"death");

    ErrorMsg(Msg);
}

CustomAssertMessage(Msg)
{
    self endon(#"death");

    AssertMsg(Msg);
}