// [ @Preses, @ServerExec ] execVM "task.sqf";
/*
	[
		[_taskName, _taskDisplayName, _taskDesc] 
		, @Presets
		, _taskSafetyReward
	]
	[ ['Land_TentA_F', [7550.49,10539.5,0.0108719], [], 0, 'CAN_COLLIDE'],[7550.43,10539.5,105.014],[[0.973165,0.198442,0.116492], [-0.117576,-0.00635562,0.993044]]; ['Land_TentA_F', [7552.66,10535.8,0.0205383], [], 0, 'CAN_COLLIDE'],[7552.58,10535.9,105.495],[[-0.394528,0.902306,-0.173756], [-0.116446,0.138476,0.983496]]; ['Land_TentA_F', [7544.28,10539.9,0.0120621], [], 0, 'CAN_COLLIDE'],[7544.2,10539.9,104.184],[[0.978611,0.141797,0.149044], [-0.145543,-0.0348038,0.988739]]; ['CUP_GuerillaCacheBox_EP1', [7550.1,10536.6,-0.0869141], [], 0, 'CAN_COLLIDE'],[7550.1,10536.6,105.038],[[0.00155529,0.997029,-0.0770123], [-0.371423,0.0720791,0.925662]]]
	
*/

#define DEBUG	true
params ["_presets",["_serverExec", false]];

private _iedSteps = [
	[0, "Cut red wire"]
	,[1, "Cut green wire"]
	,[2, "Unplug detonator"]
	,[3, "Unplug battery"]
	,[4, "Unplug timer/receiver"]
];
private _iedStepsPerType = [
	[0, 	[0,3,4,1,2]]
	,[1,	[3,1,4,0,2]]
	,[2,	[1,3,0,2,4]]
];

if (isNil "Task_iedObject") then { Task_iedObject = objNull; };

// *********************************************
// TASK Server Init (called from Task Generator)
// *********************************************
if (_serverExec) exitWith {
	private _taskId = format[
		_presets select 0 select 0
		, round(serverTime)
	];
	["task", _taskID] call dzn_fnc_TaskManager_setProperty;
	
	private _taskSide = west;
	private _taskReward = _presets select 2 select 0;
	private _taskPos = _presets select 1 select 0;
	private _taskRadius =  65;
	private _taskLocation = [_taskPos, _taskRadius] call dzn_fnc_createTaskSimpleLocation;
	private _taskGroups = _presets select 2 select 1;
	private _taskZonesProperties = _presets select 2 select 2;	
	
	[_taskId, _taskLocation] call dzn_fnc_task_create;	
	
	// Spawn objects
	private _presetObjects = (_presets select 2);
	private _taskObjects = [];
	for "_i" from 0 to count( _presetObjects ) do {
		private _newObject = createVehicle (_presetObjects select (0 + _i));
		_newObject allowDamage false;	
		_newObject setPosASL (_presetObjects select (1 + _i));
		_newObject setVectorDirAndUp (_presetObjects select (2 + _i));
		_newObject allowDamage true;
		_taskObjects pushBack _newObject;
	};
	[ _taskId, "objects", _taskObjects ] call dzn_fnc_task_setProperty;
	
	Task_iedObject = _taskObjects call BIS_fnc_selectRandom;
	publicVariable "Task_iedObject";
	Task_iedObject setVariable ["iedType", floor(count(_iedStepsPerType)), true];
	
	// Add Dynai zone:
	{
		private _zoneSide = _x select 0;
		private _zoneWP = _x select 1;
		private _zoneBehavior = _x select 2;	
	
		[
			format["%1_%2", _taskId, _forEachIndex]
			, _zoneSide
			, true
			, [_taskLocation]
			, _zoneWP
			, (_taskGroups select _forEachIndex)
			, _zoneBehavior
		] call dzn_fnc_dynai_addNewZone;		
	} forEach _taskZonesProperties;	
	sleep 3;	
	
	// Add task description
	private _taskName = format[
		_presets select 0 select 0
		, round(serverTime)
	];
	
	// Task grid
	private _taskDisplayPos = [ _taskPos, 200 ] call dzn_fnc_getDisplayTaskPos;
	private _taskDisplayName = format[
		_presets select 0 select 1
		, _taskDisplayPos call dzn_fnc_getMapGrid
	];
	private _taskDesc = format[
		_presets select 0 select 2
		, _taskDisplayPos call dzn_fnc_getMapGrid
	];
	
	[ "info", [_taskDisplayName, _taskDesc] ] call dzn_fnc_TaskManager_setProperty;
	// hint format [
		// "Task Side: %1 \nTask Id: %2 \nTask Desc: %3\n Task Display Name: %4"
		// ,_taskSide, _taskId, _taskDesc, _taskDisplayName
	// ];
	[_taskSide, [_taskId], [_taskDesc, _taskDisplayName, ""], objNull, 1, 8, true, "", true] call BIS_fnc_taskCreate;	
	
	// hint str[ missionNamespace getVariable _taskId ];
};

// *******************************************************
// TASK Client Init (called from Player's Task Listener)
// *******************************************************
if (DEBUG) then {};

waitUntil { !isNull { Task_iedObject } };
private _iedSteps = [
	[0, "Cut red wire"]
	,[1, "Cut green wire"]
	,[2, "Unplug detonator"]
	,[3, "Unplug battery"]
	,[4, "Unplug timer/receiver"]
];
private _iedStepsPerType = [
	[0, 	[0,3,4,1,2]]
	,[1,	[3,1,4,0,2]]
	,[2,	[1,3,0,2,4]]
];

_disarmIedDialog = {
	private _dialogOptions = [];
	{
		_dialogOptions pushBack [
			format ["Step %1", _forEachIndex + 1]
			, [ _x select 1 ]
		];
	} forEach _iedSteps;
	private _dialogResult =	["Disarming IED...", _dialogOptions] call dzn_fnc_ShowChooseDialog;
	if (count _dialogResult == 0) exitWith { hint "Cancelled"; };
	
	private _correctPath = [_iedStepsPerType, Task_iedObject getVariable "iedType"] call dzn_fnc_getValueByKey;
	private _detonate = false;
	private _failedStep = 0;
	{
		if !( _x isEqualTo (_correctPath select _forEachIndex) ) exitWith { _detonate = true; _failedStep = _forEachIndex; };
	} forEach _dialogResult;
	
	if (_detonate) then {
		if (_failedStep < 3) then {
			hint "BOOOOM";
		} else {
			hint "RUN BABYY!!! ... BOOM!!!";
		};
	} else {
		hint "DISARMED";
	};
};

Task_iedObject addAction [
	"<t color='#FFE240'>Disarm IED</t>"
	,{
		
	},"",6,true,true,"","_this distance2d _target < 1.6"
];	

