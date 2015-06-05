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


// Notification 2: Deprecated

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
			,parseText (format [_strText_CO, if (alive dzn_ra_co) then { name dzn_ra_co } else { "KIA" }])
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
					if (alive _sl) then { name _sl } else { "KIA" }
				])
			];
		};
	} forEach dzn_assignedSquads;
	
	switch (par_radioMod) do {
		case 0: {};
		case 1: {
			_stringsToShow = _stringsToShow + [
				lineBreak
				,parseText (format [
					"<t color='#EDB81A' size='1.25' align='center'>%1 %2 %3</t>", 
					localize "STR_radio_LR", 
					dzn_TFAR_lrFreq,
					localize "STR_radio_mhz"
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

dzn_fnc_addRadioSubject = {
	private ["_topic","_text"];
	
	_topic = localize "STR_assignment_ORBAT";

	_text = [localize "STR_radio_topic"];
	
	{
		_text = _text + [
			lineBreak
			,format[
				"%1 -- %2 %3",
				_x select 1
				,[dzn_TFAR_swFreqs , _forEachIndex] call dzn_fnc_getValueByKey
				,localize "STR_radio_mhz"
			]
		];
	} forEach dzn_squadsMapping;

	player createDiarySubject [_topic,_topic];
	player createDiaryRecord [
		_topic,
		[
			_topic,
			_text
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
				_strText_color_CO, 
				_strText_color_base,
				[dzn_roleMappingShort, 0] call dzn_fnc_getValueByKey, 
				if (alive dzn_ra_co) then { name dzn_ra_co } else { "KIA" },
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
				if (alive _x) then { name _x } else { "KIA" },
				if (_x == player) then { "1.2" } else { "1.15" }
			])
		];
	} forEach _squadUnits;	
	
	switch (par_radioMod) do {
		case 0: {};
		case 1: {
			_stringsToShow = _stringsToShow + [
				lineBreak
				,parseText (format [
					"<t color='#EDB81A' size='1.25' align='center'>%1 %2 %3</t>", 
					localize "STR_radio_SW", 
					[dzn_TFAR_swFreqs, player getVariable "raSquadId"] call dzn_fnc_getValueByKey,
					localize "STR_radio_mhz"
				])
			];
		};
	};
	
	hintSilent (composeText _stringsToShow);
};

// **********************
// Show Mission End timer
//  Is able to watch from diary
//  At 1/2 and last 5 mins will be notification.
// **********************
dzn_fnc_onEndTimerTitleLoad = {
	private ["_display", "_ctrl"];
	disableSerialization;
	_display = _this select 0;	
	
	_ctrl = _display displayCtrl 1010;
	_ctrl ctrlSetBackgroundColor (
		if (time > (par_endTime - dzn_endTimerLimitValue)*60) then { [0.6,0,0,1] } else { [0,0,0,1] }
	);
	_ctrl ctrlCommit 0;
	
	while { true } do {
		_ctrl = _display displayCtrl 1011;
		if (par_endTime*60 - time > 0) then {		
			_ctrl ctrlSetText ((round(par_endTime*60 - time)) call dzn_fnc_convertToTimestring);
		} else {
			_ctrl ctrlSetText "00:00:00";
			_ctrl ctrlSetBackgroundColor [0.6,0,0,0.4];
		};
		_ctrl ctrlCommit 0;	
		sleep 1;
	};
};

dzn_fnc_showEndTimer = {
	1010 cutRsc ["endTimerTitle", "PLAIN",0];	
	if (typename _this != "ARRAY" && (time < (par_endTime - dzn_endTimerLimitValue)*60)) then {
		private ["_timer"];
		_timer = time + _this;
		waitUntil { time > _timer };
		1010 cutText ["","PLAIN"];
	};
};

dzn_fnc_addEndTimerSubject = {
	private ["_topic"];
	
	_topic = localize "STR_assignment_endTimerTopic";

	player createDiarySubject [_topic,_topic];
	player createDiaryRecord [
		_topic,
		[
			_topic,
			format [
				"<font color='#B0E84F'><execute expression='10 spawn dzn_fnc_showEndTimer'>%1</execute></font>"
				, localize "STR_assignment_showEndTimer"
			]
		]
	];
};


// **********************
// Show Capture timer
// (maybe Display?)
// **********************
dzn_fnc_onWinTimerTitleLoad = {
	private ["_display", "_ctrl"];
	disableSerialization;
	_display = _this select 0;	
	
	// _ctrl = _display displayCtrl 1012;
	// _ctrl ctrlSetText localize "STR_timer_captureIn";
	// _ctrl ctrlSetBackgroundColor [0,0.6,0,1];	
	// _ctrl ctrlCommit 0;
	
	while { true } do {
		_ctrl = _display displayCtrl 1013;
		if ( dzn_captureTimer > 0 ) then {		
			_ctrl ctrlSetText ((dzn_captureTimer) call dzn_fnc_convertToTimestring);
		} else {
			_ctrl ctrlSetText "00:00:00";
			_ctrl ctrlSetBackgroundColor [0.0,0.6,0,0.4];
		};
		_ctrl ctrlCommit 0;	
		sleep 1;
	};
};

dzn_fnc_showWinTimer = {
	1015 cutRsc ["winTimerTitle", "PLAIN"];
};
