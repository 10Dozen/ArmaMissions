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

// Tasks
[] spawn {
	[west,["task_find"],["Find enemy outposts somewhere in region (check roads and hills).","Find outpost",""],objNull,1,8,true,"",true] call BIS_fnc_taskCreate;
	[west,["task_find"],["Capture outposts and hold against enemy reinforcements.","Seize outposts",""],objNull,1,8,true,"",true] call BIS_fnc_taskCreate;
	[west,["task_find"],["Retreat to position of allied forces if there will be no opportunity to complete the mission.","(Optional) Retreat",""],objNull,1,8,true,"",true] call BIS_fnc_taskCreate;
};
