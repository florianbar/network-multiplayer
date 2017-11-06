///scr_received_packet(buffer)

var buffer = argument[0];
var event_name = buffer_read(buffer, buffer_string);

switch event_name
{
	case "click":
		var mouseX = buffer_read(buffer, buffer_u32); // buffer = 300
		var mouseY = buffer_read(buffer, buffer_u32); // buffer = ...

		instance_create_layer(mouseX,mouseY,"Instances",obj_click);
		
		// Send buffer to all clients except the one who sent it
		for (var i = 0; i < ds_list_size(sockets); i++) {
			var buffer = buffer_create(1024, buffer_fixed, 1);

			buffer_seek(buffer, buffer_seek_start, 0);     
			buffer_write(buffer, buffer_string, event_name);  
			buffer_write(buffer, buffer_u32,    mouseX);
			buffer_write(buffer, buffer_u32,    mouseY);

			//network_send_packet(sockets[| i], buffer, buffer_tell(buffer));
			network_send_packet(sockets[| i], buffer, buffer_tell(buffer))
		}
		
		break;
}




