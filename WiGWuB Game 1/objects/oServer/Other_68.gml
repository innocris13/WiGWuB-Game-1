/// @desc Server connecting/disconnecting and server/client exchanges

var data_type = async_load[? "type"]; //Type of server action

switch(data_type)
{
	case network_type_connect:
		var player_socket = async_load[? "socket"];
		ds_list_add(total_players, player_socket);
		break;
	case network_type_disconnect:
		var disconnect_socket = async_load[? "socket"];
		ds_list_delete(total_players, ds_list_find_index(total_players, disconnect_socket));
		break;
	case network_type_data:
		ServerDataHandling();
		break;
}