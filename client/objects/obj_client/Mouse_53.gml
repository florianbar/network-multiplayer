/// @description Create a click and send it to the server
//instance_create_layer(mouse_x,mouse_y,"Instances",obj_click);

buffer_seek(buffer, buffer_seek_start, 0);

buffer_write(buffer, buffer_u8, 1);         // buffer = 1
buffer_write(buffer, buffer_string, "click"); // buffer = 1, "click"
buffer_write(buffer, buffer_u32, mouse_x);  // buffer = 1, "click", socket, 120
buffer_write(buffer, buffer_u32, mouse_y);  // buffer = 1, "click", socket, 120, 300

network_send_packet(socket, buffer, buffer_tell(buffer));