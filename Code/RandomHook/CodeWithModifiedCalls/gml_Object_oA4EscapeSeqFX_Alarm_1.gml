expl = instance_create((view_xview[0] + tas_random(320)), (view_yview[0] + tas_random(240)), oFXAnimSpark)
expl.image_speed = 0.5
expl.additive = 0
expl.sprite_index = sExpl1
expl.image_xscale = 0.6
expl.image_yscale = 0.6
expl.depth = 50
if explosions
    alarm[1] = 5
