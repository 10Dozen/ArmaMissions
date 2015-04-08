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
		_mrk = createMarker [format ["mrk_seize_%1", _forEachIndex], position _x ];
		_mrk setMarkerShape "ICON";
		_mrk setMarkerType "mil_warning";
		_mrk setMarkerColor "ColorRed";
	} forEach dzn_loc_seize;

	{
		_mrk = createMarker [format ["mrk_recon_%1", _forEachIndex], position _x ];
		_mrk setMarkerShape "ICON";
		_mrk setMarkerType "mil_unknown";
		_mrk setMarkerColor "ColorRed";
	} forEach dzn_loc_recon + [dzn_loc_hiddenSeize];
	
	// Wait until DYNAI itnitilized
	waitUntil {};
	
	
	
};

//	**********************************************
//	Spawn of vehicles, gear, service points at bases
//	**********************************************

#include "serverSetupBases.sqf";
