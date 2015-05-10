enableSaving [false, false];
enableSentences false;

#include "dzn_defines.sqf";
#include "dzn_commonFunctions.sqf";

call dzn_fnc_getMissionParametes;
par_weather call dzn_fnc_setWeather;
par_fog call dzn_fnc_setFog;
[par_daytime, par_month, par_year] call dzn_setDateTime;

[] execVM "taskController\tcInit.sqf";



// ********************* F3 ***********************************************************
// [30] spawn f_fnc_cInit;

// Note: Caching aggressiveness is set using the f_var_cachingAggressiveness variable; possible values:
// 1 - cache only non-leaders and non-drivers
// 2 - cache all non-moving units, always exclude vehicle drivers
// 3 - cache all units, incl. group leaders and vehicle drivers
// f_var_cachingAggressiveness = 2;
