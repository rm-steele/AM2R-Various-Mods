random_set_seed(global.rngSeed)
global.rngSeed = irandom(4294967295)
random_set_seed(global.rngSeed)

switch (argument_count)
{
    case 2:
        return choose(argument0, argument1);
    case 3:
        return choose(argument0, argument1, argument2);
    case 4:
        return choose(argument0, argument1, argument2, argument3);
    case 5:
        return choose(argument0, argument1, argument2, argument3, argument4);
    case 6:
        return choose(argument0, argument1, argument2, argument3, argument4, argument5);
    case 7:
        return choose(argument0, argument1, argument2, argument3, argument4, argument5, argument6);
    case 8:
        return choose(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7);
    case 9:
        return choose(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8);
    case 10:
        return choose(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9);
    case 11:
        return choose(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10);
    case 12:
        return choose(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11);
    case 13:
        return choose(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12);
    case 14:
        return choose(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13);
    case 15:
        return choose(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13, argument14);
    case 16:
        return choose(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13, argument14, argument15);
    default:
        show_message_async("Something called tas_choose() with an invalid number of arguments! Valid range is 2-16 args.")
}