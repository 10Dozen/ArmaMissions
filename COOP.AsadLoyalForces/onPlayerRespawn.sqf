[player, player getVariable "dzn_gear", false] spawn dzn_fnc_gear_assignKit;

if (player == leader group player) then {
	player addAction ["<t color='#AA3122'>Set Rallypoint</t>", {
		rallypoint setPosATL (player modelToWorld [0, +3, 0]);
		"respawn_east" setMarkerPos (getPosASL rallypoint);
	}];
};