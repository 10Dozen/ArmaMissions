waitUntil {!isNil "BIS_fnc_selectRandom"};
private ["_i","_priWepList","_priWep","_backpack","_at"];

removeAllWeapons player;
removeAllItems player;
removeBackpack player;
[player, "ALL"] call ACE_fnc_RemoveGear;

if !(player hasWeapon "ACE_Earplugs") then { player addWeapon "ACE_Earplugs" };
player addWeapon "ItemWatch";
player addWeapon "ItemRadio";
player addWeapon "ItemCompass";
player addWeapon "ItemGPS";
player addWeapon "ItemMap";

_priWepList = [
	["ACE_SOC_M4A1_GL","30Rnd_556x45_Stanag"] /* GR */
	, ["ACE_M249_AIM","100Rnd_556x45_M249"] /* AR */
	, ["ACE_SOC_M4A1_Aim","30Rnd_556x45_Stanag"] /* AT */
	, ["ACE_SOC_M4A1_Aim","30Rnd_556x45_Stanag"]  /* R */
];
_backpack = "ACE_Coyote_Pack";


_i = 3;
switch (player) do {
	case gr1; case gr2: {
		_i = 0;
		for "_k" from 1 to 6 do { player addMagazine "1Rnd_HE_M203"; };
	};
	case ar1; case ar2: {
		_i = 1;
	};
	case at1; case at2: {
		_i = 2;
		player addWeapon "ACE_M136_CSRS";
	};
	case r1; case r2: {
		_i = 3;
	};	
};

_priWep = _priWepList select _i; 

for "_k" from 1 to 6 do { player addMagazine (_priWep select 1); };
player addWeapon (_priWep select 0);

player addMagazine "ACE_Morphine";
player addMagazine "ACE_Epinephrine";
