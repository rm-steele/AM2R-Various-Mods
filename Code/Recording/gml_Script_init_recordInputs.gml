filename = "rec.txt"
// fid = file_text_open_write(filename)
control_state = ""
last_state = ""
inputs[0] = ""
frames_recorded = 0
frame = 0
/*
start_room = -1
start_x = -1
start_y = -1
start_state = -1
start_facing = -1
if instance_exists(oCharacter)
{
    initchar = 1
    start_room = room
    start_x = oCharacter.x
    start_y = oCharacter.y
    start_state = oCharacter.state
    start_facing = oCharacter.facing
}
else
    initchar = 0

file_text_write_real(fid, initchar)
file_text_writeln(fid)
file_text_write_real(fid, start_room)
file_text_writeln(fid)
file_text_write_real(fid, start_x)
file_text_writeln(fid)
file_text_write_real(fid, start_y)
file_text_writeln(fid)
file_text_write_real(fid, start_state)
file_text_writeln(fid)
file_text_write_real(fid, start_facing)
file_text_writeln(fid)
if initchar
{
    global.targetx = start_x
    global.offsetx = 0
    global.targety = start_y
    global.offsety = 0
}
*/
popup_text("Rec Start")
tasInitialized = 1