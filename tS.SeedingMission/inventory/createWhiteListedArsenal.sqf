//	**************
//	Creates an object and assign white-listed arsenal to it.
//	**************
private["_boxClass","_boxPosition","_whitelist","_box"];

/* 	Settings	*/
_boxClass	= "Land_PaperBox_open_full_F";
_boxPosition	= [1000,1000,0];
_whitelist	= call compile preProcessFileLineNumbers "inventory\whitelist.sqf";

/*	Assigning Whitelisted Arsenal		*/
_box = createVehicle [_boxClass, _boxPosition, [], 0, "NONE"];

[_box , (_box call BIS_fnc_getVirtualBackpackCargo)] call BIS_fnc_removeVirtualBackpackCargo;
[_box , (_box call BIS_fnc_getVirtualItemCargo)] call BIS_fnc_removeVirtualItemCargo;
[_box , (_box call BIS_fnc_getVirtualWeaponCargo)] call BIS_fnc_removeVirtualWeaponCargo;
[_box , (_box call BIS_fnc_getVirtualMagazineCargo)] call BIS_fnc_removeVirtualMagazineCargo;
	
[_box, _whitelist, true, false] call BIS_fnc_addVirtualBackpackCargo;
[_box, _whitelist, true, false] call BIS_fnc_addVirtualItemCargo;
[_box, _whitelist, true, false] call BIS_fnc_addVirtualWeaponCargo;
[_box, _whitelist, true, true] call BIS_fnc_addVirtualMagazineCargo;
