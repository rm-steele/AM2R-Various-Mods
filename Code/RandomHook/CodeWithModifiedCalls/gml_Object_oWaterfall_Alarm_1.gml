alarm[1] = 10
bubble = instance_create((x + tas_random(64)), (global.waterlevel + 10), oLBubble)
if instance_exists(bubble)
{
    bubble.vspeed = 1.5 - tas_random(0.8)
    with (bubble)
    {
        if (x < view_xview[0] || x > (view_xview[0] + view_wview[0]))
            instance_destroy()
    }
}
