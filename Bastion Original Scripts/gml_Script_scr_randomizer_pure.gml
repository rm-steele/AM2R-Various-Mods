var temp_seed, checkcounter, shuff;
temp_seed = random_get_seed() // save game seed for later then get the seed for the randomizer
randomize()
if instance_exists(oClient) // use the seed from the server if there is one
{
    if (!is_undefined(oClient.seed))
    {
        oControl.seed = oClient.seed
        random_set_seed(oControl.seed)
    }
}
else // otherwise generate a seed
{
    oControl.seed = random_get_seed()
    random_set_seed(oControl.seed)
}
if (oControl.mod_usemanualseed == 1) // and then overwrite it with a user-supplied seed if asked
{
    random_set_seed(oControl.mod_seed)
    oControl.seed = oControl.mod_seed
}

// location-specific weighting. 0 is major/etank, 1 is random
oControl.list_genesis = ds_list_create() // genesis has an 80% chance for major/etank
ds_list_add(oControl.list_genesis, 1, 0, 0, 0, 0)
ds_list_shuffle(oControl.list_genesis)

oControl.list_ibeam = ds_list_create() // serris has an 80% chance for major/etank
ds_list_add(oControl.list_ibeam, 1, 0, 0, 0, 0)
ds_list_shuffle(oControl.list_ibeam)

oControl.list_jumpball = ds_list_create() // arachnus has a 50% chance for major/etank
ds_list_add(oControl.list_jumpball, 1, 1, 0, 0)
ds_list_shuffle(oControl.list_jumpball)

oControl.list_locations = ds_list_create() // create a list to hold locations
ds_list_add(oControl.list_locations, 52, 53, 54, 55, 56, 57, 60, 100, 101, 102, 104, 105, 106, 107, 109, 111, 150, 151, 152, 153, 154, 155, 156, 159, 161, 163) // add missiles to it (split across 2 lines)
ds_list_add(oControl.list_locations, 202, 203, 204, 205, 208, 210, 211, 214, 250, 252, 255, 257, 259, 303, 304, 307, 308, 309)
ds_list_add(oControl.list_locations, 51, 110, 162, 207, 209, 215, 256, 300, 305) // add super missiles, minus Skippy Reward
ds_list_add(oControl.list_locations, 50, 103, 108, 157, 158, 200, 201, 251, 306) // add energy tanks to it, minus Destroyed Geothermal
if (oControl.mod_insanitymode == 0) // add Destroyed Geothermal E-Tank if we're not in Insanity Mode, as a guaranteed heal to augment the lack of save stations
    ds_list_add(oControl.list_locations, 254)
ds_list_add(oControl.list_locations, 58, 59, 112, 160, 212, 213, 258, 301, 302) // add power bombs to the list, minus Geothermal
ds_list_shuffle(oControl.list_locations) // then shuffle the list

// guarantee that the A6 items are minor items by placing them before adding majors into the pool
oControl.mod_51 = ds_list_find_value(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1)) // A6 befind first Omega
ds_list_delete(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1))
oControl.mod_56 = ds_list_find_value(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1)) // A6 ballspark item
ds_list_delete(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1))
oControl.mod_60 = ds_list_find_value(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1)) // A6 in the lava
ds_list_delete(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1))

ds_list_add(oControl.list_locations, 0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14) // add majors to the pool
ds_list_shuffle(oControl.list_locations)

// initialize some varaibles
oControl.threecount = 0 // tracks how many of bombs, hijump, and space jump are placed behind speed booster, presumably for methods of gaining height
oControl.bombs_wall = 0 // the "wall" varaibles get set to 1 when that item is placed somewhere that requires speed. this is to prevent speed from being in a place requiring these majors
oControl.spider_wall = 0
oControl.spring_wall = 0
oControl.hijump_wall = 0
oControl.spacejump_wall = 0
oControl.screw_wall = 0
oControl.gravity_wall = 0
checkcounter = 0 // used for general purpose flow control

