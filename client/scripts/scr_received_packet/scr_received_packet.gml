///scr_received_packet(buffer)

var buffer = argument[0];
var event_name = buffer_read(buffer, buffer_string);

switch event_name
{
	case "client number":
		client_number = buffer_read(buffer, buffer_u8);
		break;
		
	case "click":
		var mouseX = buffer_read(buffer, buffer_u32);
		var mouseY = buffer_read(buffer, buffer_u32);
		instance_create_layer(mouseX,mouseY,"Instances",obj_click);
		break;
}
