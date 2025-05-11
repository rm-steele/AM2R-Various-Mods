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
draw_set_font(fontMenuTiny)
draw_set_color(c_white)
draw_set_alpha(0.6)
draw_set_halign(fa_right)
draw_set_alpha(1)
draw_set_halign(fa_left)

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
}
