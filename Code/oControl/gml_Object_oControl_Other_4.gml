writelog("Loading Room " + string(room))
if (room != rm_transition)
{
    if (global.ingame == 1 && instance_number(oCharacter) == 0)
    {
        samus = instance_create(global.save_x, global.save_y, oCharacter)
        with (samus)
            juststarted = 100
        mus_intro_fanfare()
    }
    if (global.ingame == 1)
    {
        room_persistent = false
        if quitgame
        {
            quitgame = 0
            remove_persistent_objects()
            sfx_stop_all()
            global.ingame = 0
            global.darkness = 0
            if (reloadgame == 0)
                room_goto(titleroom)
            else
            {
                global.newgame = 0
                room_goto(rm_loading)
            }
            exit
        }
        ApplyLightPreset()
        Unmute_Loops()
        if instance_exists(oCharacter)
        {
            with (oCharacter)
                persistent = 1
        }
        if instance_exists(oCamera)
        {
            with (oCamera)
                persistent = 1
        }
        if instance_exists(oNotification)
        {
            with (oNotification)
                persistent = 1
        }
        if instance_exists(oScanMetroid)
        {
            with (oScanMetroid)
                persistent = 1
        }
    }
}
malpha = 1
fadedone = 0
if (room == rm_transition)
    fadedone = 1

if (room == rm_controller)
{
    if (global.tasMode == 1)
        init_recordInputs()
    else if (global.tasMode == 2)
        init_playbackInputs()
}
if tasInitialized
{
    file_text_write_string(log, "entered room " + room_get_name(room) + " on tas frame " + string(frame))
    file_text_writeln(log)
}