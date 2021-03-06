if !(isServer || isDedicated) exitWith {};

dzn_civen_initialized = false;

//  **************** SETTINGS ********************
// Seconds too return from DANGER to SAFE behavior
dzn_civen_cooldownTimer			= 	30;

// Parked vehicles global settings (values will be randomized from 0 to given max value, if ther is no vehoicleType specific)
dzn_civen_parked_gFuelMax 		= 	0.7;
dzn_civen_parked_gLockedChance		=	0.5;
dzn_civen_parked_gDamage		=	0.3;	// 0 - no damage

// To override vehcile type settings - set this ones to TRUE
dzn_civen_parked_gFuelMaxForced		=	false;
dzn_civen_parked_gLockedChanceForced	=	false;
dzn_civen_parked_gDamageForced		=	false;

// Traffic
dzn_civen_allowTraffic			=	true;
dzn_civen_trafficPerLocation		=	1;
dzn_civen_trafficVehicleType		=	["TakistanVehicles"];	// Array of vehicle types (will be randomly chosed)


//  **************** INITIALIZATION ********************
call compile preProcessFileLineNumbers "dzn_civen\Configs.sqf";
call compile preProcessFileLineNumbers "dzn_civen\fn\dzn_civen_functions.sqf";
call compile preProcessFileLineNumbers "dzn_civen\fn\dzn_civen_behaviorFunctions.sqf";
call compile preProcessFileLineNumbers "dzn_civen\fn\dzn_civen_trafficFunctions.sqf";

// ***************** START ****************************
[] spawn {
	waitUntil { time > 5 };
	[] call dzn_fnc_civen_initialize;
};
