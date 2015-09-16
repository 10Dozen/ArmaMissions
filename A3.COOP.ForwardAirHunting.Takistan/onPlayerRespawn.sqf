if (player distance (getMarkerPos "respawn_west") < 5) then {
	[player, player getVariable "dzn_gear", false] spawn dzn_fnc_gear_assignKit;
	if (!isNil {player getVariable "pilot_respawn"}) then {
		player setPos (player getVariable "pilot_respawn");
	} else {
		player setPos recon_team_respawn;
		if (leader group player == player) then {	
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
	};
};
	
	
