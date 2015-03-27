enableSaving [false,false];
RHSDecalsOff = true;

// Add to init.sqf
// 0: true or false - Edit mode activation, 1: true/false - is Server-side only
[false] execVM "dzn_gear\dzn_gear_init.sqf";

[] execVM "dzn_dynai\dzn_dynai_init.sqf";

if (isServer || isDedicated) then {
	dzn_rallypoint = "Land_Rugbyball_01_F" createVehicle [0,0,0];
	dzn_rallypoint allowDamage false;
	[] execVM "missionFlow\serverMissionFlow.sqf";
};

if !(isDedicated) then {
	waitUntil {!isNil {player getVariable "dzn_gear"} && time > 30};
	taskOperator setVariable [str(vehicle player), player getVariable "dzn_gear", true];
};

