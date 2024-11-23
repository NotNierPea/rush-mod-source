RegisterPowerups()
{
    // custom powerups
    zm_powerups::register_powerup("custom_duck_power", &CustomDuckPowerUp);
    zm_powerups::add_zombie_powerup("custom_duck_power", "p7_zm_power_up_insta_kill", #"hash_69256172c78db147", &func_should_drop_custom, 1, 0, 0);

    zm_powerups::register_powerup("custom_widowz_power", &CustomWidowzPowerUp);
    zm_powerups::add_zombie_powerup("custom_widowz_power", "p7_zm_teddybear", #"hash_69256172c78db147", &func_should_drop_custom, 0, 0, 0);

    zm_powerups::register_powerup("custom_bottle_power", &CustomBottlePowerUp);
    zm_powerups::add_zombie_powerup("custom_bottle_power", "zombie_pickup_perk_bottle", #"hash_69256172c78db147", &func_should_drop_custom, 1, 0, 0);

    zm_powerups::register_powerup("custom_PaP_power", &CustomPaPPowerUp);
    zm_powerups::add_zombie_powerup("custom_PaP_power", "zombie_pickup_minigun", #"hash_69256172c78db147", &func_should_drop_custom, 1, 0, 0);

    zm_powerups::register_powerup("custom_ref_power", &CustomRefPower);
    zm_powerups::add_zombie_powerup("custom_ref_power", "p8_zm_red_floatie_duck", #"hash_69256172c78db147", &func_should_drop_custom, 0, 0, 0);

    zm_powerups::register_powerup("custom_elec_power", &CustomElecPower);
    zm_powerups::add_zombie_powerup("custom_elec_power", "p8_wz_ep_homunculus", #"hash_69256172c78db147", &func_should_drop_custom, 1, 0, 0);

    zm_powerups::register_powerup("custom_wolf_power", &CustomWolfPower);
    zm_powerups::add_zombie_powerup("custom_wolf_power", "c_gen_direwolf_fb", #"hash_69256172c78db147", &func_should_drop_custom, 0, 0, 0);
}

ZombieFollowDuck(player) // for custom powerup
{
    if (level.FollowDucks)
    {
        return;
    }

    level.FollowDucks = true;

    level.MainDuck = util::spawn_model("p8_zm_red_floatie_duck", self.origin + (0, 0, 40), (180, 0, 180));
    level.MainDuck SetScale(5);
    //level.MainDuck clientfield::set("" + #"hash_2bb63677db4333d4", 1); // sword fx < crashes

    level.MainDuck zm_utility::create_zombie_point_of_interest(200, 30000, 20000);
    level.MainDuck zm_utility::create_zombie_point_of_interest_attractor_positions(undefined, undefined, 128);

    level.MainDuck rotateTo((randomint(180), randomint(180), randomint(180)), 15);

    for(i = 0; i < 5; i++)
    {
        level.MainDuck playsound("zmb_vocals_zombie_death_quack");
        playfx(level._effect[#"electric_cherry_explode"], level.MainDuck.origin);
        wait 3;
    }

    for(i = 0; i < 10; i++)
    {
        self SendRocket("launcher_standard_t8_upgraded", level.MainDuck,(0, 0, 0) + (0, 0, i * 30), level.MainDuck);
    }

    level.MainDuck playsound("zmb_vocals_zombie_death_quack");
    playfx(level._effect[#"electric_cherry_explode"], level.MainDuck.origin);
    PhysicsExplosionSphere(level.MainDuck.origin, 2000, 2000, 50, 1000, 1000);
    earthquake(1, 2, level.MainDuck.origin, 2000);
    
    level.MainDuck zm_utility::deactivate_zombie_point_of_interest();
    level.MainDuck delete();
    level.MainDuck = undefined;
    level.FollowDucks = false;
}

FollowDuck(ai_zombie) // unused
{
    v_goal = level.MainDuck;

    if (isdefined(v_goal))
    {
        ai_zombie setgoal(v_goal, 1);
    }
}


CustomPaPPowerUp(e_player)
{
    if (IsBot(self))
    {
        return;
    }

    e_player thread UpgradeWeapon();
    playfx(level._effect[#"teleport_aoe_kill"], e_player.origin + (0, 0, 50));
    e_player PlaySound("zmb_full_ammo");
}

CustomBottlePowerUp(e_player)
{
    e_player thread GearUpPower();
    playfx(level._effect[#"teleport_aoe_kill"], e_player.origin + (0, 0, 50));
    e_player PlaySound("zmb_full_ammo");
}

GearUpPower(player)
{
    zm_bgb_perkaholic::activation();
    zm_bgb_shields_up::give_shield();
}

GiveClientWeapon(WeaponName, player)
{
    weapon = getweapon(WeaponName);
    wait .1;
    player zm_weapons::weapon_give(weapon);
}

func_should_drop_custom() // for custom powerups
{
    return 1;
}

AddPowerUpsNoDetour()
{
    #ifdef _SUPPORTS_DETOURS
    return;
    #endif

    if (!isdefined(level.zombie_powerups)) 
    {
        return;
    }

    powerup_keys = getarraykeys(level.zombie_powerups);
    for (powerup_key_index = 0; powerup_key_index < powerup_keys.size; powerup_key_index++) 
    {
        if (isdefined(level.zombie_powerups[powerup_keys[powerup_key_index]].client_field_name)) 
        {
            powerup_name = powerup_keys[powerup_key_index];
            level thread ShouldDropPowerUp(powerup_name);
        }
    }
    // some ones
    level thread ShouldDropPowerUp("free_perk");
    level thread ShouldDropPowerUp("zombie_blood");
    level thread ShouldDropPowerUp("bonus_points_player");
    level thread ShouldDropPowerUp("small_ammo");
    level thread ShouldDropPowerUp("minigun");
    level thread ShouldDropPowerUp("bonfire_sale");
}

ShouldDropPowerUp(powerup_name)
{
    if (!isdefined(level.zombie_powerups) || !isdefined(level.zombie_powerups[powerup_name])) 
    {
        return;
    }
    
    level.zombie_powerups[powerup_name].func_should_drop_with_regular_powerups = &func_should_drop_custom;
    level.zombie_powerups[powerup_name].var_d92b8001 = level.zombie_powerups[powerup_name].func_should_drop_with_regular_powerups;
}

CustomElecPower(e_player)
{
    e_player PlaySound("zmb_bgb_abh_teleport_out");
    e_player thread ElecOut();
}

ElecOut()
{
    wait 0.3;
    for(i = 0; i < 7; i++)
    {
        self thread zm_perk_electric_cherry::electric_cherry_laststand();
        playfx(level._effect[#"teleport_aoe_kill"], self.origin + (0, 0, 50));
        wait 1.5;
    }
}

CustomWolfPower(e_player)
{
    e_player PlaySound("evt_wolf_protector_spawn");
    playfx(level._effect[#"teleport_aoe_kill"], self.origin + (0, 0, 50));
    e_player thread SpawnLuna();
}

SpawnLuna()
{
    self notify("28244f2ad3846403");
    self endon("28244f2ad3846403");
    if (!isdefined(self.luna_ai))
    {
        ai = spawnactor(#"hash_3f174b9bcc408705", self.origin + (30, 25, 30), self.angles, "wolf_protector", 1);
        if (isdefined(ai)) 
        {
            self.hasluna = true;
            ai val::set(#"wolf_protector", "takedamage", 0);
            ai.player_owner = self;
            self.luna_ai = ai;
            ai clientfield::increment("wolf_protector_spawn_fx");
            ai thread clientfield::set("wolf_protector_fx", 1);
            ai ghost();
            wait(0.6);
            if (isdefined(ai)) 
            {
                ai show();
                self thread LunaTimeOut(45);
                ai thread zm_audio::zmbaivox_notifyconvert();
                ai thread zm_audio::play_ambient_zombie_vocals();
            }
        }
    }
}

LunaTimeOut(seconds)
{
    self waittilltimeout(seconds, #"scene_igc_shot_started", #"fake_death");
    self DeleteLuna();
}

DeleteLuna() 
{
    self.hasluna = false;
    if (isdefined(self.luna_ai)) 
    {
        self.luna_ai val::reset(#"wolf_protector", "takedamage");
        self.luna_ai clientfield::set("wolf_protector_fx", 0);
        self.luna_ai playsound(#"hash_55c72512f51a5e87");
        self.luna_ai thread util::delayed_delete(0.1);
        self.luna_ai = undefined;
    }
}

CustomRefPower(e_player)
{
    e_player PlaySound("zmb_bgb_abh_teleport_in");
    playfx(level._effect[#"teleport_aoe_kill"], e_player.origin + (0, 0, 50));
    zm_bgb_refresh_mint::activation();
}

CustomDuckPowerUp(e_player) // need some improvments
{
    earthquake(1, 1, e_player.origin, 100);
    e_player thread BurnOut();
    e_player PlaySound("zmb_bgb_abh_teleport_in");
    playfx(level._effect[#"teleport_aoe_kill"], e_player.origin + (0, 0, 50));
}

BurnOut()
{
    for(i = 0; i < 7; i++)
    {
        self thread zm_bgb_burned_out::result();
        wait 1.5;
    }
}

CustomWidowzPowerUp(e_player) // need some improvments
{
    if (!level.FollowDucks)
    {
        e_player thread ZombieFollowDuck();
        e_player PlaySound("evt_nuke_flash");
        e_player PlaySound("zmb_vocals_zombie_death_quack");
        playfx(level._effect[#"teleport_aoe_kill"], e_player.origin + (0, 0, 50));
    }
    else
    {
        // nothing
        e_player PlaySound("evt_nuke_flash");
    }
}