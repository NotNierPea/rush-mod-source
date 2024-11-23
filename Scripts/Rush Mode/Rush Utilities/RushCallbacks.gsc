Callbacks() // using spawner add function crashes mid game, so callbacks instead
{
    level endon(#"end_game", #"game_ended");

    level flagsys::wait_till(#"load_main_complete");

    level thread DeleteLogic();
    level thread UpdateVars();
    
    // main stuff here...
    level callback::on_ai_spawned(&on_ai_spawned_model);
    level callback::on_ai_spawned(&on_ai_spawned_duck);
    level callback::on_ai_spawned(&on_ai_spawnedwidowz);
    level callback::on_ai_spawned(&on_ai_spawnedsymbol);
    level callback::on_ai_spawned(&on_ai_spawnednuke);
    level callback::on_ai_spawned(&on_ai_specialspawned);

    // random stuff goes here.....
    level callback::on_ai_killed(&zombie_death_soundmodel);
    level callback::on_ai_spawned(&on_ai_spawned_dog);

    // main checks here
    level callback::on_ai_spawned(&on_ai_spawned_checks);

    //level callback::on_ai_damage(&zombie_damage_sound);
    // some custom callbacks stuff here
    switch(BO4GetMap())
    {
        case "Blood":
        level callback::on_ai_spawned(&on_ghost_spawned);
        level callback::on_ai_spawned(&on_specialbrutus_spawned);
        break;

        case "Voyage":
        // frost shield
        functionLazy = @namespace_b45e3f05<script_311952573639271c.gsc>::function_73bdaf30;
        level thread [[ functionLazy ]]();
        break;
    }

    // notes
    // spawn zombies clear does crash for IX boss fight lockdown

    level flag::wait_till("initial_blackscreen_passed"); // waits for players

    level flag::set("spawn_zombies");
    
    while(!level.PickedOption) // wait for pick
    {
        util::wait_network_frame(1);
    }

    level flag::clear("spawn_zombies");
    level notify(#"RushStarted");
    // checks
    wait 5;

    foreach(player in level.players)
    {
        player iPrintLn("^3Rush Mode has been Started....");
    }

    if (BO4GetMap() == "Voyage" && level flag::get(#"boss_fight_started")) return;
    if (BO4GetMap() == "IX" && zm_zonemgr::any_player_in_zone("zone_boss_battle")) return;
    if (BO4GetMap() == "Dead" && level flag::get(#"boss_fight_started")) return;
    
    if (BO4GetMap() == "Blood" && zm_zonemgr::zone_is_enabled(#"zone_west_side_exterior_upper_03")) return;
    
    level flag::set("spawn_zombies");
}

on_ai_spawned_checks() // checks, mainly for boss fight in vod...
{
    self endon(#"death");

    if (self.archetype === #"zombie")
    {
        while(true)
        {
            wait 1;

            switch(BO4GetMap())
            {
                case "Voyage": 
                if(self.model != #"hash_3f40f18c3ccc4c58" 
                && self.model != #"c_zom_dlc1_skeleton_zombie_body"
                && !self IsAttached("c_t8_zmb_dlc0_hero_scarlett_head1_cst", "")
                && !self IsAttached(#"c_t8_zmb_dlc0_hero_diego_head1_cst", "j_head")
                && !self IsAttached(#"p8_zm_red_floatie_duck", "j_spinelower")
                && !isDefined(self.CheckedChange))
                {
                    self on_ai_spawned_model();
                    self on_ai_spawned_duck();
                    self.CheckedChange = true;
                }
                break;
            }
            self.no_gib = 1;
        }
    }
}

on_ai_spawned_model() // main
{
    self endon(#"death");

    if (self.archetype === #"zombie")
    {
        switch(BO4GetMap())
        {
            case "IX": 
            self thread MaskLogicIX();
            self setmodel(#"hash_18a44b6afa971a22");
            if (isdefined(self.hatmodel))
            {
                self detach(self.hatmodel, "");
            }
            if (isdefined(self.head))
            {
                self detach(self.head, "");
                self attach(#"hash_70f1aafdf8d06953", "");
            }
            self.no_gib = 1; // fix model reverting
            break;

            case "Dead": 
            switch(randomIntRange(1, 5))
            {
                case 1:
                self setmodel(#"c_t8_zmb_dlc1_catherine_ghost_body");
                if (isdefined(self.hatmodel))
                {
                    self detach(self.hatmodel, "");
                }
                if (isdefined(self.head))
                {
                    self detach(self.head, "");
                    self attach("c_t8_zmb_dlc1_catherine_ghost_head", "");
                }
                break;

                case 2:
                self setmodel(#"c_t8_zmb_titanic_stoker_body1");
                if (isdefined(self.hatmodel))
                {
                    self detach(self.hatmodel, "");
                }
                if (isdefined(self.head))
                {
                    self detach(self.head, "");
                }
                break;

                case 3:
                self setmodel(#"c_t8_mp_spe_buffer_body1");
                if (isdefined(self.hatmodel))
                {
                    self detach(self.hatmodel, "");
                }
                if (isdefined(self.head))
                {
                    self detach(self.head, "");
                }
                self attach("c_t8_mp_spe_buffer_paladin_head1", "j_head");
                break;

                case 4:
                self setmodel(#"c_t8_zmb_dlc1_hero_butler_arms1_viewbody1");
                if (isdefined(self.hatmodel))
                {
                    self detach(self.hatmodel, "");
                }
                if (isdefined(self.head))
                {
                    self detach(self.head, "");
                }
                self attach("c_t8_zmb_dlc1_hero_butler_head1", "");
                self attach("c_t8_zmb_dlc1_hero_butler_lowerbody1", "");
                self attach("c_t8_zmb_dlc1_hero_butler_torso1", "");
                break;
            }
            self.no_gib = 1;
            break;

            case "Voyage": 
            switch(randomIntRange(1, 3))
            {
                case 1: // scar
                self setmodel(#"c_zom_dlc1_skeleton_zombie_body");
                if (isdefined(self.hatmodel))
                {
                    self detach(self.hatmodel, "");
                }
                if (isdefined(self.head))
                {
                    self detach(self.head, "");
                    self attach("c_t8_zmb_dlc0_hero_scarlett_head1_cst", "");
                }
                break;

                case 2: // bruno
                self setmodel(#"hash_3f40f18c3ccc4c58");
                if (isdefined(self.hatmodel))
                {
                    self detach(self.hatmodel, "");
                }
                if (isdefined(self.head))
                {
                    self detach(self.head, "");
                    self attach(#"c_t8_zmb_dlc0_hero_diego_head1_cst", "j_head");
                }
                break;
            }

            self.no_gib = 1; // fix model reverting
            break;

            case "Classified":
            case "Blood":
            switch(randomIntRange(1, 5))
            {
                case 1:
                self setmodel(#"c_t8_zmb_hero_scarlett_arms1_cst");
                if (isdefined(self.hatmodel))
                {
                    self detach(self.hatmodel, "");
                }
                if (isdefined(self.head))
                {
                    self detach(self.head, "");
                }
                self attach("c_t8_zmb_hero_scarlett_head1_cst", "");
                self attach("c_t8_zmb_hero_scarlett_lowerbody1_viewbody1_cst", "");
                break;

                case 2:
                self setmodel(#"c_t8_zmb_dlc0_hero_bruno_arms1_cst");
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
                break;

                case 3:
                self setmodel(#"c_t8_zmb_hero_diego_arms1_cst");
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
                break;

                case 4:
                self setmodel(#"c_t8_zmb_dlc0_hero_stanton_arms1_viewbody1_cst");
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
                break;
            }
            self.no_gib = 1; // fix model reverting
            break;

            case "AO": // new
            switch(randomIntRange(1, 5))
            {
                case 1:
                self setmodel(#"c_zom_zod_robot_protector_fb");
                if (isdefined(self.hatmodel))
                {
                    self detach(self.hatmodel, "");
                }
                if (isdefined(self.head)) // no head for robot
                {
                    self detach(self.head, "");
                }
                break;

                case 2:
                self setmodel(#"c_t8_c_zom_avagadro_fb");
                if (isdefined(self.hatmodel))
                {
                    self detach(self.hatmodel, "");
                }
                if (isdefined(self.head))
                {
                    self detach(self.head, "");
                }
                break;

                case 3:
                self setmodel(#"c_zom_dlc_richtofen_fb");
                if (isdefined(self.hatmodel))
                {
                    self detach(self.hatmodel, "");
                }
                if (isdefined(self.head))
                {
                    self detach(self.head, "");
                }
                break;

                case 4:
                self setmodel(#"c_t8_zmb_homunculus_fb1");
                if (isdefined(self.hatmodel))
                {
                    self detach(self.hatmodel, "");
                }
                if (isdefined(self.head))
                {
                    self detach(self.head, "");
                }
                break;
            }
            self.no_gib = 1; // fix model reverting
            break;

            case "Tag":
            switch(randomIntRange(1, 5))
            {
                case 1:
                self setmodel(#"c_zom_dlc_waw_nikolai_fb");
                if (isdefined(self.hatmodel))
                {
                    self detach(self.hatmodel, "");
                }
                if (isdefined(self.head)) // no head for robot
                {
                    self detach(self.head, "");
                }
                break;

                case 2:
                self setmodel(#"p8_zm_music_box_samantha_trap");
                if (isdefined(self.hatmodel))
                {
                    self detach(self.hatmodel, "");
                }
                if (isdefined(self.head))
                {
                    self detach(self.head, "");
                }
                break;

                case 3:
                self setmodel(#"c_t8_mp_swatbuddy_body2");
                if (isdefined(self.hatmodel))
                {
                    self detach(self.hatmodel, "");
                }
                if (isdefined(self.head))
                {
                    self detach(self.head, "");
                }
                self attach(#"c_t8_mp_swatbuddy_head2", "j_head"); 
                break;

                case 4:
                self setmodel(#"c_t8_zmb_homunculus_fb1");
                if (isdefined(self.hatmodel))
                {
                    self detach(self.hatmodel, "");
                }
                if (isdefined(self.head))
                {
                    self detach(self.head, "");
                }
                break;
            }
            self.no_gib = 1; // fix model reverting
            break;

            case "AE":
            self thread MaskLogicAE();
            if (randomIntRange(0, 2) == 1)
            {
                self setmodel(#"hash_391c19832e6f113d"); //hash_d8eb4e9e250cdc3 //hash_77bcac59f3591a33
            }
            else
            {
                self setmodel(#"hash_51705235210610ab"); //hash_d8eb4e9e250cdc3
            }
            if (isdefined(self.hatmodel))
            {
                self detach(self.hatmodel, "");
            }
            if (isdefined(self.head))
            {
                self detach(self.head, "");
            }
            self.no_gib = 1; // fix model reverting
            break;
        }
    }

    if (self.archetype === #"brutus" && !isdefined(self.var_9fde8624))
    {
        self setmodel(#"c_t8_zmb_hero_scarlett_arms1_viewbody1_cst");
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self attach("c_t8_zmb_hero_scarlett_head1_cst", "");
        self attach("c_t8_zmb_hero_scarlett_lowerbody1_cst", "");

        self.var_ece4a895 = undefined; // fix behavior in boss fight
    } 

    if(self.archetype === #"gegenees")
    {
        wait 1;

        /#
        self.var_6f84b820 = "boss";
        self setmodel(#"c_t8_zmb_dlc2_perseus_fb1"); //hash_d8eb4e9e250cdc3
    
        if (isdefined(self.hatmodel))
            self detach(self.hatmodel, "");
        if (isdefined(self.head))
            self detach(self.head, "");
        #/

        self attach("p8_zm_red_floatie_duck", "j_spinelower", 1);
        self attach("p7_zm_power_up_nuke", "j_spinelower", 1);
        self.bgb_quacknarok = 1;
    }

    /#
    if (self.archetype === #"zombie_dog" || self.archetype === #"tiger")
    {
        if (isdefined(self.head))
        {
            self detach(self.head, "");
        }
        self setmodel(#"c_gen_direwolf_fb");
    }
    #/
}

MaskLogicIX()
{
    maskie = util::spawn_model(#"hash_22ff9439e827add6", self.origin, self.angles, undefined, 0);
    maskie linkTo(self, "j_head", (2.08, 4.25, 0), (-90, 180, 0)); // needs a little changes
    level.DeleteLogic[level.DeleteLogic.size] = maskie;
    self.hatmodelcustom = maskie;
}

MaskLogicAE()
{
    maskie = util::spawn_model(#"hash_6348fa31c3c34ae3", self.origin, self.angles, undefined, 0);
    maskie linkTo(self, "j_head", (2.08, 2.5, 0), (-90, 180, 0)); // needs a little changes
    level.DeleteLogic[level.DeleteLogic.size] = maskie;
    self.hatmodelcustom = maskie;
}

DeleteLogic()
{
    /#
    Linked = level.DeleteLogic[i] GetLinkedEnt();
    if (!isdefined(Linked)) level.DeleteLogic[i] delete();
    #/

    while(true)
    {
        wait 5;
        level.DeleteLogic = array::remove_undefined(level.DeleteLogic);

        foreach(ents in level.DeleteLogic)
         ents thread CheckDeleteMove();
        //foreach(player in level.players) player iPrintLnBold("Test Mask/Delte done");
    }
}

CheckDeleteMove()
{
    self endon(#"death"); // not sure if this works or not idk
    
    // Rework....
    OriginalCords = self getOrigin();
    wait 5;

    if(OriginalCords == self getOrigin())
     self delete();
}

UpdateVars() // can cause crash!
{
    level endon(#"StopObjectsCount");

    while(true)
    {
        //level.ObjectsLimits = array::filter(level.ObjectsLimits, 0, &DeleteObjects);
        
        level.ObjectsLimits = array::remove_undefined(level.ObjectsLimits);
        util::wait_network_frame(3);
    }
}

on_ai_spawned_duck() // main
{
    self endon(#"death");

    if (level.QuackZombies && self.archetype === #"zombie")
    {
        ducks = 1;
        foreach (player in getplayers()) 
        {
            if (player bgb::is_enabled(#"zm_bgb_quacknarok"))
                ducks = 0;
        }
        
        if (ducks)
        {
            self attach("p8_zm_red_floatie_duck", "j_spinelower", 1);
            self.bgb_quacknarok = 1;
        }
    }
}

on_specialbrutus_spawned()
{
    self endon(#"death");

    if (isdefined(self.var_9fde8624) && self.var_9fde8624 == #"brutus_special") 
    {
        self thread BrutusSpecialDuck();
        self.var_ece4a895 = undefined; // fix behavior in boss fight
    }
}

on_ai_specialspawned()
{
    self endon(#"death");

    if (SpecialZombie() && !isdefined(self.dontchange))
    {
        ducks = 1;
        foreach (player in getplayers()) 
        {
            if (player bgb::is_enabled(#"zm_bgb_quacknarok")) 
                ducks = 0;
        }

        if (ducks) 
        {
            self attach("p8_zm_red_floatie_duck", "j_spinelower", 1);
            self attach("p7_zm_power_up_nuke", "j_spinelower", 1);
            self.bgb_quacknarok = 1;
        }
    } 
}

on_ghost_spawned()
{
    self endon(#"death");

    if (self.archetype === #"ghost")
    {
        ducks = 1;
        foreach (player in getplayers()) 
        {
            if (player bgb::is_enabled(#"zm_bgb_quacknarok")) 
                ducks = 0;
        }

        if (ducks) 
        {
            self attach("p8_zm_red_floatie_duck", "j_spinelower", 1);
            self attach("p7_zm_power_up_nuke", "j_spinelower", 1);
            self.bgb_quacknarok = 1;
        }
    } 
}

on_ai_spawnedwidowz() 
{
    self endon(#"death");

    if (level.WidowZombies && self.archetype === #"zombie")
    {
        ducks = 1;
        foreach (player in getplayers()) 
        {
            if (player bgb::is_enabled(#"zm_bgb_quacknarok")) 
                ducks = 0;
        }

        if (ducks) 
        {
            self attach("p7_zm_vending_widows_wine", "j_spinelower", 1);
            self.bgb_quacknarok = 1;
        }
    }
}

on_ai_spawnedsymbol() 
{
    self endon(#"death");

    if (level.SymbolZombies && self.archetype === #"zombie")
    {
        ducks = 1;
        foreach (player in getplayers()) 
        {
            if (player bgb::is_enabled(#"zm_bgb_quacknarok")) 
                ducks = 0;
        }

        if (ducks) 
        {
            self attach("p8_zm_power_door_symbol_01", "j_spinelower", 1);
            self.bgb_quacknarok = 1;
        }
    }
}

on_ai_spawnednuke() 
{
    self endon(#"death");

    if (level.NukeZombies && self.archetype === #"zombie")
    {
        ducks = 1;
        foreach (player in getplayers()) 
        {
            if (player bgb::is_enabled(#"zm_bgb_quacknarok")) 
                ducks = 0;
        }

        if (ducks) 
        {
            self attach("p7_zm_power_up_nuke", "j_spinelower", 1);
            self.bgb_quacknarok = 1;
        }
    }
}

zombie_death_soundmodel(s_params) // might cause "caller is not an entity" / "Charlie"
{
    // no if statement for arachtype here

    if (isdefined(self.DuckObj)) // for dogs
        self.DuckObj delete();
    
    if (isdefined(self.hatmodelcustom)) // for IX
        self.hatmodelcustom delete();

    if (!isplayer(s_params.eattacker)) // check if player killed the zombie or not
        return;
    
    if (BO4GetMap() == "IX") self clientfield::increment("" + #"maelstrom_death");

    w_weapon = s_params.weapon;
    if (isdefined(w_weapon) && zm_weapons::is_wonder_weapon(w_weapon)) 
    {
        self playsound(#"zmb_sq_souls_impact");
        //return;
    }
    else
     self playsound(#"zmb_key_pickup"); //zmb_key_pickup

    if(isdefined(level.StopRandomObjects)) // mostly for tag lockdown
    {
        randomn = randomIntRange(1, 11);
        if (randomn < 6)
        return;
    }

    if (isdefined(self) && isdefined(self.bgb_quacknarok) && self.bgb_quacknarok)
    {
        random = randomIntRange(0, 7);
        switch(random)
        {
            case 0:
            randomM = util::spawn_model("p8_zm_red_floatie_duck", self gettagorigin("j_spinelower"), self gettagangles("j_spinelower"));
            break;

            case 1:
            randomM = util::spawn_model("p7_zm_power_up_max_ammo", self gettagorigin("j_spinelower"), self gettagangles("j_spinelower"));
            break;

            case 2:
            randomM = util::spawn_model("p7_zm_power_up_nuke", self gettagorigin("j_spinelower"), self gettagangles("j_spinelower"));          
            break;

            case 3:
            randomM = util::spawn_model("zombie_pickup_perk_bottle", self gettagorigin("j_spinelower"), self gettagangles("j_spinelower"));        
            break;
        
            case 4:
            randomM = util::spawn_model("p7_zm_power_up_double_points", self gettagorigin("j_spinelower"), self gettagangles("j_spinelower"));     
            break;

            case 5:
            randomM = util::spawn_model("p7_zm_power_up_insta_kill", self gettagorigin("j_spinelower"), self gettagangles("j_spinelower"));        
            break;
            
            case 6:
            randomM = util::spawn_model("p7_zm_power_up_firesale", self gettagorigin("j_spinelower"), self gettagangles("j_spinelower"));          
            break;
        }

        if (SpecialZombie() || self.archetype === #"zombie_dog" || self.archetype === #"tiger") // not added due to some changes
        {
            randomM SetScale(10); randomM.origin = randomM.origin + (0, 0, 200);
        }

        duckie = randomM;
        if (isdefined(duckie))
        {
            duckie notSolid(); // maybe charlie?
            if (level.VoyageLaunch)
                duckie physicslaunch(self.origin, vectorscale((0, 0, RandomFloatRange(0.10, 1.5)), 64));
            else
                duckie physicslaunch(self.origin, vectorscale((0, 0, RandomFloatRange(0.05, 0.20)), 64));
            
            duckie thread DeleteSeconds();
        }
    }

    return;
}

zombie_damage_sound(s_params) // might cause "caller is not an entity"
{
    if (!isplayer(s_params.eattacker))
    {
        return;
    }
    self playsound(#"hash_5af2a9d11f007b9");
    return;
}

on_ai_spawned_dog()
{
    self endon(#"disconnect", #"death");

    if (self.archetype === #"zombie_dog" || self.archetype === #"tiger")
    {
        DuckPlayer = util::spawn_model("p8_zm_red_floatie_duck", self.origin + (0, 0, 35), self.angles);
        DuckPlayer SetScale(1.5);
        DuckPlayer enablelinkto();
        DuckPlayer linkto(self);
        DuckPlayer notSolid();
        self.DuckObj = DuckPlayer;

        level.DeleteLogic[level.DeleteLogic.size] = DuckPlayer;
        self.bgb_quacknarok = 1;
    }

    if (isdefined(self.player_owner)) // for luna
    {
        wait 40;
        if (isdefined(self) && isdefined(self.DuckObj))
        {
            self.DuckObj delete();
        }
    }
}