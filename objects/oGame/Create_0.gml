global.palette = [
    make_color_rgb(224, 169, 166), 
    make_color_rgb(229, 193, 133), 
    make_color_rgb(168, 228, 160), 
    make_color_rgb(130, 196, 233), 
    make_color_rgb(180, 174, 232), 
    make_color_rgb(202, 126, 172)  
];

enum GameState {
    DANCING,
    PROMPT,
    CHECK,
    GAMEOVER
}

state = GameState.DANCING;

round_time_max = 3 * room_speed; 
timer = round_time_max;          
dance_delay = 1.2 * room_speed;  
target_color_id = 0;
score_count = 0;

// Generate tiles starting 24 pixels down so they don't overlap the top UI bar
var _tile_size = 16;
var _y_offset = 24; 
for (var _x = 0; _x < room_width; _x += _tile_size) {
    for (var _y = _y_offset; _y < _y_offset + 160; _y += _tile_size) {
        var _inst = instance_create_layer(_x + _tile_size/2, _y + _tile_size/2, "Instances", oTile);
        _inst.tile_color_id = irandom(array_length(global.palette) - 1);
    }
}

// Window Scaling Fix
var _scale = 4; // Or your preferred scale factor

window_set_size(320 * _scale, 184 * _scale);
surface_resize(application_surface, 320, 184);
window_center();

gpu_set_texfilter(false);

music_inst = audio_play_sound(aMusic, 10, true); // Start background music looping immediately

display_set_gui_size(320, 184);