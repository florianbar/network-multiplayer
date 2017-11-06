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
		
	// When data is being received
	case network_type_data:
		var buffer = async_load[? "buffer"];
		buffer_seek(buffer, buffer_seek_start, 0);
		scr_received_packet(buffer);
		
		break;
}
