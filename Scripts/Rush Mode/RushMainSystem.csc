#include scripts\core_common\system_shared.csc;
#include scripts\core_common\array_shared.csc;
#include scripts\core_common\clientfield_shared.csc;
#include scripts\core_common\callbacks_shared.csc;
#include scripts\core_common\util_shared.csc;
#include scripts\core_common\flag_shared.csc;

#namespace CSCSide;

autoexec __init__system__() 
{
    if (util::is_frontend_map())
        return; // frontend, i dont want to fucking crash again please
    
    system::register("CSCSide", &__init__, &__post_init__, undefined);

    thread CreateHuds();
}

CreateHuds()
{
    level.RushVer = "2.2V - Shield Client";

    /#
    ShieldRegisterHudElem(#"zombies_counter", "^6waiting for the zombies...", 
        0xFFFFC0EB, // color red
        10, 10, // x/y
        0, 0, // anchor x/y
        0, 0, // align x/y
        0.50 // scale
    );
    #/

    /*
                        aligns
        - x, 0 = left | 1 = center | 2 = right
        - y, 0 = top  | 1 = middle | 2 = bottom
    */

    // rush
    ShieldRegisterHudElem(#"rush_ver", "^1Rush Mod " + level.RushVer, 0xFFFFC0EB, 
        8, 26,
        0, 0,
        0, 0,
        0.40
    );

    /#
    ShieldRegisterHudElem(#"zombies_counter", "^3Waiting For Zombies...", 0xFFFFC0EB, 
        10, 0,
        0, 1,
        0, 0,
        0.50
    );
    #/

    /#
    ShieldRegisterHudElem(#"rush_counter", "^6Waiting For Players...", 0xFFFFC0EB, 
        10, 30,
        0, 1,
        0, 0,
        0.50
    );
    #/

    /#
    ShieldRegisterHudElem(#"rush_event_0", "^1--- ^2No Event", 0xFFFFC0EB, 
        10, 60,
        0, 1,
        0, 0,
        0.50
    );
    #/

    /#
    ShieldRegisterHudElem(#"rush_quest_detect", "^4Waiting For Main Quest...", 0xFFFFC0EB, 
        10, 100,
        0, 1,
        0, 0,
        0.50
    );
    #/

    thread RushLoopColor();
}

