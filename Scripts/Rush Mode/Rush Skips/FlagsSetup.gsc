SkipFlags()
{
    if (level.SettingsFlags)
    {
        level flag::wait_till("all_players_spawned"); // waits for players 

        if(BO4GetMap() == "Voyage")
        {
            wait 35;
            level thread VODPAPEnable();
        }

        level flag::wait_till("initial_blackscreen_passed"); // waits for players
        level flag::set("pap_machine_active");
        level flag::set(#"hash_3e80d503318a5674"); // vod???
        level flag::set(#"hash_537cc10c9deca9da");
        level flag::set("power_on");
        level flag::set("power_on1");
        level flag::set("power_on2");
        level flag::set("power_on3");
        level flag::set("pap_power_ready");
        level flag::set(#"pap_quest_completed"); // skip stuff
        level flag::set("fasttravel_enabled");
        level flag::set(#"mq_computer_activated");

        switch(BO4GetMap())
        {
            case "Blood":
            level flag::set(#"catwalk_event_completed");
            level flag::set("activate_catwalk");
            level notify(#"hash_7a04a7fb98fa4e4d");
            break;

            case "Tag":
            level flag::set(#"hash_641f14d0b2fd57d7"); // skip tag
            level flag::clear(#"challenge_active");
            level flag::set(#"hash_3310bb35ce396e49");
            level flag::set(#"hash_5a3d0402a5557739");
            level flag::set(#"hash_3028604821838259");
            level flag::set(#"hash_78cf83ad057b4f1f");

            // ziplines
            level flag::set(#"hash_7d9f8ec3cb9af87e");
            level flag::set(#"facility_available");
            level flag::set(#"hash_7d230fa8f283c105");
            level flag::set(#"hash_7def3e555eba842c");
            level flag::set(#"hash_e29d662bb90e4bc");
            break;

            case "AE":
            level flag::set(#"zm_red_fasttravel_open"); // from here these are flags for Ancient Evil (Without them the EE is impossible to do)
            level flag::set(#"hash_3764b0cb106568ec");
            level flag::set(#"hash_3dba794053dea40e");
            level flag::set(#"hash_32ff7a456732ef09");
            level flag::set(#"hash_4083e9da0ba41dec");
            level flag::set(#"pap_quest_completed");
            level flag::set(#"cage_dropped");
            level flag::set(#"hash_67695ee69c57c0b2");
            level flag::set(#"hash_61de3b8fe6f6a35");
            level flag::set(#"hash_7943879f3be8ccc6");
            level flag::set(#"eagle_attack");
            level flag::set(#"egg_free");
            level flag::set(#"fl_oracle_unlocked");
            
            level.var_1044e9e1 = 3;
            level flag::set("fl_challenge_phase_3");
            break;
        }
    }
}