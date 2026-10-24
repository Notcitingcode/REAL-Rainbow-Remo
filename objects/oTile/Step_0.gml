// oTile - Step Event
// This safely grabs the color from your global array and tints the white sprite
if (tile_color_id >= 0 && tile_color_id < array_length(global.palette)) {
    image_blend = global.palette[tile_color_id];
}