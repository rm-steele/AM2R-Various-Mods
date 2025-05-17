if tasInitialized
{
    control_state = ""
    control_state += string(kLeft)
    control_state += string(kRight)
    control_state += string(kUp)
    control_state += string(kDown)
    control_state += string(walk_zone)
    control_state += string(kJump)
    control_state += string(kFire)
    control_state += string(kMissile)
    control_state += string(kAim)
    control_state += string(kAim2)
    control_state += string(kSelect)
    control_state += string(kStart)
    control_state += string(kWalk)
    control_state += string(kMorph)
    control_state += string(kMenu1)
    control_state += string(kMenu2)
    if (control_state != last_state)
    {
        inputs[frame] = control_state
        frames_recorded += 1
    }
    else
        inputs[frame] = ""

    frame += 1
    last_state = control_state
}