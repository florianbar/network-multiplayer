//Create event

/*
Link: http://gmc.yoyogames.com/index.php?showtopic=573988&p=4410524
The way I find the local IP of a device is by using a broadcast.
The broadcast is been sent to the local gateway, so the packet does not receive an external IP from your ISP.
*/
randomize();
var a = irandom_range(49152,65535);
var host = network_create_server(network_socket_udp, a, 4);

if host < 0
{
    show_message("Failed to create a broadcast server");
    game_end();
} 
else 
{
    var tsock = network_create_socket(network_socket_udp);
    var tbuff = buffer_create(32, buffer_fixed, 1);
	
    buffer_fill(tbuff, 0, buffer_bool, 0, 32);
    network_send_broadcast(tsock, a, tbuff, buffer_get_size(tbuff));
    network_destroy(tsock);
    buffer_delete(tbuff);
}