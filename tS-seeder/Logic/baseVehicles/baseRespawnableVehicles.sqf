
respawnableVehicles = [
	[objNull, 'rhsusf_m998_d_s_4dr_fulltop', [[5843.53,11323.8,0], 50], "kit_rapier_HMMWV_Cargo", ["ACE_Wheel",1]] /* ACE_Wheel = 0 means 1 wheel */
	,[objNull, 'rhsusf_m1025_d_s', [[5841.13,11326.9,0], 50], "kit_rapier_HMMWV_Cargo", ["ACE_Wheel",1]]
	,[objNull, 'rhsusf_m1025_d_s_Mk19', [[5836.49,11332.1,0], 50], "kit_rapier_HMMWV_Cargo", ["ACE_Wheel",0]]
	,[objNull, 'rhsusf_m1025_d_s_Mk19', [[5833.67,11335,0], 50], "kit_rapier_HMMWV_Cargo", ["ACE_Wheel",0]]	
	,[objNull, 'rhsusf_m1025_d_s_m2', [[5828.79,11338.7,0], 50], "kit_rapier_HMMWV_Cargo", ["ACE_Wheel",0]]	
	,[objNull, 'rhsusf_m1025_d_s_m2', [[5826.05,11341.2,0], 50], "kit_rapier_HMMWV_Cargo", ["ACE_Wheel",0]]
	,[objNull, 'rhsusf_m998_d_s_4dr', [[5817.61,11346.4,0], 50], "kit_rapier_HMMWV_Cargo", ["ACE_Wheel",1]]
	
	,[objNull, 'rhsusf_m113d_usarmy_MK19', [[5850.55,11344.1,0], 0], "kit_rapier_APC_Cargo", ["ACE_Track",1]]	
	,[objNull, 'rhsusf_m113d_usarmy', [[5847.04,11347.5,0], 0], "kit_rapier_APC_Cargo", ["ACE_Track",1]]
];

vehicleBaseArea = [];
{
	vehicleBaseArea pushBack ([_x, false] call dzn_fnc_convertTriggerToLocation);
} forEach [areaTrg_1, areaTrg_2];

dzn_fnc_spawnRespawnableVehicle = {
	// [@Class, @PosAndDir] call dzn_fnc_spawnRespawnableVehicle
	private["_veh"];
	_veh = createVehicle [_this select 0, ((_this select 1) select 0), [], 0, 'CAN_COLLIDE'];
	_veh allowDamage false;
	_veh setDir ((_this select 1) select 1);
	_veh setPosATL ((_this select 1) select 0);
	
	[_veh, (_this select 3) select 1, (_this select 3) select 0] call ace_repair_fnc_addSpareParts;
	
	[_veh, _this select 2] spawn {
		waitUntil { !isNil "dzn_gear_serverInitDone" };		
		[_this select 0, _this select 1, true] spawn dzn_fnc_gear_assignKit;		
	};
	
	_veh spawn {
		waitUntil { sleep 5; !([getPosASL _this, vehicleBaseArea] call dzn_fnc_isInLocation) };
		_this allowDamage true;	
	};
	
	_veh
};

dzn_fnc_checkAndSpawnRespawnableVehicles = {
	{
		// No object or not alive, then spawn new object
		if (isNull (_x select 0) || { !alive (_x select 0) }) then {
			_veh = [_x select 1, _x select 2, _x select 3, _x select 4] call dzn_fnc_spawnRespawnableVehicle;
			respawnableVehicles set [_forEachIndex, [_veh, _x select 1, _x select 2]];
		};
	} forEach respawnableVehicles;
};

call dzn_fnc_checkAndSpawnRespawnableVehicles;

dzn_respawnableVehiclesControllerTimer = 60;
dzn_respawnableVehiclesControllerTimerStep = 60;

["respawnableVehiclesController", "onEachFrame", {
	if (time > dzn_respawnableVehiclesControllerTimer) then {
		dzn_respawnableVehiclesControllerTimer = time + dzn_respawnableVehiclesControllerTimerStep;
		call dzn_fnc_checkAndSpawnRespawnableVehicles;
	};
}] call BIS_fnc_addStackedEventHandler;
