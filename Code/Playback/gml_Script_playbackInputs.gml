if tasInitialized
{
    if (string_length(control_read[frame]) > 0)
    {
        if (control_read[frame] == "EOF")
        {
            popup_text("Playback Finished")
            // file_text_close(log)
            global.tasMode = 0
            exit
        }
        if (control_state != last_state)
            control_state = control_read[frame]
    }

    walk_zone = real(string_char_at(control_state, 5))

    kLeftReleased = 0
    if (kLeft > 0)
    {
        kLeft = real(string_char_at(control_state, 1))
        kLeftPushedSteps += 1
        kLeftPressed = 0
        if (kLeft == 0)
            kLeftReleased = 1
    }
    else
    {
        kLeft = real(string_char_at(control_state, 1))
        if kLeft
            kLeftPressed = 1
        kLeftPushedSteps = 0
    }
    kRightReleased = 0
    if (kRight > 0)
    {
        kRight = real(string_char_at(control_state, 2))
        kRightPushedSteps += 1
        kRightPressed = 0
        if (kRight == 0)
            kRightReleased = 1
    }
    else
    {
        kRight = real(string_char_at(control_state, 2))
        if kRight
            kRightPressed = 1
        kRightPushedSteps = 0
    }
    kUpReleased = 0
    if kUp
    {
        kUp = real(string_char_at(control_state, 3))
        kUpPushedSteps += 1
        kUpPressed = 0
        if (kUp == 0)
            kUpReleased = 1
    }
    else
    {
        kUp = real(string_char_at(control_state, 3))
        if kUp
            kUpPressed = 1
        kUpPushedSteps = 0
    }
    kDownReleased = 0
    if kDown
    {
        kDown = real(string_char_at(control_state, 4))
        kDownPushedSteps += 1
        kDownPressed = 0
        if (kDown == 0)
            kDownReleased = 1
    }
    else
    {
        kDown = real(string_char_at(control_state, 4))
        if kDown
            kDownPressed = 1
        kDownPushedSteps = 0
    }
    if kJump
    {
        kJump = real(string_char_at(control_state, 6))
        kJumpPushedSteps += 1
        kJumpPressed = 0
    }
    else
    {
        kJump = real(string_char_at(control_state, 6))
        if kJump
            kJumpPressed = 1
        kJumpPushedSteps = 0
    }
    if kFire
    {
        kFire = real(string_char_at(control_state, 7))
        kFirePushedSteps += 1
        kFirePressed = 0
    }
    else
    {
        kFire = real(string_char_at(control_state, 7))
        if kFire
            kFirePressed = 1
        kFirePushedSteps = 0
    }
    if kMissile
    {
        kMissile = real(string_char_at(control_state, 8))
        kMissilePushedSteps += 1
        kMissilePressed = 0
    }
    else
    {
        kMissile = real(string_char_at(control_state, 8))
        if kMissile
            kMissilePressed = 1
        kMissilePushedSteps = 0
    }
    if kAim
    {
        kAim = real(string_char_at(control_state, 9))
        kAimPushedSteps += 1
        kAimPressed = 0
    }
    else
    {
        kAim = real(string_char_at(control_state, 9))
        if kAim
            kAimPressed = 1
        kAimPushedSteps = 0
    }
    if kAim2
    {
        kAim2 = real(string_char_at(control_state, 10))
        kAim2PushedSteps += 1
        kAim2Pressed = 0
    }
    else
    {
        kAim2 = real(string_char_at(control_state, 10))
        if kAim2
            kAim2Pressed = 1
        kAim2PushedSteps = 0
    }
    if kSelect
    {
        kSelect = real(string_char_at(control_state, 11))
        kSelectPushedSteps += 1
        kSelectPressed = 0
    }
    else
    {
        kSelect = real(string_char_at(control_state, 11))
        if kSelect
            kSelectPressed = 1
        kSelectPushedSteps = 0
    }
    if kStart
    {
        kStart = real(string_char_at(control_state, 12))
        kStartPushedSteps += 1
        kStartPressed = 0
    }
    else
    {
        kStart = real(string_char_at(control_state, 12))
        if kStart
            kStartPressed = 1
        kStartPushedSteps = 0
    }
    if kWalk
    {
        kWalk = real(string_char_at(control_state, 13))
        kWalkPushedSteps += 1
        kWalkPressed = 0
    }
    else
    {
        kWalk = real(string_char_at(control_state, 13))
        if kWalk
            kWalkPressed = 1
        kWalkPushedSteps = 0
    }
    if kMorph
    {
        kMorph = real(string_char_at(control_state, 14))
        kMorphPushedSteps += 1
        kMorphPressed = 0
    }
    else
    {
        kMorph = real(string_char_at(control_state, 14))
        if kMorph
            kMorphPressed = 1
        kMorphPushedSteps = 0
    }
    if kMenu1
    {
        kMenu1 = real(string_char_at(control_state, 15))
        kMenu1PushedSteps += 1
        kMenu1Pressed = 0
    }
    else
    {
        kMenu1 = real(string_char_at(control_state, 15))
        if kMenu1
            kMenu1Pressed = 1
        kMenu1PushedSteps = 0
    }
    if kMenu2
    {
        kMenu2 = real(string_char_at(control_state, 16))
        kMenu2PushedSteps += 1
        kMenu2Pressed = 0
    }
    else
    {
        kMenu2 = real(string_char_at(control_state, 16))
        if kMenu2
            kMenu2Pressed = 1
        kMenu2PushedSteps = 0
    }

    frame += 1
}