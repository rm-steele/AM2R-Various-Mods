if (damaged == 0)
{
    image_angle = direction
    if (canfire && cooldown == 0)
    {
        if (charge_frame < 22)
            charge_frame += 0.25
        else
        {
            shots = 3
            alarm[2] = 30
            cooldown = 230
            with (oTank)
                tgt_aangle = 20
        }
    }
    if (cooldown > 0)
    {
        cooldown -= 1
        if (cooldown == 100)
            charge_frame = 0
    }
}
if (shaking > 0)
{
    shaking -= 1
    offx = tas_random_range(-1, 1)
    offy = tas_random_range(-1, 1)
}
else
{
    offx = 0
    offy = 0
}
if (flashing > 0)
    flashing -= 1
if (knockback > 0)
{
    knockback -= 1
    with (oTank)
        aangle -= 5
}
if damaged
{
    if (image_angle > 180)
        image_angle -= 360
    if (image_angle > 0)
        image_angle -= 1
    if (image_angle < 0)
        image_angle += 1
}
