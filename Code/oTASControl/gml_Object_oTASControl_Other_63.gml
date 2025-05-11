var i;
for (i = 0; i <= lastIndex; i++) // iterate all the menu items
{
    if (type[i] == OPTIONTYPE_MSGBOX_INT && gp2[i] == ds_map_find_value(async_load, "id")) // if they're a message box type and have the same id
    {
        if ds_map_find_value(async_load, "status") // and the message box wasn't canceled
            status[i] = ds_map_find_value(async_load, "value") // then update the item's value
    }
}
