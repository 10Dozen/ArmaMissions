private["_grp","_goat", "_i"];
_grp = createGroup EAST;
{
	for "_i" from 0 to 3 do {
		_goat = _grp createUnit ["Goat", getPosASL _x, [], 0, "FORM"];
	};
} forEach (synchronizedObjects goat_spawner);
