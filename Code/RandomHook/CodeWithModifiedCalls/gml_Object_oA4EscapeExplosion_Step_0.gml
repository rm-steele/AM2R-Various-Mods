image_xscale += 0.07
image_yscale += 0.07
if (exploff > 496)
{
    make_explosion1big(exploff, (80 + tas_random(64)))
    exploff -= 16
}
else if (global.samushealth > 5)
    global.samushealth *= 0.98
