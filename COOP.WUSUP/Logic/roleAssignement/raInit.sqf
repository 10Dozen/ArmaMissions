call compile preProcessFileLineNumbers "Logic\roleAssignement\raFunctions.sqf";
call compile preProcessFileLineNumbers "Logic\roleAssignement\raDefines.sqf";
if (hasInterface && !isServer) exitWith {
	[] spawn {
		waitUntil { local player && !isNil "ra_unassignedPlayer" };
		ra_unassignedPlayer pushBack player;
		publicVariable "ra_unassignedPlayer";
		
		waitUntil { !isNil {player getVariable "ra_role"} && !isNil "roleAssignementDone" };
		call ra_fnc_assignRolePlayer;
		call ra_fnc_showRole;
		call ra_fnc_showOrbat;
		call ra_fnc_showSquad;
	};
};

ra_roles = [
	"A-FTL-RED", "A-AR-RED", "A-G-RED", "A-R-RED"
	, "A-FTL-BLU", "A-AR-BLU", "A-G-BLU", "A-R-BLU"
	, "A-SL-NON"
	, "B-FTL-RED", "B-AR-RED", "B-G-RED", "B-R-RED"
	, "B-FTL-BLU", "B-AR-BLU", "B-G-BLU", "B-R-BLU"
	, "B-SL-NON"
	, "N-PL-NON"
];
ra_groups = [
	createGroup west
	, createGroup west
	, createGroup west
];

ra_usedRoles = [];
ra_assignedPlayers = [];
ra_unassignedPlayer = [];
publicVariable "ra_unassignedPlayer";
roleAssignementDone = false;




[] spawn {
	"ra_unassignedPlayer" addPublicVariableEventHandler {		
		call ra_fnc_assignRole;
	};
	waitUntil { time > 3 };	
	call ra_fnc_assignRole;	
	roleAssignementDone = true;
	publicVariable "roleAssignementDone";
};
