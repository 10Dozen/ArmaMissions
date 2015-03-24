if (!isNil { taskOperator getVariable str(vehicle player) }) then {
	// [player, taskOperator getVariable str(vehicle player), false] spawn dzn_fnc_gear_assignKit;
	
	if (player == leader group player) then {
		player addAction ["<t color='#AA3122'>Set Rallypoint</t>", {
			dzn_rallypoint setPosATL (player modelToWorld [0, +3, 0]);
			"respawn_east" setMarkerPos (getPosASL dzn_rallypoint);
		}];
	};
};
