/// @desc Initialize Client

port = 7676;
ip = "127.0.0.1"; //Localhost IP (Default IP) for testing

network_set_config(network_config_connect_timeout, 5000); //Timeout after 5s
client = network_create_socket(network_socket_tcp);
network_connect(client, ip, port);

//Create Player Data Model
instances = ds_map_create();
playerID = 0;
Player = instance_create_layer(62, 580, "Player", oPlayer); //NEED TO CHANGE (62,580) to a set position in room1
playerID = Player.pID;

ds_map_add(instances, playerID, Player);

//Error handling
if(client < 0)
{
	show_message("Error when connecting to server.");
	game_restart();
}