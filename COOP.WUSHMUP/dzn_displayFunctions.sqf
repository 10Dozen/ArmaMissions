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
/*
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
	

};*/


// Notification 3: Commanding Stuff Hint
// Add action to Diary
dzn_fnc_addCommandPersonnelSubject = {
	private ["_topic"];
	
	// _topic = localize "STR_assignment_CommandPersonnel";
	_topic = localize "STR_assignment_ORBAT";
	
	player createDiarySubject [_topic,_topic];
	player createDiaryRecord [
		_topic,
		[
			_topic,
			format [
				"<font color='#B0E84F'><execute expression='call dzn_fnc_showCommandingStaffHint'>%1</execute></font>"
				, localize "STR_assignment_showCommandPersonnel"
			]
		]
	];
};
	
// Show structured hint
dzn_fnc_showCommandingStaffHint = {
	/*
		call dzn_fnc_showCommandingStaffHint
		Show hint with structured text of commanding stuff
	*/
	private["_strText_CO_H","_strText_CO","_strText_SL","_strText_mySL","_stringsToShow","_sl","_i"];
	
	_strText_CO_H	= "<t color='#EDB81A' size='1.25' align='center'>%1</t>";
	_strText_CO		= "<t color='#FFFFFF' size='1.25' align='center'>%1</t>";
	
	_strText_SL 	= "<t color='#AAAAAA' size='1.15' align='left'>%1</t><t color='#FFFFFF' size='1.15' align='right'>%2</t>";
	_strText_mySL 	= "<t color='#FFCC00' size='1.2' align='left'>%1</t><t color='#FFFFFF' size='1.2' align='right'>%2</t>";

	_stringsToShow = [
		parseText (format ["<t color='#FFFFFF' size='1.5' align='center'>%1</t>", localize "STR_assignment_CommandPersonnelUpCase"])
		,lineBreak
	];
	
	if (!isNil "dzn_ra_co") then {
		_stringsToShow = _stringsToShow + [
			lineBreak
			,parseText (format [_strText_CO_H, [dzn_squadsMapping, "CO"] call dzn_fnc_getValueByKey])
			,lineBreak
			,parseText (format [_strText_CO, name dzn_ra_co])
			,lineBreak
		];	
	};
	
	{
		_sl = _forEachIndex call dzn_fnc_ra_getSquadLeader;
		if (!isNull _sl) then {
			_stringsToShow = _stringsToShow + [
				lineBreak
				,parseText (format [
					if (leader group player == _sl) then {_strText_mySL} else {_strText_SL}, 
					[dzn_squadsMapping, _forEachIndex] call dzn_fnc_getValueByKey, 
					name _sl
				])
			];
		};
	} forEach dzn_assignedSquads;
	
	hintSilent (composeText _stringsToShow);
};

// Notification 4: ORBAT
// Add action to Diary
dzn_fnc_addORBATSubject = {
	private ["_topic"];
	
	_topic = localize "STR_assignment_ORBAT";

	player createDiarySubject [_topic,_topic];
	player createDiaryRecord [
		_topic,
		[
			_topic,
			format [
				"<font color='#B0E84F'><execute expression='call dzn_fnc_showORBATHint'>%1</execute></font>"
				, localize "STR_assignment_showORBAT"
			]
		]
	];
};

// Show structured hint
dzn_fnc_showORBATHint = {
	/*
		call dzn_fnc_showORBATHint
		Show hint with structured text of ORBAT
	*/
	private[
		"_strText_color_CO","_strText_color_SL","_strText_color_RT","_strText_color_BT",
		"_strText_color_base","_strText_line","_squadUnits","_squadName","_roleName"
	];
	
	_strText_color_CO = "#EDB81A";
	_strText_color_SL = "#FFCC00";
	_strText_color_RT = "#E33636";
	_strText_color_BT = "#368DE3";
	_strText_color_base = "#AAAAAA";
	
	_strText_line = "<t color='%1' size='%5' align='left'>%3</t><t color='%2' size='%5' align='right'>%4</t>";	
	
	_stringsToShow = [
		parseText (format ["<t color='#FFFFFF' size='1.5' align='center'>%1</t>", localize "STR_assignment_ORBAT"])
		,lineBreak
	];
	
	if (!isNil "dzn_ra_co") then {
		_stringsToShow = _stringsToShow + [
			lineBreak
			,parseText (format [
				_strText_line, 
				_strText_color_CO, _strText_color_base,
				[dzn_roleMappingShort, 0] call dzn_fnc_getValueByKey, name dzn_ra_co,
				"1.18"
			])			
		];
	};
	
	
	_squadUnits = if (!isNil "dzn_ra_co" && { player == dzn_ra_co }) then {
		[]
	} else {
		[dzn_assignedSquads, player getVariable "raSquadId"] call dzn_fnc_getValueByKey
	};
	_squadName = [dzn_squadsMapping,  player getVariable "raSquadId"] call dzn_fnc_getValueByKey;
	
	_stringsToShow = _stringsToShow + [
		lineBreak
		,lineBreak
		,parseText (format [
			"<t color='%1' size='1.15' align='center'>%2</t>",
			_strText_color_SL,
			_squadName
		])
	];
	
	{
		_roleName = [dzn_roleMappingShort, _x getVariable "raRoleId"] call dzn_fnc_getValueByKey;
		_stringsToShow = _stringsToShow + [
			lineBreak
			,parseText (format [
				_strText_line,
				if (_forEachIndex in [0,1]) then { _strText_color_SL } else { if (_forEachIndex in [2,3,4,5]) then { _strText_color_RT } else { _strText_color_BT }},
				if (_x == player) then {"#FFFFFF" } else {_strText_color_base},
				_roleName,
				name _x,
				if (_x == player) then { "1.2" } else { "1.15" }
			])
		];
	} forEach _squadUnits;	
	
	hintSilent (composeText _stringsToShow);
};
