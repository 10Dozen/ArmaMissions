// Timer to capture zone
dzn_captureTimerDefault = 60;
dzn_endTimerLimitValue = 5;


dzn_weatherSettingsMapping = [
	[1, 0],
	[2, 0.25],
	[3, 0.5],
	[4, 0.75],
	[5, 1]
];

dzn_fogSettingsMapping = [
	[1, [0, 0.01, 0]],
	[2, [0.5, 0.02, 0]],
	[3, [1, 0.01, 0]]
];


dzn_squadsMapping = [
	["CO", localize "STR_assignmentCO"],
	[0, localize "STR_assignmentAlpha"],
	[1, localize "STR_assignmentBravo"],
	[2, localize "STR_assignmentCharlie"],
	[3, localize "STR_assignmentDelta"],
	[4, localize "STR_assignmentFoxtrot"],
	[5, localize "STR_assignmentEcho"]
];

dzn_roleMapping = [
	[0, localize "STR_assignmentRole_CO"],
	
	[10, localize "STR_assignmentRole_SL"],
	[100, localize "STR_assignmentRole_M"],
	
	[101, localize "STR_assignmentRole_FTL_R"],
	[102, localize "STR_assignmentRole_AR_R"],
	[103, localize "STR_assignmentRole_AAR_R"],
	[104, localize "STR_assignmentRole_G_R"],
	
	[105, localize "STR_assignmentRole_FTL_B"],
	[106, localize "STR_assignmentRole_AR_B"],
	[107, localize "STR_assignmentRole_AAR_B"],
	[108, localize "STR_assignmentRole_AT_B"]
];

dzn_roleMappingShort = [
	[0, "CO"],
	
	[10, "SL"],
	[100, "Medic"],
	
	[101, "FTL"],
	[102, "AR"],
	[103, "AAR"],
	[104, "GR"],
	
	[105, "FTL"],
	[106, "AR"],
	[107, "AAR"],
	[108, "RAT"]
];

dzn_rolePicMapping = [
	[0, "img\CO.jpg"],
	
	[10, "img\SL.jpg"],
	[100, "img\M.jpg"],
	
	[101, "img\FTL_R.jpg"],
	[102, "img\AR_R.jpg"],
	[103, "img\AAR_R.jpg"],
	[104, "img\G_R.jpg"],
	
	[105, "img\FTL_B.jpg"],
	[106, "img\AR_B.jpg"],
	[107, "img\AAR_B.jpg"],
	[108, "img\AT_B.jpg"]
];

dzn_factionMapping = [
	[0,	localize "STR_par_faction1"],
	[1,	localize "$STR_par_faction2"],
	[2,	localize "$STR_par_faction3"]
];

dzn_kitToFactionMapping = [
	[0,	"NATO"],
	[1,	"CSAT"],
	[2,	"AAF"]
];

dzn_kitToRoleMapping = [
	[0, "CO"],
	
	[10, "SL"],
	[100, "M"],
	
	[101, "FTL"],
	[102, "AR"],
	[103, "AAR"],
	[104, "G"],
	
	[105, "FTL"],
	[106, "AR"],
	[107, "AAR"],
	[108, "RAT"]
];

dzn_vehicleToFactionMapping = [
	[
		0,	
		[
			[/*Tech*/ "B_G_Offroad_01_armed_F"],
			[/*Light*/ "B_MRAP_01_hmg_F" ],
			[/*Medium*/ "B_APC_Wheeled_01_cannon_F"],
			[/*Heavy*/ "B_MBT_01_cannon_F" ]
		]
	],
	[
		1,	
		[
			[/*Tech*/ "O_G_Offroad_01_armed_F"],
			[/*Light*/ "O_MRAP_02_hmg_F"],
			[/*Medium*/ "O_APC_Wheeled_02_rcws_F"],
			[/*Heavy*/ "O_MBT_02_cannon_F"]
		]
	],
	[
		2,	
		[
			[/*Tech*/ "I_G_Offroad_01_armed_F"],
			[/*Light*/ "I_MRAP_03_hmg_F"],
			[/*Medium*/ "I_APC_Wheeled_03_cannon_F"],
			[/*Heavy*/ "I_MBT_03_cannon_F"]
		]
	]
];
