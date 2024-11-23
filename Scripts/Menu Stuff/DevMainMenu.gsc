runMenuIndex(menu)
{
    self endon("disconnect");

    if(!isDefined(menu))
        menu = "Main";
    
    switch(menu)
    {
        case "Main":
            self addMenu(menu, "Dev Menu");
            if(self getVerification() > 0)
            {
                self addOpt("Personal Menu", &newMenu, "Personal Menu");
                self addOpt("Skip Stuff", &newMenu, "Skip Stuff");
                self addOpt("Boss Stuff", &newMenu, "Boss Stuff");
                self addOpt("Flags Stuff", &newMenu, "Flags Stuff");
                self addOpt("Map Selection", &newMenu, "Map Selection");
                self addOpt("Fun Menu", &newMenu, "Fun Menu");
                self addOpt("Spawn Menu", &newMenu, "Spawn Menu");
                self addOpt("Elixir Menu", &newMenu, "Elixir Menu");
                self addOpt("Weapon Menu", &newMenu, "Weapon Menu");
                self addOpt("Powerups Menu", &newMenu, "Powerups Menu");
                self addOpt("Zombie Menu", &newMenu, "Zombie Menu");
                self addOpt("Mystery Box Menu", &newMenu, "Mystery Box Menu");
                self addOpt("Account Menu", &newMenu, "Account Menu");
                self addOpt("Teleport Menu", &newMenu, "Teleport Menu");
                if(self getVerification() > 1)
                {
                    if(self getVerification() > 2)
                    {
                        if(self getVerification() > 3)
                        {
                            if(self IsHost() || self getVerification() > 3)
                                self addOpt("Host Menu", &newMenu, "Host Menu");
                                self addOpt("Player Menu", &newMenu, "Players");
                                self addOpt("All Players Options", &newMenu, "AllClient");
                                self addOpt("Menu Settings", &newMenu, "Menu Settings");
                        }
                    }
                }
                self addOpt("Test Menu", &newMenu, "Test Menu");
            }
            break;
        case "AllClient":
            self addMenu(menu, "All Client Options");
                self addOpt("All God Mode", &ClientFuncs, 0, undefined);
                self addOpt("All Unlimited Ammo", &ClientFuncs, 1, undefined);
                self addOpt("All Max Points", &ClientFuncs, 2, undefined);
                self addOpt("Give Everyone All Perks", &ClientFuncs, 3, undefined);
                self addOptIncSlider("Self Revives", &SetSelfRevives, 0, 0, 125, 5);
        break;
        case "Spawn Menu":
            self addMenu(menu, "Spawn Menu");
                self addOpt("Spawn Zombie", &SpawnZombieMenu);
                self addOpt("Spawn BlightFather", &SpawnBlightMenu);
                self addOpt("Spawn BlightFather (No TP)", &SpawnBlight);
                self addOpt("Spawn Werewolf", &SpawnWerewolfMenu);
                self addOpt("Attempt Spawn Brutus", &BrutusSpawnBloodMenu);
        break;
        case "Test Menu":
            self addMenu(menu, "Test Menu");
                self addOpt("Do VO", &TalkingTest);
                self addOptIncSlider("Spawn Test Model", &SpawnModelTest, 1, 1, 5, 1);
                self addOpt("Test Function", &TestFunction);
                self addOpt("Test Function 2", &TestFunction2);
                self addOpt("Follow the Duck Test", &ZombieFollowDuck, player);
                self addOpt("Invisible Zombies Test", &InvisibleZombies, player);
                if(BO4GetMap() == "IX") self addOptIncSlider("Spawn an Elephant IX (Phase)", &SpawnElephantIX, 1, 1, 2, 1);
                if(BO4GetMap() == "AO") self addOpt("Spawn Avoc AO", &SpawnAvocAO);
                self addOptIncSlider("Stats Reset Test", &Stats_Reset, 0, 0, 10000, 30);
                self addOpt("Fake Lag Test", &FakeError);
        break;
        case "Boss Stuff":
            self addMenu(menu, "Boss Stuff");
                self addOpt("Eye Stuff", &newMenu, "Eye Stuff");
                self addOpt("Brutus Final Stuff", &newMenu, "Brutus Final Stuff");
                self addOpt("Elephant Stuff", &newMenu, "Elephant Stuff");
                self addOpt("Spec Stuff", &newMenu, "Spec Stuff");
                self addOpt("Tag Stuff", &newMenu, "Tag Stuff");
                self addOpt("Zero Stuff", &newMenu, "Zero Stuff");
                self addOpt("Wolf Stuff", &newMenu, "Wolf Stuff");
        break;
        case "Wolf Stuff":
            self addMenu(menu, "Wolf Stuff");
                self addOptIncSlider("Set Wolf Damage Dealt", &WolfSetHealth, 0, 0, 250000, 10000);
        break;
        case "Zero Stuff":
            self addMenu(menu, "Zero Stuff");
                self addOptIncSlider("Zero Souls Count", &ZeroSoulsMenu, 0, 0, 60, 5);
        break;
        case "Tag Stuff":
            self addMenu(menu, "Tag Stuff");
                self addOptIncSlider("Speed Up AR", &SpeedUpAR, 0, 0, 125, 5);
                self addOptIncSlider("Souls Count AR", &ARChangeSoul, 0, 0, 125, 5);
        break;
        case "Elephant Stuff":
            self addMenu(menu, "Elephant Stuff");
                self addOpt("Elephant Skip Intro (Use Before Lockdown!)", &ElephSkip);
                self addOpt("Elephant Set Low Health", &ElephLowHealth);
        break;
        case "Spec Stuff":
            self addMenu(menu, "Spec Stuff");
                self addOpt("Spec Skip Mid-Phase 1", &SpecSkip1);
                self addOpt("Spec Skip Phase 1 > 2", &SpecSkip2);
                self addOptIncSlider("Spec Damage Dealt", &SpecHealthDown, 0, 0, 27500, 2500);
                self addOptIncSlider("Spec Damage Dealt Stunned", &SpecHealthDownStun, 0, 0, 27500, 2500);
        break;
        case "Eye Stuff":
            self addMenu(menu, "Eye Stuff");
                self addOpt("Eye - Perform Blast Attack", &EyeControlMenu, 1);
                self addOpt("Eye - Perform Combo Attack", &EyeControlMenu, 2);
                self addOpt("Eye - Perform BM Attack", &EyeControlMenu, 3);
                self addOpt("Eye - Perform MST Attack", &EyeControlMenu, 4);
                self addOpt("Eye - Perform Boss Arrive", &EyeControlMenu, 6);
                self addOpt("Eye - Perform Boss Leave", &EyeControlMenu, 7);
                self addOpt("Eye - Perform Boss Move (Buggy)", &EyeControlMenu, 5);
                self addOpt("Eye - Custom Move Logic", &EyeMenuMove);
                self addOpt("Eye - Go Fucking Crazy (Buggy)", &EyeGoCrazy);
                self addOpt("Eye - Start Boss - No Phase Selected", &Eye_SkipNoPhaseSelected);
                self addOpt("Eye - Start Boss - Skip to Phase 5", &Eye_SkipPhase5);
                self addOpt("Eye - Phase 5 | Set Wipe Attacks to 2", &EyeSkipWipes);
                self addOpt("Eye - Skip Current Phase", &EyeSkip);
                self addOpt("Eye - Skip Current Phase Timer", &EyeSkipTimer);
                self addOpt("Eye - Buff Health High", &EyeMenuBuff, 1);
                self addOpt("Eye - Buff Health Low", &EyeMenuBuff, 2);
        break;
        case "Brutus Final Stuff":
            self addMenu(menu, "Brutus Final Stuff");
                self addOpt("Brutus - Skip to Last Phase (8)", &BloodBrutusSkip);
                self addOpt("Brutus - Perform Spcial Attack", &BrutusDoSpecialAttack);
        break;
        case "Skip Stuff":
            self addMenu(menu, "Skip Stuff");            
                self addOpt("IX Boss Teleport Activate", &IXOpenPortal);
                self addOpt("IX Cutscene Activate", &IXCutSceneSetUp);
                self addOpt("IX Test Scene", &ScenePlayTest);
                self addOpt("DOTN Boss Fight Activate", &DOTNBossActivate);
                self addOpt("DOTN Cutscene Load Test", &LoadTest);
                self addOpt("Alpha Omega Boss Fight Activate", &AlphaBossActivate);
                self addOpt("Alpha Omega PAP Activate", &AlphaSkipPAP);
                self addOpt("AE Boss Fight Activate", &AEBossActivate);
                self addOpt("AE Portal Activate", &AEPortalActivate);
                self addOpt("AE ScenePlay", &AECutscenePlay);
                self addOpt("AE ScenePlay From Boss Function", &AECutscenePlay_FromBoss);
                self addOpt("AE ScenePlay Mid-IGC", &AECutscenePlayIGC);
                self addOpt("AE Skip Skip Hit Marks", &AESkipIGSC);
                self addOpt("VOD Cutscene Load Test", &VODCutSceneSetUp);
                self addOpt("VOD Boss Fight Activate", &VODBossActivate);
                self addOpt("VOD zm_sq Skip to Step Test", &SkipToStep);
                self addOpt("VOD Open Final Portal", &VODFinalPortalO);
                self addOpt("VOD Start Boss Function", &VODFinalBoss);
                self addOpt("VOD PaP Enable", &VODPAPEnable);
                self addOpt("Blood Skip Bird", &BloodSkipBird);
                self addOpt("Blood Full Skip", &BloodFullSkip);
                self addOpt("Blood Cutscene Play", &PlayBloodScene);
                self addOpt("Blood IGC Cutscene Play", &PlayBloodSceneIGC);
                self addOpt("Tag Skip To Lockdown", &TagSkip); 
                self addOpt("Tag Play Outro", &TagPlayOutro); 
                self addOpt("Classified Cutscene", &FiveCutscene); 
        break;
        case "Flags Stuff":
            self addMenu(menu, "Flags Stuff");   
            self addOpt("Check Flags", &CheckFlags); 
            switch (BO4GetMap())
            {
                case "AO":
                self addOpt("Flag 'mq_computer_activated'", &FlagActivate, 1);
                self addOpt("Flag 'hash_58b6a09577af5b6d'", &FlagActivate, 2);
                self addOpt("Flag 'hash_3b5dac8c2aa1bb31'", &FlagActivate, 3);
                self addOpt("Flag 'hash_13e9bb1de846d022'", &FlagActivate, 4);
                self addOpt("Flag 'hash_63d6d5191ca09cae -- Clock Step Skip'", &FlagActivate, 5);
                self addOpt("Flag 'hash_10b7ed627014a952'", &FlagActivate, 6);
                self addOpt("Flag 'hash_15ca9944ac87c57e'", &FlagActivate, 7);
                self addOpt("Flag 'hash_32c6d727b3de8407'", &FlagActivate, 8);
                self addOpt("Flag 'hash_3ee4f9c58fbc63bd'", &FlagActivate, 9);
                self addOpt("Flag 'hash_485ced30125950ac'", &FlagActivate, 10);
                self addOpt("Flag 'hash_4046ffe851ff5b1c'", &FlagActivate, 11);
                self addOpt("Flag 'hash_2a7f2737e415ffd1'", &FlagActivate, 12);
                self addOpt("Flag 'hash_b53fb25b12e713'", &FlagActivate, 13);
                self addOpt("Flag 'hash_84e6c8a0b5f7e1e'", &FlagActivate, 14);
                self addOpt("Flag 'hash_5744a0be920e5002'", &FlagActivate, 15);
                self addOpt("Flag 'hash_487c2805cd41d547'", &FlagActivate, 16);
                self addOpt("Flag 'hash_2b7c76b6b0dfc0fd'", &FlagActivate, 17);
                self addOpt("Flag 'boss_fight_started'", &FlagActivate, 18);
                self addOpt("Flag 'boss_fight_complete'", &FlagActivate, 19);
                self addOpt("Flag 'hash_7432d2728d0f50e8'", &FlagActivate, 20);
                self addOpt("Flag 'hash_5aa1c9627e8626e0'", &FlagActivate, 21);
                self addOpt("Flag 'hash_7cc3b03eefb11fc'", &FlagActivate, 22);
                self addOpt("Flag 'hash_2fd002acaea672e4'", &FlagActivate, 23);
                self addOpt("Flag 'crawler_step_complete'", &FlagActivate, 24);
                self addOpt("Flag 'hash_bbe0772d001265'", &FlagActivate, 25);
                self addOpt("Flag 'hash_6a79293e26344b0f'", &FlagActivate, 26);
                self addOpt("Flag 'hash_8f3e7e5efab6d13'", &FlagActivate, 27);
                self addOpt("Flag 'hash_4ad92dd97af40a26'", &FlagActivate, 28);
                self addOpt("Flag 'hash_bd08d5649673cd1'", &FlagActivate, 29);
                self addOpt("Flag 'hash_1478cafcd626c361'", &FlagActivate, 30);
                self addOpt("Flag 'circuit_step_complete'", &FlagActivate, 31);
                self addOpt("Flag 'hash_60eeaaec1ff2cb28'", &FlagActivate, 32);
                self addOpt("Flag 'hash_a2a33348aff3bff'", &FlagActivate, 33);
                self addOpt("Flag 'hash_2f57ff102a73c0b5'", &FlagActivate, 34);
                self addOpt("Flag 'hash_687dde640557a121'", &FlagActivate, 35);
                self addOpt("Flag 'hash_6899cc997afd5fac'", &FlagActivate, 36);
                self addOpt("Flag 'hash_6ebb9d0d0539bf68'", &FlagActivate, 37);
                self addOpt("Flag 'hash_3b808ddcae9fea60'", &FlagActivate, 38);
                self addOpt("Flag 'hash_7c2ae917559738ec'", &FlagActivate, 39);
                self addOpt("Flag 'hash_12854365001ac5c'", &FlagActivate, 40);
                self addOpt("Flag 'hash_3972ecbdd044ba98'", &FlagActivate, 41);
                self addOpt("Flag 'orb_path_completed'", &FlagActivate, 42);
                self addOpt("Flag 'hash_66be0eea77b87d58'", &FlagActivate, 43);
                self addOpt("Flag 'hash_1227f015cd55af9d'", &FlagActivate, 44);
                self addOpt("level.var_9427911d ::::Control:::: '", &FlagActivate, 45);
                self addOpt("level.var_9427911d ::::Control:::: '", &FlagActivate, 46);
                break;

                case "AE": 
                self addOpt("Flag 'monument_changed'", &FlagActivate, 1);
                self addOpt("Flag 'hash_4e74b4172497a14a'", &FlagActivate, 2);
                self addOpt("Flag 'oil_completed'", &FlagActivate, 3);
                self addOpt("Flag 'hash_70a5801e57336554'", &FlagActivate, 4);
                self addOpt("Flag 'split_completed'", &FlagActivate, 5);
                self addOpt("Flag 'flag_prophecy_completed'", &FlagActivate, 6);
                self addOpt("Flag 'flag_light_completed'", &FlagActivate, 7);
                self addOpt("Flag 'hash_f38b18eaf7b063b'", &FlagActivate, 8);
                self addOpt("Flag 'hash_5a7f1f9adac6dc8c'", &FlagActivate, 9);
                break;

                case "Tag":
                self addOpt("Flag 'dials_aquired'", &FlagActivate, 1);
                self addOpt("Flag 'dials_done'", &FlagActivate, 2);
                self addOpt("Flag 'vessel_found'", &FlagActivate, 3);
                self addOpt("Flag 'blood_hints'", &FlagActivate, 4);
                self addOpt("Flag 'blood_waiting'", &FlagActivate, 5);
                self addOpt("Flag 'blood_active'", &FlagActivate, 6);
                self addOpt("Flag 'hash_e8247a060147428'", &FlagActivate, 7);
                self addOpt("Flag 'hash_43c116bdb3a96e16'", &FlagActivate, 8);
                self addOpt("Flag 'hash_710c2f40baf302c8'", &FlagActivate, 9);
                self addOpt("Flag 'hash_3a8a317fc0b5e5b0'", &FlagActivate, 10);
                self addOpt("Flag 'hash_57d2cbf7d6c2035a'", &FlagActivate, 11);
                self addOpt("Flag 'hash_238e5c8b416f855'", &FlagActivate, 12);
                self addOpt("Flag 'hash_4923165da58bf5cf'", &FlagActivate, 13);
                self addOpt("Flag 'hash_5630cdbbb58f1b1e'", &FlagActivate, 14);
                self addOpt("Flag 'hash_7b6c32b9937aee62'", &FlagActivate, 15);
                self addOpt("Flag 'hash_11d64d1f93c196cc'", &FlagActivate, 16);
                self addOpt("Flag 'hash_4898001eb77cb16f'", &FlagActivate, 17);
                self addOpt("Flag 'hash_5266a594b96823e2'", &FlagActivate, 18);
                self addOpt("Flag 'hash_1d9afa9be4c10160'", &FlagActivate, 19);
                self addOpt("Flag 'blood_waiting'", &FlagActivate, 20);
                self addOpt("Flag 'hash_2c3411c8b8b421d8'", &FlagActivate, 21);
                break;

                case "Blood":
                self addOpt("Flag 'hash_379fc22ed85f0dbc'", &FlagActivate, 1);
                self addOpt("Flag 'hash_68a1656980e771da'", &FlagActivate, 2);
                self addOpt("Flag 'main_quest_completed'", &FlagActivate, 3);
                self addOpt("Flag 'hash_2f5be8d749b4e88e'", &FlagActivate, 4);
                self addOpt("Flag 'hash_40e9ad323fe8402a'", &FlagActivate, 5);
                self addOpt("Flag 'hash_36138b6e1d539829'", &FlagActivate, 6);
                self addOpt("Flag 'hash_6048c3f423fd987'", &FlagActivate, 7);
                self addOpt("Flag 'hash_61bba9aa86f61865'", &FlagActivate, 8);
                self addOpt("Flag 'hash_3cc421108aedf47f'", &FlagActivate, 9);
                self addOpt("Flag 'dm_ready'", &FlagActivate, 10);
                self addOpt("Flag 'hash_1b4b6ce05cb62d56'", &FlagActivate, 11);
                self addOpt("Flag 'hash_3d16465b22e70170'", &FlagActivate, 12);
                self addOpt("Flag 'richtofen_sacrifice'", &FlagActivate, 13);
                self addOpt("Flag 'hash_68923445ebf488f0'", &FlagActivate, 14);
                self addOpt("Flag 'hash_12a631be319641a1'", &FlagActivate, 15);
                self addOpt("Flag 'hash_7680c620ba7315e5'", &FlagActivate, 16);
                self addOpt("Flag 'hash_73b06a8a2c0b0e8d'", &FlagActivate, 17);
                self addOpt("Flag 'hash_8c500dbad4c6edb'", &FlagActivate, 18);
                self addOpt("Flag 'seagull_blasted'", &FlagActivate, 19);
                self addOpt("Flag 'hash_38f418ba1b5571a2'", &FlagActivate, 20);
                self addOpt("Flag 'hash_1b94645b5f964ebe'", &FlagActivate, 21);
                self addOpt("Flag 'hash_11ed3188b9f33eab'", &FlagActivate, 22);
                self addOpt("Flag 'hash_29b90ce9aa921f78 - Skip Challenges'", &FlagActivate, 23);
                //self addOpt("Start BOTD Challanges Test", &StartBOTDChallenges);
                break;

                case "Voyage":
                self addOpt("Flag 'hash_2d1cd18f39ac5fa7'", &FlagActivate, 1);
                self addOpt("Flag 'hash_515a88d1cbabc18e'", &FlagActivate, 2);
                self addOpt("Flag 'hash_1322dd3a3d7411a5'", &FlagActivate, 3);
                self addOpt("Flag 'hash_2f5be8d749b4e88e'", &FlagActivate, 4);
                self addOpt("Flag 'hash_33a5d8dd1204080e'", &FlagActivate, 5);
                self addOpt("Flag 'hash_652ae68711aa37c1'", &FlagActivate, 6);
                self addOpt("Flag 'hash_63ebf7fc2afa76ea'", &FlagActivate, 7);
                self addOpt("Flag 'hash_70eb07a177cf8881'", &FlagActivate, 8);
                self addOpt("Flag 'hash_65e37079e0d22d47'", &FlagActivate, 9);
                self addOpt("Flag 'catalyst_encounters_completed'", &FlagActivate, 10);
                self addOpt("Flag 'hash_7a31252c7c941976'", &FlagActivate, 11);
                self addOpt("Flag 'hash_27a2746eb30e61c'", &FlagActivate, 12);
                self addOpt("Flag 'hash_3e80d503318a5674'", &FlagActivate, 13);
                self addOpt("Flag 'hash_452df3df817c57f9'", &FlagActivate, 14);
                self addOpt("Flag 'hash_63a102a7ae564e99'", &FlagActivate, 15);
                self addOpt("Flag 'orrery_activated'", &FlagActivate, 16);
                self addOpt("Flag 'hash_76dd603f61fa542d'", &FlagActivate, 17);
                self addOpt("Flag 'hash_77f76266b597a1f7'", &FlagActivate, 18);
                self addOpt("Flag 'planet_step_completed'", &FlagActivate, 19);
                self addOpt("Flag 'hash_1a742576c41a0ab9'", &FlagActivate, 20);
                self addOpt("Flag 'hash_767ce45fce848b88'", &FlagActivate, 21);
                self addOpt("Flag 'hash_349bc60cedc7491e'", &FlagActivate, 22);
                self addOpt("Flag 'hash_280d10a2ac060edb'", &FlagActivate, 23);
                break;
                
                case "IX":
                self addOpt("Flag 'hash_4fd3d0c01f9b4c30'", &FlagActivate, 1);
                self addOpt("Flag 'hash_23c79f4deefd8aa1'", &FlagActivate, 2);
                self addOpt("Flag 'hash_7f6689c71e55e8ab'", &FlagActivate, 3);
                self addOpt("Flag 'hash_4866241882c534b7'", &FlagActivate, 4);
                self addOpt("Flag 'hash_34294ceb082c5d8f'", &FlagActivate, 5);
                self addOpt("Flag 'hash_4f293396150d2c00 - Rush Disable'", &FlagActivate, 6);
                self addOpt("Flag 'hash_353dcb95f778ad73'", &FlagActivate, 7);
                self addOpt("Flag 'hash_37071af70fe7a9f2'", &FlagActivate, 8);
                self addOpt("Flag 'collect_ingredients_completed'", &FlagActivate, 9);
                self addOpt("Flag 'collect_charcoal_completed'", &FlagActivate, 10);
                self addOpt("Flag 'hash_4c6ced4815715faf'", &FlagActivate, 11);
                self addOpt("Flag 'collect_dung_completed'", &FlagActivate, 12);
                self addOpt("Flag 'mix_fertilizer_completed'", &FlagActivate, 13);
                self addOpt("Flag 'place_fertilizer_completed'", &FlagActivate, 14);
                self addOpt("Flag 'hash_498204258011f15e'", &FlagActivate, 15);
                self addOpt("Flag 'bull_heads_completed'", &FlagActivate, 16);
                self addOpt("Flag 'hash_7136198009a72989'", &FlagActivate, 17);
                self addOpt("Flag 'hash_36efad26d2c9c9cd - Rush Change'", &FlagActivate, 18);
                self addOpt("Flag 'hash_e35ac19ee7b732c'", &FlagActivate, 19);
                self addOpt("Flag 'hash_768860cb3ad76c68'", &FlagActivate, 20);
                self addOpt("Flag 'hash_77bd156a70de5aa3'", &FlagActivate, 21);
                self addOpt("Flag 'hash_3666dca19f0f98b3'", &FlagActivate, 22);
                self addOpt("Flag 'hash_1d004da0a75202bc'", &FlagActivate, 23);
                self addOpt("Flag 'hash_35bd62e100e54ab3'", &FlagActivate, 24);
                self addOpt("Flag 'hash_4f15d2623e98015d'", &FlagActivate, 25);
                self addOpt("Flag 'hash_5734e11875c30d69'", &FlagActivate, 26);
                self addOpt("Flag 'hash_50e2bacfe0486f6a'", &FlagActivate, 27);
                self addOpt("Flag 'hash_4f26632e308bd2e6'", &FlagActivate, 28);
                self addOpt("Flag 'hash_415c59c3573153ff'", &FlagActivate, 29);
                self addOpt("Flag 'hash_2c274140cd602e60'", &FlagActivate, 30);
                self addOpt("Flag 'hash_5e49848f6ac0bc6b'", &FlagActivate, 31);
                self addOpt("Flag 'hash_4feaeb49c7362da7'", &FlagActivate, 32);
                self addOpt("Flag 'hash_403b629f7e5829ee'", &FlagActivate, 33);
                self addOpt("Flag 'hash_20c92720a4602dc7'", &FlagActivate, 34);
                self addOpt("Flag 'hash_cad6742c753621'", &FlagActivate, 35);
                self addOpt("Flag 'hash_6b64093194524df3'", &FlagActivate, 36);
                self addOpt("Flag 'hash_2bf040db75b1dac7'", &FlagActivate, 37);
                self addOpt("Flag 'hash_277d03629ade12e8'", &FlagActivate, 38);
                break;
            }
        break;
        case "Host Menu":
            self addMenu(menu, "Host Menu");
                self addOptBool(level.BO4NoFallD, "No Fall", &BO4NoFallDam);
                self addOptBool(level.PauseZombies, "Pause Zombies", &PauseZombieSpawn);
                self addOptBool(level.SuperJump, "Super Jump", &SuperJump);
                self addOptBool(level.SuperSpeed, "Super Speed", &SuperSpeed);
                self addoptBool(level.B4Gravity, "Low Gravity", &B4Gravity);
                self addOptBool(self.ForcingTheHost, "Force Host", &ForceHostToggle);
                self addOptBool(self.AntiQuit, "Anti Quit", &AntiQuit);
                self addOptIncSlider("Set Time Scale", &TimeScale, 0, -1, 20, 1);
                self addOpt("Anti Join", &AntiJoin);
                self addOpt("End Game", &NotifyEndGame);
                self addOpt("Play EE Song", &PlayEESong);
                self addOpt("Refresh Current Map (more than once will crash)", &RefreshMap);
                self addOpt("Exit Level", &PlayerExitLevel);
                //self addOpt("Print Coords", &BO4OriginPrint);
                self addOpt("Restart Map", &RestartMap);
            break;
        case "Players":
            self addMenu(menu, "Players");
                foreach(player in level.players)
                {
                    if(!isDefined(player.playerSetting["verification"]))
                        player.playerSetting["verification"] = level.MenuStatus[level.AutoVerify];
                    
                    self addOpt("[^5" + player.playerSetting["verification"] + "^6]" + player getName(), &newMenu, "Options " + player GetEntityNumber());
                }
            break;
        default:
            foundplayer = false;
            for(a=0;a<level.players.size;a++)
            {
                sepmenu = StrTok(menu, " ");
                if(int(sepmenu[(sepmenu.size - 1)]) == level.players[a] GetEntityNumber())
                {
                    foundplayer = true;
                    self MenuOptionsPlayer(menu, level.players[a]);
                }
            }
            
            if(!foundplayer)
            {
                self addMenu(menu, "404 ERROR");
                    self addOpt("Page Not Found");
            }
            break;
    }
}

