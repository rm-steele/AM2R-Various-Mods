var tgty;
if (state == 0)
{
    scale = 0.5
    image_blend = c_black
    if (point_distance(x, y, oCharacter.x, (oCharacter.y - 16)) < 90)
    {
        state = 1
        statetime = 0
    }
}
if (state == 1)
{
    if (col < 255)
        col += 5
    image_blend = make_colour_rgb(col, col, col)
    if (scale < 1)
        scale += 0.01
    else
    {
        scale = 1
        state = 2
        statetime = 0
    }
}
if (state == 2)
{
    iframe = 0
    if (dontfollow == 0)
    {
        targetx = oCharacter.x
        if (oCharacter.mask_index == sMask1)
            targety = oCharacter.y - 20
        if (oCharacter.mask_index == sMask3)
            targety = oCharacter.y - 15
        if (oCharacter.mask_index == sMask4)
            targety = oCharacter.y - 10
    }
    else
    {
        targetx = oCharacter.x + (tas_random_range(-80, 80))
        targety = oCharacter.y - 40 - tas_random(60)
    }
    safex = x
    safey = y
    if (targety > y)
        yVel += 0.1
    if ((targety - 24) < y)
        yVel -= 0.1
    if (targetx > x)
        xVel += 0.1
    if (targetx < x)
        xVel -= 0.1
    if ((isCollisionRight(1) && xVel > 0) || (isCollisionLeft(1) && xVel < 0))
        xVel = 0
    if ((isCollisionBottom(1) && yVel > 0) || (isCollisionTop(1) && yVel < 0))
        yVel = 0
    if (xVel > 3)
        xVel = 3
    if (xVel < -3)
        xVel = -3
    if (yVel > 3)
        yVel = 3
    if (yVel < -3)
        yVel = -3
    if (tas_random(10) < 1)
    {
        xVel += tas_choose(0.2, -0.2)
        yVel += tas_choose(0.2, -0.2)
    }
    if collision_rectangle((x - 20), (y - 18), (x + 20), (y + 12), oMetroid, 1, 1)
    {
        if (other.x < x)
            xVel += 0.1
        else
            xVel -= 0.1
        if (other.y < y)
            yVel += 0.1
        else
            yVel -= 0.1
    }
    moveTo(xVel, yVel)
}
if (state == 3)
{
    if (oCharacter.mask_index == sMask1)
        tgty = oCharacter.y - 40
    if (oCharacter.mask_index == sMask3)
        tgty = oCharacter.y - 32
    if (oCharacter.mask_index == sMask4)
        tgty = oCharacter.y - 24
    x = lerp(x, oCharacter.x, 0.4)
    y = lerp(y, tgty, 0.4)
    with (oCharacter)
        metroid_drain = 2
    xVel = 0
    speed = 0
    with (oMetroid)
    {
        if (state == 2)
            dontfollow = 2
    }
    iframe += 0.5
    if (iframe > 2)
        iframe = 0
}
if (state == 4)
{
    if (statetime == 0)
    {
        vspeed = -6
        if (oCharacter.facing == 18)
            hspeed = 6
        else
            hspeed = -6
        sfx_play(sndMetroidStun)
        iframe = 0
    }
    if (statetime < 30)
        speed *= 0.9
    if (statetime == 30)
    {
        gravity = 0.1
        gravity_direction = point_direction(x, y, safex, safey)
    }
    if (isCollisionBottom(1) == 0 && isCollisionTop(1) > 0)
    {
        y += 1
        vspeed = 0.5
    }
    if (isCollisionBottom(1) > 0 && isCollisionTop(1) == 0)
    {
        y -= 1
        vspeed = -0.5
    }
    if (isCollisionRight(1) == 0 && isCollisionLeft(1) > 0)
    {
        x += 1
        hspeed = 0.5
    }
    if (isCollisionRight(1) > 0 && isCollisionLeft(1) == 0)
    {
        x -= 1
        hspeed = -0.5
    }
    if (statetime > 30)
    {
        if (isCollisionRight(1) == 0 && isCollisionLeft(1) == 0 && isCollisionBottom(1) == 0 && isCollisionTop(1) == 0 && collision_rectangle((x - 20), (y - 18), (x + 20), (y + 12), oSolid, 1, 1) == -4)
        {
            state = 2
            statetime = -1
            gravity = 0
            speed = 0
        }
    }
    if (speed > 3)
        speed = 3
}
if (state == 5)
{
    if (statetime == 0)
    {
        iframe = 0
        speed = 0
        gravity = 0.1
        gravity_direction = point_direction(x, y, safex, safey)
    }
    if (speed > 3)
        speed = 3
    if (isCollisionBottom(1) == 0)
    {
        yVel += 0.1
        if (yVel > 5)
            yVel = 5
    }
    else
    {
        xVel *= 0.8
        yVel = 0
    }
    if (isCollisionRight(1) > 0 || isCollisionLeft(1) > 0)
        xVel = 0
    if (isCollisionBottom(0) == 0 && isCollisionTop(1) > 0)
    {
        y += 1
        vspeed = 0.5
    }
    if (isCollisionBottom(0) > 0 && isCollisionTop(1) == 0)
    {
        y -= 1
        vspeed = -0.5
    }
    if (isCollisionRight(1) == 0 && isCollisionLeft(1) > 0)
    {
        x += 1
        hspeed = 0.5
    }
    if (isCollisionRight(1) > 0 && isCollisionLeft(1) == 0)
    {
        x -= 1
        hspeed = -0.5
    }
    if (isCollisionRight(1) == 0 && isCollisionLeft(1) == 0 && isCollisionBottom(0) == 0 && isCollisionTop(1) == 0 && collision_rectangle((x - 20), (y - 18), (x + 20), (y + 12), oSolid, 1, 1) == -4)
    {
        gravity = 0
        speed = 0
    }
    if (statetime > freezetime)
    {
        state = 2
        statetime = -1
    }
    moveTo(xVel, yVel)
}
shell_frame = (!shell_frame)
if (state != 5)
    fangs_frame = anim_frame_cycle(sMetroidFangs, fangs_frame, fangs_frspd)
if (state != 5)
    i += 0.02
if (i > 99999999)
    i = 0
j = sin(i) * 0.1
eyes_scale = (0.9 + j) * scale
fangs_x = x + (lengthdir_x((fangs_yoff * scale), (image_angle + 270)))
fangs_y = y + (lengthdir_y((fangs_yoff * scale), (image_angle + 270)))
eyes_x = x + (lengthdir_x((4 * scale), (image_angle + 90)))
eyes_y = y + (lengthdir_y((4 * scale), (image_angle + 90)))
image_angle = xVel * hspeed * -2
statetime += 1
if (flashing > 0)
    flashing -= 1
if (fxtimer < 5)
    fxtimer += 1
else
    fxtimer = 0
if (dontfollow > 0)
    dontfollow -= 1
