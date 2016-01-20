// Timer to capture zone
dzn_captureTimerDefault = 60;
dzn_endTimerLimitValue = 5;

// Mode radious
dzn_swRadioMapping = [
	[0, ["ItemRadio","ItemRadio"]],
	[1, ["tf_anprc152","tf_rf7800str"]]
];

dzn_lrRadioMapping = [
	[0, ""],
	[1, "tf_rt1523g"]
];

// Frequensies
// TFAR_fnc_setSwFrequency 
dzn_TFAR_swFreqs = [
	["CO", "100"],
	[0, "101"],
	[1, "102"],
	[2, "103"],
	[3, "104"],
	[4, "105"],
	[5, "106"]
];

// TFAR_fnc_setLrFrequency
dzn_TFAR_lrFreq = "50";


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
	[103, localize "STR_assignmentRole_G_R"],
	[104, localize "STR_assignmentRole_R_R"],
	
	[105, localize "STR_assignmentRole_FTL_B"],
	[106, localize "STR_assignmentRole_AR_B"],
	[107, localize "STR_assignmentRole_G_B"],
	[108, localize "STR_assignmentRole_AT_B"]
];

dzn_roleMappingShort = [
	[0, "CO"],
	
	[10, "SL"],
	[100, "Medic"],
	
	[101, "FTL"],
	[102, "AR"],
	[103, "GR"],
	[104, "R"],
	
	[105, "FTL"],
	[106, "AR"],
	[107, "GR"],
	[108, "RAT"]
];

dzn_rolePicMapping = [
	[0, "img\CO.jpg"],
	
	[10, "img\SL.jpg"],
	[100, "img\M.jpg"],
	
	[101, "img\FTL_R.jpg"],
	[102, "img\AR_R.jpg"],
	[103, "img\G_R.jpg"],
	[104, "img\R_R.jpg"],
	
	[105, "img\FTL_B.jpg"],
	[106, "img\AR_B.jpg"],
	[107, "img\G_B.jpg"],
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
	[103, "G"],
	[104, "R"],
	
	[105, "FTL"],
	[106, "AR"],
	[107, "G"],
	[108, "RAT"]
];

dzn_vehicleToFactionMapping = [
	[
		0,	// NATO
		[
			[/*Tech*/ "B_G_Offroad_01_armed_F"],
			[/*Light*/ "B_MRAP_01_hmg_F" ],
			[/*Medium*/ "B_APC_Wheeled_01_cannon_F"],
			[/*Heavy*/ "B_MBT_01_cannon_F" ]
		]
	],
	[
		1,	// CSAT
		[
			[/*Tech*/ "O_G_Offroad_01_armed_F"],
			[/*Light*/ "O_MRAP_02_hmg_F"],
			[/*Medium*/ "O_APC_Wheeled_02_rcws_F"],
			[/*Heavy*/ "O_MBT_02_cannon_F"]
		]
	],
	[
		2,	// AAF
		[
			[/*Tech*/ "I_G_Offroad_01_armed_F"],
			[/*Light*/ "I_MRAP_03_hmg_F"],
			[/*Medium*/ "I_APC_Wheeled_03_cannon_F"],
			[/*Heavy*/ "I_MBT_03_cannon_F"]
		]
	]
];
