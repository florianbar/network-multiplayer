/// @description Initialize the serverobject
var type = network_socket_tcp;
var port = 8000; //the channel the server is created on, the clients need to point to it to connect
max_clients = 4;

// Create a socket list to store connected clients in
sockets = ds_list_create();

server = network_create_server(type, port, max_clients);