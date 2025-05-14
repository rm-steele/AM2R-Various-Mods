if global.ingame
{
    if (delay > 0)
        delay -= 1
    else
        shaking = 1
    if shaking
    {
        if (global.classicmode == 0)
        {
            view_xport[0] = round(tas_random(intensity))
            view_yport[0] = round(tas_random(intensity))
        }
        if (global.classicmode == 1)
        {
            view_xport[0] = 80 + round(tas_random(intensity))
            view_yport[0] = 40 + round(tas_random(intensity))
        }
        duration -= 1
        if (duration <= 0)
            event_user(0)
    }
}
