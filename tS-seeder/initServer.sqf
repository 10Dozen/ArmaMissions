[] spawn {
	dzn_fnc_setEnv = {
		private "_newObject";		
		_newObject = createVehicle (_this select 0);
		_newObject setPosASL (_this select 1);
		_newObject setVectorDirAndUp (_this select 2);	
	};

	[] execVM "Logic\env\mainBase.sqf";
	[] execVM "Logic\env\mainBase_bunkers.sqf";
	[] execVM "Logic\env\mainBase_roadBlocks.sqf";
	[] execVM "Logic\env\mainBase_servicePoint.sqf";
};


[] spawn {
	waitUntil { !isNil "arsenalBox" };
	arsenalBox execVM "Logic\inventory\createWhiteListedArsenal.sqf"
};

[] spawn {	
	[] execVM "Logic\baseVehicles\baseRespawnableVehicles.sqf";
};