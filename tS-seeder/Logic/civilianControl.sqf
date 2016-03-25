// This are common functuions
dzn_civCon_getDownCommand = {};
dzn_civCon_getAwayCommand = {};

if !(hasInterface) exitWith {};

dzn_civCon_getAliveInfantries = {
	// @ListOfUnits = @Side call dzn_civCon_getAliveInfantries
	private ["_units","_vehicles","_side"];
	_side = if !(isNil _this) then { _this } else { "" };
	_units = entities "CAManBase";
	_vehicles = vehicles;
	{ if (alive _x) then {_units = _units + (crew _x);}; } forEach _vehicles;
	
	_units = _units - allDead;
	if !(_side == "") then { 
		_units = [_units, {side _x == _side}] call BIS_fnc_conditionalSelect;
	};
	
	_units
};

dzn_civCon_getDownOrder = {
	
};
dzn_civCon_getAwayOrder = {};

