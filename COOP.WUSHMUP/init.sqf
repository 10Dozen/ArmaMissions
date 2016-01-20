enableSaving [false, false];
enableSentences false;

#include "dzn_defines.sqf";
#include "dzn_commonFunctions.sqf";
#include "dzn_displayFunctions.sqf";

// Get mission parameters
call dzn_fnc_getMissionParametes;

// Set Date, Daytime and Weather
par_weather call dzn_fnc_setWeather;
par_fog call dzn_fnc_setFog;
[par_daytime, par_month, par_year] call dzn_fnc_setDateTime;

// Initializing functions
[] execVM "taskController\tcInit.sqf";
[] execVM "roleAssignment\raInit.sqf";

// dzn_gear and dzn_dynai modules
[false] execVM "dzn_gear\dzn_gear_init.sqf";
[] execVM "dzn_dynai\dzn_dynai_init.sqf";
