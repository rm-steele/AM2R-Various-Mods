repeat (10)
{
    expl = instance_create((x - 16 + tas_random(32)), (y - 16 + tas_random(32)), oFXAnimSpark)
    expl.image_speed = 0.5 + tas_random(0.5)
    expl.additive = 0
    expl.sprite_index = sExpl1
    expl.direction = tas_random(360)
    expl.speed = 2 + tas_random(1)
}
make_explosion4(x, y)
instance_create(x, y, oScreenFlash)
sfx_play(sndMAlphaExpl)
sfx_play(sndMissileExpl)
mus_current_fadein()
if (global.difficulty < 2)
{
    if (damagedealt > givebackhp)
        damagedealt = givebackhp
    metroid_spawn_powerups(x, y, floor(damagedealt / 20), floor(starthealth / 10 / 2))
}
instance_destroy()
