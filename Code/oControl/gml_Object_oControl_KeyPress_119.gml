if (frame > 60)
{
    popup_text("Rec Stop")
    global.tasMode = 0
    file_text_close(fid)
    // file_text_close(log)
}
