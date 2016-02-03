
// *********************************
// TASK SETTINGS
// *********************************
_taskName = "task_SADCache_%2";
_taskSide = west;
_taskSafetyReward = 100;
_taskDisplayName = "Weapon cache at %1";
_taskDesc = "Find and destroy enemy weapon cache at grid %1.";

// *********************************
// TASK AVAILABLE PLACES
// *********************************
_positions = [
	[ [ 1000, 1000, 0 ], 100 ]
	, [ [ 2000, 2000, 0 ], 150 ]
];


[
	[_taskName, _taskDisplayName, _taskDesc] 
	, _positions
	, _taskSafetyReward
]
