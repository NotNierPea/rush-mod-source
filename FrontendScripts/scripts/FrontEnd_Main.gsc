#include scripts\core_common\system_shared;
#include scripts\core_common\clientfield_shared;
#include scripts\core_common\callbacks_shared;
#include scripts\core_common\util_shared;

#namespace GSCFront;

autoexec __init__system__() 
{
    if (util::is_frontend_map())
    {
        thread FrontendStuff();
    }
}

FrontendStuff()
{
    wait 15;
    iPrintLn("^3FrontMod Main - Loaded GSC, CSC!");
    iPrintLn("^2Dvar Commands: timescale_front, stop_scripts");

    thread Dvars();
}

Dvars()
{
    setDvar("stop_scripts", 0);
    setDvar("timescale_front", 1);

    lastdvartime = -1;

    for(;;)
    {
        if(getDvar("stop_scripts"))
            break;

        dvartime = getDvarFloat("timescale_front", 1);
        
        if(dvartime != lastdvartime)
        {
            TimeScale(dvartime);
            lastdvartime = dvartime;
        }
        
        wait 0.1;
    }
}

TimeScale(Scale)
{
    setslowmotion(1, Scale, 0);
}