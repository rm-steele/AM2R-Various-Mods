global.event[event] = 1
repeat (80)
    instance_create((x - 16 + tas_random(32)), (y - tas_random(64)), oGreenCrystalShard)
sfx_play(sndCrystalShatter)
instance_destroy()
