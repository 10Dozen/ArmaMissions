// This are common functuions
dzn_civCon_getDownCommand = {};
dzn_civCon_getAwayCommand = {};

if (isNil "handle_getDownOrder") then { handle_getDownOrder = []; };
"handle_getDownOrder" addPublicVariableEventHandler  {
	[] spawn {
		doStop handle_getDownOrder;
		{
			private _unit = _x;
			for "_i" from 0 to count(waypoints _unit)-1 do {
				deleteWaypoint [group _unit, _i];
			};
			setUnitPos "DOWN";
		} forEach handle_getDownOrder;
	};
};


if !(hasInterface) exitWith {};

dzn_civCon_getAliveInfantriesNear = {
	// @ListOfUnits = @Side call dzn_civCon_getAliveInfantries
	private ["_units","_vehicles","_side"];
	_side = if !(isNil _this) then { _this } else { "" };
	_units = (getPos player) nearEntities ["CAManBase", 25];
	_units = _units - allDead;
	
	if !(_side == "") then { 
		_units = [_units, {side _x == _side}] call BIS_fnc_conditionalSelect;
	};
	
	_units
};

dzn_civCon_getDownOrder = {
	if (currentWeapon player == "" || round(random 100) > 20) exitWith {};
	handle_getDownOrder = call dzn_civCon_getAliveInfantriesNear;
	publicVariable "handle_getDownOrder";
};
dzn_civCon_getAwayOrder = {};

