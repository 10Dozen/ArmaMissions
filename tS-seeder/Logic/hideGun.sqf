unhideHandgun = {



};

hideHandgun = {
	_handgun = handgun player;
	_handgunAccessories = "";
	_handgunMagazine = "";
	_handgunMagazineAmmo = "";
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
