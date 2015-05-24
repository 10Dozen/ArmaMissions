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
// Notification 3: Commanding Stuff Hint
// Add action to Diary

// Show structured hint
dzn_fnc_showCommandingStaffHint = {
	/*
		call dzn_fnc_showCommandingStaffHint
		Show hint with structured text of commanding stuff
	*/
	private["_strText_CO_H","_strText_CO","_strText_SL","_strText_mySL","_stringsToShow","_sl","_i"];
	
	_strText_CO_H	= "<t color='#ffffff' size='1.25' align='center'>%1</t>";
	_strText_CO		= "<t color='#ffffff' size='1.25' align='center'>%1</t>";
	
	_strText_SL 	= "<t color='#ff00ff' size='1.15' align='left'>%1</t><t color='#666666' size='1.15' align='right>%2</t>";
	_strText_mySL 	= "<t color='#999999' size='1.15' align='left'>%1</t><t color='#999999' size='1.15' align='right>%2</t>";

	_stringsToShow = [
		parseText (format ["<t color='#FFFFFF' size='1.5' align='center'>%1</t>", localize "STR_assignment_CommandPersonnel"])
	];
	
	if (!isNil "dzn_ra_co") then {
		_stringsToShow = _stringsToShow + [
			lineBreak
			,parseText (format [_strText_CO_H, [dzn_squadsMapping, "CO"] call dzn_fnc_getValueByKey])
			,parseText (format [_strText_CO, name dzn_ra_co])
		];	
	};
	
	for "_i" from 0 to 5 do {
		_sl = _i call dzn_fnc_ra_getSquadLeader;
		if (!isNull _sl) then {
			_stringsToShow = _stringsToShow + [
				lineBreak
				,parseText (format [
					if (leader group player == _sl) then {_strText_SL} else {_strText_mySL}, [dzn_squadsMapping, _i] call dzn_fnc_getValueByKey, name _sl])
			];
		};	
	};
	
	hintSilent (composeText _stringsToShow);
};

// Notification 4: ORBAT 
dzn_fnc_showORBAT = {};



