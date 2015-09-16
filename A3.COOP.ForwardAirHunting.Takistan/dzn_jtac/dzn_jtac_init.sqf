#define JTAC_CHECK_VEHICLE	(typeOf (vehicle player) in dzn_jtac_casVehicles) 
dzn_jtac_casVehicles = [
	"I_Plane_Fighter_03_AA_F","I_Plane_Fighter_03_CAS_F","B_Plane_CAS_01_F","O_Plane_CAS_02_F",
	"B_Heli_Light_01_armed_F","B_Heli_Attack_01_F","O_Heli_Attack_02_F","O_Heli_Attack_02_F",
	"O_Heli_Attack_02_black_F","O_Heli_Light_02_F","I_Heli_light_03_F"
];

waitUntil {!isNil "cas_className"};
`````` pushBack cas_className;

dzn_jtac_drawLaserTargets = {
	if (isNull _this) exitWith {};
	
	if JTAC_CHECK_VEHICLE then {
		private ["_laserTargets","_posV","_text","_textPos"];
		_laserTargets = _this nearEntities [["LaserTarget"], 4000];
		{
			if !(terrainIntersectASL [getPosASL _x, getPosASL player]) then {
				_posV = getPosATL _x;
				_textPos = [(_posV select 0) + 10, _posV select 1, (_posV select 2) - 30];
				_text = str(round(player distance _x)) + "m";
				
				drawIcon3D ['', [1,0,0,1], _posV, 0, 0, 0, "+", 2, 0.035, 'puristaMedium'];
				drawIcon3D ['', [1,0,0,1], _textPos, 0, 0, 0, _text , 2, 0.025, 'puristaMedium'];
			};
		} forEach _laserTargets;
	};
};

waitUntil { JTAC_CHECK_VEHICLE };
["dzn_jtac", "onEachFrame", { player call dzn_jtac_drawLaserTargets }] call BIS_fnc_addStackedEventHandler;