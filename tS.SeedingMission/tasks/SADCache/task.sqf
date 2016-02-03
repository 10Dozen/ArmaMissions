//	@Pos [ [ gridX, gridY, gridZ ], radius ]

// [ @Pos, @ServerExec ] execVM "task.sqf";

/*
	1. Get nearest houses
	2. Select buildingPos
	2. Spawn crate
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


// *********************************
// TASK SETTINGS
// *********************************
_taskName = format["task_%1_destroyCache_%2", _squad getVariable "squadName", round(serverTime)];
_taskSide = west;
_taskReward = 5000;
_taskDisplayName = format["Weapon cache at %1", _aoi getVariable "displayName"];
_taskDesc = format[
	"Find and destroy enemy weapon cache at %1.<br /><br />Reward:   $%2</t>"
	, _aoi getVariable "displayName"
	, _taskReward
];

// *********************************************
// TASK Server Init (called from Task Generator)
// *********************************************
if (_serverExec) exitWith {	
_cacheObjectClass = "O_CargoNet_01_ammo_F";
};

// *******************************************************
// TASK Client Init (called from Player's Task Listener)
// *******************************************************
if (DEBUG) then {};
