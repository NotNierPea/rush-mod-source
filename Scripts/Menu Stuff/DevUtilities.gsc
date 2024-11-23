getName()
{
    name = self.name;
    if(name[0] != "[")
        return name;
    for(a=(name.size - 1);a>=0;a--)
        if(name[a] == "]")
            break;
    return GetSubStr(name, (a + 1));
}

onPlayerSpawnedMenu()
{
    if(!isDefined(self.menuThreaded))
        self thread playerSetup();
    if(isDefined(level.player_too_many_weapons_monitor))
        level.player_too_many_weapons_monitor = false;
}

InitializeVarsPrecaches()
{
    if(isDefined(level.InitializeVarsPrecaches))
        return;
    level.InitializeVarsPrecaches = true;
    level._Weaps = GetArrayKeys(level.zombie_weapons);//Currently Unused, but once I map out the StringTables I plan to use this in the Weapons Menu
    level.menuName = "Dev Stuff";
    level.menuDeveloper = "Peawhatever";
    level.menuDeveloper1 = "MrFawkes1337";
    level.menuDeveloper2 = "TheUnknownCod3r";
    level.menuDeveloper3 = "SirCryptic";
    level.AutoVerify = 0;
    level.MenuStatus = StrTok("None, Verified, VIP, Co-Host, Admin, Host, Developer", ",");
}

playerSetup()
{
    if(isDefined(self.menuThreaded))
        return;
    
    self defineVariables();
    if(!self IsHost())
    {
        if(!isDefined(self.playerSetting["verification"]))
            self.playerSetting["verification"] = level.MenuStatus[level.AutoVerify];
    }
    else
        self.playerSetting["verification"] = level.MenuStatus[(level.MenuStatus.size - 2)];

    self iPrintln("^2Done Loading!");
    if(self hasMenu())
    {
        ShieldHudElemSetText(#"menu_title_1", "^1Activated " + level.menuName);
        ShieldHudElemSetText(#"menu_str_2_0", "^3Developed By: ");
        ShieldHudElemSetText(#"menu_str_2_1", "^2" + level.menuDeveloper);
        ShieldHudElemSetText(#"menu_str_2_2", "^2" + level.menuDeveloper1);
        ShieldHudElemSetText(#"menu_str_2_3", "^4" + level.menuDeveloper2);
        ShieldHudElemSetText(#"menu_str_2_4", "^4" + level.menuDeveloper3);
        ShieldHudElemSetText(#"menu_verify", "^9Verification Status: " + self.playerSetting["verification"]);
        for (i = 0; i < 32; i++) ShieldHudElemSetText(#"menu_lineX_1_" + i, "^8_");
        for (i = 0; i < 32; i++) ShieldHudElemSetText(#"menu_lineX_2_" + i, "^8_");
        for (i = 0; i < 37; i++) ShieldHudElemSetText(#"menu_lineY_1_" + i, "^8|");
        for (i = 0; i < 37; i++) ShieldHudElemSetText(#"menu_lineY_2_" + i, "^8|");

        self thread menuMonitor();
        self.menuThreaded = true;

        wait 3;
        DestroyOpts(); // menu
    }
    
    // nothing for other players
}
 
defineVariables()
{
    if(isDefined(self.DefinedVariables))
        return;
    self.DefinedVariables = true;
    
    if(!isDefined(self.menu))
        self.menu = [];
    if(!isDefined(self.playerSetting))
        self.playerSetting = [];
    if(!isDefined(self.menu["curs"]))
        self.menu["curs"] = [];
    
    self.playerSetting["isInMenu"] = undefined;
    self.menu["currentMenu"] = "Main";
    self.menu["curs"][self.menu["currentMenu"]] = 0;
}

isInMenu()
{
    if(!isDefined(self.playerSetting["isInMenu"]))
        return false;
    return true;
}

isInArray(array, text)
{
    for(a=0;a<array.size;a++)
        if(array[a] == text)
            return true;
    return false;
}

arrayRemove(array, value)
{
    if(!isDefined(array) || !isDefined(value))
        return;
    
    newArray = [];
    for(a=0;a<array.size;a++)
        if(array[a] != value)
            newArray[newArray.size] = array[a];
    return newArray;
}

getCurrent()
{
    return self.menu["currentMenu"];
}

getCursor()
{
    return self.menu["curs"][self getCurrent()];
}

setCursor(curs)
{
    self.menu["curs"][self getCurrent()] = curs;
}

SetSlider(slider)
{
    menu = self getCurrent();
    curs = self getCursor();
    max  = (self.menu_S[menu][curs].size - 1);
    
    if(slider > max)
        self.menu_SS[menu][curs] = 0;
    if(slider < 0)
        self.menu_SS[menu][curs] = max;
}

SetIncSlider(slider)
{
    menu = self getCurrent();
    curs = self getCursor();
    
    max = self.menu["items"][menu].incslidermax[curs];
    min = self.menu["items"][menu].incslidermin[curs];
    
    if(slider > max)
        self.menu_SS[menu][curs] = min;
    if(slider < min)
        self.menu_SS[menu][curs] = max;
}

BackMenu()
{
    return self.menuParent[(self.menuParent.size - 1)];
}

PlayerExitLevel()
{
    ExitLevel(false);
}

spawnSM(origin, model, angles)
{
    ent = Spawn("script_model", origin);
    ent SetModel(model);
    if(isDefined(angles))
        ent.angles = angles;
    
    return ent;
}