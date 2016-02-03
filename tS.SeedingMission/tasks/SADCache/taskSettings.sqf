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

// *********************************
// TASK AVAILABLE PLACES
// *********************************
//	@Pos [ [ gridX, gridY, gridZ ], radius ]
