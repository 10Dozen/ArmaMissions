// Gear Kits
//  "kit_" + dzn_factionMapping + "_" + dzn_kitToRoleMapping

#define NIGHT_ITEM(X)	if (daytime < 9 || daytime > 18) then { X } else { "" }
#define SW_RADIO  switch (par_radioMod) do { case 0: {"ItemRadio"}; case 1: {"TFAR_SWRadio"};};
#define LR_RADIO  switch (par_radioMod) do { case 0: {""}; case 1: {"TFAR_LRRadio"};};

// ************************
// NATO Kits
// ************************

#define NATO_UNIFORM	["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt"]
#define NATO_HELMET		["H_HelmetB_grass","H_HelmetB"]

kit_NATO_CO = 	[[NATO_UNIFORM,"V_Chestrig_rgr",LR_RADIO,"H_Beret_02",""],["arifle_MXC_F","optic_Holosight","","acc_pointer_IR",""],["","","","",""],["hgun_P07_F","","","",""],["ItemMap","ItemCompass","ItemWatch",SW_RADIO,"Rangefinder", NIGHT_ITEM("NVGoggles_OPFOR")],[["30Rnd_65x39_caseless_mag",7],["",0],["16Rnd_9x21_Mag",3],[NIGHT_ITEM("Chemlight_green"),3],["SmokeShell",2],["SmokeShellGreen",1],["HandGrenade",2],["SmokeShellRed",1],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];
kit_NATO_SL = 	[[NATO_UNIFORM,"V_PlateCarrier1_rgr",LR_RADIO,NATO_HELMET,""],["arifle_MX_GL_F","optic_MRCO","","acc_pointer_IR",""],["","","","",""],["","","","",""],["ItemMap","ItemCompass","ItemWatch",SW_RADIO,"Binocular",NIGHT_ITEM("NVGoggles_OPFOR")],[["30Rnd_65x39_caseless_mag",7],["",0],["",0],[NIGHT_ITEM("Chemlight_green"),1],["SmokeShell",1],["SmokeShellGreen",1],["HandGrenade",1],["1Rnd_HE_Grenade_shell",4],["1Rnd_Smoke_Grenade_shell",4]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];
kit_NATO_M =    [[NATO_UNIFORM,"V_PlateCarrier2_rgr","B_AssaultPack_mcamo",NATO_HELMET,""],["arifle_MX_F","optic_Aco","","acc_pointer_IR",""],["","","","",""],["","","","",""],["ItemMap","ItemCompass","ItemWatch",SW_RADIO,NIGHT_ITEM("NVGoggles_OPFOR")],[["30Rnd_65x39_caseless_mag",5],["",0],["",0],[NIGHT_ITEM("Chemlight_green"),1],["SmokeShell",10],["",0],["",0],["SmokeShellRed",1],["SmokeShellGreen",1]],[["FirstAidKit",5],["Medikit",1],["",0],["",0],["",0],["",0]],[]];
kit_NATO_FTL = 	[[NATO_UNIFORM,"V_PlateCarrier2_rgr","",NATO_HELMET,""],["arifle_MX_F","optic_MRCO","","acc_pointer_IR",""],["","","","",""],["hgun_P07_F","","","",""],["ItemMap","ItemCompass","ItemWatch",SW_RADIO,"Binocular",NIGHT_ITEM("NVGoggles_OPFOR")],[["30Rnd_65x39_caseless_mag",3],["",0],["16Rnd_9x21_Mag",2],[NIGHT_ITEM("Chemlight_green"),1],["SmokeShell",3],["30Rnd_65x39_caseless_mag_Tracer",5],["SmokeShellRed",1],["SmokeShellGreen",1],["HandGrenade",2]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];
kit_NATO_AR = 	[[NATO_UNIFORM,"V_PlateCarrier1_rgr","B_AssaultPack_mcamo",NATO_HELMET,""],["arifle_MX_SW_F","optic_Holosight","","acc_pointer_IR","bipod_01_F_snd"],["","","","",""],["hgun_P07_F","","","",""],["ItemMap","ItemCompass","ItemWatch",SW_RADIO,NIGHT_ITEM("NVGoggles_OPFOR")],[["100Rnd_65x39_caseless_mag_Tracer",8],["",0],["16Rnd_9x21_Mag",3],[NIGHT_ITEM("Chemlight_green"),2],["SmokeShell",2],["SmokeShellGreen",1],["HandGrenade",2],["",0],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];
kit_NATO_AAR = 	[[NATO_UNIFORM,"V_PlateCarrier1_rgr","B_AssaultPack_mcamo",NATO_HELMET,""],["arifle_MX_F","optic_Aco","","acc_pointer_IR",""],["","","","",""],["","","","",""],["ItemMap","ItemCompass","ItemWatch",SW_RADIO,NIGHT_ITEM("NVGoggles_OPFOR")],[["30Rnd_65x39_caseless_mag",8],["100Rnd_65x39_caseless_mag_Tracer",5],["",0],[NIGHT_ITEM("Chemlight_green"),2],["SmokeShell",3],["SmokeShellGreen",1],["HandGrenade",2],["",0],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];
kit_NATO_G =    [[NATO_UNIFORM,"V_PlateCarrier1_rgr","B_AssaultPack_mcamo",NATO_HELMET,""],["arifle_MX_GL_F","optic_Holosight","","acc_pointer_IR",""],["","","","",""],["","","","",""],["ItemMap","ItemCompass","ItemWatch",SW_RADIO,NIGHT_ITEM("NVGoggles_OPFOR")],[["30Rnd_65x39_caseless_mag",8],["",0],["",0],[NIGHT_ITEM("Chemlight_green"),1],["SmokeShell",2],["1Rnd_HE_Grenade_shell",15],["UGL_FlareWhite_F",2],["UGL_FlareRed_F",2],["1Rnd_Smoke_Grenade_shell",2]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];
kit_NATO_RAT = 	[[NATO_UNIFORM,"V_PlateCarrier1_rgr","B_AssaultPack_mcamo",NATO_HELMET,""],["arifle_MX_ACO_pointer_F","optic_Aco","","acc_pointer_IR",""],["launch_NLAW_F","","","",""],["","","","",""],["ItemMap","ItemCompass","ItemWatch",SW_RADIO,NIGHT_ITEM("NVGoggles_OPFOR")],[["30Rnd_65x39_caseless_mag",10],["",0],["",0],[NIGHT_ITEM("Chemlight_green"),2],["SmokeShell",1],["SmokeShellGreen",1],["HandGrenade",2],["NLAW_F",2],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];

kit_NATO_Random = ["kit_NATO_SL","kit_NATO_M","kit_NATO_FTL","kit_NATO_AR","kit_NATO_AAR","kit_NATO_G","kit_NATO_RAT"];


kit_CSAT = [["U_O_CombatUniform_ocamo","V_HarnessO_brn","","H_HelmetLeaderO_ocamo",""],["arifle_Katiba_F","","","",""],["","","","",""],["","","","",""],["ItemMap","ItemCompass","ItemWatch","ItemRadio"],[["30Rnd_65x39_caseless_green",9],["",0],["",0],["",0],["",0],["",0],["",0],["",0],["",0]],[["FirstAidKit",3],["",0],["",0],["",0],["",0],["",0]],[]];


kit_CSAT_Random = ["kit_CSAT"];
kit_AAF_Random = ["kit_NATO_SL","kit_NATO_M","kit_NATO_FTL","kit_NATO_AR","kit_NATO_AAR","kit_NATO_G","kit_NATO_RAT"];

/*
// ************************
// CSAT Kits
// ************************

#define CSAT_UNIFORM	["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt"]
#define CSAT_HELMET		["H_HelmetB_grass","H_HelmetB"]


kit_CSAT_CO
kit_CSAT_SL
kit_CSAT_M
kit_CSAT_FTL
kit_CSAT_AR
kit_CSAT_AAR
kit_CSAT_G
kit_CSAT_RAT

kit_CSAT_Random = ["kit_CSAT_SL","kit_CSAT_M","kit_CSAT_FTL","kit_CSAT_AR","kit_CSAT_AAR","kit_CSAT_G","kit_CSAT_RAT"];

// ************************
// AAF Kits
// ************************
#define AAF_UNIFORM	["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt"]
#define AAF_HELMET		["H_HelmetB_grass","H_HelmetB"]

kit_AAF_CO
kit_AAF_SL
kit_AAF_M
kit_AAF_FTL
kit_AAF_AR
kit_AAF_AAR
kit_AAF_G
kit_AAF_RAT

kit_AAF_Random = ["kit_AAF_SL","kit_AAF_M","kit_AAF_FTL","kit_AAF_AR","kit_AAF_AAR","kit_AAF_G","kit_AAF_RAT"];

*/

// ************************
// Default Vehicle Kits
// ************************

kitVeh_empty = [ [],[],[],[] ];


// ****************
// END OF KITS
// ****************
dzn_gear_kitsInitialized = true;
