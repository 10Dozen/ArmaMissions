if (!isNil {player getVariable "dzn_gear"}) then {
	[player, player getVariable "dzn_gear"] spawn dzn_fnc_gear_assignKit;
};

	
if (player == leader group player) then {
	player addAction ["<t color='#AA3122'>Set Rallypoint</t>", {
		dzn_rallypoint setPosATL (player modelToWorld [0, +3, 0]);
		"respawn_west" setMarkerPos (getPosASL dzn_rallypoint);
	}];
};

hint parseText format ["<t size='1.25' color='#CC3300'>MEDICAL INSURANCE</t><br/>Issued in the name %1.<br/><br/>Cost $ 3000.", name(player)]; 


player setVariable ["isTrespassed",false,true];
