call dzn_fnc_getMissionParametes;
[par_daytime, par_month, par_year] call dzn_fnc_setDateTime;
par_fog call dzn_fnc_setFog;
par_weather call dzn_fnc_setWeather;




// CAS and RRR
[] spawn {	
	private["_veh","_spawnVehicle"];	
	
	cas_classNames = [
		"RHS_A10"
		,"B_Plane_CAS_01_F"
		,"RHS_Su25SM_KH29_vvsc" 
		,"O_Plane_CAS_02_F"
		,"RHS_AH64D_GS"
		,"RHS_AH64D_CS"
		,"RHS_AH1Z_GS"
		,"RHS_AH1Z_CS"
		,"B_Heli_Attack_01_F"
		,"RHS_Mi24V_AT_vvsc"
		,"RHS_Mi24P_AT_vvsc"		
		,"RHS_Ka52_vvsc"
		,"O_Heli_Attack_02_black_F"		
		,"RHS_UH1Y_FFAR_d"	
	];
		
	cas_className = if (par_casclass > 0) then {
		cas_classNames select (par_casclass - 1)
	} else {
		cas_classNames call BIS_fnc_selectRandom	
	};
	publicVariable "cas_className";	

	_spawnVehicle = {
		// [@Class,@Obj] call _spawnVehicle
		private["_v"];
		_v = (_this select 0) createVehicle (getPos (_this select 1));
		_v setDir (getDir (_this select 1));		
		_v
	};
	
	{
		switch (true) do {
			case (["cas_lot",str(_x), false] call BIS_fnc_inString): {		
				_veh = [cas_className,_x] call _spawnVehicle;
				_veh setVariable ["cas_rrr_magazines", magazines _veh, true];				
			};
			case (["cas_rrr",str(_x), false] call BIS_fnc_inString): {				
				{
					switch (true) do {
						case (["cas_rrr_comp_chemlight",str(_x), false] call BIS_fnc_inString): {
							"Chemlight_blue" createVehicle (_x modelToWorld [0, 8, 0]);
							"Chemlight_blue" createVehicle (_x modelToWorld [8, 8, 0]);
							"Chemlight_blue" createVehicle (_x modelToWorld [8, 0, 0]);
							"Chemlight_blue" createVehicle (_x modelToWorld [0, 0, 0]);
						};
						case (["cas_rrr_comp_fuel",str(_x), false] call BIS_fnc_inString): {
							["B_Truck_01_fuel_F", _x] call _spawnVehicle;
						};						
						case (["cas_rrr_comp_ammo",str(_x), false] call BIS_fnc_inString): {
							["B_Truck_01_ammo_F", _x] call _spawnVehicle;
						};						
						case (["cas_rrr_comp_repair",str(_x), false] call BIS_fnc_inString): {
							["B_Truck_01_Repair_F", _x] call _spawnVehicle;
						};						
					};
				} forEach 	(synchronizedObjects _x);				
			};
		};
	} forEach (synchronizedObjects cas_placement);		
};


// Trucks
[] spawn {	
	private["_truckLotsList","_vPosSelection","_v"];
	truck_classname = "rhs_ural_chdkz";
	truck_list = [];
	_truckLotsList =  (synchronizedObjects misFlow_truckLots);
	for "_i" from 0 to 3 do {
		_vPosSelection = _truckLotsList call BIS_fnc_selectRandom;
		_truckLotsList = _truckLotsList - [_vPosSelection];
		_v = truck_classname createVehicle (getPos _vPosSelection);
		_v setDir (getDir _vPosSelection);
		truck_list pushBack _v;
	};
	
	[west,["task_destroyTrucks"],["Destroy 2-4 enemy ammo trucks in the valley","Destroy trucks",""],objNull,1,8,true,"",true] call BIS_fnc_taskCreate;
	waitUntil { sleep 20; {alive _x} count truck_list < 2 };
	task_trucksDestoyed = true;
	publicVariable "task_trucksDestoyed";
};

