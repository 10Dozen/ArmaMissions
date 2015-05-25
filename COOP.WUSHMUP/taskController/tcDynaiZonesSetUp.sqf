/*
	Dynai Zone Settings - According to Mission Parameters
	
	MisPar:
	
	par_hostileFaction	=	0,1,2
	par_hostileSkill	=	0,1,2
	par_hostileAmount	=	0,1,2,3,4
	par_hostileVehicles	=	0,1,2,3,4
*/

private["_vehicleGroups"];


// ******************
// Defines
// ******************
dzn_hostileInfantryClassname = "O_Soldier_F";

dzn_hostileVehicle_class_Tech = "";
dzn_hostileVehicle_class_Light = "";
dzn_hostileVehicle_class_Medium = "";
dzn_hostileVehicle_class_Heavy = "";

dzn_hostileInfantryKit = format ["kit_%1_Random", [dzn_kitToFactionMapping ,par_hostileFaction] call dzn_fnc_getValueByKey];
dzn_hostileVehicle_gearKit = "";

dzn_vehicleClasses = switch (par_hostileVehicles) do {
	case 0: { [] };
	case 1: { [ dzn_hostileVehicle_class_Tech ] };
	case 2: { [ dzn_hostileVehicle_class_Tech, dzn_hostileVehicle_class_Light ] };
	case 3: { [ dzn_hostileVehicle_class_Tech, dzn_hostileVehicle_class_Light, dzn_hostileVehicle_class_Medium ] };
	case 4: { [ dzn_hostileVehicle_class_Tech, dzn_hostileVehicle_class_Light, dzn_hostileVehicle_class_Medium, dzn_hostileVehicle_class_Heavy ] };
};

dzn_fnc_formatVehicleDynaiVehicleGroups = {
	// veh_count call dzn_fnc_formatVehicleDynaiVehicleGroups
	// RETURN: list of vehicles formatted
	private["_output","_vehicleType","_vehicleUnit","_crewUnits"];
	
	_output = [];
	
	for "_i" from 1 to _this do {		
		_vehicleType = dzn_vehicleClasses call BIS_fnc_selectRandom;
		
		_vehicleUnit = format ["['%1', 'isVehicle', '%2']", _vehicleType, dzn_hostileVehicle_gearKit];
		_crewUnits = switch (_vehicleType) do {
			case dzn_hostileVehicle_class_Tech; 
			case dzn_hostileVehicle_class_Light: { 
				format [
					"['%1',[0,'gunner'],'%2'], ['%1',[0,'driver'],'%2']", 
					dzn_hostileInfantryClassname, 
					dzn_hostileInfantryKit
				]
			};			
			case dzn_hostileVehicle_class_Medium; 
			case dzn_hostileVehicle_class_Heavy: { 
				format [
					"['%1',[0,'commander'],'%2'], ['%1',[0,'gunner'],'%2'],['%1',[0,'driver'],'%2']", 
					dzn_hostileInfantryClassname, 
					dzn_hostileInfantryKit
				]
			};		
		};
		
		_output = _output + [
			[
				1,
				[
					_vehicleUnit,
					_crewUnits
				]
			]
		];
	};	
	
	_output
}

// ******************
//  Zones Settings
// ******************

// ******************
//  Main area
// ******************

// Infantries
dzn_mainAreaGroups_inf_count = switch (par_hostileAmount) then {
	case 0; case 1: { 1 };
	case 2: { 2 }; 
	case 3: { 3 }; 
	case 4: { 4 }
};

dzn_mainAreaGroups_inf_squad = if (par_hostileAmount in [0,1]) then {
	[
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit],
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit]
	]
} else {
	[
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit],
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit],
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit],
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit]
	]
};

dzn_mainAreaGroups = [
	[
		dzn_mainAreaGroups_inf_count,
		dzn_mainAreaGroups_inf_squad
	]
];

// Vehicles
if (par_hostileVehicles != 0) then {	
	dzn_mainAreaGroups_veh_count = switch (par_hostileAmount) then {
		case 0; case 1: { 1 }; 
		case 2: { 3 }; 
		case 3: { 4 }; 
		case 4: { 5 }
	};
	
	dzn_mainAreaGroups = dzn_mainAreaGroups + (dzn_mainAreaGroups_veh_count call dzn_fnc_formatVehicleDynaiVehicleGroups);
};


// ******************
// Indoor area 
// ******************

dzn_indoorAreaGroups_count = switch (par_hostileAmount) then {
	case 0; case 1: { 1 }; case 2; case 3: { 2 }; case 4: { 3 }
};

