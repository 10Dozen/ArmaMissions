// ***********************************
// Gear Kits 
// ***********************************

// ******** USEFUL MACROSES *******
// Maros for Empty weapon
#define EMPTYKIT	[["","","","",""],["","","","",""],["","","","",""],["","","","",""],[],[["",0],["",0],["",0],["",0],["",0],["",0],["",0],["",0],["",0]],[["",0],["",0],["",0],["",0],["",0],["",0]],[]]
// Macros for Empty weapon
#define EMPTYWEAPON	["","","",""]
// Macros for the list of items to be chosen randomly
#define RANDOM_ITEM	["H_HelmetB_grass","H_HelmetB"]
// Macros to give the item only if daytime is in given inerval (e.g. to give NVGoggles only at night)
#define NIGHT_ITEM(X)	if (daytime < 9 || daytime > 18) then { X } else { "" }


// **************
// RECON TEAM
// **************
kit_recon_tl =
	[
	["<EQUIPEMENT >>  ","U_B_CombatUniform_mcam","CUP_V_B_RRV_DA1","B_AssaultPack_mcamo","H_HelmetB_light_sand",""],
	["<PRIMARY WEAPON >>  ","rhs_weap_m4a1_carryhandle_m203","rhs_mag_30Rnd_556x45_Mk318_Stanag",["rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","optic_NVS",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ","ItemMap","ItemCompass","tf_microdagr","tf_rf7800str_2","rhsusf_ANPVS_15","Rangefinder"],
	["<UNIFORM ITEMS >> ",[["ACE_DAGR",1],["ACE_quikclot",4],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_tourniquet",2],["ACE_fieldDressing",5],["ACE_packingBandage",3],["ACE_MapTools",1]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",6],["rhs_mag_M433_HEDP",4],["SmokeShell",2],["HandGrenade",2],["Chemlight_green",2],["Chemlight_red",1],["B_IR_Grenade",2]]],
	["<BACKPACK ITEMS >> ",[["PRIMARY MAG",2],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2],["rhs_mag_M433_HEDP",4],["UGL_FlareRed_F",2],["UGL_FlareCIR_F",2],["UGL_FlareGreen_F",1],["UGL_FlareWhite_F",2]]]
];

