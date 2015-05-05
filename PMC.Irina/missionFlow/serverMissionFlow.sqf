#define DEBUG	true
//#define DEBUG false

#include "defines.sqf"


//	**********************************************
//	Select random main objectives
//	**********************************************
[] spawn {	
	pmc_accountCash = 4000;
	publicVariable "pmc_accountCash";
	
	dzn_pmc_modifyCash = {
		pmc_accountCash = pmc_accountCash + _this;
		publicVariable "pmc_accountCash";
	};	
	publicVariable "dzn_pmc_modifyCash";
	
	[
		pmc_box, 
		[ 
			"U_C_Poloshirt_stripped","U_C_Poloshirt_blue",
			"U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite",
			"U_C_Poloshirt_salmon","U_C_Poloshirt_tricolour",
			"U_BG_Guerilla2_2","U_BG_Guerilla2_1",
			"U_BG_Guerilla3_1","U_OrestesBody",
			"U_Marshal","U_Rangemaster",
			"U_C_Poor_1","U_I_G_resistanceLeader_F",
			"U_Competitor",
			
			"H_Bandanna_gry","H_Bandanna_blu","H_Bandanna_cbr",
			"H_Bandanna_khk","H_Bandanna_surfer","H_Cap_surfer",
			"H_Bandanna_surfer_blk","H_Bandanna_surfer_blk","H_Bandanna_surfer_grn",
			
			"G_Bandanna_oli","G_Bandanna_khk",
			
			"ItemWatch"
		], 
		true
	] call BIS_fnc_addVirtualItemCargo;
	
	resistance setFriend [west, 0.65];
};


//	**********************************************
//	Spawn of vehicles, gear, service points at bases
//	**********************************************

#include "serverSetupBases.sqf";
