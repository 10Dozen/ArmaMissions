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
	
	cutRsc ["assignementTopTitle","PLAIN"];
};
