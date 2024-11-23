MessagesCustom()
{
    switch(BO4GetMap()) // messages and help
    {
        case "Blood":
        wait 20;
        self thread FreeChargeBlood();
        self iPrintlnBold("^2 Free Shield Charges every 60 Seconds! "); // rush mode text
        break;

        case "AE":
        //wait 30;
        //self iPrintlnBold("^3 The Challenge Blue Flame is still there, just not visible! ");
        break;
    }
}

BrutusSpawnBlood()
{
    level endon(#"hash_3bb155b55ea4338a");

    wait 15;

    while(level.PickedOption == false)
    {
        wait 1;
    }  

    wait 10;

    attempt_brutus_spawn = @zombie_brutus_util<script_7c62f55ce3a557ff.gsc>::attempt_brutus_spawn;
    if (!isdefined(attempt_brutus_spawn))
    {
        iPrintlnBold("^1 Error! ");
        return;
    }
    //zombie_brutus_util::brutus_spawn(undefined, undefined, undefined, undefined, "zone_west_side_exterior_upper_03");
    [[ attempt_brutus_spawn ]](1, "zone_west_side_exterior_upper_03", 1);
}

FreeChargeBlood() // shield charges botd
{
    self endon(#"disconnect", #"death");
    
    function_804309c = @zm_weap_spectral_shield<scripts\zm\weapons\zm_weap_spectral_shield.gsc>::function_804309c;
    wait 10;
    while(true)
    {
        /#
        if (!isdefined(function_804309c))
        {
            self iPrintlnBold("^1 Error! ");
            return;
        }

        self [[ function_804309c ]](); // no "1"
        #/
        if (self hasweapon(level.var_637136f3) || self hasweapon(level.var_d7e67022))
        {
            wait 2; // fuck off late tiger
            self.var_9fd623ed = math::clamp(self.var_9fd623ed + 12, 0, self.var_f7c822b5 * 3); // 12 is 4 charges, so 3 = 1 charge
            self thread [[ function_804309c ]](); // no "1"
            self notify(#"hash_22a49f7903e394a5"); // needed
            self iPrintlnBold("^2 Shield Charged! "); // rush mode text
        }
        else
        {
            self iPrintlnBold("^3 No Shield has been Charged! "); // rush mode text
        }
        wait 80; // wait
    }

}

WereWolf_Spawner()
{
    //level endon(#"end_game", #"game_ended");

    function_47a88a0c = @zombie_werewolf_util<script_387eab232fe22983.gsc>::function_47a88a0c; 

    while(!level.PickedOption) // wait for pick
    {
        wait 1;
    }
    wait 50;
    while(true)
    {
        if (!isdefined(function_47a88a0c))
        {
            iPrintlnBold("^1 Error! ");
            return;
        }

        level thread [[ function_47a88a0c ]](1, undefined, 1, undefined, 200);
        level thread SpawnBlight();

        if (level flag::get(#"boss_fight_started") && !level flag::get(#"hash_25d8c88ff3f91ee5")) // in boss fight only
            wait 30;
        else
            wait 120;
    }
}

BirdHelp() // a little help
{
    //level endon(#"end_game", #"game_ended");

    wait 5;

    while(level.PickedOption == false) // wait till the 3 options are picked
    {
        wait 1;
    }
    wait 1;

    // check if skipped
    if (level.SkippedBird)
        level thread BirdSelectedSkip();
    
    level waittill(#"seagull_blasted");
    NotifyRoundEnd();
    foreach(player in level.players)
    {
        player iPrintLnBold("^3 Bird has been Found! (1), ^1Changing Round....");
    }
    level waittill(#"seagull_blasted");
    NotifyRoundEnd();
    foreach(player in level.players)
    {
        player iPrintLnBold("^3 Bird has been Found! (2), ^1Changing Round....");
    }
    level waittill(#"seagull_blasted");
    NotifyRoundEnd();
    foreach(player in level.players)
    {
        player iPrintLnBold("^3 Bird has been Found! (3), ^1Changing Round....");
    }
}



OnDamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime) // points are health
{
    self endon(#"disconnect");
    level endon(#"end_game", #"game_ended");
    if (!zm_utility::is_explosive_damage(smeansofdeath) && !bgb::is_enabled(#"zm_bgb_blood_debt") && !(isdefined(self.var_dad8bef6) && self.var_dad8bef6) && (isdefined(self.HDrainPoints)) && (isdefined(self.DrainP)))
    {
        if (idamage > 0) 
        {
            if (self.HDrainPoints.size > 1) 
            {
                n_cost = self.HDrainPoints[0];
            } 
            else 
            {
                n_cost = self.HDrainPoints[0] * self.DrainP;
                //self.DrainP++;
            }
            if (self zm_score::can_player_purchase(n_cost, 1)) 
            {
                self CostPoints(n_cost);
                return 0;
            } 
            else 
            {
                /#
                n_cost = zm_score::function_ffc2d0bc();
                if (n_cost > 3000) // if higher
                {
                    n_damage = idamage;
                } 
                else
                {
                    self CostPoints(n_cost);
                    n_damage = 0;
                }
                #/
                //self bgb::take();
                return idamage;
            }
        }
    }
    return -1;
}

CostPoints(n_cost)
{
    self endon(#"disconnect", #"death");

    self zm_score::minus_to_player_score(n_cost, 1);
    if (self.HDrainPoints.size > 1) {
        self.HDrainPoints = array::remove_index(self.HDrainPoints, 0);
    }
}

BirdSelectedSkip()
{
    level endon(#"end_game", #"game_ended");

    level waittill(#"hash_6da514c90059d5c2");
    wait 35;

    foreach(player in level.players)
    {
        player iPrintLnBold("^8 Skipping Bird Step.... (You will still Need to Get The Book!) ");
    }

    wait 15;
    level notify(#"seagull_blasted");
    wait 20;
    level notify(#"seagull_blasted");
    wait 20;
    level notify(#"seagull_blasted");
}