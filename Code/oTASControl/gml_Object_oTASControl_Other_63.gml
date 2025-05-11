var i;
for (i = 0; i <= lastIndex; i++)
{
    if (type[i] == OPTIONTYPE_MSGBOX_INT && gp2[i] == ds_map_find_value(async_load, "id"))
    {
        if ds_map_find_value(async_load, "status")
            status[i] = ds_map_find_value(async_load, "value")
    }
}
