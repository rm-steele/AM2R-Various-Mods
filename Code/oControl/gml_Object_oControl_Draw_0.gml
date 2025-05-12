var inputDisplayBaseX, inputDisplayBaseY;
inputDisplayBaseX = 232 + view_xview[0]
inputDisplayBaseY = 192 + view_yview[0]
if (fadedone < 1 && room != initroom)
{
    if (global.transitiontype < 2)
    {
        draw_set_alpha(1 - fadedone)
        draw_set_color(c_black)
        draw_rectangle(0, 0, room_width, room_height, false)
        if (instance_exists(oCharacter) && global.transitiontype == 1)
            draw_character(oCharacter.sprite_index, oCharacter.x, oCharacter.y, oCharacter.aspr1, oCharacter.asprx, oCharacter.aspry, oCharacter.aspr2, oCharacter.aspr2x, oCharacter.aspr2y, oCharacter.aspr2a, oCharacter.mirror, oCharacter.image_blend, (1 - fadedone), oCharacter.armmsl, oCharacter.image_index)
        fadedone += 0.1
    }
}
draw_set_alpha(1)
if showfps
{
    draw_set_font(fontMenuSmall)
    draw_set_color(c_white)
}

draw_set_color(c_white)
draw_set_alpha(1)
draw_set_halign(fa_left)
draw_set_font(fontMenuSmall)
switch (infolevel)
{
    case 3:
        if tasInitialized
        {
            draw_text_shadow((inputDisplayBaseX + 8), (inputDisplayBaseY + 24), string_char_at(control_state, 1)) // left
            draw_text_shadow((inputDisplayBaseX + 24), (inputDisplayBaseY + 24), string_char_at(control_state, 2)) // right
            draw_text_shadow((inputDisplayBaseX + 16), (inputDisplayBaseY + 16), string_char_at(control_state, 3)) // up
            draw_text_shadow((inputDisplayBaseX + 16), (inputDisplayBaseY + 32), string_char_at(control_state, 4)) // down

            draw_text_shadow((inputDisplayBaseX + 40), (inputDisplayBaseY + 24), string_char_at(control_state, 12)) // start

            draw_text_shadow((inputDisplayBaseX + 56), (inputDisplayBaseY + 24), string_char_at(control_state, 7)) // fire
            if (global.ingame)
                draw_text_shadow((inputDisplayBaseX + 64), (inputDisplayBaseY + 32), string_char_at(control_state, 6)) // jump
            else
                draw_text_shadow((inputDisplayBaseX + 64), (inputDisplayBaseY + 32), string_char_at(control_state, 15)) // menu 1
            draw_text_shadow((inputDisplayBaseX + 64), (inputDisplayBaseY + 16), string_char_at(control_state, 8)) // missile
            if (global.ingame)
                draw_text_shadow((inputDisplayBaseX + 72), (inputDisplayBaseY + 24), string_char_at(control_state, 11)) // select
            else
                draw_text_shadow((inputDisplayBaseX + 72), (inputDisplayBaseY + 24), string_char_at(control_state, 16)) // menu 2

            draw_text_shadow((inputDisplayBaseX + 4), (inputDisplayBaseY + 8), string_char_at(control_state, 9)) // aim
            draw_text_shadow((inputDisplayBaseX + 76), (inputDisplayBaseY + 8), string_char_at(control_state, 10)) // aim 2
            draw_text_shadow((inputDisplayBaseX + 0), (inputDisplayBaseY + 0), string_char_at(control_state, 13)) // walk
            draw_text_shadow((inputDisplayBaseX + 80), (inputDisplayBaseY + 0), string_char_at(control_state, 14)) // morph
        }

    case 2:
        if (instance_exists(oCharacter) && instance_exists(oCamera) && global.ingame)
        {
            i = 0
            debug_draw_var("x: ", oCharacter.x)
            debug_draw_var("y: ", oCharacter.y)
            debug_draw_var("deltaX: ", (oCharacter.x - oCharacter.xprevious))
            debug_draw_var("deltaY: ", (oCharacter.y - oCharacter.yprevious))
            debug_draw_var("xVel: ", oCharacter.xVel)
            debug_draw_var("yVel: ", oCharacter.yVel)
            debug_draw_var("xVelFrac: ", frac(oCharacter.xVel))
            debug_draw_var("yVelFrac: ", frac(oCharacter.yVel))
            debug_draw_var("platTimer: ", oCharacter.time)
            debug_draw_var("rngSeed: ", random_get_seed())
        }
    case 1:
        if (global.tasMode == 1 && tasInitialized)
        {
            draw_text_shadow((view_xview[0] + 4), (view_yview[0] + 224), control_state)
            draw_text_shadow((view_xview[0] + 4), (view_yview[0] + 212), (string(frame) + " - " + string(frames_recorded)))
        }
        else if (global.tasMode == 2 && tasInitialized)
        {
            draw_text_shadow((view_xview[0] + 4), (view_yview[0] + 224), control_state)
            draw_text_shadow((view_xview[0] + 4), (view_yview[0] + 212), string(frame))
        }
    default:
        break
}
