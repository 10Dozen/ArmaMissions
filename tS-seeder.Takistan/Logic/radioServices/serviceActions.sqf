dzn_fnc_addSelfInteractionAction = {
	// [@Domain,@Id, @Name, @Code, @Condition] call dzn_fnc_addSelfInteractionAction
	private ["_action"];
	_action = [ 
		_this select 1
		, _this select 2
		, ""
		, _this select 3
		, _this select 4
	] call ace_interact_menu_fnc_createAction;
	
	[
		typeOf player
		, 1
		, [ "ACE_SelfActions", _this select 0 ]
		, _action 
	] call ace_interact_menu_fnc_addActionToClass;
};

dzn_fnc_addRadioService = {
	// [@Id, @Name, @Code, @Condition] call dzn_fnc_addRadioService
	[
		"dzn_services_action"
		,_this select 0
		,_this select 1
		,_this select 2
		,_this select 3
	] call dzn_fnc_addSelfInteractionAction;
};

dzn_fnc_addRallypointAction = {
	// [@Id, @Name, @Code, @Condition] call dzn_fnc_addRallypointAction
	[
		"dzn_rp_action"
		,_this select 0
		,_this select 1
		,_this select 2
		,_this select 3
	] call dzn_fnc_addSelfInteractionAction;
};

radioServices_action = [ "dzn_services_action", "Radio", "", { }, {true}]  call ace_interact_menu_fnc_createAction; 
[typeOf player, 1, [ "ACE_SelfActions" ], radioServices_action ] call ace_interact_menu_fnc_addActionToClass;




// radioServices_hq_action = [ "dzn_services_hq_action", "HQ", "", { hint "HQ Radio!!!" }, {true}]  call ace_interact_menu_fnc_createAction; 
// [typeOf player, 1, [ "ACE_SelfActions", "dzn_services_action" ], radioServices_hq_action ] call ace_interact_menu_fnc_addActionToClass;

// radioServices_medevac_action = [ "dzn_services_medevac_action", "HUSTLER-2-1", "", { hint "MedEvac Radio!!!" }, {true}]  call ace_interact_menu_fnc_createAction; 
// [typeOf player, 1, [ "ACE_SelfActions", "dzn_services_action" ], radioServices_medevac_action ] call ace_interact_menu_fnc_addActionToClass;
