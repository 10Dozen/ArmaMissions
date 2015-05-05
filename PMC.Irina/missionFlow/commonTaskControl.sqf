if (isServer || isDedicated) then {
	dzn_taskControl_taskList = [
		["Blowjobs1", 		"new"],
		["Cleansweep1",		"new"],
		["EliminateHVT1",	"new"]	
	];
	publicVariable "dzn_taskControl_taskList";
};

dzn_taskControl_contractCounter = 0;

// TaskControl Functions
dzn_taskControl_fnc_updateContractCounter = {
	dzn_taskControl_contractCounter = dzn_taskControl_contractCounter + 1;
	publicVariable "dzn_taskControl_contractCounter";
};
dzn_taskControl_fnc_updateTaskStatus = {
	// [ taskname, status ] call dzn_taskControl_updateTaskStatus 
	private ["_task","_newStatus"];
	_task = _this select 0;
	_newStatus = _this select 1;
	
	{
		if (_x select 0 == _task) exitWith {
			dzn_taskControl_taskList set [_forEachIndex, [_task, _newStatus]];
		};
	} forEach dzn_taskControl_taskList;	
	publicVariable "dzn_taskControl_taskList";
	
	switch ( _newStatus ) do {
		case "available": {
			["ContractAdded",["New contract available"]] call bis_fnc_showNotification;
		};
	};
};

dzn_taskControl_fnc_getTaskStatus = {
	// task call dzn_taskControl_getTaskStatus 
	private ["_task","_output"];
	
	_task = _this;	
	_output = "no status";
	{
		if (_x select 0 == _task) exitWith {
			_output = _x select 1;
		};
	} forEach dzn_taskControl_taskList;
	
	_output
};

dzn_taskControl_fnc_checkTaskStatus = {
	// [task, status] call dzn_taskControl_checkTaskStatus	
	if ( (_this select 0) call dzn_taskControl_fnc_getTaskStatus == (_this select 1) ) then { true } else { false };
};

dzn_taskControl_fnc_paymentTransferNotif = {
	// [ContractName(str), Reward(num), RewardToTopup(num, opt] spawn  dzn_taskControl_paymentTransfer;
	private["_contractName","_reward","_realReward"];
	
	_contractName =_this select 0;
	_reward = _this select 1;
	_realReward = if (!isNil {_this select 2}) then { _this select 2 } else { _reward };
	
	
	for "_i" from 0 to round(random 4) do {
		hint parseText format [
			"<t size='1.3' color='#B0E84F'>CONTRACT COMPLETED</t><br /><br />Contract: %1<br />Reward: %2$<br /><br />Waiting for bank transfer."
			,_contractName, _reward
		];
		sleep 0.8;
		hint parseText format [
			"<t size='1.3' color='#B0E84F'>CONTRACT COMPLETED</t><br /><br />Contract: %1<br />Reward: %2$<br /><br />Waiting for bank transfer.."
			,_contractName, _reward
		];
		sleep 0.8;
			hint parseText format [
			"<t size='1.3' color='#B0E84F'>CONTRACT COMPLETED</t><br /><br />Contract: %1<br />Reward: %2$<br /><br />Waiting for bank transfer..."
			,_contractName, _reward
		];		
		sleep 0.8;
	};

	if (_realReward > 0) then {
		hint parseText format[
			"<t size='1.3' color='#B0E84F'>CONTRACT COMPLETED</t><br /><br />Contract: %1<br />Reward: %2$<br /><br /><t size='1.3' color='#B0E84F'>Payment transfered<br />%3$</t>"
			,_contractName, _reward, _realReward
		];
	} else {
		hint parseText format[
			"<t size='1.3' color='#B0E84F'>CONTRACT COMPLETED</t><br /><br />Contract: %1<br />Reward: %2$<br /><br /><t size='1.3' color='#CC3300'>Payment cancelled</t>"
			,_contractName, _reward
		];
	};	
};

dzn_taskControl_fnc_processTask = {
	// [_contractName,_contractText,_task,_taskName,_reward] spawn dzn_taskControl_fnc_processTask
	private ["_contractName","_contractText","_reward","_taskName","_task","_realReward","_contractTopic"];
	_contractName 	= _this select 0;
	_contractText 	= _this select 1;
	_task 			= _this select 2;
	_taskName		= _this select 3;
	_reward 		= _this select 4;
	_realReward		= if (!isNil {_this select 5}) then { _this select 5 } else { _reward };
	
	[_taskName, _task, _contractName] call dzn_taskControl_fnc_showTaskMarker;
	call dzn_taskControl_fnc_updateContractCounter;	
	_contractTopic = format["Contract #%1", dzn_taskControl_contractCounter];
	
	player createDiarySubject [_contractTopic,_contractTopic];
	player createDiaryRecord [
		_contractTopic, 
		[
			_contractName, 
			_contractText
		]
	];
	
	waitUntil { [_taskName,"accepted"] call dzn_taskControl_fnc_checkTaskStatus };
	player createDiaryRecord [
		_contractTopic, 
		[
			_contractName, 
			"<font color='#FFFFFF' size='20'>       CONTRACT ACCEPTED</font>
			<br /> ______________________________________________"
		]
	];
	
	// Wait for task completion
	waitUntil { [_taskName,"completed"] call dzn_taskControl_fnc_checkTaskStatus };
	player createDiaryRecord [
		_contractTopic, 
		[
			_contractName, 
			"<font color='#B0E84F' size='20'>       CONTRACT COMPLETED</font>
			<br /> ______________________________________________"
		]
	];
	
	[_contractName, _reward, _realReward] spawn dzn_taskControl_fnc_paymentTransferNotif;
};

dzn_taskControl_fnc_showTaskMarker = {
	// [_taskName, _task, _contractName] call dzn_taskControl_showTaskMarker;
	private["_taskMrk"];

	_taskMrk = createMarkerLocal [ (_this select 0) , getPosASL (_this select 1) ];
	_taskMrk setMarkerShapeLocal "ICON";
	_taskMrk setMarkerTypeLocal "mil_warning";
	_taskMrk setMarkerColorLocal "ColorGreen";
	_taskMrk setMarkerTextLocal (_this select 2);
};

// Tasks
[] execVM "missionFlow\contracts\contractBlowjobs1.sqf";
[] execVM "missionFlow\contracts\contractEliminateHVT1.sqf";
