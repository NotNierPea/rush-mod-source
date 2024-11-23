SwitchStepsSupport() // switches main quest/boss steps
{
    switch(BO4GetMap())
    {
        case "Voyage":
        // Reverse Logic
        level.Step2 = spawnStruct();
        level.Step2.MainClean = @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_542127b2;
        level.Step2.Main = @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_443b1ad2;

        Step3 = spawnStruct();
        Step3.MainClean = @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_71a8bce1;
        Step3.Main = @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_8ec70b18;

        Step4 = spawnStruct();
        Step4.MainClean = @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_92cd9426;
        Step4.Main = @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_1b44fb7f;

        Step5 = spawnStruct();
        Step5.MainClean = @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_ba182aaa;
        Step5.Main = @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_73a32bb4;

        Step6 = spawnStruct();
        Step6.MainClean = @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_34f97128;
        Step6.Main = @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_558b4527;

        // Start Quest Logic
        level thread OverrideQuest(#"main_quest", #"step_3", &VoyageQuestStartLogic, level.Step2.MainClean);
        level thread OverrideQuest(#"main_quest", #"step_4", Step3.Main, Step3.MainClean);
        level thread OverrideQuest(#"main_quest", #"step_5", Step4.Main, Step4.MainClean);
        level thread OverrideQuest(#"main_quest", #"step_6", &SparksStepLogic, Step5.MainClean);
        level thread OverrideQuest(#"main_quest", #"step_7", Step6.Main, Step6.MainClean);

        // Boss Logic
        Step2 = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_85bc1590;
        Step2Clean = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_af6afecd;

        Step3 = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_ed500548;
        Step3Clean = @zodt8_eye<scripts\zm\zm_zodt8_eye.gsc>::function_3c959c2e;

        level thread OverrideQuest(#"boss_fight", "step_2", Step3, Step3Clean);
        level thread OverrideQuest(#"boss_fight", "step_3", Step2, Step2Clean);
        break;

        case "IX":
        // Random Logic
        level.Step2 = spawnStruct();
        level.Step2.MainClean = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::pressure_plate_cleanup;
        level.Step2.Main = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::pressure_plate_setup;

        Step3 = spawnStruct();
        Step3.MainClean = &DefendCleanStep; // needed because its gonna skip to boss
        Step3.Main = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::trilane_defend_setup;

        Step4 = spawnStruct();
        Step4.MainClean = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::light_runes_cleanup;
        Step4.Main = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::light_runes_setup;

        Step5 = spawnStruct();
        Step5.MainClean = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::maelstrom_completed_cleanup;
        Step5.Main = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::maelstrom_completed_setup;

        Step6 = spawnStruct();
        Step6.MainClean = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::gladiator_round_cleanup;
        Step6.Main = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::gladiator_round_setup;

        Step7 = spawnStruct();
        Step7.MainClean = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_fd901116;
        Step7.Main = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_6c17207c;

        Step8 = spawnStruct();
        Step8.MainClean = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_49a07fa0;
        Step8.Main = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_99cfe16e;

        Step9 = spawnStruct();
        Step9.MainClean = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_10cf7d43;
        Step9.Main = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_5e35bafd;

        Step10 = spawnStruct(); // puzzle is not needed (already with bulls)
        Step10.MainClean = &FreeSkipClean;
        Step10.Main = &FreeSkip;

        Step11 = spawnStruct();
        Step11.MainClean = &BullsClean;
        Step11.Main = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::activate_bulls_setup;

        Step12 = spawnStruct();
        Step12.MainClean = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_2a061a2b;
        Step12.Main = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::function_b288e20a;

        Step13 = spawnStruct();
        Step13.MainClean = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::place_fertilizer_cleanup;
        Step13.Main = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::place_fertilizer_setup;

        Step14 = spawnStruct();
        Step14.MainClean = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::mix_fertilizer_cleanup;
        Step14.Main =  @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::mix_fertilizer_setup;

        Step15 = spawnStruct();
        Step15.MainClean = &CollectStepClean;
        Step15.Main = @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::collect_ingredients_setup;

        // Start Quest Logic
        level thread OverrideQuest(#"main_quest", #"collect_ingredients", &IXQuestStartLogic, level.Step2.MainClean);
        level thread OverrideQuest(#"main_quest", #"mix_fertilizer", Step3.Main, Step3.MainClean);
        level thread OverrideQuest(#"main_quest", #"place_fertilizer", Step4.Main, Step4.MainClean);
        level thread OverrideQuest(#"main_quest", #"hash_c165871a3fda034", Step5.Main, Step5.MainClean);
        level thread OverrideQuest(#"main_quest", #"activate_bulls", Step6.Main, Step6.MainClean);
        level thread OverrideQuest(#"main_quest", #"activate_puzzle", Step7.Main, Step7.MainClean);
        level thread OverrideQuest(#"main_quest", #"hash_1cf74a26bf73d769", Step8.Main, Step8.MainClean);
        level thread OverrideQuest(#"main_quest", #"hash_73c85b5a7924fcfb", Step9.Main, Step9.MainClean);
        level thread OverrideQuest(#"main_quest", #"activate_lightning_balls", Step10.Main, Step10.MainClean);
        level thread OverrideQuest(#"main_quest", #"gladiator_round", Step11.Main, Step11.MainClean);
        level thread OverrideQuest(#"main_quest", #"maelstrom_completed", Step12.Main, Step12.MainClean);
        level thread OverrideQuest(#"main_quest", #"light_runes", Step13.Main, Step13.MainClean);
        level thread OverrideQuest(#"main_quest", #"pressure_plate", Step14.Main, Step14.MainClean);
        level thread OverrideQuest(#"main_quest", #"trilane_defend", Step15.Main, Step15.MainClean);
        break;

        case "Blood":
        // Start Quest Logic
        level thread OverrideQuest(#"paschal_quest", #"1", &BOTDFirstStepLogic);
        break;

        case "AE":
        // Random Logic
        level.Step2 = spawnStruct();
        level.Step2.MainClean = @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::cleanse_cleanup;
        level.Step2.Main = @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::cleanse_setup;
        level.Step2.Main1 = @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::push_ballista_setup;
        level.Step2.MainClean1 = @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::push_ballista_cleanup;
        level.Step2.Main2 = @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::ignite_ballista_setup;
        level.Step2.MainClean2 = @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::ignite_ballista_cleanup;

        Step3 = spawnStruct();
        Step3.MainClean = @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::blood_cleanup;
        Step3.Main = @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::blood_setup;

        Step4 = spawnStruct();
        Step4.MainClean = @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::play_cleanup;
        Step4.Main = @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::play_setup;

        Step5 = spawnStruct();
        Step5.MainClean = @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::function_488a4eb2;
        Step5.Main = @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::function_29a8dcd4;

        Step6 = spawnStruct();
        Step6.MainClean = @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::split_cleanup;
        Step6.Main = @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::split_setup;

        Step7 = spawnStruct();
        Step7.MainClean = @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::reflect_cleanup;
        Step7.Main = @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::reflect_setup;

        Step8 = spawnStruct();
        Step8.MainClean = @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::oil_cleanup;
        Step8.Main = @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::oil_setup;

        // Start Quest Logic
        level thread OverrideQuest(#"main_quest", #"oil", undefined, &AEQuestStartLogic);
        level thread OverrideQuest(#"main_quest", #"reflect", Step3.Main, Step3.MainClean);
        level thread OverrideQuest(#"main_quest", #"split", Step4.Main, Step4.MainClean);
        level thread OverrideQuest(#"main_quest", #"hash_1b1abb2af5960bfe", Step5.Main, Step5.MainClean);
        level thread OverrideQuest(#"main_quest", #"play", Step6.Main, Step6.MainClean);
        level thread OverrideQuest(#"main_quest", #"blood", Step7.Main, Step7.MainClean);
        level thread OverrideQuest(#"main_quest", #"cleanse", &OilSetup, Step8.MainClean);
        level thread OverrideQuest(#"main_quest", #"push_ballista", &FreeSkip, &FreeSkipClean);
        level thread OverrideQuest(#"main_quest", #"ignite_ballista", &FreeSkip, &FreeSkipClean);

        // start the clean oil step
        level flag::set(#"oil_completed");
        break;

        case "AO":
        // Reverse Logic
        level.Step2 = spawnStruct();
        level.Step2.MainClean = @zm_white_main_quest<scripts\zm\zm_white_main_quest.gsc>::zm_white_main_quest_step6_cleanup;
        level.Step2.Main = @zm_white_main_quest<scripts\zm\zm_white_main_quest.gsc>::zm_white_main_quest_step6_setup;

        level.Step3 = spawnStruct();
        level.Step3.MainClean = @zm_white_main_quest<scripts\zm\zm_white_main_quest.gsc>::zm_white_main_quest_step5_cleanup;
        level.Step3.Main = @zm_white_main_quest<scripts\zm\zm_white_main_quest.gsc>::zm_white_main_quest_step5_setup;

        level.Step4 = spawnStruct();
        level.Step4.MainClean = @zm_white_main_quest<scripts\zm\zm_white_main_quest.gsc>::zm_white_main_quest_step4_cleanup;
        level.Step4.Main = @zm_white_main_quest<scripts\zm\zm_white_main_quest.gsc>::zm_white_main_quest_step4_setup;

        level.Step5 = spawnStruct();
        level.Step5.MainClean = @zm_white_main_quest<scripts\zm\zm_white_main_quest.gsc>::zm_white_main_quest_step3_cleanup;
        level.Step5.Main = @zm_white_main_quest<scripts\zm\zm_white_main_quest.gsc>::zm_white_main_quest_step3_setup;

        level.Step6 = spawnStruct();
        level.Step6.MainClean = @zm_white_main_quest<scripts\zm\zm_white_main_quest.gsc>::zm_white_main_quest_step2_cleanup;
        level.Step6.Main = @zm_white_main_quest<scripts\zm\zm_white_main_quest.gsc>::zm_white_main_quest_step2_setup;

        level.Step7 = spawnStruct();
        level.Step7.MainClean = @zm_white_main_quest<scripts\zm\zm_white_main_quest.gsc>::zm_white_main_quest_step1_cleanup;
        level.Step7.Main = @zm_white_main_quest<scripts\zm\zm_white_main_quest.gsc>::zm_white_main_quest_step1_setup;

        level.Step8 = spawnStruct();
        level.Step8.MainClean = @zm_white_main_quest<scripts\zm\zm_white_main_quest.gsc>::zm_white_main_quest_step7_cleanup;
        level.Step8.Main = @zm_white_main_quest<scripts\zm\zm_white_main_quest.gsc>::zm_white_main_quest_step7_setup;

        // Start Quest Logic
        level thread OverrideQuest(#"zm_white_main_quest", #"hash_482ab5c3c8c111fc", &AOQuestStartLogic, level.Step2.MainClean);
        level thread OverrideQuest(#"zm_white_main_quest", #"mq2_cv1", level.Step3.Main, level.Step3.MainClean);
        level thread OverrideQuest(#"zm_white_main_quest", #"mq3_cv2", level.Step4.Main, level.Step4.MainClean);
        level thread OverrideQuest(#"zm_white_main_quest", #"mq4_cv3", level.Step5.Main, level.Step5.MainClean);
        level thread OverrideQuest(#"zm_white_main_quest", #"mq5_cv4", level.Step6.Main, level.Step6.MainClean);
        level thread OverrideQuest(#"zm_white_main_quest", #"mq6_cv5", level.Step7.Main, level.Step7.MainClean);
        level thread OverrideQuest(#"zm_white_main_quest", #"hash_3a3d5f6df2a45005", level.Step8.Main, level.Step8.MainClean);

        //level thread SkipSoldierBoy();
        break;

        case "Tag":
        // no random here
        // paps
        level thread OverrideQuest(#"pap_rock", #"step_1", &FreeSkipClean);
        level thread OverrideQuest(#"pap_rock", #"step_2", &FreeSkipClean);

        // Start Quest Logic
        level thread OverrideQuest(#"main_quest", #"hash_86e283359f19a5f", &TagQuestStartLogic, &FreeSkipClean);
        break;
    }
}

ReverseTag()
{
    // Random Logic
    level.Step2 = spawnStruct();
    level.Step2.MainClean = @zm_orange_mq_sendoff<scripts\zm\zm_orange_mq_sendoff.gsc>::function_ae270d9e;
    level.Step2.Main = @zm_orange_mq_sendoff<scripts\zm\zm_orange_mq_sendoff.gsc>::function_5309464a;

    Step3 = spawnStruct();
    Step3.MainClean = @zm_orange_mq_hell<scripts\zm\zm_orange_mq_hell.gsc>::function_ae270d9e;
    Step3.Main = @zm_orange_mq_hell<scripts\zm\zm_orange_mq_hell.gsc>::function_5309464a;

    Step4 = spawnStruct();
    Step4.MainClean = @namespace_4b68b2b3<script_4b80fc97d8469299.gsc>::function_3c9be590;
    Step4.Main = @namespace_4b68b2b3<script_4b80fc97d8469299.gsc>::function_816c3132;

    level.Step5 = spawnStruct();
    level.Step5.MainClean = @zm_orange_mq_campfire<scripts\zm\zm_orange_mq_campfire.gsc>::function_a874e5d0;
    level.Step5.Main = @zm_orange_mq_campfire<scripts\zm\zm_orange_mq_campfire.gsc>::function_13dda28a;

    Step6 = spawnStruct();
    Step6.MainClean = @zm_orange_mq_blood<scripts\zm\zm_orange_mq_blood.gsc>::function_2d9e1e29; // swapped here
    Step6.Main = @zm_orange_mq_blood<scripts\zm\zm_orange_mq_blood.gsc>::function_8d43b840;

    Step7 = spawnStruct();
    Step7.MainClean = @namespace_4b68b2b3<script_4b80fc97d8469299.gsc>::function_a8748143; // ^
    Step7.Main = @namespace_4b68b2b3<script_4b80fc97d8469299.gsc>::function_1faf4b9;

    Step8 = spawnStruct();
    Step8.MainClean = @namespace_4b68b2b3<script_4b80fc97d8469299.gsc>::function_c2898bf0; // ^
    Step8.Main = @namespace_4b68b2b3<script_4b80fc97d8469299.gsc>::function_91fbb734;

    Step9 = spawnStruct();
    Step9.MainClean = @zm_orange_mq_campfire<scripts\zm\zm_orange_mq_campfire.gsc>::function_a874e5d0;
    Step9.Main = @zm_orange_mq_campfire<scripts\zm\zm_orange_mq_campfire.gsc>::function_13dda28a;

    Step10 = spawnStruct(); 
    Step10.MainClean = @zm_orange_mq_blood<scripts\zm\zm_orange_mq_blood.gsc>::function_2d9e1e29;
    Step10.Main = @zm_orange_mq_blood<scripts\zm\zm_orange_mq_blood.gsc>::function_8d43b840;

    Step11 = spawnStruct();
    Step11.MainClean = @zm_orange_mq_fuse<scripts\zm\zm_orange_mq_fuse.gsc>::function_3d5a45fb;
    Step11.Main = @zm_orange_mq_fuse<scripts\zm\zm_orange_mq_fuse.gsc>::function_c723e684;

    Step12 = spawnStruct();
    Step12.MainClean = @zm_orange_mq_fuse<scripts\zm\zm_orange_mq_fuse.gsc>::function_9e34b0d4;
    Step12.Main = @zm_orange_mq_fuse<scripts\zm\zm_orange_mq_fuse.gsc>::function_742dfdb5;

    Step13 = spawnStruct();
    Step13.MainClean = @zm_orange_mq_soapstone<scripts\zm\zm_orange_mq_soapstone.gsc>::function_9ee4c8c3;
    Step13.Main = @zm_orange_mq_soapstone<scripts\zm\zm_orange_mq_soapstone.gsc>::function_d878e1ee;

    Step14 = spawnStruct();
    Step14.MainClean = @zm_orange_mq_campfire<scripts\zm\zm_orange_mq_campfire.gsc>::function_a874e5d0;
    Step14.Main =  @zm_orange_mq_campfire<scripts\zm\zm_orange_mq_campfire.gsc>::function_13dda28a;

    Step15 = spawnStruct();
    Step15.MainClean = @zm_orange_mq_blood<scripts\zm\zm_orange_mq_blood.gsc>::function_2d9e1e29;
    Step15.Main = @zm_orange_mq_blood<scripts\zm\zm_orange_mq_blood.gsc>::function_8d43b840;

    Step16 = spawnStruct();
    Step16.MainClean = @zm_orange_mq_vessel<scripts\zm\zm_orange_mq_vessel.gsc>::function_77e4073b;
    Step16.Main = @zm_orange_mq_vessel<scripts\zm\zm_orange_mq_vessel.gsc>::function_a5254494;

    Step17 = spawnStruct();
    Step17.MainClean = @zm_orange_mq_dials<scripts\zm\zm_orange_mq_dials.gsc>::function_51ecc801;
    Step17.Main = @zm_orange_mq_dials<scripts\zm\zm_orange_mq_dials.gsc>::function_77ed3bab;

    level thread OverrideQuest(#"main_quest", #"hash_467104204a4803ad", Step6.Main, Step6.MainClean);
    level thread OverrideQuest(#"main_quest", #"hash_7c16d3a3e4250b9a", Step7.Main, Step7.MainClean);
    level thread OverrideQuest(#"main_quest", #"hash_2dfcd4264b2c2340", Step8.Main, Step8.MainClean);
    level thread OverrideQuest(#"main_quest", #"hash_c2e45a40a675911", Step9.Main, Step9.MainClean);
    level thread OverrideQuest(#"main_quest", #"hash_72bc0ec65f4afcca", Step10.Main, Step10.MainClean);
    level thread OverrideQuest(#"main_quest", #"hash_28c88f40ace27a7b", Step11.Main, Step11.MainClean);
    level thread OverrideQuest(#"main_quest", #"hash_382d731d4de07ed3", Step12.Main, Step12.MainClean);
    level thread OverrideQuest(#"main_quest", #"hash_2c00866b95e17ff5", Step13.Main, Step13.MainClean);
    level thread OverrideQuest(#"main_quest", #"hash_ebca448700872b8", Step14.Main, Step14.MainClean);
    level thread OverrideQuest(#"main_quest", #"hash_810019231f11ea1", Step15.Main, Step15.MainClean);
    level thread OverrideQuest(#"main_quest", #"hash_11c4f1ecb0dd5a34", Step16.Main, Step16.MainClean);
    level thread OverrideQuest(#"main_quest", #"hash_d0bf3cf30a07a84", Step17.Main, Step17.MainClean);
    level thread OverrideQuest(#"main_quest", #"hash_13b9abe1bd17294c", level.Step2.Main, level.Step2.MainClean);
    level thread OverrideQuest(#"main_quest", #"hash_7d78cef11f6afb5e", Step4.Main, Step4.MainClean);
    level thread OverrideQuest(#"main_quest", #"hash_2bd81e2b05fccbed", Step3.Main, Step3.MainClean);
}

TagQuestStartLogic(b_skipped)
{
    while(!level.PickedOption)
    {
        //foreach(player in level.players) player iPrintLnBold("still waiting...");
        wait 1;
    }

    if (level.TagFullSkipped)
    {
        //foreach(player in level.players) player iPrintLnBold("^9 Skipped Quest! ");
        //playsoundatposition(#"hash_48910fcc61ab6c8a", (0, 0, 0));

        wait 1;

        level notify(#"StopQuestDetect");
        LUINotifyEvent(#"rush_quest_detect", 3, 1, 62, randomIntRange(1, 10));
        return;
    }

    wait 5;
    foreach(player in level.players) player iPrintLn("^2 Main Quest is in Reversed Order!, First Step is Campfire Step!");

    ReverseTag();
    [[ level.Step5.Main ]](0);

    wait 3;

    [[ level.Step5.MainClean ]](0, 0);
}

AOQuestStartLogic(b_skipped)
{
    while(!level.PickedOption)
    {
        //foreach(player in level.players) player iPrintLnBold("still waiting...");
        wait 1;
    }

    if (level.AOFullSkipped)
    {
        //foreach(player in level.players) player iPrintLnBold("^9 Skipped Quest! ");
        //playsoundatposition(#"hash_48910fcc61ab6c8a", (0, 0, 0));
        level zm_ui_inventory::function_7df6bb60(#"zm_white_breakfast_trial", 8);

        level thread OverrideQuest(#"zm_white_main_quest", #"hash_482ab5c3c8c111fc", &FreeSkipClean, &FreeSkipClean);
        level thread OverrideQuest(#"zm_white_main_quest", #"mq2_cv1", &FreeSkipClean, &FreeSkipClean);
        level thread OverrideQuest(#"zm_white_main_quest", #"mq3_cv2", &FreeSkipClean, &FreeSkipClean);
        level thread OverrideQuest(#"zm_white_main_quest", #"mq4_cv3", &FreeSkipClean, &FreeSkipClean);
        level thread OverrideQuest(#"zm_white_main_quest", #"mq5_cv4", &FreeSkipClean, &FreeSkipClean);
        level thread OverrideQuest(#"zm_white_main_quest", #"mq6_cv5", &FreeSkipClean, &FreeSkipClean);
        level thread OverrideQuest(#"zm_white_main_quest", #"hash_3a3d5f6df2a45005", &FreeSkipClean, &FreeSkipClean);

        wait 0.1;

        level notify(#"StopQuestDetect");
        LUINotifyEvent(#"rush_quest_detect", 3, 1, 62, randomIntRange(1, 10));
        return;
    }

    wait 5;
    foreach(player in level.players) player iPrintLn("^2 Main Quest is in Reversed Order!, First Step is Mannequin Step!");
    level zm_ui_inventory::function_7df6bb60(#"zm_white_breakfast_trial", 8);

    [[ level.Step2.Main ]](0);
}

AEQuestStartLogic(b_skipped, ended_early)
{
    while(!level.PickedOption)
    {
        //foreach(player in level.players) player iPrintLnBold("still waiting...");
        wait 1;
    }

    if (level.AEFullSkipped)
    {
        //foreach(player in level.players) player iPrintLnBold("^9 Skipped Quest! ");
        playsoundatposition(#"hash_48910fcc61ab6c8a", (0, 0, 0));
        level zm_ui_inventory::function_7df6bb60(#"zm_red_objective_progress", 7);

        level notify(#"StopQuestDetect");
        LUINotifyEvent(#"rush_quest_detect", 3, 1, 62, randomIntRange(1, 10));
        level waittill(#"forever");
        return;
    }

    wait 10;
    foreach(player in level.players) player iPrintLn("^2 Main Quest is in Reversed Order!, First Step is Cleanse Step!");
    level zm_ui_inventory::function_7df6bb60(#"zm_red_objective_progress", 7);
    [[ level.Step2.Main ]](0);
    [[ level.Step2.MainClean ]](0, 0); // cleanup

    [[ level.Step2.Main1 ]](0); // push
    [[ level.Step2.MainClean1 ]](0, 0);

    [[ level.Step2.Main2 ]](0); // ignite
    [[ level.Step2.MainClean2 ]](0, 0);
}

SparksStepLogic(b_skipped)
{
    level zm_ui_inventory::function_7df6bb60(#"zm_zodt8_sentinel_trial", 4);
    [[ @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_ce111e55 ]]();

    if (!b_skipped) 
    {
        level thread [[ @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_40744a4 ]]();
        level thread GetSparks(); // helping here

        [[ @zodt8_sentinel<scripts\zm\zm_zodt8_sentinel_trial.gsc>::function_1c841015 ]]();
    }
}

OilSetup(b_skipped)
{
    wait 3;
    level flag::set(#"pap_quest_completed");
    level flag::set(#"fl_oracle_unlocked");
    level flag::clear(#"oil_completed");

    if(level.AESkippedOil) level flag::set(#"oil_completed");
    level zm_ui_inventory::function_7df6bb60(#"zm_red_objective_progress", 1);

    [[ @zm_red_main_quest<scripts\zm\zm_red_main_quest.gsc>::oil_setup ]](0);

    level zm_ui_inventory::function_7df6bb60(#"zm_red_objective_progress", 0);
}

VoyageQuestStartLogic(b_skipped)
{
    while(!level.PickedOption)
    {
        //foreach(player in level.players) player iPrintLnBold("still waiting...");
        wait 1;
    }

    if (level.VoyageFullSkipped) 
    {
        //foreach(player in level.players) player iPrintLnBold("^9 Skipped Quest! ");
        playsoundatposition(#"hash_e0f3a75083de89a", (0, 0, 0));
        level zm_ui_inventory::function_7df6bb60(#"zm_zodt8_sentinel_trial", 9);

        level notify(#"StopQuestDetect");
        LUINotifyEvent(#"rush_quest_detect", 3, 1, 62, randomIntRange(1, 10));
        level waittill(#"forever");
        return;
    }

    wait 10;
    playsoundatposition(#"hash_e0f3a75083de89a", (0, 0, 0));
    foreach(player in level.players) player iPrintLn("^2 Main Quest is in Reversed Order!, First Step is The Planet Step!");

    level flag::set(#"hash_76dd603f61fa542d"); // for the crate
    [[ level.Step2.Main ]](0);
}

IXQuestStartLogic(b_skipped)
{
    while(!level.PickedOption)
    {
        //foreach(player in level.players) player iPrintLnBold("still waiting...");
        wait 1;
    }

    if (level.IXFullSkipped) 
    {
        //foreach(player in level.players) player iPrintLnBold("^9 Skipped Quest! ");
        playsoundatposition(#"hash_6bc2c95bdaed3aed", (0, 0, 0));
        level zm_ui_inventory::function_7df6bb60(#"zm_towers_objective_progress", 5);

        level notify(#"StopQuestDetect");
        LUINotifyEvent(#"rush_quest_detect", 3, 1, 62, randomIntRange(1, 10));

        level waittill(#"forever");
        return;
    }

    wait 10;
    playsoundatposition(#"hash_6bc2c95bdaed3aed", (0, 0, 0));

    if(!level.RushCustomQuest)
    {
        foreach(player in level.players) 
         player iPrintLn("^2 Main Quest is in Reversed Order!, First Step is Defend Key Step!");

        [[ level.Step2.Main ]](0);
        return;
    }
    else
    {
        foreach(player in level.players) 
         player iPrintLn("^2 Main Quest is in Reversed Order!, First Step is Rush Lockdown Step!");

        IXStartCustomQuest(0);

        [[ level.Step2.Main ]](0);
    }
}

DefendCleanStep(b_skipped, ended_early)
{
    level.var_ec9554ad = undefined;
    level.var_34a4aede = undefined;
    level.var_e7f6d6dd = undefined;
    level.var_5021c818 = undefined;
    level.var_cc131a81 = undefined;
    level.var_abda60bd = undefined;
    level.var_ac1c3bba = undefined;
    //level flag::set(#"hash_37071af70fe7a9f2"); // not needed (boss teleport portal flag)
    playsoundatposition(#"hash_6bc2c55bdaed3421", (0, 0, 0));
    exploder::exploder("exp_odin_eyes");
}

BullsClean(b_skipped, ended_early)
{
    [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::activate_bulls_cleanup ]](0, 0);
    level flag::wait_till(#"hash_7f6689c71e55e8ab");
    
    exploder::exploder("exp_ra_eyes");
    level flag::set(#"hash_7f6689c71e55e8ab");
    playsoundatposition(#"hash_6bc2c75bdaed3787", (0, 0, 0));
}

CollectStepClean(b_skipped, ended_early)
{
    [[ @zm_towers_main_quest<scripts\zm\zm_towers_main_quest.gsc>::collect_ingredients_cleanup ]](0, 0);

    foreach(player in level.players) player iPrintLn("^2 The Main Quest Steps are Completed! (The Boss Awaits.....)");
    level flag::set(#"hash_37071af70fe7a9f2"); // (boss teleport portal flag)
}

BOTDFirstStepLogic(b_skipped)
{
    while(level.PickedOption == false)
    {
        wait 1;
    }
    wait 1;

    if (level.BloodFullSkipped)
    {
        //foreach(player in level.players) player iPrintLnBold("^9 Skipped Quest! ");

        level notify(#"StopQuestDetect");
        LUINotifyEvent(#"rush_quest_detect", 3, 1, 62, randomIntRange(1, 10));
        return;
    }

    level thread SkipWall();
    level [[ @paschal<scripts\zm\zm_escape_paschal.gsc>::step_1 ]](0);
}

FreeSkip(b_skipped)
{
    return;
}

FreeSkipClean(b_skipped, ended_early)
{
    return;
}