// if either left or right is held, but not both, increment the key repeat timer. otherwise, clear it
if (keyboard_check(vk_left) ^ keyboard_check(vk_right))
    timer++
else
    timer = 0

// check keys
if keyboard_check_pressed(vk_return)
{
    // set the TAS mode based on the settings
    if status[0] == 1
        global.tasMode = 1
    if status[1] == 1
        global.tasMode = 2

    global.gameSpeed = status[2]
    if joystick_exists(global.opjoyid)
        global.joydetected = 1
    else
        global.joydetected = 0
    oControl.init = 0
    room_change(19, 0) // go to the controller splash screen
    if global.tasMode == 1
        instance_create(0, 0, oRecord)
    if global.tasMode == 2
        instance_create(0, 0, oPlayback)
    instance_destroy()
    exit
}

// go to the next menu option, wrapping the list if we are at the end
if (keyboard_check_pressed(vk_down) || (keyboard_check_pressed(vk_tab) && (!keyboard_check(vk_shift))))
{
    timer = 0
    selectedOption += 1
    if (selectedOption > lastIndex)
        selectedOption = 0
}

// go to the previous menu option, wrapping the list if we are at the beginning
if (keyboard_check_pressed(vk_up) || (keyboard_check_pressed(vk_tab) && keyboard_check(vk_shift)))
{
    timer = 0
    selectedOption -= 1
    if (selectedOption < 0)
        selectedOption = lastIndex
}

// if right was pressed this frame, or held for at least 24 frames and the timer is divisible by 3, run its code
if (keyboard_check_pressed(vk_right) || (keyboard_check(vk_right) && timer >= 24 && (timer % 3) == 0))
{
    switch type[selectedOption]
    {
        case OPTIONTYPE_BOOL:
            status[selectedOption] = (!status[selectedOption])
            if (status[selectedOption] == 1 && gp1[selectedOption] != -1)
                status[gp1[selectedOption]] = 0
            break
        case OPTIONTYPE_INT:
            status[selectedOption]++
            if (status[selectedOption] > gp2[selectedOption])
                status[selectedOption] = gp2[selectedOption]
            break
        case OPTIONTYPE_MSGBOX_INT:
            gp2[selectedOption] = get_integer_async(gp1[selectedOption], status[selectedOption]) // save the message id because it's an async function
            keyboard_clear(vk_right) // unset the key becasue gamemaker will think it's held down when the message box takes focus away
            break
        default:
            break
    }

}

// same code as above but for left
if (keyboard_check_pressed(vk_left) || (keyboard_check(vk_left) && timer >= 24 && (timer % 3) == 0))
{
    switch type[selectedOption]
    {
        case OPTIONTYPE_BOOL:
            status[selectedOption] = (!status[selectedOption])
            if (status[selectedOption] == 1 && gp1[selectedOption] != -1)
                status[gp1[selectedOption]] = 0
            break
        case OPTIONTYPE_INT:
            status[selectedOption]--
            if (status[selectedOption] < gp1[selectedOption])
                status[selectedOption] = gp1[selectedOption]
            break
        case OPTIONTYPE_MSGBOX_INT:
            gp2[selectedOption] = get_integer_async(gp1[selectedOption], status[selectedOption])
            keyboard_clear(vk_left)
            break
        default:
            break
    }

}
