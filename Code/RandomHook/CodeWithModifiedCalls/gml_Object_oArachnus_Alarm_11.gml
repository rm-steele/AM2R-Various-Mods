repeat (8)
{
    expl = instance_create((x - 16 + tas_random(32)), (y - tas_random(32)), oFXAnimSpark)
    expl.image_speed = 0.3 + tas_random(0.5)
    expl.additive = 0
    expl.sprite_index = sExpl1
}
make_explosion3(x, (y - 16))
instance_create(x, y, oScreenFlash)
sfx_play(sndEDeath1)
sfx_play(sndMissileExpl)
with (oDoor)
    event_user(3)
global.event[103] = x
instance_create(x, (y - 16), oJumpBallAppear)
spawn_many_powerups(112, 96, 96, 64)
mus_fadeout(musArachnus)
oMusicV2.bossbgm = 0
mus_current_fadein()
instance_destroy()
