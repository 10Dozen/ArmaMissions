
// Role Assignement: Display
[] spawn dzn_fnc_showAssignment;

// Role Assignement: Gear
[] spawn {
	waitUntil { !isNil {player getVariable "raRoleId"} };
	sleep 1;
	[
		player,
		format [
			"kit_%1_%2",
			[dzn_kitToFactionMapping, par_playableFaction] call dzn_fnc_getValueByKey,
			[dzn_kitToRoleMapping, player getVariable "raRoleId"] call dzn_fnc_getValueByKey
		],
		false
	] call dzn_fnc_gear_assignKit;		
};

// Mission Flow
[] spawn {
	waitUntil { !isNil "dzn_ra_assignmentComplete" };
	
	call dzn_fnc_addORBATSubject;		
	call dzn_fnc_addCommandPersonnelSubject;
	
	sleep 4;
	call dzn_fnc_showCommandingStaffHint;
	sleep 6;		
	call dzn_fnc_showORBATHint;	
	
	["TaskAssigned",["",localize "STR_taskTitle"]] call BIS_fnc_showNotification;
	
	// win Timer Handler
	[] spawn {
		waitUntil { !isNil "dzn_fnc_showWinTimer" && !isNil "KK_fnc_onEachFrame" };
		waitUntil { !isNil "dzn_captureTimer" && !isNil "dzn_inCapture" };
		
		dzn_winTimerIsShown = false;	
		{
			if (dzn_inCapture) then {
				if !(dzn_winTimerIsShown) then {
					call dzn_fnc_showWinTimer;
					dzn_winTimerIsShown = true;
				};
			} else {
				1015 cutText ["","PLAIN"];
				dzn_winTimerIsShown = false;
			};	
		} call KK_fnc_onEachFrame;
		
		waitUntil { !(dzn_captureTimer > 0) };
		["TaskSucceeded",["",localize "STR_taskTitle"]] call BIS_fnc_showNotification;
	};
	
	// end Timer Handler
	[] spawn {
		waitUntil { !isNil "dzn_fnc_showEndTimer" };
		
		waitUntil { time > (par_endTime*60)/2 };
		20 spawn dzn_fnc_showEndTimer;
		
		waitUntil { time > (par_endTime - 1)*60 };
		[] spawn dzn_fnc_showEndTimer;	
		
		waitUntil { time > par_endTime };
		["TaskFailed",["",localize "STR_taskTitle"]] call BIS_fnc_showNotification;
	};
};	
