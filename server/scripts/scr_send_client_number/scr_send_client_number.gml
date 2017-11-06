///scr_send_client_number(socket)

var socket = argument[0];
var buffer = buffer_create(1024, buffer_fixed, 1);

buffer_seek(buffer, buffer_seek_start, 0);
buffer_write(buffer, buffer_string, "client number"); // buffer = "client number"
buffer_write(buffer, buffer_u8, socket);              // buffer = "client number", 1  

network_send_packet(socket, buffer, buffer_tell(buffer));