LUIErrorDetector()
{
    while(true)
    {
        setdvar(#"rush_error_code", "No Error");
        setdvar(#"rush_error_code_type", "No Type");

        while (true)
        {
            waitframe(1);

            str_error = getdvarstring(#"rush_error_code");
            str_type = getdvarstring(#"rush_error_code_type");
            
            if(str_error != "No Error" && str_type != "No Type")
            {
                foreach(player in level.players)
                {
                    player iPrintLnBold("^1an " + str_type + " has Occurred! -> ^2" + str_error);
                    player iPrintLn("^1an " + str_type + " has Occurred! -> ^2" + str_error);
                }
            }

            setdvar(#"rush_error_code", "No Error");
        }
    }
}

DevGUIZombie()
{
    level thread PrintGUIBold();
    level thread PrintGUILn();
    level thread CommandsGUI();
}

PrintGUIBold()
{
    setdvar(#"printbold", "Print anything (bold)");
    while (true)
    {
        waitframe(1);
        str_command = getdvarstring(#"printbold");
        if(str_command != "Print anything (bold)")
        {
            CurrentPrint = getdvarstring(#"printbold");
            foreach(player in level.players)
            {
                player iPrintLnBold(CurrentPrint);
            }
        }
        setdvar(#"printbold", "Print anything (bold)");
    }
}

PrintGUILn()
{
    setdvar(#"println", "Print anything");
    while (true)
    {
        waitframe(1);
        str_command = getdvarstring(#"println");
        if(str_command != "Print anything")
        {
            CurrentPrint = getdvarstring(#"println");
            foreach(player in level.players)
            {
                player iPrintLn(CurrentPrint);
            }
        }
        setdvar(#"println", "Print anything");
    }
}

CommandsGUI()
{
    setdvar(#"devgui", "any command");
    while (true)
    {
        waitframe(1);
        str_command = getdvarstring(#"devgui");
        switch(str_command)
        {
            case "god":
            foreach(player in level.players)
            {
                player thread GodmodeGUI();
            }
            break;

            case "ufo":
            foreach(player in level.players)
            {
                player thread NoclipToggle(player);
            }
            break;
        }
        setdvar(#"devgui", "any command");
    }
}

GodmodeGUI()
{
    self.godmode = isDefined(self.godmode) ? undefined : true;
    
    if(isDefined(self.godmode))
    {
        self endon("disconnect");

        self iPrintLnBold("god enabled");
        while(isDefined(self.godmode)) 
        {
            self EnableInvulnerability();
            wait 0.1;
        }
    }
    else
    {
        self DisableInvulnerability();
        self iPrintLnBold("god disabled");
    }
}