kit_recon_jtac =
	[
	["<EQUIPEMENT >>  ","U_B_CombatUniform_mcam","CUP_V_B_RRV_DA1","tf_anarc210","H_HelmetB_light_sand",""],
	["<PRIMARY WEAPON >>  ","rhs_weap_m4a1_carryhandle_grip","rhs_mag_30Rnd_556x45_Mk318_Stanag",["rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ","ItemMap","ItemCompass","tf_microdagr","tf_rf7800str_2","rhsusf_ANPVS_15","CUP_SOFLAM"],
	["<UNIFORM ITEMS >> ",[["ACE_DAGR",1],["ACE_quikclot",4],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_tourniquet",2],["ACE_fieldDressing",5],["ACE_packingBandage",3],["ACE_MapTools",1],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1]]],
	["<VEST ITEMS >> ",[["SmokeShell",2],["HandGrenade",2],["Chemlight_green",2],["Chemlight_red",1],["B_IR_Grenade",2],["PRIMARY MAG",7],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1]]],
	["<BACKPACK ITEMS >> ",[["Laserbatteries",3]]]
];

kit_recon_ar =
	[
	["<EQUIPEMENT >>  ","U_B_CombatUniform_mcam","CUP_V_B_RRV_MG","B_AssaultPack_mcamo","H_HelmetB_light_sand",""],
	["<PRIMARY WEAPON >>  ","rhs_weap_m249_pip_S","rhs_200rnd_556x45_M_SAW",["","rhsusf_acc_anpeq15A","iansky_t1s",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ","ItemMap","ItemCompass","tf_microdagr","tf_rf7800str_2","rhsusf_ANPVS_15"],
	["<UNIFORM ITEMS >> ",[["ACE_DAGR",1],["ACE_quikclot",4],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_tourniquet",2],["ACE_fieldDressing",5],["ACE_packingBandage",3],["ACE_MapTools",1]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",2],["Chemlight_green",2]]],
	["<BACKPACK ITEMS >> ",[["PRIMARY MAG",1],["HandGrenade",1],["SmokeShell",1],["Chemlight_green",1],["Chemlight_red",1],["B_IR_Grenade",1]]]
];

kit_recon_mm =
	[
	["<EQUIPEMENT >>  ","U_B_CombatUniform_mcam","CUP_V_B_RRV_DA1","B_AssaultPack_mcamo","H_HelmetB_light_sand",""],
	["<PRIMARY WEAPON >>  ","rhs_weap_m4a1","rhs_mag_30Rnd_556x45_Mk318_Stanag",["rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","CUP_optic_AN_PVS_4","bipod_01_F_blk"]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", "ItemMap","ItemCompass","tf_microdagr","tf_rf7800str_2","rhsusf_ANPVS_15"],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",10],["ACE_MapTools",1],["ACE_packingBandage",5],["ACE_tourniquet",2],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_quikclot",5],["ACE_DAGR",1]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",6],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",4],["HandGrenade",2],["Chemlight_green",2],["Chemlight_red",1],["B_IR_Grenade",1]]],
	["<BACKPACK ITEMS >> ",[["SmokeShell",2],["rhs_200rnd_556x45_M_SAW",2]]]
];

kit_recon_vehicle = [
	[],
	[["rhs_200rnd_556x45_M_SAW",2],["B_IR_Grenade",5],["Chemlight_green",5],["Chemlight_red",5],["SmokeShell",5],["HandGrenade",5],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",5],["Laserbatteries",2],["rhs_mag_30Rnd_556x45_Mk318_Stanag",5],["SatchelCharge_Remote_Mag",2]],
	[["FirstAidKit",4],["ACE_Clacker",2]],
	[]
];


// **************
// PILOT
// **************
kit_pilot =
	[
	["<EQUIPEMENT >>  ","CUP_U_B_USMC_PilotOverall","CUP_V_B_PilotVest","ACE_NonSteerableParachute","CUP_H_USMC_Helmet_Pilot",""],
	["<PRIMARY WEAPON >>  ","","",["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","CUP_hgun_M9","CUP_15Rnd_9x19_M9",["","","",""]],
	["<ASSIGNED ITEMS >>  ","ItemMap","tf_rf7800str_1","ItemGPS","rhsusf_ANPVS_15"],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",10],["ACE_packingBandage",5],["ACE_tourniquet",2],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_quikclot",5]]],
	["<VEST ITEMS >> ",[["HANDGUN MAG",3],["Chemlight_green",4],["Chemlight_red",2],["B_IR_Grenade",2]]],
	["<BACKPACK ITEMS >> ",[]]
];


kit_blufor_common =
	[
	["<EQUIPEMENT >>  ","rhs_uniform_cu_ucp","rhsusf_iotv_ucp_Rifleman","","rhsusf_ach_bare_tan_headset",""],
	["<PRIMARY WEAPON >>  ","rhs_weap_m4_grip","rhs_mag_30Rnd_556x45_Mk318_Stanag",["","CUP_acc_ANPEQ_2","rhsusf_acc_compm4",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ","rhsusf_ANPVS_15"],
	["<UNIFORM ITEMS >> ",[["PRIMARY MAG",4]]],
	["<VEST ITEMS >> ",[["ACE_fieldDressing",10],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_tourniquet",2],["ACE_packingBandage",5],["HandGrenade",3],["SmokeShell",3]]],
	["<BACKPACK ITEMS >> ",[]]
];

// **************
// INSURGENTS
// **************


#define INS_UNIFORMS	["LOP_U_AM_Fatigue_01","LOP_U_AM_Fatigue_02","LOP_U_AM_Fatigue_03","LOP_U_AM_Fatigue_04","LOP_U_AFR_Fatigue_02","U_BG_leader","LOP_U_ISTS_Fatigue_01","LOP_U_ISTS_Fatigue_02","LOP_U_ISTS_Fatigue_04","LOP_U_TAK_Civ_Fatigue_01"] 
#define INS_HEADGEAR	["LOP_U_AM_Fatigue_01","LOP_H_Turban","rhs_tsh4","H_ShemagOpen_tan","LOP_H_Shemag_BLK","LOP_H_Pakol","rhs_beanie","H_Bandanna_sand","LOP_H_Worker_cap","rhs_beanie_green","H_Bandanna_cbr"]
#define INS_VESTS		["rhs_6sh92"]
#define INS_WEAPON 	["rhs_weap_akms","CUP_arifle_AK74","rhs_weap_akm","CUP_arifle_AKS74","CUP_srifle_LeeEnfield","rhs_weap_m16a4_carryhandle","rhs_weap_m4a1_carryhandle_grip","CUP_arifle_RPK74_45","rhs_weap_pkm"]
#define INS_MAGZ 		["rhs_30Rnd_762x39mm","CUP_30Rnd_545x39_AK_M","rhs_30Rnd_762x39mm","CUP_30Rnd_545x39_AK_M","CUP_10x_303_M","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M","rhs_100Rnd_762x54mmR"]

kit_ins_common =
	[
	["<EQUIPEMENT >>  ", INS_UNIFORMS,INS_VESTS,"",INS_HEADGEAR,""],
	["<PRIMARY WEAPON >>  ",INS_WEAPON,INS_MAGZ,["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  "],
	["<UNIFORM ITEMS >> ",[["PRIMARY MAG",3]]],
	["<VEST ITEMS >> ",[["ACE_fieldDressing",10],["ACE_tourniquet",1],["PRIMARY MAG",4],["CUP_HandGrenade_RGD5",3],["SmokeShell",2]]],
	["<BACKPACK ITEMS >> ",[]]
];