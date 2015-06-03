// Start simulations
[[], "dzn_unhideUnit", true] call BIS_fnc_MP;

// JIP 
[] spawn {
	waitUntil { !isNil "dzn_ra_assignmentComplete" };
	if ( isNil {player getVariable "raRoleId" }) then {
		dzn_playerIsJIP = true;
		private["_assignement"];
		_assignement = call dzn_fnc_ra_getNearestUnusedRole;
		[player, _assignement select 0, _assignement select 1] call dzn_fnc_ra_setRoleAttributes;
		publicVariable "dzn_assignedRoles";
		publicVariable "dzn_assignedSquads";
		
		_leader = [_assignement select 0, 10] call dzn_fnc_ra_getUnitBySquadAndRole;
		
		// Add to group
		if !(isNull _leader) then {
			[player] joinSilent (group _leader);
			
			// Set pos of leader			
			player setPosASL ([getPos _leader, 180, 8] call dzn_fnc_getPosOnGivenDir);
		} else {
			// Without leader
			player setPos (getMarkerPos "mrk_startPos_0");
		};
	};
};

// Role Assignement
[] spawn {
	waitUntil { !isNil {player getVariable "raRoleId"}};
	// Role Assignement: Display
	[] spawn dzn_fnc_showAssignment;
	
	// Group ID
	(group player) setGroupId (player getVariable "raSquad");
	
	// Gear
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
	
	// Set radios
	switch (par_radioMod) do {
		case 0: {};
		case 1: {
			// If LR - set LR freq
			if ( typename (player getVariable "raRoleId") != "STRING" && {player getVariable "raRoleId" == 10} ) then {
				[
					(call TFAR_fnc_activeLrRadio) select 0, 
					(call TFAR_fnc_activeLrRadio) select 1, 
					dzn_TFAR_lrFreq
				] call TFAR_fnc_setLrFrequency;
			};
			
			// Set SW Freq
			[
				(call TFAR_fnc_activeSwRadio), 
				[dzn_TFAR_swFreqs, player getVariable "raSquadId"] call dzn_getValueByKey;
			] call TFAR_fnc_setSwFrequency;
		};
	};
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
		sleep 3;
		[tc_activeTask, "Succeeded"] call BIS_fnc_taskSetState;
		// ["TaskSucceeded",["",localize "STR_taskTitle"]] call BIS_fnc_showNotification;
	};
	
	// end Timer Handler
	call dzn_fnc_addEndTimerSubject;
	[] spawn {
		waitUntil { !isNil "dzn_fnc_showEndTimer" };
		
		waitUntil { time > (par_endTime*60)/2 };
		20 spawn dzn_fnc_showEndTimer;
		
		waitUntil { time > (par_endTime - dzn_endTimerLimitValue)*60 };
		[] spawn dzn_fnc_showEndTimer;	
		
		waitUntil { time > (par_endTime*60)	};
		sleep 3;
		[tc_activeTask, "Failed"] call BIS_fnc_taskSetState;
		// ["TaskFailed",["",localize "STR_taskTitle"]] call BIS_fnc_showNotification;
	};
};	
