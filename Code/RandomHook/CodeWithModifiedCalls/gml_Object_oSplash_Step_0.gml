y = global.waterlevel
if (global.watertype == 0 && instance_exists(oWater))
    y += oWater.yoffset
if instance_exists(oCharacter)
{
    if (oCharacter.y > (global.waterlevel + global.wateroffset))
        instance_create((oCharacter.x + (tas_random_range(-6, 6))), (oCharacter.y + (tas_random_range(-20, 8))), oLBubble)
}
