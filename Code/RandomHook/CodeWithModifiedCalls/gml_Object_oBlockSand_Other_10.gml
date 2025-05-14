repeat (2)
{
    smk = instance_create((x + 2 + tas_random(10)), (y + 2 + tas_random(10)), oFXAnimSpark)
    smk.image_speed = 0.6 + tas_random(0.7)
    smk.additive = 0
    smk.sprite_index = sSmoke1
    smk.image_alpha = 0.4
    smk.direction = 250 + tas_random(40)
    smk.speed = tas_random(1)
    smk.depth = -101
}
alarm[0] = 1
sfx_stop(sndBlockDestroy)
sfx_play(sndBlockDestroy)
instance_destroy()