MenuOptionsPlayer(menu, player)
{
    self endon("disconnect");
    
    sepmenu = StrTok(menu, " " + player GetEntityNumber());
    newmenu = "";
    for(a=0;a<sepmenu.size;a++)
    {
        newmenu += sepmenu[a];
        if(a != (sepmenu.size - 1))
            newmenu += " ";
    }
    
    switch(newmenu)
    {
        case "Personal Menu":
            self addMenu(menu, "Personal Menu");
                self addOptBool(self.godmode, "God Mode", &Godmode);
                self addOptBool(self.UnlimitedAmmo, "Unlimited Ammo", &UnlimitedAmmo);
                self addOptBool(self.Noclip, "No Clip", &NoclipToggle, self);
                self addOptBool(self.recoil, "No Recoil", &ToggleRecoil);
                self addOptBool(self.thirdperson, "Third Person", &thirdperson);
                self addOptBool(self.UnlimitedSprint, "Unlimited Sprint", &UnlimitedSprint);
                self addOptBool(self.NoTarg, "No Target", &notarget);
                self addOptBool(self.promod, "Promod", &ProMod);
                self addOptBool(self.PSpeed, "x2 Speed", &PSpeed);
                self addOpt("Award Self Res", &GetSelfRes);
                self addOpt("Revive Yourself", &BO4Rev);
                self addOpt("All Perks", &GiveAllPerks);
                self addOpt("Score Menu", &newMenu, "Score Menu");
                self addOpt("Clone", &Clone);
                self addOptBool(self.DisableHUD, "Disable All HUD", &DisableHUD);
                self addOptBool(self.DisableSomeHUD, "Disable Some HUD", &DisableSomeHUD);
                self addOpt("Print Coords", &BO4OriginPrint);
                self addOpt("Print Gun Angles", &PrintGunAngles);
        break;
        case "Elixir Menu":
            self addMenu(menu, "Elixir Menu"); //Should be complete
            self addOpt("Mega Elixirs", &newMenu, "Mega Elixirs");
            self addOpt("Legendary Elixirs", &newMenu, "Legendary Elixirs");
            self addOpt("Rare Elixirs", &newMenu, "Rare Elixirs");
            self addOpt("Common Elixirs", &newMenu, "Common Elixirs");
            self addOpt("Classic Elixirs", &newMenu, "Classic Elixirs");
        break;
        case "Mega Elixirs":
            self addMenu(menu, "Mega Elixirs");//Done
                self addOpt("Shopping Free", &GiveTimedElixir, "zm_bgb_shopping_free");
                self addOpt("Head Drama", &GiveTimedElixir, "zm_bgb_head_drama");
                self addOpt("Secret Shopper", &GiveTimedElixir, "zm_bgb_secret_shopper");
                self addOpt("Reign Drops", &GiveInstantElixir, "zm_bgb_reign_drops");
                self addOpt("Power Vacuum", &GiveTimedElixir, "zm_bgb_power_vacuum");
                self addOpt("Near Death Experience", &GiveTimedElixir, "zm_bgb_near_death_experience");
                self addOpt("Phoenix Up", &GiveInstantElixir, "zm_bgb_phoenix_up");
                self addOpt("Conflagration Liquidation", &GiveInstantElixir, "zm_bgb_conflagration_liquidation");
                self addOpt("Join The Party", &GiveInstantElixir, "zm_bgb_join_the_party");
                self addOpt("Perkaholic", &GiveInstantElixir, "zm_bgb_perkaholic");
                self addOpt("Refresh Mint", &GiveInstantElixir, "zm_bgb_refresh_mint");
                self addOpt("Suit Up", &GiveInstantElixir, "zm_bgb_suit_up");
                self addOpt("Wall Power", &GiveTimedElixir, "zm_bgb_wall_power");
        break;
        case "Legendary Elixirs":
            self addMenu(menu, "Legendary Elixirs");//Done
                self addOpt("Cache Back", &GiveInstantElixir, "zm_bgb_cache_back");
                self addOpt("Dividend Yield", &GiveTimedElixir, "zm_bgb_dividend_yield");
                self addOpt("Free Fire", &GiveTimedElixir, "zm_bgb_free_fire");
                self addOpt("Perk Up", &GiveInstantElixir, "zm_bgb_perk_up");
                self addOpt("Power Keg", &GiveInstantElixir, "zm_bgb_power_keg");
                self addOpt("Wall To Wall Clearance", &GiveTimedElixir, "zm_bgb_wall_to_wall_clearance");
                self addOpt("Undead Man Walking", &GiveTimedElixir, "zm_bgb_undead_man_walking");
        break;
        case "Rare Elixirs":
            self addMenu(menu, "Rare Elixirs");
                self addOpt("Alchemical Antithesis", &GiveTimedElixir, "zm_bgb_alchemical_antithesis");
                self addOpt("Blood Debt", &GiveTimedElixir, "zm_bgb_blood_debt");
                self addOpt("Extra Credit", &GiveInstantElixir, "zm_bgb_extra_credit");
                self addOpt("Immolation Liquidation", &GiveInstantElixir, "zm_bgb_immolation_liquidation");
                self addOpt("Kill Joy", &GiveInstantElixir, "zm_bgb_kill_joy");
                self addOpt("Shields Up", &GiveInstantElixir, "zm_bgb_shields_up");
                self addOpt("Talkin Bout Regeneration", &GiveTimedElixir, "zm_bgb_talkin_bout_regeneration");
        break;
        case "Common Elixirs":
            self addMenu(menu, "Common Elixirs");//Done
                self addOpt("Bullet Boost", &GiveInstantElixir, "zm_bgb_bullet_boost");
                self addOpt("CTRL-Z", &GiveTimedElixir, "zm_bgb_ctrl_z");
                self addOpt("Dead of Nuclear Winter", &GiveInstantElixir, "zm_bgb_dead_of_nuclear_winter");
                self addOpt("In Plain Sight", &GiveTimedElixir, "zm_bgb_in_plain_sight");
                self addOpt("Licensed Contractor", &GiveInstantElixir, "zm_bgb_licensed_contractor");
                self addOpt("Phantom Reload", &GiveTimedElixir, "zm_bgb_phantom_reload");
                self addOpt("Sword Flay", &GiveTimedElixir, "zm_bgb_sword_flay");
                self addOpt("Who's Keeping Score", &GiveInstantElixir, "zm_bgb_whos_keeping_score");

        break;
        case "Classic Elixirs":
            self addMenu(menu, "Classic Elixirs");//complete, All Elixirs Work
                self addOpt("Always Done Swiftly", &GiveTimedElixir, "zm_bgb_always_done_swiftly");
                self addOpt("Anywhere But Here", &GiveInstantElixir, "zm_bgb_anywhere_but_here");
                self addOpt("Burned Out", &GiveTimedElixir, "zm_bgb_burned_out");
                self addOpt("Equip Mint", &GiveInstantElixir, "zm_bgb_equip_mint");
                self addOpt("Head Scan", &GiveTimedElixir, "zm_bgb_head_scan");
                self addOpt("Temporal Gift", &GiveTimedElixir, "zm_bgb_temporal_gift");
                self addOpt("Aftertaste", &GiveTimedElixir, "zm_bgb_aftertaste");
                self addOpt("Point Drops", &GiveInstantElixir, "zm_bgb_point_drops");
                self addOpt("Anti-Entrapment", &GiveTimedElixir, "zm_bgb_anti_entrapment");
                self addOpt("Nowhere But There", &GiveInstantElixir, "zm_bgb_nowhere_but_there");
                self addOpt("Now You See Me", &GiveTimedElixir, "zm_bgb_now_you_see_me");
                self addOpt("Arsenal Accelerator", &GiveTimedElixir, "zm_bgb_arsenal_accelerator");
                self addOpt("Pop Shocks", &GiveTimedElixir, "zm_bgb_pop_shocks");
                self addOpt("Stock Option", &GiveTimedElixir, "zm_bgb_stock_option");
                self addOpt("Newtonian Negation", &GiveTimedElixir, "zm_bgb_newtonian_negation");
                self addOpt("Quacknarok", &GiveTimedElixir, "zm_bgb_quacknarok");
        break;
        case "Map Selection":
            self addMenu(menu, "Map Selection");
                self addOpt("IX", &ChangeMap, "zm_towers");
                self addOpt("Blood Of The Dead", &ChangeMap, "zm_escape");
                self addOpt("Voyage of Despair", &ChangeMap, "zm_zodt8");
                self addOpt("Dead of The Night", &ChangeMap, "zm_mansion");
                self addOpt("Ancient Evil", &ChangeMap, "zm_red");
                self addOpt("Alpha Omega", &ChangeMap, "zm_white");
                self addOpt("Classified", &ChangeMap, "zm_office");
                self addOpt("Tag Der Toten", &ChangeMap, "zm_orange");
        break;
        case "Teleport Menu": //Coords, Loc name for iprint
            self addMenu(menu, "Teleport Menu");
                if(BO4GetMap() == "IX"){
                    self addOpt("Zeus Perk Machine", &BO4newOrigin, (1993.89, -479.343, 212.125), "Zeus Perk Machine");
                    self addOpt("Odin Perk Machine", &BO4newOrigin, (2020.7, 341.974, 215.125), "Odin Perk Machine");
                    self addOpt("Ra Perk Machine", &BO4newOrigin, (-1809.33, 423.894, 212.125), "Ra Perk Machine");
                    self addOpt("Danu Perk Machine", &BO4newOrigin, (-1922.34, -443, 216.313), "Danu Perk Machine");
                    self addOpt("Challenge Podium", &BO4newOrigin, (58.3157, -24.4512, 80.125), "Challenge Podium");
                    self addOpt("The Pit", &BO4newOrigin, (151.776, 1802.6, -365.875), "The Pit");
                }
                else if(BO4GetMap() == "Blood"){
                    self addOpt("Richtofen's Lab", &BO4newOrigin, (9953.67, 11261.1, 256.125), "Richtofen's Lab");
                    self addOpt("West Grounds", &BO4newOrigin, (8661.22, 10287.5, 513.077), "West Grounds");
                    self addOpt("Power Switch One", &BO4newOrigin, (8892.1, 8851.01, 423.469), "Power Switch One");
                    self addOpt("New Industries", &BO4newOrigin, (7083.19, 11134.6, 311.625), "New Industries");
                    self addOpt("Recreation Yard", &BO4newOrigin, (4836.18, 10932.7, 1016.13), "Recreation Yard");
                    self addOpt("Cafeteria", &BO4newOrigin, (2589.46, 9645.69, 1336.13), "Cafeteria");
                    self addOpt("2nd Floor Cell Block", &BO4newOrigin, (869.781, 9690.19, 1443.13), "2nd Floor Cell Block");
                    self addOpt("Wardens Office", &BO4newOrigin, (-588.591, 8613.38, 1336.13), "Wardens Office");
                    self addOpt("Wardens House", &BO4newOrigin, (-2382.56, 7745.07, 1304.13), "Wardens House");
                    self addOpt("Citadel Tunnels", &BO4newOrigin, (420.385,9506.33,1104.13), "Citadel Tunnels");
                    self addOpt("Building 64 Powerhouse", &BO4newOrigin, (-1037.37, 6576.8, 70.1152), "Building 64 Powerhouse");
                    self addOpt("Docks", &BO4newOrigin, (-543.102, 5451.18, -71.875), "Docks");
                    self addOpt("Prison Roof", &BO4newOrigin, (3467.25, 9740.63, 1704.13), "Prison Roof");
                }
                else if(BO4GetMap() == "Voyage"){
                    self addOpt("Poop Deck", &BO4newOrigin, (6.67061, 4843.74, 1216.12), "Poop Deck");
                    self addOpt("Boiler Room", &BO4newOrigin, (8.88611, 622.069, 320.125), "Boiler Room");  
                    self addOpt("Dining Hall", &BO4newOrigin, (-457.054, -775.388, 1056.13), "Dining Hall");
                    self addOpt("1st Class Lounge", &BO4newOrigin, (-160.682, -612.253, 1216.13), "1st Class Lounge");
                    self addOpt("Forecastle", &BO4newOrigin, (118.374, -4506.12, 928.125), "Forecastle");
                }
                else if(BO4GetMap() == "Classified"){
                    self addOpt("Conference Room", &BO4newOrigin, (-911.255, 2531.01, 16.125), "Conference Room");
                    self addOpt("Main Offices", &BO4newOrigin, (333.581, 2069.82, 16.125), "Main Offices");
                    self addOpt("War Room Upper Level", &BO4newOrigin, (-1468.32, 2040.02, -303.875), "War Room Upper Level");
                    self addOpt("War Room Lower Level", &BO4newOrigin, (-317.895, 2114.2, -511.875), "War Room Lower Level");
                    self addOpt("Laboratories", &BO4newOrigin, (333.581, 2069.82, 16.125), "Laboratories");
                }
                else if(BO4GetMap() == "Dead"){
                    self addOpt("Sentinal Artifact", &BO4newOrigin, (-2.56008, -928.784, -7.875), "Sentinal Artifact");
                    self addOpt("North Atrium Bridge", &BO4newOrigin, (11.2006, 956.359, 25.7624), "North Atrium Bridge");
                    self addOpt("Bedroom", &BO4newOrigin, (1727.24, 1165.29, -7.875), "Bedroom");
                    self addOpt("Wine Cellar", &BO4newOrigin, (-249.745, -1334.12, -415.875), "Wine Cellar");
                    self addOpt("Mausoleum", &BO4newOrigin, (-4474.56, 524.39, 272.125), "Mausoleum");
                    self addOpt("Library", &BO4newOrigin, (-1512.27, 485.992, -209.684), "Library");
                    self addOpt("Greenhouse Laboratories", &BO4newOrigin, (4356.48, -73.3307, -439.875), "Greenhouse Laboratories");
                    self addOpt("Forest", &BO4newOrigin, (-13.9522, 5562.84, -783.936), "Forest");
                }
                else if(BO4GetMap() == "AE"){
                    self addOpt("Temple of Apollo", &BO4newOrigin, (-786.167, -867.222, 64.125), "Temple of Apollo");
                    self addOpt("Amphitheater", &BO4newOrigin, (-1990.29, 1212.24, 252.125), "Amphitheater");
                    self addOpt("Spartan Monument", &BO4newOrigin, (803.154, -4110.64, -815.908), "Spartan Monument");
                    self addOpt("River of Sorrow", &BO4newOrigin, (-1220.23, 6305.58, 946.825), "River of Sorrow");
                    self addOpt("Cliff Ruins", &BO4newOrigin, (-2715.52, 7363.74, 527.862), "Cliff Ruins");
                    self addOpt("Python Pass", &BO4newOrigin, (202.279, 8547.08, 434.117), "Python Pass");
                }
                else if(BO4GetMap() == "AO"){
                    self addOpt("Security Checkpoint", &BO4newOrigin, (68.2689, -3217.63, 65.625), "Security Checkpoint");
                    self addOpt("Rushmore", &BO4newOrigin, (1024.37, -2085.02, -39.875), "Rushmore");
                    self addOpt("APD Interrogation", &BO4newOrigin, (-924.275, -1822.22, -50.875), "APD Interrogation");
                    self addOpt("Cul-De-Sac", &BO4newOrigin, (-92.3641, 648.275, -61.125), "Cul-De-Sac");
                    self addOpt("Greenhouse", &BO4newOrigin, (-1178.23, 737.475, 78.125), "Greenhouse");
                    self addOpt("Yelowhouse", &BO4newOrigin, (1201.23, 309.127, 77.125), "Yelowhouse");
                    self addOpt("Beds", &BO4newOrigin, (-40.4824, 1132.1, -415.875), "Beds");
                    self addOpt("APD Control", &BO4newOrigin, (-160.155, -2061.96, -231.875), "APD Control");
                }
                else if(BO4GetMap() == "Tag"){
                    self addOpt("Docks", &BO4newOrigin, (1382.79, 3483.08, 26.625), "Docks");
                    self addOpt("Lagoon", &BO4newOrigin, (1838.13, 618.756, 7.74777), "Lagoon");
                    self addOpt("Lighthouse Cove", &BO4newOrigin, (36.2677, 646.928, 134.026), "Lighthouse Cove");
                    self addOpt("Lighthouse Top", &BO4newOrigin, (133.577, 1406.61, 864.125), "Lighthouse Top");
                    self addOpt("Cave", &BO4newOrigin, (-2008.52, 1986.8, 167.866), "Cave");
                    self addOpt("Sun Deck", &BO4newOrigin, (-626.267, -1333.58, 637.176), "Sun Deck");
                    self addOpt("Forecastle", &BO4newOrigin, (2274.94, -2836.93, 315.773), "Forecastle");
                    self addOpt("Campfire", &BO4newOrigin, (2299.56, -690.696, 5.1327), "Campfire");
                    self addOpt("Human Infusion", &BO4newOrigin, (-3298.49, 4215.59, 1176.13), "Human Infusion");
                    self addOpt("Secret :D", &BO4newOrigin, (-7432.51, -24841.3, 13.5001), "Secret :D");
                }
        break;
        case "Score Menu":
            self addMenu(menu, "Score");
                self addOpt("Max Points", &PlayerGiveScore, 4000000, player);
                self addOpt("Take Points", &PlayerTakeScore, 4000000, player);
                self addOptIncSlider("Add Points", &PlayerGiveScore, 0, 0, 1000000, 10000, player);
                self addOptIncSlider("Take Points", &PlayerTakeScore, 0, 0, 1000000, 10000, player);
            break;

        case "Fun Menu":
            self addMenu(menu, "Fun Menu");
            self addOptBool(self.aimbot, "Aimbot", &bo4_toggleaimbot);
            self addOptBool(self.TeleGun, "Teleport Gun", &StartTeleGun);
            self addOptBool(self.HideWeapon, "Hide Gun", &HideGun);
            self addOptBool(self.Multijump, "Multi Jump", &Multijump);
            self addOptBool(self.personal_instakill, "Insta Kill", &selfInstaKill);
            self addOpt("Spawn Luna Wolf", &LunaWolf);
            self addOpt("Add Bot", &bo4_AddBotsToGame);
            self addOpt("Open All Doors", &BO4_OpenAllDoors);
            self addOptIncSlider("(Better) Edit Round: ", &zombie_goto_roundT, 0, 0, 300, 1);  
            self addOptIncSlider("Edit Round: ", &RoundEdit, 0, 0, 300, 1);   
            self addOpt("Save Location", &SaveLocation, 0);
            self addOpt("Load Location", &SaveLocation, 1);
        break;

        case "Weapon Menu":
            self addMenu(menu, "Weapon Menu");
            self addOpt("Gear Up", &GearUp, self);
            self addOpt("Print Weapon Display Name", &GetWeaponDisplayName);
            self addOpt("Print Weapon Hash", &GetWeaponHash);
            self addOpt("Normal Weapons and items", &newMenu, "Normal Weapons and items");
            self addOpt("Upgraded Weapons", &newMenu, "Upgraded Weapons");
            self addOpt("Camo Selector", &newMenu, "Camo Selector");
            self addOpt("Bullets Menu", &newMenu, "Bullets Menu");
            self addOpt("Upgrade Weapon", &UpgradeWeapon);
            self addOpt("Pack a Punch Effects", &newMenu, "Pack a Punch Effects");
            self addOpt("Drop Weapon", &DropWeapon);
            self addOpt("Take All Weapons", &TakeWeapons);
            self addOpt("Take Current Weapon", &TakeCurrentWeapon);
        break;
        
        case "Bullets Menu":
        self addMenu(menu, "Bullets Menu");
            self addOptBool(self.MagicBullets, "Toggle Magic Bullets", &MagicBullets);
            self addOptBool(self.MagicModels, "Toggle Magic Models", &MagicModels);
            self addOptBool(self.EntGun, "Toggle Ent Gun", &ActivateEntGun);
            self addOpt("Minigun", &changeBulletType, 0);
            self addOpt("Ballistic Knife", &changeBulletType, 1);
            self addOpt("Hellion Salvo", &changeBulletType, 2);
            if(BO4GetMap() == "Blood" || BO4GetMap() == "AO" || BO4GetMap() == "Tag" || BO4GetMap() == "Classified"){
            self addOpt("Ray Gun", &changeBulletType, 3);
        }    
        break;
        case "Pack a Punch Effects":
            self addMenu(menu, "Pack a Punch Effects");
            self addOpt("Brain Rot", &acquireaat, "zm_aat_brain_decay");
            self addOpt("Fire Burst", &acquireaat, "zm_aat_plasmatic_burst");
            self addOpt("Kill o Watt", &acquireaat, "zm_aat_kill_o_watt");
            self addOpt("Cryofreeze", &acquireaat, "zm_aat_frostbite");
            self addOpt("Remove Effect", &RemoveEff, self GetCurrentWeapon());
        break;
        case "Camo Selector":
        self addMenu(menu, "Camo Selector");
            for(a=0;a<96;a++)
                    self addOpt("Camo: " + (a + 1), &bo4_CamoGiver, a);
        break;
        case "Normal Weapons and items":
            self addMenu(menu, "Normal Weapons");
            self addOpt("Assault Rifles", &newMenu, "Assault Rifles");
            self addOpt("Submachine Guns", &newMenu, "SMG");
            self addOpt("Tactical Rifles", &newMenu, "Tactical Rifles");
            self addOpt("Light Machine Guns", &newMenu, "LMG");
            self addOpt("Sniper Rifles", &newMenu, "Sniper Rifles");
            self addOpt("Pistols", &newMenu, "Pistols");
            self addOpt("Shotguns", &newMenu, "Shotguns");
            self addOpt("Special Weapons and items", &newMenu, "Special Weapons and items");
            self addOpt("Map Specific Weapons and items", &newMenu, "Map Specific Weapons and items");
        break;
        case "Assault Rifles":
            self addMenu(menu, "Assault Rifles");
            self addOpt("Give ICR-7", &GiveClientWeapon, "ar_accurate_t8", self);
            self addOpt("Give Maddox RFB", &GiveClientWeapon, "ar_fastfire_t8", self);
            self addOpt("Give Rampart 17", &GiveClientWeapon, "ar_damage_t8", self);
            self addOpt("Give Vapr-XKG", &GiveClientWeapon, "ar_stealth_t8", self);
            self addOpt("Give KN-57", &GiveClientWeapon, "ar_modular_t8", self);
            self addOpt("Give Hitchcock M9", &GiveClientWeapon, "ar_mg1909_t8", self);
            self addOpt("Give Swat RFT", &GiveClientWeapon, "ar_standard_t8", self);
            self addOpt("Give Grav", &GiveClientWeapon, "ar_galil_t8", self);
            self addOpt("Give Peacekeeper", &GiveClientWeapon, "ar_peacekeeper_t8", self);
            self addOpt("Give Echohawk", &GiveClientWeapon, "ar_doublebarrel_t8", self);
            self addOpt("Give AN94", &GiveClientWeapon, "ar_an94_t8", self);
        break;
        case "SMG":
            self addMenu(menu, "Submachine Guns");
            self addOpt("Give MX9", &GiveClientWeapon, "smg_standard_t8", self);
            self addOpt("Give Saug 9mm", &GiveClientWeapon, "smg_handling_t8", self);
            self addOpt("Give Spitfire", &GiveClientWeapon, "smg_fastfire_t8", self);
            self addOpt("Give Cordite", &GiveClientWeapon, "smg_capacity_t8", self);
            self addOpt("Give GKS", &GiveClientWeapon, "smg_accurate_t8", self);
            self addOpt("Give Escargot", &GiveClientWeapon, "smg_drum_pistol_t8", self);
            self addOpt("Give Daemon 3XB", &GiveClientWeapon, "smg_fastburst_t8", self);
            self addOpt("Give Switchblade X9", &GiveClientWeapon, "smg_folding_t8", self);
            self addOpt("Give VMP", &GiveClientWeapon, "smg_vmp_t8", self);
	    self addOpt("Give MicroMG 9mm", &GiveClientWeapon, "smg_minigun_t8", self);
            self addOpt("Give MP40", &GiveClientWeapon, "smg_mp40_t8", self);
            self addOpt("Give M1927", &GiveClientWeapon, "smg_thompson_t8", self);
        break;
        case "Tactical Rifles":
            self addMenu(menu, "Tactical Rifles");
            self addOpt("Give Auger DMR", &GiveClientWeapon, "tr_powersemi_t8", self);
            self addOpt("Give Swordfish", &GiveClientWeapon, "tr_longburst_t8", self);
            self addOpt("Give ABR 223", &GiveClientWeapon, "tr_midburst_t8", self);
            self addOpt("Give S6 Stingray", &GiveClientWeapon, "tr_flechette_t8", self);
            self addOpt("Give Essex Model 07", &GiveClientWeapon, "tr_leveraction_t8", self);
            self addOpt("Give M16", &GiveClientWeapon, "tr_damageburst_t8", self);
        break;
        case "LMG":
            self addMenu(menu, "Light Machine Guns");
            self addOpt("Give VKM 750", &GiveClientWeapon, "lmg_heavy_t8", self);
            self addOpt("Give Hades", &GiveClientWeapon, "lmg_spray_t8", self);
            self addOpt("Give Titan", &GiveClientWeapon, "lmg_standard_t8", self);
            self addOpt("Give Zweihander", &GiveClientWeapon, "lmg_double_t8", self);
            self addOpt("Give Tigershark", &GiveClientWeapon, "lmg_stealth_t8", self);
        break;
        case "Sniper Rifles":
            self addMenu(menu, "Sniper Rifles");
            self addOpt("Give Outlaw", &GiveClientWeapon, "sniper_fastrechamber_t8", self);
            self addOpt("Give Paladin HB50", &GiveClientWeapon, "sniper_powerbolt_t8", self);
            self addOpt("Give SDM", &GiveClientWeapon, "sniper_powersemi_t8", self);
            self addOpt("Give Koshka", &GiveClientWeapon, "sniper_quickscope_t8", self);
            self addOpt("Give Vendetta", &GiveClientWeapon, "sniper_mini14_t8", self);
            self addOpt("Give Locus", &GiveClientWeapon, "sniper_locus_t8", self);
            self addOpt("Give Havelina AA50", &GiveClientWeapon, "sniper_damagesemi_t8", self);
        break;
        case "Pistols":
            self addMenu(menu, "Pistols");
            self addOpt("Give RK 7 Garrison", &GiveClientWeapon, "pistol_burst_t8", self);
            self addOpt("Give Mozu", &GiveClientWeapon, "pistol_revolver_t8", self);
            self addOpt("Give Strife", &GiveClientWeapon, "pistol_standard_t8", self);
            self addOpt("Give Welling", &GiveClientWeapon, "pistol_topbreak_t8", self);
            self addOpt("Give Kap45", &GiveClientWeapon, "pistol_fullauto_t8", self);
        break;
        case "Shotguns":
            self addMenu(menu, "Shotguns");
            self addOpt("Give Mog 12", &GiveClientWeapon, "shotgun_pump_t8", self);
            self addOpt("Give SG12", &GiveClientWeapon, "shotgun_semiauto_t8", self);
            self addOpt("Give Trenchgun", &GiveClientWeapon, "shotgun_trenchgun_t8", self);
            self addOpt("Give Rampage", &GiveClientWeapon, "shotgun_fullauto_t8", self);
            self addOpt("Give Argus", &GiveClientWeapon, "shotgun_precision_t8", self);
        break;
        case "Special Weapons and items":
            self addMenu(menu, "Special Weapons and items");
            self addOpt("Give Hellion Salvo", &GiveClientWeapon, "launcher_standard_t8", self);
            self addOpt("Give Minigun", &GiveClientWeapon, "minigun", self);
            self addOpt("Ballistic Knife", &GiveClientWeapon, "special_ballisticknife_t8_dw", self);
            self addOpt("Crossbow", &GiveClientWeapon, "special_crossbow_t8", self);
            if(BO4GetMap() == "Blood" || BO4GetMap() == "AO" || BO4GetMap() == "Tag" || BO4GetMap() == "Classified"){
                self addOpt("Give Ray Gun", &GiveClientWeapon, "ray_gun", self);
                self addOpt("Monkey Bombs", &GiveClientWeapon, "cymbal_monkey", self);
                self addOpt("Give Ray Gun Mk2", &GiveClientWeapon, "ray_gun_mk2", self);
            }
            //else if(BO4GetMap() == "Voyage" || BO4GetMap() == "Dead" || BO4GetMap() == "IX" || BO4GetMap() == "AE")
                self addOpt("Homunculus", &GiveClientWeapon, "homunculus", self); //Credit SirCryptic / Abomination Unofficial
        break;
        case "Map Specific Weapons and items":
            self addMenu(menu, "Map Specific Weapons and items");
            if(BO4GetMap() == "Voyage"){
                self addOpt("Kraken", &GiveClientWeapon, "ww_tricannon_t8", self);
                self addOpt("Decayed Kraken", &GiveClientWeapon, "ww_tricannon_earth_t8", self);
                self addOpt("Plasmatic Kraken", &GiveClientWeapon, "ww_tricannon_fire_t8", self);
                self addOpt("Purified Kraken", &GiveClientWeapon, "ww_tricannon_water_t8", self);
                self addOpt("Radiant Kraken", &GiveClientWeapon, "ww_tricannon_air_t8", self);
                self addOpt("Ballistic Shield", &GiveClientWeapon, "zhield_dw", self);
            }
            else if(BO4GetMap() == "IX"){
                self addOpt("Brazen Bull", &GiveClientWeapon, "zhield_zword_dw", self);
                self addOpt("Death of Orion", &GiveClientWeapon, "ww_crossbow_t8", self);
            }
            else if(BO4GetMap() == "Blood"){
                self addOpt("Blundergat", &GiveClientWeapon, "ww_blundergat_t8", self);
                self addOpt("Hells Retriever", &GiveClientWeapon, "tomahawk_t8", self);
                self addOpt("Magmagat", &GiveClientWeapon, "ww_blundergat_fire_t8", self);
                self addOpt("AcidGat", &GiveClientWeapon, "ww_blundergat_acid_t8", self);
                self addOpt("Spectral Shield", &GiveClientWeapon, "zhield_spectral_dw", self);
		self addOpt("Spoon", &GiveClientWeapon, "spoon_alcatraz", self);
                self addOpt("Golden Spork", &GiveClientWeapon, "spork_alcatraz", self);
            }
            else if(BO4GetMap() == "Dead"){
                self addOpt("Savage Impaler", &GiveClientWeapon, "ww_crossbow_impaler_t8", self);
                self addOpt("Alistairs Folly", &GiveAlistairsFolly);
                self addOpt("Ballistic Shield", &GiveClientWeapon, "zhield_dw", self);
                self addOpt("Stake Knife (will go back to knife when swapping weapons)", &GiveClientWeapon, "stake_knife", self);
            }
            else if(BO4GetMap() == "AE"){
                self addOpt("Hand of Ouranous", &GiveClientWeapon, "ww_hand_o", self);
                self addOpt("Hand of Hemera", &GiveClientWeapon, "ww_hand_h", self);
                self addOpt("Hand of Gaia", &GiveClientWeapon, "ww_hand_g", self);
                self addOpt("Hand of Charon", &GiveClientWeapon, "ww_hand_c", self);
                self addOpt("Apollo Will", &GiveClientWeapon, "zhield_zpear_dw", self);
                self addOpt("Pegasus Strike", &GiveClientWeapon, "Thunderstorm", self);
            }
            else if(BO4GetMap() == "Tag"){
                self addOpt("ThunderGun", &GiveClientWeapon, "thundergun", self);
                self addOpt("Wunderwaffe DG2", &GiveClientWeapon, "ww_tesla_gun_t8", self);
                self addOpt("Wonderwaffe Sniper", &GiveClientWeapon, "ww_tesla_sniper_t8", self);
                self addOpt("Tundragun", &GiveClientWeapon, "tundragun", self);
		self addOpt("Snowballs", &GiveClientWeapon, "snowball", self);
                self addOpt("Yellow Snowballs", &GiveClientWeapon, "snowball_yellow", self);
                self addOpt("Samantha Box", &GiveClientWeapon, "music_box", self);
                self addOpt("Ballistic Shield", &GiveClientWeapon, "zhield_dw", self);
                self addOpt("Matryoska Dolls", &GiveMatryoskaDolls);
            }
            else if(BO4GetMap() == "AO"){
                self addOpt("Ray Gun II-V", &GiveClientWeapon, "ray_gun_mk2v", self);
                self addOpt("Ray Gun II-X", &GiveClientWeapon, "ray_gun_mk2x", self);
                self addOpt("Ray Gun II-Y", &GiveClientWeapon, "ray_gun_mk2y", self);
                self addOpt("Ray Gun II-Z", &GiveClientWeapon, "ray_gun_mk2z", self);
                self addOpt("Ballistic Shield", &GiveClientWeapon, "zhield_dw", self);
            }
             else if(BO4GetMap() == "Classified"){
                self addOpt("Winter's Howl", &GiveClientWeapon, "ww_freezegun_t8", self);
                self addOpt("Ballistic Shield", &GiveClientWeapon, "zhield_dw", self);
            }    
        break;
        case "Upgraded Weapons":
            self addMenu(menu, "Upgraded Weapons");
            self addOpt("Assault Rifles", &newMenu, "Upgraded AR");
            self addOpt("Submachine Guns", &newMenu, "Upgraded SMG");
            self addOpt("Tactical Rifles", &newMenu, "Upgraded TR");
            self addOpt("Light Machine Guns", &newMenu, "Upgraded LMG");
            self addOpt("Sniper Rifles", &newMenu, "Upgraded SR");
            self addOpt("Pistols", &newMenu, "Upgraded Pistols");
            self addOpt("Shotguns", &newMenu, "Upgraded Shotguns");
            self addOpt("Special Weapons", &newMenu, "Upgraded Specials");
        break;
        case "Upgraded AR":
            self addMenu(menu, "Upgraded Assault Rifles");
            self addOpt("Impertinent Deanimator", &GiveClientWeapon, "ar_accurate_t8_upgraded", self);
            self addOpt("Red Fiend Bull", &GiveClientWeapon, "ar_fastfire_t8_upgraded", self);
            self addOpt("Parapetrifrier", &GiveClientWeapon, "ar_damage_t8_upgraded", self);
            self addOpt("Creeping Haze", &GiveClientWeapon, "ar_stealth_t8_upgraded", self);
            self addOpt("Ruined Revenger", &GiveClientWeapon, "ar_modular_t8_upgraded", self);
            self addOpt("Waking Nightmare", &GiveClientWeapon, "ar_mg1909_t8_upgraded", self);
            self addOpt("Rift Breacher", &GiveClientWeapon, "ar_standard_t8_upgraded", self);
            self addOpt("Gravstone", &GiveClientWeapon, "ar_galil_t8_upgraded", self);
            self addOpt("Writ of Shamash", &GiveClientWeapon, "ar_peacekeeper_t8_upgraded", self);
            self addOpt("Fanged Doom", &GiveClientWeapon, "ar_doublebarrel_upgraded", self);
            self addOpt("Nightmare Awakened 49", &GiveClientWeapon, "ar_an94_t8_upgraded", self);
        break;
        case "Upgraded SMG":
            self addMenu(menu, "Upgraded SMGs");
            self addOpt("Nuevemuertes xx", &GiveClientWeapon, "smg_standard_t8_upgraded", self);
            self addOpt("Stellar 92", &GiveClientWeapon, "smg_handling_t8_upgraded", self);
            self addOpt("Sky Scorcher", &GiveClientWeapon, "smg_fastfire_t8_upgraded", self);
            self addOpt("Corpsemaker", &GiveClientWeapon, "smg_capacity_t8_upgraded", self);
            self addOpt("Ghoul Keepers Subjugator", &GiveClientWeapon, "smg_accurate_t8_upgraded", self);
            self addOpt("PieceDerResistance", &GiveClientWeapon, "smg_drum_pistol_t8_upgraded", self);
            self addOpt("Excisenin3fold", &GiveClientWeapon, "smg_folding_t8_upgraded", self);
            self addOpt("Unseen Vhand", &GiveClientWeapon, "smg_fastburst_t8_upgraded", self);
            self addOpt("The Dark Impaler", &GiveClientWeapon, "smg_vmp_t8_upgraded", self);
	        self addOpt("Infernal Mercy", &GiveClientWeapon, "smg_minigun_t8_upgraded", self);
            self addOpt("The Afterburner", &GiveClientWeapon, "smg_mp40_t8_upgraded", self);
            self addOpt("Speakeasy", &GiveClientWeapon, "smg_thompson_t8_upgraded", self);
        break;
        case "Upgraded TR":
            self addMenu(menu, "Upgraded Tactical Rifles");
            self addOpt("Dead Mans ReefRacker", &GiveClientWeapon, "tr_powersemi_t8_upgraded", self);
            self addOpt("Astralo-Packy-Cormus", &GiveClientWeapon, "tr_longburst_t8_upgraded", self);
            self addOpt("Br-r-rah", &GiveClientWeapon, "tr_midburst_t8_upgraded", self);
            self addOpt("Macho Manta VI", &GiveClientWeapon, "tr_flechette_t8_upgraded", self);
            self addOpt("Quatermaster's Reapeater", &GiveClientWeapon, "tr_leveraction_t8_upgraded", self);
            self addOpt("Skullpiercer", &GiveClientWeapon, "tr_damageburst_t8_upgraded", self);
        break;
        case "Upgraded LMG":
            self addMenu(menu, "Upgraded LMGs");
            self addOpt("Cackling Kaftar", &GiveClientWeapon, "lmg_heavy_t8_upgraded", self);
            self addOpt("Acheron Alliterator", &GiveClientWeapon, "lmg_spray_t8_upgraded", self);
            self addOpt("Tartarus Veil", &GiveClientWeapon, "lmg_standard_t8_upgraded", self);
            self addOpt("Sumarbrander", &GiveClientWeapon, "lmg_double_t8_upgraded", self);
            self addOpt("Smilomegladon", &GiveClientWeapon, "lmg_stealth_t8", self);
        break;
        case "Upgraded SR":
            self addMenu(menu, "Upgraded Snipers");
            self addOpt("D3SOL8 Regulator", &GiveClientWeapon, "sniper_fastrechamber_t8_upgraded", self);
            self addOpt("Righteous Fury", &GiveClientWeapon, "sniper_powerbolt_t8_upgraded", self);
            self addOpt("IT-5 LYT", &GiveClientWeapon, "sniper_powersemi_t8_upgraded", self);
            self addOpt("Bakeneko", &GiveClientWeapon, "sniper_quickscope_t8_upgraded", self);
            self addOpt("Cnemias Ablation", &GiveClientWeapon, "sniper_mini14_t8", self);
            self addOpt("Arrythmic Dirge", &GiveClientWeapon, "sniper_locus_t8_upgraded", self);
            self addOpt("Savage Razorback", &GiveClientWeapon, "sniper_damagesemi_t8_upgraded", self);
        break;
        case "Upgraded Pistols":
            self addMenu(menu, "Upgraded Pistols");
            self addOpt("Rapskallion 3D", &GiveClientWeapon, "pistol_burst_t8_upgraded", self);
            self addOpt("Belle Of The Ball", &GiveClientWeapon, "pistol_revolver_t8_upgraded", self);
            self addOpt("Z-Harmony", &GiveClientWeapon, "pistol_standard_t8_upgraded", self);
            self addOpt("King & Country", &GiveClientWeapon, "pistol_topbreak_t8_upgraded", self);
            self addOpt("IM-PAK-ED", &GiveClientWeapon, "pistol_fullauto_t8_upgraded", self);
        break;
        case "Upgraded Shotguns":
            self addMenu(menu, "Upgraded Shotguns");
            self addOpt("OMG Right Hook", &GiveClientWeapon, "shotgun_pump_t8_upgraded", self);
            self addOpt("Breccius Rebornus", &GiveClientWeapon, "shotgun_semiauto_t8_upgraded", self);
            self addOpt("M9-TKG Home Wrecker", &GiveClientWeapon, "shotgun_trenchgun_t8_upgraded", self);
            self addOpt("Surgical Havoc", &GiveClientWeapon, "shotgun_fullauto_t8_upgraded", self);
            self addOpt("Ancient Harbinger", &GiveClientWeapon, "shotgun_precision_t8_upgraded", self);
        break;
        case "Upgraded Specials":
            self addMenu(menu, "Upgraded Specials");
            self addOpt("Zitros Orbital Arbalest", &GiveClientWeapon, "launcher_standard_t8_upgraded", self);
            self addOpt("Thekrauss Refibrillator++", &GiveClientWeapon, "special_ballisticknife_t8_dw_upgraded", self);
            self addOpt("Minos's Zeal", &GiveClientWeapon, "special_crossbow_t8_upgraded", self);
            if(BO4GetMap() == "Blood" || BO4GetMap() == "AO" || BO4GetMap() == "Tag" || BO4GetMap() == "Classified"){
            self addOpt("Porters X2 Ray Gun", &GiveClientWeapon, "ray_gun_upgraded", self);
            self addOpt("Porters Mark II Ray Gun", &GiveClientWeapon, "ray_gun_mk2_upgraded", self);
           }
            if(BO4GetMap() == "Voyage"){
                self addOpt("Decayed Kraken", &GiveClientWeapon, "ww_tricannon_earth_t8_upgraded", self);
                self addOpt("Plasmatic Kraken", &GiveClientWeapon, "ww_tricannon_fire_t8_upgraded", self);
                self addOpt("Purified Kraken", &GiveClientWeapon, "ww_tricannon_water_t8_upgraded", self);
                self addOpt("Radiant Kraken", &GiveClientWeapon, "ww_tricannon_air_t8_upgraded", self);
                self addOpt("Upgraded Kraken", &GiveClientWeapon, "ww_tricannon_t8_upgraded", self);
		        self addOpt("Svalinn Guard", &GiveSvalinnGuard);
            }
            else if(BO4GetMap() == "Blood"){
                self addOpt("Magnus Operandi", &GiveClientWeapon, "ww_blundergat_fire_t8_upgraded", self);
                self addOpt("Vitriolic Withering", &GiveClientWeapon, "ww_blundergat_acid_t8_upgraded", self);
                self addOpt("The Sweeper", &GiveClientWeapon, "ww_blundergat_t8_upgraded", self);
                self addOpt("Hells Redeemer", &GiveClientWeapon, "tomahawk_t8_upgraded", self);
                self addOpt("Attuned Spectral Shield", &GiveClientWeapon, "zhield_spectral_dw_upgraded", self);
                self addOpt("Tempered Blundergat", &GiveClientWeapon, "ww_blundergat_fire_t8_unfinished", self);
		        self addOpt("Golden Spork Knife", &GiveClientWeapon, "spknifeork", self);
		        self addOpt("Golden Scalpel", &GiveClientWeapon, "golden_knife", self);
            }
            else if(BO4GetMap() == "AE"){
                self addOpt("Hand of Ouranous", &GiveClientWeapon, "ww_hand_o_upgraded", self);
                self addOpt("Hand of Hemera", &GiveClientWeapon, "ww_hand_h_upgraded", self);
                self addOpt("Hand of Gaia", &GiveClientWeapon, "ww_hand_g_upgraded", self);
                self addOpt("Hand of Charon", &GiveClientWeapon, "ww_hand_c_upgraded", self);
            }
            else if(BO4GetMap() == "Tag"){
                self addOpt("ZeusCannon", &GiveClientWeapon, "thundergun_upgraded", self);
                self addOpt("Wonderwaffe DG-3 JZ", &GiveClientWeapon, "ww_tesla_gun_t8_upgraded", self);
                self addOpt("Boreas Blizzard", &GiveClientWeapon, "tundragun_upgraded", self);
                self addOpt("Wunderwaffe DG-Funkenschutze", &GiveClientWeapon, "ww_tesla_sniper_upgraded_t8", self);//Correct stringname from Hashed scripts
		        self addOpt("Snowballs Upgraded", &GiveClientWeapon, "snowball_upgraded", self);
                self addOpt("Yellow Snowballs Upgraded", &GiveClientWeapon, "snowball_yellow_upgraded", self);
            }
            else if(BO4GetMap() == "AO"){
                self addOpt("Ray Gun II-V", &GiveClientWeapon, "ray_gun_mk2v_upgraded", self);
                self addOpt("Ray Gun II-X", &GiveClientWeapon, "ray_gun_mk2x_dw", self);
                self addOpt("Ray Gun II-Y", &GiveClientWeapon, "ray_gun_mk2y_upgraded", self);
                self addOpt("Ray Gun II-Z", &GiveClientWeapon, "ray_gun_mk2z_upgraded", self);
            }
            else if(BO4GetMap() == "Classified"){
                self addOpt("Winter's Fury", &GiveClientWeapon, "ww_freezegun_t8_upgraded", self);
            }
            else if(BO4GetMap() == "IX"){
                self addOpt("Serket Kiss", &GiveClientWeapon, "ww_crossbow_t8_upgraded", self);
                self addOpt("Iron Bull", &GiveClientWeapon, "zhield_zword_dw_upgraded", self);
            }   
            else if(BO4GetMap() == "Dead"){
                self addOpt("Chaos Theory", &GiveChaosTheory);
                self addOpt("Alistairs Annihilator", &GiveAlistairsAnnihilator);
            }   
        break;
        case "Powerups Menu":
            self addMenu(menu, "Powerups");
            if(BO4GetMap() == "Blood"){self addOpt("Zombie Blood", &GivePowerup, "zombie_blood");}
            self addOpt("Duck Custom", &GivePowerup, "custom_duck_power");
            self addOpt("Widowz Custom", &GivePowerup, "custom_widowz_power");
            self addOpt("Bottle Custom", &GivePowerup, "custom_bottle_power");
            self addOpt("Ref Custom", &GivePowerup, "custom_ref_power");
            self addOpt("PaP Custom", &GivePowerup, "custom_PaP_power");
            self addOpt("Elec Custom", &GivePowerup, "custom_elec_power");
            self addOpt("Wolf Custom", &GivePowerup, "custom_wolf_power");
            self addOpt("Max Ammo", &GivePowerup, "full_ammo");
            self addOpt("Fire Sale", &GivePowerup, "fire_sale");
            self addOpt("Bonus Points", &GivePowerup, "bonus_points_player");
            self addOpt("Free Perk", &GivePowerup, "free_perk");
            self addOpt("Nuke", &GivePowerup, "nuke");
            self addOpt("Hero Weapon", &GivePowerup, "hero_weapon_power");
            self addOpt("Insta kill", &GivePowerup, "insta_kill");
            self addOpt("Double Points", &GivePowerup, "double_points");
            self addOpt("Carpenter", &GivePowerup, "carpenter");
            break;

        case "Zombie Menu":
            self addMenu(menu, "Zombie Menu");
            self addOpt("Notify Round End", &NotifyRoundEnd, player);
            self addOpt("Kill All Zombies", &KillAllZombies, player);
            self addOpt("Kill Everything", &KillEverything, player);
            self addOpt("Teleport Zombies", &TeleportZombies);
            self addOptBool(self.FloatingZombies, "Floating Zombies", &FloatingZombies);
            self addOptBool(self.ZombiePos, "Spawn Zombies In Front Of You", &StartZombiePosistion);
        break;

        case "Mystery Box Menu":
            self addMenu(menu, "Mystery Box");
            self addOpt("Price", &newMenu, "Price Menu");
            self addOpt("Teleport To Chest", &TpToChest);
            self addOpt("Freeze Box Position", &BO4FreezeBox);
            self addOpt("Show All Mystery Boxes", &ShowAllBoxes);
        break;

        case "Price Menu":
            self addMenu(menu, "Price Menu");
            self addOpt("Default Box Price", &BoxPrice, 950);
            self addOpt("Free Box Price", &BoxPrice, 0);
            self addOpt("10 Box Price", &BoxPrice, 10);
            self addOpt("69 Box Price", &BoxPrice, 69);
            self addOpt("420 Box Price", &BoxPrice, 420);
            self addOpt("-1000 Box Price", &BoxPrice, -1000);
            self addOpt("Random Box Price", &BoxPrice, randomIntRange(0, 999999));
        break;

        case "Account Menu":
            self addMenu(menu,"Account Menu");
            self addOpt("Complete Active Contracts", &CompleteActiveContracts, player);
            self addOpt("Max Level", &BO4Level55, player);
            self addOptBool(player.PlasmaLoop, "Plasma Loop", &PlasmaLoopplayer, player);
            self addOpt("Unlock All", &bo4_UnlockAll, player);
            self addOpt("Max Weapon Levels", &bo4_MaxLevels, player);
            self addOpt("Give Achievements", &Achievements, player);
            self addOpt("Stats Menu", &newMenu, "Stats Menu");
        break;
        case "Stats Menu":
            self addMenu(menu,"Stats Menu");
            self addOptIncSlider("Total Played", &Stats_TotalPlayed, 0, 0, 10000, 100);
            self addOptIncSlider("Highest Reached", &Stats_HighestReached, 0, 0, 10000, 100);
            self addOptIncSlider("Most Kills", &Stats_MostKills, 0, 0, 10000, 100);
            self addOptIncSlider("Most Headshots", &Stats_MostHeadshots, 0, 0, 10000, 100);
            self addOptIncSlider("Round", &Stats_Round, 0, 0, 10000, 100);
        break;
        case "Options":       
            self addMenu(menu, "[" + player.playerSetting["verification"] + "]" + player getName());
                //self addOpt("Verification", &newMenu, "Verification " + player GetEntityNumber());
                self addOpt("Personal Mods", &newMenu, "ClientPMods " + player GetEntityNumber());
                self addOpt("Client Stat Manipulation", &newMenu, "ClientStats " + player GetEntityNumber());
                self addOpt("Trolling Options", &newMenu, "Trolling " + player GetEntityNumber());
            break;
        case "Verification":
            self addMenu(menu, "Verification");
                for(a=0;a<(level.MenuStatus.size - 2);a++)
                    self addOptBool(player getVerification() == a, level.MenuStatus[a], &setVerification, a, player, true);
            break;
        case "ClientPMods":
            self addMenu(menu, "Personal Modifications");
                self addOptBool(player.godmode, "God Mode", &ClientHandler, 0, player);
                self addOptBool(player.UnlimitedAmmo, "Unlimited Ammo", &ClientHandler, 1, player);
                self addOpt("Give All Perks", &ClientHandler, 4, player);
                self addOpt("Give Self Revive", &ClientHandler, 5, player);
                self addOpt("Teleport To Player", &TeleTo, 0,player);
                self addOpt("Tele Player To Me", &TeleTo, 1,player);
                self addOpt("Max Out Player Score", &ClientHandler, 8, player);
                self addOpt("Give Spec Weapon", &GiveClientWeapon, "smg_fastfire_t8_upgraded", player);
                if (BO4GetMap() == "Blood"){self addOpt("Give Player Blundergat", &GiveClientWeapon, "ww_blundergat_t8", player); self addOpt("Give Player Magmagat", &GiveClientWeapon, "ww_blundergat_fire_t8", player); self addOpt("Give AcidGat", &GiveClientWeapon, "ww_blundergat_acid_t8", player);}
        break;
        case "ClientStats":
            self addMenu(menu, "Stat Manipulation");
                self addOpt("Give Max Level", &ClientHandler, 2, player);
                self addOptBool(player.PlasmaLoop2, "Plasma Loop 100k", &ClientHandler, 3, player);
                self addOpt("Max Weapon Levels", &ClientHandler, 7, player);
                self addOpt("Unlock All", &ClientHandler, 6, player);
        break;
        case "Trolling":
            self addMenu(menu, "Trolling Options");
                self addOpt("Take all Weapons", &TakeAllPlayerWeaps, player);
                self addOpt("Take All Player Score", &ClientHandler, 9, player);
                self addOpt("Send To Jail", &sendToJail, player);
                self addOpt("Kill Player", &KillPlayer, player);
                self addOpt("Down Player", &DownPlayer, player);
                self addOptIncSlider("Send Message", &PlayerMessage, 0,0,4,1, player);
            break;

        case "Menu Settings":
            self addMenu(menu, "Menu Settings");
                self addOptIncSlider("Move Menu X", &MoveMenuX, -1200, 0, 1200, 100);
                self addOptIncSlider("Move Menu Y", &MoveMenuY, -500, 0, 500, 50);
                self addOptIncSlider("Scale Menu", &ScaleMenu, 1, 1, 6, 1);
                self addOptIncSlider("Menu Colors Set", &MenuColorSets, 1, 1, 4, 1);
                self addOptBool(self.RGBMenu, "RGB Menu", &RGBMenu);
                self addOptBool(self.DebugHuds, "Show Debug Stuff", &DevDebugHud);
            break;

        default:
            self addMenu(menu, "404 ERROR");
                self addOpt("Page Not Found");
            break;
    }
}

