//	@Pos [ [ gridX, gridY, gridZ ], radius ]

// [ @Preses, @ServerExec ] execVM "task.sqf";
/*
		[
			[_taskName, _taskDisplayName, _taskDesc] 
			, [@position, @Radius ]
			, _taskSafetyReward
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

_cacheObjectClass = "O_CargoNet_01_ammo_F";


// *********************************************
// TASK Server Init (called from Task Generator)
// *********************************************
if (_serverExec) exitWith {	
	_taskID = format[
		_presets select 0 select 0
		, round(serverTime)
	];	
	missionNamespace setVariable [_taskID, [["end",false], ["state","init"]], true];

	_taskPos = _presets select 1 select 0;
	_taskRadius =  _presets select 1 select 1;
	
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
	_cacheObject = _cacheObjectClass createVehicle (getPos _taskPos);
	_cacheObject allowDamage false;	
	
	// 3. Place crate at building pos
	[_cacheObject, [_taskBuilding], nil, nil, false] spawn dzn_fnc_assignInBuilding;
	_cacheObject spawn { sleep 5; _this allowDamage true; };	
	
	// 4. Spawn thread - waitUntil { !alive crate };
	[_taskID, _cacheObject] spawn {
		// 4.1. taskState = completed
		waitUntil { !alive (_this select 1) };
		
		[(_this select 0), "completed"] call dzn_fnc_setTaskState;
		(_this select 0) call dzn_fnc_endTask;
	};
	
	
	
		
		// 4.2. taskEnd = true
	// 5. Spawn general task thread - waitUntil { taskEnd };
		// 5.1. if taskState = completed
			// 5.1.1.	Success message
		// 5.2. if taskState != completed
			// 5.1.2.	Failed message
		// 5.3. waitUntil { !players in 1km of task }
			// 5.3.1. Remove task composition
	// 6. Add Dynai zone:
		// - 2-3 indoor men
		// - 2x2 patrol men
	
	
	
	
	
	
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
	_taskSide = _presets select 0 select 1;
	_taskReward = _presets select 2;
};

// *******************************************************
// TASK Client Init (called from Player's Task Listener)
// *******************************************************
if (DEBUG) then {};
