b = uniformItems player; 
{ player removeItemFromUniform _x; } forEach b;
player addMagazine "rhsusf_mag_17Rnd_9x19_JHP"; 
player addWeapon a; 
player setAmmo [a, 100]; 
{ player addItemToUniform _x} forEach b;


unhideHandgun = {
	private _handgun = (player getVariable "dzn_hiddenGun") select 0;
	private _handgunAccessories = (player getVariable "dzn_hiddenGun") select 1;
	private _handgunMagazine = (player getVariable "dzn_hiddenGun") select 2;
	private _handgunMagazineAmmo = (player getVariable "dzn_hiddenGun") select 3;

	player addMagazine _handgunMagazine;
	player addWeapon _handgun;
	{ player addHandgunItem _x; } forEach _handgunAccessories;
	player selectWeapon _handgun;
	player setAmmo [handgunWeapon player, _handgunMagazineAmmo];	
	
	player setVariable ["dzn_hiddenGun_isGunHidden", false];
};

hideHandgun = {
	private _handgun = handgunWeapon player;
	private _handgunAccessories = handgunItems player;
	private _handgunMagazine = handgunMagazine player select 0;
	private _handgunMagazineAmmo = player ammo (handgunItems player);
	
	player setVariable ["dzn_hiddenGun_isGunHidden", true];
	player setVariable [
		"dzn_hiddenGun"
		, [ 
			_handgun
			, _handgunAccessories 
			, _handgunMagazine
			, _handgunMagazineAmmo
		]
	];
	
	removeHandgun player;	
};
