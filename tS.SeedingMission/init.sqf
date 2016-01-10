if (isServer) then {
	[] execVM "inventory\createWhiteListedArsenal.sqf"
};

[] execVM "tSF_briefing.sqf";
