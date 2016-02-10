// Role assignement
/*
	function generateRoles { 
		var r = [];
		var squads = ["A","B","C","D"];
		var colors = ["RED","BLU"];
		var roles = ["FTL","AR","G","R"]; 
		for (var i = 0; i < squads.length; i++) {
			sq = squads[i];
			for (var j = 0; j < colors.length; j++) {
				color = colors[j];
				for (var k = 0; k < roles.length; k++) {
					r.push( sq + "-" + roles[k] + "-" + color);
				};			
			};
		};
		
		console.log(r);
	};
*/
/*
		SL 3
			FTL 1
			AR 1
			GR 1
			R 1
			FTL 2
			AR 2
			GR 2
			R 2
		SL 6
			FTL 4
			AR 4
			GR 4
			R 4
			FTL 5
			AR 5
			GR 5
			R 5
	PL 7	
		SL 10
			FTL 8
			AR 8
			GR 8
			R 8
			FTL 9
			AR 9
			GR 9
			R 9
			
	"A-FTL-RED", "A-AR-RED", "A-G-RED", "A-R-RED", "A-FTL-BLU", "A-AR-BLU", "A-G-BLU", "A-R-BLU", "A-SL-NON"
	, "B-FTL-RED", "B-AR-RED", "B-G-RED", "B-R-RED", "B-FTL-BLU", "B-AR-BLU", "B-G-BLU", "B-R-BLU", "B-SL-NON"
	, "C-FTL-RED", "C-AR-RED", "C-G-RED", "C-R-RED", "C-FTL-BLU", "C-AR-BLU", "C-G-BLU", "C-R-BLU", "C-SL-NON"
	, "D-FTL-RED", "D-AR-RED", "D-G-RED", "D-R-RED", "D-FTL-BLU", "D-AR-BLU", "D-G-BLU", "D-R-BLU", "D-SL-NON"
*/

ra_roles = [
	"A-FTL-RED", "A-AR-RED", "A-G-RED", "A-R-RED", "A-FTL-BLU", "A-AR-BLU", "A-G-BLU", "A-R-BLU", "A-SL-NON"
	, "B-FTL-RED", "B-AR-RED", "B-G-RED", "B-R-RED", "B-FTL-BLU", "B-AR-BLU", "B-G-BLU", "B-R-BLU", "B-SL-NON"
];
ra_usedRoles = [];
ra_assignedPlayers = [];
ra_unassignedPlayer = [];
publicVariable "ra_unassignedPlayer";
roleAssignementDone = false;

ra_fnc_assignRole = {
	private ["_listOfPlayers", "_role"];
	_listOfPlayers = ra_unassignedPlayer - ra_assignedPlayers;
	_listOfPlayers = _listOfPlayers call BIS_fnc_arrayShuffle;	
	{
		if !(_x in ra_assignedPlayers) then {			
			_role = ra_roles deleteAt 0;				
			_x setVariable ["ra_role", _role, true];
			
			ra_assignedPlayers pushBack _x;
			ra_usedRoles pushBack _role;
		};	
	} forEach _listOfPlayers;	
};

[] spawn {	
	"ra_unassignedPlayer" addPublicVariableEventHandler {		
		call ra_fnc_assignRole;
	};
	waitUntil { time > 3 };	
	call ra_fnc_assignRole;	
	roleAssignementDone = true;
	publicVariable "roleAssignementDone";
};

// On client
[] spawn {
	waitUntil { local player };
	ra_unassignedPlayer pushBack player;
	publicVariable "ra_unassignedPlayer";
	
	waitUntil { !isNil {player getVariable "ra_role"} && !isNil "roleAssignementDone" };
	call ra_showRole;
	call ra_showOrbat
};

