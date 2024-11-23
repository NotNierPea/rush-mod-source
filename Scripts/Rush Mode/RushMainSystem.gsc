#include scripts/zm_common/zm_player.gsc;
#include scripts\core_common\bots\bot;
#include scripts/zm_common/zm_ui_inventory.gsc; // !!
#include scripts\core_common\player\player_role;
#include scripts\core_common\values_shared;
#include scripts\core_common\spawner_shared;
#include scripts\zm_common\zm_spawner.gsc;
#include scripts/zm_common/zm_unitrigger.gsc; // !!
#include scripts\core_common\trigger_shared.gsc;
#include scripts\core_common\flagsys_shared;
#include scripts\core_common\bots\bot_util.gsc;
#include scripts\core_common\bots\bot_action.gsc;
#include scripts\zm\powerup\zm_powerup_nuke.gsc;
#include scripts\core_common\ai\zombie_death.gsc;
#include scripts\core_common\exploder_shared;
#include scripts\zm_common\zm_vo.gsc;
#include scripts\zm_common\zm_daily_challenges.gsc;
#include scripts\zm_common\zm_items.gsc;
#include scripts\core_common\vehicle_shared.gsc;
#include scripts\core_common\throttle_shared.gsc;
#include scripts\zm_common\zm_cleanup_mgr.gsc;
#include scripts\core_common\struct;
#include scripts/zm_common/zm_characters.gsc;
#include scripts\core_common\callbacks_shared;
#include scripts\core_common\clientfield_shared;
#include scripts\core_common\math_shared;
#include scripts\core_common\system_shared;
#include scripts\core_common\util_shared;
#include scripts\core_common\hud_util_shared;
#include scripts\core_common\hud_message_shared;
#include scripts\core_common\hud_shared;
#include scripts\core_common\array_shared;
#include scripts\core_common\flag_shared;
#include scripts\zm_common\gametypes\dev.gsc;
#include scripts\zm_common\zm_score.gsc;
#include scripts\zm_common\util.gsc;
#include scripts\core_common\ai_shared.gsc;
#include scripts\zm_common\zm_audio.gsc;
#include scripts\zm_common\zm_powerups.gsc;
#include scripts\zm_common\zm_stats.gsc;
#include scripts\zm_common\zm_power.gsc;
#include scripts\zm_common\zm_hero_weapon.gsc;
#include scripts/zm_common/zm_round_spawning.gsc; // !!
#include scripts\zm_common\zm_pack_a_punch_util.gsc;
#include scripts\zm_common\zm_pack_a_punch.gsc;
#include scripts\zm_common\zm_weapons.gsc;
#include scripts\core_common\aat_shared.gsc;
#include scripts/core_common/ai/zombie_utility.gsc;
#include scripts\zm_common\zm_utility.gsc;
#include scripts\zm_common\bgbs\zm_bgb_anywhere_but_here.gsc; // !!!
#include scripts\zm_common\zm_perks.gsc;
#include scripts\zm_common\zm_magicbox.gsc;
#include scripts\core_common\rank_shared.gsc;
#include scripts\zm_common\zm_blockers.gsc;
#include scripts\core_common\exploder_shared.gsc;
#include scripts\core_common\challenges_shared.gsc;
#include script_6ce38ab036223e6e.gsc;
#include scripts\zm_common\gametypes\globallogic_score.gsc;
#include scripts\zm_common\gametypes\globallogic.gsc;
#include scripts\core_common\contracts_shared.gsc;
#include script_47fb62300ac0bd60.gsc;
#include script_6c5b51f98cd04fa3.gsc;
#include scripts\core_common\match_record.gsc;
#include scripts\zm_common\zm_laststand.gsc;
#include scripts\core_common\laststand_shared.gsc;
#include scripts\zm_common\zm_bgb.gsc;
#include scripts/core_common/music_shared.gsc;
#include scripts/core_common/lui_shared.gsc;
#include scripts/core_common/animation_shared.gsc;
#include scripts\core_common\scoreevents_shared;
#include scripts\core_common\scene_shared.gsc;
#include scripts\zm_common\zm_zonemgr;
#include scripts\zm_common\zm_power;
#include scripts\zm_common\zm_blockers;
#include scripts\zm_common\zm_stats;
#include scripts\zm_common\zm_perks;
#include scripts\zm_common\callbacks.gsc; // !!!
#include scripts\zm_common\zm_equipment;
#include scripts\core_common\gestures;
#include scripts/zm_common/zm_game_module.gsc; // !!
#include scripts\zm_common\zm_utility;
#include scripts\zm_common\zm_weapons;
#include scripts\zm_common\zm_loadout;
#include scripts\zm_common\zm;
#include scripts\zm_common\zm_score;
#include script_3f9e0dc8454d98e1;
#include script_24c32478acf44108; // !!!!!
#include scripts\core_common\gameobjects_shared.gsc; // !!!!!!
#include scripts\core_common\math_shared.gsc;
#include script_4194df57536e11ed;
#include script_190d6b82bcca0908;
#include scripts\zm_common\gametypes\zm_gametype.gsc;
#include scripts\zm_common\zm_pack_a_punch_util.gsc;
#include scripts\zm_common\zm_pack_a_punch.gsc;
#include scripts\zm_common\zm_hud.gsc;
#include script_6d7d84509b62f422;
#include scripts\zm_common\zm_sq.gsc;

