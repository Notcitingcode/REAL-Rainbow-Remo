// oRemo - Create Event
move_speed = 2;          // Normal walking speed
dash_speed = 6;          // Burst speed during a dash
dash_duration = 10;      // How many frames the dash lasts
dash_timer = 0;          // Countdown timer for active dash
dash_cooldown = 0;       // Cooldown timer between dashes
dash_cooldown_max = 30;  // Frames to wait before dashing again

// Remember last movement direction so Remo can dash in place if standing still
last_h_input = 1; 
last_v_input = 0;

dash_flash_timer = 0;