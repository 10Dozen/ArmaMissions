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

// kit_rapier_default
kit_rapier_default =
	[
	["<EQUIPEMENT >>  ","LOP_U_RACS_Fatigue_01_slv","LOP_V_CarrierLite_TAN","","LOP_H_6B27M_ess_RACS",""],
	["<PRIMARY WEAPON >>  ","","",["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ","ItemMap","ItemCompass","ItemWatch","tf_anprc152_3"],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",5],["ACE_packingBandage",5],["ACE_elasticBandage",5],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_epinephrine",2],["ACE_quikclot",5],["ACE_CableTie",2],["ACE_Flashlight_XL50",1],["ACE_EarPlugs",1],["ACE_DefusalKit",1]]],
	["<VEST ITEMS >> ",[]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_rapier_HMMWV_Cargo = [];
kit_rapier_APC_Cargo = [];


// Security Forces
#define	SEC_EQUIP	"rhs_uniform_FROG01_d","CUP_V_B_RRV_TL","","rhsusf_ach_bare_headset"
#define	SEC_EQUIP2	"rhs_uniform_FROG01_d","CUP_V_B_RRV_TL","B_AssaultPack_rgr","rhsusf_ach_bare_headset"
#define	SEC_AITEMS	"ItemRadio"

kit_sec_random = [
	"kit_sec_r"
	,"kit_sec_gr"
	
	,"kit_sec_r","kit_sec_gr","kit_sec_r","kit_sec_gr","kit_sec_r","kit_sec_gr"
	
	,"kit_sec_mg"
	,"kit_sec_rat"
];

kit_sec_fighter = [
	"kit_sec_r"
	,"kit_sec_gr"
	,"kit_sec_rat"
];

kit_sec_r =	[
	["<EQUIPEMENT >>  ",SEC_EQUIP,""],
	["<PRIMARY WEAPON >>  "
		,["rhs_weap_m16a4_carryhandle_grip","rhs_weap_m4a1_carryhandle"]
		,["rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag"]
		,["","","",""]
	],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ",SEC_AITEMS],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",5],["ACE_packingBandage",5],["ACE_elasticBandage",5],["ACE_tourniquet",2],["ACE_quikclot",5],["ACE_CableTie",2],["ACE_EarPlugs",1],["ACE_Flashlight_MX991",1],["ACE_morphine",1]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",7],["rhs_mag_rgd5",3],["SmokeShell",3]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_sec_gr = [
	["<EQUIPEMENT >>  ",SEC_EQUIP,""],
	["<PRIMARY WEAPON >>  "
		,["rhs_weap_m16a4_carryhandle_M203","rhs_weap_m4a1_carryhandle_m203"]
		,["rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag"]
		,["","","",""]
	],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ",SEC_AITEMS],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",5],["ACE_packingBandage",5],["ACE_elasticBandage",5],["ACE_tourniquet",2],["ACE_quikclot",5],["ACE_CableTie",2],["ACE_EarPlugs",1],["ACE_Flashlight_MX991",1],["ACE_morphine",1]]],
	["<VEST ITEMS >> ",[["rhs_mag_rgd5",2],["SmokeShell",3],["PRIMARY MAG",6],["rhs_mag_M433_HEDP",8]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_sec_mg = [
	["<EQUIPEMENT >>  ",SEC_EQUIP2,""],
	["<PRIMARY WEAPON >>  ","rhs_weap_pkm","rhs_100Rnd_762x54mmR",["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ",SEC_AITEMS],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",5],["ACE_packingBandage",5],["ACE_elasticBandage",5],["ACE_tourniquet",2],["ACE_quikclot",5],["ACE_CableTie",2],["ACE_EarPlugs",1],["ACE_Flashlight_MX991",1],["ACE_morphine",1]]],
	["<VEST ITEMS >> ",[["rhs_mag_rgd5",2],["SmokeShell",3],["PRIMARY MAG",1]]],
	["<BACKPACK ITEMS >> ",[["PRIMARY MAG",3]]]
];

kit_sec_rat = [
	["<EQUIPEMENT >>  ",SEC_EQUIP,""],
	["<PRIMARY WEAPON >>  "
		,["rhs_weap_m16a4_carryhandle_grip","rhs_weap_m4a1_carryhandle"]
		,["rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag"]
		,["","","",""]
	],
	["<LAUNCHER WEAPON >>  ","rhs_weap_M136_hedp","rhs_m136_hedp_mag",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ",SEC_AITEMS],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",5],["ACE_packingBandage",5],["ACE_elasticBandage",5],["ACE_tourniquet",2],["ACE_quikclot",5],["ACE_CableTie",2],["ACE_EarPlugs",1],["ACE_Flashlight_MX991",1],["ACE_morphine",1]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",7],["rhs_mag_rgd5",3],["SmokeShell",3]]],
	["<BACKPACK ITEMS >> ",[]]
];


// Militia / Insurgents

#define	INS_HEAD		["LOP_H_Turban_mask","CUP_H_TKI_Pakol_2_03","CUP_H_TKI_Pakol_1_06","CUP_H_TKI_Pakol_1_02","CUP_H_TKI_Lungee_06","CUP_H_TKI_Lungee_04","CUP_H_TKI_Lungee_01","CUP_H_TKI_Lungee_03"]
#define	INS_UNI_1		["CUP_U_O_Partisan_TTsKO_Mixed","CUP_U_O_Partisan_TTsKO","CUP_B_USMC_Navy_Brown","CUP_U_O_TK_MixedCamo","CUP_U_O_SLA_Desert","CUP_U_O_SLA_Desert","CUP_U_O_SLA_MixedCamo","CUP_U_I_GUE_Woodland1"]
#define	INS_VEST_1		["CUP_V_O_TK_Vest_1","CUP_V_O_TK_Vest_1"]
#define	INS_UNI_2		["CUP_O_TKI_Khet_Partug_06","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_04","CUP_O_TKI_Khet_Partug_04"]
#define	INS_VEST_2		["CUP_V_OI_TKI_Jacket4_03","CUP_V_OI_TKI_Jacket2_03","CUP_V_OI_TKI_Jacket2_01","CUP_V_OI_TKI_Jacket2_01"]
#define	INS_RADIO		["ItemRadio", "", "", "", "", ""]
#define	INS_MAP		["ItemMap", "", "", "", "", ""]
#define	INS_AITEMS		INS_RADIO, INS_MAP
#define	INS_R_WEP		["rhs_weap_ak74m","rhs_weap_akm","rhs_weap_akms","CUP_arifle_FNFAL","CUP_srifle_LeeEnfield"]
#define	INS_R_MAG		["rhs_30Rnd_545x39_AK","rhs_30Rnd_762x39mm","rhs_30Rnd_762x39mm","CUP_20Rnd_762x51_FNFAL_M","CUP_10x_303_M"]

kit_ins_random = [
	"kit_ins_fighter_r"
	,"kit_ins_fighter_gr"	
	,"kit_ins_light_marksman"
	,"kit_ins_light_r"
	
	,"kit_ins_fighter_r","kit_ins_fighter_gr","kit_ins_light_marksman","kit_ins_light_r"
	,"kit_ins_fighter_r","kit_ins_fighter_gr","kit_ins_light_marksman","kit_ins_light_r"
	,"kit_ins_fighter_r","kit_ins_fighter_gr","kit_ins_light_marksman","kit_ins_light_r"
	
	
	,"kit_ins_fighter_rat"
	,"kit_ins_fighter_mg"
	,"kit_ins_fighter_rpg"
	,"kit_ins_light_mg"
	,"kit_ins_light_rat"
	,"kit_ins_light_rpg"
];

kit_ins_fighter = [
	"kit_ins_fighter_r"
	,"kit_ins_fighter_gr"		
	,"kit_ins_fighter_rat"
	,"kit_ins_fighter_mg"
	,"kit_ins_fighter_rpg"
];
kti_ins_light = [
	"kit_ins_light_marksman"
	,"kit_ins_light_r"
	,"kit_ins_light_mg"
	,"kit_ins_light_rat"
	,"kit_ins_light_rpg"
];

kit_ins_fighter_gr = [
	["<EQUIPEMENT >>  ",INS_UNI_1,INS_VEST_1,"",INS_HEAD,""],
	["<PRIMARY WEAPON >>  ",["rhs_weap_ak74m_gp25","rhs_weap_akm_gp25"],["rhs_30Rnd_545x39_AK","rhs_30Rnd_762x39mm"],["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", INS_AITEMS],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",10],["ACE_packingBandage",2],["ACE_elasticBandage",2],["ACE_tourniquet",1],["ACE_Cellphone",1]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",8],["rhs_VOG25",6],["rhs_VOG25P",6],["rhs_mag_rgd5",2],["rhs_mag_rdg2_black",2]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_ins_fighter_r = [
	["<EQUIPEMENT >>  ",INS_UNI_1,INS_VEST_1,"",INS_HEAD,""],
	["<PRIMARY WEAPON >>  "
		,["rhs_weap_ak74m","rhs_weap_akm","rhs_weap_akms","CUP_arifle_FNFAL","CUP_srifle_LeeEnfield"]
		,["rhs_30Rnd_545x39_AK","rhs_30Rnd_762x39mm","rhs_30Rnd_762x39mm","CUP_20Rnd_762x51_FNFAL_M","CUP_10x_303_M"]
		,["","","",""]
	],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", INS_AITEMS],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",10],["ACE_packingBandage",2],["ACE_elasticBandage",2],["ACE_tourniquet",1],["ACE_Cellphone",1]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",8],["rhs_mag_rgd5",4],["rhs_mag_rdg2_black",2]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_ins_fighter_rat = [
	["<EQUIPEMENT >>  ",INS_UNI_1,INS_VEST_1,"",INS_HEAD,""],
	["<PRIMARY WEAPON >>  "
		,INS_R_WEP
		,INS_R_MAG
		,["","","",""]
	],
	["<LAUNCHER WEAPON >>  "
		,["rhs_weap_rpg26","rhs_weap_rshg2"]
		,["rhs_rpg26_mag","rhs_rshg2_mag"]
		,["","","",""]
	],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", INS_AITEMS],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",10],["ACE_packingBandage",2],["ACE_elasticBandage",2],["ACE_tourniquet",1],["ACE_Cellphone",1]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",8],["rhs_mag_rgd5",2],["rhs_mag_rdg2_black",2]]],
	["<BACKPACK ITEMS >> ",[]]
];
kit_ins_fighter_mg = [
	["<EQUIPEMENT >>  ",INS_UNI_1,INS_VEST_1,"CUP_B_AlicePack_Khaki",INS_HEAD,""],
	["<PRIMARY WEAPON >>  ", "rhs_weap_pkm", "rhs_100Rnd_762x54mmR",["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", INS_AITEMS],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",10],["ACE_packingBandage",2],["ACE_elasticBandage",2],["ACE_tourniquet",1],["ACE_Cellphone",1]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",1],["rhs_mag_rdg2_black",2],["rhs_mag_rgd5",1]]],
	["<BACKPACK ITEMS >> ",[["PRIMARY MAG",3]]]
];
kit_ins_fighter_rpg = [
	["<EQUIPEMENT >>  ",INS_UNI_1,INS_VEST_1,"CUP_B_AlicePack_Khaki",INS_HEAD,""],
	["<PRIMARY WEAPON >>  ",INS_R_WEP,INS_R_MAG,["","","",""]],
	["<LAUNCHER WEAPON >>  ","rhs_weap_rpg7","rhs_rpg7_PG7VL_mag",["","","",""]],	
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", INS_AITEMS],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",10],["ACE_packingBandage",2],["ACE_elasticBandage",2],["ACE_tourniquet",1],["ACE_Cellphone",1]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",4],["rhs_mag_rdg2_black",2],["rhs_mag_rgd5",1]]],
	["<BACKPACK ITEMS >> ",[["rhs_rpg7_OG7V_mag",2],["SECONDARY MAG",2]]]
];



