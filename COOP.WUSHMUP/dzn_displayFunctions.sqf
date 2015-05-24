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
	
	_topic = localize "STR_assignment_CommandPersonnel";

	player createDiarySubject [_topic,_topic];
	player createDiaryRecord [
		_topic,
		[
			"",
			format [
				"<execute expression='call dzn_fnc_showCommandingStaffHint'>%1</execute>"
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
					if (leader group player == _sl) then {_strText_SL} else {_strText_mySL}, [dzn_squadsMapping, _i] call dzn_fnc_getValueByKey, name _sl
				])
			];
		};	
	};
	
	hintSilent (composeText _stringsToShow);
};

// Notification 4: ORBAT
// Add action to Diary
dzn_fnc_addORBATSubject = {
	private ["_topic"];
	
	_topic =  localize "STR_assignment_ORBAT";

	player createDiarySubject [_topic,_topic];
	player createDiaryRecord [
		_topic,
		[
			"",
			format [
				"<execute expression='call dzn_fnc_showORBATHint'>%1</execute>"
				, localize "STR_assignment_showORBAT"
			]
		]
	];
};



CO - <COName> [Or Not Displayed]
| <SQUAD> - <SLName>
|| Medic - <Name>  [Or Not Displayed]
|| Red Team - <FTL Name>  [Or Not Displayed]
||| AR - <AR Name>  [Or Not Displayed]
||| AAR - <>  [Or Not Displayed]
||| Grenadier - <>  [Or Not Displayed]
|| Blue Team - <FTL Name>  [Or Not Displayed]
||| AR - <AR>  [Or Not Displayed]
||| AAR - <AAR>  [Or Not Displayed]
||| Rifleman AT - <RAT>  [Or Not Displayed]

	
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
	
	_strText_color_CO = "#ffffff";
	_strText_color_SL = "#ffffff";
	_strText_color_RT = "#ffffff";
	_strText_color_BT = "#ffffff";
	_strText_color_base = "#ffffff";
	
	_strText_line = "<t color='%1' size='1.15' align='left'>%3</t><t color='%2' size='1.15' align='right'>%4</t>";	
	
	_stringsToShow = [
		parseText (format ["<t color='#FFFFFF' size='1.5' align='center'>%1</t>", localize "STR_assignment_ORBAT"])
	];
	
	if (!isNil "dzn_ra_co") then {
		_stringsToShow = _stringsToShow + [
			lineBreak
			,parseText (format [
				_strText_line, 
				_strText_color_CO, _strText_color_base,
				[dzn_roleMapping, 0] call dzn_fnc_getValueByKey, name dzn_ra_co
			])			
		];
	};
	
	_squadUnits = [dzn_assignedSquads, player getVariable "raSquadId"] call dzn_fnc_getValueByKey;
	_squadName = [dzn_squadsMapping,  player getVariable "raSquadId"] call dzn_fnc_getValueByKey;
	
	_stringsToShow = _stringsToShow + [
		lineBreak
		,parseText (format [
			"<t color='%1' size='1.15' align='center'>%2</t>",
			_strText_color_SL,
			_squadName
		])
	];
	
	{
		_roleName = [dzn_roleMapping, _x getVariable "raRoleId"] call dzn_fnc_getValueByKey;
		_stringsToShow = _stringsToShow + [
			lineBreak
			,parseText (format [
				_strText_line,
				if (_forEachIndex in [0,1]) then { _strText_color_SL } else { if (_forEachIndex in [2,3,4,5]) then { _strText_color_RT } else { _strText_color_BT }},
				_strText_color_base,
				_roleName,
				name _x
			])
		];
	} forEach _squadUnits;	
	
	hintSilent (composeText _stringsToShow);
};



