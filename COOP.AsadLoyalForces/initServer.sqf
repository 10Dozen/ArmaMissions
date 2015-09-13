
// Base
[] spawn {
	private['_vehs','_boxes'];
	
	_vehs = [
		base_outpost
		, [ 
			["rhs_btr70_msv", 2]
			, ["O_Truck_02_covered_F", 1]
			, ["RHS_UAZ_MSV_01", 2]
		]
		, false
	] call dzn_fnc_deployVehiclesAtBasepoint;	
	_boxes = [base_outpost_boxes, "O_CargoNet_01_ammo_F", true] call dzn_fnc_deployVehiclesAtBasepoint;
	
	
	waitUntil {!isNil "dzn_gear_initialized" && {dzn_gear_initialized}};
	{
		[_x, "vehicleCombatKit", true] call dzn_fnc_gear_assignKit;
	} forEach (_boxes + _vehs);
};


// Setting Cache
[] spawn { 
	rallypoint = "Misc_Backpackheap" createVehicle [0,0,0];
	cache = "Box_FIA_Ammo_F" createVehicle [0,10,0];	

	waitUntil { time > 0 && !isNil {dzn_gear_kitsInitialized} };
	[] execVM "missionFlow\serverMissionFlow.sqf"; 

	#define ZONE_HOUSES	((dzn_zone1 getVariable "properties") select 7)
	waitUntil {!isNil { ZONE_HOUSES }};
	waitUntil { !( ZONE_HOUSES isEqualTo [] ) };
	cache setPos ( (ZONE_HOUSES call BIS_fnc_selectRandom) buildingPos 1 );
};

