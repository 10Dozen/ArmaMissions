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
	// @Resolved("A","FTL","RED") = @Role("A-FTL-RED") call ra_fnc_resolveRole
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
	player setVariable ["raFullRoleName", format["%1 - %2", _roleName, raTeamName]];
	player setVariable ["raRolePic", _rolePic];
	
	if ((_roleProps select 1) == "SL" ) then {
		player joinAsSilent [(ra_groups select _squadGroupId), 0];
	} else {
		player joinSilent (ra_groups select _squadGroupId);
	};
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
		[1004, "raFullRoleName"]
	];
};

ra_fnc_showOrbat = {
	_hqList = [];
	{
		_role = (_x getVariable "ra_role") call ra_fnc_resolveRole; //("A","SL","NON")
		if ( (_role select 1) in ["SL","PL"] ) then {
			_hqList pushBack [_role select 0, _role select 1]; // ["A","SL"]
		};
	} forEach (call BIS_fnc_listPlayers);
	
	
	//
	_strText_CO_H	= "<t color='#EDB81A' size='1.25' align='center'>%1</t>";
	_strText_CO	= "<t color='#FFFFFF' size='1.25' align='center'>%1</t>";
	
	_strText_SL 	= "<t color='#AAAAAA' size='1.15' align='left'>%1</t><t color='#FFFFFF' size='1.15' align='right'>%2</t>";
	_strText_mySL 	= "<t color='#FFCC00' size='1.2' align='left'>%1</t><t color='#FFFFFF' size='1.2' align='right'>%2</t>";

	_stringsToShow = [
		parseText (format ["<t color='#FFFFFF' size='1.5' align='center'>%1</t>", localize "STR_assignment_CommandPersonnelUpCase"])
		,lineBreak
	];
	
	
	hint format [
		
	
	];
};
ra_fnc_showSquad = {

};

