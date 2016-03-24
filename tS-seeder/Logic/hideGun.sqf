player setVariable ["dzn_hiddenGun_isGunHidden", false];

dzn_unhideHandgun = {
	private _handgun = (player getVariable "dzn_hiddenGun") select 0;	
	private _handgunAccessories = (player getVariable "dzn_hiddenGun") select 1;
	private _handgunMagazine = (player getVariable "dzn_hiddenGun") select 2;
	private _handgunMagazineAmmo = (player getVariable "dzn_hiddenGun") select 3;

	private _curUniformItems = uniformItems player; 
	{ player removeItemFromUniform _x; } forEach _curUniformItems;
	player addMagazine [_handgunMagazine,_handgunMagazineAmmo];
	player addWeapon _handgun;
	{ player addHandgunItem _x; } forEach _handgunAccessories;	
	player selectWeapon _handgun;
	player setAmmo [handgunWeapon player, _handgunMagazineAmmo];	
	{ player addItemToUniform _x} forEach _curUniformItems;	
	
	player setVariable ["dzn_hiddenGun_isGunHidden", false];
};

dzn_hideHandgun = {
	private _handgun = handgunWeapon player;
	if (_handgun == "") exitWith {};
	private _handgunAccessories = handgunItems player;
	private _handgunMagazine = handgunMagazine player select 0;
	private _handgunMagazineAmmo = player ammo (handgunWeapon player);
	
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
	
	player removeWeapon _handgun;	
};

hideHandgun_action = [ "dzn_services_action", "Hide Gun", "", { call dzn_hideHandgun }, { handgunWeapon player != "" }]  call ace_interact_menu_fnc_createAction; 
[typeOf player, 1, [ "ACE_SelfActions" ], hideHandgun_action ] call ace_interact_menu_fnc_addActionToClass;

drawHandgun_action = [ "dzn_services_action", "Draw Gun", "", { call dzn_unhideHandgun }, { player getVariable "dzn_hiddenGun_isGunHidden" }]  call ace_interact_menu_fnc_createAction; 
[typeOf player, 1, [ "ACE_SelfActions" ], drawHandgun_action ] call ace_interact_menu_fnc_addActionToClass;
