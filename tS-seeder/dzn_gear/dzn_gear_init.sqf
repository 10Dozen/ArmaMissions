// **************************
// 	DZN GEAR
//
//	Initialized when:
//	{ !isNil "dzn_gear_initDone" }
//
//	Server-side initialized when:
//	{ !isNil "dzn_gear_serverInitDone" }
//
// *************************
//	SETTINGS
// **************************

// Plugins
dzn_gear_enableGearAssignementTable		= false;
dzn_gear_enableGearNotes			= false;

// **************************
// FUNCTIONS
// **************************
dzn_gear_defaultBackpack = "B_Carryall_khk";
dzn_gear_editModeEnabled = _this select 0;

#include "fn\dzn_gear_functions.sqf"

// **************************
// EDIT MODE
// **************************
if (dzn_gear_editModeEnabled) then {call compile preProcessFileLineNumbers "dzn_gear\fn\dzn_gear_editMode.sqf";};

// **************************
// GEARS
// **************************
#include "Kits.sqf"

// **************************
// INITIALIZATION
// **************************
// Delay before run
if (!isNil { _this select 1 } && { typename (_this select 1) == "SCALAR" }) then { 
	waitUntil { time > _this select 1 };
};

if (dzn_gear_enableGearAssignementTable) then { call compile preProcessFileLineNumbers "dzn_gear\plugins\AssignementTable.sqf"; };
if (dzn_gear_enableGearNotes) then { call compile preProcessFileLineNumbers "dzn_gear\plugins\GearNotes.sqf"; };

[] spawn dzn_fnc_gear_initialize;
