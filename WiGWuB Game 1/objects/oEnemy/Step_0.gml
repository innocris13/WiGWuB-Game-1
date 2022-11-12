/// @desc Enemy AI / Animation

distToPlayer = distance_to_object(oPlayer);

//Gravity
vsp = vsp + grv;

//Horizontal Collision
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

//Verticle Collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

if(distToPlayer < chaseEngageDist)
{
	direction = point_direction(x,y, oPlayer.x, oPlayer.y);
	speed = walksp;
}
else
{
	speed = 0;	
}