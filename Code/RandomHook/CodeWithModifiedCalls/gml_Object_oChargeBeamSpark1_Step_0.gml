if (!instance_exists(oCharacter))
{
    instance_destroy()
    exit
}
if (oCharacter.chargebeam == 0)
    instance_destroy()
else
{
    x = oCharacter.x + oCharacter.aspr2x
    y = oCharacter.y + oCharacter.aspr2y
    if (oCharacter.aimdirection == 0)
        x += 2
    if (oCharacter.aimdirection == 1)
        x -= 2
    if (oCharacter.aimdirection == 2)
    {
        x += 3
        y -= 3
    }
    if (oCharacter.aimdirection == 3)
    {
        x -= 3
        y -= 3
    }
    if (oCharacter.aimdirection == 4)
    {
        x += 3
        y += 3
    }
    if (oCharacter.aimdirection == 5)
    {
        x -= 3
        y += 3
    }
    if (oCharacter.aimdirection == 6)
        y -= 2
    if (oCharacter.aimdirection == 7)
        y += 2
    if (oCharacter.chargebeam >= 1)
    {
        if (sprite_index == sChargeBeamSpark1)
            sprite_index = sChargeBeamSpark1B
        if (sprite_index == sChargeWBeamSpark1)
            sprite_index = sChargeWBeamSpark1B
        if (sprite_index == sChargePBeamSpark1)
            sprite_index = sChargePBeamSpark1B
        if (sprite_index == sChargeIBeamSpark1)
            sprite_index = sChargeIBeamSpark1B
    }
    if (instance_number(oChargeBeamSpark2) < 4)
        instance_create((x + 30 - tas_random(60)), (y + 30 - tas_random(60)), oChargeBeamSpark2)
}
if (instance_exists(oPickup) && oCharacter.chargebeam >= 1)
{
    with (oPickup)
    {
        if (distance_to_object(oChargeBeamSpark1) < 100)
        {
            if (oCharacter.x > x)
                x += 1
            else
                x -= 1
            if ((oCharacter.y - 20) > y)
                y += 1
            else
                y -= 1
        }
        if (distance_to_object(oChargeBeamSpark1) < 70)
        {
            if (oCharacter.x > x)
                x += 1
            else
                x -= 0.5
            if ((oCharacter.y - 20) > y)
                y += 1
            else
                y -= 0.5
        }
        if (distance_to_object(oChargeBeamSpark1) < 40)
        {
            if (oCharacter.x > x)
                x += 1
            else
                x -= 0.5
            if ((oCharacter.y - 20) > y)
                y += 1
            else
                y -= 0.5
        }
    }
}
