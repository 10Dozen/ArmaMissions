/*	******************  zone example ******************************
	
	[
		"zone1",					// zone name = name of module
		WEST,						// side
		true,						// isActive 
		[],							// null - creates from init
		[],							// null - creates from init
		[	
			// units 
			5,						// Quantity of describer group for zone
			[
				[
					"B_officer_F",	// classname
					[],		// [] - for partol unit, [0, "driver"] - for crew of group vehicle, ["indoors"] - to spawn unit inside houses, "isVehicle" - for vehicle
					"specForKit"	// Name of kit for dzn_gear
				]
			]
		],
		[
			//behavior 
			"LIMITED",				// Speed
			"SAFE",					// Behavior
			"YELLOW",				// combat mode
			"COLUMN"				// formation
		]	
	]	I_MRAP_03_hmg_F

*/


// *********** This array defines detailed properties of zones **************************
dzn_dynai_zoneProperties = [	

	/* OPFOR */
	[
		"dzn_convoyStart","OPFOR",true,[],[],
		[
			[
				/* Infantry units */
				4,
				[					
					["I_G_Soldier_F",[], ""]
				]
			]
		],
		["LIMITED",	"SAFE",	"YELLOW", "COLUMN"]
	],
	
	/* INSURGENTS */
	[
		"dzn_convoyAttackers1","RESISTANCE",false,[],[],
		[
			[
				/* Infantry units */
				4,
				[					
					["I_G_Soldier_F",[], ""]
				]
			]
		],
		["LIMITED",	"SAFE",	"YELLOW", "COLUMN"]
	],
	[
		"dzn_convoyAttackers2","RESISTANCE",false,[],[],
		[
			[
				/* Infantry units */
				4,
				[					
					["I_G_Soldier_F",[], ""]
				]
			]
		],
		["LIMITED",	"SAFE",	"YELLOW", "COLUMN"]
	],
	
	
	[
		"dzn_insSam0","RESISTANCE",false,[],[],
		[
			[
				/* Infantry units */
				4,
				[					
					["I_G_Soldier_F",[], ""]
				]
			]
		],
		["LIMITED",	"SAFE",	"YELLOW", "COLUMN"]
	],
	[
		"dzn_insSam1","RESISTANCE",false,[],[],
		[
			[
				/* Infantry units */
				4,
				[					
					["I_G_Soldier_F",[], ""]
				]
			]
		],
		["LIMITED",	"SAFE",	"YELLOW", "COLUMN"]
	],
		[
		"dzn_insSam2","RESISTANCE",false,[],[],
		[
			[
				/* Infantry units */
				4,
				[					
					["I_G_Soldier_F",[], ""]
				]
			]
		],
		["LIMITED",	"SAFE",	"YELLOW", "COLUMN"]
	],
		[
		"dzn_insSam3","RESISTANCE",false,[],[],
		[
			[
				/* Infantry units */
				4,
				[					
					["I_G_Soldier_F",[], ""]
				]
			]
		],
		["LIMITED",	"SAFE",	"YELLOW", "COLUMN"]
	],
		[
		"dzn_insSam4","RESISTANCE",false,[],[],
		[
			[
				/* Infantry units */
				4,
				[					
					["I_G_Soldier_F",[], ""]
				]
			]
		],
		["LIMITED",	"SAFE",	"YELLOW", "COLUMN"]
	]
];
