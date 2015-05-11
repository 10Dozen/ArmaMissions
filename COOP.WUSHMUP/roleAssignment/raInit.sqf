waitUntil { time > 1 };
if (isPlayer player) then { [] spawn dzn_fnc_showAssignment; };


if !(isServer || isDedicated) exitWith {};
private["_unit","_squad","_i","_j"];

dzn_ra_roleId_CO = 0;
dzn_ra_roleId_SL = 10;
dzn_ra_roleID_SQ = 100;

#define PULL_RANDOM_PLAYER(X,Y)		X = dzn_allPlayers call BIS_fnc_selectRandom; if (Y) then {dzn_allPlayers = dzn_allPlayers - [X];};
#define EXIT_IF_NO_UNITS		if (dzn_allPlayers isEqualTo []) exitWith {};
#define ADD_UNIT_TO_CURRENT_SQUAD	_squad pushBack _unit;

#define ASSIGN_SQUADLEADER		PULL_RANDOM_PLAYER(_unit,true) ADD_UNIT_TO_CURRENT_SQUAD [_unit, _i, dzn_ra_roleId_SL] call dzn_ra_fnc_setRoleAttributes;				
#define	ASSIGN_SQUADMEMBER		PULL_RANDOM_PLAYER(_unit,true) [_unit, _i, dzn_ra_roleID_SQ + _j] call dzn_ra_fnc_setRoleAttributes; ADD_UNIT_TO_CURRENT_SQUAD
#define NEW_SQUAD			_squad = [];

dzn_ra_fnc_setRoleAttributes = {
	// [@Unit, @SquadID, @RoleID] call dzn_ra_fnc_setRoleAttributes
	private["_unit","_squadId","_roleId"];
	
	_unit = _this select 0;
	_squadId = _this select 1;
	_roleId = _this select 2;
	
	_unit setVariable ["raSquadId", _squadId, true];
	_unit setVariable ["raSquad", [dzn_squadsMapping, _squadId] call dzn_fnc_getValueByKey, true];
	_unit setVariable ["raRole", [dzn_roleMapping, _roleId] call dzn_fnc_getValueByKey, true];
	_unit setVariable ["raPic", [dzn_rolePicMapping, _roleId] call dzn_fnc_getValueByKey, true];
};

// ********* Wait for players to come ********
dzn_allPlayers = [];
dzn_assignedPlayers = [];
_unit = objNull;


waitUntil { ["All", dzn_assignedPlayers] call dzn_fnc_getAllPlayers; count dzn_allPlayers > 0};
// ********* Choosing CO *********************

if ((count dzn_allPlayers) > 4) then {
	PULL_RANDOM_PLAYER(_unit,true)	
	[_unit, "CO", dzn_ra_roleId_CO] call dzn_ra_fnc_setRoleAttributes;

	dzn_ra_co = _unit;
	publicVariable "dzn_ra_co";	// Initiate Notification about CO
};

// ********* Choosing SLs and SquadMembers **********

dzn_allPlayers = [
	man, man_1,man_2,man_3,
	man_4,man_5,man_6, 
	man_7,man_8,man_9,
	man_10,man_11,man_12,
	man_13,man_14,man_15,
	man_16,man_17,man_18,
	man_19,man_20,
	player
];
dzn_debug = dzn_allPlayers;

dzn_squadCount = floor ((count dzn_allPlayers)/10);
dzn_assignedSquads = [];


waitUntil { count dzn_allPlayers > 0 };
switch (true) do {
	case ( (count dzn_allPlayers) % 10 == 0): {
		for "_i" from 0 to dzn_squadCount do {
			NEW_SQUAD
			ASSIGN_SQUADLEADER
			EXIT_IF_NO_UNITS
			
			for "_j" from 0 to 8 do { ASSIGN_SQUADMEMBER };
			
			dzn_assignedSquads pushBack [_i, _squad];
		};

	};
	case ( (count dzn_allPlayers) % 10 > 4): {
		for "_i" from 0 to dzn_squadCount do {
			NEW_SQUAD
			ASSIGN_SQUADLEADER
			EXIT_IF_NO_UNITS
			
			if (_i != dzn_squadCount) then {
				for "_j" from 0 to 8 do { ASSIGN_SQUADMEMBER };
			} else {
				for "_j" from 0 to ((count dzn_allPlayers) % 10 - 1) do { ASSIGN_SQUADMEMBER };
			};
			
			dzn_assignedSquads pushBack [_i, _squad];
		};
	};
	case ( (count dzn_allPlayers) % 10 < 5): {
		hint "%10 < 5 Case";
		for "_i" from 0 to dzn_squadCount do {
			NEW_SQUAD
			ASSIGN_SQUADLEADER
			EXIT_IF_NO_UNITS

			if (_i == dzn_squadCount) then {
				_unitsLeft = count dzn_allPlayers - 1;				
				for "_j" from 0 to _unitsLeft do {ASSIGN_SQUADMEMBER 
					player sideChat format ["(@1) I: %1 :: J: %2 :: ROLE: %3 :: UNIT: %4", _i, _j,[dzn_roleMapping, dzn_ra_roleID_SQ + _j] call dzn_fnc_getValueByKey, _unit];
				};
			} else {
				if (_i == dzn_squadCount - 1) then {	
					for "_j" from 0 to floor ((8 + (count dzn_allPlayers) % 10)/2) do { 
					player sideChat format ["(@2) I: %1 :: J: %2", _i, _j];
					ASSIGN_SQUADMEMBER };
				} else {
					for "_j" from 0 to 8 do { ASSIGN_SQUADMEMBER };				
				};
			};
			
			dzn_assignedSquads pushBack [_i, _squad];
		};
	};
};



// ********* End Of Role Assignement ************
dzn_ra_assignmentComplete = true;
