if (isNil "player_initialized") then {
	player_initialized = true;
	[player,3] call BIS_fnc_respawnTickets;
	
	fnc_addDefuseActions = {
		// IED Check action
		player addAction [
			"<t color='#F2D55E'>Check for IED</t>"
			, {
				private["_ied"];
				_ied = cursorTarget;

				hintSilent "Checking...";
				player playMove "AinvPknlMstpSlayWrflDnon_medic";
				sleep 6;
				player switchMove "";
				
				if (alive player) then {
					switch (_ied getVariable "isIED") do {
						case 0: { hint "There is no IED."; };
						case 1: { hint "Disarmed IED found."; };
						case 2: { hint "Armed IED found!"; };
						case 3: { 
							hint "Armed IED found!";	
							if ( !(player getVariable "EODSpec") && floor(random 100) < 51 ) exitWith { 
								_ied setVariable ["isIED", 4, true];
								/*"HelicopterExploSmall" createVehicle (getPos _ied);
								deleteVehicle _ied;*/
							};
							_ied setVariable ["isIED", 2, true];
						};
					};
				};	
			}
			,[],3,false,false,"",
			"(vehicle player == player) 
			&& (player distance cursorTarget < 4) 
			&& ( cursorTarget getVariable ['isIED', -2] > -1 )"

		];

		if (!isNil { player getVariable "EODSpec" }) then {
			// IED Defuse action
			player addAction [
				"<t color='#b50015'>Defuse IED</t>"
				, {
					private["_ied"];
					_ied = cursorTarget;

					hintSilent "Defusing...";
					player playMove "Acts_carFixingWheel";
					sleep 12;
					player switchMove "";
					if (alive player) then {
						if (floor(random 100) < 20) then {						
							hint "Oops! Looks that you have failed. RUN!!!";
							[_ied] spawn { 
								sleep 5;
								(_this select 0) setVariable ["isIED", 4, true];
							};
						} else {					
							hintSilent "Defused";
							_ied setVariable ["isIED", 1, true];
						};
					};
				}
				,[],3,false,false,"",
				"(vehicle player == player) 
				&& (player distance cursorTarget < 4) 
				&& (player getVariable 'EODSpec')
				&& ( cursorTarget getVariable ['isIED', -2] == 2 )"
			];	
		};
	};
	
	fnc_addEarplugs = {
		player addItem "ACE_EarPlugs";
	};
	
	fnc_addKilledMPEH = {
		player addMPEventHandler ["MPKilled", {	
			moveOut (_this select 0);	
			(_this select 0) setPos ( (_this select 0) modelToWorld [0,4,0] );
		}];	
	};
	
	call fnc_addKilledMPEH;
	call fnc_addDefuseActions;
	[] spawn {
		sleep 2;
		call fnc_addEarplugs;
	};
	
	
	
	if (didJIP) then {
		private["_kit"];
		_kit = switch (roleDescription player) do {
			case "Squad Leader":						{ "asadLoyalistsKit_SL" };
			case "Combat Life Saver":				{ "asadLoyalistsKit_M" };
			case "Team Leader":							{ "asadLoyalistsKit_TL" };
			case "Machinegunner":						{ "asadLoyalistsKit_MG" };
			case "Grenadier":								{ "asadLoyalistsKit_G" };
			case "Demo/Repair Specialist":	{ "asadLoyalistsKit_RRep" };
			case "Rifleman (AT)":						{ "asadLoyalistsKit_RAT" };
		};
		[player, _kit] call dzn_fnc_gear_assignKit;
	};
};


