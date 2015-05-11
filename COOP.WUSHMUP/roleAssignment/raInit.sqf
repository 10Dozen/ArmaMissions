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
_hq = _allPlayers call BIS_fnc_selectRandom;
_allPlayer = _allPlayers - [_hq];
_hq setVariable ["raSquad", "HQ", true];
_hq setVariable ["raRole", "HQ", true];

// ********* Choosing SLs **********
if (_allPlayers % 12 == 0) then {

} else {

};

