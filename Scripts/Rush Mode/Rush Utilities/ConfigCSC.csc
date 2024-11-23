ConfigLogic()
{
    // csc
    
    /#
    // ?? - commands
        // save object into a json file, if object is undefined, the file is deleted
        ShieldToJson(string name, object object = undefined);
        // get an object from a json, if the file doesn't exist, the function returns undefined
        ShieldFromJson(string name) -> object;
        // delete a json
        ShieldRemoveJson(string name);
    #/

    /#
    level.Saves = ShieldFromJson("T8BankSettings");
    if(!isDefined(level.Saves)) // if its first time loading the mod.....
    {
        level.Saves = {
        #Money: 2500
        };
    }
    #/
    
    /#
    level.ConfigRush = ShieldFromJson("RushModT8");
    if(!isDefined(level.ConfigRush))
    {
        level.ConfigRush = 
        {
            #Test: false
        };
    }

    ShieldToJson("RushModT8", level.ConfigRush);
    #/
}