// make sure speed locked checks are not speed or certain majors, 1 means it can be that major
// arg0 = space jump
// arg1 = gravity
// arg2 = screw attack
// arg3 = spider ball
// arg4 = spring ball
oControl.mod_54 = scr_logic_SB_wall(1, 1, 1, 1, 1)
oControl.mod_55 = scr_logic_SB_wall(1, 1, 1, 1, 1)
oControl.mod_110 = scr_logic_SB_wall(1, 1, 0, 1, 0)
oControl.mod_161 = scr_logic_SB_wall(1, 1, 1, 1, 1)
oControl.mod_162 = scr_logic_SB_wall(1, 1, 1, 1, 1)
oControl.mod_201 = scr_logic_SB_wall(1, 1, 1, 1, 1)
oControl.mod_204 = scr_logic_SB_wall(1, 1, 1, 1, 1)
oControl.mod_205 = scr_logic_SB_wall(1, 1, 1, 1, 1)
oControl.mod_207 = scr_logic_SB_wall(1, 1, 1, 1, 1)
oControl.mod_208 = scr_logic_SB_wall(1, 1, 1, 1, 1)
oControl.mod_209 = scr_logic_SB_wall(1, 1, 1, 1, 1)
oControl.mod_212 = scr_logic_SB_wall(0, 1, 1, 1, 1)
oControl.mod_301 = scr_logic_SB_wall(1, 1, 1, 1, 1)
oControl.mod_305 = scr_logic_SB_wall(1, 0, 1, 1, 1)
oControl.mod_306 = scr_logic_SB_wall(0, 0, 1, 1, 1)
oControl.mod_307 = scr_logic_SB_wall(1, 0, 1, 1, 1)
oControl.mod_309 = scr_logic_SB_wall(1, 0, 1, 1, 1)
oControl.mod_255 = scr_logic_SB_wall(1, 1, 1, 1, 1)

// a bunch of code blocks to place items that need special requirements
while 1 // force plasma beam to be a major or e-tank
{
    oControl.mod_plasma = ds_list_find_value(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1))
    if (scr_PUorET(oControl.mod_plasma) == 1)
        break
    else
    {
        ds_list_shuffle(oControl.list_locations)
        continue
    }
}
ds_list_delete(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1))

while 1 // force space jump to be a major or e-tank
{
    oControl.mod_spacejump = ds_list_find_value(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1))
    if (scr_PUorET(oControl.mod_spacejump) == 1)
        break
    else
    {
        ds_list_shuffle(oControl.list_locations)
        continue
    }
}
ds_list_delete(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1))

shuff = ds_list_find_value(oControl.list_ibeam, (ds_list_size(oControl.list_ibeam) - 1)) // find if serris' item should be a major or e-tank
while 1
{
    oControl.mod_ice = ds_list_find_value(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1))
    if (shuff == 1) // if it should be random, don't rig it
        break
    else if (scr_PUorET(oControl.mod_ice) == 1)
        break
    else
    {
        ds_list_shuffle(oControl.list_locations)
        continue
    }
}
ds_list_delete(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1))

shuff = ds_list_find_value(oControl.list_genesis, (ds_list_size(oControl.list_genesis) - 1)) // find if genesis' item should be a major or e-tank
while 1
{
    oControl.mod_50 = ds_list_find_value(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1))
    if (shuff == 1) // if it should be random, don't rig it
        break
    else if (scr_PUorET(oControl.mod_50) == 1)
        break
    else
    {
        ds_list_shuffle(oControl.list_locations)
        continue
    }
}
ds_list_delete(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1))

shuff = ds_list_find_value(oControl.list_jumpball, (ds_list_size(oControl.list_jumpball) - 1)) // find if arachnus' item should be a major or e-tank
while 1
{
    oControl.mod_jumpball = ds_list_find_value(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1))
    if (shuff == 1) // if it should be random, don't rig it
        break
    else if (scr_PUorET(oControl.mod_jumpball) == 1)
        break
    else
    {
        ds_list_shuffle(oControl.list_locations)
        continue
    }
}
ds_list_delete(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1))

while 1
{
    oControl.mod_53 = ds_list_find_value(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1)) // id 53 is spiderball challenge top
    if (oControl.mod_53 != 0) // if it's bombs then reshuffle it, otherwise continue checking what it is
    {
        if (oControl.mod_53 != 7) // if it's not speed then leave it
            break
        else if (oControl.bombs_wall == 0 && oControl.spacejump_wall == 0) // if it is speed then only place it if bombs and space don't require speed
            break
        else
        {
            ds_list_shuffle(oControl.list_locations)
            continue
        }
    }
    else
    {
        ds_list_shuffle(oControl.list_locations)
        continue
    }
}
ds_list_delete(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1))

