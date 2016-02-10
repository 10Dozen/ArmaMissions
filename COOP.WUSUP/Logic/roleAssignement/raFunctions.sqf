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

ra_fnc_assignRolePlayer = {};
ra_fnc_showRole = {};
ra_fnc_showOrbat = {};
ra_fnc_showSquad = {};
