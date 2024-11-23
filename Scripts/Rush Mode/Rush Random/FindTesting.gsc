findzmspawners()
{
    self endon(#"disconnect", #"death");

    spawners = getentarray("zombie_spawner", "script_noteworthy");
    for (i = 0; i < spawners.size; i++)
    {
        self iPrintlnBold("spawner:  " +spawners[i].origin);
        util::spawn_model("p7_zm_vending_widows_wine", spawners[i].origin + (0, 0, 0));
        self dontinterpolate();
        self setorigin(spawners[i].origin);
    }
}

SpawnModelTest(id) // test
{
    switch(id)
    {
        case 1:
        util::spawn_model("p8_wz_ep_homunculus", self.origin + (0, 0, 0));
        break;

        case 2:
        util::spawn_model(#"hash_597bdc83a7c9e8c", self.origin + (0, 0, 0));
        break;

        case 3:
        util::spawn_model(#"hash_32a51dafb1c7344f", self.origin + (0, 0, 0));
        break;

        case 4:
        util::spawn_model("p8_fxanim_zm_zod_magic_box_mod", self.origin + (0, 0, 0));
        break;

        case 5:
        util::spawn_model("hash_678aaf8e37498e9a", self.origin + (0, 0, 0));
        break;
    }
}

RotateHomunculus()
{
    level endon(#"end_game", #"game_ended");

    Hum = [];

    for (i = 1; i < 10; i++)
    {
        Hum[i] = util::spawn_model("p8_wz_ep_homunculus", self.origin + (65 * i, 0, 0));
        Hum[i] SetScale(5);
    }

    while(true)
    {
        for (i = 1; i < 10; i++)
        {
            Hum[i] moveto(Hum[i].origin + (0, 0, i * 100), 3, 2, 0.5);
        }
        wait 2;
        for (i = 1; i < 10; i++)
        {
            Hum[i] moveto(Hum[i].origin + (0, 0, i * -100), 3, 2, 0.5);
        }
        wait 2;
    }
}

findmodel1() // test
{
    model = getent("p8_zm_zod_light_morse_lamp_full", "targetname");
    for (i = 0; i < model.size; i++)
    {
        self iPrintlnBold("spawner:  " +model[i].origin);
        util::spawn_model("p7_zm_vending_widows_wine", model[i].origin + (0, 0, 0));
        self dontinterpolate();
        self setorigin(model[i].origin);
    }
}