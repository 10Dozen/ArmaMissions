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
