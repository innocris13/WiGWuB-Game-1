/// @desc Change sprite index to sNormalGreatsword

sprite_index = sNormalGreatsword;

with(other)
{
	equippedWeapon = sprite_get_name(other.sprite_index);
	equippedWeaponDamage = 10;
}

visible = false;