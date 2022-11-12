/// @descr Damage to Enemies

with (other)
{
	enemyHealth -= weaponDamage;
	lastHitDirection = other.direction;
}

instance_destroy();