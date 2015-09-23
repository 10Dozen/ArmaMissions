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


// ***********************************
// Player
// 2x Squad ( 1xSL, 1xM, 2xTL, 2xAR, 2xG, 2xRAT ) 1x Weapon Squad ( 1xSL, 1xAG, 1xAAGM )
// ***********************************
// NATO (Vanilla)
kit_natoa3_sl = [];
kit_natoa3_m = [];
kit_natoa3_tl = [];
kit_natoa3_ar = [];
kit_natoa3_g = [];
kit_natoa3_rat = [];
kit_natoa3_ag = [];
kit_natoa3_aag = [];

// AFRF (RHS)
kit_rfrhs_sl = [];
kit_rfrhs_m = [];
kit_rfrhs_tl = [];
kit_rfrhs_ar = [];
kit_rfrhs_g = [];
kit_rfrhs_rat = [];
kit_rfrhs_ag = [];
kit_rfrhs_aag = [];

// USArmy (RHS)
kit_usrhs_sl = [];
kit_usrhs_m = [];
kit_usrhs_tl = [];
kit_usrhs_ar = [];
kit_usrhs_g = [];
kit_usrhs_rat = [];
kit_usrhs_ag = [];
kit_usrhs_aag = [];


// ***********************************
// Hostiles ::  kit _ h(ostile) _ faction mode _ role = kit_[h]_[csat][a3]_[sl]
// Outpost: 1x Squad (1xSL, 2xTL, 2xAR, 2xG, 2xR) per Outpost 1x HMG or GMG MRAP per Outpost 1x Static gun per Outpost
// Reinforcement: 2x Squad 1x Armed MRAP/APC 1x MRAP
// ***********************************
// NATO (Vanilla)
kit_h_csata3_sl = [];
kit_h_csata3_tl = [];
kit_h_csata3_ar = [];
kit_h_csata3_g = [];
kit_h_csata3_r = [];
kit_h_csata3_crew = [];

// AFRF (RHS)
kit_h_rfrhs_sl = [];
kit_h_rfrhs_tl = [];
kit_h_rfrhs_ar = [];
kit_h_rfrhs_g = [];
kit_h_rfrhs_r = [];
kit_h_rfrhs_crew = [];

// USArmy (RHS)
kit_h_usrhs_sl = [];
kit_h_usrhs_tl = [];
kit_h_usrhs_ar = [];
kit_h_usrhs_g = [];
kit_h_usrhs_r = [];
kit_h_usrhs_crew = [];
