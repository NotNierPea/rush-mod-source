NukeLook(origin, angles, linkto_entity, plusorigin, scale)
{
    level endon(#"end_game", #"game_ended");
    level endon(#"hash_25d8c88ff3f91ee5");
    level endon(#"StopNukie");

    thread RandomPlayerLook();
    playfx(level._effect[#"teleport_splash"], origin);

    Nukie = util::spawn_model("p7_zm_power_up_nuke", origin, angles);
    Nukie SetScale(10);
    if(isdefined(scale)) Nukie SetScale(scale);
    level.NukieC = Nukie;
    level thread NukeMove();

    self thread NukeRPGs();
    self thread DeathNotify();
    Nukie thread CheckNukeie();

    players = getplayers();
    if(isdefined(linkto_entity))
    {
        if (BO4GetMap() == "Voyage" && level flag::get(#"boss_fight_started"))
        {
            Nukie VODNukieLogic(origin, angles, linkto_entity, plusorigin);
            return;
        }
        
        while(true) // linkto command WILL FIX/MAKE ANGLES STUCK, so i won't use it
        {
            anglesC = vectortoangles(players[level.RandomPlayer].origin - Nukie.origin);
            Nukie.origin = linkto_entity.origin + plusorigin;
            Nukie.angles = anglesC;
            util::wait_network_frame();
        }
    }

    while(true)
    {
        Nukie.angles = vectortoangles(players[level.RandomPlayer].origin - Nukie.origin);
        util::wait_network_frame();
    }
}

NukeLookFriendly(origin, angles, scale) // changed a lot of logic
{
    level endon(#"end_game", #"game_ended");
    level endon(#"StopNukeFriend");
    self endon(#"disconnect", #"death");

    playfx(level._effect[#"teleport_splash"], origin);

    Nukie = util::spawn_model("p7_zm_power_up_nuke", origin, angles);
    Nukie thread FollowPlayer();
    Nukie thread CheckNukeieFriendly();
    Nukie SetScale(10);
    if(isdefined(scale)) Nukie SetScale(scale);

    wait 1;
    while(true)
    {
        ClosestZombieF = array::get_all_closest(Nukie.origin, getaiarchetypearray(#"zombie"));

        if(isDefined(ClosestZombieF) && ClosestZombieF.size > 0 && isAlive(ClosestZombieF[0]))
        {
            Nukie.angles = vectortoangles(ClosestZombieF[0].origin - Nukie.origin);
            if(randomIntRange(1, 100) > 80) self thread NukeRPGsFriendly(Nukie, ClosestZombieF[0]); // self -> so it doesn't damage you
        }
        util::wait_network_frame();
    }
}

CheckNukeie()
{
    self endon(#"disconnect", #"death");

    level waittill(#"StopNukie");
    wait 0.5;
    playfx(level._effect[#"teleport_splash"], self.origin);
    self delete();
}

CheckNukeieFriendly()
{
    self endon(#"disconnect", #"death");
    
    level waittill(#"StopNukeFriend");
    wait 0.5;

    playfx(level._effect[#"teleport_splash"], self.origin);
    util::wait_network_frame(1);
    self delete();
}

DeathNotify()
{
    level endon(#"end_game", #"game_ended");

    self waittill(#"death", #"hash_25d8c88ff3f91ee5");
    level notify(#"StopNukie");
}

VODNukieLogic(origin, angles, linkto_entity, plusorigin)
{
    level endon(#"end_game", #"game_ended");
    level endon(#"StopNukie");
    level endon(#"hash_25d8c88ff3f91ee5");
    self endon(#"disconnect", #"death");

    players = getplayers();
    while(!level flag::get(#"hash_fa1fa6cc9b17c7c")) // phase 1
    {
        anglesC = vectortoangles(players[level.RandomPlayer].origin - self.origin);
        self.origin = linkto_entity.origin + plusorigin;
        self.angles = anglesC;
        util::wait_network_frame();
    }

    while(!level flag::get(#"hash_bd3b222f6d8329d")) // phase 2 fix
    {
        anglesC = vectortoangles(players[level.RandomPlayer].origin - self.origin);
        self.origin = linkto_entity.origin + (0, 0, 0);
        self.angles = anglesC;
        util::wait_network_frame();
    }

    while(!level flag::get(#"hash_25d8c88ff3f91ee5")) // phase 3/4/5 revert
    {
        anglesC = vectortoangles(players[level.RandomPlayer].origin - self.origin);
        self.origin = linkto_entity.origin + plusorigin;
        self.angles = anglesC;
        util::wait_network_frame();
    }
}

NukeRPGs()
{
    level endon(#"end_game", #"game_ended");
    level endon(#"StopNukie");
    level endon(#"hash_25d8c88ff3f91ee5"); // dotn
    self endon(#"disconnect", #"death");

    players = getplayers();
    Nukie = level.NukieC;

    if (BO4GetMap() == "Voyage" && level flag::get(#"boss_fight_started"))
    {
        self NukeRPGsVoyage();
        return;
    }

    while(true)
    {
        wait 5;
        Nukie SendRocket("launcher_standard_t8", Nukie, (0, 0, 0), players[level.RandomPlayer]);
        Nukie notify(#"ShotRPG");
    }
}

NukeRPGsFriendly(Nukie, Zombie = undefined)
{
    level endon(#"end_game", #"game_ended");
    level endon(#"StopNukeFriend"); 
    self endon(#"disconnect", #"death");

    if(isDefined(Zombie) && isAlive(Zombie)) 
    {
        for (i = 1; i < 3; i++) self SendRocket("launcher_standard_t8_upgraded", Nukie, (0, 0, 0), Zombie);
        Nukie notify(#"ShotRPG");
    }
}

NukeRPGsVoyage()
{
    level endon(#"hash_25d8c88ff3f91ee5");
    level endon(#"StopNukie");
    self endon(#"disconnect", #"death");

    players = getplayers();
    Nukie = level.NukieC;

    while(level.e_boss.var_6efcc8c1 != 3)
    {
        wait 5.5;
        Nukie SendRocket("launcher_standard_t8", Nukie, (0, 0, 0), players[level.RandomPlayer]);
        Nukie notify(#"ShotRPG");
    }
}

NukeMove()
{
    level endon(#"end_game", #"game_ended");
    level endon(#"hash_25d8c88ff3f91ee5");
    level endon(#"StopNukie");
    self endon(#"disconnect", #"death");

    Nukie = level.NukieC;
    players = getplayers();
    while(true)
    {
        Nukie MoveY(100, 2.5);
        Nukie waittill(#"movedone");
        Nukie MoveY(-200, 2.5);
        Nukie waittill(#"movedone");
        Nukie MoveY(100, 2.5);
        Nukie waittill(#"movedone");
        Nukie MoveX(100, 2.5);
        Nukie waittill(#"movedone");
        Nukie MoveX(-200, 2.5);
        Nukie waittill(#"movedone");
        Nukie MoveX(100, 2.5);
        Nukie waittill(#"movedone");
    }
}