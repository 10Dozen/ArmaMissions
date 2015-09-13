enableSaving [false,false];
tf_no_auto_long_range_radio = true;

// *************************************************************************************
// 										Custom Section
// *************************************************************************************

[] spawn {
	if (isServer || isDedicated) then { 
		
	
		rallypoint = "Misc_Backpackheap" createVehicle [0,0,0];
		cache = "Box_FIA_Ammo_F" createVehicle [0,10,0];	
	
		waitUntil { time > 0 && !isNil {dzn_gear_kitsInitialized} };
		[] execVM "missionFlow\serverMissionFlow.sqf"; 
		
		#define ZONE_HOUSES	((dzn_zone1 getVariable "properties") select 7)
		waitUntil {!isNil { ZONE_HOUSES }};
		waitUntil { !( ZONE_HOUSES isEqualTo [] ) };
	
		cache setPos ( (ZONE_HOUSES call BIS_fnc_selectRandom) buildingPos 1 );
	};
	
	waitUntil {!isNil {player getVariable "dzn_gear"} && time > 10};	
	taskOperator setVariable [name player, player getVariable "dzn_gear", true];
};

// Add to init.sqf
// 0: true or false - Edit mode activation, 1: true/false - is Server-side only
[false] execVM "dzn_gear\dzn_gear_init.sqf";

[] execVM "dzn_dynai\dzn_dynai_init.sqf";


enableSentences false;
