
dzn_fnc_updateMarketBox = {
	// [ @Box, @ItemList] call dzn_fnc_addItemsToMarketBox;
	private["_box","_itemsToAdd"];
	
	_box = _this select 0;
	_itemsToAdd = [];
	{
		_itemsToAdd pushBack (_x select 0);
	} forEach (_this select 1);	
	
	[_box , (_box call BIS_fnc_getVirtualBackpackCargo)] call BIS_fnc_removeVirtualBackpackCargo;
	[_box , (_box call BIS_fnc_getVirtualItemCargo)] call BIS_fnc_removeVirtualItemCargo;
	[_box , (_box call BIS_fnc_getVirtualWeaponCargo)] call BIS_fnc_removeVirtualWeaponCargo;
	[_box , (_box call BIS_fnc_getVirtualMagazineCargo)] call BIS_fnc_removeVirtualMagazineCargo;
	
	[_box, _itemsToAdd, true, false] call BIS_fnc_addVirtualBackpackCargo;
	[_box, _itemsToAdd, true,false] call BIS_fnc_addVirtualItemCargo;
	[_box, _itemsToAdd, true, false] call BIS_fnc_addVirtualWeaponCargo;
	[_box, _itemsToAdd, true, false] call BIS_fnc_addVirtualMagazineCargo;
};

dzn_fnc_market_addItemsToList = {
	// [ [@Classname, [@Price, @Available], ... ] call dzn_fnc_market_addItemsToList;
	{
		if (typename _x == "ARRAY" && {typename (_x select 0) == "STRING"}) then {
			dzn_market_itemList pushBack _x;
		};
	} forEach _this;
};

dzn_fnc_market_addFreeItemsToList = {
	// [ @ClassName, @ClassName2 ... ] call dzn_fnc_market_addFreeItemsToList;
	{
		dzn_market_itemList pushBack [_x, [0, true]];	
	} forEach _this;
};

dzn_fnc_market_removeItemFromList = {
	// @Classname call dzn_fnc_market_removeItemFromList
	private["_idx"];
	_idx = -1;
	{ 
		if (_x select 0 == _this) exitWith {_idx = _forEachIndex; };
	} forEach dzn_market_itemList;
	
	dzn_market_itemList set [_idx, -1];
	dzn_market_itemList = dzn_market_itemList - [-1];
};


dzn_fnc_market_getItemPrice = {
	// @Classname call dzn_fnc_market_getItemPrice
	private["_price"];
	_price = [dzn_market_itemList, _this] call dzn_fnc_getValueByKey;
	if (!isNil {_price} && {typename _price != "ARRAY"}) exitWith { 0 };
	
	(_price select 0)
};

dzn_fnc_market_isItemAvailable = {
	// @Classname call dzn_fnc_market_isItemAvailable
	private["_isAvailable"];
	_isAvailable = [dzn_market_itemList, _this] call dzn_fnc_getValueByKey;
	if (!isNil {_isAvailable} && {typename _isAvailable != "ARRAY"}) exitWith { false };
	
	(_isAvailable select 1)
};



dzn_fnc_convertInventoryToLine = {
	// @InventoryArray call dzn_fnc_convertInventoryToLine
	private["_line","_cat","_subCat"];
	#define	linePush(X)		if (_x != "") then {_line pushBack X;};
	_line = [];
	{
		_cat = _x;
		if (typename _cat == "ARRAY") then {
			{
				_subCat = _x;
				if (typename _subCat == "ARRAY") then {
					{
						linePush(_x)
					} forEach _subCat;
				} else {
					linePush(_x)
				};
			} forEach _cat;
		} else {
			linePush(_x)
		};
	} forEach _this;
	
	_line
};

