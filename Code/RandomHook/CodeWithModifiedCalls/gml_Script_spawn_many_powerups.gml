repeat (20)
    instance_create((argument0 + tas_random(argument2)), (argument1 + tas_random(argument3)), oHPickupBig)
if (global.maxmissiles > 0)
{
    repeat (20)
        instance_create((argument0 + tas_random(argument2)), (argument1 + tas_random(argument3)), oMPickup)
}
if (global.maxsmissiles > 0)
{
    repeat (5)
        instance_create((argument0 + tas_random(argument2)), (argument1 + tas_random(argument3)), oSMPickup)
}
