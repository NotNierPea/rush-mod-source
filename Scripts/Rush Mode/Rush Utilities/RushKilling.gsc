// Rush Killing here....

RushKill() // killing zombies + thanks futilitymen (:
{
    level endoncallback(&RushKillOverVoyage, #"boss_fight_started"); // a better one to use callback!
    level endoncallback(&RushKillOverIX, #"hash_12768f75609d32ca"); // had to use diff functions due to zebra error 112
    level endoncallback(&RushKillOverDeadAE, #"perseus_attacking");
    level endoncallback(&RushKillTag, #"hell_on_earth"); // tag
    level endoncallback(&RushKillBlood, #"hash_73b06a8a2c0b0e8d", #"hash_3bb155b55ea4338a"); // hash_3bb155b55ea4338a old

    // 0 = normal mode, 1 = rush mode,
    currentMode = 1;
    
    while(!level.PickedOption) // wait for pick
    {
        wait 1;
    }

    wait 5;
    while(true)
    {
        amountOfSecondsBeforeRoundEnds = randomIntRange(90, 135); // 120
        foreach(player in level.players) // for print messages
        {
            player iPrintln("^6Round Ending/Zombie Wipe in ^5"+amountOfSecondsBeforeRoundEnds+" Seconds!"); // rush mode text
        }
        for (secondInRound=0; secondInRound<amountOfSecondsBeforeRoundEnds; secondInRound++)
        {
            for (i=0;i<1;i++)
            {
                LUINotifyEvent(#"rush_zombie_round", 3, 1, secondInRound, amountOfSecondsBeforeRoundEnds);
                //LUINotifyEvent(#"rush_zombie_round", 1, 0);
                //ShieldHudElemSetText(#"rush_round_waiting", "^5Next Round Ending/Zombie Wipe: ^1" + secondInRound + "^3/^2" + amountOfSecondsBeforeRoundEnds);
                wait 1; // waiting

                /#
                if (currentMode==1 && self adsButtonPressed() && self meleeButtonPressed())
                {
                    currentMode=0;
                    self iPrintLnBold("^4Rush Killing Disabled! ");
                }
                if (currentMode==0 && self JumpButtonPressed() && self meleeButtonPressed())
                {
                    currentMode=1;
                    self iPrintLnBold("^4Rush Killing Enabled! ");
                    //KillEverything();
                }
                #/
            }
        }
        if (currentMode==0)
        {
            foreach(player in level.players) // for print messages
            {
                wait 1;
                player iPrintLnBold("^6Rush Killing is still Disabled! "); // rush mode text
                player iPrintln("^6Rush Killing is still Disabled! "); // rush mode text
            }
        }
        if (currentMode==1 && !level.RushChanged)
        {
            foreach(player in level.players) // for print messages
            {
                player iPrintLnBold("^4Round ^2Changed!"); // rush mode text
                player iPrintln("^4Round ^2Changed!"); // rush mode text
            }
            thread NotifyRoundEnd(); // chenged
        }
        if (currentMode==1 && level.RushChanged)
        {
            level.zombie_total = 0;
            //thread KillAllZombies();
            foreach(player in level.players) // for print messages
            {
                player iPrintLnBold("^4Zombies ^2Wiped!"); // rush mode text
                player iPrintln("^4Zombies ^2Wiped!"); // rush mode text
            }
        }
    }
}

    // Old Flags here...
    
    //level endoncallback(&RushKillBloodChallengesNotify, #"hash_36138b6e1d539829"); // for Challenges // hash_36138b6e1d539829
    //level endon(#"boss_fight_started"); // no killing in boss fights < VOD,DOTN,AO
    //level endon(#"hash_12768f75609d32ca"); // no killing in boss fights < IX
    //level endon(#"hash_5a7f1f9adac6dc8c"); // hit marks < AE


RushKillOverVoyage(str_notify)
{
    wait 8;
    LUINotifyEvent(#"rush_zombie_round", 1, 3);
    //ShieldHudElemSetText(#"rush_round_waiting", ""); // remove hud
    foreach(player in level.players)
    {
        player iPrintlnBold("^2 Rush Killing has been ^8Disabled ^2due to the Boss Fight! "); // event
    }
}

RushKillOverIX(str_notify)
{
    wait 15;
    LUINotifyEvent(#"rush_zombie_round", 1, 3);
    //ShieldHudElemSetText(#"rush_round_waiting", ""); // remove hud
    foreach(player in level.players)
    {
        player iPrintlnBold("^2 Rush Killing has been ^8Disabled ^2due to the Lockdown! "); // event
    }
}

RushKillOverDeadAE(str_notify)
{
    wait 10;
    LUINotifyEvent(#"rush_zombie_round", 1, 3);
    //ShieldHudElemSetText(#"rush_round_waiting", ""); // remove hud
    foreach(player in level.players)
    {
        player iPrintlnBold("^2 Rush Killing has been ^8Disabled ^2due to the Boss Fight! "); // event
    }
}

RushKillBlood(str_notify) // in cutscene instead of boss fight to avoid brutus not spawning in
{
    LUINotifyEvent(#"rush_zombie_round", 1, 3);
    //ShieldHudElemSetText(#"rush_round_waiting", ""); // remove hud
    wait 55;
    foreach(player in level.players)
    {
        player iPrintlnBold("^2 Rush Killing has been ^8Disabled ^2due to a Cutscene and Boss Fight! "); // event
    }
}

RushKillTag(str_notify)
{
    wait 7; 
    LUINotifyEvent(#"rush_zombie_round", 1, 3);
    //ShieldHudElemSetText(#"rush_round_waiting", ""); // remove hud
    foreach(player in level.players)
    {
        player iPrintlnBold("^2 Rush Killing has been ^8Disabled ^2due to the a Finale Lock Down! "); // event
    }
}