// AAA
[] spawn {
	waitUntil {!isNil "dzn_gear_initialized" && { dzn_gear_initialized }};
	
	private["_aaaLotsList","_vPosSelection","_v","_g","_u"];
	aaa_classname = ["LOP_UA_NSV_TriPod","LOP_ChDKZ_ZSU234"];
	aaa_list = [];
	_aaaLotsList =  (synchronizedObjects misFlow_aaaLots);
	
	for "_i" from 0 to 3 do {
		_vPosSelection = _aaaLotsList call BIS_fnc_selectRandom;
		_aaaLotsList = _aaaLotsList - [_vPosSelection];
		_v = if (_i == 0) then { 
			(aaa_classname select 1) createVehicle (getPos _vPosSelection)
		} else {
			(aaa_classname select 0) createVehicle (getPos _vPosSelection)
		};
		_v setDir (getDir _vPosSelection);
		_g = createGroup east;
		
		_u = _g createUnit ["O_Soldier_F", (getPos _vPosSelection), [], 0, "NONE"];
		[_u, "kit_ins_common"] call dzn_fnc_gear_assignKit;
		_u assignAsGunner _v;
		_u moveInGunner _v;
		
		aaa_list pushBack _v;
	};
	
	[west,["task_destroyAAA"],["Find and destroy AAA in the valley","Destroy AAA",""],objNull,1,8,true,"",true] call BIS_fnc_taskCreate;
	
	waitUntil { sleep 20; {alive _x} count aaa_list < 2  };
	task_aaaDestoyed = true;
	publicVariable "task_aaaDestoyed";
};

[] spawn {
	waitUntil { time > 30 };
	if !((synchronizedObjects hitmanSquad) isEqualTo []) then { 
		hitman =  group ((synchronizedObjects hitmanSquad) select 0);
	
		[] spawn { 
			while { true } do {
				sleep 30;
				"respawn_west" setMarkerPos (getPos (leader hitman));
			};
		};
		
		retreatLoc = [retreatPoint,true] call dzn_fnc_convertTriggerToLocation;
		
		waitUntil { {alive _x && [getPos _x, [retreatLoc]] call dzn_fnc_isInLocation} count (units hitman) > (count (units hitman)) / 2 };
		missionEndScore = 0;
		if (!isNil "task_trucksDestoyed") then { missionEndScore = missionEndScore + 1; };
		if (!isNil "task_aaaDestoyed") then { missionEndScore = missionEndScore + 1; };
		
		missionEnd = [];		
		switch (missionEndScore) do {
			case 0: {
				// END
				["task_retreat","Succeeded",true] call BIS_fnc_taskSetState;
				["task_trucksDestoyed","Canceled",true] call BIS_fnc_taskSetState;
				["task_aaaDestoyed","Canceled",true] call BIS_fnc_taskSetState;
				missionEnd = ["RetreatEnd", false];
			};
			case 1: {
				// WIN 1 or 2
				["task_retreat","Succeeded",true] call BIS_fnc_taskSetState;
				if (!isNil "task_trucksDestoyed") then { 
					["task_trucksDestoyed","Succeeded",true] call BIS_fnc_taskSetState;
					["task_aaaDestoyed","Canceled",true] call BIS_fnc_taskSetState;
					missionEnd = ["TrucksDestroyedEnd", true];
				} else {
					["task_trucksDestoyed","Canceled",true] call BIS_fnc_taskSetState;
					["task_aaaDestoyed","Succeeded",true] call BIS_fnc_taskSetState;
					missionEnd = ["AAADestroyedEnd", false];
				};
			};
			case 2: {
				// WIN 3
				["task_retreat","Succeeded",true] call BIS_fnc_taskSetState;
				["task_trucksDestoyed","Succeeded",true] call BIS_fnc_taskSetState;
				["task_aaaDestoyed","Succeeded",true] call BIS_fnc_taskSetState;
				missionEnd = ["AllCompleteEnd", true];
			};
		};
		
		publicVariable "missionEnd";
		
		if !(hasInterface) then {
			sleep 5; 
			missionEnd spawn BIS_fnc_endMission;
		};
	};
};