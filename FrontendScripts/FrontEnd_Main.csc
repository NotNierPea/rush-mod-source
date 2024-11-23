#include scripts\core_common\system_shared.csc;
#include scripts\core_common\clientfield_shared.csc;
#include scripts\core_common\util_shared.csc;
#include scripts\core_common\scene_shared.csc;
#include scripts\core_common\lui_shared.csc;

#namespace CSCFront;

autoexec __init__system__() 
{
    if (util::is_frontend_map())
    {
        thread FrontendCSC();
    }
}

FrontendCSC()
{
    wait 9.3;
    setDvar("stop_scripts", 0);
    
    ShieldLog("^3Rush Frontend -> Loaded CSC");

    PlaySoundStart();
    SceneFunctions();
}

SceneFunctions()
{
    thread SceneZombieDucks();
}

SceneZombieDucks()
{
    Shots = scene::get_all_shot_names(#"scene_frontend_t8_zombies");

    foreach(Shot in Shots)
     scene::add_scene_func(#"scene_frontend_t8_zombies", &ModelsChange, Shot);
}

ModelsChange(localclientnum, entities) 
{
    if(getDvar("stop_scripts"))
        return;
    
    foreach (ent in entities) 
    {
        if (!isDefined(ent.changedr))
        {
            if (isdefined(ent) && isdefined(ent.model)) 
            {
                ent detachAll();

                switch(randomIntRange(1, 4))
                {
                    case 1:
                    ent setmodel(#"c_t8_mp_spe_ruin_body1_skin1");
                    ent attach(#"c_t8_mp_spe_ruin_heist_head1", "j_head");
                    break;

                    case 2:
                    ent setmodel(#"c_t8_mp_spe_reaper_body1");
                    ent attach(#"c_t8_mp_spe_reaper_head1", "j_head");
                    break;

                    case 3:
                    ent setmodel(#"c_t8_mp_spe_hacker_body1");
                    ent attach(#"c_t8_mp_spe_hacker_head1", "j_head");
                    ent attach("p8_zm_red_floatie_duck", "j_spinelower");
                    break;
                }

                ent.changedr = true;
            }
        }
    }
}


PlaySoundStart()
{
    if(isdefined(level.var_49f26c00.var_ae9da777)) 
        v_origin = level.var_49f26c00.var_ae9da777.origin;
    else 
        v_origin = (0, 0, 0);

    playsound(0, #"hash_2ff41d0510d442c8", v_origin);
}