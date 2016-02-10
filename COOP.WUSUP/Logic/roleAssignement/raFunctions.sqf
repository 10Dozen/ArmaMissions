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

ra_fnc_assignRolePlayer = {
	_role = player getVariable "ra_role";
	// "A-FTL-RED"
	
	_squadName = [ ra_squadIdMapping, _role select [0,1] ] call dzn_fnc_getValueByKey;
	_squadGroupId =  [ ra_squadGroupMapping, _role select [0,1] ] call dzn_fnc_getValueByKey;
	_teamName = [ ra_teamIdMapping, _role select [count _role,-3] ] call dzn_fnc_getValueByKey;
	_roleName = [ ra_roleIdMapping, "?" ] call dzn_fnc_getValueByKey;
	_rolePic = [ ra_rolePicMapping, "?" ] call dzn_fnc_getValueByKey;
	
	player setVariable ["raSquadGrpId", _squadGroupId, true];
	player setVariable ["raSquadName", _squadName, true];
	player setVariable ["raTeamName", _teamName, true];
	player setVariable ["raRoleName", _roleName, true];
	player setVariable ["raRolePic", _rolePic, true];
};

ra_fnc_showRole = {};
ra_fnc_showOrbat = {};
ra_fnc_showSquad = {};
