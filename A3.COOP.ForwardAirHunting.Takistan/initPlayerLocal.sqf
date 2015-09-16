// DIary 
[] spawn {
	player createDiaryRecord ["Diary", ["View Distance", "<font color='#A0DB65'><execute expression='[] call dzn_fnc_addViewDistance;'>INCREASE VIEW DISTANCE</execute>
	<br /><br /><execute expression='[] call dzn_fnc_reduceViewDistance;'>DECREASE VIEW DISTANCE</execute></font>"]];
	
	player createDiaryRecord ["Diary", ["JTAC Helper", "To help pilot with targeting, Recon team can use Laser designator to mark the target. In addition to original Arma3 laser marker target, enabled 'Use JTAC Helper' will draw 3D icon for pilots to provide visualisation of laser marker via HUD. Marker will be visible in distance of 4000 m (direct distance between marker and aircarft - so high altitude will affect).
	<br /><br />* Find target<br />* Aim to it<br />* Turn Laser On
	<br /><br /><br />If 3d icon isn't drawn or you forgot to turn option on in Mission Parameters - you may <font color='#A0DB65'><executeClose expression='[] execVM ""dzn_jtac\dzn_jtac_init.sqf""'>ENABLE</executeClose></font> it here."]];

	player createDiaryRecord ["Diary", ["Note", "* Mission will end only when Recon team reachs Retreat zone. All tasks will be resolved at mission end, so don't wait for notification during the game."]];
	player createDiaryRecord ["Diary", ["CAS 9-Liner", 
		"<font color='#12C4FF' size='14'>COLT-__(1 or 2) , this is HITMAN-1-1, TYPE ___(1,2,3) in effect, call when ready for 9-line</font>
		<br /><font color='#5E5E5E'>wait for pilot answer, then provide 9-liner</font>
		<br />
		<br />CONTROL > <font color='#9E9E9E'>1 (direct attack on position), 2 (find and attack in given area), 3 (find and attack any)</font>
		<br />1. IP/BP > <font color='#9E9E9E'>IP Eagle (North), IP Hawk (East), IP Crow (South), IP Raven (West)</font>
		<br />2. HEADING > <font color='#9E9E9E'>0...359 degrees (from IP to target)</font>
		<br />3. DISTANCE > <font color='#9E9E9E'>in meters (from IP to target)</font>
		<br />4. TARGET ELEVATION > <font color='#9E9E9E'>in meters</font>
		<br />5. TARGET DESCRIPTION > <font color='#9E9E9E'>(e.g. 'one APC', 'infantry squad')</font>
		<br />6. TARGET LOCATION > <font color='#9E9E9E'>XXXX YYYY (e.g. 0349 0120)</font>
		<br />7. TYPE MARKER > <font color='#9E9E9E'>None, Smoke, Laser</font>
		<br />8. FRIENDLIES > <font color='#9E9E9E'>Heading and distance from target</font>
		<br />9. EGRESS > <font color='#9E9E9E'>Direction of leaving AO</font>
		<br />
		<br /><font color='#5E5E5E'>Do not transmit line numbers and headers (e.g. say '400 meters' instead of '3. Distance 400 meteres').
		</font>"
	]];
	player createDiaryRecord ["Diary", ["Mission", "We have no time and ability to intercept these trucks on the route, so Recon team should infiltrate Chaman area, find all these trucks and bring our CAS to it. <br />Be aware of insurgent's AAA, there should be at least 1 Shilka and several heavy machine guns somewhere in the valley."]];
	player createDiaryRecord ["Diary", ["Intel", "Several days ago we got an information about weapon truck convoy near Takistan border. We supposed, that these trucks were going to cross border somewhere near Chaman.<br />Today we got a message from our contact, that trucks will arrive in two hours and will bring heavy weapons, including MANPADs, to insurgetns."]];

	if !(player isKindOf "B_Pilot_F") then {	
		waitUntil {"task_destroyTrucks" call BIS_fnc_taskExists && "task_destroyAAA" call BIS_fnc_taskExists};
		[player,["task_retreat"],["Retreat to Ahmaday when all objectives done","Retreat",""], "pickup",0,4,false,"",false] call BIS_fnc_taskCreate;
		
		"task_destroyTrucks" call BIS_fnc_taskSetCurrent;
	};
};

// Mission End
[] spawn {
	waitUntil {!isNil "missionEnd" && { !(missionEnd isEqualTo []) }};	
	sleep 3;
	missionEnd spawn BIS_fnc_endMission;
};

// Recon Team
[] spawn {
	if (player isKindOf "B_Pilot_F") exitWith {};
	recon_team_respawn = getPos player;
	
	waitUntil { time > 10 };
	if !(leader group player == player) exitWith {};
	
	player addAction [
		"<t color='#FF8B26'>Deploy as Rally point</t>"
		, {
			recon_team_respawn = getPos player;
			publicVariable "recon_team_respawn";
			hint format ["Rally point set at grid %1", mapGridPosition player];
		}
		, [],6,true,true,""
		, "!isNull cursorTarget
		&& {
			alive player
			&& (vehicle player == player)
			&& (cursorTarget isKindOf 'B_Quadbike_01_F')	
			&& (cursorTarget distance player < 8)
		}"		
	];
};

// Pilots
[] spawn {
	if !(player isKindOf "B_Pilot_F") exitWith {};
	if (par_usejtac == 1) then { [] execVM "dzn_jtac\dzn_jtac_init.sqf"; };
	
	private["_v"];
	
	cas_rrrs = [];
	if (isNil {player getVariable "cas_rrr_servicing"}) then { player setVariable ["cas_rrr_servicing",false,true]; };
	
	player addAction [
		"<t color='#FC883F'>View Distance +1 km</t>", {[] call dzn_fnc_addViewDistance;}
	];
	
	player addAction [
		"<t color='#FCE63F'>View Distance -1 km</t>", {[] call reduceViewDistance;}
	];
	
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
