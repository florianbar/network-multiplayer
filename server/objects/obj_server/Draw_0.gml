/// @description Insert description here
// You can write your code in this editor
draw_text(15,15,"Server");

// how many clients are connected
draw_text(15,40,"Clients: " + string(ds_list_size(sockets)));