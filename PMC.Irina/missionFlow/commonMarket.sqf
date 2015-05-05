// *****		Gun Market Script		********

dzn_getWeaponDisplayName = {
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
dzn_getMagazineDisplayName = {
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

dzn_getEuipDisplayName = {
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

dzn_getBackpackDisplayName = {
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


dzn_updateMarketAction = {
	// [_box, "marketBox_SMG", _x, _forEachIndex, type] call dzn_updateMarketAction
	private ["_actionID", "_callFunction"];
	
	_callFunction = switch (_this select 4) do {
		case "wep": { dzn_getWeaponDisplayName };
		case "mag": { dzn_getMagazineDisplayName };
		case "itm";
		case "eqp":	{ dzn_getEuipDisplayName };
		case "bck": { dzn_getBackpackDisplayName };		
	};
	
	_actionID = (_this select 0) getVariable format ["act_%1_%2", (_this select 1), (_this select 3)];
	(_this select 0) setUserActionText [ 
		_actionID,
		format [
			"<t color='#99CC00'>Buy</t> %1 <t color='#99CC00'>[%2$, %3 left]</t>", 			
			((_this select 2 select 0) call _callFunction), 
			_this select 2 select 1,
			(_this select 2 select 0) call dzn_getStoredItemCount
		]
	];
};
	
dzn_getStoredItemCount = {
	/* "itemName" call dzn_getStoredItemCount*/
	private ["_store","_output"];
	_store = marketStore getVariable "store";
	_output = 0;
	{
		if (_this == _x select 0) then {
			_output = _x select 1;
		};
	} forEach _store;
	_output
};

dzn_sellStoredItem = {
	// [_box, ["itemName",buy], type] call dzn_sellStoredItem
	
	private ["_store","_count","_idx","_box","_type","_item"];
	_store = marketStore getVariable "store";
	
	_box = _this select 0;
	_item = _this select 1;
	_type = _this select 2;	
	
	if ( pmc_accountCash - (_item select 1) >= 0) then {		
		pmc_accountCash = pmc_accountCash - (_item select 1);
		publicVariable "pmc_accountCash";
		
		_callFunction = switch (_type) do {
			case "wep": { dzn_getWeaponDisplayName };
			case "mag": { dzn_getMagazineDisplayName };
			case "itm";
			case "eqp":	{ dzn_getEuipDisplayName };
			case "bck": { dzn_getBackpackDisplayName };		
		};
		
		switch (_type) do {
			case "wep": { _box addWeaponCargoGlobal [_item select 0, 1]; };
			case "mag": { _box addMagazineCargoGlobal [_item select 0, 1]; };
			case "itm";
			case "itm": { _box addItemCargoGlobal [_item select 0, 1]; };
			case "bcl": { _box addBackpackCargoGlobal [_item select 0, 1]; };
		};
		
		
		_count = 0;
		_idx = 0;
		{
			if (_item select 0 == _x select 0) then {
				_count = _x select 1;
				_idx = _forEachIndex;
			};
		} forEach _store;
		
		_store set [_idx, [_item select 0, (_count - 1)]];
		marketStore setVariable ["store", _store, true];
		
		hint parseText format ["%1 <t color='#99CC00'>purchased for</t> %2$", (_item select 0) call _callFunction, _item select 1];
	} else {
		hint parseText "<t color='#CC3300'>No cash, no bussines</t>";
	};	
};

waitUntil { !isNil "dzn_fnc_gear_editMode_getBoxGear" };
dzn_getSummOfBoxItems = {
	// _box call dzn_getSummOfBoxItems
	private["_box"];
	_box = _this;
	
	_boxKit = _box call dzn_fnc_gear_editMode_getBoxGear;
	_boxItems = (_boxKit select 0) + (_boxKit select 1) + (_boxKit select 2) + (_boxKit select 3);
	_summ = 0;
	_count = 0;
	
	{
		_cost = 20;
		_item = _x;	// [classname, count]
		
		{
			// _x = [classname, price]
			if (_item select 0 == _x select 0) then {
				_cost = round((_x select 1) * 0.13);
			};
		} forEach marketBox_roster;
		
		_summ = _summ + _cost;
		_count = _count + (_item select 1);
	} forEach _boxItems;
	
	[_summ, _count]
};

dzn_updateMarketSellAction = {
	private ["_actionID"];
	_actionID = _this getVariable "act_sell";
	_this setUserActionText [ 
		_actionID,
		format [
			"<t color='#99CC00'>Sell</t> %1 <t color='#99CC00'>items for</t> %2$",
			(_box call dzn_getSummOfBoxItems) select 1, (_box call dzn_getSummOfBoxItems) select 0
		]
	];
};
	
if (isServer || isDedicated) then {
	// Market:
	marketStore setVariable ["store", 
		[
			["hgun_Pistol_heavy_02_F",1]
			
			,["hgun_PDW2000_F", 3]
			,["SMG_01_F",1]
			,["SMG_02_F",1]
			
			,["arifle_TRG20_F",1]
			
			,["30Rnd_556x45_Stanag",10]
			,["30Rnd_9x21_Mag",10]
			,["SatchelCharge_Remote_Mag", 3]
		
			,["ItemMap",4]
			,["FirstAidKit",1]
		
			,["H_Cap_oli",2]
			,["H_Cap_blk",1]
			,["H_Cap_tan",1]
			,["V_TacVest_oli", 			1]
			,["V_PlateCarrierIA1_dgtl",	1]
			,["G_Spectacles_Tinted", 	2]
			,["U_B_CTRG_3",		1]
			,["U_I_CombatUniform_shortsleeve",		1]
		],
		true
	];
};

marketBox_SMG_w = [
	["hgun_Pistol_heavy_02_F",	1300]
	,["hgun_PDW2000_F",			1000]
	,["SMG_01_F",				1500]
	,["SMG_02_F",				2300]		
];

marketBox_AssRifles_w = [
	["arifle_TRG20_F",			4000]
];

marketBox_Ammo_w = [
	["30Rnd_556x45_Stanag",		75]
	,["30Rnd_9x21_Mag",			50]
	,["SatchelCharge_Remote_Mag", 300]
];	

marketBox_Items_w = [
	["ItemMap",					100]
	,["FirstAidKit",			250]
];

marketBox_Equip_w = [
	["H_Cap_oli",				200]
	,["H_Cap_blk",				300]
	,["H_Cap_tan",				150]
	,["V_TacVest_oli", 			400]
	,["V_PlateCarrierIA1_dgtl",	500]
	,["G_Spectacles_Tinted", 	500]
	,["U_B_CTRG_3",				100]
	,["U_I_CombatUniform_shortsleeve",		100]
];

marketBox_roster = marketBox_SMG_w + marketBox_AssRifles_w + marketBox_Ammo_w + marketBox_Items_w + marketBox_Equip_w;
	
	// Market:
waitUntil {!isNil {marketStore getVariable "store"}};
{
	_box = _x;
	_boxName = switch str(_box) do {			
		case "marketBox_SMG": 			{"Sub-Machine Guns and Pistols"};
		case "marketBox_AssRifles": 	{"Assault Rifles"};
		case "marketBox_Ammo": 			{"Ammunition"};
		case "marketBox_Items": 		{"Items"};
		case "marketBox_Equip": 		{"Equipmenet"};
		case "marketBox_sale": 			{"Place items inside to sell"};
	};
	
	_x setVariable ["tag", 
		_x addAction ["", "", "", 0, false, false, "", 
			format ["_dist = (_this distance _target) / 15;
			_color = getArray (configFile/'CfgInGameUI'/'SideColors'/'colorFriendly');_color set [3, 1 - _dist];drawIcon3D ['',_color,
			[visiblePosition _target select 0,visiblePosition _target select 1,(visiblePosition _target select 2) + ((_target modelToWorld (_target selectionPosition 'head')) select 2) + 0.6 + _dist / 1.5],
			0,0,0,
			'%1',
			2,0.03,'PuristaMedium'];false", _boxName]
		]
	];
	
	switch str(_box) do {
		case "marketBox_SMG": {
			{
				_box setVariable [
					format["act_marketBox_SMG_%1", _forEachIndex]
					,_box addAction [
						format [
							"<t color='#99CC00'>Buy</t> %1 <t color='#99CC00'>[%2$, %3 left]</t>", 
							((_x select 0) call dzn_getWeaponDisplayName),_x select 1,(_x select 0) call dzn_getStoredItemCount
						]
						,{							
							[(_this select 0), (_this select 3 select 0), "wep"] call dzn_sellStoredItem;
						}
						,[_x],6,false,true,"",format ["(_this distance _target < 5) && (('%1') call dzn_getStoredItemCount > 0)",_x select 0]
					]
				];
			} forEach marketBox_SMG_w;
		};		
		case "marketBox_AssRifles": {
			{
				_box setVariable [
					format["act_marketBox_AssRifles_%1", _forEachIndex]
					,_box addAction [
						format [
							"<t color='#99CC00'>Buy</t> %1 <t color='#99CC00'>[%2$, %3 left]</t>", 
							((_x select 0) call dzn_getWeaponDisplayName),_x select 1,(_x select 0) call dzn_getStoredItemCount
						]
						,{	
							[(_this select 0), (_this select 3 select 0), "wep"] call dzn_sellStoredItem;
						}
						,[_x],6,false,true,"",format ["(_this distance _target < 5) && (('%1') call dzn_getStoredItemCount > 0)",_x select 0]
					]
				];
			} forEach marketBox_AssRifles_w;		
		};
		case "marketBox_Ammo": {
			{
				_box setVariable [
					format["act_marketBox_Ammo_%1", _forEachIndex]
					,_box addAction [
						format [
							"<t color='#99CC00'>Buy</t> %1 <t color='#99CC00'>[%2$, %3 left]</t>", 
							((_x select 0) call dzn_getMagazineDisplayName),_x select 1,(_x select 0) call dzn_getStoredItemCount
						]
						,{	
							[(_this select 0), (_this select 3 select 0), "mag"] call dzn_sellStoredItem;
						}
						,[_x],6,false,true,"",format ["(_this distance _target < 5) && (('%1') call dzn_getStoredItemCount > 0)",_x select 0]
					]
				];
			} forEach marketBox_Ammo_w;		
		};		
		case "marketBox_Items": {
			{
				_box setVariable [
					format["act_marketBox_Items_%1", _forEachIndex]
					,_box addAction [
						format [
							"<t color='#99CC00'>Buy</t> %1 <t color='#99CC00'>[%2$, %3 left]</t>", 
							((_x select 0) call dzn_getEuipDisplayName),_x select 1,(_x select 0) call dzn_getStoredItemCount
						]
						,{	
							[(_this select 0), (_this select 3 select 0), "itm"] call dzn_sellStoredItem;
						}
						,[_x],6,false,true,"",format ["(_this distance _target < 5) && (('%1') call dzn_getStoredItemCount > 0)",_x select 0]
					]
				];
			} forEach marketBox_Items_w;		
		};
		
		
		case "marketBox_Equip": {
			{
				_box setVariable [
					format["act_marketBox_Equip_%1", _forEachIndex]
					,_box addAction [
						format [
							"<t color='#99CC00'>Buy</t> %1 <t color='#99CC00'>[%2$, %3 left]</t>", 
							((_x select 0) call dzn_getEuipDisplayName),_x select 1,(_x select 0) call dzn_getStoredItemCount
						]
						,{	
							[(_this select 0), (_this select 3 select 0), "itm"] call dzn_sellStoredItem;
						}
						,[_x],6,false,true,"",format ["(_this distance _target < 5) && (('%1') call dzn_getStoredItemCount > 0)",_x select 0]
					]
				];
			} forEach marketBox_Equip_w;		
		};	
		case "marketBox_sale": {
			_box setVariable [
				"act_sell"
				, _box addAction [
					format [
						"<t color='#99CC00'>Sell</t> %1 <t color='#99CC00'>items for</t> %2$", 
						(_box call dzn_getSummOfBoxItems) select 1, (_box call dzn_getSummOfBoxItems) select 0
					]
					,{						
						_boxOutput = (_this select 0) call dzn_getSummOfBoxItems;
						
						[(_this select 0), "emptyBox", true] call dzn_fnc_gear_assignKit;
						pmc_accountCash = pmc_accountCash + (_boxOutput select 0);
						publicVariable "pmc_accountCash";
						
						hint "Selled!";
					}
				]	
			];
		};
	};
} forEach (synchronizedObjects marketPlaceBoxes);

[] execFSM "missionFlow\marketLoop.fsm";
