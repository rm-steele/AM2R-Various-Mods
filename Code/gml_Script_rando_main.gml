var temp_seed, checkcounter, shuff;
temp_seed = random_get_seed() // save game seed for later then get the seed for the randomizer
randomize()

/* commented out since this isn't being built on multitroid (yet?)
if instance_exists(oClient) // use the seed from the server if there is one
{
    if (!is_undefined(oClient.seed))
    {
        oControl.seed = oClient.seed
        random_set_seed(oControl.seed)
    }
}
else // otherwise generate a seed
*/
{
    oControl.seed = random_get_seed()
    random_set_seed(oControl.seed)
}
if (oControl.mod_usemanualseed == 1) // and then overwrite it with a user-supplied seed if asked
{
    random_set_seed(oControl.mod_seed)
    oControl.seed = oControl.mod_seed
}

/* boss item weighting may come back later, no promises though
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
*/

oControl.unplaced_items = ds_list_create() // create a list to hold unplaced items
ds_list_add(oControl.unplaced_items, 0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14) // major items
repeat(44)
    ds_list_add(oControl.unplaced_items, 15) // missiles
repeat(10)
    ds_list_add(oControl.unplaced_items, 16) // supers
repeat(10)
    ds_list_add(oControl.unplaced_items, 17) // powers
repeat(10)
    ds_list_add(oControl.unplaced_items, 18) // e-tanks

ds_list_shuffle(oControl.unplaced_items)

// initialize some varaibles
oControl.invstate = 0
oControl.invstate[0] = 0
oControl.invstate[1] = 0
oControl.invstate[2] = 0
oControl.invstate[3] = 0
oControl.invstate[4] = 0
oControl.invstate[5] = 0
oControl.invstate[6] = 0
oControl.invstate[7] = 0
oControl.invstate[8] = 0
oControl.invstate[9] = 0
oControl.invstate[10] = 0
oControl.invstate[11] = 0
oControl.invstate[12] = 0
oControl.invstate[13] = 0
oControl.invstate[14] = 0
oControl.invstate[15] = 0
oControl.invstate[16] = 0
oControl.invstate[17] = 0
oControl.invstate[18] = 0
oControl.valid_locations = ds_list_create()
oControl.prototype_idx = -1
oControl.mtanks_placed = -1
oControl.smtanks_placed = -1
oControl.pbtanks_placed = -1
oControl.etanks_placed = -1

// map is item: location to save me time for prototyping
// oControl.final_placements = ds_map_create()

oControl.final_placements = 0
oControl.final_placements[88] = 0

while (ds_list_size(oControl.unplaced_items) > 0)
{
    rando_update_valid_locations()
    ds_list_shuffle(oControl.unplaced_items)
    ds_list_shuffle(oControl.valid_locations)
    oControl.final_placements[(ds_list_size(oControl.unplaced_items) - 1)] = ds_list_find_value(oControl.unplaced_items, ds_list_size(oControl.unplaced_items) - 1)
    // ds_map_add(oControl.final_placements, ds_list_find_value(oControl.unplaced_items, ds_list_size(oControl.unplaced_items) - 1), ds_list_find_value(oControl.valid_locations, ds_list_size(oControl.valid_locations) - 1))
    ds_list_delete(oControl.unplaced_items, (ds_list_size(oControl.unplaced_items) - 1))
    ds_list_delete(oControl.valid_locations, (ds_list_size(oControl.valid_locations) - 1))
}

// ds_list_delete(oControl.unplaced_items, (ds_list_size(oControl.unplaced_items) - 1))
// keeping this around to copy out later