menuMonitor()
{
    self endon("disconnect");
    
    while(true)
    {
        if(self getVerification() > 0)
        {
            if(!self isInMenu())
            {
                if(self AdsButtonPressed() && self useButtonPressed() && self JumpButtonPressed() && !isDefined(self.menu["DisableMenuControls"]))
                {
                    if(isDefined(self.menu["currentMenu"]) && self.menu["currentMenu"] != "")
                        menu = self.menu["currentMenu"];
                    else
                        menu = "Main";
                    
                    self openMenu1(menu);
                    wait .25;
                }
            }
            else if(self isInMenu() && !isDefined(self.menu["DisableMenuControls"]))
            {
                if(self AdsButtonPressed() || self AttackButtonPressed())
                {
                    if(!self AdsButtonPressed() || !self AttackButtonPressed())
                    {
                        curs = self getCursor();
                        menu = self getCurrent();
                        
                        self.menu["curs"][menu] += self AttackButtonPressed();
                        self.menu["curs"][menu] -= self AdsButtonPressed();
                        
                        arry = self.menu["items"][self getCurrent()].name;
                        curs = self getCursor();

                        if(curs < 0 || curs > (arry.size - 1))
                            self setCursor((curs < 0) ? (arry.size - 1) : 0);

                        self drawText();
                        wait .05;
                    }
                }
                else if(self UseButtonPressed() & 1)//Just noticed this, why is there & 1 when theres no actual function question except if user presses :/
                {
                    menu = self getCurrent();
                    curs = self getCursor();
                    
                    if(isDefined(self.menu["items"][menu].func[curs]))
                    {
                        if(isDefined(self.menu["items"][menu].slider[curs]) || isDefined(self.menu["items"][menu].incslider[curs]))
                            self thread ExecuteFunction(self.menu["items"][menu].func[curs], isDefined(self.menu["items"][menu].slider[curs]) ? self.menu_S[menu][curs][self.menu_SS[menu][curs]] : int(self.menu_SS[menu][curs]), self.menu["items"][menu].input1[curs], self.menu["items"][menu].input2[curs], self.menu["items"][menu].input3[curs], self.menu["items"][menu].input4[curs]);
                        else
                            self thread ExecuteFunction(self.menu["items"][menu].func[curs], self.menu["items"][menu].input1[curs], self.menu["items"][menu].input2[curs], self.menu["items"][menu].input3[curs], self.menu["items"][menu].input4[curs]);
                        if(isDefined(isDefined(self.menu["items"][menu].bool[curs])))
                            self RefreshMenu();
                        wait .15;
                    }
                }
                else if(self SecondaryOffhandButtonPressed() || self FragButtonPressed())
                {
                    if(!self SecondaryOffhandButtonPressed() || !self FragButtonPressed())
                    {
                        menu = self getCurrent();
                        curs = self getCursor();
                        
                        if(isDefined(self.menu["items"][menu].slider[curs]) || isDefined(self.menu["items"][menu].incslider[curs]))
                        {
                            inc = isDefined(self.menu["items"][menu].incslider[curs]) ? self.menu["items"][menu].intincrement[curs] : 1;
                            self.menu_SS[menu][curs] += self FragButtonPressed() ? inc : (inc * -1);
                            
                            if(isDefined(self.menu["items"][menu].slider[curs]))
                                self SetSlider(self.menu_SS[menu][curs]);
                            else
                                self SetIncSlider(self.menu_SS[menu][curs]);
                            self RefreshMenu();
                            wait .10;
                        }
                    }
                }
                else if(self MeleeButtonPressed())
                {
                    if(self getCurrent() == "Main")
                        self closeMenu1();
                    else
                        self newMenu();
                    wait .10;
                }
            }
        }
        wait .05;
    }
}

