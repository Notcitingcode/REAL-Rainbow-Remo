move_speed = 2; // Adjust speed as needed for a 16x16 character

// Choose your scale multiplier (e.g., 4x makes it 1280x640)
var _scale = 4; 

// Resize the game window
window_set_size(320 * _scale, 160 * _scale);

// Center the window on your computer monitor
window_center();

// Optional: Ensure pixel art stays crisp and doesn't get blurry when scaled
gpu_set_texfilter(false);