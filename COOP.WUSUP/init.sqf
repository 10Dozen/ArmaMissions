enableSaving [false, false];
enableSentences false;

// Get mission parameters
call dzn_fnc_getMissionParametes;

// Set Date, Daytime and Weather
par_weather call dzn_fnc_setWeather;
par_fog call dzn_fnc_setFog;
[par_daytime, par_month, par_year] call dzn_fnc_setDateTime;

// Initializing functions

// dzn_gear and dzn_dynai modules
[false] execVM "dzn_gear\dzn_gear_init.sqf";
[] execVM "dzn_dynai\dzn_dynai_init.sqf";
