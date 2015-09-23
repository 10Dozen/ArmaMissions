[] spawn {
	waitUntil {
		!isNil "par_daytime" 
		&& !isNil "par_month" 
		&& !isNil "par_year" 
		&& !isNil "par_fog" 
		&& !isNil "par_weather"
	};
	
	[par_daytime, par_month, par_year] call dzn_fnc_setDateTime;
	par_fog call dzn_fnc_setFog;
	par_weather call dzn_fnc_setWeather;
};
