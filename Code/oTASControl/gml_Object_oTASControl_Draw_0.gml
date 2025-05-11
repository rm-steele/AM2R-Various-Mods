// draw the TAM2R autom
draw_self()

// setup the font parameters
draw_set_font(fontMenuSmall)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white)
draw_set_alpha(1)

// draw static text
draw_text(4, 4, string_upper("Welcome to the TAS menu#Use [UP], [DOWN], and [TAB] to navigate#Use [LEFT] and [RIGHT] to edit options"))
draw_text(4, 225, string_upper("Press [ENTER] to start the game with these settings"))

// draw menu options
for (i = 0; i <= lastIndex; i++)
{
    draw_set_halign(fa_left)
    if (i == selectedOption)
        draw_set_color(c_lime)
    else
        draw_set_color(c_white)
    draw_text(4, (48 + 12 * i), text[i])
    draw_set_halign(fa_right)
    draw_text(312, (48 + 12 * i), string(status[i]))
}
