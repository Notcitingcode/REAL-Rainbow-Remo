// oGame - Draw GUI Event

var _gui_w = display_get_gui_width();

// Draw a clean top status bar background spanning full width
draw_rectangle_color(0, 0, _gui_w, 24, c_dkgray, c_dkgray, c_black, c_black, false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (state == GameState.PROMPT) {
    // Timer bar on the left side
    var _bar_width = (timer / round_time_max) * 60;
    draw_rectangle_color(10, 8, 10 + _bar_width, 16, c_white, c_white, c_white, c_white, false);
    
    // Prompt text and target color swatch
    draw_text_color(190, 12, "GO TO:", c_white, c_white, c_white, c_white, 1);
    
    if (target_color_id >= 0 && target_color_id < array_length(global.palette)) {
        draw_sprite_ext(sTile, 0, 240, 12, 0.75, 0.75, 0, global.palette[target_color_id], 1);
    }
    
    // Show current score on the far right
    draw_text_color(285, 12, "Score:" + string(score_count), c_yellow, c_yellow, c_yellow, c_yellow, 1);
} 
else if (state == GameState.DANCING) {
    draw_text_color(160, 12, "GROOVE! (Score: " + string(score_count) + ")", c_lime, c_lime, c_lime, c_lime, 1);
} 
else if (state == GameState.GAMEOVER) {
    draw_set_alpha(0.85);
    draw_rectangle_color(40, 40, 280, 144, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1.0);
    
    draw_text_color(160, 70, "GAME OVER!", c_red, c_red, c_red, c_red, 1);
    draw_text_color(160, 95, "Final Score: " + string(score_count), c_white, c_white, c_white, c_white, 1);
    draw_text_color(160, 120, "Press 'R' to Restart", c_yellow, c_yellow, c_yellow, c_yellow, 1);
}