kit_ins_light_marksman = [
	["<EQUIPEMENT >>  ",INS_UNI_2,INS_VEST_2,"",INS_HEAD,""],
	["<PRIMARY WEAPON >>  ","rhs_weap_svdp_wd","rhs_10Rnd_762x54mmR_7N1",["","","rhs_acc_pso1m2",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", INS_AITEMS],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",10],["ACE_packingBandage",2],["ACE_elasticBandage",2],["ACE_tourniquet",1],["ACE_Cellphone",1]]],
	["<VEST ITEMS >> ",[["rhs_mag_rdg2_black",2],["PRIMARY MAG",8],["rhs_mag_rgd5",2]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_ins_light_r = [
	["<EQUIPEMENT >>  ",INS_UNI_2,INS_VEST_2,"",INS_HEAD,""],
	["<PRIMARY WEAPON >>  ",INS_R_WEP,INS_R_MAG,["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", INS_AITEMS],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",10],["ACE_packingBandage",2],["ACE_elasticBandage",2],["ACE_tourniquet",1],["ACE_Cellphone",1]]],
	["<VEST ITEMS >> ",[["rhs_mag_rdg2_black",2],["PRIMARY MAG",8],["rhs_mag_rgd5",2]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_ins_light_rat = [
	["<EQUIPEMENT >>  ",INS_UNI_2,INS_VEST_2,"",INS_HEAD,""],
	["<PRIMARY WEAPON >>  ",INS_R_WEP,INS_R_MAG,["","","",""]],
	["<LAUNCHER WEAPON >>  "
		,["rhs_weap_rpg26","rhs_weap_rshg2"]
		,["rhs_rpg26_mag","rhs_rshg2_mag"]
		,["","","",""]
	],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", INS_AITEMS],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",10],["ACE_packingBandage",2],["ACE_elasticBandage",2],["ACE_tourniquet",1],["ACE_Cellphone",1]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",8],["rhs_mag_rgd5",2],["rhs_mag_rdg2_black",2]]],
	["<BACKPACK ITEMS >> ",[]]
];


kit_ins_light_mg = [
	["<EQUIPEMENT >>  ",INS_UNI_2,INS_VEST_2,"CUP_B_AlicePack_Khaki",INS_HEAD,""],
	["<PRIMARY WEAPON >>  ", "rhs_weap_pkm", "rhs_100Rnd_762x54mmR",["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", INS_AITEMS],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",10],["ACE_packingBandage",2],["ACE_elasticBandage",2],["ACE_tourniquet",1],["ACE_Cellphone",1]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",1],["rhs_mag_rdg2_black",2],["rhs_mag_rgd5",1]]],
	["<BACKPACK ITEMS >> ",[["PRIMARY MAG",3]]]
];
kit_ins_light_rpg = [
	["<EQUIPEMENT >>  ",INS_UNI_2,INS_VEST_2,"CUP_B_AlicePack_Khaki",INS_HEAD,""],
	["<PRIMARY WEAPON >>  ",INS_R_WEP,INS_R_MAG,["","","",""]],
	["<LAUNCHER WEAPON >>  ","rhs_weap_rpg7","rhs_rpg7_PG7VL_mag",["","","",""]],	
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", INS_AITEMS],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",10],["ACE_packingBandage",2],["ACE_elasticBandage",2],["ACE_tourniquet",1],["ACE_Cellphone",1]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",4],["rhs_mag_rdg2_black",2],["rhs_mag_rgd5",1]]],
	["<BACKPACK ITEMS >> ",[["rhs_rpg7_OG7V_mag",2],["SECONDARY MAG",2]]]
];



// 
//
//
// CIVILIANS
#define	CIV_UNI	["CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_01","CUP_O_TKI_Khet_Partug_06","CUP_U_C_Labcoat_03","CUP_U_C_Profiteer_03","CUP_U_C_Profiteer_01","CUP_U_C_Profiteer_04","LOP_U_TAK_Civ_Fatigue_04","LOP_U_TAK_Civ_Fatigue_01","LOP_U_TAK_Civ_Fatigue_02"]
#define	CIV_HEAD	["H_Cap_red","H_Cap_blu","CUP_H_TKI_Lungee_Open_05","CUP_H_TKI_Pakol_1_03","CUP_H_TKI_Pakol_1_06","CUP_H_TKI_Pakol_2_02","CUP_H_TKI_Pakol_2_03","CUP_H_TKI_SkullCap_04","CUP_H_TKI_SkullCap_06","CUP_H_TKI_SkullCap_03"]

kit_civ_takistan =
	[
	["<EQUIPEMENT >>  ",CIV_UNI,"","",CIV_HEAD,""],
	["<PRIMARY WEAPON >>  ","","",["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ",["ItemWatch",""]],
	["<UNIFORM ITEMS >> ",[]],
	["<VEST ITEMS >> ",[]],
	["<BACKPACK ITEMS >> ",[]]
];
