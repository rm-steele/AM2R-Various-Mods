make_explosion3(x, y)
repeat (8 + floor(tas_random(4)))
{
    bubble = instance_create(x, y, oLBubble)
    if instance_exists(bubble)
    {
        bubble.hspeed = tas_random_range(-2.5, 2.5)
        bubble.vspeed = (-tas_random(0.4))
    }
}
sfx_play(sndMissileExpl)
instance_destroy()