ExecuteFunction(function, i1, i2, i3, i4, i5, i6)
{
    if(!isDefined(function))
        return;
    
    if(isDefined(i6))
        return self thread [[ function ]](i1, i2, i3, i4, i5, i6);
    if(isDefined(i5))
        return self thread [[ function ]](i1, i2, i3, i4, i5);
    if(isDefined(i4))
        return self thread [[ function ]](i1, i2, i3, i4);
    if(isDefined(i3))
        return self thread [[ function ]](i1, i2, i3);
    if(isDefined(i2))
        return self thread [[ function ]](i1, i2);
    if(isDefined(i1))
        return self thread [[ function ]](i1);
    
    return self thread [[ function ]]();
}

drawText()
{
    self endon("menuClosed");
    self endon("disconnect");
    
    if(!isDefined(self.menu["curs"][self getCurrent()]))
        self.menu["curs"][self getCurrent()] = 0;
    
    menu = self getCurrent();
    text = self.menu["items"][self getCurrent()].name;
    curs = self getCursor();
    start = 0;

    if(curs > 6 && curs < (text.size - 15) && text.size > 21)
        start = curs - 6;
    if(curs > (text.size - 16) && text.size > 21)
        start = text.size - 21;
    
    if(text.size > 0)
    {
        ShieldHudElemSetText(#"menu_verify", level.VerifyColor + "Verification Status: " + self.playerSetting["verification"]);
        for (i = 0; i < 32; i++) ShieldHudElemSetText(#"menu_lineX_1_" + i, level.LineColor + "_");
        for (i = 0; i < 32; i++) ShieldHudElemSetText(#"menu_lineX_2_" + i, level.LineColor + "_");
        for (i = 0; i < 37; i++) ShieldHudElemSetText(#"menu_lineY_1_" + i, level.LineColor + "|");
        for (i = 0; i < 37; i++) ShieldHudElemSetText(#"menu_lineY_2_" + i, level.LineColor + "|");

        if(isDefined(self.menu["items"][menu].title))
            ShieldHudElemSetText(#"menu_title_1", level.TitleBColor + "[" + level.TitleColor + " " + self.menu["items"][menu].title + " " + level.TitleBColor + "]");
            //self iPrintln("^4[ " + self.menu["items"][menu].title + " ]");
        self.lastRefresh = getTime();

        numOpts = text.size;
        if(numOpts >= 21)
            numOpts = 21;
        
        for(a=0;a<numOpts;a++)
        {
            text = self.menu["items"][menu].name;
            str = text[(a + start)];
            if(isDefined(self.menu["items"][menu].bool[(a + start)]))
                str += (isDefined(self.menu_B[menu][(a + start)]) && self.menu_B[menu][(a + start)]) ? " ^2[ON]" : " ^1[OFF]";
            else if(isDefined(self.menu["items"][menu].incslider[(a + start)]))
                str += "^2 < " + self.menu_SS[menu][(a + start)] + " >";
            else if(isDefined(self.menu["items"][menu].slider[(a + start)]))
                str += " < " + self.menu_S[menu][(a + start)][self.menu_SS[menu][(a + start)]] + " >";
            
            if(curs == (a + start))
                ShieldHudElemSetText(#"menu_str_2_" + ("" + a), level.SelectedSTRColor + "   -> " + str + " <-");
            else
                ShieldHudElemSetText(#"menu_str_2_" + ("" + a), level.STRSColor + " - " + str);
        }

        if(numOpts < 22)
        {
            printSize = 21 - numOpts;
            for(a=0;a<printSize;a++)
            {
                ShieldHudElemSetText(#"menu_str_2_" + ("" + (numOpts + a)), "^0   ...");
            }
        }
    }
}

RefreshMenu()
{
    if(self hasMenu() && self isInMenu())
    {
        self runMenuIndex(self getCurrent());
        self drawText();
    }
}

openMenu1(menu)
{
    if(!isDefined(menu))
        menu = "Main";
    if(!isDefined(self.menu["curs"][menu]))
        self.menu["curs"][menu] = 0;
    
    self.menu["currentMenu"] = menu;
    self runMenuIndex(menu);
    self.playerSetting["isInMenu"] = true;
    self thread MonitorMenuRefresh();
}

MonitorMenuRefresh()
{
    self endon("disconnect");
    self endon("menuClosed");

    if(self isInMenu())
    {
        self drawText();
        while(self isInMenu())
        {
            if(self.lastRefresh < GetTime() - 10) // 6000 > 300 for rgb menu
                self drawText();
            wait 0.5;
        }
    }
}

closeMenu1()
{
    self DestroyOpts();
    self notify("menuClosed");
    self.playerSetting["isInMenu"] = undefined;
}

DestroyOpts()
{
    for(a=0;a<21;a++)
        ShieldHudElemSetText(#"menu_str_2_" + a, "");

    ShieldHudElemSetText(#"menu_verify", "");
    ShieldHudElemSetText(#"menu_title_1", "");
    for (i = 0; i < 32; i++) ShieldHudElemSetText(#"menu_lineX_1_" + i, "");
    for (i = 0; i < 32; i++) ShieldHudElemSetText(#"menu_lineX_2_" + i, "");
    for (i = 0; i < 37; i++) ShieldHudElemSetText(#"menu_lineY_1_" + i, "");
    for (i = 0; i < 37; i++) ShieldHudElemSetText(#"menu_lineY_2_" + i, "");
}