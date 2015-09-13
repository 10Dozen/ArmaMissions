if (player == leader group player && !(player isKindOf "O_crew_F")) then {
	player addAction [
		"<t color='#AA3122'>Set Rallypoint</t>"
		, {
		rallypoint setPosATL (player modelToWorld [0, +3, 0]);
		"respawn_east" setMarkerPos (getPosASL rallypoint);
		}
		, [],6,true,true,""
		, "alive player && !(vehicle player == player)"
	];	
};