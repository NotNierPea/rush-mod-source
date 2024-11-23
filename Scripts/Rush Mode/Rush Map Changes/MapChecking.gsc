MapCheck()
{
    switch(BO4GetMap())
    {
        case "Dead":
        SetGametypeSetting(#"zmpowerstate",2); // power on for all maps 
        level.SettingsPack = false;
        level.SettingsFlags = false;
        DOTNSpawnPoints_Flags();
        level.zombie_vars["zombie_spawn_delay"] = 0.01; // zombies delay remove
        level.zombie_vars["zombie_between_round_time"] = 0.8;
        level flag::set("pap_machine_active");
        level flag::set(#"hash_2daf5bdda85cc660");
        break;

        case "Tag":
        SetGametypeSetting(#"zmpowerstate",2); // power on for all maps 
        level.SettingsPack = false;
        thread TagFastRestartFix();
        TagSpawnPoints();
        break;

        case "Classified":
        SetGametypeSetting(#"zmpowerstate",2); // power on for all maps 
        SetGametypeSetting(#"zmpapenabled",2);
        ClassifiedSpawnPoints();
        level.zombie_vars["zombie_spawn_delay"] = 0.0001; // zombies delay remove
        level.zombie_vars["zombie_between_round_time"] = 1;
        // no picks for this map
        level.PickedOption = true;
        break;

        case "Blood":
        SetGametypeSetting(#"zmpowerstate",1); // power on for all maps 
        SetGametypeSetting(#"zmpapenabled",2);
        level.zombie_ai_limit = 400;
        level.zombie_actor_limit = 400;
        level.zombie_vars["zombie_spawn_delay"] = 0.1; // zombies delay remove  0.001
        level.zombie_vars["zombie_between_round_time"] = 3; // 3
        level.zombie_vars["zombie_max_ai"] = 300;
        //level.zombie_vars["zombie_ai_per_player"] = 300;
        //level.zombie_vars["zombie_move_speed_multiplier"] = 30;
        level thread BloodSpawnPoints();
        level thread BloodActivatePaP(); // zmpowerstate gamesetting causes it to crash on fast restart...
        break;

        case "AE":
        SetGametypeSetting(#"zmpowerstate",2); // power on for all maps 
        SetGametypeSetting(#"zmpapenabled",2);
        AncientEvilSpawnPoints();
        level.zombie_vars["zombie_spawn_delay"] = 0.01; // zombies delay remove
        level.zombie_vars["zombie_between_round_time"] = 0.8;
        break;

        case "AO":
        SetGametypeSetting(#"zmpowerstate",2); // power on for all maps 
        SetGametypeSetting(#"zmpapenabled",2);
        AlphaOmegaSpawnPoints();
        break;

        case "Voyage":
        SetGametypeSetting(#"zmpowerstate",2); // power on for all maps 
        SetGametypeSetting(#"zmpapenabled",2);
        level.VoyageLaunch = true;
        thread VODFastRestartFix();
        VODSpawnPoints();
        break;

        case "IX":
        SetGametypeSetting(#"zmpowerstate",2); // power on for all maps 
        SetGametypeSetting(#"zmpapenabled",2);
        level flag::wait_till("all_players_spawned"); // waits for players 
        IXSpawnPoints();
        level flag::wait_till("initial_blackscreen_passed"); // waits for players
        level flag::set("zm_towers_pap_quest_completed");
        break;
    }

    //level thread SpawnZombiesForever();

    /#
    if (level.SettingsPack) // breaks if dotn + tag quest ^^
    {
        SetGametypeSetting(#"zmpapenabled",2);
    }
    #/
}