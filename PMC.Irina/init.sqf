enableSaving [false, false];

// Add to init.sqf
// 0: true or false - Edit mode activation, 1: true/false - is Server-side only
[true] execVM "dzn_gear\dzn_gear_init.sqf";

[] execVM "dzn_dynai\dzn_dynai_init.sqf";
[] execVM "dzn_jtac\dzn_jtac_init.sqf";

[] execVM "missionFlow\commonMarket.sqf";
[] execVM "missionFlow\commonCarMarket.sqf";
[] execVM "missionFlow\playerTrespassing.sqf";

[] execVM "missionFlow\commonTaskControl.sqf";

if (isServer || isDedicated) then {
	dzn_rallypoint = "Land_Rugbyball_01_F" createVehicle [0,0,0];
	dzn_rallypoint allowDamage false;
	
	[] execVM "missionFlow\serverMissionFlow.sqf";
};


if !(isDedicated) then {
	
	waitUntil {!isNil {player getVariable "dzn_gear"} && time > 30};
	taskOperator setVariable [str(vehicle player), player getVariable "dzn_gear", true];
};

resistance setFriend [west, 0.65];