#include scripts\zm_common\bgbs\zm_bgb_shields_up.gsc;
#include scripts\zm_common\bgbs\zm_bgb_perkaholic.gsc;
#include scripts\zm_common\bgbs\zm_bgb_refresh_mint.gsc;
#include scripts\zm_common\bgbs\zm_bgb_burned_out.gsc;
#include scripts\zm_common\bgbs\zm_bgb_quacknarok.gsc;
#include scripts\zm_common\bgbs\zm_bgb_reign_drops.gsc;
#include scripts\zm_common\bgbs\zm_bgb_perk_up.gsc;

#include scripts\zm\perk\zm_perk_electric_cherry.gsc;
#include scripts\zm\perk\zm_perk_wolf_protector.gsc;

#include scripts\core_common\healthoverlay.gsc;
#include scripts\core_common\visionset_mgr_shared.gsc;
#include scripts\zm_common\zm.gsc;

// #include scripts\zm\weapons\zm_weap_homunculus.gsc;
// #include scripts\zm\weapons\zm_weap_cymbal_monkey.gsc;

#namespace GSCSide;

autoexec __init__sytem__()
{
	system::register("GSCSide", &__init__, &__main__, undefined);

    //setGametypeSetting(#"zmperksdeathdash", false); // useless perk and causes errors (19) < fixed i hope

    level.RushModActive = true; // ffs

    thread ConfigLogic();
    thread OutOfBounds();
    thread CreateHuds();
    thread LUIErrorDetector();

    //thread gofuckyouself();

    #ifdef _SUPPORTS_DETOURS
    thread init_detours();
    #endif

    level.DeleteLogic = [];
    level.ObjectsLimits = [];
    level.ErrorCheck = false;
    
    // if no detours, for ee enabled
    setGametypeSetting(#"hash_3c5363541b97ca3e", 1); // ee enabled
    setDvar(#"zm_ee_enabled", 1);
    setDvar(#"zm_debug_ee", 0); // revert IX fast ee
    setDvar(#"hash_2b64162aa40fe2bb", 0); // ^

    // no contract
    level.var_aa2d5655 = undefined;
    // can xp
    level.var_5164a0ca = undefined;
    // xp multi
    level.var_3426461d = &GetXPMultiplier; // has to be done even with detours
    // disable ee
    level.var_73d1e054 = undefined;
    // end game mode type
    level.var_211e3a53 = undefined;
}

__main__()
{
    //
}

__init__()
{
    // functions
    thread BotStuff();
    thread RegisterPowerups();

    // clientfields
    // count
    //clientfield::register("toplayer", "" + #"zombies_counter_alive", 1, 6, "int");
    //clientfield::register("toplayer", "" + #"zombies_counter_remaining", 1, 7, "int");

    // rush things
    //clientfield::register("toplayer", "" + #"rush_counter_int", 1, 6, "int");
    //clientfield::register("toplayer", "" + #"rush_event_text", 1, 6, "int");
    //clientfield::register("toplayer", "" + #"rush_quest_detect_text", 1, 6, "int");

    // test
    clientfield::register("toplayer", "" + #"test_csc_m", 1, 2, "int");

    // callbacks
    callback::on_start_gametype(&init);
    callback::on_connect(&onPlayerConnect);
    callback::on_spawned(&onPlayerSpawnedSetup);
}