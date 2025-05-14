var i;
for(i = vk_numpad0; i <= vk_numpad9; i++)
{
    if(keyboard_check_pressed(i))
    {
        if (!keyboard_check(vk_alt))
            game_save(string(i - vk_numpad0) + ".state")
        else
        {
            if (file_exists(string(i - vk_numpad0) + ".state"))
                game_load(string(i - vk_numpad0) + ".state")
        }
    }
}