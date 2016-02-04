// AIR TAXI!!
if (isDedicated || !hasInterface) exitWith {};

//	************** DZN_AirTaxiCall PARAMETERS ******************

// Condition of initialization
#define	dzn_atc_CONDITION_BEFORE_INIT	true


dzn_atc_onlyLeader 		= 		true;	// Allow AirTaxi for leaders only

dzn_atc_exitPoint			= 		[ 6688, 14431, 46];	// Pos3d of vehicle exit point (where to vehicles will fly from player). It can be an object - use (getPosASL OBJECT) instead

dzn_atc_useCustomPlacement	=		true; 	// Allow players to choose spawn point of vehicle directly on the map
dzn_atc_customPlacementMinDist =		700; 		// Minimum distance from player position to nearest position for custom placement
dzn_atc_customRestrictedLocs	=		[]; 		// List of locations restricted to spawn vehicles
dzn_atc_placementPoint		=		[6688,14431,46];	// Pos3d of vehicle spawn point, if custom placement isn't chosen
dzn_atc_placementPointMarker 	=		true;		// Place marker of Initial Point for ATC

dzn_atc_vehiclesList		= [
							"B_Heli_Light_01_F"
							,"RHS_UH60M_d"							
							,"LOP_TKA_Mi8MT_Cargo"
];

dzn_atc_pilotsPerSide 		= [
							"rhsusf_army_ocp_helipilot"	// West
							,"O_helipilot_F"	// East
							,"I_helipilot_F"	// Indep
							,"C_man_pilot_F"	// Civilian
];

// Custom pilot gear code to execute: _this = unit 
dzn_atc_useCustomerPilotGear		=	false;
dzn_atc_customPilotsGear 		= 	{};

//	************** END OF DZN_AirTaxiCall PARAMETERS ******************
//
//
//
//
//
//
//	**************	INITIALIZATION 	*************************
//	
waitUntil { dzn_atc_CONDITION_BEFORE_INIT };

// Initialization of dzn_atc
call compile preProcessFileLineNumbers "Logic\dzn_atc\dzn_atc_functions.sqf";
call compile preProcessFileLineNumbers "Logic\dzn_atc\dzn_atc_menus.sqf";

// ************** Start of DZN_ATC ********************

if (dzn_atc_onlyLeader) then {
	if (player == leader (group player)) then {
		["dzn_radioServices_atc_action", "Evac Service", { showCommandingMenu "#USER:dzn_atc_menu";}, {true}] call dzn_fnc_addRadioService;
	};
} else {
	["dzn_radioServices_atc_action", "Evac Service", { showCommandingMenu "#USER:dzn_atc_menu";}, {true}] call dzn_fnc_addRadioService;
};

if (!dzn_atc_useCustomPlacement && dzn_atc_placementPointMarker) then {call dzn_atc_fnc_showIPMarker;};

["dzn_atc_checkMenu", "onEachFrame", {		
	if !isNil {player getVariable "dzn_atc_called"} then {
		(player getVariable "dzn_atc_called") call dzn_atc_fnc_callAirTaxi;
		player setVariable ["dzn_atc_called", nil];	
	};
	
	if (vehicle player != player && (vehicle player) getVariable ["dzn_atc_clearOut", false]) then {
		player allowDamage false;
		moveOut player;
		[] spawn { sleep 2; player allowDamage true; };
	};
}] call BIS_fnc_addStackedEventHandler;