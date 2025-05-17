var i, meta, num;

for(i = vk_numpad0; i <= vk_numpad9; i++)
{
    if(keyboard_check_pressed(i))
    {
        if (!keyboard_check(vk_alt))
        {
            game_save(string(i - vk_numpad0) + ".state")
            // maybe will need to be used in the future
            // statemeta = file_text_open_write(string(i - vk_numpad0) + ".state.meta")
        }
        else if (file_exists(string(i - vk_numpad0) + ".state"))
            {
                reRecordCount++
                meta = file_text_open_write("tas.meta")
                file_text_write_string(meta, string(reRecordCount))
                file_text_close(meta)
                game_load(string(i - vk_numpad0) + ".state")
                // statemeta = file_text_open_read(string(i - vk_numpad0) + ".state.meta")
                meta = file_text_open_write("aaastateloadedeveryonepanic")
                file_text_close(meta)
            }
    }
}