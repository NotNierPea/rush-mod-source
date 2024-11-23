BossSkipVOD()
{
    level.VoyageFullSkipped = true;
    level thread lui::screen_flash(0.4, 2, 0.8, 1, "white");
    playsoundatposition(#"hash_e0f3575083de01b", (0, 0, 0));
    wait .5;
    foreach(player in level.players) 
    {
        player dontinterpolate();
        player SetRandomOrigin((2,5196,1088));
    }
    wait 3;
    thread VODBossActivate();
    wait 15;
    foreach(player in level.players) 
    {
        //player thread GearUP();
    }
}

SkipVODClock()
{
    level thread lui::screen_flash(0.4, 2, 0.8, 1, "white");
    playsoundatposition(#"hash_e0f3575083de01b", (0, 0, 0));
    wait .5;
    FlagActivate(1);
    foreach(player in level.players) 
    {
        player dontinterpolate();
        player SetRandomOrigin((2,5196,1088));
    }   
}

NonSkipVODClock()
{
    level thread lui::screen_flash(0.4, 2, 0.8, 1, "white");
    playsoundatposition(#"hash_e0f3575083de01b", (0, 0, 0));
    wait .5;
    foreach(player in level.players) 
    {
        player dontinterpolate();
        player SetRandomOrigin((2,5196,1088));
    }  
}

VODPAPEnable()
{
    //self.pap_machine function_214cd6b3();

    function_5c299a0f = @zodt8_pap_quest<scripts\zm\zm_zodt8_pap_quest.gsc>::function_5c299a0f; 
    function_1563bfc3 = @zodt8_pap_quest<scripts\zm\zm_zodt8_pap_quest.gsc>::function_1563bfc3;

    if (!isdefined(function_5c299a0f) && !isdefined(function_1563bfc3))
    {
        self iPrintLnBold("^1Can't find it noob! ");
        return;
    }
    foreach (s_loc in level.s_pap_quest.a_s_locations) 
    {
        s_loc.unitrigger_stub thread [[ function_5c299a0f ]]();
    }
    waitframe(1);
    [[ function_1563bfc3 ]]();
}

SkipSoldierBoy()
{
    level thread OverrideQuest(#"private_mannequin_program", #"step_1", &SkipSoldier);
}

SkipSoldier(b_skipped)
{
    wait 5;
    return;
}

SkipToStep()
{
    level._ee[#"boss_fight"].skip_to_step = 3;
    zm_sq::start(#"boss_fight");
}

BloodActivatePaP()
{
    wait 3;
    zm_zonemgr::enable_zone("zone_cellblock_jail_1");
    zm_zonemgr::enable_zone("zone_cellblock_jail_2");
    zm_zonemgr::enable_zone("zone_cellblock_jail_3");
    zm_zonemgr::enable_zone("zone_cellblock_jail_4");
    zm_zonemgr::enable_zone("zone_cellblock_west_barber");
    zm_zonemgr::enable_zone("zone_broadway_floor_2");
    zm_zonemgr::enable_zone("zone_cellblock_west");
    zm_zonemgr::enable_zone("zone_start");
    zm_zonemgr::enable_zone("zone_library");
    level flag::set("power_on1");
    level flag::set("power_on2");
}

NormalIX()
{
    level thread lui::screen_flash(0.4, 3, 0.8, 2, "white");
    playsoundatposition(#"hash_c648800c55e1554", (0, 0, 0));
    wait .5;
}

BossSkipIX()
{
    level.skipped = true;
    
    level thread lui::screen_flash(0.2, 7, 0.2, 2, "white");
    playsoundatposition(#"hash_c648800c55e1554", (0, 0, 0));
    IXBossSkipWithoutPortal();
    wait .5;
    
}

NormalBlood()
{
    level thread lui::screen_flash(0.4, 3, 0.8, 2, "white");
    playsoundatposition(#"evt_nuke_flash", (0, 0, 0));
    wait .5;
}

ChallengesSkipBlood()
{
    level thread lui::screen_flash(0.2, 3, 0.2, 2, "white");
    playsoundatposition(#"evt_nuke_flash", (0, 0, 0));
    level.SkippedChallenges = true;
    wait .5; 
}

BirdSkipBlood()
{
    level thread lui::screen_flash(0.2, 3, 0.2, 2, "white");
    playsoundatposition(#"evt_nuke_flash", (0, 0, 0));
    thread BloodSkipBird();
    wait .5;
}

FullSkipBlood()
{
    level thread lui::screen_flash(0.2, 6, 0.2, 2, "white");
    playsoundatposition(#"evt_nuke_flash", (0, 0, 0));
    thread BloodFullSkip();
    wait .5;
}

NormalDOTN()
{
    level thread lui::screen_flash(0.4, 3, 0.8, 1, "white");
    playsoundatposition(#"evt_nuke_flash", (0, 0, 0));
    wait .5;
}

BossSkipDOTN()
{
    //level thread lui::screen_flash(0.2, 7, 0.2, 2, "white");
    playsoundatposition(#"evt_nuke_flash", (0, 0, 0));
    DOTNBossActivate();
    wait .5;
}

IXBossSkipWithoutPortal()
{
    //function_6378f02b
    level.IXFullSkipped = true;
    level.skipped = true; // skipped

    setDvar(#"hash_3065419bcba97739", 1);

    wait 1;

    function_6378f02b = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_6378f02b; // skip

    if (!isdefined(function_6378f02b))
    {
            self iPrintLnBold("^1Can't find function_6378f02b! ");
            return;
    }

    level thread [[ function_6378f02b ]]();

    wait 0.01;

    setDvar(#"hash_3065419bcba97739", 0); // no skip elephant
}

BossSkipAE()
{
    level.AEFullSkipped = true;
    playsoundatposition(#"hash_489109cc61ab6258", (0, 0, 0));
    level thread lui::screen_flash(0.4, 4, 0.8, 1, "white");
    wait 1;
    thread AEBossActivate();
    wait 15;
    foreach(player in level.players) 
    {
        //player thread GearUP();
    }
}

SkipAEOil()
{
    level.AESkippedOil = true;
    
    playsoundatposition(#"hash_489109cc61ab6258", (0, 0, 0));
    level thread lui::screen_flash(0.4, 4, 0.8, 1, "white");
    wait .5;
    FlagActivate(3);
    foreach(player in level.players) 
    {
        player dontinterpolate();
        player SetRandomOrigin((-2886,6604,668));
    }   
}

NonSkipAEOil()
{
    playsoundatposition(#"hash_489109cc61ab6258", (0, 0, 0));
    level thread lui::screen_flash(0.4, 4, 0.8, 1, "white");
    wait .5;
    foreach(player in level.players) 
    {
        player dontinterpolate();
        player SetRandomOrigin((-2886,6604,668));
    }  
}

TagSkip()
{
    /#
    function_3c9be590 = @namespace_4b68b2b3<script_4b80fc97d8469299.gsc>::function_3c9be590; // skip 

    if (!isdefined(function_3c9be590))
    {
            self iPrintLnBold("^1Can't find function_3c9be590! ");
            return;
    }

    [[ function_3c9be590 ]](1);

    wait 10;

    function_a340f5a2 = @zm_orange_mq_hell<scripts\zm\zm_orange_mq_hell.gsc>::function_a340f5a2; // skip 

    if (!isdefined(function_a340f5a2))
    {
            self iPrintLnBold("^1Can't find function_a340f5a2! ");
            return;
    }

    [[ function_a340f5a2 ]]();
    #/

    level.TagFullSkipped = true;

    level thread OverrideQuest(#"main_quest", #"hash_86e283359f19a5f", &FreeSkipClean, &FreeSkipClean);
    level thread OverrideQuest(#"main_quest", #"hash_467104204a4803ad", &FreeSkipClean, &FreeSkipClean);
    level thread OverrideQuest(#"main_quest", #"hash_7c16d3a3e4250b9a", &FreeSkipClean, &FreeSkipClean);
    level thread OverrideQuest(#"main_quest", #"hash_2dfcd4264b2c2340", &FreeSkipClean, &FreeSkipClean);
    level thread OverrideQuest(#"main_quest", #"hash_c2e45a40a675911", &FreeSkipClean, &FreeSkipClean);
    level thread OverrideQuest(#"main_quest", #"hash_72bc0ec65f4afcca", &FreeSkipClean, &FreeSkipClean);
    level thread OverrideQuest(#"main_quest", #"hash_28c88f40ace27a7b", &FreeSkipClean, &FreeSkipClean);
    level thread OverrideQuest(#"main_quest", #"hash_382d731d4de07ed3", &FreeSkipClean, &FreeSkipClean);
    level thread OverrideQuest(#"main_quest", #"hash_2c00866b95e17ff5", &FreeSkipClean, &FreeSkipClean);
    level thread OverrideQuest(#"main_quest", #"hash_ebca448700872b8", &FreeSkipClean, &FreeSkipClean);
    level thread OverrideQuest(#"main_quest", #"hash_810019231f11ea1", &FreeSkipClean, &FreeSkipClean);
    level thread OverrideQuest(#"main_quest", #"hash_11c4f1ecb0dd5a34", &FreeSkipClean, &FreeSkipClean);
    level thread OverrideQuest(#"main_quest", #"hash_d0bf3cf30a07a84", &FreeSkipClean, &FreeSkipClean);
    level thread OverrideQuest(#"main_quest", #"hash_13b9abe1bd17294c", &FreeSkipClean); // main here
}

TagSkipLockDown()
{
    level thread lui::screen_flash(0.4, 2, 0.8, 1, "white");
    thread TagChange();
    playsoundatposition(#"evt_nuke_flash", (0, 0, 0));
    wait .5;
    foreach(player in level.players)
    {
        player dontinterpolate();
        player SetRandomOrigin((2320,-2799,303));
    }
    thread TagSkip();
    wait 5;
    foreach(player in level.players) 
    {
        player iPrintLnBold("^8 Starting the Lockdown......");
    }
    level.var_a43a746d = 4; // how many challenges
}

TagNormal()
{
    level thread lui::screen_flash(0.4, 2, 0.8, 1, "white");
    thread TagChange();
    playsoundatposition(#"evt_nuke_flash", (0, 0, 0));
    wait .5;
    foreach(player in level.players) 
    {
        player dontinterpolate();
        player SetRandomOrigin((2320,-2799,303));
    }   
    level.var_a43a746d = 4; // how many challenges
}

BossSkipAO()
{
    level.AOFullSkipped = true;

    level thread AlphaBossActivate();
    level thread lui::screen_flash(0.4, 2, 0.8, 1, "white");
    playsoundatposition(#"hash_83b85ca3e963765", (0, 0, 0));
    wait .5;
    foreach(player in level.players)
    {
        player dontinterpolate();
        player SetRandomOrigin((-160.155, -2061.96, -231.875));
    }
    
    zm_sq::start(#"zm_white_main_quest");
}

SkipAOClock()
{
    level.AOClockSkipped = true;

    level thread lui::screen_flash(0.4, 2, 0.8, 1, "white");
    playsoundatposition(#"hash_83b85ca3e963765", (0, 0, 0));
    wait .5;
    FlagActivate(5);
    foreach(player in level.players) 
    {
        player dontinterpolate();
        player SetRandomOrigin((1453,-1814,-62));
    }   

    zm_sq::start(#"zm_white_main_quest");
}

NonSkipAOClock()
{
    level thread lui::screen_flash(0.4, 2, 0.8, 1, "white");
    playsoundatposition(#"hash_83b85ca3e963765", (0, 0, 0));
    wait .5;
    foreach(player in level.players) 
    {
        player dontinterpolate();
        player SetRandomOrigin((1453,-1814,-62));
    }  

    zm_sq::start(#"zm_white_main_quest");
}

VODFinalPortalO()
{
    //scripts/zm/zm_zodt8_sentinel_trial.gsc
    //zodt8_sentinel::function_9003b2d4
    function_5b7a1511 = @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_5b7a1511; // boss fight skip :D

        if (!isdefined(function_5b7a1511))
        {
            self iPrintLnBold("^1Can't find zodt8_sentinel::function_5b7a1511! ");
            return;
        }

        level thread [[ function_5b7a1511 ]]();
}

VODFinalBoss()
{
    //scripts/zm/zm_zodt8_sentinel_trial.gsc
    //zodt8_sentinel::function_9003b2d4
    function_f4b715c1 = @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_f4b715c1; // boss fight skip :D

        if (!isdefined(function_f4b715c1))
        {
            self iPrintLnBold("^1Can't find zodt8_sentinel::function_5b7a1511! ");
            return;
        }

        level thread [[ function_f4b715c1 ]]();
}

IXOpenPortal()
{
    level.skipped = true; // you skipped (:
    if(BO4GetMap() == "IX")
    {
        level flag::set(#"hash_37071af70fe7a9f2");
    }
    else
    {
        self iPrintLnBold("^1Bitch!, you are not in IX! ");
    }
}

VODBossActivate()
{
    level.skipped = true; // you skipped (:
    if(BO4GetMap() == "Voyage")
    {
        namespace_ee206246::start(#"boss_fight");
        self thread RoundEdit(254);
        self thread KillEverything();
        self thread RoundEdit(254);
    }
    else
    {
        self iPrintLnBold("^1Bitch!, you are not in VOD! ");
    }
}

StartBOTDChallenges()
{
    zm_sq::start(#"paschal_quest", 3);
}

DOTNBossActivate()
{
    level.skipped = true; // you skipped (:
    if(BO4GetMap() == "Dead")
    {
        namespace_ee206246::start(#"hash_221e18c31e82092d");
    }
    else
    {
        self iPrintLnBold("^1Bitch!, you are not in DOTN! ");
    }

}

AEBossActivate()
{
    level.skipped = true; // you skipped (:
    function_3a2efd4e = @red_boss_battle<scripts\zm\zm_red_boss_battle.gsc>::function_3a2efd4e; // boss fight skip :D

        if (!isdefined(function_3a2efd4e))
        {
            self iPrintLnBold("^1Can't find red_boss_battle::function_3a2efd4e! ");
            return;
        }

        level thread [[ function_3a2efd4e ]]();
}

AEPortalActivate()
{
    level.skipped = true; // you skipped (:
    teleport_setup = @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::teleport_setup; // boss fight skip :D

        if (!isdefined(teleport_setup))
        {
            self iPrintLnBold("^1Can't find zm_red_main_quest::teleport_setup! ");
            return;
        }

        level thread [[ teleport_setup ]]();

        wait 5;
        s_unitrigger = struct::get(#"hash_5112e768ad998b70");
        s_unitrigger waittill(#"trigger_activated");
        AEBossActivate();
        wait 1;
}


AlphaBossActivate() // avocadro only
{
    //level thread AlphaSkipPAP();
    level.skipped = true; // you skipped (:
}

AlphaSkipPAP() // pap test
{
    level flag::wait_till("gameplay_started");
    function_6acd363d = @zm_white_special_rounds<scripts\zm\zm_white_special_rounds.gsc>::function_6acd363d; // skip 
    function_27a8604b = @zm_white_special_rounds<scripts\zm\zm_white_special_rounds.gsc>::function_27a8604b; // skip 

    BlockPathPAP = util::spawn_model("p7_zm_vending_packapunch", (153,-209,-447), (0, 0, 0));
    BlockPathPAP SetScale(1.65);
    BlockPathEnt = util::spawn_model("p7_zm_vending_packapunch", (1282,-2252,-62), (0, 90, 0));
    BlockPathEnt SetScale(1.65);

    wait 5;
    if (!isdefined(function_6acd363d) || !isdefined(function_27a8604b))
    {
        foreach (player in level.players) 
        {
            iPrintLnBold("^1Can't find function_6acd363d and function_27a8604b! ");
        }
        return;
    }
    level thread [[ function_6acd363d ]](1);
    wait 10;

    foreach (var_ab611263 in level.var_d4a0b9f4) 
    {
        if (var_ab611263[#"goo_state"] == #"active") 
        {
            var_ab611263[#"gas_cloud"] [[ function_27a8604b ]](var_ab611263[#"group"]);
        }
    }
    wait 1;
    level.zombie_total = 30; // set again
    NotifyRoundEnd();
    wait 1;

    BlockPathEnt delete();
}

BloodSkipBird()
{
    level thread OverrideQuest(#"paschal_quest", #"2", &OverrideBirdStep, &OverrideBirdStepClean);
}

BloodFullSkip()
{
    level.var_d9b730f3 = 1; // for step 5 > 6
    level.BloodFullSkipped = true;
    
    level thread OverrideQuest(#"paschal_quest", #"2", &OverrideBirdStep, &OverrideBirdStepClean);
    level thread OverrideQuest(#"paschal_quest", #"3", &OverrideCutsceneStep, &OverrideCutsceneStepClean);
    level thread OverrideQuest(#"paschal_quest", #"4", &OverrideCutsceneStep, &OverrideCutsceneStepClean);
    level thread OverrideQuest(#"paschal_quest", #"5", &OverrideStep5, &OverrideStep5Clean);
}

OverrideStep5(skipped)
{
    //foreach(player in level.players) player iPrintLnBold("^2 Skipped Step 5! ");
    mdl_door = getent("jar_1", "targetname");

    s_map = struct::get(#"hash_137eedd5080e585d");
    s_map thread scene::play("Shot 2");
    mdl_door thread scene::play(#"p8_fxanim_zm_esc_lab_door_map_bundle", mdl_door);
    
    jar_2 = getent("jar_2", "targetname");
    jar_2_fx = getent("jar_2_fxanim", "targetname");
    jar_2_fx thread scene::play(#"p8_fxanim_zm_esc_door_lab_double_bundle", "OPENED", jar_2_fx);

    jar_2 delete();
    wait(1.6);
    return;
}

OverrideStep5Clean(skipped, something)
{
    wait 0.5;
    level flag::set(#"activate_west_side_exterior_stairs");
    mdl_door = getent("c29_door", "targetname");
    playsoundatposition("zmb_c29_door_open", mdl_door.origin);
    mdl_door movez(96, 1.6);
    wait 0.1;

    s_portal = struct::get(#"hash_4f3ae1de39c4b3e3");
    for (i = 1; i <= util::get_active_players().size; i++)
    {
        v_facing = s_portal.origin - util::get_active_players()[i - 1].origin;
        v_angle = vectortoangles(v_facing);
        s_teleport = struct::get(#"c29_teleport_" + i);
        util::get_active_players()[i - 1] setorigin(s_teleport.origin);
        util::get_active_players()[i - 1] setplayerangles(v_angle);
    }

    level flag::set(#"activate_west_side_exterior_stairs");
    [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::step_5_cleanup ]](0, 0); // continue zm_sq
    return;
}

OverrideBirdStep(skipped)
{
    //foreach(player in level.players) player iPrintLnBold("^2 Skipped The Bird Step! ");
    return;
}

OverrideBirdStepClean(skipped, something)
{
    return;
}

OverrideCutsceneStep(skipped)
{
    //foreach(player in level.players) player iPrintLnBold("^2 Skipped The Scene (4) Step! ");
    return;
}

OverrideCutsceneStepClean(skipped, something)
{
    return;
}

Eye_SkipNoPhaseSelected()
{
    function_51e51897 = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_51e51897; // attack boss stuff

    if (!isdefined(function_51e51897))
    {
        self iPrintLnBold("^1Can't find it noob! ");
        return;
    }

    level.e_boss thread [[ function_51e51897 ]](1);
}

Eye_SkipPhase3()
{
    function_ed500548 = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_ed500548; // attack boss stuff

    if (!isdefined(function_ed500548))
    {
        self iPrintLnBold("^1Can't find it noob! ");
        return;
    }

    level.e_boss thread [[ function_ed500548 ]]();
}

Eye_SkipPhase5()
{
    function_b939c184 = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_b939c184; // attack boss stuff

    if (!isdefined(function_b939c184))
    {
        self iPrintLnBold("^1Can't find it noob! ");
        return;
    }

    level.e_boss thread [[ function_b939c184 ]]();
}

FlagActivate(FlagID)
{

if(BO4GetMap() == "AO")       
{
    switch(FlagID)
    {
        case 1:
        level flag::set(#"mq_computer_activated");
        break;

        case 2:
        level flag::set(#"hash_58b6a09577af5b6d");
        break;

        case 3:
        level flag::set(#"hash_3b5dac8c2aa1bb31");
        break;

        case 4:
        level flag::set(#"hash_13e9bb1de846d022");
        break;

        case 5:
        level flag::set(#"hash_63d6d5191ca09cae");
        break;

        case 6:
        level flag::set(#"hash_10b7ed627014a952");
        break;

        case 7:
        level flag::set(#"hash_15ca9944ac87c57e");
        break;

        case 8:
        level flag::set(#"hash_32c6d727b3de8407");
        break;

        case 9:
        level flag::set(#"hash_3ee4f9c58fbc63bd");
        break;

        case 10:
        level flag::set(#"hash_485ced30125950ac");
        break;

        case 11:
        level flag::set(#"hash_4046ffe851ff5b1c");
        break;

        case 12:
        level flag::set(#"hash_2a7f2737e415ffd1");
        break;

        case 13:
        level flag::set(#"hash_b53fb25b12e713");
        break;

        case 14:
        level flag::set(#"hash_84e6c8a0b5f7e1e");
        break;

        case 15:
        level flag::set(#"hash_5744a0be920e5002");
        break;

        case 16:
        level flag::set(#"hash_487c2805cd41d547");
        break;

        case 17:
        level flag::set(#"hash_2b7c76b6b0dfc0fd");
        break;

        case 18:
        level flag::set(#"boss_fight_started");
        break;

        case 19:
        level flag::set(#"boss_fight_complete");
        break;

        case 20:
        level flag::set(#"hash_7432d2728d0f50e8");
        break;

        case 21:
        level flag::set(#"hash_5aa1c9627e8626e0");
        break;
        
        case 22:
        level flag::set(#"hash_7cc3b03eefb11fc");
        break;
        
        case 23:
        level flag::set(#"hash_2fd002acaea672e4");
        break;

        case 24:
        level flag::set(#"crawler_step_complete");
        break;

        case 25:
        level flag::set(#"hash_bbe0772d001265");
        break;

        case 26:
        level flag::set(#"hash_6a79293e26344b0f");
        break;

        case 27:
        level flag::set(#"hash_8f3e7e5efab6d13");
        break;

        case 28:
        level flag::set(#"hash_4ad92dd97af40a26");
        break;

        case 29:
        level flag::set(#"hash_bd08d5649673cd1");
        break;

        case 30:
        level flag::set(#"hash_1478cafcd626c361");
        break;

        case 31:
        level flag::set(#"circuit_step_complete");
        break;

        case 32:
        level flag::set(#"hash_60eeaaec1ff2cb28");
        break;

        case 33:
        level flag::set(#"hash_a2a33348aff3bff");
        break;

        case 34:
        level flag::set(#"hash_2f57ff102a73c0b5");
        break;

        case 35:
        level flag::set(#"hash_687dde640557a121");
        break;

        case 36:
        level flag::set(#"hash_6899cc997afd5fac");
        break;

        case 37:
        level flag::set(#"hash_6ebb9d0d0539bf68");
        break;

        case 38:
        level flag::set(#"hash_3b808ddcae9fea60");
        break;

        case 39:
        level flag::set(#"hash_7c2ae917559738ec");
        break;

        case 40:
        level flag::set(#"hash_12854365001ac5c");
        break;

        case 41:
        level flag::set(#"hash_3972ecbdd044ba98");
        break;

        case 42:
        level flag::set(#"orb_path_completed");
        break;

        case 43:
        level flag::set(#"hash_66be0eea77b87d58");
        break;

        case 44:
        level flag::set(#"hash_1227f015cd55af9d");
        break;

        case 45:
        //level.var_38b15968
        level.var_9427911d = 9999999;
        break;

        case 46:
        //level.var_38b15968
        level.var_9427911d = 30;
        break;
    }
}


if(BO4GetMap() == "AE")       
{
    switch(FlagID)
    {
        case 1:
        level flag::set(#"monument_changed");
        break;

        case 2:
        level flag::set(#"hash_4e74b4172497a14a");
        break;

        case 3:
        level flag::set(#"oil_completed");
        break;

        case 4:
        level flag::set(#"hash_70a5801e57336554");
        break;

        case 5:
        level flag::set(#"split_completed");
        break;

        case 6:
        level flag::set(#"flag_prophecy_completed");
        break;

        case 7:
        level flag::set(#"flag_light_completed");
        break;

        case 8:
        level flag::set(#"hash_f38b18eaf7b063b");
        break;

        case 9:
        level flag::set(#"hash_5a7f1f9adac6dc8c");
        break;
    }
}

if(BO4GetMap() == "IX")       
{
    switch(FlagID)
    {
        case 1:
        level flag::set(#"hash_4fd3d0c01f9b4c30");
        break;

        case 2:
        level flag::set(#"hash_23c79f4deefd8aa1");
        break;

        case 3:
        level flag::set(#"hash_7f6689c71e55e8ab");
        break;

        case 4:
        level flag::set(#"hash_4866241882c534b7");
        break;

        case 5:
        level flag::set(#"hash_34294ceb082c5d8f");
        break;

        case 6:
        level flag::set(#"hash_4f293396150d2c00");
        break;

        case 7:
        level flag::set(#"hash_353dcb95f778ad73");
        break;

        case 8:
        level flag::set(#"hash_37071af70fe7a9f2");
        break;

        case 9:
        level flag::set(#"collect_ingredients_completed");
        break;

        case 10:
        level flag::set(#"collect_charcoal_completed");
        break;

        case 11:
        level flag::set(#"hash_4c6ced4815715faf");
        break;

        case 12:
        level flag::set(#"collect_dung_completed");
        break;

        case 13:
        level flag::set(#"mix_fertilizer_completed");
        break;

        case 14:
        level flag::set(#"place_fertilizer_completed");
        break;

        case 15:
        level flag::set(#"hash_498204258011f15e");
        break;

        case 16:
        level flag::set(#"bull_heads_completed");
        break;

        case 17:
        level flag::set(#"hash_7136198009a72989");
        break;

        case 18:
        level flag::set(#"hash_36efad26d2c9c9cd");
        break;

        case 19:
        level flag::set(#"hash_e35ac19ee7b732c");
        break;

        case 20:
        level flag::set(#"hash_768860cb3ad76c68");
        break;

        case 21:
        level flag::set(#"hash_77bd156a70de5aa3");
        break;
        
        case 22:
        level flag::set(#"hash_3666dca19f0f98b3");
        break;
        
        case 23:
        level flag::set(#"hash_1d004da0a75202bc");
        break;

        case 24:
        level flag::set(#"hash_35bd62e100e54ab3");
        break;

        case 25:
        level flag::set(#"hash_4f15d2623e98015d");
        break;

        case 26:
        level flag::set(#"hash_5734e11875c30d69");
        break;

        case 27:
        level flag::set(#"hash_50e2bacfe0486f6a");
        break;

        case 28:
        level flag::set(#"hash_4f26632e308bd2e6");
        break;

        case 29:
        level flag::set(#"hash_415c59c3573153ff");
        break;

        case 30:
        level flag::set(#"hash_2c274140cd602e60");
        break;

        case 31:
        level flag::set(#"hash_5e49848f6ac0bc6b");
        break;

        case 32:
        level flag::set(#"hash_4feaeb49c7362da7");
        break;

        case 33:
        level flag::set(#"hash_403b629f7e5829ee");
        break;

        case 34:
        level flag::set(#"hash_20c92720a4602dc7");
        break;

        case 35:
        level flag::set(#"hash_cad6742c753621");
        break;

        case 36:
        level flag::set(#"hash_6b64093194524df3");
        break;

        case 37:
        level flag::set(#"hash_2bf040db75b1dac7");
        break;

        case 38:
        level flag::set(#"hash_277d03629ade12e8");
        break;
    }
}

if(BO4GetMap() == "Tag")       
{
    switch(FlagID)
    {
        case 1:
        level flag::set(#"dials_aquired");
        break;

        case 2:
        level flag::set(#"dials_done");
        break;

        case 3:
        level flag::set(#"vessel_found");
        break;

        case 4:
        level flag::set(#"blood_hints");
        break;

        case 5:
        level flag::set(#"blood_waiting");
        break;

        case 6:
        level flag::set(#"blood_active");
        break;

        case 7:
        level flag::set(#"hash_e8247a060147428");
        break;

        case 8:
        level flag::set(#"hash_43c116bdb3a96e16");
        break;

        case 9:
        level flag::set(#"hash_710c2f40baf302c8");
        break;

        case 10:
        level flag::set(#"hash_3a8a317fc0b5e5b0");
        break;

        case 11:
        level flag::set(#"hash_57d2cbf7d6c2035a");
        break;

        case 12:
        level flag::set(#"hash_238e5c8b416f855");
        break;

        case 13:
        level flag::set(#"hash_4923165da58bf5cf");
        break;

        case 14:
        level flag::set(#"hash_5630cdbbb58f1b1e");
        break;

        case 15:
        level flag::set(#"hash_7b6c32b9937aee62");
        break;

        case 16:
        level flag::set(#"hash_11d64d1f93c196cc");
        break;

        case 17:
        level flag::set(#"hash_4898001eb77cb16f");
        break;

        case 18:
        level flag::set(#"hash_5266a594b96823e2");
        break;

        case 19:
        level flag::set(#"hash_1d9afa9be4c10160");
        break;

        case 20:
        level flag::set(#"blood_waiting");
        break;

        case 21:
        level flag::set(#"hash_2c3411c8b8b421d8");
        break;
    }
}


if(BO4GetMap() == "Blood")       
{
    wait 1;
    switch(FlagID)
    {
        case 1:
        level flag::set(#"hash_379fc22ed85f0dbc");
        break;

        case 2:
        level flag::set(#"hash_68a1656980e771da");
        break;
        
        case 3:
        level flag::set(#"main_quest_completed");
        break;

        case 4:
        level flag::set(#"hash_2f5be8d749b4e88e");
        break;
        
        case 5:
        level flag::set(#"hash_40e9ad323fe8402a");
        break;

        case 6:
        level flag::set(#"hash_36138b6e1d539829");
        break;

        case 7:
        level flag::set(#"hash_6048c3f423fd987");
        break;

        case 8:
        level flag::set(#"hash_61bba9aa86f61865");
        break;

        case 9:
        level flag::set(#"hash_3cc421108aedf47f");
        break;

        case 10:
        level flag::set(#"dm_ready");
        break;

        case 11:
        level flag::set(#"hash_1b4b6ce05cb62d56");
        break;

        case 12:
        level flag::set(#"hash_3d16465b22e70170");
        break;

        case 13:
        level flag::set(#"richtofen_sacrifice");
        break;

        case 14:
        level flag::set(#"hash_68923445ebf488f0");
        break;

        case 15:
        level flag::set(#"hash_12a631be319641a1");
        break;

        case 16:
        level flag::set(#"hash_7680c620ba7315e5");
        break;

        case 17:
        level flag::set(#"hash_73b06a8a2c0b0e8d");
        break;

        case 18:
        level flag::set(#"hash_8c500dbad4c6edb");
        break;

        case 19:
        level notify(#"seagull_blasted");
        break;

        case 20:
        level notify(#"hash_38f418ba1b5571a2");
        break;

        case 21:
        level notify(#"hash_1b94645b5f964ebe");
        break;

        case 22:
        level notify(#"hash_11ed3188b9f33eab");
        break;

        case 23:
        level notify(#"hash_29b90ce9aa921f78");
        break;
    }
}

if(BO4GetMap() == "Voyage")       
{
    wait 1;
    switch(FlagID)
    {
        case 1:
        level flag::set(#"hash_2d1cd18f39ac5fa7");
        break;

        case 2:
        level flag::set(#"hash_515a88d1cbabc18e");
        break;
        
        case 3:
        level flag::set(#"hash_1322dd3a3d7411a5");
        break;

        case 4:
        level flag::set(#"hash_2f5be8d749b4e88e");
        break;
        
        case 5:
        level flag::set(#"hash_33a5d8dd1204080e");
        break;

        case 6:
        level flag::set(#"hash_652ae68711aa37c1");
        break;

        case 7:
        level flag::set(#"hash_63ebf7fc2afa76ea");
        break;

        case 8:
        level flag::set(#"hash_70eb07a177cf8881");
        break;

        case 9:
        level flag::set(#"hash_65e37079e0d22d47");
        break;

        case 10:
        level flag::set(#"catalyst_encounters_completed");
        break;

        case 11:
        level flag::set(#"hash_7a31252c7c941976");
        break;

        case 12:
        level flag::set(#"hash_27a2746eb30e61c");
        break;

        case 13:
        level flag::set(#"hash_3e80d503318a5674");
        break;

        case 14:
        level flag::set(#"hash_452df3df817c57f9");
        break;

        case 15:
        level flag::set(#"hash_63a102a7ae564e99");
        break;

        case 16:
        level flag::set(#"orrery_activated");
        break;

        case 17:
        level flag::set(#"hash_76dd603f61fa542d");
        break;

        case 18:
        level flag::set(#"hash_77f76266b597a1f7");
        break;

        case 19:
        level flag::set(#"planet_step_completed");
        break;

        case 20:
        level flag::set(#"hash_1a742576c41a0ab9");
        break;

        case 21:
        level flag::set(#"hash_767ce45fce848b88");
        break;

        case 22:
        level flag::set(#"hash_349bc60cedc7491e");
        break;

        case 23:
        level flag::set(#"hash_280d10a2ac060edb");
        break;
    }
}
}