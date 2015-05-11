waitUntil { time > 30 };
if (isPlayer player) then { [] spawn dzn_fnc_showAssignment; };


if !(isServer || isDedicated) exitWith {};

// Get all players
dzn_allPlayers = [];
dzn_assignedPlayers = [];

// ********* Wait for players to come ********
waitUntil { ["All", dzn_assignedPlayers] call dzn_fnc_getAllPlayers; count dzn_allPlayers > 0};
private["_unit","_squad"];
_unit = objNull;

#define DZN_SELECT_RANDOM(X,Y,Z)	X = Y call BIS_fnc_selectRandom; if (Z) then {Y = Y - [X];};
#define SET_SQUAD_VAR(X,Y)	X setVariable ["raSquadId", Y, true]; X setVariable ["raSquad", [dzn_squadsMapping, Y] call dzn_fnc_getValueByKey, true];
#define SET_ROLE_VAR(X,Y)	X setVariable ["raRole", [dzn_roleMapping, Y] call dzn_fnc_getValueByKey, true]; X setVariable ["raPic", [dzn_rolePicMapping, Y] call dzn_fnc_getValueByKey, true];

#define	ASSIGN_SQUADLEADER	DZN_SELECT_RANDOM(_unit,dzn_allPlayers,true) SET_SQUAD_VAR(_unit,_i) SET_ROLE_VAR(_unit,10)
#define ASSIGN_SQUADMEMBER	DZN_SELECT_RANDOM(_unit,dzn_allPlayers,true) SET_SQUAD_VAR(_unit,_i) SET_ROLE_VAR(_unit,100 + _j)
#define ADD_UNIT_TO_SQUAD	_squad pushBack _unit;
#define EXIT_IF_NO_UNITS	if (dzn_allPlayers isEqualTo []) exitWith {};

// ********* Choosing HQ *********************

DZN_SELECT_RANDOM(_unit,dzn_allPlayers,true)
SET_SQUAD_VAR(_unit,"CO")
SET_ROLE_VAR(_unit,0)

dzn_ra_hq = _unit;
publicVariable "dzn_ra_hq";

// ********* Choosing SLs and SquadMembers **********

dzn_squadCount = count dzn_allPlayers - 1;
dzn_assignedSquads = [];

waitUntil { count dzn_allPlayers > 0 };
switch (true) do {
	case (count dzn_allPlayers % 10 == 0): {
		for "_i" from 0 to dzn_squadCount do {
			_squad = [];
			
			ASSIGN_SQUADLEADER
			ADD_UNIT_TO_SQUAD //_unit == sl
			
			EXIT_IF_NO_UNITS
			for "_j" from 0 to 9 do {
				ASSIGN_SQUADMEMBER
				ADD_UNIT_TO_SQUAD //_unit == smember
			};
			
			dzn_assignedSquads pushBack [_i, _squad];
		};
	};
	case (count dzn_allPlayers % 10 > 4): {
		for "_i" from 0 to dzn_squadCount do {
			_squad = [];
			
			ASSIGN_SQUADLEADER
			ADD_UNIT_TO_SQUAD //_unit == sl
			
			EXIT_IF_NO_UNITS
			if (_i != dzn_squadCount) then {
				for "_j" from 0 to 9 do { 
					ASSIGN_SQUADMEMBER 
					ADD_UNIT_TO_SQUAD
				};
			} else {
				for "_j" from 0 to ((count dzn_allPlayers) % 10 - 1) do { 
					ASSIGN_SQUADMEMBER 
					ADD_UNIT_TO_SQUAD
				};
			};
			
			dzn_assignedSquads pushBack [_i, _squad];
		};
	};
	case (count dzn_allPlayers % 10 < 5): {
		for "_i" from 0 to dzn_squadCount do {
			_squad = [];
			
			ASSIGN_SQUADLEADER
			ADD_UNIT_TO_SQUAD //_unit == sl
			
			EXIT_IF_NO_UNITS
			if !(_i in [dzn_squadCount - 1, dzn_squadCount]) then {
				for "_j" from 0 to 9 do { 
					ASSIGN_SQUADMEMBER
					ADD_UNIT_TO_SQUAD
				};
			} else {
				for "_j" from 0 to floor ((9 + (count dzn_allPlayers) % 10)/2) do { 
					ASSIGN_SQUADMEMBER
					ADD_UNIT_TO_SQUAD
				};
			};
			
			dzn_assignedSquads pushBack [_i, _squad];
		};
	};
};



// ********* End Of Role Assignement ************
dzn_ra_assignmentComplete = true;
