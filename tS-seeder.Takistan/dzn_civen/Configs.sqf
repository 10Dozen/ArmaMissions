dzn_civen_behavior_walkStandChance = [	
	20 /* % Go to Random house */	
	, 70 /* % Go to Random point */
	, 20 /* % Stand on current pos */
];

//  **************** SETTINGS - MAPPINGS ********************
// [ @Location (typeOf object or roleDescription), [ @CivilianType, @VehicleType, @VehiclesPerPopulation ] ]
dzn_civen_locationSettings = [
	[ 
		"LocationCity_F",	
		[ 
			/* Civilian Type */	"CivilianType1"
			/* Vehicle Type */	, "VehicleType1"
			/* Vehicles Density */ 	, 0.3
		] 
	]
	, [ 
		"CustomTown1",	
		[ 
			/* Civilian Type */	"CivilianType1"
			/* Vehicle Type */	, "VehicleType1"
			/* Vehicles Density */ 	, 0.2 
		] 
	]

];

// [ @CivilianTypename, [ @Classnames, @dzn_gear Kits, @Custom code to execute ] ]
dzn_civen_civilianTypes = [
	[
		"CivilianType1"
		, [
			/* ClassNames */ 		["C_man_1", "C_man_polo_1_F_afro"]
			/* Kits */			, []
			/* Code to execute */ 		, { }
		]
	]

];

// [ @VehicleType, [ @Classnames, @dzn_gear Cargo kit, @Custom code to execute, @Fuel-Locked-Damage random] ]
dzn_civen_vehicleTypes = [
	[
		"VehicleType1"
		, [
			["C_Offroad_01_F", "C_Hatchback_01_F","C_SUV_01_F"]	/* ClassNames */ 
			, []				/* Kits */
			, { }				/* Code to execute */
			, [.7,.1,.1]			/* Fuel,Locked Chance,Damage, nil - if used global */
		]
	]
];
