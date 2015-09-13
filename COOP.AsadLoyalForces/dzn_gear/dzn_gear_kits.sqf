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
// ASSAD LOYAL FORSEC
// **************

#define ALF_UNIFORM	["LOP_U_AFR_Fatigue_04","LOP_U_AFR_Fatigue_04_slv"]
#define ALF_HEADGEAR	["rhs_6b27m_green","rhs_6b27m_green_ess","rhs_6b28_green"]
#define ALF_EQUIP		ALF_UNIFORM,"rhs_6b23_ML_6sh92","CUP_B_AlicePack_Khaki",ALF_HEADGEAR,""
#define ALF_AITEM		"ItemMap","ItemRadio","ItemCompass","ItemRadio","ItemWatch"
kit_alf_sl =
	[
	["<EQUIPEMENT >>  ", ALF_EQUIP],
	["<PRIMARY WEAPON >>  ","rhs_weap_akm","rhs_30Rnd_762x39mm",["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ALF_AITEM,"Binocular"],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",10],["ACE_packingBandage",5],["ACE_tourniquet",2],["ACE_elasticBandage",5],["ACE_morphine",1],["ACE_epinephrine",1],["rhs_mag_nspd",2]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",6],["CUP_HandGrenade_RGD5",2]]],
	["<BACKPACK ITEMS >> ",[["ACE_MapTools",1],["ACE_Clacker",1],["ACE_EarPlugs",1],["PRIMARY MAG",4]]]
];

kit_alf_tl =
	[
	["<EQUIPEMENT >>  ", ALF_EQUIP],
	["<PRIMARY WEAPON >>  ","rhs_weap_akms_gp25","rhs_30Rnd_762x39mm",["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ALF_AITEM],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",10],["ACE_packingBandage",5],["ACE_tourniquet",2],["ACE_elasticBandage",5],["ACE_morphine",1],["ACE_epinephrine",1],["rhs_mag_nspd",2]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",6],["rhs_VOG25P",6]]],
	["<BACKPACK ITEMS >> ",[["rhs_VOG25P",9],["ACE_EarPlugs",1],["PRIMARY MAG",4]]]
];

kit_alf_mg =
	[
	["<EQUIPEMENT >>  ", ALF_EQUIP],
	["<PRIMARY WEAPON >>  ","CUP_lmg_PKM","CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ALF_AITEM],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",10],["ACE_packingBandage",5],["ACE_tourniquet",2],["ACE_elasticBandage",5],["ACE_morphine",1],["ACE_epinephrine",1],["rhs_mag_nspd",2]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",1],["CUP_HandGrenade_RGD5",2],["SmokeShell",2]]],
	["<BACKPACK ITEMS >> ",[["PRIMARY MAG",3],["ACE_EarPlugs",1]]]
];

kit_alf_gr =
	[
	["<EQUIPEMENT >>  ", ALF_EQUIP],
	["<PRIMARY WEAPON >>  ","rhs_weap_ak74m_gp25","rhs_30Rnd_545x39_AK",["rhs_acc_dtk","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ALF_AITEM],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",10],["ACE_packingBandage",5],["ACE_tourniquet",2],["ACE_elasticBandage",5],["ACE_morphine",1],["ACE_epinephrine",1],["rhs_mag_nspd",2]]],
	["<VEST ITEMS >> ",[["CUP_1Rnd_HE_GP25_M",1],["PRIMARY MAG",4],["rhs_VOG25P",8]]],
	["<BACKPACK ITEMS >> ",[["PRIMARY MAG",5],["SmokeShell",2],["CUP_HandGrenade_RGD5",2],["ACE_EarPlugs",1]]]
];

kit_alf_rat =
	[
	["<EQUIPEMENT >>  ",ALF_UNIFORM,"rhs_6b23_ML_6sh92","rhs_rpg_empty",ALF_HEADGEAR,""],
	["<PRIMARY WEAPON >>  ","rhs_weap_ak74m_plummag","rhs_30Rnd_545x39_AK",["rhs_acc_dtk","","",""]],
	["<LAUNCHER WEAPON >>  ","rhs_weap_rpg7","rhs_rpg7_OG7V_mag",["","","rhs_acc_pgo7v",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ALF_AITEM],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",10],["ACE_packingBandage",5],["ACE_tourniquet",2],["ACE_elasticBandage",5],["ACE_morphine",1],["ACE_epinephrine",1],["rhs_mag_nspd",2]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",8],["rhs_mag_nspd",1]]],
	["<BACKPACK ITEMS >> ",[["SECONDARY MAG",4],["ACE_EarPlugs",1]]]
];

//"rhs_tsh4"`
kit_alf_crew =
	[
	["<EQUIPEMENT >>  ","LOP_U_AFR_Fatigue_04_slv","LOP_V_Carrier_TAN","","rhs_tsh4",""],
	["<PRIMARY WEAPON >>  ","CUP_arifle_AKS74U","CUP_30Rnd_545x39_AK_M",["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ALF_AITEM],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",10],["ACE_packingBandage",5],["ACE_tourniquet",2],["ACE_elasticBandage",5],["ACE_morphine",1],["ACE_epinephrine",1],["rhs_mag_nspd",2]]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",3],["rhs_mag_rdg2_white",1]]],
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

insurgentRandomKit =
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


// **************
// VEHICLES
// **************


vehicleCombatKit = [
	[["rhs_weap_ak74m_folded",2],["rhs_weap_rpg26",2]],
	[["MiniGrenade",10],["rhs_mag_rdg2_white",10],["rhs_VOG25",10],["rhs_VG40OP_white",5],["rhs_30Rnd_762x39mm",20],["Chemlight_red",2],["rhs_rpg7_OG7V_mag",5],["SatchelCharge_Remote_Mag",1],["rhs_rpg26_mag",5],["rhs_mag_nspd",5],["rhs_VOG25P",10],["rhs_30Rnd_545x39_AK",15],["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",4]],
	[["FirstAidKit",10],["Medikit",3],["ToolKit",3],["ACE_Clacker",1],["ACE_morphine",5],["ACE_epinephrine",5],["ACE_EarPlugs",5]],
	[]
];