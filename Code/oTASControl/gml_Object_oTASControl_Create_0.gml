// option type constants
OPTIONTYPE_BOOL = 1 // either on or off
OPTIONTYPE_INT = 2 // tracks an integer in a specified range and is modified through left and right presses
OPTIONTYPE_MSGBOX_INT = 3 // tracks an integer modified by getting input from a text box

// variables that need to be tracked or have use outside of the menu code
global.gameSpeed = 60
global.gameSpeedIsAbsolute = 1 // whether the game speed is modified in menus and transitions
global.tasMode = 0 // 1 = recording, 2 = playback, to be expanded as needed
global.startingRNGSeed = -1

timer = 0 // timer for repeating inputs when option editing
lastIndex = 4 // the index of the final item in the list
selectedOption = 0 // currently highlighted menu option

// menu option strings
text[0] = string_upper("Record on game start")
text[1] = string_upper("Playback on game start")
text[2] = string_upper("Game speed")
text[3] = string_upper("Use this speed even outside of gameplay")
text[4] = string_upper("RNG seed")

// what the options are set to
status[0] = 0
status[1] = 0
status[2] = 60
status[3] = 1
status[4] = 0 // set to 0 for vanilla compatibility

// their type
type[0] = OPTIONTYPE_BOOL
type[1] = OPTIONTYPE_BOOL
type[2] = OPTIONTYPE_INT
type[3] = OPTIONTYPE_BOOL
type[4] = OPTIONTYPE_MSGBOX_INT

// "general purpose" values: storage for menu options that differs per type
// bool: option to set to 0 when set to 1, -1 if none
// int: minimum value
// msgbox_int: message text
gp1[0] = 1
gp1[1] = 0
gp1[2] = 1
gp1[3] = -1
gp1[4] = "Enter the seed for random numbers (0-10 digits, -1 = random seed)#Note that this is independent from the file's item randomization seed#This value is overwritten when playing back a recording."

// bool: unused
// int: maximum value
// msgbox_int: message box callback ID for AsyncDialog
gp2[0] = -1
gp2[1] = -1
gp2[2] = 120
gp2[3] = -1
gp2[4] = 0


if (file_exists("tas-preset-files/sav1") || file_exists("tas-preset-files/~sav1"))
    file_delete("sav1")
if (file_exists("tas-preset-files/sav1"))
    file_copy("tas-preset-files/sav1", "sav1")

if (file_exists("tas-preset-files/sav2") || file_exists("tas-preset-files/~sav2"))
    file_delete("sav2")
if (file_exists("tas-preset-files/sav2"))
    file_copy("tas-preset-files/sav2", "sav2")

if (file_exists("tas-preset-files/sav3") || file_exists("tas-preset-files/~sav3"))
    file_delete("sav3")
if (file_exists("tas-preset-files/sav3"))
    file_copy("tas-preset-files/sav3", "sav3")

if (file_exists("tas-preset-files/config.ini") || file_exists("tas-preset-files/~config.ini"))
    file_delete("config.ini")
if (file_exists("tas-preset-files/config.ini"))
    file_copy("tas-preset-files/config.ini", "config.ini")