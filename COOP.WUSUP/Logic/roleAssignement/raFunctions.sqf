ra_fnc_assignRole = {
	private ["_listOfPlayers", "_role"];
	_listOfPlayers = ra_unassignedPlayer - ra_assignedPlayers;
	_listOfPlayers = _listOfPlayers call BIS_fnc_arrayShuffle;	
	{
		_role = ra_roles deleteAt 0;				
		_x setVariable ["ra_role", _role, true];
		
		ra_assignedPlayers pushBack _x;
		ra_usedRoles pushBack _role;
	} forEach _listOfPlayers;	
};

ra_fnc_resolveRole = {
	// @Resolved = @Role("A-FTL-RED") call ra_fnc_resolveRole
	private["_squad", "_role", "_team"];
	
	_squad = _this select [0,1];
	_role = _this select [1, (count _this) - 3]; // CHECK!!!
	_team = _this select [count _this,-3]; // CHECK!!!
	
	[_squad, _role, _team]
};

ra_fnc_assignRolePlayer = {
	_roleProps = (player getVariable "ra_role") call ra_fnc_resolveRole;

	_squadName = [ ra_squadIdMapping, _roleProps select 0] call dzn_fnc_getValueByKey;
	_squadGroupId =  [ ra_squadGroupMapping, _roleProps select 0 ] call dzn_fnc_getValueByKey;
	_roleName = [ ra_roleIdMapping, _roleProps select 1 ] call dzn_fnc_getValueByKey;
	_rolePic = [ ra_rolePicMapping, _roleProps select 1 ] call dzn_fnc_getValueByKey;
	_teamName = [ ra_teamIdMapping, _roleProps select 2 ] call dzn_fnc_getValueByKey;
	
	player setVariable ["raSquadGrpId", _squadGroupId, true];
	
	player setVariable ["raSquadName", _squadName];
	player setVariable ["raTeamName", _teamName];
	player setVariable ["raRoleName", _roleName];
	player setVariable ["raRolePic", _rolePic;
	
	player setVariable ["raRoleAssigned", true, true];
};

ra_fnc_showRole = {
	1000 cutRsc ["assignementBlackTitle", "PLAIN"];
	sleep 1;
	1001 cutRsc ["assignementTopTitle","PLAIN"];
	{
		call compile format [
			"_idc = %1;
			_ctrl = (findDisplay 1001) displayCtrl _idc;
			_ctrl ctrlSetText (player getVariable '%2');
			_ctrl ctrlCommit 0;",
			_x select 0,
			_x select 1
		];
	} forEach [
		[1002, "raPic"],
		[1003, "raSquad"],
		[1004, "raRole"]
	];
};
ra_fnc_showOrbat = {};
ra_fnc_showSquad = {};
