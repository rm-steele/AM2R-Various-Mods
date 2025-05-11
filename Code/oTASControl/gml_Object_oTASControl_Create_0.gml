OPTIONTYPE_BOOL = 1
OPTIONTYPE_INT = 2
OPTIONTYPE_MSGBOX_INT = 3

gameSpeed = 60
gameSpeedIsAbsolute = 1
global.tasMode = 0
spawnTestKeys = 0
saveStateSelected = -1

lastIndex = 3
selectedOption = 0

text[0] = "Record on game start"
text[1] = "Playback on game start"
text[2] = "Game speed"
text[3] = "RNG seed"

status[0] = 0
status[1] = 0
status[2] = 60
status[3] = 1234567890

type[0] = OPTIONTYPE_BOOL
type[1] = OPTIONTYPE_BOOL
type[2] = OPTIONTYPE_INT
type[3] = OPTIONTYPE_MSGBOX_INT

gp1[0] = 0
gp1[1] = 0
gp1[2] = 1
gp1[3] = "Enter the seed for random numbers (0-10 digits, -1 = random seed)#Note that this is independent from the file's item randomization seed"

gp2[0] = 0
gp2[1] = 0
gp2[2] = 120
gp2[3] = 0