// 
// Creates vehicle, ammoboxes and other stuff on marked bases
// ********************************


private["_base", "_bases", "_veh", "_kit", "_spotItem", "_kitAssigned", "_spots"];
_bases = dzn_base_fobs + dzn_base_outposts;

{
	_base = _x;
	_spots = synchronizedObjects _x;
	{
		_spotItem = "";
		_kitAssigned = "";
		
		#define	checkSpotType(MARK)	([MARK, str(_x), false] call BIS_fnc_inString)
		#define assignClassAndKit(MARK)	case checkSpotType(MARK): {_spotItem = call compile format ["dzn_base_%1",MARK]; _kitAssigned = MARK;};

		// Pick a classname for given spot
		switch (true) do {			
			assignClassAndKit("RECON_CAR")
			assignClassAndKit("TRUCK_CARGO")
			assignClassAndKit("ARMED_CAR")
			assignClassAndKit("IFV")
			assignClassAndKit("APC")
			assignClassAndKit("TANK")
			assignClassAndKit("CARGO_HELI")
			assignClassAndKit("CAS_HELI")
			assignClassAndKit("CAS_PLANE")
			assignClassAndKit("TRUCK_REPAIR")
			assignClassAndKit("TRUCK_FUEL")
			assignClassAndKit("TRUCK_AMMO")
			assignClassAndKit("BOX_AMMO")
			assignClassAndKit("BOX_MEDIC")
		};
		
		if (_spotItem != "") then {
			switch (true) do {
				case (typename _spotItem == "CODE"): {
					// Script given
					[_base, _x] spawn _spotItem;
				};
				case (typename _spotItem in ["STRING","ARRAY"]): {
					// If array of classnames passed
					if (typename _spotItem == "ARRAY") then { _spotItem = _spotItem call BIS_fnc_selectRandom; };
				
					// Classname given
					_veh = _spotItem createVehicle (getPosATL _x);
					_veh setDir (getDir _x);
					
					#define getVehicleKitByType(PAR, KIT)	case (_kitAssigned in PAR): { KIT };
					_kit = switch (true) do {
						getVehicleKitByType(VEHICLES_EMPTY_KIT, "vehicleEmptyKit")
						getVehicleKitByType(VEHICLES_COMBAT_KIT, "vehicleCombatKit")
						getVehicleKitByType(VEHICLES_AMMOBOX_KIT, "vehicleAmmoboxKit")
						getVehicleKitByType(VEHICLES_MEDICBOX_KIT, "vehicleMedicboxKit")
					};
					
					if (!isNil {_kit}) then {
						//[_veh, _kit, true] call dzn_fnc_gear_assignKit;
					} else {
						["Not defined gear_box kit for (%1)",_kitAssigned] call BIS_fnc_error;
					};
				};
			};
		} else {
			["Not defined item for spot (%1)",str(_x)] call BIS_fnc_error;
		};
		
		deleteVehicle _x;
	} forEach _spots;
} forEach _bases; 
