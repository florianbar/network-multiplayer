/// @description Initialize the client
var type = network_socket_tcp;
var ip = "192.168.8.100"; //server's ip address (maybe store in db) (use server project's obj_server_ip to retrieve ip address)
var port = 8000; // the channel the server is using
socket = network_create_socket(type);
connection = network_connect(socket,ip,port); // connect to the server

// Create a buffer to sent data through the socket(tube)
buffer = buffer_create(1024, buffer_fixed, 1);

client_number = undefined;
