repeat (8)
{
    expl = instance_create((x - 16 + tas_random(32)), (y - tas_random(80)), oFXAnimSpark)
    expl.image_speed = 0.3 + tas_random(0.5)
    expl.additive = 0
    expl.sprite_index = sExpl1
}
make_explosion3(x, (y - 40))
repeat (30)
    instance_create(x, (y - 50), oDebris)
instance_create(x, y, oScreenFlash)
sfx_play(sndRobotExpl)
sfx_play(sndMissileExpl)
spawn_many_powerups((x - 64), (y - 120), 120, 128)
mus_current_fadein()
with (oDoor)
    event_user(3)
with (mycam)
    instance_destroy()
with (wings)
    instance_destroy()
instance_destroy()
