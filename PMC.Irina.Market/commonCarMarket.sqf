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


{
	
	if (isNil {_x getVariable "vehicle"}) then {
		_car = _carList call BIS_fnc_selectRandom;	
		
		if (isServer || isDedicated) then {
			_veh = (_car select 0) createVehicle (getPos _x);
			_veh setDir (getDir _x);
			_veh lock 2;
			_x setVariable ["vehicle", [_veh, _car select 0, (_car select 0) call dzn_getVehicleDisplayName, _car select 1], true];
		};
	};
	
	waitUntil { !isNil {_x getVariable "vehicle"} };
	_veh = (_x getVariable "vehicle") select 0;
	_name = (_x getVariable "vehicle") select 2;
	_cost = (_x getVariable "vehicle") select 3;
	
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
	
	_veh setVariable [
		format["act_marketBox_Ammo_%1", _forEachIndex]
			,_veh addAction [
			format [
				"<t color='#99CC00'>Buy</t> %1 <t color='#99CC00'>for %2$</t>", 
				_name,_cost
			]
			,{	
				hint parseText format ["<t color='#99CC00'>Buyed</t> %1 <t color='#99CC00'>for</t> %2$"];
				(_this select 0) lock 0;
			}
			,[_name,_cost],6,false,true,"","(_this distance _target < 8)"
		]
	];
	
} forEach (synchronizedObjects carMarket);


