if !(isPlayer player) exitWith {};

dzn_fnc_setRating = {
	private ["_setRating","_unit","_getRating","_addVal"];
	_setRating = _this select 0;
	_unit = _this select 1;
	
	_getRating = rating _unit;
	_addVal = _setRating - _getRating;

	_unit addRating _addVal;
};

dzn_fnc_isTrespassing = {
	// [aZones, cZones, unit] call dzn_fnc_isTrespassing
	private ["_aZones","_cZones","_unit","_isTrespassing","_isCooldown"];
	_aZones = _this select 0;
	_cZones = _this select 1;
	_unit = _this select 2;

	_isTrespassing = false;
	_isCooldown = false;

	// Check if unit is trespassing agressive zone
	{
		if (getPosASL _unit in _x) then {
			_isTrespassing = true;
		};
	} forEach _aZones;
	
	// If unit does not in agressive zone - checking if he somewhere insisde cooldown zone
	if !(_isTrespassing) then {			
		{
			if (getPosASL _unit in _x) then {
				_isCooldown = true;
			};
		} forEach _cZones
	};

	[_isTrespassing, _isCooldown];
};
	
private ["_taskModules","_aZones","_cZones"];
	
player setVariable ["isTrespassed", false, true];
_taskModules = entities "ModuleTaskCreate_F";	
_aZones = [];
_cZones = [];

{	
	private ["_linkedTaskModule","_synchronized"];

	_linkedTaskModule = _x;
	_synchronized = synchronizedObjects _x;

	{
		if (typeOf _x == "EmptyDetector") then {
			private ["_cSizeMod","_cSizeMin","_areaTrg","_agressionArea","_cooldownArea"];
			_areaTrg = _x;
			
			_cSizeMod = 2;
			_cSizeMin = 300;

			_agressionArea = createLocation [
				"NameLocal",
				getPos _areaTrg,
				triggerArea _areaTrg select 0,
				triggerArea _areaTrg select 1
			];
			_agressionArea setDirection  (triggerArea _areaTrg select 2);
			_agressionArea setRectangular (triggerArea _areaTrg select 3);

			_cooldownArea = createLocation [
				"NameLocal",
				getPos _areaTrg,
				// (triggerArea _areaTrg select 0)*_cSizeMod,
				// (triggerArea _areaTrg select 1)*_cSizeMod
				if ((triggerArea _areaTrg select 0)*_cSizeMod < _cSizeMin) then { _cSizeMin } else { (triggerArea _areaTrg select 0)*_cSizeMod },
				if ((triggerArea _areaTrg select 1)*_cSizeMod < _cSizeMin) then { _cSizeMin } else { (triggerArea _areaTrg select 1)*_cSizeMod }
			];
			_cooldownArea setDirection  (triggerArea _areaTrg select 2);
			_cooldownArea setRectangular (triggerArea _areaTrg select 3);
	
			_aZones = _aZones + [_agressionArea];
			_cZones = _cZones + [_cooldownArea];				
		};		
	} forEach _synchronized;
} forEach _taskModules;

player setVariable ["aZones", _aZones, true];
player setVariable ["cZones", _cZones, true];

[] execFSM "missionFlow\trespassingReaction.fsm"; 