while 1
{
    oControl.mod_57 = ds_list_find_value(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1)) // id 57 is hijump challenge outside A2's entrance
    if (oControl.mod_57 != 4 && oControl.mod_57 != 6) // if it's hi-jump or space jump, reshuffle it
    {
        if (oControl.mod_57 != 7) // if it's not speed then leave it
            break
        else if (oControl.spacejump_wall == 0 && oControl.hijump_wall == 0) // if it is speed then only place it if hijump and space jump don't require speed
            break
        else
        {
            ds_list_shuffle(oControl.list_locations)
            continue
        }
    }
    else
    {
        ds_list_shuffle(oControl.list_locations)
        continue
    }
}
ds_list_delete(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1))

while 1
{
    checkcounter = 0
    oControl.mod_259 = ds_list_find_value(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1)) // id 259 is the A2-A4 pipe item
    if (oControl.mod_259 != 8) // increment checkcounter if it's not screw attack
        checkcounter++
    if (oControl.mod_259 == 7 && oControl.screw_wall == 1) // don't increment checkcounter if it's speed booster and screw attack requires speed booster
    {
    }
    else
        checkcounter++
    if (checkcounter == 2) // if both checks passed then leave the item, otherwise reshuffle it
        break
    else
    {
        ds_list_shuffle(oControl.list_locations)
        continue
    }
}
ds_list_delete(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1))

while 1
{
    checkcounter = 0
    oControl.mod_300 = ds_list_find_value(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1)) // id 300 is the screw-locked item after actiavting EMP
    if (oControl.mod_300 != 8) // increment checkcounter if it's not screw attack
        checkcounter++
    if (oControl.mod_300 == 7 && oControl.screw_wall) // don't increment checkcounter if it's speed booster and screw attack requires speed booster
    {
    }
    else
        checkcounter++
    if (checkcounter == 2) // if both checks passed then leave the item, otherwise reshuffle it
        break
    else
    {
        ds_list_shuffle(oControl.list_locations)
        continue
    }
}
ds_list_delete(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1))

while 1
{
    checkcounter = 0
    oControl.mod_160 = ds_list_find_value(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1)) // id 160 is the power bomb locked lower item in the BG2 hidden room
    if (oControl.mod_160 == 7 && oControl.screw_wall) // don't increment checkcounter if it's speed booster and screw attack requires speed booster
    {
    }
    else
        checkcounter++
    if (oControl.threecount > 1 && (oControl.mod_160 == 0 || oControl.mod_160 == 4 || oControl.mod_160 == 6)) // don't increment checkcounter if 2 height items require speed and this is the 3rd
    {
    }
    else
        checkcounter++
    if (checkcounter == 2) // if both checks passed then leave the item, otherwise reshuffle it
        break
    else
    {
        ds_list_shuffle(oControl.list_locations)
        continue
    }
}
ds_list_delete(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1))

while 1
{
    checkcounter = 0
    oControl.mod_158 = ds_list_find_value(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1)) // id 158 is the lowest BG2 item in the wall
    if (oControl.threecount > 1 && (oControl.mod_158 == 0 || oControl.mod_158 == 4 || oControl.mod_158 == 6)) // if 2 height items require speed and this is the 3rd, reshuffle
    {
        ds_list_shuffle(oControl.list_locations)
        continue
    }
    else // otherwise leave the item here
        break
}
ds_list_delete(oControl.list_locations, (ds_list_size(oControl.list_locations) - 1))

