/// @desc Initialize Server

port = 7676; //Port for connecting clients
max_players = 8;

server = network_create_server(network_socket_tcp, port, max_players);
total_players = ds_list_create();

while (server < 0 && port < 10000)
{
    port++
    server = network_create_server(network_socket_tcp, port, max_players);
}

if (server < 0)//Server returns # less than 0 if the creation fails.
{
	show_message("Error when starting the server.");
	game_restart();
}