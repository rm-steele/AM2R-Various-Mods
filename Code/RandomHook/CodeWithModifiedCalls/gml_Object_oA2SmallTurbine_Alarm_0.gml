if lbubbles
{
    b = instance_create((x - 96), (y - 4 - tas_random(24)), oCurrentBubble)
    b.hspeed = 3 + tas_random(1)
    b.xlimit = x
}
if rbubbles
{
    b = instance_create((x + 112), (y - 4 - tas_random(24)), oCurrentBubble)
    b.hspeed = -3 - tas_random(1)
    b.xlimit = x + 32
}
alarm[0] = 5 + tas_random(3)
