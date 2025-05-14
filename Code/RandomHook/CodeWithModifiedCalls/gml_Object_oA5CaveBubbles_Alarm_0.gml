bubble = instance_create(x, (y + (tas_random_range(-16, 16))), oLBubble)
if instance_exists(bubble)
{
    bubble.hspeed = tas_random_range(2, 7)
    bubble.vspeed = 0
    bubble.alarm[0] = 180 + tas_random(300)
    bubble.depth = 85
}
alarm[0] = 2
