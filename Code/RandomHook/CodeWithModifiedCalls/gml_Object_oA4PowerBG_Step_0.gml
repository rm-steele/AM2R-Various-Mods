if (global.event[200] > 0)
{
    if (flicker > 0)
    {
        afx = tas_random(1)
        flicker -= 1
    }
    else
        afx = tas_random(0.3)
    if (image_alpha < 1)
        image_alpha += 0.02
}
