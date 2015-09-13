// DIary 
[] spawn {
	player createDiaryRecord ["Diary", ["Intel", "Several days age we got an inforamtion about weapon truck convoy at Takistan border. We suppose that these trucks are going to cross border somewhere near Chaman.<br />Today we got an message from our contact, that trucks arrive in two hours and will bring heavy weapons, including MANPADs, to insurgetns."]];
	player createDiaryRecord ["Diary", ["Mission", "We have no time and ability to intercept these trucks on the route, so Recon team should infiltrate Chaman area, find all these trucks and bring our CAS to it. <br />Be aware of insurgent's AAA, there should be at least 1 Shilka and several heavy machine guns somewhere it the valley."]];

	if !(player isKindOf "B_Pilot_F") then {	
		waitUntil {"task_destroyTrucks" call BIS_fnc_taskExists && "task_destroyAAA" call BIS_fnc_taskExists};
		[player,["task_retreat"],["Retreat to Ahmaday when all objectives done","Retreat",""], "pickup",0,4,false,"",false] call BIS_fnc_taskCreate;
		
		"task_destroyTrucks" call BIS_fnc_taskSetCurrent;
	};
};

// Mission End
[] spawn {
	waitUntil {!isNil "missionEnd" && { missionEnd isEqualTo [] }};	
	sleep 3;
	missionEnd spawn BIS_fnc_endMission;
};

// Pilots
[] spawn {
	if !(player isKindOf "B_Pilot_F") exitWith {};
	if (par_usejtac == 1) then { [] execVM "dzn_jtac\dzn_jtac_init.sqf"; };
	
	private["_v"];
	
	cas_rrrs = [];
	if (isNil {player getVariable "cas_rrr_servicing"}) then { player setVariable ["cas_rrr_servicing",false,true]; };
	
	player addAction [
		"<t color='#FC883F'>View Distance +1 km</t>"
		, {
			setViewDistance (viewDistance + 1000);
			setObjectViewDistance [(getObjectViewDistance select 0) + 400, getObjectViewDistance select 1];
		}
	];
	
	player addAction [
		"<t color='#FCE63F'>View Distance -1 km</t>"
		, {
			if (viewDistance > 1000) then {
				setViewDistance (viewDistance - 1000);
				setObjectViewDistance [(getObjectViewDistance select 0) - 400, getObjectViewDistance select 1];
			};
		}
	];
		
	/*	
	fnc_checkIfInRRR = {
		private["_r"];
		_r = false;
		{
			if (player distance _x < 25) exitWith { _r = true };
		} forEach cas_rrrs;
		_r	
	};
	*/
	
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
				/*
				{
					if !(_x in magazines _v) then {
						_v addmagazine _x;
						sleep 1;
					};
				} foreach (_v getVariable "cas_rrr_magazines");
				*/
				sleep 3;
				_v setVehicleAmmo 0.7;

				sleep 3;
				_v setVehicleAmmo 1;
				
				1000 cutText ["Vehicle Servicing - Done", "PLAIN"];
				player setVariable ["cas_rrr_servicing",false,true];
			}
			,[],6,true,true,""
			, "(player distance cas_rrr < 25)
			&& !(player getVariable 'cas_rrr_servicing') 
			&& !(vehicle player == player)
			&& alive player"
		]
		, true];
	};
	
	player setVariable ["pilot_respawn", getPos player];	
};	
