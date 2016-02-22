MEV_unit		= objNull;	// objNull if spawned on call OR unit name
MEV_classname	= "";
MEV_callsign	=	"HUSTLER 1-1";
MEV_returnPoint	= [0,0,0]; // position of landing point

MEV_nineline_mapping = [
	[1, ["1. Grid", []]]
	,[2, ["2. Frequency, Callsign", []]]
	,[3, ["3. Precendence",[
		"A - Urgent"
		,"B - Urgent Surgical"
		,"C - Priority"
		,"D - Routine"
		,"E - Convenience"
		]]
	]
	,[4, ["4. Special equipment", ["A - None","B - Hoist", "C - Extraction Equipment", "D - Ventilator"]]]
	,[5,["5. Number of Patients", []]]
	,[6,["6. Security at LZ", ["N - No Enemy", "P - Possible Enemy", "E - Enemy in Area", "X - Armed escort required"]]]
	,[7,["7. Method of Marking LZ",["A - Panels", "B - Pyrotechinc Signal", "C - Smoke signal", "D - None", "E - Other"],3]]
	,[8,["8. Patient nationality and status", ["A - Military", "B - Non-ilitary", "C - Local military", "D - Local civilian", "E - EPW"]]]
	,[9,["9. NBC Combination", ["---"]]]
]

if (isServer) then {
	if (!isNull MEV_unit) then {
		(group MEV_unit) setGroupdId [MEV_callsign];
		MEV_unit setVariable ["mevRequested", false, true];
		MEV_unit setVariable ["mevRequestedLines", [], true];
		
		{
			_x disableAI "TARGET";
			_x disableAI "AUTOTARGET";
			_x disableAI "SUPPRESSION";
			_x disableAI "AIMINGERROR";
			_x disableAI "COVER";
			_x disableAI "AUTOCOMBAT";
		} forEach (units (group MEV_unit));
	};


	MEV_Land_Position = [5864.39,11351.1,0];
	publicVariable "MEV_Land_Position";
	mevObject = createVehicle  ["Land_HelipadSquare_F", MEV_Land_Position, [], 0, "NONE"];
	mevObject enableSimulation false;
	
	// Move Rallypoint
	"MEV_Land_Position" addPublicVariableEventHandler {
		mevObject setPos MEV_Land_Position;
	};	
};

if !(hasInterface) exitWith {};
[] spawn {
	if (isNull MEV_unit) exitWith {};
	MEV_unit addAction [
		"Talk to Pilot"
		, { hint "Pilot is talked"; }
	];
};

// SET UP MENU CHECKER
[] spawn {
	player setVariable ["mevRequested", false, true];
	player setVariable ["mevRequestBy", objNull, true];
	player setVariable ["mevRequestAccepted", false];
	
	// Leader requests loop
	["MEV_Leader_Menu_Check", "onEachFrame", {
		if (player == (leader player) && {player getVariable "mevRequested"} ) then {		
			[] call dzn_fnc_mev_showRequestMenu;
		};		
	}] call BIS_fnc_addStackedEventHandler;
	
	// Player accepted loops
	["MEV_Request_Check", "onEachFrame", {
		if (player getVariable "mevRequestAccepted") then {
			// MEV_Land_Position spawn dzn_fnc_rp_safeMove;
			player setVariable ['mevRequestAccepted', false];
		};		
	}] call BIS_fnc_addStackedEventHandler;
};

// FUNCTIONS
dzn_fnc_mev_showRequestMenu = {
	// @Unit call dzn_fnc_rp_showRequestMenu
	[west,"HQ"] commandChat format ["MEV is called by %1", name (player getVariable 'mevRequestBy')];
	mev_menu = [
		[format ["MEV Request by %1", name (player getVariable 'mevRequestBy')] ,false],
		["Accept", [2], "", -5, [["expression", "(player getVariable 'mevRequestBy') setVariable ['mevRequestAccepted', true, true];"]], "1", "1"],
		["Decline", [3], "", -5, [["expression", "(player getVariable 'mevRequestBy')  setVariable ['mevRequestAccepted', false, true];"]], "1", "1"]
	];
	showCommandingMenu "#USER:mev_menu";
	
	player setVariable ["mevRequested", false, true];
};

dzn_fnc_mev_callDialog = {

		private _dialogOptions = []
		for "_i" from 1 to 9 do { _dialogOptions pushBacl ([MEV_nineline_mapping, _i] call dzn_fnc_getValueByKey) };
		private _dialogResult =	["MEV - Request", _dialogOptions] call dzn_fnc_ShowChooseDialog;
	
		if (count _dialogResult == 0) exitWith { player sideChat format ["%1, this is 1'1, cancel. Out.", MEV_callsign]; };
		
		_dialogResult call dzn_fnc_mev_addRequestTopic;
		_dialogResult call dzn_fnc_mev_callMEV;
};

dzn_fnc_mev_addRequestTopic = { hint "MEV topic added"; };
dzn_fnc_mev_callMEV = {
	if (isNull MEV_unit) exitWith { _this call dzn_fnc_mev_spawnMEV; };
	
	/*
		1. Set WP
		2. DoMove
		3. Land
		4. Add Action (?)
		5. Return to base
		6. 
	
	*/

	
};














// FUNCTIONS
dzn_fnc_rp_setRallypoint = {
	RallyPoint_Position = getPos player;
	publicVariable "RallyPoint_Position";
};

dzn_fnc_rp_checkPlayerAtBase = {
	[getPosASL player, rpAllowedAreas] call dzn_fnc_isInLocation
	&& [RallyPoint_Position,  rpAllowedAreas] call dzn_fnc_isInLocation
};

dzn_fnc_rp_safeMove = {
	// @Pos call dzn_fnc_rp_safeMove	
	1000 cutText ["","BLACK OUT",1];
	player allowDamage false;
	sleep 2; 
	moveOut player;
	player setVelocity [0,0,0];
	player setPos _this;
	player allowDamage true; 
	1000 cutText ["","BLACK IN",1];
};

dzn_fnc_rp_moveToRallypoint = {
	if (call dzn_fnc_rp_checkPlayerAtBase) then {
		// Move instantly if in allowed zones
		RallyPoint_Position spawn dzn_fnc_rp_safeMove;
	} else {
		// Exit if leader already have request
		if ((leader player) == player) exitWith { player setVariable ['rpRequestAccepted', true, true] };	
		if ((leader player) getVariable "rpRequested") exitWith {};
	
		// Show comanding menu
		player setVariable ["rpRequestAccepted", false];
		(leader player) setVariable ["rpRequested", true, true];
		(leader player) setVariable ["rpRequestBy", player, true];
	};
};


// SELF-INTERACTION
waitUntil { !isNil "dzn_fnc_addRadioService" && !isNil "dzn_fnc_addRallypointAction" };

rp_action = [ "dzn_rp_action", "Rallypoint", "", { }, {true}]  call ace_interact_menu_fnc_createAction; 
[typeOf player, 1, [ "ACE_SelfActions" ], rp_action ] call ace_interact_menu_fnc_addActionToClass;

["dzn_rp_action_moveTo", "Move To RP", { call dzn_fnc_rp_moveToRallypoint }, {true}] call dzn_fnc_addRallypointAction;
["dzn_rp_action_set", "Set Rallypoint", { call dzn_fnc_rp_setRallypoint }, {player == (leader player)}] call dzn_fnc_addRallypointAction;



