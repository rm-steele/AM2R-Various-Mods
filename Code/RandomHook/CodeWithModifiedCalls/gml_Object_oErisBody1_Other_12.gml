if (state != 100)
{
    if instance_exists(oEris)
    {
        with (oEris)
        {
            hp -= 1
            stun = 1
            event_user(2)
        }
    }
    repeat (4 + floor(tas_random(4)))
    {
        bubble = instance_create(x, y, oLBubble)
        if instance_exists(bubble)
        {
            bubble.hspeed = tas_random_range(-1, 1)
            bubble.vspeed = (-tas_random(0.4))
        }
    }
    shaking = 8
}
