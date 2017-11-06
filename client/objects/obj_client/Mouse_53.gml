/// @description Create a click and send it to the server
//instance_create_layer(mouse_x,mouse_y,"Instances",obj_click);

buffer_seek(buffer, buffer_seek_start, 0);
buffer_write(buffer, buffer_string, "click"); // buffer = "click"
buffer_write(buffer, buffer_u32, mouse_x);    // buffer = "click", socket, 120
buffer_write(buffer, buffer_u32, mouse_y);    // buffer = "click", socket, 120, 300

network_send_packet(socket, buffer, buffer_tell(buffer));