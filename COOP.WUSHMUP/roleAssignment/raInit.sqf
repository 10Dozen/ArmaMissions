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
_hq setVariable ["raSquad", "HQ", true];
_hq setVariable ["raRole", 0, true];

// ********* Choosing SLs **********
_squadCount = _allPlayers % 12;
if (_allPlayers % 12 == 0) then {
	for "_i" from 0 to _squadCount do {
		dzn_selectRandom(_sl,_allPlayers,true)  //_sl = _allPlayers call BIS_fnc_
		_sl setVariable ["raSquad", _i, true];
		_sl setVariable ["raRole", 10, true];
		
		for "_j" from 0 to 11 do {
			dzn_selectRandom(_unit, _allPlayers, true); // _unit = 
			_unit setVariable ["raSquad", _i, true];
			_unit setVariable ["raRole, 100 + _j, true];
		};
	};
} else {

};

