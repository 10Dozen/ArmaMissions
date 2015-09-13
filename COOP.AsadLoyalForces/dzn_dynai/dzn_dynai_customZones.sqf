	[
		"dzn_zone1","RESISTANCE",true,[],[],
		[
			[
				/* Infantry units */
				4,
				[					
					["I_G_Soldier_F",[], "insurgentRandomKit"],
					["I_G_Soldier_GL_F",[], "insurgentRandomKit"],
					["I_G_Soldier_AR_F",[], "insurgentRandomKit"],
					["I_G_Soldier_GL_F",[], "insurgentRandomKit"],
					["I_G_Soldier_LAT_F",[], "insurgentRandomKit"]
				]
			],
			[
				/* Infantry units */
				round(random(6)),
				[	
					["I_G_Soldier_GL_F",[], "insurgentRandomKit"],
					["I_G_Soldier_LAT_F",[], "insurgentRandomKit"]
				]
			],
			[
				/* Infantry units */
				round(random(15)) + 10,
				[					
					["I_G_Soldier_F", ["indoors"], "insurgentRandomKit"]
				]
			]
		],
		["LIMITED",	"SAFE",	"YELLOW", "COLUMN"]
	]
	,[
		"dzn_zone2","RESISTANCE",false,[],[],
		[
			[
				/* Infantry units */
				4,
				[					
					["B_G_Offroad_01_armed_F", "isVehicle", "vehicleInsurgnetsKit"],
					["I_G_Soldier_GL_F", [0, "driver"], "insurgentRandomKit"],
					["I_G_Soldier_AR_F", [0, "gunner"], "insurgentRandomKit"]
				]
			],
			[				
				round(random(4)),
				[	
					["I_G_Soldier_F",[], "insurgentRandomKit"],
					["I_G_Soldier_F",[], "insurgentRandomKit"],
					["I_G_Soldier_F",[], "insurgentRandomKit"]
				]
			]
		],
		["FULL", "AWARE", "YELLOW", "COLUMN"]
	]
