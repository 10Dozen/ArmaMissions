dzn_fnc_serviceVehicle = {	
	if (player == vehicle player) exitWith {};
	
	private "_v";	
	_v = vehicle player;	
	1000 cutText ["Vehicle Servicing", "PLAIN"];
	sleep 1;
	
	_v setDamage 0;
	{
		_v setHit [_x, 0];	
	} forEach [
		"wheel_1"
		,"wheel_2"
		,"wheel_3"
		,"wheel_4"
		,"pas_L"
		,"pas_P"
	];	
	
	_v setFuel 1;
	_v setVehicleAmmo 1;
	
	sleep 1;
	1000 cutText ["Vehicle Servicing - Done", "PLAIN"];
};