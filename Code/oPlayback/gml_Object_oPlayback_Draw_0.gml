draw_set_font(fontMenuSmall)
draw_set_alpha(1)
draw_text_shadow((view_xview[0] + 8), (view_yview[0] + 120), control_state)
draw_text_shadow((view_xview[0] + 8), (view_yview[0] + 136), string(frame))

draw_text_shadow((view_xview[0] + 12), (view_yview[0] + 208), string_char_at(control_state, 1)) // left
draw_text_shadow((view_xview[0] + 28), (view_yview[0] + 208), string_char_at(control_state, 2)) // right
draw_text_shadow((view_xview[0] + 20), (view_yview[0] + 200), string_char_at(control_state, 3)) // up
draw_text_shadow((view_xview[0] + 20), (view_yview[0] + 216), string_char_at(control_state, 4)) // down

draw_text_shadow((view_xview[0] + 44), (view_yview[0] + 208), string_char_at(control_state, 12)) // start

draw_text_shadow((view_xview[0] + 60), (view_yview[0] + 208), string_char_at(control_state, 7)) // fire
if (global.ingame)
    draw_text_shadow((view_xview[0] + 68), (view_yview[0] + 216), string_char_at(control_state, 6)) // jump
else
    draw_text_shadow((view_xview[0] + 68), (view_yview[0] + 216), string_char_at(control_state, 15)) // menu 1
draw_text_shadow((view_xview[0] + 68), (view_yview[0] + 200), string_char_at(control_state, 8)) // missile
if (global.ingame)
    draw_text_shadow((view_xview[0] + 76), (view_yview[0] + 208), string_char_at(control_state, 11)) // select
else
    draw_text_shadow((view_xview[0] + 76), (view_yview[0] + 208), string_char_at(control_state, 16)) // menu 2

draw_text_shadow((view_xview[0] + 8), (view_yview[0] + 192), string_char_at(control_state, 9)) // aim
draw_text_shadow((view_xview[0] + 80), (view_yview[0] + 192), string_char_at(control_state, 10)) // aim 2
draw_text_shadow((view_xview[0] + 4), (view_yview[0] + 184), string_char_at(control_state, 13)) // walk
draw_text_shadow((view_xview[0] + 84), (view_yview[0] + 184), string_char_at(control_state, 14)) // morph
