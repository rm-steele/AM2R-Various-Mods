alarm[0] = 1
w = instance_create((x + tas_random(64)), (global.waterlevel - 1), oFXAnimSpark)
w.image_speed = 0.25 + tas_random(0.5)
w.additive = 0
w.sprite_index = sWaterSplash
w.image_alpha = 0.8
w.depth = -15
with (w)
{
    if (x < view_xview[0] || x > (view_xview[0] + view_wview[0]))
        instance_destroy()
}
