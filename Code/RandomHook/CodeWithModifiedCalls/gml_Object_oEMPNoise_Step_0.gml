xoff = floor(tas_random(128))
yoff = floor(tas_random(128))
image_alpha -= 0.1
if (image_alpha <= 0)
    instance_destroy()
with (oCharacter)
    chargebeam = 0
