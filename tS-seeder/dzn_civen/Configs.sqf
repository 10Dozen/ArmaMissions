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
			/* Civilian Type */	"TakistanCivil"
			/* Vehicle Type */	, "TakistanVehicles"
			/* Vehicles Density */ 	, 0.3
		] 
	]
	,[ 
		"LocationVillage_F",	
		[ 
			/* Civilian Type */	"TakistanCivil"
			/* Vehicle Type */	, "TakistanVehicles"
			/* Vehicles Density */ 	, 0
		] 
	]
];

// [ @CivilianTypename, [ @Classnames, @dzn_gear Kits, @Custom code to execute ] ]
dzn_civen_civilianTypes = [
	[
		"TakistanCivil"
		, [
			/* ClassNames */ 		["LOP_Tak_Civ_Man_01"]
			/* Kits */			, ["kit_civ_takistan"]
			/* Code to execute */ 	, { deleteVehicle _this; }
		]
	]

];

// [ @VehicleType, [ @Classnames, @dzn_gear Cargo kit, @Custom code to execute, @Fuel-Locked-Damage random] ]
dzn_civen_vehicleTypes = [
	[
		"TakistanVehicles"
		, [
			[
				'LOP_TAK_Civ_Landrover'
				,'LOP_TAK_Civ_UAZ'
				,'LOP_TAK_Civ_UAZ_Open'
				,'LOP_TAK_Civ_Ural'
				,'LOP_TAK_Civ_Ural_open'
				,'CUP_C_Skoda_Blue_CIV'
				,'CUP_C_Skoda_Red_CIV'
				,'CUP_C_Skoda_White_CIV'
				,'CUP_C_Skoda_Green_CIV'
				,'CUP_C_Datsun'
				,'CUP_C_Ural_Civ_03'
				,'CUP_C_Ural_Open_Civ_01'
				,'CUP_C_Ural_Civ_01'
				,'CUP_C_Ural_Open_Civ_02'
			]	/* ClassNames */ 
			, []				/* Kits */
			, { }				/* Code to execute */
			, [.7,.5,.2]			/* Fuel,Locked Chance,Damage, nil - if used global */
		]
	]
];
