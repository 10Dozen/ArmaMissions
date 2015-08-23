enableSaving [false, false]; 

waitUntil { isServer || !isNull player }; 
waitUntil { !isNil "BIS_MPF_InitDone" }; 

1 setRadioMsg "Flanking targets";
9 setRadioMsg "Move respawn marker";
10 setRadioMsg "Repair vehicle";

if (isPlayer player) then {
	[] execVM "assignKits.sqf";
};
