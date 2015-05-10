dzn_fnc_convertTriggerToLocation = {
	// [trigger, delete trigger?] call dzn_fnc_convertTriggerToLocation
	private ["_trg","_deleteTrg","_trgArea","_loc"];
	_trg = _this select 0;
	_deleteTrg = if ( isNil {_this select 1} ) then { true } else { _this select 1 };
	
	_trgArea = triggerArea _trg; // result is [200, 120, 45, false]
	hint str[_trgArea];
	_loc = createLocation ["Name", getPosATL _trg, _trgArea select 0, _trgArea select 1];
	_loc setDirection (_trgArea select 2);
	_loc setRectangular (_trgArea select 3);
	
	if (_deleteTrg) then { deleteVehicle _trg; };
	
	_loc
};

KK_fnc_onEachFrame = {
    private "_oef";
    if (typeName _this isEqualTo "CODE") then {
        _this = format ["%1", _this];
        _this = _this select [1, count _this - 2];
    };
    _oef = "EmptyDetector" createVehicleLocal [0, 0, 0];
    _oef setTriggerArea [0, 0, 0, false];
    _oef setTriggerStatements [_this, "", ""];
    _oef
};

dzn_fnc_getMissionParametes = {
	//Params
	if (isNil "paramsArray") then {
		if (isClass (missionConfigFile/"Params")) then {
			for "_i" from 0 to (count (missionConfigFile/"Params") - 1) do {
				_paramName = configName ((missionConfigFile >> "Params") select _i);
				missionNamespace setVariable [_paramName, getNumber (missionConfigFile >> "Params" >> _paramName >> "default")];
			};
		};
	} else {
		for "_i" from 0 to (count paramsArray - 1) do {
			missionNamespace setVariable [configName ((missionConfigFile >> "Params") select _i), paramsArray select _i];
		};
	}; 
};

dzn_fnc_setWeather = {
	// this call dzn_fnc_setWeather
	if !(isServer || isDedicated) exitWith {};
	
	if (_this > 0) then {
		{
			if (_this == _x select 0) exitWith {
				0 setOvercast (_x select 1);
			};
		} forEach dzn_weatherSettingsMapping;
	} else {
		0 setOvercast ( (dzn_weatherSettingsMapping call BIS_fnc_selectRandom) select 1 );
	};
	
	switch (_this) do {
		case 4: { 0 setRain 0.5; };
		case 5: { 0 setRain 1; };
	};
	
	forceWeatherChange
};

dzn_fnc_setFog = {
	// _this call dzn_fnc_setFog
	if !(isServer || isDedicated) exitWith {};
	
	if (_this > 0) then {
		{
			if (_this == _x select 0) exitWith {
				0 setFog [_x select 1];
			};
		} forEach dzn_fogSettingsMapping;
	} else {
		0 setFog [ (dzn_fogSettingsMapping call BIS_fnc_selectRandom) select 1 ];
	};
};

dzn_fnc_setDateTime = {

};

dzn_fnc_cache = {};
