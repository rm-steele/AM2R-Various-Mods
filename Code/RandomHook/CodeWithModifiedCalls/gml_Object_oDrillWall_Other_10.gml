x += 16
repeat (20)
{
    expl = instance_create((x - tas_random(16)), (y + tas_random(80)), oFXAnimSpark)
    expl.image_speed = 0.3
    expl.additive = 0
    expl.sprite_index = sExplSmoke2
    expl.depth = -120
}
repeat (8)
{
    mytrail = instance_create((x - tas_random(16)), (y + tas_random(80)), oFXTrail)
    mytrail.sprite_index = sRockPieceA3
    mytrail.image_index = floor(tas_random(6))
    mytrail.image_alpha = 1
    mytrail.fadespeed = 0.005
    mytrail.additive = 0
    mytrail.vspeed = -1 - tas_random(3)
    mytrail.hspeed = -2 + tas_random(3)
    mytrail.gravity = 0.2
    mytrail.gravity_direction = 270
    mytrail.depth = -150
}
