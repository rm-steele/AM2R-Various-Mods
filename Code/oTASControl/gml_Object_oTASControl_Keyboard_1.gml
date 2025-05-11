if keyboard_check_pressed(vk_return)
{
    global.gameSpeed = status[2]
    if joystick_exists(global.opjoyid)
        global.joydetected = 1
    else
        global.joydetected = 0
    oControl.init = 0
    room_change(19, 0)
    instance_destroy()
    exit
}
if (keyboard_check_pressed(vk_down) || (keyboard_check_pressed(vk_tab) && (!keyboard_check(vk_shift))))
{
    selectedOption += 1
    if (selectedOption > lastIndex)
        selectedOption = 0
}
if (keyboard_check_pressed(vk_up) || (keyboard_check_pressed(vk_tab) && keyboard_check(vk_shift)))
{
    selectedOption -= 1
    if (selectedOption < 0)
        selectedOption = lastIndex
}
if keyboard_check_pressed(vk_right)
{
    switch type[selectedOption]
    {
        case OPTIONTYPE_BOOL:
            status[selectedOption] = (!status[selectedOption])
            break
        case OPTIONTYPE_INT:
            status[selectedOption]++
            if (status[selectedOption] > gp2[selectedOption])
                status[selectedOption] = gp2[selectedOption]
            break
        case OPTIONTYPE_MSGBOX_INT:
            gp2[selectedOption] = get_integer_async(gp1[selectedOption], status[selectedOption])
            break
        default:
            break
    }

}
if keyboard_check_pressed(vk_left)
{
    switch type[selectedOption]
    {
        case OPTIONTYPE_BOOL:
            status[selectedOption] = (!status[selectedOption])
            break
        case OPTIONTYPE_INT:
            status[selectedOption]--
            if (status[selectedOption] > gp1[selectedOption])
                status[selectedOption] = gp1[selectedOption]
            break
        case OPTIONTYPE_MSGBOX_INT:
            gp2[selectedOption] = get_integer_async(gp1[selectedOption], status[selectedOption])
            break
        default:
            break
    }

}
