// This are common functuions
dzn_civCon_getDownCommand = {
	{
		private _unit = _x;
		while {(count (waypoints group _unit)) > 0} do
		{
			deleteWaypoint ((waypoints group _unit) select 0);
		};
		_unit setUnitPos "DOWN";
		if (round(random (100)) > 50) then { doStop _unit; };
	} forEach handle_getDownOrder;
};


dzn_civCon_getAwayCommand = {};

if (isNil "handle_getDownOrder") then { handle_getDownOrder = []; };
"handle_getDownOrder" addPublicVariableEventHandler  {
	[] spawn dzn_civCon_getDownCommand;
};


if !(hasInterface) exitWith {};

dzn_civCon_getAliveInfantriesNear = {
	// @ListOfUnits = @Side call dzn_civCon_getAliveInfantries
	private ["_units","_vehicles","_side"];
	_side = civilian;
	_units = (getPos player) nearEntities ["CAManBase", 25];
	_units = _units - allDead;
	
	_units = [_units, {side _x == _side}] call BIS_fnc_conditionalSelect;
	
	_units
};

dzn_civCon_getDownOrder = {
	if (currentWeapon player == "" || round(random 100) > 10) exitWith {};
	handle_getDownOrder = call dzn_civCon_getAliveInfantriesNear;
	publicVariable "handle_getDownOrder";
	[] spawn dzn_civCon_getDownCommand;
};
dzn_civCon_getAwayOrder = {};


player addAction ["Down!", { call dzn_civCon_getDownOrder }];
