/*
###########################################
Basic Modifications
###########################################
*/
Godmode()
{
    self.godmode = isDefined(self.godmode) ? undefined : true;
 
    if(isDefined(self.godmode))
    {
        self endon("disconnect");
 
        while(isDefined(self.godmode)) 
        {
            self EnableInvulnerability();
            wait 0.1;
        }
    }
    else
        self DisableInvulnerability();
}

NoclipToggle(player) // ATE's noclip
{
    self endon(#"spawned_player", #"disconnect", #"bled_out");
    self endon(#"stop_noclip");

    level endon(#"end_game", #"game_ended");
    self notify(#"stop_player_out_of_playable_area_monitor");

	self unlink();

    self.Noclip = isDefined(self.Noclip) ? undefined : true;

    if(!isDefined(self.Noclip))
     return;
    
    if(isdefined(self.originObj)) self.originObj
     delete();

    ts = 0;

    self closeMenu1();

    self iPrintLnBold("^6Noclip ^1Enabled");

	while(true)
    {
        self.originObj = spawn("script_origin", self.origin, 1);
        self.originObj.angles = self.angles;
        self PlayerLinkTo(self.originObj, undefined);
        
        while(true) 
        {
            if(!isDefined(self.Noclip))
            { 
                self iPrintLnBold("^6Noclip ^1Disabled");
                break;
            }

            if (isdefined(self.originObj.future_tp)) 
            {
                self.originObj.origin = self.originObj.future_tp;
                self.originObj.future_tp = undefined;
                waitframe(1);
                continue;
            }

            if(self sprintbuttonpressed()) 
                fly_speed = 80;
            else 
                fly_speed = 40;

            player_angles = self getPlayerAngles();

            // I'm too tired to remember my vector courses
            front_vector = AnglesToForward(player_angles);
            left_vector = AnglesToForward(player_angles - (0, 90, 0));
            top_vector = AnglesToForward(player_angles - (90, 0, 0));

            v_movement = self getNormalizedMovement();

            if (self jumpbuttonpressed())
                z_movement = 1;
            else if (self stancebuttonpressed())
                z_movement = -1;
            else
                z_movement = 0;

            move_vector = 
                // add z angle
                    z_movement * top_vector 
                // add front movement
                + front_vector * v_movement[0] 
                // remove left/right z vector part because it was weird
                + (left_vector[0], left_vector[1], 0) * v_movement[1];
            
            move_vector_scaled = vectorScale(move_vector, fly_speed);
            originpos = self.origin + move_vector_scaled;
            self.originObj.origin = originpos;

            if(self meleeButtonPressed() && !self isInMenu())
             self.Noclip = undefined;

            waitframe(1);
        }

        self unlink();
        if(isdefined(self.originObj)) self.originObj delete();

        if(!isDefined(self.Noclip))
         break;

        waitframe(1);
	}
}


UnlimitedAmmo()
{
    self.UnlimitedAmmo = isDefined(self.UnlimitedAmmo) ? undefined : true;
    if(isDefined(self.UnlimitedAmmo))
    {
        while(isDefined(self.UnlimitedAmmo))
        {
            self GiveMaxAmmo(self GetCurrentWeapon());
            self SetWeaponAmmoClip(self GetCurrentWeapon(), self GetCurrentWeapon().clipsize);
            wait 20;
            break;
        }
    }
}

ToggleRecoil()
{
    self.recoil = isDefined(self.recoil) ? undefined : true;
    
    if(isDefined(self.recoil))
    {
        self endon("disconnect");
        self S("No Recoil ^2Enabled");
        self.linked=false;
        self.recoilentity = spawnSM(self.origin, "tag_origin");
        while(isDefined(self.recoil))
        {
            if(self AttackButtonPressed()){
                self.recoilentity.origin = self.origin;
                self.recoilentity.angles = (self.recoilentity.angles + self.angles);
                self PlayerLinkTo(self.recoilentity, "tag_origin");
                self.linked=true;
            }
            else if(self.linked == true && !(self AttackButtonPressed()))
            {
                self unlink();
                self.linked=false;
            }
            wait .001;
        }
        if(isDefined(self.recoil))
            self ToggleRecoil();
    }
    else
    {
        self unlink();
        self iPrintLnBold("No Recoil ^1Off");
        self.recoilentity delete();
    }
 }

UnlimitedSprint() 
{
    self.UnlimitedSprint = isDefined(self.UnlimitedSprint) ? undefined : true;
    if (isDefined(self.UnlimitedSprint))
    {
        self setperk("specialty_unlimitedsprint");
        self iPrintLnBold("Unlimited Sprint ^2Enabled");
    } 
    else 
    {
        self unsetperk("specialty_unlimitedsprint");
        self iPrintLnBold("Unlimited Sprint ^1Disabled");
    }
}    
        

ProMod()
{
    self.promod = isDefined(self.promod) ? undefined : true;
    if (isDefined(self.promod))
        setdvar("cg_fov", 120);
    else
        setdvar("cg_fov", 80);
}

PSpeed()
{
    self endon("disconnect");
    
    self.PSpeed = isDefined(self.PSpeed) ? undefined : true;
    if(isDefined(self.PSpeed))
        self SetMoveSpeedScale(2);
    else
        self SetMoveSpeedScale(1);
}


set_door_price(new_price) 
{
    set_entarray_elem_price(getentarray("zombie_door", "targetname"), new_price);
    set_entarray_elem_price(getentarray("zombie_debris", "targetname"), new_price);
}

set_magixbox_price(new_price) 
{
    set_entarray_elem_price(struct::get_array("treasure_chest_use", "targetname"), new_price);
}

set_fasttravel_price(new_price) 
{
    set_entarray_elem_price(struct::get_array("fasttravel_trigger", "targetname"), new_price);
}

set_zvar(zvar, value) 
{
	if(!isdefined(level.zombie_vars)) {
		level.zombie_vars = [];
	}
	level.zombie_vars[zvar] = value;
}

set_entarray_elem_price(entarray, new_price) {
    if (!isdefined(entarray)) {
        return;
    }
    if (!isdefined(new_price)) {
        foreach(ent in entarray) {
            if (isdefined(ent.am_oldprice)) {
                ent.zombie_cost = ent.am_oldprice;
                ent.am_oldprice = undefined;
            }
        }
    } else if (isfunctionptr(new_price)) {
        foreach(ent in entarray) {
            if (!isdefined(ent.am_oldprice)) {
                ent.am_oldprice = ent.zombie_cost;
            }
            ent.zombie_cost = int([[ new_price ]](ent.zombie_cost));
        }
    } else {
        foreach(ent in entarray) {
            if (!isdefined(ent.am_oldprice)) {
                ent.am_oldprice = ent.zombie_cost;
            }
            ent.zombie_cost = int(new_price);
        }
    }
}


BO4Rev()
{
    self thread zm_laststand::auto_revive(self, 0, 0);
}

GiveAllPerks()
{
    //self thread zm_perks::function_cc24f525();
    self zm_perks::function_cc24f525();
    self thread perky();
    for (i = 0; i < 14; i++) 
    {
        var_16c042b8 = self zm_perks::function_b2cba45a();
        if (isdefined(var_16c042b8)) 
        {
            self.var_1eba264f = 1;
        } else 
        {
            return;
        }
    }
}

perky() 
{
    self notify(#"hash_764a30e1b90e56f6");
    self endon(#"hash_764a30e1b90e56f6");
    self waittill(#"fake_death", #"player_downed", #"death");
    if (isdefined(self)) 
    {
        self.var_1eba264f = undefined;
    }
}

PlayerGiveScore(value, player)
{
    player zm_score::add_to_player_score(value);
}


/*
#############################################
Elixir Modification Scripts
Mapped By TheUnknownCoder / MrFawkes1337
#############################################
*/

/*
##################################
Map Selection Stuff (WIP)
##################################
*/



zombie_goto_roundT(target)
{
    zm_game_module::zombie_goto_round(target);
}

perksmove()
{
    foreach(perks in struct::get_array("perk_vapor_altar", "script_noteworthy"))
    {
        perks.origin = (-284,-1119,1056);
        perks.angles = (0,66,0);
    }
}

ChangeMapWIP(Mapname, load)
{
    self iPrintLnBold("Map Changing To "+Mapname);
    wait 0.5;
    setDvar("ls_mapname", load);
    setDvar("mapname", load);
    setDvar("party_mapname", load);
    setDvar("ui_mapname", load);
    setDvar("ui_currentmap", load);
    setDvar("ui_previewmap", load);
    setDvar("ui_showmap", load);
    map(Mapname);
}

ZombieCount(player)
{
    Zombies=getAIArray("axis");
    player iPrintLnBold("Zombies ^1Remaining ^7: ^2"+Zombies.size);
}

//earthqauke , makes the players screen shake
quake(player)
{
    earthquake( 0.6, 5, player.origin, 1000000 );
}



/*
##################################################
Teleportalz :D
##################################################
*/

/*
########################################
Fun Modifications
########################################
*/

bo4_toggleaimbot()
{
    self.aimbot = isDefined(self.aimbot) ? undefined : true;
    if (isDefined(self.aimbot))
    {
        self thread bo4_AimBot();
        self iPrintLnBold("Aimbot ^2Enabled");
    } 
    else 
    {
        self notify("StopAimbotting");
        self iPrintLnBold("Aimbot ^1Disabled");
    }
}

notarget()
{
    self.NoTarg = isDefined(self.NoTarg) ? undefined : true;
    if (isDefined(self.NoTarg))
        self.ignoreme=true;
    else
        self.ignoreme=false;
}

bo4_AimBot()
{
    self endon("disconnect");
    self endon("StopAimbotting");
    while(isDefined(self.aimbot))
    {
        ClosestZombie = Array::get_all_closest(self.origin, GetAITeamArray(level.zombie_team));
        
        if(self isFiring() && ClosestZombie.size > 0 && isAlive(ClosestZombie[0]) && !self IsMeleeing())
        {
            Loc = ClosestZombie[0] gettagorigin("tag_origin");
            
            self setplayerangles(VectorToAngles((Loc) - (self gettagorigin("tag_origin"))));
            wait .05;
            ClosestZombie[0] kill();
        }
        wait .05;
    }
}

StartTeleGun()
{
    self.TeleGun = isDefined(self.TeleGun) ? undefined : true;
    if (isDefined(self.TeleGun))
    {
        self thread TeleportToCrosshair();
    } 
    else 
    {
        self notify("stop_telegun");
    }
}

TeleportToCrosshair() 
{
    self endon("stop_telegun");
    self endon("game_ended");
    for (;;) 
    {
        self waittill("weapon_fired");
        self SetOrigin(bullettrace(self GetTagOrigin("tag_weapon"), self GetTagOrigin("tag_weapon") + vector_scal(AnglesToForward(self GetPlayerAngles()), 10000), 1, self)["position"]);
        wait .1;
    }
    wait .1;
}

vector_scal(vec, scale) 
{
    vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
    return vec;
} 

Multijump(currentNum = 0)
{
    self endon("disconnect");
    self notify("SMulti");
    self.Multijump = isDefined(self.Multijump) ? undefined : true;
    self endon("SMulti");
    
    if(isDefined(self.Multijump))
        self setPerk("specialty_fallheight");
    else
        self unSetPerk("specialty_fallheight");
        
    while(IsDefined(self.Multijump))
    {
        if(self JumpButtonPressed() && currentNum < 15)
        {
            self setVelocity(self getVelocity() + (0, 0, 250));
            currentNum++;
        }
        if(currentNum == 15 && self isOnGround())
            currentNum = 0;

        wait .1;
    }
}

LunaWolf()
{
    spawnactor(#"hash_3f174b9bcc408705", self.origin, self.angles, "wolf_protector", 1);
}

selfInstaKill()
{
    self.personal_instakill = isDefined(self.personal_instakill) ? undefined : true;
}


SaveLocation(Val)
{
    if(Val == 0)
    {
        self.SaveLocation      = self.origin;
        self.SaveLocationAngle = self.angles;
        if(!IsDefined(self.SaveLocTog))
            self.SaveLocTog = true;
            
        self iPrintLn("Current Position: ^2Saved");
    }
    else if(Val == 1)
    {
        if(!IsDefined(self.SaveLocTog))
            return self iPrintLnBold("^1Error: ^7No Location Saved");
            
        self SetPlayerAngles(self.SaveLocationAngle);
        self SetOrigin(self.SaveLocation);
        self iPrintLn("Saved Position: ^2Loaded");
    }
    else
    {
        self.SaveLocTog        = undefined;
        self.SaveLocation      = undefined;
        self.SaveLocationAngle = undefined;
    }
}

BO4_OpenAllDoors()
{
	setdvar(#"zombie_unlock_all", 1);
	level flag::set("power_on");
	level clientfield::set("zombie_power_on", 1);
	power_trigs = getentarray("use_elec_switch", "targetname");
	foreach(trig in power_trigs)
	{
		if(isdefined(trig.script_int))
		{
			level flag::set("power_on" + trig.script_int);
			level clientfield::set("zombie_power_on", trig.script_int + 1);
		}
	}
	players = getplayers();
	zombie_doors = getentarray("zombie_door", "targetname");
	for(i = 0; i < zombie_doors.size; i++)
	{
		if(!(isdefined(zombie_doors[i].has_been_opened) && zombie_doors[i].has_been_opened))
		{
			zombie_doors[i] notify(#"trigger", {#activator:players[0]});
		}
		if(isdefined(zombie_doors[i].power_door_ignore_flag_wait) && zombie_doors[i].power_door_ignore_flag_wait)
		{
			zombie_doors[i] notify(#"power_on");
		}
		waitframe(1);
	}
	zombie_airlock_doors = getentarray("zombie_airlock_buy", "targetname");
	for(i = 0; i < zombie_airlock_doors.size; i++)
	{
		zombie_airlock_doors[i] notify(#"trigger", {#activator:players[0]});
		waitframe(1);
	}
	zombie_debris = getentarray("zombie_debris", "targetname");
	for(i = 0; i < zombie_debris.size; i++)
	{
		if(isdefined(zombie_debris[i]))
		{
			zombie_debris[i] notify(#"trigger", {#activator:players[0]});
		}
		waitframe(1);
	}
	level notify(#"open_sesame");
	wait(1);
	setdvar(#"zombie_unlock_all", 0);
}

originalPointSystem()
{
    level flag::wait_till("all_players_spawned");
    level flag::wait_till("initial_blackscreen_passed");
    level.a_func_score_events[#"damage_points"] = &damage_points;
    level.a_func_score_events[#"death"] = &death_points;
    callback::add_callback(#"hash_790b67aca1bf8fc0",&pack_callback);
}

pack_callback(upgradedweapon)
{
    if(!isdefined(self.var_2843d3cc))
	{
		return;
	}
    if(!isdefined(self.var_2843d3cc[upgradedweapon]))
	{
		return;
	}
    if(self.var_2843d3cc[upgradedweapon] == 1)
    {
        self.var_2843d3cc[upgradedweapon] = 2;
    }
    else if(self.var_2843d3cc[upgradedweapon] == 3)
    {
        self.var_2843d3cc[upgradedweapon] = 4;
    }
}

damage_points(event, mod, hit_location, zombie_team, damage_weapon)
{
    return 10;
}

death_points(event, mod, hit_location, zombie_team, damage_weapon)
{
    points = 50;
    if(mod == "MOD_MELEE" && (!isdefined(damage_weapon) || (!damage_weapon.isriotshield && !zm_loadout::is_hero_weapon(damage_weapon))))
    {
        scoreevents::processscoreevent("melee_kill", self, undefined, damage_weapon);
        points += 70;
    }
    else if(hit_location == "head" || hit_location == "helmet" || hit_location == "neck")
    {
        scoreevents::processscoreevent("headshot", self, undefined, damage_weapon);
        points += 40;
    }
    else
    {
        scoreevents::processscoreevent("kill", self, undefined, damage_weapon);
    }
    return points;
}

LoadTest()
{
    play_outro_igc = @zm_mansion<scripts\zm\zm_mansion.gsc>::play_outro_igc; // skip outro

    if (!isdefined(play_outro_igc))
    {
        self iPrintLnBold("^1Can't find play_outro_igc! ");
        return;
    }

    level thread [[ play_outro_igc ]]();
    scene::add_scene_func(#"hash_3f0bec2bc9216cd4", &ScarDuck, "sh240");
}



DisableHUD()
{
    self endon("disconnect");
    
    self.DisableHUD = isDefined(self.DisableHUD) ? undefined : true;
    if(isDefined(self.DisableHUD))
        self setclientuivisibilityflag("hud_visible", 0);
    else
        self setclientuivisibilityflag("hud_visible", 1);
}

DisableSomeHUD()
{
    self endon("disconnect");
    
    self.DisableSomeHUD = isDefined(self.DisableSomeHUD) ? undefined : true;
    if(isDefined(self.DisableSomeHUD))
        self setclientuivisibilityflag("weapon_hud_visible", 0);
    else
        self setclientuivisibilityflag("weapon_hud_visible", 1);
}

RoundEdit(value)//Renamed cause round999 wasn't really a good name for it now its on a slider.
{
    namespace_a28acff3::set_round_number(value);
    self thread KillAllZombies();
}
/*
####################################
Weapon Modifications
####################################

*/
GiveDeathOfOrion()
{
    self GiveWeapon(getweapon(#"hash_4ae11871b1233211"));
    self switchToWeapon(getweapon(#"hash_4ae11871b1233211"));
    self iPrintLnBold("Death of Orion ^2Given");
}
GiveKraken()
{
    self giveWeapon(getWeapon(#"hash_5b8d1ff4b772bd85"));
    self switchToWeapon(getWeapon(#"hash_5b8d1ff4b772bd85"));
    self iPrintLnBold("Kraken ^2Given");
}
GiveBlundergat()
{
    self giveWeapon(getweapon(#"hash_19c157f2230454ad"));
    self switchToWeapon(getweapon(#"hash_19c157f2230454ad"));
    self iPrintLnBold("Blundergat ^2Given");
}
GiveMagmagat()
{
    self giveWeapon(getweapon(#"hash_1b5092cccdb3d65b"));
    self switchToWeapon(getweapon(#"hash_1b5092cccdb3d65b"));
    self iPrintLnBold("Magmagat ^2Given");
}
GiveAcidgat()
{
    self giveWeapon(getweapon(#"hash_25a13b6f6232a985"));
    self switchToWeapon(getweapon(#"hash_25a13b6f6232a985"));
    self iPrintLnBold("Acidgat ^2Given");
}
GiveSpoon()
{
    self giveWeapon(getweapon(#"hash_52b03a79f854eed3"));
    self switchToWeapon(getweapon(#"hash_52b03a79f854eed3"));
    self iPrintLnBold("Spoon ^2Given");
}
GiveSpork()
{
    self giveWeapon(getweapon(#"hash_32a584f5a65c70d1"));
    self switchToWeapon(getweapon(#"hash_32a584f5a65c70d1"));
    self iPrintLnBold("Spork ^2Given");
}
GiveAlistairsFolly()
{
    self GiveWeapon(GetWeapon(#"hash_138efe2bb30be63c"));
    self switchToWeapon(GetWeapon(#"hash_138efe2bb30be63c"));
    self iPrintLnBold("Alistairs Folly ^2Given");
}
GiveImpaler()
{
    self GiveWeapon(getWeapon(#"hash_25f355b5d35b8488"));
    self switchToWeapon(getWeapon(#"hash_25f355b5d35b8488"));
    self iPrintLnBold("Impaler ^2Given");
}
GiveSerketKiss()
{
    self GiveWeapon(getWeapon(#"hash_5f8f734c5dd02242"));
    self switchToWeapon(getWeapon(#"hash_5f8f734c5dd02242"));
    self iPrintLnBold("SerketKiss ^2Given");
}
GiveRayGunIIX()
{
    self GiveWeapon(getWeapon(#"hash_132b1b9ca78dc1fb"));
    self switchToWeapon(getWeapon(#"hash_132b1b9ca78dc1fb"));
    self iPrintLnBold("Ray Gun II-X ^2Given");
}
GiveWunderwaffeDGFunkenschutze()
{
    self GiveWeapon(getWeapon(#"hash_39826c972a454fb9"));
    self switchToWeapon(getWeapon(#"hash_39826c972a454fb9"));
    self iPrintLnBold("Wunderwaffe DG-Funkenschutze ^2Given");
}
GiveChaosTheory()
{
    self GiveWeapon(getWeapon(#"hash_138f012bb30beb55"));
    self switchToWeapon(getWeapon(#"hash_138f012bb30beb55"));
    self iPrintLnBold("Chaos Theory ^2Given");
}
GiveAlistairsAnnihilator()
{
    self GiveWeapon(getWeapon(#"hash_138f002bb30be9a2"));
    self switchToWeapon(getWeapon(#"hash_138f002bb30be9a2"));
    self iPrintLnBold("Alistairs Annihilator ^2Given");
}

GiveRiotShield()
{
    self GiveWeapon(getWeapon(#"hash_603fdd2e4ae5b2b0"));//Hash is Riot Shield, Tag Der Toten
    self iPrintLnBold("^2Event - ^3 Riot Shield Given ");
}
GetWeaponDisplayName()
{
    WeaponName = self GetCurrentWeapon().DisplayName;
    self iPrintLnBold(WeaponName);
}
GetWeaponHash()
{
    Weap = self GetCurrentWeapon().Name;
    wait .1;
    self iPrintLnBold("Weapon Hash: "+Weap);
}

CheckFlags() // useful for checking when flags get set
{
    /#
    level flag::init(#"hash_493de5832f801947");
    level flag::init(#"boss_fight_started");
    level flag::init(#"hash_f4dfa99c5e22bc6");
    level flag::init(#"hash_67757a8cb27cb8aa");
    level flag::init(#"hash_eed1544f10c5bb3");
    level flag::init(#"hash_5f2b9a36a2c517af");
    level flag::init(#"hash_25d8c88ff3f91ee5");
    level flag::init(#"hash_480ab8b0d38942cc");
    #/

    switch(BO4GetMap())
    {
        case "Dead":
        Flag1Set = false;
        Flag2Set = false;
        Flag3Set = false;
        Flag4Set = false;
        Flag5Set = false;
        Flag6Set = false;
        Flag7Set = false;
        while(true)
        {
            if (level flag::get(#"hash_493de5832f801947") && !Flag1Set)
            {
                iPrintLnBold("Flag hash_493de5832f801947 Has been Set! ");
                Flag1Set = true;
            }
            if (level flag::get(#"hash_f4dfa99c5e22bc6") && !Flag2Set)
            {
                iPrintLnBold("Flag hash_f4dfa99c5e22bc6 Has been Set! ");
                Flag2Set = true;
            }
            if (level flag::get(#"hash_67757a8cb27cb8aa") && !Flag3Set)
            {
                iPrintLnBold("Flag hash_67757a8cb27cb8aa Has been Set! ");
                Flag3Set = true;
            }
            if (level flag::get(#"hash_eed1544f10c5bb3") && !Flag4Set)
            {
                iPrintLnBold("Flag hash_eed1544f10c5bb3 Has been Set! ");
                Flag4Set = true;
            }
            if (level flag::get(#"hash_5f2b9a36a2c517af") && !Flag5Set)
            {
                iPrintLnBold("Flag hash_5f2b9a36a2c517af Has been Set! ");
                Flag5Set = true;
            }
            if (level flag::get(#"hash_25d8c88ff3f91ee5") && !Flag6Set)
            {
                iPrintLnBold("Flag hash_25d8c88ff3f91ee5 Has been Set! ");
                Flag6Set = true;
            }
            if (level flag::get(#"hash_480ab8b0d38942cc") && !Flag7Set)
            {
                iPrintLnBold("Flag hash_480ab8b0d38942cc Has been Set! ");
                Flag7Set = true;
            }
            wait 0.5;
        }

        // later
    }
}

DropWeapon()
{
    Current_Weapon = self GetCurrentWeapon();
    self DropItem(Current_Weapon);
    self iPrintLnBold("^2Event - ^3Current Weapon Dropped");
}

TakeWeapons()
{
    weapon = self getCurrentWeapon();
    self TakeAllWeapons();
    wait .5;
    self TakeWeapon(weapon);
}

TakeCurrentWeapon()
{
    weapon = self getCurrentWeapon();
    self TakeWeapon(weapon);
    wait .5;
    self TakeWeapon(weapon);
}

TakeAllPlayerWeaps(player)
{
    player takeAllWeapons();
    player iPrintLnBold("You just had your Weapons Taken!");
}

GiveSvalinnGuard()
{
   self GiveWeapon(getWeapon("zhield_frost_dw"));
   self aat::acquire(getweapon("zhield_frost_dw"), "zm_aat_frostbite");
   self zm_pap_util::repack_weapon(getweapon("zhield_frost_dw"), 4);
   self.var_5ba94c1e = 1;
   self iPrintLnBold("Svalinn Guard ^2Given"); 
}

acquireaat(id) {
    weapon = self getCurrentWeapon();
    self thread aat::acquire(weapon, id);
} 

RemoveEff(weapon)
{
    //self TakeWeapon(weapon);
    //wait 0.1;
    //self GiveWeapon(weapon);
    self thread aat::remove(weapon);
    wait .5;
    self switchToWeapon(weapon);
    self S("Removed Effect");
}

GiveMatryoskaDolls()
{
    self GiveWeapon(getWeapon(#"hash_7a42b57be462143f"));
    self switchToWeapon(getWeapon(#"hash_7a42b57be462143f"));
    self iPrintLnBold("Matryoska Dolls ^2Given");
}

bo4_CamoGiver(Camo) 
{
    Weapon = self GetCurrentWeapon();
    self TakeWeapon(Weapon);
    self GiveWeapon(Weapon, self CalcWeaponOptions(Int(Camo), 1, 1, true, true, true, true));
}

/*
######################
Powerups
######################
*/

/*
###############################
Zombies Modifications
###############################
*/

StartZombiePosistion() 
{
    self.ZombiePos = isDefined(self.ZombiePos) ? undefined : true;
    if (isDefined(self.ZombiePos))
    {
        self thread SetZombiePosition();
    } 
    else 
    {
        self notify("stop_zombiepos");
    }
}

SetZombiePosition() 
{
    self endon("stop_zombiepos");
    self endon("game_ended");
    for (;;)
    {
        foreach(zombo in GetAITeamArray(level.zombie_team)) 
        {
            zombo ForceTeleport(self.origin + (+70, 0, 0));
        }
        wait .1;
    }
    wait .1;
}

FloatingZombies()
{
    if(!isDefined(self.FloatingZombies))
    {
        self.FloatingZombies = true;
        setDvar("phys_gravity", 50);
    }
    else 
    {
        self.FloatingZombies = undefined;
        setDvar("phys_gravity", 800);
    }
}

/*
##############################################
Mystery Box Options
##############################################
*/

TpToChest()
{
    Chest = level.chests[level.chest_index];
    origin = Chest.zbarrier.origin;
    FORWARD = AnglesToForward(Chest.zbarrier.angles);
    right = AnglesToRight(Chest.zbarrier.angles);
    BAngles = VectorToAngles(right);
    BOrigin = origin - 48 * right;
    switch(randomInt(3))
    {
        case 0:
            BOrigin = BOrigin + 16 * right;
            break;
        case 1:
            BOrigin = BOrigin + 16 * FORWARD;
            break;
        case 2:
            BOrigin = BOrigin - 16 * right;
            break;
        case 3:
            BOrigin = BOrigin - 16 * FORWARD;
            break;
    }
    self SetOrigin(BOrigin);
    self SetPlayerAngles(BAngles);
}

ZombieDucks()
{
    foreach(player in level.players)
    
    Zombz=GetAiSpeciesArray("axis","all");
    for(i=0;i<Zombz.size;i++)
    {
        Zombz[i] attach(#"p8_zm_red_floatie_duck", "j_spinelower");
    }
}

BrutusSpawnBloodMenu()
{
    attempt_brutus_spawn = @zombie_brutus_util<script_7c62f55ce3a557ff.gsc>::attempt_brutus_spawn;
    if (!isdefined(attempt_brutus_spawn))
        {
            self iPrintlnBold("^1 Error! ");
            return;
        }
    //zombie_brutus_util::brutus_spawn(undefined, undefined, undefined, undefined, "zone_west_side_exterior_upper_03");
    [[ attempt_brutus_spawn ]](1, "zone_west_side_exterior_upper_03", 1);
}

ShowAllBoxes()
{
    foreach(chest in level.chests)
	{
		chest zm_magicbox::show_chest();
	}
}

BoxPrice(value)
{
    foreach(chest in level.chests) chest.zombie_cost = value;

}

BO4FreezeBox()
{
    level.chests[level.chest_index].no_fly_away = (!isDefined(level.chests[level.chest_index].no_fly_away) ? true : undefined);
}
/*
#####################################
Rank and Stat Stuffs
#####################################
*/
BO4Level55(player)
{
    player AddRankXpValue("kill", 25160000);
    player rank::updaterank();
    wait .1;
    uploadStats(player);
    player iPrintLnBold("^2In order for the rank to save, please end the game via the pause menu and not the fast end!!!");
}

PlasmaLoopplayer(player)
{
    player.PlasmaLoop = isDefined(player.PlasmaLoop) ? undefined : true;
    if(isDefined(player.PlasmaLoop))
    {
        while(isDefined(player.PlasmaLoop))
        {
            player function_e8f77739(#"zm_timeplayed", 1000000);
            wait .1;
        }
    }
}

bo4_MaxLevels(player)
{
    player endon("disconnect");
    self iPrintLnBold("^2Maxing Out Weapon Levels!");

    foreach(gun in level.zombie_weapons)
    {
        player stats::set_stat(#"hash_60e21f66eb3a1f18", gun.weapon.name, #"xp", 665535);
        player stats::set_stat(#"hash_60e21f66eb3a1f18", gun.weapon.name, #"plevel", 2);
        
        wait 0.01;
    }

    Attachments = Array(#"reflex", #"elo", #"acog", #"dualoptic", #"mms", #"holo");
    foreach(attachment in Attachments)
    {
        player stats::set_stat(#"hash_2ea32bf38705dfdc", attachment, #"kills", #"StatValue", 5000);
        player stats::set_stat(#"hash_2ea32bf38705dfdc", attachment, #"kills", #"ChallengeValue", 5000);

        wait 0.01;
    }

    wait 0.1;
    UploadStats(player);
    player iPrintlnBold("Max Weapon Ranks ^2Set");
}

bo4_UnlockAll(player)
{
    if(isDefined(player.UnlockAll))
        return;
    player.UnlockAll = true;
 
    player endon("disconnect");
 
    player iPrintlnBold("Unlock All ^2Started");
    if(player != self)
        self iPrintlnBold(player getName() + ": Unlock All ^2Started");
 
    for(a=1;a<6;a++)
    {
        if(a == 4) //statsmilestones4.csv is an empty table. So we skip it
            a++;
        
        switch(a)
        {
            case 1:
                start = 1;
                end = 292;
                break;
            case 2:
                start = 292;
                end = 548;
                break;
            case 3:
                start = 548;
                end = 589;
                break;
            case 5:
                start = 1024;
                end = 1412;
                break;
            default:
                start = 0;
                end = 0;
                break;
        }
        
        for(value=start;value<end;value++)
        {
            stat         = SpawnStruct();
            stat.value   = Int(TableLookup("gamedata/stats/zm/statsmilestones" + a + ".csv", 0, value, 2));
            stat.type    = TableLookup("gamedata/stats/zm/statsmilestones" + a + ".csv", 0, value, 3);
            stat.name    = TableLookup("gamedata/stats/zm/statsmilestones" + a + ".csv", 0, value, 4);
 
            switch(stat.type)
            {
                case "global":
                    player stats::set_stat(#"PlayerStatsList", stat.name, #"StatValue", stat.value);
                    player stats::set_stat(#"PlayerStatsList", stat.name, #"Challengevalue", stat.value);
                    break;
                case "attachment":
                    break; //Without column 13 on the tables, it's pretty useless. So we skip the attachment challenges.
                case "group":
                    groups = Array(#"weapon_pistol", #"weapon_smg", #"weapon_assault", #"weapon_lmg", #"weapon_cqb", #"weapon_sniper", #"weapon_tactical", #"weapon_launcher", #"weapon_cqb", #"weapon_knife", #"weapon_special");
                    foreach(group in groups)
                    {
                        player stats::set_stat(#"GroupStats", group, #"stats", stat.name, #"StatValue", stat.value);
                        player stats::set_stat(#"GroupStats", group, #"stats", stat.name, #"Challengevalue", stat.value);
 
                        wait 0.01;
                    }
                    break;
                default:
                    foreach(weap in level.zombie_weapons)
                        if(isDefined(weap.weapon) && zm_utility::getweaponclasszm(weap.weapon) == stat.type)
                        {
                            player AddWeaponStat(weap.weapon, stat.name, stat.value);
                            wait 0.01;
                        }
                    break;
            }
            wait 0.1;
            UploadStats(player);
        }
    }
 
    player iPrintlnBold("Unlock All Challenges ^2Done");
    if(player != self)
        self iPrintlnBold(player getName() + ": Unlock All Challenges ^2Done");
}

CompleteActiveContracts(player)
{
    foreach(index, contract in player.pers["contracts"])
    {
        contractValue = contract.target_value;
        if(isDefined(contractValue) && contractValue)
            contract.current_value = contractValue;
    }
}

Achievements(player)
{
    Achievs = array("zm_office_cold_war", "zm_office_ice", "zm_office_shock", "zm_office_power", "zm_office_strike", "zm_office_office", "zm_office_crawl", "zm_office_gas", "zm_office_pentupagon", "zm_office_everywhere", "zm_red_tragedy","zm_red_follower","zm_red_tribute","zm_red_mountains","zm_red_no_obol","zm_red_sun","zm_red_wind","zm_red_eagle","zm_red_defense","zm_red_gods", "zm_white_shard","zm_white_starting","zm_white_unlock","zm_white_mod","zm_white_trap","zm_white_pap","zm_white_knuckles","zm_white_perk","zm_white_stun","zm_white_roof","zm_trophy_doctor_is_in", "zm_trials_round_30","zm_escape_most_escape","zm_escape_patch_up","zm_escape_hot_stuff","zm_escape_hist_reenact","zm_escape_match_made","zm_escape_west_side","zm_escape_senseless","zm_escape_gat","zm_escape_throw_dog", "zm_orange_ascend","zm_orange_bells","zm_orange_freeze","zm_orange_hounds","zm_orange_totems","zm_orange_pack","zm_orange_secret","zm_orange_power","zm_orange_ziplines","zm_orange_jar","ZM_ZODT8_TRIAL_STEP_1", "ZM_MANSION_ARTIFACT","ZM_MANSION_STAKE","ZM_MANSION_BOARD","ZM_MANSION_BITE","ZM_MANSION_QUICK","ZM_MANSION_ALCHEMICAL","ZM_MANSION_CRAFTING","ZM_MANSION_SHOCKING","ZM_MANSION_CLOCK","ZM_MANSION_SHRINKING", "zm_towers_challenges","zm_towers_get_ww","zm_towers_trap_build","zm_towers_ww_kills","zm_towers_kitty_kitty","zm_towers_dismember","zm_towers_boss_kill","zm_towers_arena_survive","zm_towers_fast_pap", "ZM_ZODT8_ARTIFACT","ZM_ZODT8_STOWAWAY","ZM_ZODT8_DEEP_END","ZM_ZODT8_LITTLE_PACK","ZM_ZODT8_SHORTCUT","ZM_ZODT8_TENTACLE","ZM_ZODT8_STOKING","ZM_ZODT8_ROCK_PAPER","ZM_ZODT8_SWIMMING","zm_trophy_jack_of_all_blades", "zm_trophy_straw_purchase","zm_trophy_perkaholic_relapse","zm_trophy_gold","zm_rush_personal_score","zm_rush_team_score","zm_rush_multiplier_100","mp_trophy_special_issue_weaponry","mp_trophy_special_issue_equipment", "wz_specialist_super_fan","wz_first_win","wz_not_a_fluke","wz_blackout_historian","wz_specialist_super_fan","wz_zombie_fanatic","mp_trophy_battle_tested","mp_trophy_welcome_to_the_club","MP_SPECIALIST_MEDALS","MP_MULTI_KILL_MEDALS", "mp_trophy_vanquisher");

    foreach(Achiev in Achievs) 
    {
        player GiveAchievement(Achiev);
        player iPrintLnBold("^2" + Achiev);
        wait .5;
    }
    wait .5;
    player iPrintLnBold("^6All Achievements Unlocked");
}

BO4SetPrestigeMax()
{
    currentPrestige = self stats::get_stat("playerstatslist", "plevel", "statvalue");
    if(currentPrestige == 11){
    self stats::set_stat("playerstatslist", "plevel", "statvalue", 11);
    self stats::set_stat("playerstatslist", "paragon_rank", "statvalue", 954);
    self stats::set_stat("playerstatslist", "paragon_rankxp", "statvalue", 251600000);
    self addRankXpValue("kill", 251600000);
    self rank::updaterank();
    wait .1;
    uploadStats(self);
    self S("This should set you to master 1000");
    }
    else{
        self stats::set_stat("playerstatslist", "plevel", "statvalue", 10);
        self AddRankXpValue("kill", 25160000);
        self rank::updaterank();
        wait .1;
        uploadStats(self);
    }
}

Stats_TotalPlayed(score)
{
    self zm_stats::function_ab006044("TOTAL_GAMES_PLAYED", score);
}

Stats_HighestReached(score)
{
    self zm_stats::function_1b763e4("HIGHEST_ROUND_REACHED", score);
}

Stats_MostKills(score)
{
    self zm_stats::function_1b763e4("kills", score);
}

Stats_MostHeadshots(score)
{
    self zm_stats::function_1b763e4("MOST_HEADSHOTS", score);
}

Stats_Round(score)
{
    self zm_stats::function_ab006044("TOTAL_ROUNDS_SURVIVED", score);
    self zm_stats::function_a6efb963("TOTAL_ROUNDS_SURVIVED", score);
    self zm_stats::function_9288c79b("TOTAL_ROUNDS_SURVIVED", score);
}

Stats_Reset(score)
{
    /#
    self zm_stats::highwater_global_stat("HIGHEST_ROUND_REACHED", score);
    self zm_stats::highwater_map_stat("HIGHEST_ROUND_REACHED", score);
    self zm_stats::function_d4e0d242("HIGHEST_ROUND_REACHED", score);
    self zm_stats::function_1b763e4("HIGHEST_ROUND_REACHED", score);
    self zm_stats::function_e8bfebb("HIGHEST_ROUND_REACHED", score);
    self zm_stats::function_1b763e4("MOST_KILLS", score);
    self zm_stats::function_e8bfebb("MOST_KILLS", score);
    self zm_stats::function_1b763e4("MOST_HEADSHOTS", score);
    self zm_stats::function_e8bfebb("MOST_HEADSHOTS", score);
    self zm_stats::function_f7885b2b("HIGHEST_ROUND_REACHED", score);
    self zm_stats::function_f7885b2b("MOST_KILLS", score);
    self zm_stats::function_f7885b2b("MOST_HEADSHOTS", score);
    self zm_stats::add_global_stat("TOTAL_ROUNDS_SURVIVED", score);
    self zm_stats::add_map_stat("TOTAL_ROUNDS_SURVIVED", score);
    self zm_stats::function_ab006044("TOTAL_ROUNDS_SURVIVED", score);
    self zm_stats::function_a6efb963("TOTAL_ROUNDS_SURVIVED", score);
    self zm_stats::function_9288c79b("TOTAL_ROUNDS_SURVIVED", score);
    self zm_stats::add_global_stat("TOTAL_GAMES_PLAYED", score);
    self zm_stats::add_map_stat("TOTAL_GAMES_PLAYED", score);
    self zm_stats::function_ab006044("TOTAL_GAMES_PLAYED", score);
    self zm_stats::function_a6efb963("TOTAL_GAMES_PLAYED", score);
    self zm_stats::function_9288c79b("TOTAL_GAMES_PLAYED", score);
    #/
    self zm_stats::set_global_stat("HIGHEST_ROUND_REACHED", score);
    self zm_stats::set_map_stat("HIGHEST_ROUND_REACHED", score);
    self zm_stats::function_4d4e2a78("HIGHEST_ROUND_REACHED", score);
    self zm_stats::function_49469f35("HIGHEST_ROUND_REACHED", score);
    self zm_stats::function_7866854a("HIGHEST_ROUND_REACHED", score);
    self zm_stats::function_a05b3b23("HIGHEST_ROUND_REACHED", score);

    self gamehistoryfinishmatch(4, 0, 0, 0, 0, 0);
    if (isdefined(self.pers[#"matchesplayedstatstracked"])) 
    {
        gamemode = util::getcurrentgamemode();
        self globallogic::incrementmatchcompletionstat(gamemode, "played", "completed");
        if (isdefined(self.pers[#"matcheshostedstatstracked"])) 
        {
            self globallogic::incrementmatchcompletionstat(gamemode, "hosted", "completed");
            self.pers[#"matcheshostedstatstracked"] = undefined;
        }
        self.pers[#"matchesplayedstatstracked"] = undefined;
    }
}

/*
########################################
Host Modification Stuff
########################################
*/

ForceHostToggle()
{
    self.ForcingTheHost = isDefined(self.ForcingTheHost) ? undefined : true;
    if(isDefined(self.ForcingTheHost))
    {
    self iPrintLnBold("Force Host ^2ON");
    if(getDvarString("party_connectTimeout") != "0")
    {
        SetDvar("lobbySearchListenCountries", "0,103,6,5,8,13,16,23,25,32,34,24,37,42,44,50,71,74,76,75,82,84,88,31,90,18,35");
        SetDvar("excellentPing", 3);
        SetDvar("goodPing", 4);
        SetDvar("terriblePing", 5);
        SetDvar("migration_forceHost", 1);
        SetDvar("migration_minclientcount", 12);
        SetDvar("party_connectToOthers", 0);
        SetDvar("party_dedicatedOnly", 0);
        SetDvar("party_dedicatedMergeMinPlayers", 12);
        SetDvar("party_forceMigrateAfterRound", 0);
        SetDvar("party_forceMigrateOnMatchStartRegression", 0);
        SetDvar("party_joinInProgressAllowed", 1);
        SetDvar("allowAllNAT", 1);
        SetDvar("party_keepPartyAliveWhileMatchmaking", 1);
        SetDvar("party_mergingEnabled", 0);
        SetDvar("party_neverJoinRecent", 1);
        SetDvar("party_readyPercentRequired", .25);
        SetDvar("partyMigrate_disabled", 1);
        }
    } 
    else 
    {
        self iPrintLnBold("Force Host ^1OFF");
        SetDvar("lobbySearchListenCountries", "");
        SetDvar("excellentPing", 30);
        SetDvar("goodPing", 100);
        SetDvar("terriblePing", 500);
        SetDvar("migration_forceHost", 0);
        SetDvar("migration_minclientcount", 2);
        SetDvar("party_connectToOthers", 1);
        SetDvar("party_dedicatedOnly", 0);
        SetDvar("party_dedicatedMergeMinPlayers", 2);
        SetDvar("party_forceMigrateAfterRound", 0);
        SetDvar("party_forceMigrateOnMatchStartRegression", 0);
        SetDvar("party_joinInProgressAllowed", 1);
        SetDvar("allowAllNAT", 1);
        SetDvar("party_keepPartyAliveWhileMatchmaking", 1);
        SetDvar("party_mergingEnabled", 1);
        SetDvar("party_neverJoinRecent", 0);
        SetDvar("partyMigrate_disabled", 0);
    }
}

BO4NoFallDam()
{
    level.BO4NoFallD = isDefined(level.BO4NoFallD) ? undefined : true;
    if(isDefined(self.BO4NoFallD))
    {
        SetDvar("bg_fallDamageMinHeight", 9999);
        SetDvar("bg_fallDamageMaxHeight", 9999);
    }
    else
    {
        setdvar("bg_falldamageminheight", 256);
		setdvar("bg_falldamagemaxheight", 512);
    }
}

AllSuperJump()
{
    self endon("disconnect");
    while(isDefined(level.SuperJump))
    {
        if(self JumpButtonPressed())
        {
            for(i=0;i<5;i++)
                self SetVelocity(self GetVelocity() + (0, 0, 140));

            while(!self IsOnGround())
                wait .05;
        }
        wait .05; 
    }
}

SuperSpeed()
{
    level.SuperSpeed = isDefined(level.SuperSpeed) ? undefined : true;

    if(isDefined(level.SuperSpeed))
        setDvar("g_speed", 500);
    else
        setDvar("g_speed", 200);
}

RushmodeDisable()
{
    self endon("disconnect");
    while(isDefined(level.SuperJump))
    {
        if(self JumpButtonPressed())
        {
            for(i=0;i<5;i++)
                self SetVelocity(self GetVelocity() + (0, 0, 140));
                self iPrintlnBold("^1R^2u^3s^4h^5 M^6o^7d^8e^9");

            while(!self IsOnGround())
            self iPrintlnBold("^1R^2u^3s^4h^5 M^6o^7d^8e^9");
                wait .05;
        }
        wait .05; 
    }
}


AntiJoin()
{
    level.AntiJoin = isDefined(level.AntiJoin) ? undefined : true;
}

PlayEESong()
{
    level thread zm_audio::sndmusicsystem_stopandflush();
	waitframe(1);
	level thread zm_audio::sndmusicsystem_playstate("ee_song");
}

AntiQuit(player) 
{

    self.AntiQuit = isDefined(self.AntiQuit) ? undefined : true;
    if(isDefined(self.AntiQuit))
    {
        SetMatchFlag("disableIngameMenu", 1);
        self iPrintLnBold("Anti Quit ^2Enabled");
        foreach(player in level.players) 
        {
            player CloseInGameMenu();
        }
    } 
    else 
    {
        SetMatchFlag("disableIngameMenu", 0);
        self iPrintLnBold("Anti Quit ^1Disabled");
    }
}

RestartMap()
{
    map_restart(0);
}

StringSliderTest(string)
{
    self iPrintlnBold(string);
}

IntSliderTest(int)
{
    self iPrintlnBold(int);
}

bo4_GivePerk(Perk_Name, string) 
{
    self zm_perks::vending_trigger_post_think(self, Perk_Name);
    self iPrintLnBold(Perk_Name + " ^2Given!");
}

KillPlayer(player)
{
    player notify("player_suicide");
    player zm_laststand::bleed_out();
    self iPrintLnBold("Killed "+player.name);
    player iPrintLnBold("You Just got murdered By: "+self.name);
}

sendToJail(player)
{
    if(!isDefined(level.JailCoords))
        self S("Jail Coords are Not Defined for the Map");
    
    player setOrigin(level.JailCoords);
    player S("You were sent to JAIL!");
}

PlayerMessage(val, player)
{
    foreach(client in level.players)
    {
        if(val == 0){ client S(player.name+" Has a Mod Menu!");}
        else if(val == 1){ client S(player.name+" Is Cheating!!");}
        else if(val == 2){ client S(player.name+" is a Hacking Bitch!");}
        else if(val == 3){ client S(player.name+" Is a terrible Zombies Player!");}
        else if(val == 4){ client S(player.name+" Has a Tiny Pee Pee");}
    }
}

PlasmaLoop()
{
    self.PlasmaLoop2 = isDefined(self.PlasmaLoop2) ? undefined : true;
    if(!isDefined(self.PlasmaGiven)) self.PlasmaGiven = 0;
    if(isDefined(self.PlasmaLoop2)){
        while(isDefined(self.PlasmaLoop2))
        {
            self function_e8f77739(#"zm_timeplayed", 1000000);
            self.PlasmaGiven += 1000000;
            self iPrintLnBold("You Just Got 100k Plasma. Total: "+self.PlasmaGiven);
            wait 1;
        }
    }
}

MoveMenuX(X)
{
    // title
    ShieldHudElemSetX("menu_title_1", X);

    // line
    for (i = 0; i < 32; i++) ShieldHudElemSetX("menu_lineX_1_" + i, X + i * 10 - 15);
    for (i = 0; i < 32; i++) ShieldHudElemSetX("menu_lineX_2_" + i, X + i * 10 - 15);
    for (i = 0; i < 37; i++) ShieldHudElemSetX(#"menu_lineY_1_" + i, X - 17);
    for (i = 0; i < 37; i++) ShieldHudElemSetX(#"menu_lineY_2_" + i, X + 303); // move to right

    // verify
    ShieldHudElemSetX("menu_verify", X);

    // str
    for (i = 0; i < 21; i++)
    {
        ShieldHudElemSetX(#"menu_str_2_" + i, X);
    }
}

MoveMenuY(Y)
{
    // title
    ShieldHudElemSetY("menu_title_1", 120 + Y);

    // line
    for (i = 0; i < 32; i++) ShieldHudElemSetY("menu_lineX_1_" + i, 85 + Y);
    for (i = 0; i < 32; i++) ShieldHudElemSetY("menu_lineX_2_" + i, 825 + Y);
    for (i = 0; i < 37; i++) ShieldHudElemSetY(#"menu_lineY_1_" + i, 105 + i * 20 + Y);
    for (i = 0; i < 37; i++) ShieldHudElemSetY(#"menu_lineY_2_" + i, 105 + i * 20 + Y);

    // verify
    ShieldHudElemSetY("menu_verify", 800 + Y);

    // str
    for (i = 0; i < 21; i++)
    {
        ShieldHudElemSetY(#"menu_str_2_" + i, 160 + Y + i * 30);
    }
}

ScaleMenu(Scal)
{
    switch(Scal) // lucy cant return float values under 0 for some reason?????
    {
        case 1:
        Scale = 0.35;
        break;

        case 2:
        Scale = 0.5;
        break;

        case 3:
        Scale = 0.7;
        break;

        case 4:
        Scale = 0.8;
        break;

        case 5:
        Scale = 1;
        break;

        case 6:
        Scale = 1.3;
        break;

        default:
        return;
        break;
    }

    // title
    ShieldHudElemSetScale("menu_title_1", Scale);

    // line
    for (i = 0; i < 32; i++) ShieldHudElemSetScale("menu_lineX_1_" + i, Scale);
    for (i = 0; i < 32; i++) ShieldHudElemSetScale("menu_lineX_2_" + i, Scale);

    for (i = 0; i < 37; i++) ShieldHudElemSetScale(#"menu_lineY_1_" + i, Scale);
    for (i = 0; i < 37; i++) ShieldHudElemSetScale(#"menu_lineY_2_" + i, Scale);

    // verify
    ShieldHudElemSetScale("menu_verify", Scale);

    // str
    for (i = 0; i < 21; i++)
    {
        ShieldHudElemSetScale(#"menu_str_2_" + i, Scale);
    } 

    //iPrintLnBold(Scale);
}

MenuColorSets(Val)
{
    switch(Val)
    {
        case 1:
        level.VerifyColor = "^1";
        level.LineColor = "^4";
        level.TitleBColor = "^3";
        level.TitleColor = "^8";
        level.SelectedSTRColor = "^6";
        level.STRSColor = "^5";
        break;

        case 2:
        level.VerifyColor = "^7";
        level.LineColor = "^5";
        level.TitleBColor = "^9";
        level.TitleColor = "^3";
        level.SelectedSTRColor = "^1";
        level.STRSColor = "^4";
        break;

        case 3:
        level.VerifyColor = "^4";
        level.LineColor = "^1";
        level.TitleBColor = "^8";
        level.TitleColor = "^7";
        level.SelectedSTRColor = "^5";
        level.STRSColor = "^7";
        break;

        case 4:
        level.VerifyColor = "^9";
        level.LineColor = "^8";
        level.TitleBColor = "^6";
        level.TitleColor = "^3";
        level.SelectedSTRColor = "^4";
        level.STRSColor = "^2";
        break;
    }
}

RGBMenu()
{
    // ShieldHudElemSetColor(id, color_vec) |  ShieldHudElemSetColor(id, color_rgba) |  ShieldHudElemSetColor(id, r, g, b)

    self.RGBMenu = isDefined(self.RGBMenu) ? undefined : true;

    if(isDefined(self.RGBMenu))
    {
        self endon("disconnect");
        while(isDefined(self.RGBMenu)) 
        {
            level.VerifyColor = "^" + randomIntRange(0, 10);
            level.LineColor = "^" + randomIntRange(0, 10);
            level.TitleBColor = "^" + randomIntRange(0, 10);
            level.TitleColor = "^" + randomIntRange(0, 10);
            level.SelectedSTRColor = "^" + randomIntRange(0, 10);
            level.STRSColor = "^" + randomIntRange(0, 10);
            wait 0.3;
            //iPrintLnBold("test rb");
        }
    }
    else
    {
        wait 0.35;
        level.VerifyColor = "^9";
        level.LineColor = "^8";
        level.TitleBColor = "^6";
        level.TitleColor = "^3";
        level.SelectedSTRColor = "^4";
        level.STRSColor = "^2";
    }
}

ZombieSembolz() //does something? 
{
    for (;;)
    {
        wait 30;             
        Zombz1=GetAISpeciesArray(level.zombie_team, "zombie");
        self.sinkhole_charges_detonatedteleportterminate = 1;
                
        for(i=0;i<Zombz1.size;i++)
        {
                Zombz1[i] SetScale(0.1);
        }
        self iPrintlnBold("^2 Event - ^9 Zombie Scale Test!! "); // event6
    }
    wait 30;
}

ModelSpawnTest1()
{
    Jugg = util::spawn_model("bs_bdy_mdl", self.origin + (1, 1, 0));
    wait 2;
    Jugg SetScale(1);
}


test()
{
    self iPrintLnBold("Test");
}

TeleTo(arg, player)
{
    switch(arg)
    {
        case 0: self setOrigin(player.origin + (+30,0,0)); break;
        case 1: player setOrigin(self.origin+(+30,0,0)); break;
    }
}

ClientFuncs(args, val1)
{
    foreach(player in level.players)
    {
        switch(args)
        {
            case 0: player thread Godmode(); break;
            case 1: player thread UnlimitedAmmo(); break;
            case 2: player thread zm_score::add_to_player_score(40000000); break;
            case 3: player thread GiveAllPerks(); break;
        }
    }
}

ClientHandler(func, player)
{
    player endon("disconnect");
    level endon("game_ended");
    switch(func)
    {
        case 0: player thread Godmode(); break;
        case 1: player thread UnlimitedAmmo(); break;
        case 2: player thread BO4Level55(player); break;
        case 3: player thread PlasmaLoop(); break;
        case 4: player thread GiveAllPerks(); break;
        case 5: player thread GetSelfRes(); break;
        case 6: player thread BO4_UnlockAll(player); break;
        case 7: player thread BO4_MaxLevels(player); break;
        case 8: player thread zm_score::add_to_player_score(40000000); break;
        case 9: player thread zm_score::minus_to_player_score(40000000); break;
    }
}

S(Message)
{
    self iPrintLnBold(Message);
}

SetSelfRevives(count)
{
    foreach(player in level.players){
        player zm_laststand::function_3d685b5f(count);
    }
}

DownPlayer(player)
{
    player disableInvulnerability();
    player doDamage(player.health + 1, player.origin);
    self iPrintLnBold("Player ^1Downed");
    player iPrintLnBold("You Were Downed by "+self.name);
}

//Starting Gun Game//

GameModeHandler(gameModeSelected)
{
    if(!isDefined(level.GameModeSelected)){
        if(!isDefined(gameModeSelected))
        {
            self S("How the FUCK are you here?");
        }
        else if(gameModeSelected == "Gun Game")
        {
            self thread doGunGame();
            level.GameModeSelected=true;
        }else if(gameModeSelected == "All The Weapons")
        {
            self thread doAllWeaponsZM();
            level.GameModeSelected=true;
        }
    }
}

doGunGame()//Haha, thats kinda funny Criptic, Guess what I did here, before you :D
{
        self thread KillAllZombies();
        self thread RoundEdit(15);
        foreach(player in level.players)
    {
        player thread CloseMenu1();
        player thread GunGame();
        player iPrintlnBold("^1G^7un ^1G^7ame");
        wait 2;
        player iPrintlnBold("^1H^7ave ^1F^7un !");
    }
}
GunGame()
{
        foreach(player in level.players)
        self endon("death");
        self endon("disconnect");
        wait 5;
        keys=GetArrayKeys(level.zombie_weapons);
        weaps = array::randomize(keys);
        self TakeAllWeapons();
        self GiveWeapon(weaps[0]);
        self SwitchToWeapon(weaps[0]);
        player iPrintlnBold("^1Random ^4 Weapon!");
}

DoAllWeaponsZM()
{
    self thread KillAllZombies();
    self thread RoundEdit(25);
    foreach(player in level.players)
    {
        player thread CloseMenu1();
        player thread AllWeaponsStart();
        player iPrintLnBold("^1All ^2The ^3Weapons");
        wait 2;
        player iPrintLnBold("^5Weapons will Rotate every ^645 ^3Seconds!");
    }
}

AllWeaponsStart()
{
    self endon("death");
    self endon("disconnect");
    wait 3;
    WeapKeys = GetArrayKeys(level.zombie_weapons_upgraded);
    PapWeaps = array::randomize(WeapKeys);
    self TakeAllWeapons();
    for(;;){
        i = randomIntRange(0, PapWeaps.size - 1);
        self GiveWeapon(PapWeaps[i]);
        self SwitchToWeapon(PapWeaps[i]);
        self iPrintLnBold("^1Awarded New Weapon");
        wait 45;
    }
}
