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
		[0, [["C_man_1",[],""]]]
	]
];

_taskZonesProperties = [
	["CIVILIAN", "randomize", ["LIMITED","CARELESS","GREEN","STAG COLUMN"]]
];

// *********************************
// TASK AVAILABLE PLACES
// *********************************
_positions = [
	[ ['CUP_C_Skoda_Blue_CIV', [6596.34,11390.6,-0.0720406], [], 0, 'CAN_COLLIDE'],  [6596.34,11390.6,62.3254], [[-0.726997,-0.686621,-0.0052069], [-0.00360296,-0.00376843,0.999986]]]
	,[ ['CUP_C_Skoda_White_CIV', [6369.01,11246.9,-0.176254], [], 0, 'CAN_COLLIDE'],  [6369.01,11246.9,60.2072], [[0.286814,-0.956295,0.056893], [-0.0233238,0.0523999,0.998354]]]
	,[ ['CUP_C_Skoda_Red_CIV', [6250.97,11189.8,-0.0724754], [], 0, 'CAN_COLLIDE'],  [6250.97,11189.8,59.8025], [[0.501945,0.864857,-0.0086133], [0.0070819,0.00584862,0.999958]]]
	,[ ['CUP_C_Golf4_camo_Civ', [6184.81,11145.1,-0.0328865], [], 0, 'CAN_COLLIDE'],  [6184.81,11145.1,60.4598], [[0.903682,-0.428201,0.00175152], [0.000825359,0.00583219,0.999982]]]
	,[ ['CUP_C_Skoda_Green_CIV', [6147.04,11192.4,-0.0724754], [], 0, 'CAN_COLLIDE'],  [6147.04,11192.4,59.9827], [[-0.462145,-0.886803,0.00160265], [0.00530112,-0.000955411,0.999985]]]
	,[ ['CUP_C_Skoda_Red_CIV', [5988.36,10551.7,-0.0734482], [], 0, 'CAN_COLLIDE'],  [5988.36,10551.7,67.9055], [[0.917719,-0.396838,-0.0176503], [0.0180618,-0.00270059,0.999833]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [5988.21,10373.6,-0.0720749], [], 0, 'CAN_COLLIDE'],  [5988.21,10373.6,66.7188], [[0.874316,0.485335,0.00461574], [-0.000241596,-0.00907479,0.999959]]]
	,[ ['CUP_C_Skoda_Green_CIV', [5624.98,9904.19,-0.073349], [], 0, 'CAN_COLLIDE'],  [5624.98,9904.19,74.1437], [[0.654946,0.755674,-0.00141283], [0.00128028,0.000760012,0.999999]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [5685.8,9940.54,-0.0728912], [], 0, 'CAN_COLLIDE'],  [5685.8,9940.54,74.3494], [[-0.562328,0.826911,0.00237783], [0.00412208,-7.23774e-005,0.999991]]]
	,[ ['CUP_C_Skoda_Red_CIV', [5646.89,9867.33,-0.0725174], [], 0, 'CAN_COLLIDE'],  [5646.89,9867.33,74.4918], [[0.000145634,0.999999,0.00155104], [0.0102329,-0.00155244,0.999946]]]
	,[ ['CUP_C_Skoda_Green_CIV', [5593.63,9318.5,-0.0734634], [], 0, 'CAN_COLLIDE'],  [5593.63,9318.5,78.1672], [[0.946209,0.323552,0.00125981], [-0.000134697,-0.00349975,0.999994]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [5534.75,9287.68,-0.0734634], [], 0, 'CAN_COLLIDE'],  [5534.75,9287.68,78.1695], [[-0.191349,0.981511,0.00471648], [-0.00070678,-0.00494306,0.999987]]]
	,[ ['CUP_C_Skoda_Green_CIV', [5593.63,9318.5,-0.0734634], [], 0, 'CAN_COLLIDE'],  [5593.63,9318.5,78.1672], [[0.946209,0.323552,0.00125981], [-0.000134697,-0.00349975,0.999994]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [5534.75,9287.68,-0.0734634], [], 0, 'CAN_COLLIDE'],  [5534.75,9287.68,78.1695], [[-0.191349,0.981511,0.00471648], [-0.00070678,-0.00494306,0.999987]]]
	,[ ['CUP_C_Skoda_Red_CIV', [5517.45,9321.54,-0.0718765], [], 0, 'CAN_COLLIDE'],  [5517.45,9321.54,78.2645], [[0.000210946,0.99998,0.00630533], [0.0048672,-0.00630628,0.999968]]]
	,[ ['CUP_C_Skoda_Green_CIV', [5562.12,8932.68,-0.0717163], [], 0, 'CAN_COLLIDE'],  [5562.12,8932.68,81.8782], [[0.94648,0.322759,0.00151142], [-0.000733515,-0.0025318,0.999996]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [5703.08,8916.37,-0.0720062], [], 0, 'CAN_COLLIDE'],  [5703.08,8916.37,81.9203], [[-0.190909,0.981605,0.00246602], [0.00145217,-0.0022298,0.999996]]]
	,[ ['CUP_C_Skoda_Red_CIV', [5684.95,8987.13,-0.0776978], [], 0, 'CAN_COLLIDE'],  [5684.95,8987.13,81.8702], [[0.00115578,0.999946,-0.0103024], [-0.0074768,0.0103108,0.999919]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [5549.15,8879.81,-0.0731354], [], 0, 'CAN_COLLIDE'],  [5549.15,8879.81,81.8903], [[-0.584277,0.811553,0.0014931], [0.00265348,7.05741e-005,0.999996]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [5622.43,8944.24,-0.0724182], [], 0, 'CAN_COLLIDE'],  [5622.43,8944.24,81.9069], [[-0.953088,-0.302689,0.00151288], [0.000768435,0.0025785,0.999996]]]
	,[ ['CUP_C_Skoda_Green_CIV', [6833.48,8912.76,-0.0665131], [], 0, 'CAN_COLLIDE'],  [6833.48,8912.76,120.074], [[0.982288,-0.187283,-0.00599414], [-0.00235233,-0.0443122,0.999015]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [6795.68,8892.24,-0.0709076], [], 0, 'CAN_COLLIDE'],  [6795.68,8892.24,120.353], [[-0.000771514,0.999782,-0.0208523], [0.011806,0.02086,0.999713]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [8241.26,7809.09,0.0297699], [], 0, 'CAN_COLLIDE'],  [8241.26,7809.09,178.194], [[-0.00814442,0.999559,0.0285561], [-0.171049,-0.0295287,0.98482]]]
	,[ ['CUP_C_Skoda_Red_CIV', [9123.26,6715.7,-0.0619354], [], 0, 'CAN_COLLIDE'],  [9123.26,6715.7,204.247], [[0.0696025,0.996634,-0.043302], [-0.0397062,0.0461406,0.998145]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [9148.69,6752.68,-0.0596771], [], 0, 'CAN_COLLIDE'],  [9148.69,6752.68,205.003], [[-0.0508092,0.998588,-0.0155022], [-0.0701959,0.0119131,0.997462]]]
	,[ ['CUP_C_Skoda_Green_CIV', [10852.3,6310.74,-0.0494995], [], 0, 'CAN_COLLIDE'],  [10852.3,6310.74,282.222], [[0.978556,-0.179031,0.10186], [-0.102245,0.00710271,0.994734]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [10882.9,6354.68,-0.0403137], [], 0, 'CAN_COLLIDE'],  [10882.9,6354.68,287.121], [[0.373773,0.919666,0.120449], [-0.0394262,-0.113991,0.992699]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [9193.38,10119,0.0384827], [], 0, 'CAN_COLLIDE'],  [9193.38,10119,186.239], [[0.137438,-0.989126,-0.0523422], [0.20815,-0.0228222,0.977831]]]
	,[ ['CUP_C_Skoda_Red_CIV', [9279.8,10058.9,-0.0664215], [], 0, 'CAN_COLLIDE'],  [9279.8,10058.9,164.601], [[0.557386,0.829807,-0.027224], [0.0448493,0.00264902,0.99899]]]
	,[ ['CUP_C_Skoda_Green_CIV', [10615.2,11053.7,-0.0522461], [], 0, 'CAN_COLLIDE'],  [10615.2,11053.7,141.594], [[0.621561,0.783246,0.0137191], [-0.0340137,0.00948748,0.999376]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [10396.6,11152.2,-0.072937], [], 0, 'CAN_COLLIDE'],  [10396.6,11152.2,134.742], [[-0.841437,0.540351,-0.00207084], [-0.000851651,0.00250619,0.999997]]]
	,[ ['CUP_C_Skoda_Red_CIV', [9914.29,11485.5,-0.0708542], [], 0, 'CAN_COLLIDE'],  [9914.29,11485.5,115.722], [[0.794311,-0.606126,0.0409975], [-0.0230205,0.0374055,0.999035]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [9810.82,11393.6,-0.065361], [], 0, 'CAN_COLLIDE'],  [9810.82,11393.6,120.102], [[0.300603,-0.952579,0.0472416], [0.00572215,0.0513329,0.998665]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [9788.64,11490.3,-0.0667343], [], 0, 'CAN_COLLIDE'],  [9788.64,11490.3,117.21], [[0.269535,-0.962586,0.0279106], [0.0309823,0.0376363,0.998811]]]
	,[ ['CUP_C_Skoda_Red_CIV', [4127.28,11751.4,-0.0725994], [], 0, 'CAN_COLLIDE'],  [4127.28,11751.4,25.0174], [[0.245323,-0.969377,0.0111835], [-0.00391844,0.0105444,0.999937]]]
	,[ ['CUP_C_Skoda_Green_CIV', [3093.57,9924.19,-0.0728111], [], 0, 'CAN_COLLIDE'],  [3093.57,9924.19,60.4153], [[0.0206981,-0.999786,3.02153e-005], [-0.00194954,-1.01388e-005,0.999998]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [3065.1,9859.54,-0.0742378], [], 0, 'CAN_COLLIDE'],  [3065.1,9859.54,60.417], [[-0.847503,0.530788,0.00147401], [0.00224462,0.000806934,0.999997]]]
	,[ ['CUP_C_Skoda_Red_CIV', [3153.18,9983.61,-0.0721779], [], 0, 'CAN_COLLIDE'],  [3153.18,9983.61,60.287], [[0.552258,-0.833672,0.00150953], [-0.00269846,2.31183e-005,0.999996]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [3063.6,10098.7,-0.0143204], [], 0, 'CAN_COLLIDE'],  [3063.6,10098.7,89.6553], [[0.293594,-0.945925,-0.137943], [0.0559999,-0.127036,0.990316]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [3049.42,10107.3,-0.0561905], [], 0, 'CAN_COLLIDE'],  [3049.42,10107.3,90.7516], [[0.267361,-0.960118,-0.0817992], [0.018893,-0.07965,0.996644]]]
	,[ ['CUP_C_Skoda_Red_CIV', [3633.9,8580.17,-0.0703278], [], 0, 'CAN_COLLIDE'],  [3633.9,8580.17,152.013], [[0.557706,-0.829873,0.0165831], [-0.0262068,0.00236387,0.999653]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [4662.07,9594.85,-0.0467377], [], 0, 'CAN_COLLIDE'],  [4662.07,9594.85,121.102], [[-0.0873135,0.993334,-0.0752615], [0.0551283,0.0802523,0.995249]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [4876.09,9532.61,-0.0587311], [], 0, 'CAN_COLLIDE'],  [4876.09,9532.61,128.355], [[0.29732,-0.954165,0.0341894], [0.0516776,0.0518385,0.997317]]]
	,[ ['CUP_C_Skoda_Blue_CIV', [5946.21,7381.53,-0.0484009], [], 0, 'CAN_COLLIDE'],  [5946.21,7381.53,122.106], [[0.952389,-0.297912,-0.0648251], [0.0735082,0.018023,0.997132]]]

];


private _inRangePosition = [];
private _userPos = getPosASL player;
{
	if ([_userPos, _x select 1, _range] call dzn_fnc_selectByRangeType) then {
		_inRangePosition pushBack _x;	
	};
} forEach _positions;


[
	[_taskName, _taskDisplayName, _taskDesc] 
	, _inRangePosition
	, [_taskSafetyReward, _taskGroups, _taskZonesProperties]
]
