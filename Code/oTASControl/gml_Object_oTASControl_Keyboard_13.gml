if joystick_exists(global.opjoyid)
    global.joydetected = 1
else
    global.joydetected = 0
oControl.init = 0
room_change(19, 0)
instance_destroy()
