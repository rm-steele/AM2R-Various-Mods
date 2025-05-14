if global.ingame
{
    if shaking
    {
        if (global.classicmode == 0)
        {
            view_xport[0] = round(tas_random(3))
            view_yport[0] = round(tas_random(3))
        }
        if (global.classicmode == 1)
        {
            view_xport[0] = 80 + round(tas_random(3))
            view_yport[0] = 40 + round(tas_random(3))
        }
    }
    time += 0.2
    screenalpha = cos(time) * 0.5
}
