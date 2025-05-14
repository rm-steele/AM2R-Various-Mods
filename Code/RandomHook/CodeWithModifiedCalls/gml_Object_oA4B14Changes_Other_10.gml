tile_layer_delete(-101)
with (130180)
    instance_destroy()
repeat (10)
    make_explosion1big((48 + tas_random(64)), tas_random(192))
repeat (20)
{
    debr = instance_create(80, (64 + tas_random(100)), oMetalDebrisBig)
    debr.direction = tas_random_range(30, -30)
    debr.speed = 2 + tas_random(3)
    debr.alarm[0] = 60 + tas_random(60)
}
expl = instance_create(80, 120, oExplosionSmoke)
expl.explosions = 10
expl.expl_dir = 0
expl.expl_spd = 3
expl.width = 64
expl.height = 128
make_explosion1big(272, 32)
with (130179)
    y -= 240
global.event[203] = 8
sfx_play(sndA4Expl)
active = 1
