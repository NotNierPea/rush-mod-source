ToggleRushExtraQuests()
{
    level.RushCustomQuest = level.RushCustomQuest ? false : true;
    
    ShieldLog("^1Toggled Extra Quests -> " + level.RushCustomQuest);
}

IXStartCustomQuest(b_skipped)
{
    level thread RushLockdownStep(b_skipped);
}

RushLockdownStep(b_skipped)
{
    if(b_skipped)
     iPrintLn("tf?");
    
    TeleportRock = util::spawn_model(#"p8_zm_zod_pap_plinth_sequence_air", (-1500.38, -102.176, 300), (0, 0, 0));
    TeleportRock RotateAndBobItem();
    TeleportRock AddObjective(true);
    TeleportRock zm_unitrigger::create(&TeleportRockSetupSet, 80, &TeleportRockSetup);
}

TeleportRockSetupSet()
{
    self setHintString("shield/rockrush");
    self setcursorhint("HINT_NOICON");

    return true;
}

TeleportRockSetup()
{
    self endon(#"death");

    model = self.stub.related_parent;
    model endon(#"death");
    
    while(true)
    {
        waitresult = undefined;
        waitresult = self waittill(#"trigger");

        level thread SetupIXLockdown();
        playfx(level._effect[#"hash_1eae5969d11a8b16"], model.origin);
        playfx(level._effect[#"teleport_splash"], model.origin);
    }
}

SetupIXLockdown()
{
    // activate ee_space
    level clientfield::set("" + #"hash_3c58464f16d8a1be", 1);

    level thread lui::screen_flash(0.4, 3, 0.8, 2, "black");
    playsoundatposition(#"hash_c648800c55e1554", (0, 0, 0));

    wait 0.3;
    foreach(player in level.players)
     player SetRandomOrigin((208.304, -23.128, -3352.33), (0, 0, 0));

    level thread SpawnZombiesGlads();
}

SpawnZombiesGlads()
{
    //
}