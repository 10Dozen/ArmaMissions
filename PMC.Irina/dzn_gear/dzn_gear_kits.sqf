// Gear Kits

#define	UNIFORM_CIV_LOCAL	["U_C_Poloshirt_stripped","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_tricolour"]
#define UNIFORM_CIV			["U_BG_Guerilla2_2","U_BG_Guerilla2_1","U_BG_Guerilla3_1","U_OrestesBody","U_Marshal","U_Rangemaster","U_C_Poor_1","U_I_G_resistanceLeader_F","U_Competitor"]


pmcDefaultKit = [[UNIFORM_CIV_LOCAL + UNIFORM_CIV,"","","",""],["","","",""],["","","",""],["","","",""],["ItemMap","ItemCompass","ItemWatch","ItemRadio"],[["",0],["",0],["",0],["",0],["",0],["",0],["",0],["",0],["",0]],[["",0],["",0],["",0],["",0],["",0],["",0]],[]];


hvtKit = [["U_Marshal","","","H_StrawHat_dark","G_Spectacles_Tinted"],["","","",""],["","","",""],["hgun_Pistol_heavy_02_F","","",""],["ItemWatch","ItemRadio"],[["",0],["",0],["6Rnd_45ACP_Cylinder",5],["",0],["",0],["",0],["",0],["",0],["",0]],[["",0],["",0],["",0],["",0],["",0],["",0]],[]];


#define PRIMARY_OPTICS	["optic_Aco","optic_MRCO"]
csInfantryKit1 = [["U_I_G_Story_Protagonist_F","V_TacVest_oli","","","G_Balaclava_blk"],["arifle_TRG20_F",["optic_Aco","optic_MRCO"],"",""],["","","",""],["","","",""],["","","ItemWatch","ItemRadio"],[["30Rnd_556x45_Stanag",10],["",0],["",0],["HandGrenade",2],["SmokeShell",1],["",0],["",0],["",0],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];
csInfantryKit2 = [["U_I_G_Story_Protagonist_F","V_TacVest_oli","","","G_Balaclava_blk"],["arifle_Katiba_F",["optic_Aco","optic_MRCO"],"",""],["","","",""],["","","",""],["","","ItemWatch","ItemRadio"],[["30Rnd_65x39_caseless_green",10],["",0],["",0],["HandGrenade",2],["SmokeShell",1],["",0],["",0],["",0],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];
csInfantryKit3 = [["U_I_G_Story_Protagonist_F","V_TacVest_oli","","","G_Balaclava_blk"],["SMG_02_F","optic_Aco","",""],["","","",""],["","","",""],["","","ItemWatch","ItemRadio"],[["30Rnd_9x21_Mag",10],["",0],["",0],["HandGrenade",2],["SmokeShell",1],["",0],["",0],["",0],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];

#define HVT_UNI		["U_C_Journalist","V_TacVest_khk","",["H_Cap_oli","H_Cap_blk","H_Cap_tan"],["G_Bandanna_sport","G_Bandanna_beast","G_Bandanna_khk"]]
hvtInfantyKit1 = [ HVT_UNI ,["SMG_02_F",["optic_Holosight","optic_Aco",""],"",""],["","","",""],["","","",""],["","","ItemWatch","ItemRadio"],[["30Rnd_9x21_Mag",10],["",0],["",0],["HandGrenade",2],["",0],["",0],["",0],["",0],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];
hvtInfantyKit2 = [ HVT_UNI ,["hgun_PDW2000_F","optic_Aco","",""],["","","",""],["","","",""],["ItemMap","ItemCompass","ItemWatch","ItemRadio"],[["30Rnd_9x21_Mag",9],["",0],["",0],["HandGrenade",2],["",0],["",0],["",0],["",0],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];
hvtInfantyKit3 = [ HVT_UNI ,["arifle_MXC_F","optic_Aco","",""],["","","",""],["","","",""],["ItemMap","ItemCompass","ItemWatch","ItemRadio"],[["30Rnd_65x39_caseless_mag",7],["",0],["",0],["HandGrenade",2],["",0],["",0],["",0],["",0],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];

#define BJ_UNI		[["U_I_G_resistanceLeader_F","U_I_G_Story_Protagonist_F"],"V_PlateCarrierIA1_dgtl","",["H_MilCap_gry","H_Cap_oli","H_Cap_blk","H_Cap_tan"],["G_Shades_Red", "", "G_Bandanna_sport","G_Bandanna_beast","G_Bandanna_khk"]]
bjInfantryKit1 = [BJ_UNI ,[["arifle_TRG20_F","arifle_TRG21_F"],PRIMARY_OPTICS,"",""],["","","",""],["","","",""],["","","ItemWatch","ItemRadio"],[["30Rnd_556x45_Stanag",9],["",0],["",0],["HandGrenade",2],["SmokeShell",2],["",0],["",0],["",0],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];
bjInfantryKit2 = [BJ_UNI, ["arifle_MX_SW_F",PRIMARY_OPTICS,"",""],["","","",""],["","","",""],["","","ItemWatch","ItemRadio"],[["100Rnd_65x39_caseless_mag_Tracer",6],["",0],["",0],["HandGrenade",2],["SmokeShell",2],["",0],["",0],["",0],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];

hvtInfantyKit = [
	"hvtInfantyKit1"
	,"hvtInfantyKit2"
	,"hvtInfantyKit3"
];

csInfantryKit = [
	"csInfantryKit1"
	,"csInfantryKit2"
	,"csInfantryKit3"
];

bjInfantryKit = [
	"bjInfantryKit1"
	,"bjInfantryKit2"
];


emptyBox = [[],[],[],[]];



// ****************
// END OF KITS
// ****************
dzn_gear_kitsInitialized = true;
