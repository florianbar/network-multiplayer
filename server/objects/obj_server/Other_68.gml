/// @description Check for clients and data

/* 
'async_load' is like the reponse object in Ajax
---
async_load = {
	type	: network_type_connect,
	socket	: 2340901,
	buffer	: {},
};
*/
var type_event = async_load[? "type"];

switch type_event {
	
	// When a socket/client connects
	// Add the client to the socket list if he hasn't already been
	case network_type_connect:
	
		var client = async_load[? "socket"];
		var client_exists = false;
		
		for (var i = 0; i < ds_list_size(sockets); i++) {
			if (ds_list_find_value(sockets, i) == client) {
				client_exists = true;
				break;
			}
		}
		
		if (!client_exists) 
		{
			ds_list_add(sockets, client);
			scr_send_client_number(client);
		}
		
		break;
	
	// When a socket/client disconnect
	// Remove the client from the socket list 
	case network_type_disconnect:
		
		var client = async_load[? "socket"];
		
		for (var i = 0; i < ds_list_size(sockets); i++) {
			if (ds_list_find_value(sockets, i) == client) {
				ds_list_delete(sockets, i);
				break; 
			}
		}
		
		break;
		
	// When data is being received
	case network_type_data:
		var buffer = async_load[? "buffer"];
		
		buffer_seek(buffer, buffer_seek_start, 0);
		scr_received_packet(buffer);
		
		break;
}