RushLoopColor()
{
    while(true)
    {
        ShieldHudElemSetText(#"rush_ver", "^" + randomIntRange(1, 10) + "Rush Mod " + level.RushVer);
        wait 5;
    }
}

__init__() 
{
    level.zombies_counter = 
    {
        #count : 0,
        #remaining : 0
    };

    // clientfields
    // count
    //clientfield::register("toplayer", "" + #"zombies_counter_alive", 1, 6, "int", &SetZombieCount, 0, 0);
    //clientfield::register("toplayer", "" + #"zombies_counter_remaining", 1, 7, "int", &SetRemainingZombies, 0, 0);

    // rush things
    //clientfield::register("toplayer", "" + #"rush_counter_int", 1, 6, "int", &SetRushModeCounter, 0, 0);
    //clientfield::register("toplayer", "" + #"rush_event_text", 1, 6, "int", &SetRushModeText, 0, 0);
    //clientfield::register("toplayer", "" + #"rush_quest_detect_text", 1, 6, "int", &SetRushModeQuestText, 0, 0);

    // test
    clientfield::register("toplayer", "" + #"test_csc_m", 1, 2, "int", &TestClientField, 0, 0);
}

__post_init__()
{
    // avoid
}

Update_Hud(Case, Int)
{
    switch(Case)
    {
        case 1:
        ShieldHudElemSetText(#"zombies_counter", "^1Zombies: ^5" + level.zombies_counter.count + " ^1(^5" + level.zombies_counter.remaining + " ^1remaining)");
        break;

        case 2:
        for (i = Int; i >= 2; i--)
        {
            ShieldHudElemSetText(#"rush_counter", "^6Next Rush Mod Event in: ^8" + i);
            wait 1;
        }
        
        // a little delay -> (csc)
        ShieldHudElemSetText(#"rush_counter", "^6Next Rush Mod Event in: ^8" + 1);
        wait 0.8;
        ShieldHudElemSetText(#"rush_counter", "^6Event Activated");
        break;

        case 3:
        TextMsg = GetRushModeEventCSC(Int);
        ShieldHudElemSetText(#"rush_event_0", "^1--- " + TextMsg);
        break;

        case 4:
        TextMsg = GetRushModeQuestCSC(Int);
        ColorR = randomIntRange(1, 10);
        ShieldHudElemSetText(#"rush_quest_detect", "^4Current Main Quest Step ^" + ColorR + TextMsg);

        if(TextMsg == 61) ShieldHudElemSetText(#"rush_quest_detect", ""); // remove with CSC
        break;
    }
}

GetRushModeEventCSC(Int)
{
    switch(Int) // tbc
    {
        case 1:
        Msg = "^3 Freeze!";
        break;

        case 2:
        Msg = "^4 Weapons Disabled!";
        break;

        case 3:
        Msg = "^3 Zombie Teleport!";
        break;

        case 4:
        Msg = "^6 Gravity Change!";
        break;
        
        case 5:
        Msg = "^6 Speed Change!";
        break;

        case 6:
        Msg = "^4 InstaKill Spawn!";
        break;

        case 7:
        Msg = "^7 Points Taken!";
        break;

        case 8:
        Msg = "^7 Shield UP!";
        break;

        case 9:
        Msg = "^7 Perk UP!";
        break;

        case 10:
        Msg = "^1 Uhhhh";
        break;

        case 11:
        Msg = "^7 Reign Drops!";
        break;

        case 12:
        Msg = "^7 1x Self Revive!";
        break;

        case 13:
        Msg = "^2 uhhh";
        break;

        case 14:
        Msg = "^9 Headless Zombies!";
        break;

        case 15:
        Msg = "^4 Random Elixir!";
        break;

        case 16:
        Msg = "^4 Suprise!";
        break;

        case 17:
        Msg = "^4 Hide Gun!";
        break;

        case 18:
        Msg = "^9 widowzzz wine ARMY!";
        break;

        case 19:
        Msg = "^9 symbolzzz wine ARMY!";
        break;

        case 20:
        Msg = "^3 Exo Suit Activated!";
        break;

        case 21:
        Msg = "^9 Super Jump!";
        break;

        case 22:
        Msg = "^9 NUKE!!!!!";
        break;

        case 23:
        Msg = "^1 Third Person";
        break;

        case 24:
        Msg = "^4 Flashbang!";
        break;

        case 25:
        Msg = "^1 No Event";
        break;

        case 26:
        Msg = "^9 NUKE ARMY!";
        break;

        case 27:
        Msg = "^4 JumpScare!";
        break;

        case 28:
        Msg = "^9 Invisible Zombies!";
        break;

        case 29:
        Msg = "^2 Super Speed Zombies!";
        break;

        case 30:
        Msg = "^2 Fake Error!";
        break;

        case 31:
        Msg = "^3 Rocket Gun!";
        break;

        case 32:
        Msg = "^3 Models Gun!";
        break;

        case 33:
        Msg = "^3 Nukie Friend!";
        break;

        case 60:
        Msg = "^2No Event";
        break;

        default:
        Msg = "undefined";
        break;
    }
    return Msg;
}

GetRushModeQuestCSC(Int)
{
    switch(Int) // tbc
    {
        case 1:
        ee_step_name = "- Mannequin Step";
        break;

        case 2:
        ee_step_name = "- Circuits Step";
        break;

        case 3:
        ee_step_name = "- Server Step";
        break;

        case 4:
        ee_step_name = "- Canister Step";
        break;

        case 5:
        ee_step_name = "- Crawler Step";
        break;

        case 6:
        ee_step_name = "- The Clock Step";
        break;

        case 7:
        ee_step_name = "- The Bunker Step (Finale)";
        break;

        case 8:
        ee_step_name = "- The Teleport Step (Final)";
        break;

        case 9:
        ee_step_name = "- Look the Dead in the Eye Step";
        break;

        case 10:
        ee_step_name = "- Hit Marks Step";
        break;

        case 11:
        ee_step_name = "- Push/Ignite The Bow Step";
        break;
        
        case 12:
        ee_step_name = "- Scepter and Sundial Step";
        break;

        case 13:
        ee_step_name = "- Align the Citizens Step";
        break;

        case 14:
        ee_step_name = "- The Door Step";
        break;

        case 15:
        ee_step_name = "- Oil Step";
        break;

        case 16:
        ee_step_name = "- The Planet Step";
        break;

        case 17:
        ee_step_name = "- The Iceberg Challenge Step";
        break;

        case 18:
        ee_step_name = "- Upgrade The Artifact Step";
        break;

        case 19:
        ee_step_name = "- The Outlets Step";
        break;

        case 20:
        ee_step_name = "- The Clock Step";
        break;

        case 21:
        ee_step_name = "- The Pressure Plate Step";
        break;

        case 22:
        ee_step_name = "- Defend Key Step";
        break;

        case 23:
        ee_step_name = "- The Light Step";
        break;

        case 24:
        ee_step_name = "- Unknown Step";
        break;

        case 25:
        ee_step_name = "- The Gladiator Round Step";
        break;

        case 26:
        ee_step_name = "- Activate Middle Balls Step";
        break;

        case 27:
        ee_step_name = "- Charge Spikes Step";
        break;

        case 28:
        ee_step_name = "- Electric Setup Step";
        break;

        case 29:
        ee_step_name = "- Unknown Step";
        break;

        case 30:
        ee_step_name = "- The Fire Shield Step";
        break;

        case 31:
        ee_step_name = "- The Shit Teleport Step";
        break;

        case 32:
        ee_step_name = "- The Shit Place Bath Step";
        break;

        case 33:
        ee_step_name = "- The Shit Place Odin Step";
        break;

        case 34:
        ee_step_name = "- Collect Stuff (Wood, Skull) Step (Finale)";
        break;

        case 35:
        ee_step_name = "- Activate Blue Fires Step";
        break;

        case 36:
        ee_step_name = "- Activate Knights Step";
        break;

        case 37:
        ee_step_name = "- Charge Stones Step";
        break;

        case 38:
        ee_step_name = "- Stone Lockdown Step";
        break;

        case 39:
        ee_step_name = "- Shoot Sticks Step";
        break;

        case 40:
        ee_step_name = "- Stick Ghost Step";
        break;

        case 41:
        ee_step_name = "- Stick Lockdown Step";
        break;

        case 42:
        ee_step_name = "- Shoot The Beam Step";
        break;

        case 43:
        ee_step_name = "- Rings Puzzle Step";
        break;

        case 44:
        ee_step_name = "- Marks Puzzle Step";
        break;

        case 45:
        ee_step_name = "- Beam Lockdown Step";
        break;

        case 46:
        ee_step_name = "- Acitvate Any Sone Step";
        break;

        case 47:
        ee_step_name = "- Completed!";
        break;

        case 48:
        ee_step_name = "- Agarthan Device Step";
        break;

        case 49:
        ee_step_name = "- Campfire Step";
        break;

        case 50:
        ee_step_name = "- Snow Orbs Step";
        break;

        case 51:
        ee_step_name = "- Agarthan Device Lockdown Step";
        break;

        case 52:
        ee_step_name = "- Charge Agarthan Device Step";
        break;

        case 53:
        ee_step_name = "- Charge Generators / Open Door Step";
        break;

        case 54:
        ee_step_name = "- Place Door Fuse / Shoot Electric Boxes Step";
        break;

        case 55:
        ee_step_name = "- Soapstones Step";
        break;

        case 56:
        ee_step_name = "- Acquire Agarthan Device Step";
        break;

        case 57:
        ee_step_name = "- Dials Step (Finale)";
        break;

        case 58:
        ee_step_name = "- PAP Lockdown Step";
        break;

        case 59:
        ee_step_name = "- Final Lockdown";
        break;

        case 60:
        ee_step_name = "- Unknown Step";
        break;

        case 61:
        ee_step_name = 61; // remove with csc
        break;

        default:
        ee_step_name = "- Unknown Step";
        break;
    }
    return ee_step_name;
}

/#-------------------#/

TestClientField(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
    // later
}

SetRushModeCounter(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
    Update_Hud(2, newval);
}

SetRushModeText(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
    Update_Hud(3, newval);
}

SetRushModeQuestText(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
    Update_Hud(4, newval);
}

SetZombieCount(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) 
{
    level.zombies_counter.count = newval;
    Update_Hud(1);
}

SetRemainingZombies(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) 
{
    level.zombies_counter.remaining = newval;
    Update_Hud(1);
}