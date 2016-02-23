// [ @Preses, @ServerExec ] execVM "task.sqf";
/*
		[
			[_taskName, _taskDisplayName, _taskDesc] 
			, [@position, @Radius ]
			, _taskSafetyReward
		]
		
	[
		["task_SADCache_%2","Weapon cache at %1","Find and destroy enemy weapon cache at grid %1."]
		, [
			[4000,4000,0],150
		],
		[
			100
			,[[[1,[["I_soldier_F",["indoors"],""],["I_soldier_F",["indoors"],""],["I_soldier_F",["indoors"],""]]],[2,[["I_soldier_F",[],""],["I_soldier_F",[],""]]]]]
			,[["RESISTANCE","randomize",["LIMITED","SAFE","YELLOW","COLUMN"]]]
		]
	]
*/

/*
	1. Get nearest houses
	2. Select buildingPos
		2.1. Select building with position
		2.2. Get buildingPos
		2.3. Spawn crate
	3. Place crate at building pos
	4. Spawn thread - waitUntil { !alive crate };
		4.1. taskState = completed
		4.2. taskEnd = true
	5. Spawn general task thread - waitUntil { taskEnd };
		5.1. if taskState = completed
			5.1.1.	Success message
		5.2. if taskState != completed
			5.1.2.	Failed message
		5.3. waitUntil { !players in 1km of task }
			5.3.1. Remove task composition
	6. Add Dynai zone:
		- 2-3 indoor men
		- 2x2 patrol men
	7. Add task description
*/

#define DEBUG	true
params ["_presets",["_serverExec", false]];

// *********************************************
// TASK Server Init (called from Task Generator)
// *********************************************
if (_serverExec) exitWith {	
	private _cacheObjectClass = "Box_FIA_Support_F";
	
	private _taskId = format[
		_presets select 0 select 0
		, round(serverTime)
	];
	
	["task", _taskID] call dzn_fnc_TaskManager_setProperty;
	
	private _taskSide = west;
	private _taskReward = _presets select 2 select 0;
	private _taskPos = _presets select 1 select 0;
	
	// player setPos _taskPos;  // DEBUUUUUG
	
	private _taskRadius =  _presets select 1 select 1;
	private _taskLocation = [_taskPos, _taskRadius] call dzn_fnc_createTaskSimpleLocation;
	private _taskGroups = _presets select 2 select 1;
	private _taskZonesProperties = _presets select 2 select 2;	
	
	[_taskId, _taskLocation] call dzn_fnc_task_create;	
	
	// 1. Get nearest houses
	private _buildings = [_taskPos, _taskRadius, ["House"], []] call dzn_fnc_getHousesNear;
	
	if (_buildings isEqualTo []) exitWith { hint "NO HOUSES. CANCELLED" };
	
	// 2. Select buildingPos
	// 2.1. Select building with position
	private _enterableBuildings = [ 
		_buildings
		, { [_x] call BIS_fnc_isBuildingEnterable }
	] call BIS_fnc_conditionalSelect;
	
	// 2.2. Get buildingPos
	private _taskBuilding = _enterableBuildings call BIS_fnc_selectRandom;

	// 2.3. Spawn crate
	private _cacheObject = _cacheObjectClass createVehicle (_taskPos);
	_cacheObject allowDamage false;	
	
	// 3. Place crate at building pos
	[_cacheObject, [_taskBuilding], nil, nil, false] spawn dzn_fnc_assignInBuilding;
	_cacheObject spawn { sleep 5; _this allowDamage true; };	
	
	[ _taskId, "objects", [_cacheObject] ] call dzn_fnc_task_setProperty;		
	
	// 4. Spawn thread - waitUntil { !alive crate };
	// 5. Spawn general task thread - waitUntil { taskEnd };
	// 6. Add Dynai zone:
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
	
	// 7. Add task description
	private _taskName = format[
		_presets select 0 select 0
		, round(serverTime)
	];
	private _taskDisplayName = format[
		_presets select 0 select 1
		, (_presets select 1 select 0) call dzn_fnc_getMapGrid
	];
	private _taskDesc = format[
		_presets select 0 select 2
		, (_presets select 1 select 0) call dzn_fnc_getMapGrid
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
