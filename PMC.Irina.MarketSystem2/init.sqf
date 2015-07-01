enableSaving [false, false];

// Add to init.sqf
// 0: true or false - Edit mode activation,
// 1: NUMBER - script call delay (where 0 - is mission start). If not passed - runs without delay (before mission start);
[false] execVM "dzn_gear\dzn_gear_init.sqf";

[12000, 0.3] execVM "dzn_market\dzn_market_init.sqf";




dzn_arsenalItems = [ 
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
];

[
	box, 
	dzn_arsenalItems, 
	true,
	true
] call BIS_fnc_addVirtualItemCargo;
