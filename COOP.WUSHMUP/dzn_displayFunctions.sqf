onAssignmentTitleLoad = {
	private ["_display", "_idc", "_ctrl", "_color", "_text"];
	_display = _this select 0;	
	
	//1002 assignmentPicControl
	//1003 assignmentMidControl
	//1004 assignmentLowControl
	_idc = 1003;	
	_ctrl = _display displayCtrl _idc;	
	
	_rolePic = "";
	_roleName = "";
	_squadName = "CHARLIE";
	
	
	_ctrl ctrlSetText _squadName;
	// _ctrl ctrlSetTextColor _color;
	_ctrl ctrlCommit 0;
};
