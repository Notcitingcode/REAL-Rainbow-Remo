// oRemo - Step Event

// 1. Handle Dash Cooldown & Flash Timer
if (dash_cooldown > 0) {
    dash_cooldown--;
    // Trigger a flash the exact moment cooldown hits 0
    if (dash_cooldown == 0) {
        dash_flash_timer = 8;
    }
}

if (dash_flash_timer > 0) {
    dash_flash_timer--;
}

// 2. Get Player Input (WASD or Arrow Keys)
var _move_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
var _move_left  = keyboard_check(ord("A")) || keyboard_check(vk_left);
var _move_down  = keyboard_check(ord("S")) || keyboard_check(vk_down);
var _move_up    = keyboard_check(ord("W")) || keyboard_check(vk_up);

var _h_input = _move_right - _move_left;
var _v_input = _move_down - _move_up;

// Track last direction moved for stationary dashes
if (_h_input != 0 || _v_input != 0) {
    last_h_input = _h_input;
    last_v_input = _v_input;
}

// 3. Trigger Dash on Shift press
if (keyboard_check_pressed(vk_shift) && dash_cooldown == 0 && dash_timer == 0) {
    dash_timer = dash_duration;
    dash_cooldown = dash_cooldown_max;
    
    // If standing still when pressing shift, dash in the last direction moved
    if (_h_input == 0 && _v_input == 0) {
        _h_input = last_h_input;
        _v_input = last_v_input;
    }
}

// 4. Determine current speed & spawn ghost trail
var _current_speed = move_speed;
if (dash_timer > 0) {
    _current_speed = dash_speed;
    dash_timer--;
    
    // Spawn a ghost trail every 2 frames during a dash
    if (dash_timer % 2 == 0) {
        var _ghost = instance_create_layer(x, y, layer, oDashGhost);
        _ghost.sprite_index = sprite_index;
        _ghost.image_index  = image_index;
        _ghost.image_xscale = image_xscale;
        _ghost.image_yscale = image_yscale;
        _ghost.image_blend  = image_blend; // Copies Remo's color tint!
    }
}

// Calculate movement speed variables
var _hsp = _h_input * _current_speed;
var _vsp = _v_input * _current_speed;

// 5. Horizontal Collision with oWall
if (place_meeting(x + _hsp, y, oWall)) {
    while (!place_meeting(x + sign(_hsp), y, oWall)) {
        x += sign(_hsp);
    }
    _hsp = 0;
    dash_timer = 0; // Cut dash short if hitting a wall
}
x += _hsp;

// 6. Vertical Collision with oWall
if (place_meeting(x, y + _vsp, oWall)) {
    while (!place_meeting(x, y + sign(_vsp), oWall)) {
        y += sign(_vsp);
    }
    _vsp = 0;
    dash_timer = 0; // Cut dash short if hitting a wall
}
y += _vsp;

// 7. Screen Boundary Clamp (Keeps Remo inside the 320x184 room)
// Account for the 24px top GUI bar so Remo stays on the dance floor
var _half_w = sprite_get_width(sprite_index) * 0.5;
var _half_h = sprite_get_height(sprite_index) * 0.5;

x = clamp(x, _half_w, room_width - _half_w);
y = clamp(y, 24 + _half_h, room_height - _half_h);