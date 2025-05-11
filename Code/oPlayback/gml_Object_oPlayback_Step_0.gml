if (string_length(control_read[frame]) > 0)
{
    if (control_read[frame] == "EOF")
    {
        popup_text("Playback Finished")
        instance_destroy()
        exit
    }
    if (control_state != last_state)
        control_state = control_read[frame]
}

oControl.walk_zone = real(string_char_at(control_state, 5))

oControl.kLeftReleased = 0
if (oControl.kLeft > 0)
{
    oControl.kLeft = real(string_char_at(control_state, 1))
    oControl.kLeftPushedSteps += 1
    oControl.kLeftPressed = 0
    if (oControl.kLeft == 0)
        oControl.kLeftReleased = 1
}
else
{
    oControl.kLeft = real(string_char_at(control_state, 1))
    if oControl.kLeft
        oControl.kLeftPressed = 1
    oControl.kLeftPushedSteps = 0
}
oControl.kRightReleased = 0
if (oControl.kRight > 0)
{
    oControl.kRight = real(string_char_at(control_state, 2))
    oControl.kRightPushedSteps += 1
    oControl.kRightPressed = 0
    if (oControl.kRight == 0)
        oControl.kRightReleased = 1
}
else
{
    oControl.kRight = real(string_char_at(control_state, 2))
    if oControl.kRight
        oControl.kRightPressed = 1
    oControl.kRightPushedSteps = 0
}
oControl.kUpReleased = 0
if oControl.kUp
{
    oControl.kUp = real(string_char_at(control_state, 3))
    oControl.kUpPushedSteps += 1
    oControl.kUpPressed = 0
    if (oControl.kUp == 0)
        oControl.kUpReleased = 1
}
else
{
    oControl.kUp = real(string_char_at(control_state, 3))
    if oControl.kUp
        oControl.kUpPressed = 1
    oControl.kUpPushedSteps = 0
}
oControl.kDownReleased = 0
if oControl.kDown
{
    oControl.kDown = real(string_char_at(control_state, 4))
    oControl.kDownPushedSteps += 1
    oControl.kDownPressed = 0
    if (oControl.kDown == 0)
        oControl.kDownReleased = 1
}
else
{
    oControl.kDown = real(string_char_at(control_state, 4))
    if oControl.kDown
        oControl.kDownPressed = 1
    oControl.kDownPushedSteps = 0
}
if oControl.kJump
{
    oControl.kJump = real(string_char_at(control_state, 6))
    oControl.kJumpPushedSteps += 1
    oControl.kJumpPressed = 0
}
else
{
    oControl.kJump = real(string_char_at(control_state, 6))
    if oControl.kJump
        oControl.kJumpPressed = 1
    oControl.kJumpPushedSteps = 0
}
if oControl.kFire
{
    oControl.kFire = real(string_char_at(control_state, 7))
    oControl.kFirePushedSteps += 1
    oControl.kFirePressed = 0
}
else
{
    oControl.kFire = real(string_char_at(control_state, 7))
    if oControl.kFire
        oControl.kFirePressed = 1
    oControl.kFirePushedSteps = 0
}
if oControl.kMissile
{
    oControl.kMissile = real(string_char_at(control_state, 8))
    oControl.kMissilePushedSteps += 1
    oControl.kMissilePressed = 0
}
else
{
    oControl.kMissile = real(string_char_at(control_state, 8))
    if oControl.kMissile
        oControl.kMissilePressed = 1
    oControl.kMissilePushedSteps = 0
}
if oControl.kAim
{
    oControl.kAim = real(string_char_at(control_state, 9))
    oControl.kAimPushedSteps += 1
    oControl.kAimPressed = 0
}
else
{
    oControl.kAim = real(string_char_at(control_state, 9))
    if oControl.kAim
        oControl.kAimPressed = 1
    oControl.kAimPushedSteps = 0
}
if oControl.kAim2
{
    oControl.kAim2 = real(string_char_at(control_state, 10))
    oControl.kAim2PushedSteps += 1
    oControl.kAim2Pressed = 0
}
else
{
    oControl.kAim2 = real(string_char_at(control_state, 10))
    if oControl.kAim2
        oControl.kAim2Pressed = 1
    oControl.kAim2PushedSteps = 0
}
if oControl.kSelect
{
    oControl.kSelect = real(string_char_at(control_state, 11))
    oControl.kSelectPushedSteps += 1
    oControl.kSelectPressed = 0
}
else
{
    oControl.kSelect = real(string_char_at(control_state, 11))
    if oControl.kSelect
        oControl.kSelectPressed = 1
    oControl.kSelectPushedSteps = 0
}
if oControl.kStart
{
    oControl.kStart = real(string_char_at(control_state, 12))
    oControl.kStartPushedSteps += 1
    oControl.kStartPressed = 0
}
else
{
    oControl.kStart = real(string_char_at(control_state, 12))
    if oControl.kStart
        oControl.kStartPressed = 1
    oControl.kStartPushedSteps = 0
}
if oControl.kWalk
{
    oControl.kWalk = real(string_char_at(control_state, 13))
    oControl.kWalkPushedSteps += 1
    oControl.kWalkPressed = 0
}
else
{
    oControl.kWalk = real(string_char_at(control_state, 13))
    if oControl.kWalk
        oControl.kWalkPressed = 1
    oControl.kWalkPushedSteps = 0
}
if oControl.kMorph
{
    oControl.kMorph = real(string_char_at(control_state, 14))
    oControl.kMorphPushedSteps += 1
    oControl.kMorphPressed = 0
}
else
{
    oControl.kMorph = real(string_char_at(control_state, 14))
    if oControl.kMorph
        oControl.kMorphPressed = 1
    oControl.kMorphPushedSteps = 0
}
if oControl.kMenu1
{
    oControl.kMenu1 = real(string_char_at(control_state, 15))
    oControl.kMenu1PushedSteps += 1
    oControl.kMenu1Pressed = 0
}
else
{
    oControl.kMenu1 = real(string_char_at(control_state, 15))
    if oControl.kMenu1
        oControl.kMenu1Pressed = 1
    oControl.kMenu1PushedSteps = 0
}
if oControl.kMenu2
{
    oControl.kMenu2 = real(string_char_at(control_state, 16))
    oControl.kMenu2PushedSteps += 1
    oControl.kMenu2Pressed = 0
}
else
{
    oControl.kMenu2 = real(string_char_at(control_state, 16))
    if oControl.kMenu2
        oControl.kMenu2Pressed = 1
    oControl.kMenu2PushedSteps = 0
}

frame += 1
