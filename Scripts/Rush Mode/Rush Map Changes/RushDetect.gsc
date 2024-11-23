CheckSpectating() // check if not playing
{
    level endon(#"Stop_DetectSpawn"); // for ae fix

    while(true)
    {
        foreach (player in util::get_players()) 
        {
            if (player util::is_spectating()) 
            {
                player thread zm_player::spectator_respawn_player();
                waitframe(1);
            }
        }
      waitframe(1);
    }
}

RushDetect() // AE is buggy when rush mode is acitve
{
    if(BO4GetMap() == "AE")
    {
        wait 1;
        level flag::set("spawn_zombies");
        AddZombies(); // better one
        //wait 8;
        //KillAllZombies();
    }
}

CheckRushChange() // change rush mode to another mode to avoid crashing with ghosts / other maps issues
{
    if(BO4GetMap() == "Blood")
    {
        level flag::wait_till(#"hash_36138b6e1d539829");
        foreach(player in level.players)
        {
            player iPrintlnBold("^2 Rush Killing has been ^8Changed ^2due to The Challenges! (When round changes, You will have to kill all zombies to end it!) "); // event
        }
        level.RushChanged = true;

        wait 3;

        // check if selected skip
        if (level.SkippedChallenges)
        {
            FlagActivate(23);
            foreach(player in level.players)
            {
                player iPrintlnBold("^8The Challenges has been Skipped! (Interact with The Book again....) ");
            }
        }
    }

    if(BO4GetMap() == "AE")
    {
        level waittill(#"hash_52b0d62a28ee7a99");
        foreach(player in level.players)
        {
            player iPrintlnBold("^2 Rush Killing has been ^8Changed ^2due to Hit Your Marks Step! (When round changes, You will have to kill all zombies to end it!) "); // event
        }
        level.RushChanged = true;
    }

    // not really a change here
    if(BO4GetMap() == "Voyage")
    {
        level flag::wait_till(#"hash_452df3df817c57f9"); // 63e
        foreach(player in level.players)
        {
            player iPrintlnBold("^2 You need to Wait for The Actual PAP to Spawn in Engine Room! "); // event
        }
    }

    if(BO4GetMap() == "AO")
    {
        level flag::wait_till(#"hash_7cc3b03eefb11fc"); // 63e
        wait 5;
        foreach(player in level.players)
        {
            player iPrintlnBold("^2 Crawler Step! (Changing some things....) "); // event
        }
        wait 5;
        level.var_9427911d = 30; // should fix it
    }
}