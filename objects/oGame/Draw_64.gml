// Set your custom font as the active font for all text drawing
draw_set_font(fText);

var _gui_w = display_get_gui_width();

// Draw a clean top status bar background spanning full width
draw_rectangle_color(0, 0, _gui_w, 24, c_dkgray, c_dkgray, c_black, c_black, false);
draw_set_valign(fa_middle);

if (state == GameState.PROMPT) {
    // Timer bar on the left side
    var _bar_width = (timer / round_time_max) * 60;
    draw_rectangle_color(12, 8, 12 + _bar_width, 16, global.palette[0], global.palette[0], global.palette[0], global.palette[0], false);
    
    // "GO TO:" text & color swatch properly aligned together
    draw_set_halign(fa_left);
    var _prompt_x = 110;
    
    // Ensure target_color_id is always safely clamped within palette bounds
    if (target_color_id < 0 || target_color_id >= array_length(global.palette)) {
        target_color_id = 0;
    }
    
    // Make "GO TO:" match the current target color
    var _target_col = global.palette[target_color_id];
    draw_text_color(_prompt_x, 12, "GO TO:", _target_col, _target_col, _target_col, _target_col, 1);
    
    // Draw color swatch with a fixed, stable size (no growing!)
    // Using a clean width scale of 1.5 and height scale of 0.75
    draw_sprite_ext(sTile, 0, _prompt_x + 87, 12, 1.5 * 3, 0.75, 0, _target_col, 1);
    
    // Score on the right side using palette white
    draw_set_halign(fa_right);
    draw_text_color(308, 12, "SCORE: " + string(score_count), global.palette[0], global.palette[0], global.palette[0], global.palette[0], 1);
    
} 
else if (state == GameState.DANCING) {
    draw_set_halign(fa_center);
    draw_text_color(160, 12, "(SCORE: " + string(score_count) + ")", global.palette[2], global.palette[2], global.palette[2], global.palette[2], 1);
} 
else if (state == GameState.GAMEOVER) {
    draw_set_alpha(0.85);
    draw_rectangle_color(40, 40, 280, 144, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1.0);
    
    draw_set_halign(fa_center);
    draw_text_color(160, 70, "GAME OVER!", global.palette[5], global.palette[5], global.palette[5], global.palette[5], 1);
    draw_text_color(160, 95, "FINAL SCORE: " + string(score_count), global.palette[0], global.palette[0], global.palette[0], global.palette[0], 1);
    draw_text_color(160, 120, "PRESS 'R' TO RESTART", global.palette[1], global.palette[1], global.palette[1], global.palette[1], 1);
}

// Reset alignment default back to center/left
draw_set_halign(fa_left);