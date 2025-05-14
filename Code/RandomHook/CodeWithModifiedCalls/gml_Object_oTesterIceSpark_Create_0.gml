damage = 25
image_speed = 0.5
repeat (3)
{
    expl2 = instance_create(x, y, oFXAnimSpark)
    expl2.sprite_index = sIBeamFX
    expl2.vspeed = (-tas_random(3))
    expl2.hspeed = tas_random(6) - 3
    expl2.gravity_direction = 270
    expl2.gravity = 0.2
    expl2.image_speed = 0.3
    expl2.additive = 1
    expl2.depth = -1000
}
