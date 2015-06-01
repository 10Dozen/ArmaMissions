// Functions
dzn_fnc_ra_setRoleAttributes = {
	// [@Unit, @SquadID, @RoleID] call dzn_fnc_ra_setRoleAssingedByUnit
	private["_unit","_squadId","_roleId"];
	
	_unit = _this select 0;
	_squadId = _this select 1;
	_roleId = _this select 2;
	
	_unit setVariable ["raSquadId", _squadId, true];
	_unit setVariable ["raSquad", [dzn_squadsMapping, _squadId] call dzn_fnc_getValueByKey, true];
	_unit setVariable ["raRoleId", _roleId, true];
	_unit setVariable ["raRole", [dzn_roleMapping, _roleId] call dzn_fnc_getValueByKey, true];
	_unit setVariable ["raPic", [dzn_rolePicMapping, _roleId] call dzn_fnc_getValueByKey, true];
	
	[_unit,_squadId,_roleId] call dzn_fnc_ra_setRoleAssingedByUnit;
};

dzn_fnc_ra_setRoleAssingedByUnit = {
	// [@Unit, @SquadID, @RoleID] call dzn_fnc_ra_setRoleAssingedByUnit
	private["_unit","_squadId","_roleId","_squadArray"];
	
	_unit = _this select 0;
	_squadId = _this select 1;
	_roleId = _this select 2;
	
	if (typename _squadId == "STRING" && { _squadId == "CO" } ) then {		
		[dzn_assignedRoles, 0,_unit] call dzn_fnc_setValueByKey;
	} else {
		[dzn_assignedRoles select (_squadId + 1), _roleId,_unit] call dzn_fnc_setValueByKey;
	};	
	publicVariable "dzn_assignedRoles";
};

dzn_fnc_ra_getNearestUnusedRole = {
	// call dzn_fnc_ra_getNearestUnusedRole
	private["_squad","_squadId","_id","_role"];
	
	_squadId = -1;
	_role = -1;
	{
		player sideChat str[_x];
		if (_forEachIndex > 0) then {
			_squad = _x;
			_id = _forEachIndex;
			{
				if ( isNull (_x select 1) ) exitWith { 
					_role = _x select 0;
					_squadId = _id;
				};
			} forEach _squad;			
		};
		if (_squadId != -1) exitWith {};
	} forEach dzn_assignedRoles;
	
	if ( _squadId < 0 && _role < 0) exitWith {};
	[_squadId - 1, _role]
};

dzn_fnc_ra_getUnitBySquadAndRole = {
	//  [@SuqadId, @RoleId] call dzn_fnc_ra_getUnitBySquadAndRole
	private["_unit","_squadId","_roleId"];
	
	_squadId = _this select 0;
	_roleId = _this select 1;
	_unit = objNull;
	
	if (typename _squadId == "STRING" && { _squadId == "CO" }) then {
		_unit = dzn_assignedRoles select 0 select 1;
	} else {
		_unit = [dzn_assignedRoles select (_squadId + 1), _roleId] call dzn_fnc_getValueByKey;
	};
	
	_unit
}; 


waitUntil { time > 1 };

if !(isServer || isDedicated) exitWith {};
private["_unit","_squad","_group","_i","_j"];

dzn_ra_roleId_CO = 0;
dzn_ra_roleId_SL = 10;
dzn_ra_roleID_SQ = 100;

#define PULL_RANDOM_PLAYER(X,Y)		X = dzn_allPlayers call BIS_fnc_selectRandom; if (Y) then {dzn_allPlayers = dzn_allPlayers - [X];};
#define EXIT_IF_NO_UNITS		if (dzn_allPlayers isEqualTo []) exitWith {};
#define ADD_UNIT_TO_CURRENT_SQUAD	_squad pushBack _unit;

#define ASSIGN_SQUADLEADER		PULL_RANDOM_PLAYER(_unit,true) [_unit, _i, dzn_ra_roleId_SL] call dzn_fnc_ra_setRoleAttributes;	ADD_UNIT_TO_CURRENT_SQUAD			
#define	ASSIGN_SQUADMEMBER		PULL_RANDOM_PLAYER(_unit,true) [_unit, _i, dzn_ra_roleID_SQ + _j] call dzn_fnc_ra_setRoleAttributes; ADD_UNIT_TO_CURRENT_SQUAD
#define NEW_SQUAD			_squad = [];
#define CREATE_NEW_GRPOUP		_group = group _unit;
#define JOIN_UNITS_TO_GROUP		_squad joinSilent _group;

// ********* Wait for players to come ********
dzn_allPlayers = [];
dzn_assignedPlayers = [];
dzn_assignedRoles = [ [0, objNull] ];
for "_i" from 1 to 6 do {
	dzn_assignedRoles pushBack [
		[10, objNull],[100, objNull], [101, objNull],[102, objNull],[103, objNull],[104, objNull], [105, objNull],[106, objNull],[107, objNull],[108, objNull]
	];
};
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
	[_unit, "CO", dzn_ra_roleId_CO] call dzn_fnc_ra_setRoleAttributes;

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

// ********* End Of Role Assignement ************
publicVariable "dzn_assignedSquads";

dzn_ra_assignmentComplete = true;
publicVariable "dzn_ra_assignmentComplete";
