if (hasweapon)
{
	mygun = instance_create_layer(x,y,"Items",oEvilWizardStaff)
	with (mygun)
	{
		owner = other.id	
	}
}
else mygun = noone;