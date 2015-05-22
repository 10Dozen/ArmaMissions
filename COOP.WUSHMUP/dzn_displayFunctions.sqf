// Notification 1: My Assignement
dzn_fnc_onAssignmentTitleLoad = {
	private ["_display", "_idc", "_ctrl"];
	_display = _this select 0;

	// ***** Pic ******
	_idc = 1002;
	_ctrl = _display displayCtrl _idc;
	_ctrl ctrlSetText (player getVariable "raPic");
	_ctrl ctrlCommit 0;
	
	// **** Squad *****
	_idc = 1003;
	_ctrl = _display displayCtrl _idc;
	_ctrl ctrlSetText (player getVariable "raSquad");
	_ctrl ctrlCommit 0;
	
	// **** Role ******
	_idc = 1004;
	_ctrl = _display displayCtrl _idc;
	_ctrl ctrlSetText (player getVariable "raRole");
	_ctrl ctrlCommit 0;
};


dzn_fnc_showAssignment = {
	waitUntil {!isNil {player getVariable "raPic"} && !isNil {player getVariable "raSquad"} && !isNil {player getVariable "raRole"}};
	
	1000 cutRsc ["assignementBlackTitle", "PLAIN"];
	sleep 1;
	1001 cutRsc ["assignementTopTitle","PLAIN"];
};


// Notification 2: Commanding Struff Display


// Notification 3: Commanding Stuff Hint



// Notification 4: ORBAT 
