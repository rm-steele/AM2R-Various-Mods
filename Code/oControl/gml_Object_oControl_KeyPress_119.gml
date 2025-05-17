var i, fid;
if (frame > 60)
{
    popup_text("Rec Stop")
    global.tasMode = 0
    tasInitialized = 0
    fid = file_text_open_write(filename)
    file_text_write_string(fid, string(global.startingRNGSeed))
    file_text_writeln(fid)
    for (i = 0; i < frame; i++)
    {
        if (inputs[i] != "")
        {
            file_text_write_string(fid, string(i))
            file_text_writeln(fid)
            file_text_write_string(fid, inputs[i])
            file_text_writeln(fid)
        }
    }
    file_text_close(fid)
    // file_text_close(log)
}