dzn_fnc_getChangedInvItems = {
	// [@InvToCheck, @BaseInv] call dzn_fnc_getChangedInvItems;
	_curInv = _this select 0;
	_baseInv = _this select 1;
	
	if (_curInv isEqualTo _baseInv) exitWith { [] };
	
	_changedItems = [];
	_removedItems = [];
	
	_changedItems = _curInv - _baseInv;
	_removedItems = _baseInv - _curInv;
	
	[_changedItems, _removedItems]
};



// DISPLAY NAME iof Weapon or Gear
dzn_fnc_getWeaponDisplayName = {
	private ["_cfgWeapons","_output","_item"];
	_cfgWeapons = ("isclass _x && getnumber (_x >> 'scope') == 2 ") configclasses (configfile >> "cfgWeapons");
	
	_output = "";
	for "_i" from 0 to (count _cfgWeapons)-1 do {
		_item = _cfgWeapons select _i;			
		if (  configName(_item) == _this ) then {
			_output = getText(configFile >> "cfgWeapons" >> configName(_item) >> "displayName");
		};
	};
	
	_output
};

dzn_fnc_getMagazineDisplayName = {
	private ["_cfgMagazines","_output","_item"];
	_cfgMagazines = ("isclass _x && getnumber (_x >> 'scope') == 2 && getText (_x >> 'picture') != ''") configclasses (configfile >> "cfgMagazines");
	
	_output = "";
	for "_i" from 0 to (count _cfgMagazines)-1 do {
		_item = _cfgMagazines select _i;			
		if (  configName(_item) == _this ) then {
			_output = getText(configFile >> "cfgMagazines" >> configName(_item) >> "displayName");
		};
	};
	
	_output
};

dzn_fnc_getEuipDisplayName = {
	private ["_cfgWeapon","_cfgGlasses","_output","_item"];	
	_cfgWeapon = ("isclass _x && getnumber (_x >> 'scope') == 2 ") configclasses (configfile >> "cfgWeapons");
	_cfgGlasses = ("isclass _x && getnumber (_x >> 'scope') == 2 ") configclasses (configfile >> "CfgGlasses");
	_output = "";
	
	for "_i" from 0 to (count _cfgWeapon)-1 do {
		_item = _cfgWeapon select _i;			
		if (  configName(_item) == _this ) then {
			_output = getText(configFile >> "cfgWeapons" >> configName(_item) >> "displayName");
		};
	};
	
	if (_output == "") then {		
		for "_i" from 0 to (count _cfgGlasses)-1 do {
			_item = _cfgGlasses select _i;			
			if (  configName(_item) == _this ) then {
				_output = getText(configFile >> "cfgGlasses" >> configName(_item) >> "displayName");
			};
		};
	};

	_output
};

dzn_fnc_getBackpackDisplayName = {
	private ["_cfg","_output","_item"];		
	_cfgVehicles = ("isclass _x && !(getArray (_x >> 'allowedSlots') isEqualTo [])") configclasses (configfile >> "cfgVehicles");
	_output = "";
	
	for "_i" from 0 to (count _cfgVehicles)-1 do {
		_item = _cfgWeapon select _i;			
		if (  configName(_item) == _this ) then {
			_output = getText(configFile >> "_cfgVehicles" >> configName(_item) >> "displayName");
		};
	};
	_output
};



//
dzn_fnc_getValueByKey = {
	// [@Array, @Key] call dzn_fnc_getValueByKey
	private["_output","_default"];
	_default = "@Wrong key";
	_output = _default;
	
	{
		if ( [_this select 1, _x select 0] call BIS_fnc_areEqual ) exitWith { _output = _x select 1; };
	} forEach (_this select 0);
	
	if (typename _output == typename _default && {_output == _default}) then { 
		hintSilent format ["dzn_fnc_getValueByKey :: Failed to find %1 key. Will return FALSE.", str(_this select 1)];
		diag_log format ["dzn_fnc_getValueByKey :: Failed to find %1 key. Will return FALSE.", str(_this select 1)];
		_output = false;
	};
	
	_output
};
