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
params ["_presets","_serverExec"];

Task_iedSteps = [
	[0, "Cut red wire"]
	,[1, "Cut green wire"]
	,[2, "Unplug detonator"]
	,[3, "Unplug battery"]
	,[4, "Unplug timer/receiver"]
];
Task_iedStepsPerType = [
	[0, 	[0,3,4,1,2]]
	,[1,	[3,1,4,0,2]]
	,[2,	[1,3,0,2,4]]
	,[3,	[1,0,3,2,[2,4]]]
];

Task_iedDetonate = {
	params[["_ied", Task_iedObject]];
	private _pos = [(getPos _ied),1] call dzn_fnc_getDisplayTaskPos;
	for "_i" from 0 to 2 do {
		"HelicopterExploSmall" createVehicle ([_pos,2] call dzn_fnc_getDisplayTaskPos);
	};
	
	Task_iedObject setVariable ["iedType", nil, true];	
	Task_iedObject setVariable ["iedArmed", nil, true];
	deleteVehicle Task_iedObject;
};

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
	private _taskPos = _presets select 1 select 1;
	private _taskRadius =  15;
	private _taskLocation = [_taskPos, _taskRadius] call dzn_fnc_createTaskSimpleLocation;
	private _taskGroups = _presets select 2 select 1;
	private _taskZonesProperties = _presets select 2 select 2;	
	
	[_taskId, _taskLocation] call dzn_fnc_task_create;	
	
	// Spawn objects
	private _presetObjects = (_presets select 1);
	private _taskObjects = [];
	for "_i" from 0 to (count(_presetObjects)/3 - 1) do {		
		private _newObject = createVehicle (_presetObjects select (_i*3));
		_newObject allowDamage false;	
		_newObject setPosASL (_presetObjects select (1 + _i*3));
		_newObject setVectorDirAndUp (_presetObjects select (2 + _i*3));
		_newObject allowDamage true;
		_newObject lock true;
		_taskObjects pushBack _newObject;
	};
	
	Task_iedObject = _taskObjects call BIS_fnc_selectRandom;
	publicVariable "Task_iedObject";
	Task_iedObject setVariable ["iedType", (Task_iedStepsPerType call BIS_fnc_selectRandom) select 0, true];	
	Task_iedObject setVariable ["iedArmed", true, true];
	
	[ _taskId, "objects", _taskObjects ] call dzn_fnc_task_setProperty;		
	
	// Add Dynai zone:
	/*
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
	*/
	sleep 3;	
	
	[_taskLocation,Task_iedObject] spawn {
		params["_loc","_ied"];
		while { _ied getVariable "iedArmed" } do {
			if ( { [getPosASL _x, [_loc]] call dzn_fnc_isInLocation } count (call BIS_fnc_listPlayers) > 1 ) exitWith {
				[_ied] call Task_iedDetonate;
			};
			sleep 1;
		};
	};
	
	// Destroy IED on vehicle destroyed
	Task_iedObject spawn {
		waitUntil {!alive _this};
		[_this] call call Task_iedDetonate;	
	};
	
	
	// Add task description
	private _taskName = format[
		_presets select 0 select 0
		, round(serverTime)
	];
	
	// Task grid
	private _taskDisplayPos = [ _taskPos, 10 ] call dzn_fnc_getDisplayTaskPos;
	private _taskDisplayName = format[
		_presets select 0 select 1
		, _taskDisplayPos call dzn_fnc_getMapGrid
	];
	private _taskDesc = format[
		_presets select 0 select 2
		, _taskDisplayPos call dzn_fnc_getMapGrid
	];
	
	[ "info", [_taskDisplayName, _taskDesc] ] call dzn_fnc_TaskManager_setProperty;
	[_taskSide, [_taskId], [_taskDesc, _taskDisplayName, ""], objNull, 1, 8, true, "", true] call BIS_fnc_taskCreate;	

};

// *******************************************************
// TASK Client Init (called from Player's Task Listener)
// *******************************************************
if (DEBUG) then {};

waitUntil { !isNull Task_iedObject };

Task_disarmIedDialog = {
	private _dialogSelections = [];
	{
		_dialogSelections pushBack (_x select 1);
	} forEach Task_iedSteps;

	private _dialogOptions = [];  
	for "_i" from 0 to count(Task_iedSteps) - 1 do {
		_dialogOptions pushBack [    
			format ["Step %1", _i + 1]
			, _dialogSelections
		];
	};
	private _dialogResult =	["Disarming IED...", _dialogOptions] call dzn_fnc_ShowChooseDialog;
	if (count _dialogResult == 0) exitWith { hint "Cancelled"; };
	
	private _correctPath = [Task_iedStepsPerType, Task_iedObject getVariable "iedType"] call dzn_fnc_getValueByKey;
	private _detonate = false;
	private _failedStep = 0;
	{
		private _correctStep = _correctPath select _forEachIndex;
		private _correctStepAnswer = if (typename _correctStep == "ARRAY") then { 
			_correctStep call BIS_fnc_selectRandom;
		} else {
			_correctStep
		};
		if !( _x isEqualTo _correctStep ) then { _detonate = true; _failedStep = _failedStep + 1; };
	} forEach _dialogResult;
	
	if !(call Task_checkDefuseKit) exitWith { 
		hint "Something gone wrong. RUN!!!";
		Task_disarmIedDialog spawn {
			sleep 2.5;
			[] call Task_iedDetonate;		
		};
	};
	
	if (_detonate) then {
		if (_failedStep > 1) then {
			[] call Task_iedDetonate;
		} else {
			hint "Something gone wrong. RUN!!!";
			Task_disarmIedDialog spawn {
				sleep 3;
				[] call Task_iedDetonate;		
			};
		};
	} else {
		if (round(random 100) > 99) then {
			hint "Something gone wrong. RUN!!!";
			Task_disarmIedDialog spawn {
				sleep 3;
				[] call Task_iedDetonate;		
			};
		} else {
			hint "DISARMED";
			Task_iedObject setVariable ["iedArmed", false, true];
		};
	};
};

Task_examineIed = {
	hintSilent "Examining";
	sleep 1; hintSilent "Examining.";
	sleep 1; hintSilent "Examining..";
	sleep 1; hintSilent "Examining...";
	
	sleep 0.5; 
	hintSilent format [
		"IED is looks like Type %1.\n\nLooks %2."
		, (Task_iedObject getVariable "iedType") + 1
		, if (Task_iedObject getVariable "iedArmed") then { "armed" } else { "disarmed" }
	];
};

Task_checkDefuseKit = {
	"ACE_DefusalKit" in (items player)
};


Task_iedObject addAction [
	"<t color='#FFE240'>Disarm IED</t>"
	,{
		[] spawn Task_disarmIedDialog;
	},"",6,true,true,"","_this distance2d _target < 1.6 && _target getVariable 'iedArmed'"
];	

Task_iedObject addAction [
	"<t color='#FFE240'>Examine IED</t>"
	,{
		[] spawn Task_examineIed;
	},"",6,true,true,"","_this distance2d _target < 1.6"
];

