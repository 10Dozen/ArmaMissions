enableSaving [false,false];
tf_no_auto_long_range_radio = true;

// [@IsEditModeOn?, @Delay] execVM "dzn_gear\dzn_gear_init.sqf";
// 0 @IsEditModeOn?: true or false - Edit mode activation,
// 1 @Delay: NUMBER - script call delay (where 0 - is mission start). If not passed - runs without delay (before mission start);
[false] execVM "dzn_gear\dzn_gear_init.sqf";

[] execVM "dzn_dynai\dzn_dynai_init.sqf";

[] spawn {
	if !(player isKindOf "B_Pilot_F") exitWith {};
	private["_v"];
	
	cas_rrrs = [];
	if (isNil {player getVariable "cas_rrr_servicing"}) then { player setVariable ["cas_rrr_servicing",false,true]; };
	
	fnc_checkIfInRRR = {
		private["_r"];
		_r = false;
		{
			if (player distance _x < 25) exitWith { _r = true };
		} forEach cas_rrrs;
		_r	
	};
	
	{
		if (["cas_rrr",str(_x),false] call BIS_fnc_inString) then {
			cas_rrrs pushBack _x;
			if (isNil {player getVariable "cas_rrr_action"}) then { 
				player setVariable ["cas_rrr_action", player addAction [
					"<t color='#3333FF' size='1.3'>Service Vehicle</t>"
					, {
						_v = vehicle player;
						player setVariable ["cas_rrr_servicing",true,true];
						1000 cutText ["Vehicle Servicing", "PLAIN"];
						
						sleep 1;
						_v engineOn false;
						[_v] spawn { waitUntil { isEngineOn (_this select 0) }; player setVariable ["cas_rrr_servicing",false,true]; };
						
						while {player getVariable "cas_rrr_servicing" && (damage _v > 0)} do {
							_v setDamage (damage _v - 0.1);
							sleep 1;
						};
						_v setDamage 0;
						
						while {player getVariable "cas_rrr_servicing" && (fuel _v < 1)} do {
							_v setFuel (fuel _v + 0.1);
							sleep 1;
						};
						
						{
							if !(_x in magazines _v) then {
								_v addmagazine _x;
								sleep 1;
							};
						}foreach (_v getVariable "cas_rrr_magazines");
						_v setVehicleAmmo 1;
						
						1000 cutText ["Vehicle Servicing - Done", "PLAIN"];
						player setVariable ["cas_rrr_servicing",false,true];
					}
					,[],6,true,true,""
					, "(call fnc_checkIfInRRR)
					&& !(player getVariable 'cas_rrr_servicing') 
					&& !(vehicle player == player)
					&& alive player"
				]
				, true];
			};
		};
	} forEach (synchronizedObjects cas_placement);
	
	
	if (hasInterface && !isServer) exitWith {};

	private["_veh","_spawnVehicle"];
	cas_className = "RHS_A10";

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

// Mission Flow
[] spawn {
	_truckLotsList =  (synchronizedObjects misFlow_truckLots);
	for "_i" from 0 to 3 do {
	
	
	};
};
