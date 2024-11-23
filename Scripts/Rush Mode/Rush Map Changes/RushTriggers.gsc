TriggerDeleteCheckBoss()
{
    level waittill(#"RushBossPicked");
    wait 3;
    if(isDefined(self.s_unitrigger))
     zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
    
    wait 2;
    self delete();
}

TriggerDeleteCheck()
{
    level waittill(#"RushStarted");
    wait 3;
    if(isDefined(self.s_unitrigger))
     zm_unitrigger::unregister_unitrigger(self.s_unitrigger);

    wait 2;
    self delete();
}

RushNormalTriggerSetUp(e_player)
{
    if(level.PickedOption)
     return false;
    else
    return true;
}

RushNormalTriggerChecking()
{
    self endon(#"death");

    model = self.stub.related_parent;
    model endon(#"death");
    
    model thread TriggerDeleteCheck();

    if (!isdefined(level.MainTriggerRushN))
    {
        level.MainTriggerRushN = model;
        level.MainTriggerRushN thread AddObjective(1);
        level.MainTriggerRushN thread CheckPick();
    }
    
    if(isdefined(model.plus_string))
     self sethintstring(model.hintstring, model.plus_string);
    else
     self setHintString(model.hintstring);
    self setcursorhint("HINT_NOICON");

    if(isdefined(model.teddy) && model.teddy)
    {
        Effect = util::spawn_model("tag_origin", model.origin + (0,0,30), model.angles); // makes effect origin better
        Effect clientfield::set("powerup_fx", 2);
        Effect thread TriggerDeleteCheck();
    }
    else
     model clientfield::set("powerup_fx", 2);
    
    while(true)
    {
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        e_player = waitresult.activator;

        e_player thread [[ model.func ]](); // thread -> e_player and not level
        e_player thread zm_utility::play_sound_on_ent("purchase");
        playfx(level._effect[#"hash_1eae5969d11a8b16"], model.origin);
        playfx(level._effect[#"teleport_splash"], model.origin);
    }

}


Spawn_RushNormalTrigger(origin, hintstring, angles, model, func, plus_string, teddy = false)
{
    level endon(#"RushStarted");

    level flag::wait_till("all_players_spawned");

    model_m = util::spawn_model(model, origin, angles);
    model_m Solid();

    model_m.func = func;
    model_m.hintstring = hintstring;

    if(isdefined(plus_string))
     model_m.plus_string = plus_string;

    if(teddy)
     model_m.teddy = true;

    model_m zm_unitrigger::create(&RushNormalTriggerSetUp, 120, &RushNormalTriggerChecking);
}

RushExtraQuestTriggerSetUp(e_player)
{
    if(level.PickedOption)
     return false;
    else
    return true;
}

RushExtraQuestTriggerChecking()
{
    self endon(#"death");

    model = self.stub.related_parent;
    model endon(#"death");
    
    model thread TriggerDeleteCheck();

    if (!isdefined(level.MainTriggerRushQN))
    {
        level.MainTriggerRushQN = model;
        level.MainTriggerRushQN thread AddObjective(1);
        level.MainTriggerRushQN thread CheckPick();
    }
    
    self thread OffOnTextLoop(model);

    self setcursorhint("HINT_NOICON");
    model clientfield::set("powerup_fx", 2);
    
    while(true)
    {
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        e_player = waitresult.activator;

        e_player thread [[ model.func ]](); // thread -> e_player and not level
        // ?? sounds/effects needed
    }

}

OffOnTextLoop(model)
{
    self endon(#"death");
    model endon(#"death");

    level endon(#"RushStarted");

    while(true)
    {
        if(isdefined(level.RushCustomQuest))
        {
            on_off_hint = level.RushCustomQuest ? #"shield/hint_on" : #"shield/hint_off";
            self sethintstring(model.hintstring, on_off_hint);
        }
        else
         self setHintString(model.hintstring);

        wait 0.1;
    }
}

Spawn_RushExtraQuestTrigger(origin, hintstring, angles, model, func)
{
    level endon(#"RushStarted");

    level flag::wait_till("all_players_spawned");

    model_m = util::spawn_model(model, origin, angles);
    model_m Solid();

    model_m.func = func;
    model_m.hintstring = hintstring;

    model_m zm_unitrigger::create(&RushExtraQuestTriggerSetUp, 120, &RushExtraQuestTriggerChecking);
}

BossRushTriggerSetUp(e_player)
{
    return true;
}

BossRushTriggerChecking()
{
    self endon(#"death");

    model = self.stub.related_parent;
    model thread TriggerDeleteCheckBoss();
    model thread AddObjective(1);
    model thread CheckPickBoss();

    self sethintstring(model.hintstring);
    self setcursorhint("HINT_NOICON");

    Effect = util::spawn_model("tag_origin", model.origin + (0,0,30), model.angles); // makes effect origin better
    Effect clientfield::set("powerup_fx", 4);
    Effect thread TriggerDeleteCheckBoss();

    waitresult = undefined;
    waitresult = self waittill(#"trigger");

    playfx(level._effect[#"hash_1eae5969d11a8b16"], model.origin);
    playfx(level._effect[#"teleport_splash"], model.origin);

    level thread [[ model.func ]](); // thread
    level.PickedOptionBoss = true;
}

Spawn_BossRushTrigger(origin, hintstring, angles, model, func)
{
    level endon(#"RushBossPicked");

    level flag::wait_till("all_players_spawned");
    model_m = util::spawn_model(model, origin, angles);
    model_m Solid();

    model_m.func = func;
    model_m.hintstring = hintstring;
    model_m zm_unitrigger::create(&BossRushTriggerSetUp, 120, &BossRushTriggerChecking);
}

RushTriggerSetUp(e_player)
{
    if(level.PickedOption)
     return false;
    else
    return true;
}

RushTriggerChecking()
{
    self endon(#"death");

    model = self.stub.related_parent;
    model endon(#"death");

    model thread TriggerDeleteCheck();
    model thread AddObjective(1);
    model thread CheckPick();

    if(isdefined(model.waitforblack) && model.waitforblack)
        self WaitPreventCrash(model.waitseconds, model.hintstring);
    
    self setHintString(model.hintstring);
    self setcursorhint("HINT_NOICON");

    if(!(isdefined(model.teddy) && model.teddy))
    {
        Effect = util::spawn_model("tag_origin", model.origin + (0,0,30), model.angles); // makes effect origin better
        Effect clientfield::set("powerup_fx", 4);
        Effect thread TriggerDeleteCheck();
    }
    else
     model clientfield::set("powerup_fx", 4);

    waitresult = undefined;
    waitresult = self waittill(#"trigger");

    playfx(level._effect[#"hash_1eae5969d11a8b16"], model.origin);
    playfx(level._effect[#"teleport_splash"], model.origin);
    level thread [[ model.func ]](); // thread

    level.PickedOption = true;
}

Spawn_RushTrigger(origin, hintstring, angles, model, func, waitseconds, teddy = false)
{
    level endon(#"RushStarted");

    level flag::wait_till("all_players_spawned");

    model_m = util::spawn_model(model, origin, angles);
    model_m Solid();

    model_m.func = func;
    model_m.hintstring = hintstring;

    if(teddy)
     model_m.teddy = true;

    if(isdefined(waitseconds))
    {
        model_m.waitforblack = true;
        model_m.waitseconds = waitseconds;
    }

    model_m zm_unitrigger::create(&RushTriggerSetUp, 120, &RushTriggerChecking);
}

WaitPreventCrash(waitseconds, hintstring)
{
    self sethintstring("shield/waitrush"); // Awaiting gamestate
    level flag::wait_till("initial_blackscreen_passed"); // waits for players
    wait(waitseconds);
    self sethintstring(hintstring); // back
}

CheckPick()
{
    while(!level.PickedOption)
    {
        wait 1;
    }
    self AddObjective(0);
}

CheckPickBoss() // unused lol <- nevermind
{
    while(!level.PickedOptionBoss)
    {
        wait 0.5;
    }
    self AddObjective(0);
}

RushWeaponTriggerSetUp(e_player)
{
    if(level.PickedOption)
     return false;
    else
    return true;
}

RushWeaponTriggerChecking()
{
    self endon(#"death");

    model = self.stub.related_parent;
    model endon(#"death");

    model thread TriggerDeleteCheck();

    if (!isdefined(level.MainTriggerRush))
    {
        level.MainTriggerRush = model;
        level.MainTriggerRush thread AddObjective(1);
        level.MainTriggerRush thread CheckPick();
    }
    
    if(isdefined(model.waitseconds))
    {
        if(isdefined(model.custom_hintstring))
         self WaitPreventCrash(model.waitseconds, model.custom_hintstring);
        else
         self WaitPreventCrash(model.waitseconds, #"hash_6a4c5538a960189d");
    }
    
    if(!isdefined(model.custom_hintstring))
     self sethintstring(#"hash_6a4c5538a960189d");
    else
     self setHintString(model.custom_hintstring);
    self setcursorhint("HINT_WEAPON", model.weapon);

    model clientfield::set("powerup_fx", 1);
    
    while(true)
    {
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        e_player = waitresult.activator;

        if(e_player zm_weapons::has_weapon_or_attachments(model.weapon))
        {
            self sethintstring(#"hash_53fd856df9288be7");
            wait 0.5;
            self sethintstring(#"hash_6a4c5538a960189d");
            if(isdefined(model.custom_hintstring)) self sethintstring(model.custom_hintstring);
        }
        else
        {
            if(!model.stopgive) e_player zm_weapons::weapon_give(model.weapon);
            playfx(level._effect[#"hash_1eae5969d11a8b16"], model.origin);
            if(isdefined(model.func)) e_player thread [[ model.func ]]();
        }
    }

}

Spawn_RushWeapon(Origin, Angles, WeaponName, custom_hintstring, customfunction, stopgive = false, waitseconds)
{
    level endon(#"RushStarted");

    Weapon = getweapon(WeaponName);
    level flag::wait_till("all_players_spawned");

    model_m = zm_utility::spawn_weapon_model(Weapon, undefined, Origin + (0, 0, 15), Angles);
    model_m NotSolid();

    if(isdefined(custom_hintstring))
      model_m.custom_hintstring = custom_hintstring;

    if(isdefined(Weapon.dualwieldweapon) && Weapon.dualwieldweapon != level.weaponnone)
    {
        model_ma = spawn("script_model", Origin + (0,0,20));
        model_ma.Angles = Angles;
        model_ma SetModel(Weapon.dualwieldweapon.worldmodel);
        model_ma NotSolid();
        model_ma thread TriggerDeleteCheck();
    }

    if(isdefined(customfunction))
      model_m.func = customfunction;

    model_m.weapon = Weapon;
    model_m.stopgive = stopgive;

    if(isdefined(waitseconds))
     model_m.waitseconds = waitseconds;

    model_m zm_unitrigger::create(&RushWeaponTriggerSetUp, 120, &RushWeaponTriggerChecking);
}