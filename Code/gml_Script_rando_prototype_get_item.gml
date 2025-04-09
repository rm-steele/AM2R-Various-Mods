var mid, smid, pbid, eid;
mid[0] = 52
mid[1] = 53
mid[2] = 54
mid[3] = 55
mid[4] = 56
mid[5] = 57
mid[6] = 60
mid[7] = 100
mid[8] = 101
mid[9] = 102
mid[10] = 104
mid[11] = 105
mid[12] = 106
mid[13] = 107
mid[14] = 109
mid[15] = 111
mid[16] = 150
mid[17] = 151
mid[18] = 152
mid[19] = 153
mid[20] = 154
mid[21] = 155
mid[22] = 156
mid[23] = 159
mid[24] = 161
mid[25] = 163
mid[26] = 202
mid[27] = 203
mid[28] = 204
mid[29] = 205
mid[30] = 208
mid[31] = 210
mid[32] = 211
mid[33] = 214
mid[34] = 250
mid[35] = 252
mid[36] = 255
mid[37] = 257
mid[38] = 259
mid[39] = 303
mid[40] = 304
mid[41] = 307
mid[42] = 308
mid[43] = 309
smid[0] = 51
smid[1] = 110
smid[2] = 162
smid[3] = 206
smid[4] = 207
smid[5] = 209
smid[6] = 215
smid[7] = 256
smid[8] = 300
smid[9] = 305
pbid[0] = 58
pbid[1] = 59
pbid[2] = 112
pbid[3] = 160
pbid[4] = 212
pbid[5] = 213
pbid[6] = 253
pbid[7] = 258
pbid[8] = 301
pbid[9] = 302
eid[0] = 50
eid[1] = 103
eid[2] = 108
eid[3] = 157
eid[4] = 158
eid[5] = 200
eid[6] = 201
eid[7] = 251
eid[8] = 254
eid[9] = 306
oControl.prototype_idx++
switch (oControl.final_placements[oControl.prototype_idx])
{
    case 15:
        oControl.mtanks_placed++
        return mid[oControl.mtanks_placed];
    case 16:
        oControl.smtanks_placed++
        return smid[oControl.smtanks_placed];
    case 17:
        oControl.pbtanks_placed++
        return pbid[oControl.pbtanks_placed];
    case 18:
        oControl.etanks_placed++
        return eid[oControl.etanks_placed];
    default:
        return oControl.final_placements[oControl.prototype_idx];
}