var pickup;
if (hp <= 0)
{
    repeat (10)
    {
        expl = instance_create((x - 16 + tas_random(32)), (y - 16 + tas_random(32)), oFXAnimSpark)
        expl.image_speed = 0.5 + tas_random(0.5)
        expl.additive = 0
        expl.sprite_index = sExpl1
        expl.direction = tas_random(360)
        expl.speed = 2 + tas_random(1)
    }
    repeat (20)
        deb = instance_create(x, (y - 8), oIceShard)
    make_explosion4(x, y)
    instance_create(x, y, oScreenFlash)
    sfx_play(sndMissileExpl)
    PlaySoundMono(sndIceShatter)
    sfx_play(sndMetroidDeath)
    global.metroidsleft -= 1
    global.metroidsarea -= 1
    global.metdead[myid] = 1
    with (oMetroidDoorControl)
        alarm[1] = 1
    pickup = tas_choose(0, 1)
    if (pickup == 0)
    {
        if (global.missiles < global.maxmissiles && global.maxmissiles > 0)
        {
            repeat (3)
                instance_create((x + (tas_random_range(-15, 15))), (y + (tas_random_range(-15, 15))), oMPickup)
        }
        else
            pickup = 1
    }
    if (pickup == 1)
    {
        if (global.smissiles < global.maxsmissiles && global.maxsmissiles > 0)
            instance_create(x, y, oSMPickup)
    }
    if (global.samushealth < global.maxhealth && global.difficulty <= 1)
    {
        repeat (3)
            instance_create((x + (tas_random_range(-15, 15))), (y + (tas_random_range(-15, 15))), oHPickupBig)
    }
    instance_destroy()
}
else
{
    flashing = 20
    sfx_play(sndMetroidHit)
}
