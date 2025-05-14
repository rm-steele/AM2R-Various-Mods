alarm[1] = 2
if failing
{
    if (failtime > 0)
    {
        image_alpha = tas_random(0.3)
        failtime -= 1
    }
    else
    {
        failing = 0
        image_alpha = 0.3
    }
}
