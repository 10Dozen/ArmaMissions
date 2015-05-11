dzn_ra_initTimer = 30;

// Get all players
_allPlayers = [];

{
	if (isPlayer _x) then	{
		_allPlayers pushBack _x;
	};
} forEach playableUnits;

// for SP test
{
	if ( (isPlayer _x) && !(_x in _allPlayers) ) then	{
		_allPlayers pushBack _x;
	};
} forEach switchableUnits;



waitUntil { time > dzn_ra_initTimer };

// ********* Choosing HQ ************
dzn_selectRandom(_hq,_allPlayers,true)  //_hq = _allPlayers call BIS_fnc_selectRandom;_allPlayer = _allPlayers - [_hq];
_hq setVariable ["raSquad", [dzn_squadsMapping, "HQ"] call dzn_fnc_getValueByKey, true];
_hq setVariable ["raRole", [dzn_roleMapping, 0] call dzn_fnc_getValueByKey, true];

// ********* Choosing SLs **********
_squadCount = _allPlayers % 10;
if (_allPlayers % 10 == 0) then {
	for "_i" from 0 to _squadCount do {
		dzn_selectRandom(_sl,_allPlayers,true)  //_sl = _allPlayers call BIS_fnc_
		_sl setVariable ["raSquad", [dzn_squadsMapping, _i] call dzn_fnc_getValueByKey, true];
		_sl setVariable ["raRole", [dzn_roleMapping, 10] call dzn_fnc_getValueByKey, true];
		
		for "_j" from 0 to 9 do {
			dzn_selectRandom(_unit, _allPlayers, true); // _unit = 
			_unit setVariable ["raSquad", [dzn_squadsMapping, _i] call dzn_fnc_getValueByKey, true];
			_unit setVariable ["raRole, [dzn_roleMapping,100 + _j] call dzn_fnc_getValueByKey, true];
		};
	};
} else {

};

