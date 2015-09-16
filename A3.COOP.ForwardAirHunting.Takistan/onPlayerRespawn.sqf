if (player distance (getMarkerPos "respawn_west") < 5) then {
	[player, player getVariable "dzn_gear", false] spawn dzn_fnc_gear_assignKit;
	if (!isNil {player getVariable "pilot_respawn"}) then {
		player setPos (player getVariable "pilot_respawn");
	} else {
		player setPos recon_team_respawn;
	};
};
	
	