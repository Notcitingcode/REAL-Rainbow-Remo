switch (state) {
    
    case GameState.DANCING:
        timer--;
        if (timer <= 0) {
            var _pattern = irandom(49);
            var _num_colors = array_length(global.palette);

            with (oTile) {
                switch (_pattern) {
                    case 0:  tile_color_id = (gx + gy) % _num_colors; break; 
                    case 1:  tile_color_id = gx % _num_colors; break;         
                    case 2:  tile_color_id = gy % _num_colors; break;         
                    case 3:  tile_color_id = abs(gx - gy) % _num_colors; break; 
                    case 4:  tile_color_id = (gx + gy * 2) % _num_colors; break; 
                    case 5:  tile_color_id = (gx div 3) % _num_colors; break;  
                    case 6:  tile_color_id = (gy div 2) % _num_colors; break;  
                    case 7:  tile_color_id = (gx * gy) % _num_colors; break;   
                    case 8:  tile_color_id = round(point_distance(gx, gy, 9.5, 4.5)) % _num_colors; break; 
                    case 9:  tile_color_id = (abs(gx - 9.5) + abs(gy - 4.5)) % _num_colors; break; 

                    case 10: tile_color_id = (gx == 0 || gx == 19 || gy == 0 || gy == 9) ? 1 : 0; break; 
                    case 11: tile_color_id = (abs(gx - 9.5) < 4 && abs(gy - 4.5) < 3) ? 2 : 3; break; 
                    case 12: tile_color_id = (gx == 9 || gx == 10 || gy == 4 || gy == 5) ? 4 : 5; break; 
                    case 13: tile_color_id = (gx == gy || gx + gy == 19) ? 0 : 1; break; 
                    case 14: tile_color_id = (gx % 5 == 0 || gy % 5 == 0) ? 2 : 4; break; 
                    case 15: tile_color_id = (abs(gx - 9.5) > 6) ? 3 : 5; break; 
                    case 16: tile_color_id = (abs(gy - 4.5) > 3) ? 1 : 0; break; 
                    case 17: tile_color_id = (gx - gy > 5 || gy - gx > 5) ? 2 : 3; break; 
                    case 18: tile_color_id = (gx + gy > 14) ? 4 : 1; break; 
                    case 19: tile_color_id = (point_distance(gx, gy, 9.5, 4.5) < 3.5) ? 5 : 2; break; 

                    case 20: 
                        var _is_heart = ((gy >= 1 && gy <= 3 && ((gx >= 2 && gx <= 7) || (gx >= 12 && gx <= 17))) || 
                                         (gy >= 4 && gy <= 8 && abs(gx - 9.5) <= (9 - gy)));
                        tile_color_id = _is_heart ? 0 : 5; 
                        break;
                    case 21:
                        var _is_eye = (gy == 3 && (gx == 6 || gx == 13));
                        var _is_smile = (gy == 6 && gx >= 6 && gx <= 13) || (gy == 7 && (gx == 5 || gx == 14));
                        tile_color_id = (_is_eye || _is_smile) ? 1 : 3;
                        break;
                    case 22:
                        var _is_arrow = (gx >= 8 && gx <= 11 && gy >= 2 && gy <= 8) || (gy == 2 && abs(gx - 9.5) <= 3) || (gy == 3 && abs(gx - 9.5) <= 2);
                        tile_color_id = _is_arrow ? 2 : 4;
                        break;
                    case 23:
                        var _is_check = (gy - gx == -2) || (gy - gx == -1) || (gx == 13 && gy == 3) || (gx == 12 && gy == 4) || (gx == 11 && gy == 5);
                        tile_color_id = _is_check ? 4 : 1;
                        break;
                    case 24:
                        tile_color_id = (abs(gx - 9.5) + abs(gy - 4.5) <= 4) ? 0 : 3;
                        break;
                    case 25:
                        var _is_flag = (gx >= 4 && gx <= 15 && gy >= 2 && gy <= 6) || (gx == 4 && gy >= 2 && gy <= 8);
                        tile_color_id = _is_flag ? 5 : 2;
                        break;
                    case 26:
                        var _dist = point_distance(gx, gy, 9.5, 4.5);
                        tile_color_id = (_dist < 1) ? 0 : ((_dist < 2.5) ? 2 : 4);
                        break;
                    case 27:
                        var _is_bolt = (gy == 2 && gx >= 9 && gx <= 11) || (gy == 3 && gx >= 8 && gx <= 10) || (gy == 4 && gx >= 7 && gx <= 9) || (gy == 5 && gx >= 9 && gx <= 11) || (gy >= 6 && gx >= 8 && gx <= 10);
                        tile_color_id = _is_bolt ? 1 : 5;
                        break;
                    case 28:
                        var _is_star = (gx == 9 || gx == 10) || (gy == 4 && gx >= 6 && gx <= 13) || (gy == 5 && gx >= 7 && gx <= 12) || (gy == 6 && (gx == 7 || gx == 12)) || (gy == 7 && (gx <= 6 || gx >= 13));
                        tile_color_id = _is_star ? 3 : 0;
                        break;
                    case 29:
                        tile_color_id = (abs(gx - 9.5) < 5 && abs(gy - 4.5) < 2) ? 2 : 3;
                        break;

                    case 30: tile_color_id = (gx ^ gy) % _num_colors; break;
                    case 31: tile_color_id = (gx + gy * gy) % _num_colors; break;
                    case 32: tile_color_id = (gx % 4 == gy % 4) ? 0 : 2; break;
                    case 33: tile_color_id = ((gx div 2) + (gy div 2)) % _num_colors; break;
                    case 34: tile_color_id = (gx * 3 + gy * 2) % _num_colors; break;
                    case 35: tile_color_id = (abs(gx - 9.5) * abs(gy - 4.5)) % _num_colors; break;
                    case 36: tile_color_id = ((gx + gy) % 2 == 0) ? (gx % _num_colors) : (gy % _num_colors); break;
                    case 37: tile_color_id = (gx ^ (gy * 2)) % _num_colors; break;
                    case 38: tile_color_id = (gx * gy) % 5 % _num_colors; break;
                    case 39: tile_color_id = irandom(_num_colors - 1); break;
                    case 40: tile_color_id = (gx + (gy * 3)) % _num_colors; break;
                    case 41: tile_color_id = (abs(gx - 9.5)) % _num_colors; break;
                    case 42: tile_color_id = (abs(gy - 4.5)) % _num_colors; break;
                    case 43: tile_color_id = (max(abs(gx - 9.5), abs(gy - 4.5))) % _num_colors; break;
                    case 44: tile_color_id = (gx + gy + irandom(1)) % _num_colors; break;
                    case 45: tile_color_id = (gx * 2 + gy) % _num_colors; break;
                    case 46: tile_color_id = (abs(gx - gy) % 3) % _num_colors; break;
                    case 47: tile_color_id = (gy * 4 - gx) % _num_colors; break;
                    case 48: tile_color_id = (gx % 3 == 0 && gy % 3 == 0) ? 1 : 4; break;
                    case 49: tile_color_id = (abs(gx - gy) % 4) % _num_colors; break;
                }
            }
            
            var _available_colors = [];
            with (oTile) {
                var _found = false;
                for (var i = 0; i < array_length(_available_colors); i++) {
                    if (_available_colors[i] == tile_color_id) {
                        _found = true;
                        break;
                    }
                }
                if (!_found) {
                    array_push(_available_colors, tile_color_id);
                }
            }
            
            if (array_length(_available_colors) > 0) {
                var _rand_index = irandom(array_length(_available_colors) - 1);
                target_color_id = _available_colors[_rand_index];
            } else {
                target_color_id = 0;
            }
            
            timer = round_time_max;
            state = GameState.PROMPT;
        }
        break;
        
    case GameState.PROMPT:
        timer--;
        if (timer <= 0) {
            state = GameState.CHECK;
        }
        break;
        
    case GameState.CHECK:
        var _tile_under_remo = instance_position(oRemo.x, oRemo.y, oTile);
        
        if (_tile_under_remo != noone && _tile_under_remo.tile_color_id == target_color_id) {
            score_count++;
            
            // CAPPED DIFFICULTY CURVE: Stops getting faster at 1.2 seconds so it remains playable!
            round_time_max = max(1.2 * room_speed, round_time_max - 8);
            
            timer = dance_delay;
            state = GameState.DANCING;
        } else {
            state = GameState.GAMEOVER;
        }
        break;
        
    case GameState.GAMEOVER:
        if (keyboard_check_pressed(ord("R"))) {
            game_restart();
        }
        break;
}