// randomize the rest of the items
// mod_item is the location and the number assigned to it is the item ID
oControl.mod_gravity = rando_prototype_get_item()
oControl.mod_screwattack = rando_prototype_get_item()
oControl.mod_hijump = rando_prototype_get_item()
oControl.mod_speedbooster = rando_prototype_get_item()
oControl.mod_wave = rando_prototype_get_item()
oControl.mod_spazer = rando_prototype_get_item()
oControl.mod_bombs = rando_prototype_get_item()
oControl.mod_spider = rando_prototype_get_item()
oControl.mod_varia = rando_prototype_get_item()
oControl.mod_charge = rando_prototype_get_item()
oControl.mod_100 = rando_prototype_get_item()
oControl.mod_101 = rando_prototype_get_item()
oControl.mod_102 = rando_prototype_get_item()
oControl.mod_103 = rando_prototype_get_item()
oControl.mod_104 = rando_prototype_get_item()
oControl.mod_105 = rando_prototype_get_item()
oControl.mod_106 = rando_prototype_get_item()
oControl.mod_107 = rando_prototype_get_item()
oControl.mod_108 = rando_prototype_get_item()
oControl.mod_109 = rando_prototype_get_item()
oControl.mod_52 = rando_prototype_get_item()
oControl.mod_152 = rando_prototype_get_item()
oControl.mod_163 = rando_prototype_get_item()
oControl.mod_150 = rando_prototype_get_item()
oControl.mod_151 = rando_prototype_get_item()
oControl.mod_153 = rando_prototype_get_item()
oControl.mod_154 = rando_prototype_get_item()
oControl.mod_155 = rando_prototype_get_item()
oControl.mod_156 = rando_prototype_get_item()
oControl.mod_159 = rando_prototype_get_item()
oControl.mod_202 = rando_prototype_get_item()
oControl.mod_203 = rando_prototype_get_item()
oControl.mod_210 = rando_prototype_get_item()
oControl.mod_211 = rando_prototype_get_item()
oControl.mod_214 = rando_prototype_get_item()
oControl.mod_250 = rando_prototype_get_item()
oControl.mod_252 = rando_prototype_get_item()
oControl.mod_304 = rando_prototype_get_item()
oControl.mod_308 = rando_prototype_get_item()
oControl.mod_215 = rando_prototype_get_item()
oControl.mod_256 = rando_prototype_get_item()
oControl.mod_157 = rando_prototype_get_item()
oControl.mod_200 = rando_prototype_get_item()
oControl.mod_251 = rando_prototype_get_item()
oControl.mod_213 = rando_prototype_get_item()
oControl.mod_258 = rando_prototype_get_item()
oControl.mod_58 = rando_prototype_get_item()
oControl.mod_59 = rando_prototype_get_item()

// items with special conditions
oControl.mod_257 = rando_prototype_get_item() // id 257 is the A4 ceiling item. it makes sure that it's not spider ball, and if it's space or speed, that spider and space don't require speed
oControl.mod_302 = rando_prototype_get_item() // id 302 is the post-gravity chamber item at the top of the outside region. it makes sure it's not gravity and that if it's speed, that speed doesn't require gravity
oControl.mod_303 = rando_prototype_get_item() // id 303 is the lower A5 crimble block "maze". it makes sure it's not gravity or spider, and that if it's speed that neither gravity nor spider require speed

/*
// guaranteed items
if (oControl.mod_insanitymode == 0)
    oControl.mod_254 = rando_prototype_get_item() // id 254 is the Destroyed Geothermal e-tank, see line 41
else
    oControl.mod_254 = 254

oControl.mod_206 = 206 // id 206 is the Skippy Reward first Super Missiles
oControl.mod_253 = 253 // id 253 is the Geothermal power bomb
*/

oControl.mod_254 = rando_prototype_get_item() // id 254 is the Destroyed Geothermal e-tank, guaranteed on Insanity mode
oControl.mod_206 = rando_prototype_get_item() // id 206 is the Skippy Reward first Super Missiles
oControl.mod_253 = rando_prototype_get_item() // id 253 is the Geothermal power bomb
// above guardian items
oControl.mod_111 = rando_prototype_get_item() // id 111 is the item above A1 Guardian
                                         // the code makes sure that if it's speed, you have enough non-speed-locked movement to reach it and that screw doesn't require speed
                                         // it also makes sure the item next to it isn't a movement item if this one is

oControl.mod_112 = rando_prototype_get_item() // id 112 is the item above A1 Guardian behind the power bomb door
                                         // the code makes sure that if it's speed, you have enough non-speed-locked movement to reach it and that screw doesn't require speed
                                         // it also makes sure the item next to it isn't a movement item if this one is

oControl.mod_54 = rando_prototype_get_item()
oControl.mod_55 = rando_prototype_get_item()
oControl.mod_110 = rando_prototype_get_item()
oControl.mod_161 = rando_prototype_get_item()
oControl.mod_162 = rando_prototype_get_item()
oControl.mod_201 = rando_prototype_get_item()
oControl.mod_204 = rando_prototype_get_item()
oControl.mod_205 = rando_prototype_get_item()
oControl.mod_207 = rando_prototype_get_item()
oControl.mod_208 = rando_prototype_get_item()
oControl.mod_209 = rando_prototype_get_item()
oControl.mod_212 = rando_prototype_get_item()
oControl.mod_301 = rando_prototype_get_item()
oControl.mod_305 = rando_prototype_get_item()
oControl.mod_306 = rando_prototype_get_item()
oControl.mod_307 = rando_prototype_get_item()
oControl.mod_309 = rando_prototype_get_item()
oControl.mod_255 = rando_prototype_get_item()

/*
ds_list_destroy(oControl.list_genesis) // destroy all the lists as to not leak memory now that they're no longer needed
ds_list_destroy(oControl.list_ibeam)
ds_list_destroy(oControl.list_jumpball)
*/
ds_list_destroy(oControl.unplaced_items)
random_set_seed(temp_seed) // reset the seed now that the randomizer code is finished
