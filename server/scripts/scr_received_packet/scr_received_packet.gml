///scr_received_packet(buffer)

var buffer = argument[0]; // buffer = 1, 120, 300

var message_id = buffer_read(buffer, buffer_u8);  // buffer = 120, 300
var event_name = buffer_read(buffer, buffer_string); //
var mouseX	   = buffer_read(buffer, buffer_u32); // buffer = 300
var mouseY     = buffer_read(buffer, buffer_u32); // buffer = ...

switch event_name
{
	case "click":
		instance_create_layer(mouseX,mouseY,"Instances",obj_click);
		break;
}


// Send buffer to all clients except the one who sent it
for (var i = 0; i < ds_list_size(sockets); i++) {
	var buffer = buffer_create(1024, buffer_fixed, 1);

	buffer_seek(buffer, buffer_seek_start, 0);
	buffer_write(buffer, buffer_u8,     message_id);      
	buffer_write(buffer, buffer_string, event_name);  
	buffer_write(buffer, buffer_u32,    mouseX);
	buffer_write(buffer, buffer_u32,    mouseY);

	//network_send_packet(sockets[| i], buffer, buffer_tell(buffer));
	network_send_packet(sockets[| i], buffer, buffer_tell(buffer))
}


