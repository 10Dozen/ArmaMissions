dzn_ra_initTimer = 30;

waitUntil { time > dzn_ra_initTimer };

// Get all players
dzn_allPlayers = [];
_assignedPlayers = [];

//["All", _assignedPlayers] call dzn_fnc_getAllPlayers;
/*
{
	if (isPlayer _x) then	{
		dzn_allPlayers pushBack _x;
	};
} forEach playableUnits;

// for SP test
{
	if ( (isPlayer _x) && !(_x in dzn_allPlayers) ) then	{
		dzn_allPlayers pushBack _x;
	};
} forEach switchableUnits;
*/

// ********* Wait for players to come ********
waitUntil { ["All", _assignedPlayers] call dzn_fnc_getAllPlayers; dzn_allPlayers > 0};

// ********* Choosing HQ *********************
dzn_selectRandom(_hq,dzn_allPlayers,true)  //_hq = dzn_allPlayers call BIS_fnc_selectRandom;_allPlayer = dzn_allPlayers - [_hq];
_hq setVariable ["raSquad", [dzn_squadsMapping, "HQ"] call dzn_fnc_getValueByKey, true];
_hq setVariable ["raRole", [dzn_roleMapping, 0] call dzn_fnc_getValueByKey, true];

// ********* Choosing SLs **********
_squadCount = 0;
waitUntil { _squadCount = floor(dzn_allPlayers / 10); _squadCount > 0 };

#define	ASSIGN_SQUADLEADER dzn_selectRandom(_sl,dzn_allPlayers,true); _sl setVariable ["raSquad", [dzn_squadsMapping, _i] call dzn_fnc_getValueByKey, true]; _sl setVariable ["raRole", [dzn_roleMapping, 10] call dzn_fnc_getValueByKey, true];
#define ASSIGN_SQUADMEMBER dzn_selectRandom(_unit, dzn_allPlayers, true);_unit setVariable ["raSquad", [dzn_squadsMapping, _i] call dzn_fnc_getValueByKey, true];_unit setVariable ["raRole", [dzn_roleMapping,100 + _j] call dzn_fnc_getValueByKey, true];
	
switch (true) do {
	case (dzn_allPlayers % 10 == 0): {
		for "_i" from 0 to _squadCount do {
			ASSIGN_SQUADLEADER
			for "_j" from 0 to 9 do {
				ASSIGN_SQUADMEMBER
			};
		}
	};
	case (dzn_allPlayers % 10 > 4): {
	
	};
	case (dzn_allPlayers % 10 < 5): {
	
	};
};
	
	
	for "_i" from 0 to _squadCount do {
		if (dzn_allPlayers % 10 == 0) then {
			ASSIGN_SQUADLEADER
			for "_j" from 0 to 9 do {
				ASSIGN_SQUADMEMBER
			};
		} else {
			
		
			if (_i == _squadCount && dzn_allPlayers % 10 > 4) then {
				for "_j" from 0 to (dzn_allPlayers % 10) do {
					ASSIGN_SQUADMEMBER
				};
			}
			
			if ( (_i == _squadCount || _i == _squadCount - 1) && dzn_allPlayers % 10 < 4) then {
				// All squads and for 2 last squads - people will be shared between
				
				for "_j" from 0 to (10 + dzn_allPlayers % 10)/2 do {
					ASSIGN_SQUADMEMBER
				};
			};
		};
	};
	


