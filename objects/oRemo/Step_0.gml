// 1. Get Player Input (WASD or Arrow Keys)
var _move_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
var _move_left  = keyboard_check(ord("A")) || keyboard_check(vk_left);
var _move_down  = keyboard_check(ord("S")) || keyboard_check(vk_down);
var _move_up    = keyboard_check(ord("W")) || keyboard_check(vk_up);

var _h_input = _move_right - _move_left;
var _v_input = _move_down - _move_up;

// Calculate intended movement vector
var _hsp = _h_input * move_speed;
var _vsp = _v_input * move_speed;

// 2. Horizontal Collision with oWall
if (place_meeting(x + _hsp, y, oWall)) {
    // Move pixel by pixel until we hit the wall
    while (!place_meeting(x + sign(_hsp), y, oWall)) {
        x += sign(_hsp);
    }
    _hsp = 0;
}
x += _hsp;

// 3. Vertical Collision with oWall
if (place_meeting(x, y + _vsp, oWall)) {
    // Move pixel by pixel until we hit the wall
    while (!place_meeting(x, y + sign(_vsp), oWall)) {
        y += sign(_vsp);
    }
    _vsp = 0;
}
y += _vsp;

// 4. Screen Boundary Clamp (Keeps Remo inside the 320x160 room)
// Assumes sprite origin is set to "Middle Center" (8px offset)
var _half_w = sprite_get_width(sprite_index) * 0.5;
var _half_h = sprite_get_height(sprite_index) * 0.5;

x = clamp(x, _half_w, room_width - _half_w);
y = clamp(y, _half_h, room_height - _half_h);