// *********************************
// TASK SETTINGS
// *********************************
_taskName = "task_Demining%1";
_taskSafetyReward = 100;
_taskDisplayName = "Ordnance from the last war was found at %1 and should be disarmed or safely destroyed.";
_taskDesc = "Demine ordnance at grid %1.";


// *********************************
// TASK DYNAI UNITS
// *********************************
_taskGroups = [];

_taskZonesProperties = [
	["EAST", "randomize", ["LIMITED","SAFE","YELLOW","STAG COLUMN"]]
];

// *********************************
// TASK AVAILABLE PLACES
// *********************************
_positions = [
	[ ['ModuleExplosive_IEDLandBig_F', [5777.26,11382.5,0], [], 0, 'CAN_COLLIDE'],[5777.26,11382.5,83.04],[[0.973165,0.198442,0.116492], [-0.117576,-0.00635562,0.993044]]]
	
	
];

private _inRangePosition = [];
private _userPos = getPosASL player;
{
	if ([_userPos, (_x select 1), _range] call dzn_fnc_selectByRangeType) then {
		_inRangePosition pushBack _x;	
	};
} forEach _positions;


[
	[_taskName, _taskDisplayName, _taskDesc] 
	, _positions
	, [_taskSafetyReward, _taskGroups, _taskZonesProperties]
]
