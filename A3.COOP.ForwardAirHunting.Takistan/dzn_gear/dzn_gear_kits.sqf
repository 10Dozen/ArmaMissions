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
	[["rhs_200rnd_556x45_M_SAW",2],["B_IR_Grenade",5],["Chemlight_green",5],["Chemlight_red",5],["SmokeShell",5],["HandGrenade",5],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",5],["Laserbatteries",2],["rhs_mag_30Rnd_556x45_Mk318_Stanag",5]],
	[["FirstAidKit",4]],
	[]
];


// **************
// PILOT
// **************
kit_pilot =
	[
	["<EQUIPEMENT >>  ","CUP_U_B_USMC_PilotOverall","CUP_V_B_PilotVest","","CUP_H_USMC_Helmet_Pilot",""],
	["<PRIMARY WEAPON >>  ","","",["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","CUP_hgun_M9","CUP_15Rnd_9x19_M9",["","","",""]],
	["<ASSIGNED ITEMS >>  ","ItemMap","tf_rf7800str_1","ItemGPS","rhsusf_ANPVS_15"],
	["<UNIFORM ITEMS >> ",[["ACE_fieldDressing",10],["ACE_packingBandage",5],["ACE_tourniquet",2],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_quikclot",5]]],
	["<VEST ITEMS >> ",[["HANDGUN MAG",3],["Chemlight_green",4],["Chemlight_red",2],["B_IR_Grenade",2]]],
	["<BACKPACK ITEMS >> ",[]]
];



// **************
// INSURGENTS
// **************