// Rush Functions here
FakeError() // racky goat / breakfast fake error lol
{
    //Fake = getent("bs_somethingnotthere", "targetname");
    //Fake SetScale(50);

    level.ErrorCheck = !level.ErrorCheck;

    if(level.ErrorCheck) // switch between because of lua errors changes
     thread CustomErrorMessage("get scammed");
    else
     thread CustomErrorMessage("REAL ERROR!!!");
}

PSpeedB()
{
    self endon("disconnect");
    
    self.PSpeed = isDefined(self.PSpeed) ? undefined : true;
    if(isDefined(self.PSpeed))
        self SetMoveSpeedScale(0);
    else
        self SetMoveSpeedScale(1);
}

MagicBullets() // thanks to lucy menu!!
{
    self endon("disconnect");
    
    self.MagicBullets = isDefined(self.MagicBullets) ? undefined : true;
    if(isDefined(self.MagicBullets))
    {
        self.bulletEffectType = "launcher_standard_t8_upgraded";
        self S("^2 Event - ^3 Rocket Gun! ");
        while(isDefined(self.MagicBullets))
        {
            self waittill(#"weapon_fired");
            MagicBullet(getWeapon(self.bulletEffectType), self getPlayerCameraPos(), BulletTrace(self getPlayerCameraPos(), self getPlayerCameraPos() + anglesToForward(self getPlayerAngles())  * 100000, false, self)["position"], self);
            wait 0.001;
        }
    }
}

MagicModels()
{
    self endon("disconnect");

    self.MagicModels = isDefined(self.MagicModels) ? undefined : true;
    if(isDefined(self.MagicModels))
    {
        self S("^2 Event - ^3 Models Gun! ");
        while(isDefined(self.MagicModels))
        {
            self waittill(#"weapon_fired");

            random = randomIntRange(0, 7);
            switch(random)
            {
                case 0:
                randomM = "p8_zm_red_floatie_duck";
                break;

                case 1:
                randomM = "p7_zm_vending_widows_wine";
                break;

                case 2:
                randomM = "p7_zm_vending_packapunch";        
                break;

                case 3:
                randomM = "p7_zm_vending_revive";        
                break;
            
                case 4:
                randomM = "zombie_pickup_perk_bottle";      
                break;

                case 5:
                randomM = "p7_zm_vending_marathon";         
                break;

                case 6:
                randomM = "p7_zm_vending_three_gun";       
                break;
            }

            bullet_trace = get_look_trace();
            bullet_hit = bullet_trace["position"];
            Duckie = util::spawn_model(randomM, bullet_hit + (0, 0, 25), vectortoangles(bullet_trace[#"normal"]));
            Duckie playsound("zmb_vocals_zombie_death_quack");
            Duckie physicslaunch(self.origin, vectorscale((0, 0, RandomFloatRange(0.05, 0.20)), 64));
            Duckie thread DeleteSecondsFast();
            wait 0.001;
        }
    }
}

get_look_trace() 
{
    tag_origin = self geteye();
    look = AnglesToForward(self GetPlayerAngles());
    return bullettrace(tag_origin, tag_origin + vectorscale(look, 10000), 1, self);
}

changeBulletType(val)
{
    if(isDefined(self.bulletEffectType))
    {
        switch(val)
        {
            case 0: self.bulletEffectType=  "minigun"; break;
            case 1: self.bulletEffectType = "special_ballisticknife_t8_dw_upgraded"; break;
            case 2: self.bulletEffectType = "launcher_standard_t8_upgraded"; break;
            case 3: self.bulletEffectType = "ray_gun"; break;
        }
    }
    else
    {

    }
}

TeleportZombies() 
{
    foreach(zombie in getaiarchetypearray(#"zombie")) 
    {
        if (isDefined(zombie)) zombie ForceTeleport(self.origin + (+40, 0, 0));
    }
}

ZombiesSpeedy()
{
    level endon(#"StopSpeedZombies");

    a_ai_zombies = getaiteamarray(level.zombie_team);
    foreach (ai in a_ai_zombies) 
    {
        if (!isalive(ai) || isdefined(ai.var_cda2fa8) && ai.var_cda2fa8) 
        {
            continue;
        }
        if (isdefined(ai.ignore_nuke) && ai.ignore_nuke) 
        {
            continue;
        }
        if (isdefined(ai.marked_for_death) && ai.marked_for_death) 
        {
            continue;
        }
        e_player = arraygetclosest(ai.origin, getplayers());
        if (isplayer(e_player) && distance(ai.origin, e_player.origin) > 100) 
        {
            ai thread SpeedUp(randomfloatrange(1.5, 1.9), e_player);
        } 
        else if (math::cointoss(20)) 
        {
            ai thread SpeedUp(randomfloatrange(1.5, 1.9), e_player);
        }
    }
}

SpeedUp(var_b7358df3, e_player, n_timeout = 1)
{
    self endon(#"death");
    self.var_cda2fa8 = 1;
    if (!(isdefined(self.completed_emerging_into_playable_area) && self.completed_emerging_into_playable_area) && self.archetype !== #"zombie_dog") 
    {
        self waittill(#"completed_emerging_into_playable_area");
    }
    if (self.archetype == #"ghost")
    {
        self.var_cda2fa8 = 0;
    }
    if(self.var_cda2fa8) // if not ghost or something
    {
        n_delay_time = randomfloatrange(1, 2); // 3 5
        wait(n_delay_time);
        self thread namespace_9ff9f642::slowdown(#"zm_trial_zombie_speed_changes", var_b7358df3);
        self playsound(#"hash_46661e1d0062f53b");
        if (math::cointoss(20)) 
        {
            if (isdefined(e_player) && isalive(e_player)) 
            {
                if (e_player islookingat(self)) 
                {
                    self playsoundtoplayer(#"hash_69671b54d86128ce", e_player);
                }
            }
        }
        n_timer = 0;
        while (n_timer < n_timeout) 
        {
            if (isalive(e_player) && distance(e_player.origin, self.origin) < 100) 
            {
                break;
            }
            n_timer = n_timer + float(function_60d95f53()) / 1000;
            waitframe(1);
        }

        self.var_cda2fa8 = undefined;
    }
}

B4Gravity()
{
    level.B4Gravity = isDefined(level.B4Gravity) ? undefined : true;
    if(isDefined(level.B4Gravity))
        SetDvar("bg_gravity", 100);
    else
        SetDvar("bg_gravity", 850);
}

Moon_Gravity()
{
    if( !isdefined( self.moon_gravity ) )
    {
        self.moon_gravity = true;
        self setplayergravity(4000);
    }
    else 
    {
        self.moon_gravity = undefined;
        self clearplayergravity();
    }
}

GivePowerup(Powerup)
{
    self zm_powerups::specific_powerup_drop(Powerup, self.origin, undefined, undefined, undefined, 1);
}

PlayerTakeScore(value, player)
{
    player zm_score::minus_to_player_score(value);
}

NoTarget_Rush() // REMOVED
{
    self.NoTargR = isDefined(self.NoTargR) ? undefined : true;
    if (isDefined(self.NoTargR))
        self.ignoreme=true;
    else
        self.ignoreme=false;
}

GiveInstantElixir(name) //Works for Instant Elixirs
{
    self thread bgb::function_b7ba7d51(name);//Actually gives instant use elixir like Perkaholic etc, Doesnt work for timed Elixirs.
    self thread bgb::give(name);//gives popup for the Elixir on screen, should work for all
}

GiveTimedElixir(name)//Works for Timed Elixirs
{
    self thread bgb::function_62f40b0d(name);//Gives Timed Elixir, Doesnt work for Single Use Elixirs.
    self thread bgb::give(name);//Just for elixir popup
}

GiveTimedAA(name)//Works for Timed Elixirs
{
    self thread bgb::function_62f40b0d(name);//Gives Timed Elixir, Doesnt work for Single Use Elixirs.
    self thread bgb::give(name); // for quack stuff!
}

ModelWidowSpawn()
{
        Widds = util::spawn_model("p7_zm_vending_widows_wine", self.origin + (1, 1, 0));
        wait .1;
        Widds NotSolid();
}

GetSelfRes()//Credit TheUnknownCod3r / MrFawkes1337
{
    self zm_laststand::function_3a00302e();//Awards One Self Revive at a time.
    self S("^2 Event - ^7 1x Self Revive! ");
}

PSpeedA()
{
    self endon("disconnect");
    
    self.PSpeed = isDefined(self.PSpeed) ? undefined : true;
    if(isDefined(self.PSpeed))
        self SetMoveSpeedScale(0.5);
    else
        self SetMoveSpeedScale(1);
}

Clone()
{
    self util::spawn_player_clone(self);
}

HeadLess()
{
    Zh=GetAiSpeciesArray("axis","zombie");
    for(i=0;i<Zh.size;i++)
    {
        Zh[i] DetachAll();
    }
    self iPrintlnBold("^2 Event - ^9 Headless Zombies! "); // event
} 

randomelixir()
{
	self endon("disconnect");
	
	elixir=[];
	elixir[0]="zm_bgb_stock_option";
	elixir[1]="zm_bgb_arsenal_accelerator";
	elixir[2]="zm_bgb_now_you_see_me";
	elixir[3]="zm_bgb_dividend_yield";
	elixir[4]="zm_bgb_secret_shopper";
	elixir[5]="zm_bgb_undead_man_walking";
	elixir[6]="zm_bgb_pop_shocks";
	elixir[7]="zm_bgb_anti_entrapment";
	//elixir[8]="zm_bgb_quacknarok";
	elixir[8]="zm_bgb_head_scan";
	elixir[9]="zm_bgb_sword_flay";
	elixir[10]="zm_bgb_talkin_bout_regeneration";
	//elixir[12]="zm_bgb_blood_debt";
	elixir[11]="zm_bgb_wall_power";
	elixir[12]="zm_bgb_free_fire";
	while(true)
	{
		GiveTimedElixir(""+elixir[randomint(elixir.size)]);
        break;
	}
}

ModelSpawnIX()
{
    Nidd = util::spawn_model(#"hash_571dce3dbd970ee6", self.origin + (1, 1, 0));
    wait .1;
    Nidd SetScale(10);

    Nidd2 = util::spawn_model(#"p8_zm_power_door_symbol_01", self.origin + (1, 1, 0));
    wait .1;
    Nidd2 SetScale(50);
}

ModelSpawnVoyage()
{
    Nidd1 = util::spawn_model(#"p8_zm_power_door_symbol_01", self.origin + (1, 1, 0), (0, 0, 90));
    wait .1;
    Nidd1 SetScale(50);
    RandomModel = randomIntRange(0, 8);
    switch (RandomModel)
        {
    case 0:
        str_model = #"p8_zm_zod_planets_mercury_large";
        break;
    case 1:
        str_model = #"p8_zm_zod_planets_venus_large";
        break;
    case 2:
        str_model = #"p8_zm_zod_planets_mars_large";
        break;
    case 3:
        str_model = #"p8_zm_zod_planets_jupiter_large";
        break;
    case 4:
        str_model = #"p8_zm_zod_planets_saturn_large";
        break;
    case 5:
        str_model = #"p8_zm_zod_planets_uranus_large";
        break;
    case 6:
        str_model = #"p8_zm_zod_planets_neptune_large";
        break;
    case 7:
        str_model = #"p8_zm_zod_planets_sun_large";
        break;
    }
    
    Nidd11 = util::spawn_model(str_model, self.origin + (1, 1, 0));
    wait .1;
    Nidd11 SetScale(0.1);
}

HideGun() 
{
    self.HideWeapon = isDefined(self.HideWeapon) ? undefined : true;
    if (isDefined(self.HideWeapon))
    {
        setDvar("cg_drawGun", 0);
    } 
    else 
    {
        setDvar("cg_drawGun", 1);
    }
}

exo_suit() 
{
    self endon(#"death");

    self.sprint_boost = 0;
	self.jump_boost = 0;
    self.slam_boost = 0;
	while(1)
	{
		if( !self IsOnGround() )
		{
			if(self JumpButtonPressed() || self SprintButtonPressed() || self StanceButtonPressed())
			{
				waitframe(1);
				continue;
			}
			self.sprint_boost = 0;
			self.jump_boost = 0;
            self.slam_boost = 0;
			while( !self IsOnGround() )
			{
				if( self JumpButtonPressed() && self.jump_boost < 1 )
				{
					self.is_flying_jetpack = true;
					self.jump_boost++;
					angles = self getplayerangles();
					angles = (0,angles[1],0);
					
					self.loop_value = 1;
					
					if( IsDefined(self.loop_value))
					{
						Earthquake( 0.22, .9, self.origin, 850 );
						direction = AnglesToUp(angles) * 400;
						self thread land();
						for(l = 0; l < self.loop_value; l++)
						{
							self SetVelocity( (self GetVelocity()[0], self GetVelocity()[1], 0) + direction );
							wait .1;
						}
					}
				}
				if( self SprintButtonPressed() && self.sprint_boost < 1 )
				{
					self.is_flying_jetpack = true;
					self.sprint_boost++;
					xvelo = self GetVelocity()[0];
                    yvelo = self GetVelocity()[1];
                    l = Length((xvelo, yvelo, 0));
                    if(l < 10)
                        continue;
                    if(l < 190)
                    {
                        xvelo = int(xvelo * 190/l);
                        yvelo = int(yvelo * 190/l);
                    }
					
					self.loop_value = 1;
					
					if( IsDefined(self.loop_value))
					{
						Earthquake( 0.22, .9, self.origin, 850 );
						if(self.jump_boost == 1)
							boostAmount = 1.75;
						else
							boostAmount = 2.25;
						self thread land();
						self SetVelocity( (xvelo * boostAmount, yvelo * boostAmount, self GetVelocity()[2]) );
					}
					while( !self isOnGround() )
						waitframe(1);
				}
                if( self StanceButtonPressed() && self.jump_boost > 0 && self.slam_boost < 1)
                {
                    self.slam_boost++;
                    self SetVelocity((self GetVelocity()[0], self GetVelocity()[1], -200));
                    self thread land();
                }
			    waitframe(1);
			}
            if(self.slam_boost > 0)
            {
                radiusdamage( self.origin, 200, 3000, 500, self, "MOD_GRENADE_SPLASH" );
                self playsound( #"wpn_grenade_explode" );
	            self clientfield::increment("" + #"hash_7b8ad0ed3ef67813");
            }
		}
	    waitframe(1);
	}
}

land() // ^^
{
	while( !self IsOnGround() )
		waitframe(1);
	self.is_flying_jetpack = false;
}

SuperJump()
{
    level.SuperJump = isDefined(level.SuperJump) ? undefined : true;
    if(isDefined(level.SuperJump))
    {
        foreach(player in level.players)
            player thread AllSuperJump();
    }
}

thirdperson()
{
    self.thirdperson = isDefined(self.thirdperson) ? undefined : true;
    if (isDefined(self.thirdperson))
        self setclientthirdperson(1);
    else
        self setclientthirdperson(0);
}

InvisibleZombies(player) // taken from nuke, but changed it a little
{
    zombies = getaiarchetypearray(#"zombie");
    for (i = 0; i < zombies.size; i++) 
    {
        if (isdefined(zombies[i].ignore_nuke) && zombies[i].ignore_nuke) 
        {
            continue;
        }
        if (isdefined(zombies[i].marked_for_death) && zombies[i].marked_for_death) 
        {
            continue;
        }
        else 
        {
            if (zm_utility::is_magic_bullet_shield_enabled(zombies[i])) 
            {
                continue;
            }
            if(isDefined(zombies[i]) && IsAlive(zombies[i]))
            {
                    zombies[i].visible = 0;
                    zombies[i] SetInvisibleToAll();
            }
        }
    }
}

VisibleZombies(player) // taken from nuke, but changed it a little
{
    zombies = getaiarchetypearray(#"zombie");
    for (i = 0; i < zombies.size; i++) 
    {
        if (isdefined(zombies[i].ignore_nuke) && zombies[i].ignore_nuke) 
        {
            continue;
        }
        if (isdefined(zombies[i].marked_for_death) && zombies[i].marked_for_death) 
        {
            continue;
        }
        else 
        {
            if (zm_utility::is_magic_bullet_shield_enabled(zombies[i])) 
            {
                continue;
            }
            if(isDefined(zombies[i]) && IsAlive(zombies[i]))
            {
                    zombies[i].visible = 1;
                    zombies[i] SetVisibleToAll();
            }
        }
    }
}