// randomize the rest of the items
oControl.mod_gravity = scr_random_draw_pool()
oControl.mod_screwattack = scr_random_draw_pool()
oControl.mod_hijump = scr_random_draw_pool()
oControl.mod_speedbooster = scr_random_draw_pool()
oControl.mod_wave = scr_random_draw_pool()
oControl.mod_spazer = scr_random_draw_pool()
oControl.mod_bombs = scr_random_draw_pool()
oControl.mod_spider = scr_random_draw_pool()
oControl.mod_varia = scr_random_draw_pool()
oControl.mod_charge = scr_random_draw_pool()
oControl.mod_100 = scr_random_draw_pool()
oControl.mod_101 = scr_random_draw_pool()
oControl.mod_102 = scr_random_draw_pool()
oControl.mod_103 = scr_random_draw_pool()
oControl.mod_104 = scr_random_draw_pool()
oControl.mod_105 = scr_random_draw_pool()
oControl.mod_106 = scr_random_draw_pool()
oControl.mod_107 = scr_random_draw_pool()
oControl.mod_108 = scr_random_draw_pool()
oControl.mod_109 = scr_random_draw_pool()
oControl.mod_52 = scr_random_draw_pool()
oControl.mod_152 = scr_random_draw_pool()
oControl.mod_163 = scr_random_draw_pool()
oControl.mod_150 = scr_random_draw_pool()
oControl.mod_151 = scr_random_draw_pool()
oControl.mod_153 = scr_random_draw_pool()
oControl.mod_154 = scr_random_draw_pool()
oControl.mod_155 = scr_random_draw_pool()
oControl.mod_156 = scr_random_draw_pool()
oControl.mod_159 = scr_random_draw_pool()
oControl.mod_202 = scr_random_draw_pool()
oControl.mod_203 = scr_random_draw_pool()
oControl.mod_210 = scr_random_draw_pool()
oControl.mod_211 = scr_random_draw_pool()
oControl.mod_214 = scr_random_draw_pool()
oControl.mod_250 = scr_random_draw_pool()
oControl.mod_252 = scr_random_draw_pool()
oControl.mod_304 = scr_random_draw_pool()
oControl.mod_308 = scr_random_draw_pool()
oControl.mod_215 = scr_random_draw_pool()
oControl.mod_256 = scr_random_draw_pool()
oControl.mod_157 = scr_random_draw_pool()
oControl.mod_200 = scr_random_draw_pool()
oControl.mod_251 = scr_random_draw_pool()
oControl.mod_213 = scr_random_draw_pool()
oControl.mod_258 = scr_random_draw_pool()
oControl.mod_58 = scr_random_draw_pool()
oControl.mod_59 = scr_random_draw_pool()

// items with special conditions
oControl.mod_257 = scr_random_draw_spider() // id 257 is the A4 ceiling item. it makes sure that it's not spider ball, and if it's space or speed, that spider and space don't require speed
oControl.mod_302 = scr_random_draw_gravity() // id 302 is the post-gravity chamber item at the top of the outside region. it makes sure it's not gravity and that if it's speed, that speed doesn't require gravity
oControl.mod_303 = scr_random_draw_gravity_spider() // id 303 is the lower A5 crimble block "maze". it makes sure it's not gravity or spider, and that if it's speed that neither gravity nor spider require speed

// guaranteed items
if (oControl.mod_insanitymode == 0)
    oControl.mod_254 = scr_random_draw_pool() // id 254 is the Destroyed Geothermal e-tank, see line 41
else
    oControl.mod_254 = 254

oControl.mod_206 = 206 // id 206 is the Skippy Reward first Super Missiles
oControl.mod_253 = 253 // id 253 is the Geothermal power bomb


// above guardian items
oControl.mod_111 = scr_random_draw_111() // id 111 is the item above A1 Guardian
                                         // the code makes sure that if it's speed, you have enough non-speed-locked movement to reach it and that screw doesn't require speed
                                         // it also makes sure the item next to it isn't a movement item if this one is

oControl.mod_112 = scr_random_draw_112() // id 112 is the item above A1 Guardian behind the power bomb door
                                         // the code makes sure that if it's speed, you have enough non-speed-locked movement to reach it and that screw doesn't require speed
                                         // it also makes sure the item next to it isn't a movement item if this one is

ds_list_destroy(oControl.list_genesis) // destroy all the lists as to not leak memory now that they're no longer needed
ds_list_destroy(oControl.list_ibeam)
ds_list_destroy(oControl.list_jumpball)
ds_list_destroy(oControl.list_locations)
random_set_seed(temp_seed) // reset the seed now that the randomizer code is finished
