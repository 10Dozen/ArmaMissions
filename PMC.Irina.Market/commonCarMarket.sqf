_carList = [
	["C_Offroad_01_F", 8000]
	,["C_Quadbike_01_F",1000]
	,["C_Hatchback_01_F",4000]
	,["C_SUV_01_F",10000]
	,["C_Van_01_transport_F", 6000]
];

dzn_getVehicleDisplayName = {
	private ["_cfg","_output","_item"];		
	_cfgVehicles = ("isclass _x") configclasses (configfile >> "cfgVehicles");
	_output = "";
	
	for "_i" from 0 to (count _cfgVehicles)-1 do {
		_item = _cfgVehicles select _i;			
		if (  configName(_item) == _this ) then {
			_output = getText(configFile >> "cfgVehicles" >> configName(_item) >> "displayName");
		};
	};
	_output
};

["carMarketLoop", "onEachFrame", {
	if (round(time) % 10 == 0) then {
		{
			if (isNil {_x getVariable "vehicle"} /* AND NO NEARBY PLAYERS */) then {
				if (isServer || isDedicated) then {
					_car = _carList call BIS_fnc_selectRandom;
					_veh = (_car select 0) createVehicle (getPos _x);
					_veh setDir (getDir _x);
					_veh lock 2;
					_veh setVariable ["onSale", true, true];
					_veh setVariable ["marketCarSlot", _x, true];
					_x setVariable ["vehicle", [_veh, _car select 0, (_car select 0) call dzn_getVehicleDisplayName, _car select 1], true];
				};
			} else {
				_veh = (_x getVariable "vehicle") select 0;
				_name = (_x getVariable "vehicle") select 2;
				_cost = (_x getVariable "vehicle") select 3;
				
				if (_veh getVariable "onSale") then {
					// Adding TAG marker
					if (isNil { _veh getVariable "tag" } ) then {
						_veh setVariable["tag", 
							_veh addAction ["", "", "", 0, false, false, "", 
								format ["_dist = (_this distance _target) / 15;
								_color = getArray (configFile/'CfgInGameUI'/'SideColors'/'colorFriendly');_color set [3, 1 - _dist];drawIcon3D ['',_color,
								[visiblePosition _target select 0,visiblePosition _target select 1,(visiblePosition _target select 2) + ((_target modelToWorld (_target selectionPosition 'head')) select 2) + 0.6 + _dist / 1.5],
								0,0,0,
								'%1',
								2,0.03,'PuristaMedium'];false", _name]
							]
						];
					};
					
					// Adding BUY action
					if (isNil { _veh getVariable "buyAction" } ) then {
						_veh setVariable [
							format["act_marketCar_%1", _forEachIndex]
								,_veh addAction [
								format [
									"<t color='#99CC00'>Buy</t> %1 <t color='#99CC00'>for %2$</t>", 
									_name,_cost
								]
								,{	
									_veh = _this select 0;
									_name = _this select 3 select 0;
									_cost = _this select 3 select 1;
									
									hint parseText format [
										"<t color='#99CC00'>Buyed</t> %1 <t color='#99CC00'>for</t> %2$",
										_name, _cost
									];
									_veh lock 0;
									
							// ??		((-1) * _cost) call dzn_pmc_updateCash;
									_veh setVariable ["onSale", false, true];
									_veh spawn {
										waitUntil { _this distance (_this getVariable "marketCarSlot") > 50 /*AND NO PLAYERS NEARBY*/ };
										(_this getVariable "marketCarSlot") setVariable ["vehicle", nil, true];
									};
									
								}
								,[_name,_cost],6,false,true,"","(_this distance _target < 8)"
							]
						];
					};
					
					if (isNil { _veh getVariable "rentAction" } ) then {
				
					};
					
				} else {
					_veh setVariable ["onSale", nil, true];
				};
			};
		} forEach (synchronizedObjects carMarket);
	};
}] call BIS_fnc_addStackedEventHandler;
