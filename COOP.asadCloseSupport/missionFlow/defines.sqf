// *******************
// Bases
// *******************

dzn_base_fobs = 			[FOB_0];
dzn_base_outposts = 		[];

// *******************
// Bases - spot items classnames and scripts
// *******************

dzn_base_RECON_CAR =		"rhs_uaz_vmf";
dzn_base_TRUCK_CARGO = 		"RHS_Ural_VMF_01";
dzn_base_ARMED_CAR =		"O_MRAP_02_gmg_F";
dzn_base_IFV =				"rhs_btr80_vdv";
dzn_base_APC =				"rhs_bmp2_tv";
dzn_base_TANK =				"rhs_t72bb_tv";

dzn_base_CARGO_HELI =		"O_Heli_Light_02_unarmed_F";

dzn_base_TRUCK_REPAIR =		"O_Truck_02_box_F";
dzn_base_TRUCK_FUEL =		"O_Truck_02_fuel_F";
dzn_base_TRUCK_AMMO =		"O_Truck_02_Ammo_F";

dzn_base_BOX_AMMO =			"O_CargoNet_01_ammo_F";
dzn_base_BOX_MEDIC =		"Box_FIA_Ammo_F";

dzn_base_SERVICE_GROUND	=	{ /*["SERVICE_GROUND", _this] spawn dzn_servicePoint_create;*/ };


// *******************
// Kits assignement for class
// *******************
#define VEHICLES_EMPTY_KIT		["TRUCK_REPAIR", "TRUCK_FUEL", "TRUCK_AMMO","TANK"]
#define VEHICLES_COMBAT_KIT		["RECON_CAR","TRUCK_CARGO","ARMED_CAR","IFV","APC","CAS_HELI","CARGO_HELI"]
#define VEHICLES_AMMOBOX_KIT	["BOX_AMMO"]
#define VEHICLES_MEDICBOX_KIT	["BOX_MEDIC"]



// *******************
// Locations
// *******************
dzn_locs_blacklist =			["Feruz Abad","Bastam","Jilavur","Rasman","Garmsar","Loy Manara","Falar"];



// *******************
// Decorations
// *******************
dzn_base_guardmanClass =		"O_Soldier_F";
dzn_base_guardmanKit 	=		"";
