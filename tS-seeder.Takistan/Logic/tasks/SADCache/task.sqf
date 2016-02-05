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
	_cacheObjectClass = "O_CargoNet_01_ammo_F";
	
	_taskId = format[
		_presets select 0 select 0
		, round(serverTime)
	];
	
	["task", _taskID] call dzn_fnc_TaskManager_setProperty;
	
	_taskSide = _presets select 0 select 1;
	_taskReward = _presets select 2 select 0;	
	
	_taskPos = _presets select 1 select 0;
	
	player setPos _taskPos;  // DEBUUUUUG
	
	_taskRadius =  _presets select 1 select 1;
	_taskLocation = [_taskPos, _taskRadius] call dzn_fnc_createTaskSimpleLocation;
	
	_taskGroups = _presets select 2 select 1;
	_taskZonesProperties = _presets select 2 select 2;	
	
	[_taskId, _taskLocation] call dzn_fnc_task_create;
	
	// 1. Get nearest houses
	_buildings = [_taskPos, _taskRadius, ["House"], []] call dzn_fnc_getHousesNear;
	
	// 2. Select buildingPos
	// 2.1. Select building with position
	_enterableBuildings = [ 
		_buildings
		, { [_x] call BIS_fnc_isBuildingEnterable }
	] call BIS_fnc_conditionalSelect;
	
	// 2.2. Get buildingPos
	_taskBuilding = _enterableBuildings call BIS_fnc_selectRandom;

	// 2.3. Spawn crate
	_cacheObject = _cacheObjectClass createVehicle (_taskPos);
	_cacheObject allowDamage false;	
	
	// 3. Place crate at building pos
	[_cacheObject, [_taskBuilding], nil, nil, false] spawn dzn_fnc_assignInBuilding;
	_cacheObject spawn { sleep 5; _this allowDamage true; };	
	
	[ _taskId, "objects", [_cacheObject] ] call dzn_fnc_task_setProperty;	
	
	// 4. Spawn thread - waitUntil { !alive crate };
	[_taskId, _cacheObject] spawn {		
		waitUntil { !alive (_this select 1) };
		
		// 4.1. taskState = completed
		[(_this select 0), "completed"] call dzn_fnc_task_setState;
		
		// 4.2. taskEnd = true
		// (_this select 0) call dzn_fnc_endTask;
	};
		
	// 5. Spawn general task thread - waitUntil { taskEnd };
	[_taskId] spawn {
		waitUntil { !(_this call dzn_fnc_task_active) };		
		if (_this call dzn_fnc_task_state == "completed") then {
			// 5.1. if taskState = completed
			// 5.1.1.	Success message
			hint "Completed!";			
		} else {
			// 5.3. waitUntil { !players in 1km of task }
			// waitUntil { true };
			// 5.3.1. Remove task composition
			// _this call dzn_fnc_clearTaskPos;
		};
	};
		
	// 6. Add Dynai zone:
		// - 2-3 indoor men
		// - 2x2 patrol men
	{
		_zoneSide = _x select 0;
		_zoneWP = _x select 1;
		_zoneBehavior = _x select 2;	
	
		[
			_taskId
			, _zoneSide
			, false
			, [_taskLocation]
			, _zoneWP
			, (_taskGroups select _forEachIndex)
			, _zoneBehavior
		] call dzn_fnc_dynai_addNewZone;		
	} forEach _taskZonesProperties;
	
	// 7. Add task description
	_taskName = format[
		_presets select 0 select 0
		, round(serverTime)
	];
	_taskDisplayName = format[
		_presets select 0 select 1
		, mapGridPosition (_presets select 1 select 0 select 0)
	];
	_taskDesc = format[
		_presets select 0 select 2
		, mapGridPosition (_presets select 1 select 0 select 0)
	];
	
	[_taskSide, _taskDisplayName, _taskDesc, objNull, 1, 8, true, "", true] call BIS_fnc_taskCreate;	
};

// *******************************************************
// TASK Client Init (called from Player's Task Listener)
// *******************************************************
if (DEBUG) then {};
