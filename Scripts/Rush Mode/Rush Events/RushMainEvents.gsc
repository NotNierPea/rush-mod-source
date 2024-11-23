// Rush Events here

RushMode() //Chances
{
    self endon(#"disconnect", #"death");
    //level endon(#"end_game", #"game_ended"); // for continue after ee

    /#
        if (level.RealisticDif) // no fun allowed
        {
            return;
        }
    #/

    while(!level.PickedOption) // wait for pick
    {
        wait 1;
    }

    while(true)
    {
        wait 1;
        
        Ent = self getEntityNumber();
        level.WaitRush[Ent] = randomIntRange(30, 60);
        self iPrintLn("^6Next Rush Mode Event in "+level.WaitRush[Ent]+" Seconds...");

        self thread UpdateRushCounter(level.WaitRush[Ent]);
        wait(level.WaitRush[Ent]); // random waiting

        if (self CheckIGCActive())
        {
            self iPrintLn("^1No Rush Mode Event due to an IGC/Cutscene!");
            continue;
        }

        RushRandom = randomIntRange(1, 38); // -> 1 - 37
        switch(RushRandom)
        {

        case 1:
        thread PSpeedB();
        self iPrintlnBold("^2 Event - ^3 Freeze! "); // event
        thread UpdateRushEvent("^3 Freeze!", 10, 1);
        wait 10;
        thread PSpeedB();
        self iPrintlnBold("^2 Event - ^3 UnFreeze! "); // event
        break;

        case 2:
        self disableWeapons();
        self iPrintlnBold("^2 Event - ^4 Weapons Disabled! "); // event
        thread UpdateRushEvent("^4 Weapons Disabled!", 12, 2);
        wait 12;
        self enableWeapons();
        self iPrintlnBold("^2 Event - ^4 Weapons Enabled! "); // event
        break;

        case 3:
        self thread TeleportZombies();
        self iPrintlnBold("^2 Event - ^3 Zombie Teleport! "); // event
        thread UpdateRushEvent("^3 Zombie Teleport!", 5, 3);
        break;

        case 4:
        thread Moon_Gravity();
        self iPrintlnBold("^2 Event - ^6 Gravity Change! "); // event
        thread UpdateRushEvent("^6 Gravity Change!", 30, 4);
        wait 30;
        thread Moon_Gravity();
        self iPrintlnBold("^2 Event - ^6 Gravity Normal! "); // event
        break;     

        case 5:
        thread PSpeed();
        self iPrintlnBold("^2 Event - ^6 Speed Change! "); // event
        thread UpdateRushEvent("^6 Speed Change!", 20, 5);
        wait 20;
        thread PSpeed();
        self iPrintlnBold("^2 Event - ^6 Speed Normal! "); // event        
        break;

        case 6:
        self thread TeleportZombies();
        self iPrintlnBold("^2 Event - ^3 Zombie Teleport! "); // event
        thread UpdateRushEvent("^3 Zombie Teleport!", 5, 3);
        break;    

        case 7:
        self iPrintlnBold("^2 Event - ^4 InstaKill Spawn! "); // event
        GivePowerup("insta_kill");
        thread UpdateRushEvent("^4 InstaKill Spawn!", 5, 6);
        break;

        case 8:
        thread PlayerTakeScore(4000000, self);
        self iPrintlnBold("^2 Event - ^7 Points Taken! "); // event
        thread UpdateRushEvent("^7 Points Taken!", 5, 7);
        break;

        case 9:
        thread PlayerTakeScore(4000000, self);
        self iPrintlnBold("^2 Event - ^7 Points Taken! "); // event
        thread UpdateRushEvent("^7 Points Taken!", 5, 7);
        break;

        case 10:
        if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) // check if elixir is active
        {
            break;
        }
        self thread zm_bgb_shields_up::give_shield();
        self iPrintlnBold("^2 Event - ^7 Shield UP! "); // event
        thread UpdateRushEvent("^7 Shield UP!", 5, 8);
        break;

        case 11:
        if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) // check if elixir is active
        {
            break;
        }
        self thread zm_bgb_perk_up::activation();
        self iPrintlnBold("^2 Event - ^7 Perk UP! "); // event
        thread UpdateRushEvent("^7 Perk UP!", 5, 9);
        break;

        case 12: // update - removed collision to avoid softlocks
        self iPrintlnBold("^2 Event - ^1 Uhhhh "); // event
        thread UpdateRushEvent("^1 Uhhhh", 5, 10);
        ModelWidowSpawn();
        break;

        case 13:
        thread PSpeedB();
        self iPrintlnBold("^2 Event - ^3 Freeze! "); // event
        thread UpdateRushEvent("^3 Freeze!", 10, 1);
        wait 10;
        thread PSpeedB();
        self iPrintlnBold("^2 Event - ^3 UnFreeze! "); // event
        break;

        case 14:
        if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) // check if elixir is active
        {
            break; // oops
        }
        self thread zm_bgb_reign_drops::activation();
        self iPrintlnBold("^2 Event - ^7 Reign Drops! "); // event
        thread UpdateRushEvent("^7 Reign Drops!", 5, 11);
        break;

        case 15:
        thread GetSelfRes();
        thread UpdateRushEvent("^7 1x Self Revive!", 5, 12);
        break;

        case 16:
        thread PSpeedA();
        self iPrintlnBold("^2 Event - ^6 Speed Change! "); // event
        thread UpdateRushEvent("^6 Speed Change!", 25, 5);
        wait 25;
        thread PSpeedA();
        self iPrintlnBold("^2 Event - ^6 Speed Normal! "); // event
        break;

        case 17:
        thread Clone();
        self iPrintlnBold("^2 Event - ^2 uhhh "); // event
        thread UpdateRushEvent("^2 uhhh", 5, 13);
        break;

        case 18:
        thread HeadLess();
        thread UpdateRushEvent("^9 Headless Zombies!", 5, 14);
        break;

        case 19:
        if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) // check if elixir is active
        {
            break;
        }
        self iPrintlnBold("^2 Event - ^4 Random Elixir! "); // event
        thread randomelixir();
        thread UpdateRushEvent("^4 Random Elixir!", 5, 15);
        break;

        case 20:
            if(BO4GetMap() == "IX")
            {
                wait 3;
                ModelSpawnIX();
                self iPrintlnBold("^2 Event - ^4 Suprise! "); // event
                thread UpdateRushEvent("^4 Suprise!", 5, 16);
            }
            else if(BO4GetMap() == "Voyage")
            {
                wait 3;
                ModelSpawnVoyage();
                self iPrintlnBold("^2 Event - ^4 Suprise! "); // event
                thread UpdateRushEvent("^4 Suprise!", 5, 16);
            }
            else
            {
                if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) // check if elixir is active
                {
                    break;
                }
                self iPrintlnBold("^2 Event - ^4 Random Elixir! "); // event
                thread randomelixir();
                thread UpdateRushEvent("^4 Random Elixir!", 5, 15);
            }
            break;

        case 21:
        thread HideGun();
        self iPrintlnBold("^2 Event - ^4 Hide Gun! "); // event
        thread UpdateRushEvent("^4 Hide Gun!", 25, 17);
        wait 25;
        thread HideGun();
        break;

        case 22:   
        if (!level.WidowZombies && !level.SymbolZombies && !level.NukeZombies) // check if already active
        {
        level.WidowZombies = true;
        level.QuackZombies = false;
        self iPrintlnBold("^2 Event - ^9 widowzzz wine ARMY! "); // event  
        thread UpdateRushEvent("^9 widowzzz wine ARMY!", 30, 18);
        wait 30;
        level.WidowZombies = false;
        level.QuackZombies = true;
        break;
        }
        break;

        case 23:  
        if (!level.WidowZombies && !level.SymbolZombies && !level.NukeZombies) // check if already active
        {
        level.SymbolZombies = true;
        level.QuackZombies = false;
        self iPrintlnBold("^2 Event - ^9 symbolzzz wine ARMY! "); // event 
        thread UpdateRushEvent("^9 symbolzzz wine ARMY!", 30, 19);
        wait 30;
        level.SymbolZombies = false;
        level.QuackZombies = true;
        break;   
        }
        break;

        case 24:
        thread exo_suit();
        self iPrintlnBold("^2 Event - ^3 Exo Suit Activated! "); // event
        thread UpdateRushEvent("^3 Exo Suit Activated!", 5, 20);
        break;


        case 25:
        if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) // check if elixir is active
        {
            break;
        }
        self iPrintlnBold("^2 Event - ^4 Random Elixir! "); // event
        thread randomelixir();
        thread UpdateRushEvent("^4 Random Elixir!", 5, 15);
        break;

        case 26:
        thread SuperJump();
        self iPrintlnBold("^2 Event - ^9 Super Jump Acivated! "); // event
        thread UpdateRushEvent("^9 Super Jump!", 20, 21);
        wait 20;
        thread SuperJump();
        self iPrintlnBold("^2 Event - ^9 Super Jump Deacivated! "); // event
        break;


        case 27:
        thread GivePowerup("nuke");
        thread UpdateRushEvent("^9 NUKE!!!!!", 5, 22);
        self iPrintlnBold("^2 Event - ^9 NUKE!!!!! "); // event
        break;

        case 28:
        thread thirdperson();
        self iPrintlnBold("^2 Event - ^1 Third Person Activated! "); // event
        thread UpdateRushEvent("^1 Third Person", 20, 23);
        wait 20;
        thread thirdperson();
        self iPrintlnBold("^2 Event - ^1 Third Person Deactivated! "); // event
        break;

        case 29:
        if(BO4GetMap() == "Voyage")
            {
                self clientfield::set_to_player("" + #"main_flash", 1);
                self iPrintlnBold("^2 Event - ^4 Flashbang! "); // event
                thread UpdateRushEvent("^4 Flashbang!", 5, 24);
                wait 3;
                self clientfield::set_to_player("" + #"main_flash", 0);
            }
            else
            {
                self iPrintlnBold("^2 Event - ^1 No Event (Bad Luck) "); // event
                thread UpdateRushEvent("^1 No Event", 5, 25);
            }
        break;

        case 30:
        if (!level.WidowZombies && !level.SymbolZombies && !level.NukeZombies) //check if already active
        {
            level.NukeZombies = true;
            level.QuackZombies = false;
            self iPrintlnBold("^2 Event - ^9 NUKE ARMY! "); // event     
            thread UpdateRushEvent("^9 NUKE ARMY!", 30, 26);
            wait 30;
            level.NukeZombies = false;
            level.QuackZombies = true;
            break;
        }
        break;


        case 31:
        switch(BO4GetMap())
        {
            case "Voyage":
            self clientfield::set_to_player("" + #"main_flash", 1);
            self iPrintlnBold("^2 Event - ^4 Flashbang! "); // event
            thread UpdateRushEvent("^4 Flashbang!", 5, 24);
            wait 3;
            self clientfield::set_to_player("" + #"main_flash", 0);
            break;

            case "AO":
            self zm_utility::do_player_general_vox("general", "scare_react", undefined, 100);
            self clientfield::increment_to_player("" + #"hash_f2d0b920043dbbd", 1);
            self iPrintlnBold("^2 Event - ^4 JumpScare! "); // event
            thread UpdateRushEvent("^4 JumpScare!", 5, 27);
            break;

            case "Blood":
            self zm_utility::do_player_general_vox("general", "scare_react", undefined, 100);
            self clientfield::increment_to_player("" + #"hash_f2d0b920043dbbd", 1);
            self iPrintlnBold("^2 Event - ^4 JumpScare! "); // event
            thread UpdateRushEvent("^4 JumpScare!", 5, 27);
            break;

            case "Tag":
            RandomChanceJ = randomIntRange(0,2); // 0 and 1
            if(RandomChanceJ == 0) // jumpscare lighthouse
            {
                self zm_utility::do_player_general_vox("general", "scare_react", undefined, 100);
                self clientfield::increment_to_player("" + #"hash_12114abc7407913b", 1);
                self iPrintlnBold("^2 Event - ^4 JumpScare! (1) "); // event
                thread UpdateRushEvent("^4 JumpScare!", 5, 27);
            }
            else // jumpscare paper
            {
                self zm_utility::do_player_general_vox("general", "scare_react", undefined, 100);
                self clientfield::increment_to_player("" + #"hash_5e38e846ce88405b", 1);
                self iPrintlnBold("^2 Event - ^4 JumpScare! (2) "); // event
                thread UpdateRushEvent("^4 JumpScare!", 5, 27);
            }
            break;

            case "Classified":
            self zm_utility::do_player_general_vox("general", "scare_react", undefined, 100);
            self clientfield::increment_to_player("" + #"hash_f2d0b920043dbbd", 1);
            self iPrintlnBold("^2 Event - ^4 JumpScare! "); // event
            thread UpdateRushEvent("^4 JumpScare!", 5, 27);
            break;

            default:
            self iPrintlnBold("^2 Event - ^1 No Event (Bad Luck) "); // event
            thread UpdateRushEvent("^1 No Event", 5, 25);
        }
        break;

        case 32:
        thread InvisibleZombies();
        self iPrintlnBold("^2 Event - ^9 Invisible Zombies! "); // event
        thread UpdateRushEvent("^9 Invisible Zombies!", 13, 28);
        wait 13;
        thread VisibleZombies();

        case 33:
        namespace_9ff9f642::register_slowdown(#"zm_trial_zombie_speed_changes", 1.9); // rush mode zombie speedy event
        thread ZombiesSpeedy();
        self iPrintlnBold("^2 Event - ^2 Super Speed Zombies! "); // event
        thread UpdateRushEvent("^2 Super Speed Zombies!", 15, 29);
        wait 15;
        level notify(#"StopSpeedZombies"); // should stop it

        case 34: // fake error 
        FakeError();
        foreach(player in level.players)
        {
            player iPrintlnBold("^2 Event - ^2 Fake Error! "); // event
        }
        thread UpdateRushEvent("^2 Fake Error!", 5, 30);
        break;

        case 35: // rocket gun
        if(IsBot(self)) return; // well, they spam it too much lol
        self thread MagicBullets();
        thread UpdateRushEvent("^3 Rocket Gun!", 15, 31);
        wait 15;
        self thread MagicBullets();
        break;

        case 36: // models gun
        if(IsBot(self)) return; // well, they spam it too much lol
        self thread MagicModels();
        thread UpdateRushEvent("^3 Models Gun!", 15, 32);
        wait 15;
        self thread MagicModels();
        break;

        case 37: // nukie friend
        self thread NukeLookFriendly(self.origin + (0, 0, 100), self.angles, 0.75);
        thread UpdateRushEvent("^3 Nukie Friend!", 35, 33);
        self iPrintlnBold("^2 Event - ^3 Nukie Friend! "); // event
        wait 35;
        level notify(#"StopNukeFriend");
        break;
        }
    }
}

CheckIGCActive()
{
    self endon(#"disconnect", #"death");

    if(self scene::is_igc_active())
        return true;
        //self iPrintLn("^1 No Rush Mode Event due to a Cutscene!");
        //self RushMode(); //  ---> stack overflow (im really dumb)

    return false;

    // back to normal
}