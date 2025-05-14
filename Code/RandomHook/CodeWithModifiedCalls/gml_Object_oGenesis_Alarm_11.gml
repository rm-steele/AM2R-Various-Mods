repeat (8)
{
    expl = instance_create((x - 16 + tas_random(32)), (y - tas_random(80)), oFXAnimSpark)
    expl.image_speed = 0.3 + tas_random(0.5)
    expl.additive = 0
    expl.sprite_index = sExpl1
}
instance_create(x, y, oScreenFlash)
sfx_play(sndMissileExpl)
spawn_many_powerups((x - 40), (y - 64), 80, 64)
mus_current_fadein()
with (oDoor)
    event_user(3)
with (oA8RedLightFX)
    fadeout = 1
make_explosion4(x, y)
instance_destroy()