dzn_indoorAreaGroups =  [
	[
		dzn_indoorAreaGroups_count,
		[
			[dzn_hostileInfantryClassname,["indoors"],dzn_hostileInfantryKit],
			[dzn_hostileInfantryClassname,["indoors"],dzn_hostileInfantryKit],
			[dzn_hostileInfantryClassname,["indoors"],dzn_hostileInfantryKit],
			[dzn_hostileInfantryClassname,["indoors"],dzn_hostileInfantryKit]
		]
	]	
];

// ******************
// Reinforcement A
// ******************

// Infantries
dzn_reinfAAreaGroups_inf_count = switch (par_hostileAmount) then {
	case 0; case 1; case 2: { 1 }; 
	case 3; case 4: { 2 }
};

dzn_reinfAAreaGroups_inf_squad = if (par_hostileAmount in [0]) then {
	[
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit],
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit]
	]
} else {
	[
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit],
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit],
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit],
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit]
	]
};

dzn_reinfAAreaGroups = [
	[
		dzn_reinfAAreaGroups_inf_count,
		dzn_reinfAAreaGroups_inf_squad
	]
];

// Vehicles
if (par_hostileVehicles != 0) then {	
	dzn_reinfAAreaGroups_veh_count = switch (par_hostileAmount) then {
		case 0; case 1; case 2; case 3: { 1 }; case 4: { 2 }
	};
	
	dzn_reinfAAreaGroups = dzn_reinfAAreaGroups + (dzn_reinfAAreaGroups_veh_count call dzn_fnc_formatVehicleDynaiVehicleGroups);	
};

// ******************
// Reinforcement B
// ******************

// Infantries
dzn_reinfBAreaGroups_inf_count = switch (par_hostileAmount) then {
	case 0; case 1; case 2: { 1 }; 
	case 3; case 4: { 2 }
};

dzn_reinfBAreaGroups_inf_squad = if (par_hostileAmount in [0]) then {
	[
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit],
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit]
	]
} else {
	[
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit],
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit],
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit],
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit]
	]
};

dzn_reinfBAreaGroups = [
	[
		dzn_reinfBAreaGroups_inf_count,
		dzn_reinfBAreaGroups_inf_squad
	]
];

// Vehicles
if (par_hostileVehicles != 0) then {	
	dzn_reinfBAreaGroups_veh_count = switch (par_hostileAmount) then {
		case 0: { 0 };
		case 1; case 2; case 3; case 4: { 1 }
	};	
	
	dzn_reinfBAreaGroups = dzn_reinfBAreaGroups + (dzn_reinfBAreaGroups_veh_count call dzn_fnc_formatVehicleDynaiVehicleGroups);	
};

// ****************
// End of Settings
// ****************
dzn_dynaiZonesSetUp = true;


// ****************
// Dynai Zones Set Up
// ****************

waitUntil { 
	!isNil {hostile_mainArea getVariable "initialized"} 
	&& !isNil {hostile_indoorArea getVariable "initialized"}  
};

tc_indoorsPosition = [];
tc_reinfPositions = [];
tc_areasPositions = synchronizedObjects tc_activeTaskTrigger;
{
	if (_x isKindOf "LocationCamp_F") then { 
		tc_indoorsPosition = getPosASL _x;
	} else {
		if (_x isKindOf "LocationResupplyPoint_F") exitWith { 
			tc_reinfPositions = tc_reinfPositions + [getPosASL _x];
		};
	};
} forEach tc_areasPositions;

// Moving zones
[hostile_mainArea, getPos tc_activeTaskModule] call dzn_fnc_dynai_moveZone;
[hostile_indoorArea, tc_indoorsPosition] call dzn_fnc_dynai_moveZone;
[hostile_reinfAArea, tc_reinfPositions select 0] call dzn_fnc_dynai_moveZone;
[hostile_reinfBArea, tc_reinfPositions select 1] call dzn_fnc_dynai_moveZone;

// Activating zones
hostile_mainArea call dzn_fnc_dynai_activateZone;
sleep 8;
hostile_indoorArea call dzn_fnc_dynai_activateZone;

[] spawn {
	waitUntil { sleep 5; {_x distance tc_activeTaskModule < 600 } count (call bis_fnc_listPlayers) };
	
	[hostile_reinfAArea, [ getPos tc_activeTaskModule ]] call dzn_fnc_dynai_setZoneKeypoints;
	hostile_reinfAArea call dzn_fnc_dynai_activateZone;
	
	sleep 6;
	[hostile_reinfBArea, [ getPos tc_activeTaskModule ]] call dzn_fnc_dynai_setZoneKeypoints;
	hostile_reinfBArea call dzn_fnc_dynai_activateZone;
};
