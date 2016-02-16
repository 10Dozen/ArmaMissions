if (isServer) then {
	RallyPoint_Position = [0,0,0];
	publicVariable "RallyPoint_Position";
	rpObject = createVehicle  ["Class", RallyPoint_Position, [], 0, "NONE"];
	
	// Move Rallypoint
	"RallyPoint_Position" addPublicVariableEventHandler {
		rpObject setPos RallyPoint_Position;
	};	
};

if !(hasInterface) exitWith {};

// CREATE BASE AREA
rpAllowedAreas = [];
{
	rpAllowedAreas pushBack ([_x, false] call dzn_fnc_convertTriggerToLocation);
} forEach [areaTrg];

// SET UP MENU CHECKER
[] spawn {
	player setVariable ["rpRequested", false, true];
	player setVariable ["rpRequestBy", objNull, true];
	player setVariable ['rpRequestAccepted', false];
	
	// Leader requests loop
	["Rallypoint_Leader_Menu_Check", "onEachFrame", {
		if (player == (leader player) && {player getVariable "rpRequested"} ) then {		
			[] call dzn_fnc_rp_showRequestMenu;
		};		
	}] call BIS_fnc_addStackedEventHandler;
	
	// Player accepted loops
	["Rallypoint_Request_Check", "onEachFrame", {
		if (player getVariable "rpRequestAccepted") then {
			RallyPoint_Position call dzn_fnc_rp_safeMove;
			player setVariable ['rpRequestAccepted', false];
		};		
	}] call BIS_fnc_addStackedEventHandler;
};

// FUNCTIONS
dzn_fnc_rp_setRallypoint = {
	RallyPoint_Position = getPos player;
	publicVariable "RallyPoint_Position";
};

dzn_fnc_rp_showRequestMenu = {
	// @Unit call dzn_fnc_rp_showRequestMenu
	_menu = [
		[format ["Deploy %1", name (player getVariable 'rpRequestBy')] ,false],
		["Accept", [2], "", -5, [["expression", "(player getVariable 'rpRequestBy') setVariable ['rpRequestAccepted', true, true];"]], "1", "1"],
		["Decline", [3], "", -5, [["expression", "(player getVariable 'rpRequestBy')  setVariable ['rpRequestAccepted', false, true];"]], "1", "1"]
	];
	
	player setVariable ["rpRequested", false, true];
	player setVariable ["rpRequestBy", objNull, true];
};

dzn_fnc_rp_checkPlayerAtBase = {
	[getPosASL player, rpAllowedAreas] call dzn_fnc_isInLocation;
};

dzn_fnc_rp_safeMove = {
	// @Pos call dzn_fnc_rp_safeMove	
	1000 cutText ["","BLACK IN",1];
	player allowDamage false;
	moveOut player;
	player setVelocity [0,0,0];
	player setPos _this;
	[] spawn { 
		sleep 1; 
		player allowDamage true; 
		1000 cutText ["","BLACK OUT",1];
	};	
};

dzn_fnc_rp_moveToRallypoint = {
	if (dzn_fnc_rp_checkPlayerAtBase) then {
		// Move instantly if in allowed zones
		RallyPoint_Position call dzn_fnc_rp_safeMove;
	} else {
		// Exit if leader already have request
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




