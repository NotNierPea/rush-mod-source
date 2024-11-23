/#

        {
            "type": "weapon",
            "name": "pistol_standard_t8_zm",
            "path": "Rush_Weapons\\strafe_mod.json",
            "format": "delta"
        },
        {
            "type": "weapon",
            "name": "hash_7553b8b22b40110c",
            "path": "Rush_Weapons\\strafe_up_mod.json",
            "format": "delta"
        },
        {
            "type": "weapon",
            "name": "ww_tricannon_t8_zm",
            "path": "Rush_Weapons\\kraken_elec.json",
            "format": "delta"
        },
        {
            "type": "weapon",
            "name": "hash_726a96c6b362512",
            "path": "Rush_Weapons\\kraken_elec_up.json",
            "format": "delta"
        },

#/


CustomWeaponLogics()
{
    switch(BO4GetMap())
    {
        case "Voyage":
        callback::add_weapon_fired(getweapon(#"ww_tricannon_t8" + "_upgraded"), &CustomKraken);
        break;
    }

    // multi ones
    callback::add_weapon_fired(getweapon(#"pistol_standard_t8"), &CustomStrafe);
    callback::add_weapon_fired(getweapon(#"pistol_standard_t8" + "_upgraded"), &CustomStrafeUpgraded);
}

CustomStrafe(weapon)
{
    self endon(#"disconnect"); // self -> player

    v_start = self getweaponmuzzlepoint();
    v_dir = self getweaponforwarddir();
    a_targets = getentitiesinradius(self.origin, 350, 15);

    //ShieldLog("^2 Custom Strafe -> Called -> " + a_targets.size);
    foreach (ai in a_targets) 
    {
        if (!isalive(ai) || ai.archetype !== #"zombie" && ai.archetype !== #"catalyst" || ai getteam() !== level.zombie_team) 
        {
            continue;
        }

        v_ai = ai getcentroid();
        v_normal = vectornormalize(v_ai - v_start);
        dot = vectordot(v_dir, v_normal);

        if (dot <= 0) 
        {
            continue;
        }

        waitframe(1);
        if (isalive(ai))
        {
            ai dodamage(ai.health - 10, v_start, self, self); // <- (-)
            playfx(level._effect[#"teleport_aoe_kill"], ai.origin + (0, 0, 50));
        }
    }
}

CustomStrafeUpgraded(weapon)
{
    self endon(#"disconnect"); // self -> player

    v_start = self getweaponmuzzlepoint();
    v_dir = self getweaponforwarddir();
    a_targets = getentitiesinradius(self.origin, 350, 15);

    //ShieldLog("^2 Custom Strafe -> Called -> " + a_targets.size);
    foreach (ai in a_targets) 
    {

        if (!isalive(ai) || ai.archetype !== #"zombie" && ai.archetype !== #"catalyst" || ai getteam() !== level.zombie_team) 
        {
            continue;
        }

        v_ai = ai getcentroid();
        v_normal = vectornormalize(v_ai - v_start);
        dot = vectordot(v_dir, v_normal);

        if (dot <= 0) 
        {
            continue;
        }

        waitframe(1);
        if (isalive(ai) && randomIntRange(1, 3) == 1)
        {
            ai dodamage(ai.health + 1000, v_start, self, self); // <- (+)
            playfx(level._effect[#"teleport_aoe_kill"], ai.origin + (0, 0, 50));
        }
        else
        {
            ai dodamage(ai.health - 10, v_start, self, self); // <- (-)
            playfx(level._effect[#"teleport_aoe_kill"], ai.origin + (0, 0, 50));
        }
    }
}

CustomKraken(weapon)
{
    self endon(#"disconnect");
    
    v_start = self getweaponmuzzlepoint();
    v_dir = self getweaponforwarddir();
    a_targets = getentitiesinradius(self.origin, 350, 15);

    foreach (ai in a_targets) 
    {
        if (!isalive(ai) || ai.archetype !== #"zombie" && ai.archetype !== #"catalyst" || ai getteam() !== level.zombie_team) 
            continue;

        v_ai = ai getcentroid();
        v_normal = vectornormalize(v_ai - v_start);
        dot = vectordot(v_dir, v_normal);

        if (dot <= 0) 
        {
            continue;
        }

        waitframe(1);
        if (isalive(ai))
        {
            ai thread zm_perk_electric_cherry::electric_cherry_stun();
            ai thread zm_perk_electric_cherry::electric_cherry_shock_fx();
            playfx(level._effect[#"switch_sparks"], ai.origin + (0, 0, 50));
        }
    }
}