// Notification 1: My Assignement
dzn_fnc_onAssignmentTitleLoad = {
	private ["_display", "_idc", "_ctrl"];
	_display = _this select 0;
	
	{
		call compile format [
			"_idc = %1;
			_ctrl = _display displayCtrl _idc;
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
	
	// ***** Pic ******
	// _idc = 1002;
	// _ctrl = _display displayCtrl _idc;
	// _ctrl ctrlSetText (player getVariable "raPic");
	// _ctrl ctrlCommit 0;
	
	// **** Squad *****
	// _idc = 1003;
	// _ctrl = _display displayCtrl _idc;
	// _ctrl ctrlSetText (player getVariable "raSquad");
	// _ctrl ctrlCommit 0;
	
	// **** Role ******
	// _idc = 1004;
	// _ctrl = _display displayCtrl _idc;
	// _ctrl ctrlSetText (player getVariable "raRole");
	// _ctrl ctrlCommit 0;
};


dzn_fnc_showAssignment = {
	waitUntil {!isNil {player getVariable "raPic"} && !isNil {player getVariable "raSquad"} && !isNil {player getVariable "raRole"}};
	
	1000 cutRsc ["assignementBlackTitle", "PLAIN"];
	sleep 1;
	1001 cutRsc ["assignementTopTitle","PLAIN"];
};


// Notification 2: Commanding Struff Display
dzn_fnc_onCommandingStaffTitleLoad = {
	private ["_display", "_idc", "_ctrl"];
	_display = _this select 0;
	
	{
		call compile format [
			"_idc = %1;
			_ctrl = _display displayCtrl _idc;
			_ctrl ctrlSetText (player getVariable '%2');
			_ctrl ctrlCommit 0;",
			_x select 0,
			_x select 1
		];
	} forEach [
		if (!isNil "dzn_ra_co") then { [1002, localize "STR_assignmentRole_CO"]	},
		if (!isNil "dzn_ra_co") then { [1003, name dzn_ra_co] }
		if (!isNull (0 call dzn_fnc_ra_getSquadLeader)) then { [1004, localize "STR_assignmentRole_CO"] },
		if (!isNull (0 call dzn_fnc_ra_getSquadLeader)) then { [1005, name (0 call dzn_fnc_ra_getSquadLeader)] },
		
		if (!isNull (1 call dzn_fnc_ra_getSquadLeader)) then { [1006, name (1 call dzn_fnc_ra_getSquadLeader)] },
		
	];
	
};

dzn_fnc_showCommandingStaff = {
	waitUntil { !isNil "dzn_ra_assignmentComplete" && { dzn_ra_assignmentComplete } };
	

};


// Notification 3: Commanding Stuff Hint
dzn_fnc_showCommandingStaffHint = {};

// Notification 4: ORBAT 
dzn_fnc_showORBAT = {};



