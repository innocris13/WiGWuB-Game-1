/// @description Handle receiving packets from server/other clients

var packet = async_load[? "buffer"];
buffer_seek(packet, buffer_seek_start, 0);

var packet_ID = buffer_read(packet, buffer_u8);

switch (packet_ID) //Read network enum from packet sent from server
{
	case NETWORK.move:
		var player_ID = buffer_read(packet, buffer_u16); //Same order and same type
		var playerToAssignPacket = ds_map_find_value(instances, player_ID); //Find player that correlates to packet sent from server
		
		//If no player exists, then we should create one.
		if (is_undefined(playerToAssignPacket))
		{
			var newPlayer = instance_create_layer(62, 580, "Player", oPlayer);
			ds_map_add(instances, player_ID, newPlayer);
		}
		else //Assign packet to found player 
		{
			if(playerID != player_ID && instance_exists(playerToAssignPacket))
			{
				//Read buffer data regarding player
				var player_x = buffer_read(packet, buffer_s16);
				var player_y = buffer_read(packet, buffer_s16);
				
				//Assign buffer data to player
				playerToAssignPacket.x = player_x;
				playerToAssignPacket.y = player_y;
			}
		}
		break;
}