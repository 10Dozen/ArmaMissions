waitUntil { time > 1 };

if !(isServer || isDedicated) exitWith {};
private["_unit","_squad","_group","_i","_j"];

dzn_ra_roleId_CO = 0;
dzn_ra_roleId_SL = 10;
dzn_ra_roleID_SQ = 100;

#define PULL_RANDOM_PLAYER(X,Y)		X = dzn_allPlayers call BIS_fnc_selectRandom; if (Y) then {dzn_allPlayers = dzn_allPlayers - [X];};
#define EXIT_IF_NO_UNITS		if (dzn_allPlayers isEqualTo []) exitWith {};
#define ADD_UNIT_TO_CURRENT_SQUAD	_squad pushBack _unit;

#define ASSIGN_SQUADLEADER		PULL_RANDOM_PLAYER(_unit,true) [_unit, _i, dzn_ra_roleId_SL] call dzn_ra_fnc_setRoleAttributes;	ADD_UNIT_TO_CURRENT_SQUAD			
#define	ASSIGN_SQUADMEMBER		PULL_RANDOM_PLAYER(_unit,true) [_unit, _i, dzn_ra_roleID_SQ + _j] call dzn_ra_fnc_setRoleAttributes; ADD_UNIT_TO_CURRENT_SQUAD
#define NEW_SQUAD			_squad = [];
#define CREATE_NEW_GRPOUP		_group = group _unit;
#define JOIN_UNITS_TO_GROUP		_squad joinSilent _group;

dzn_ra_fnc_setRoleAttributes = {
	// [@Unit, @SquadID, @RoleID] call dzn_ra_fnc_setRoleAttributes
	private["_unit","_squadId","_roleId"];
	
	_unit = _this select 0;
	_squadId = _this select 1;
	_roleId = _this select 2;
	
	_unit setVariable ["raSquadId", _squadId, true];
	_unit setVariable ["raSquad", [dzn_squadsMapping, _squadId] call dzn_fnc_getValueByKey, true];
	_unit setVariable ["raRoleId", _roleId, true];
	_unit setVariable ["raRole", [dzn_roleMapping, _roleId] call dzn_fnc_getValueByKey, true];
	_unit setVariable ["raPic", [dzn_rolePicMapping, _roleId] call dzn_fnc_getValueByKey, true];
};

// ********* Wait for players to come ********
dzn_allPlayers = [];
dzn_assignedPlayers = [];
dzn_assignedRoles = [
	/* CO */
	[ 0 ]
	/* Alpha */
	,[[10],[100], [101],[102],[103],[104], [105],[106],[107],[108]]
	/* Bravo */
	,[[10],[100], [101],[102],[103],[104], [105],[106],[107],[108]]
	/* Charlie */
	,[[10],[100], [101],[102],[103],[104], [105],[106],[107],[108]]
	/* Delta */
	,[[10],[100], [101],[102],[103],[104], [105],[106],[107],[108]]
	/* Foxtrot */
	,[[10],[100], [101],[102],[103],[104], [105],[106],[107],[108]]
	/* Echo */
	,[[10],[100], [101],[102],[103],[104], [105],[106],[107],[108]]
];
_unit = objNull;

waitUntil { ["All", dzn_assignedPlayers] call dzn_fnc_getAllPlayers; count dzn_allPlayers > 0};
publicVariable "dzn_allPlayers";

// ******* Assignement to Squads *********
// dzn_allPlayers pushBack player;
// for "_i" from 1 to 16 do {
	// call compile format ["dzn_allPlayers pushBack man_%1",_i];
// };

dzn_squadCount = floor ((count dzn_allPlayers)/10);
dzn_assignedSquads = [];

// ********* Choosing CO *********************
if ((count dzn_allPlayers) > 14) then {
	PULL_RANDOM_PLAYER(_unit,true)	
	[_unit, "CO", dzn_ra_roleId_CO] call dzn_ra_fnc_setRoleAttributes;

	dzn_ra_co = _unit;
	publicVariable "dzn_ra_co";	// Initiate Notification about CO
};

// ********* Choosing SLs and SquadMembers **********
switch (true) do {
	case ( (count dzn_allPlayers) % 10 == 0): {
		for "_i" from 0 to dzn_squadCount do {
			EXIT_IF_NO_UNITS
			NEW_SQUAD
			ASSIGN_SQUADLEADER
			
			CREATE_NEW_GRPOUP
			EXIT_IF_NO_UNITS
			for "_j" from 0 to 8 do {
				ASSIGN_SQUADMEMBER			
			};
			
			JOIN_UNITS_TO_GROUP
			dzn_assignedSquads pushBack [_i, _squad];
		};
	};	
	case ( (count dzn_allPlayers) % 10 > 4): {
		for "_i" from 0 to dzn_squadCount do {
			EXIT_IF_NO_UNITS
			NEW_SQUAD
			ASSIGN_SQUADLEADER
			
			CREATE_NEW_GRPOUP
			EXIT_IF_NO_UNITS			
			if (_i != dzn_squadCount) then {
				for "_j" from 0 to 8 do { ASSIGN_SQUADMEMBER };
			} else {
				for "_j" from 0 to ((count dzn_allPlayers) % 10 - 1) do { ASSIGN_SQUADMEMBER };
			};
			
			JOIN_UNITS_TO_GROUP
			dzn_assignedSquads pushBack [_i, _squad];
		};
	};	
	case ( (count dzn_allPlayers) % 10 < 5 && (count dzn_allPlayers) % 10 != 0 ): {
		for "_i" from 0 to dzn_squadCount do {
			EXIT_IF_NO_UNITS
			
			NEW_SQUAD
			ASSIGN_SQUADLEADER
			
			CREATE_NEW_GRPOUP
			EXIT_IF_NO_UNITS

			if (_i == dzn_squadCount) then {
				_unitsLeft = count dzn_allPlayers - 1;				
				for "_j" from 0 to _unitsLeft do { ASSIGN_SQUADMEMBER };
			} else {
				if (_i == dzn_squadCount - 1) then {	
					for "_j" from 0 to floor ((8 + (count dzn_allPlayers) % 10)/2) do { ASSIGN_SQUADMEMBER };
				} else {
					for "_j" from 0 to 8 do { ASSIGN_SQUADMEMBER };				
				};
			};
			
			JOIN_UNITS_TO_GROUP
			dzn_assignedSquads pushBack [_i, _squad];
		};
	};
};
publicVariable "dzn_assignedSquads";


// ********* End Of Role Assignement ************
dzn_ra_assignmentComplete = true;
publicVariable "dzn_ra_assignmentComplete";
