
if (isServer || isDedicated) then {
	dzn_rallypoint = "Land_Rugbyball_01_F" createVehicle [0,0,0];
	dzn_rallypoint allowDamage false;
	
	[] execVM "missionFlow/serverMissionFlow.sqf";
};

if !(isDedicated) then {
	
	waitUntil {!isNil {player getVariable "dzn_gear" && time > 30};
	taskOperator setVariable [format ["player_%1", str(vehicle player)], player getVariable "dzn_gear", true];
};

// DZN_GEAR
// [false] execVM "dzn_gear\dzn_gear_init.sqf";

// DZN_DYNAI
// [] execVM "dzn_dynai\dzn_dynai_init.sqf";
