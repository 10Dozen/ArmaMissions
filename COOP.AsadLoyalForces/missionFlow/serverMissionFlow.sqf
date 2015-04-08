#define DEBUG	true
//#define DEBUG false

#include "defines.sqf"


//	**********************************************
//	Select random main objectives
//	**********************************************
[] spawn {
	// Locations
	_locationsForSeize = nearestLocations [ [0,0,0], ["NameCityCapital","NameCity"], 20000];
	_locationsForRecon = nearestLocations [ [0,0,0], ["NameCity","NameVillage"], 20000];
	
	// Filter locations from blacklisted locations
	dzn_fnc_loc_filter = {
		// [location list, blacklist] call dzn_fnc_loc_filter
		private ["_output"];
		_output = [];
		{
			if !(text _x in (_this select 1)) then {
				_output = _output + [_x];
			};
		} forEach (_this select 0);
		_output
	};
	
	_locationsForSeize = [_locationsForSeize, dzn_locs_blacklist] call dzn_fnc_loc_filter;
	_locationsForRecon = [_locationsForRecon, dzn_locs_blacklist] call dzn_fnc_loc_filter;
	
	dzn_loc_seize = [];
	dzn_loc_recon = [];
	
	// Pick 2 locations for Seize
	for "_i" from 0 to 1 do {
		_loc = _locationsForSeize call BIS_fnc_selectRandom;
		dzn_loc_seize = dzn_loc_seize + [_loc];
		_locationsForSeize = _locationsForSeize - [_loc];
	};
	
	// Pick 3 locations for Recon
	for "_i" from 0 to 2 do {
		_loc = _locationsForRecon call BIS_fnc_selectRandom;
		_locationsForRecon = _locationsForRecon - [_loc];
		if (_loc in dzn_loc_seize) then {
			_i = _i - 1;
		} else {
			dzn_loc_recon = dzn_loc_recon + [_loc];
		};
	};
	
	dzn_loc_hiddenSeize = dzn_loc_recon call BIS_fnc_selectRandom;
	
	publicVariable "dzn_loc_seize";
	publicVariable "dzn_loc_recon";
	publicVariable "dzn_loc_hiddenSeize";
	
	//	Locations:
	//	Seize:	2 location SEIZE + 1 location HIDDEN seize
	//	Recon:	3 location RECON  (1 of it == hiden seize)
	
		//	**********************************************
	//	Spawn tasks, zones, etc.
	//	**********************************************

	// Tasks
	{
		_mrk = createMarker [format ["mrk_seize_%1", _forEachIndex], locationPosition _x ];
		_mrk setMarkerShape "ICON";
		_mrk setMarkerType "mil_warning";
		_mrk setMarkerColor "ColorRed";
	} forEach dzn_loc_seize;

	{
		_mrk = createMarker [format ["mrk_recon_%1", _forEachIndex], locationPosition _x ];
		_mrk setMarkerShape "ICON";
		_mrk setMarkerType "mil_unknown";
		_mrk setMarkerColor "ColorRed";
	} forEach dzn_loc_recon + [dzn_loc_hiddenSeize];
	
	// Wait until DYNAI itnitilized
	waitUntil { !isNil {dzn_dynai_afterInitTimeout} };
	waitUntil { time > dzn_dynai_afterInitTimeout + 3 };
	sleep 1;
	dzn_getNearestCamp = {
		// [camps, zone] call dzn_getNearestCamp
		private ["_minDistance","_nearest","_distance"];
		_minDistance = 10000;
		_nearest = objNull;
		{
			_distance = _x distance (_this select 1);
			if (_distance < _minDistance) then {
				_minDistance = _distance;
				_nearest = _x;
			};
		} forEach (_this select 0);
		_nearest
	};
	
	_camps = entities "LocationCamp_F";
	{
		// Move zone
		//[str(_x), locationPosition (dzn_loc_seize select _forEachIndex)] call dzn_fnc_dynai_moveZone;
		
		// Move reinforcement
		_camp = [_camps, locationPosition _x] call dzn_getNearestCamp;
		// [
			// str(dzn_zones_reinforcement select _forEachIndex), 
			// locationPosition _camp
		// ] call dzn_fnc_dynai_moveZone;
		
		
		if (DEBUG) then {
			_mrk = createMarkerLocal [
				format ["mrk_camps_%1", _forEachIndex],
				[getPosASL _camp select 0,getPosASL _camp select 1]
			];
			_mrk setMarkerShapeLocal "ICON";
			_mrk setMarkerTypeLocal "mil_warning";
			_mrk setMarkerColorLocal "ColorGREEN";	
		};
	} forEach dzn_loc_seize + [dzn_loc_hiddenSeize];
};

//	**********************************************
//	Spawn of vehicles, gear, service points at bases
//	**********************************************

#include "serverSetupBases.sqf";
