// Handles data from client packets
function ServerDataHandling(){
	
	var packet = async_load[? "buffer"]; //Load buffer created from player
	buffer_seek(packet, buffer_seek_start, 0);
	
	var packetID = buffer_read(packet, buffer_u8); //Read NETWORK enum from packet, which is always the first value
	
	switch (packetID)
	{
		case NETWORK.move:
			var player_ID =		buffer_read(packet, buffer_u16); //Must read buffer in the same order and
			var player_x =		buffer_read(packet, buffer_s16); //you must make sure the receiving buffer
			var player_y =		buffer_read(packet, buffer_s16); //type is the same as the sent buffer type.
			var player_imageXScale = buffer_read(packet, buffer_s16);
			var player_spriteIndex = buffer_read(packet, buffer_s16);
			var player_imageIndex = buffer_read(packet, buffer_s16);
			var player_imageSpeed = buffer_read(packet, buffer_s16);

			//Take packet info from one client and send to all the other clients
			var singleCliBuff = buffer_create(32, buffer_grow, 1);
			buffer_seek(singleCliBuff, buffer_seek_start, 0);
			buffer_write(singleCliBuff, buffer_u8, NETWORK.move);
			buffer_write(singleCliBuff, buffer_u16, player_ID);
			buffer_write(singleCliBuff, buffer_s16, player_x);
			buffer_write(singleCliBuff, buffer_s16, player_y);
			buffer_write(singleCliBuff, buffer_s16, player_imageXScale);
			buffer_write(singleCliBuff, buffer_s16, player_spriteIndex);
			buffer_write(singleCliBuff, buffer_s16, player_imageIndex);
			buffer_write(singleCliBuff, buffer_s16, player_imageSpeed);
			
			
			//Send packet to each client
			for (var i = 0; i < ds_list_size(total_players); i++)
			{
				network_send_packet(ds_list_find_value(total_players, i), singleCliBuff, buffer_tell(singleCliBuff));	
			}
			
			buffer_delete(singleCliBuff); //Always delete so game has no memory leaks
			break;
	}
}