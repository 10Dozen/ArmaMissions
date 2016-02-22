// Briefing
[] execVM "tSF_briefing.sqf";
[] execVM "tSF_Notes.sqf";


// Services
[] execVM "Logic\radioServices\serviceActions.sqf";

// Air Taxi
[] execVM "Logic\dzn_atc\dzn_atc_init.sqf";

[] spawn {
	saveGearOnArsenalClose_opened = false;
	["saveGearOnArsenalClose", "onEachFrame", {
		if !(saveGearOnArsenalClose_opened) then {
			if !(isNull ( uinamespace getvariable "RSCDisplayArsenal" )) then {
				saveGearOnArsenalClose_opened = true;
			};		
		} else {
			if (isNull ( uinamespace getvariable "RSCDisplayArsenal" )) then {
				saveGearOnArsenalClose_opened = false;
				player setVariable ["dzn_gear_kit", player call dzn_fnc_gear_getGear];
			};		
		};
	}] call BIS_fnc_addStackedEventHandler;
	
	waitUntil { !isNil "Chapel" };
	Chapel addAction [
		"<t color='#FFE240' size='1.5'>Pray the God</t>",{
			[player,player] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;
			[] spawn {
				1000 cutText ["","WHITE OUT",0.3];
				sleep 1;				
				1000 cutText ["","WHITE IN",1];
				hint parseText "<t color='#FFE240' size='2'>You feel the blessing</t>";
			};
		},"",6,true,true,"","_this distance2d _target < 1.6"
	];	
};

[] spawn {
	waitUntil { time > 0 };
	1000 cutText ["DEPLOYMENT IN PROGRESS","BLACK OUT",0];
	sleep 5; 1000 cutText ["Signing of a contract.","BLACK OUT",0];
	sleep 0.5; 1000 cutText ["Signing of a contract..","BLACK OUT",0];
	sleep 0.5; 1000 cutText ["Signing of a contract...","BLACK OUT",0];
	sleep 2; 1000 cutText ["Medical insurance registration.","BLACK OUT",0];
	sleep 0.5; 1000 cutText ["Medical insurance registration..","BLACK OUT",0];
	sleep 0.5; 1000 cutText ["Medical insurance registration...","BLACK OUT",0];
	sleep 4; 1000 cutText ["WELCOME TO TAKISTAN", "BLACK IN",1];
};
