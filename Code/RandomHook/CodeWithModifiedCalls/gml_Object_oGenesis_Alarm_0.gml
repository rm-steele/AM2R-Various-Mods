if (state == 3 && statetime < 70)
{
    prj = instance_create((x + 20 * facing), (y - 22), oGenesisAcid)
    prj.hspeed = (6 + tas_random(3)) * facing
    prj.vspeed = 1 - tas_random(3)
    alarm[0] = 2
}
