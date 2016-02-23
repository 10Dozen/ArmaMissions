params["_range"];

// *********************************
// TASK SETTINGS
// *********************************
_taskName = "task_IEDSituation_%1";
_taskSafetyReward = 100;
_taskDisplayName = "IED situation at %1";
_taskDesc = "Resolve situation with armed IED at grid %1.";

// *********************************
// TASK DYNAI UNITS
// *********************************
_taskGroups = [
	[
		[1,	[["I_soldier_F",["indoors"],"kit_ins_random"],["I_soldier_F",["indoors"],"kit_ins_random"],["I_soldier_F",["indoors"],"kit_ins_random"]]]
		, [ceil(random 4), [["I_soldier_F",[],"kit_ins_random"],["I_soldier_F",[],"kit_ins_random"]]]
	]
];

_taskZonesProperties = [
	["RESISTANCE", "randomize", ["LIMITED","SAFE","YELLOW","STAG COLUMN"]]
];

// *********************************
// TASK AVAILABLE PLACES
// *********************************
_positions = [
	[ ['Land_TentA_F', [7550.49,10539.5,0.0108719], [], 0, 'CAN_COLLIDE'],[7550.43,10539.5,105.014],[[0.973165,0.198442,0.116492], [-0.117576,-0.00635562,0.993044]]; ['Land_TentA_F', [7552.66,10535.8,0.0205383], [], 0, 'CAN_COLLIDE'],[7552.58,10535.9,105.495],[[-0.394528,0.902306,-0.173756], [-0.116446,0.138476,0.983496]]; ['Land_TentA_F', [7544.28,10539.9,0.0120621], [], 0, 'CAN_COLLIDE'],[7544.2,10539.9,104.184],[[0.978611,0.141797,0.149044], [-0.145543,-0.0348038,0.988739]]; ['CUP_GuerillaCacheBox_EP1', [7550.1,10536.6,-0.0869141], [], 0, 'CAN_COLLIDE'],[7550.1,10536.6,105.038],[[0.00155529,0.997029,-0.0770123], [-0.371423,0.0720791,0.925662]]]
];

private _inRangePosition = [];
private _userPos = getPosASL player;
{
	if ([_userPos, _x select 0, _range] call dzn_fnc_selectByRangeType) then {
		_inRangePosition pushBack _x;	
	};
} forEach _positions;


[
	[_taskName, _taskDisplayName, _taskDesc] 
	, _inRangePosition
	, [_taskSafetyReward, _taskGroups, _taskZonesProperties]
]
