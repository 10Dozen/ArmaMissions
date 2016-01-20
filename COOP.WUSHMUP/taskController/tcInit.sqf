// ********** Set Ups ********************
tc_taskTitle 			= localize "STR_taskTitle";
tc_taskDescription		= localize "STR_taskDescription";

private ["_groupStart_pointClass"];
_groupStart_pointClass = "LocationRespawnPoint_F";


waitUntil { time > 1 };

// ********** Choose Task ****************
if (isServer || isDedicated) then {
	private ["_taskList"];
	_taskList = entities "ModuleTaskSetState_F";

	tc_activeTaskModule = _taskList call BIS_fnc_selectRandom;
	tc_activeTaskTrigger = synchronizedObjects tc_activeTaskModule select 0;
	tc_completeArea = [tc_activeTaskTrigger, false] call dzn_fnc_convertTriggerToLocation;	
	
	tc_activeTask = [
		"activeTask", 
		true, 
		[tc_taskDescription, tc_taskTitle, tc_taskTitle], 
		position tc_completeArea, 
		"ASSIGNED",
		1,
		false,
		true,
		"", 
		true
	] call BIS_fnc_setTask;
	
	publicVariable "tc_activeTask";
	publicVariable "tc_activeTaskModule";
	publicVariable "tc_activeTaskTrigger";
	publicVariable "tc_completeArea";
	
	// Selecting all DYNAI zones
	[] execVM "taskController\tcDynaiZonesSetUp.sqf";
	
	// Start to watch for Capturing zone
	[] spawn { 
		waitUntil { (time > 10) && !isNil "dzn_captureTimerDefault" };
		[] execFSM "taskController\tcCaptureZone.fsm";
	};
		
	// ********* Get Positions For Squad Deployment ***
	waitUntil { !isNil "tc_activeTaskTrigger" };
	tc_deploymentPoints = [];
	{
		if (_x isKindOf _groupStart_pointClass) then { tc_deploymentPoints pushBack _x };
	} forEach (synchronizedObjects tc_activeTaskTrigger);

	if (tc_deploymentPoints isEqualTo []) exitWith { hint "tcIit: No deployment points found!"; };
	publicVariable "tc_deploymentPoints";
};



// ********** Set Marker *****************

waitUntil { !isNil "tc_activeTask" && !isNil "tc_activeTaskTrigger" };


if (hasInterface && !isServer) then {
	tc_completeArea = [tc_activeTaskTrigger, false] call dzn_fnc_convertTriggerToLocation;	
};

waitUntil {!isNil "tc_completeArea"};
"mrk_task" setMarkerPos (position tc_completeArea);
"mrk_task" setMarkerTextLocal (localize "STR_marker_taskText");
"mrk_taskArea" setMarkerPos (position tc_completeArea);
"mrk_taskArea" setMarkerDir (direction tc_completeArea);


// *********** Assigning Squads for Points ******
waitUntil { !isNil "dzn_ra_assignmentComplete" && !isNil "tc_deploymentPoints" };
sleep 2;
if ( !isNil "dzn_playerIsJIP"  ) exitWith {};

private[
	"_getMarkerText","_getPoint","_markerId","_markerText","_markersInitialPositions",
	"_posASL","_squadStep","_unitPosASL","_deploymentPoint"
];

tc_deploymentAssignment = [];
// _getMarkerText = "";
_getPoint = "";
_getMarkerId = 0;
_markersInitialPositions = [];
for "_i" from 0 to 2 do {
	_markersInitialPositions = _markersInitialPositions + [ call compile format ["getMarkerPos 'mrk_startPos_%1'",_i] ];
};

switch (true) do {
	case (count dzn_assignedSquads < 4): { 
		_getPoint = "tc_deploymentPoints select _index"; 		
		_getMarkerId = {_this};
	};
	case (count dzn_assignedSquads > 3): { 
		_getPoint = "tc_deploymentPoints select (floor (_index / 2))";
		_getMarkerId = {
			switch (true) do {
				case (_this in [0,1]): { 0 };
				case (_this in [2,3]): { 1 };
				case (_this in [4,5]): { 2 };
			};
		},
	};
};

#define	GET_SQNAME_BY_ID(X)	[dzn_squadsMapping, X] call dzn_fnc_getValueByKey

private["_squads","_index"];
{		
	if (_forEachIndex > 0 && { !isNull (_x select 0 select 1) }) then {	
		_index = _forEachIndex - 1;
		
		// Assign deployment point for [squadId, object]
		_deploymentPoint = call compile _getPoint;	
		tc_deploymentAssignment pushBack [_x select 0, _deploymentPoint];		
		
		// Move units to point
		_posASL = getPosASL _deploymentPoint;
		_squadStep = if (_index % 2 == 0) then { 8 } else { 0 };	
		_markerId = _index call _getMarkerId;		
		
		if (markerText (format ["mrk_startPos_%1", _markerId]) == "") then {		
			_markerText = if ( count dzn_assignedSquads < 4 ) then {
				// 3 x 1 points
				format ["%1 %2", localize "STR_marker_deploymentText", GET_SQNAME_BY_ID(_index)];
			} else {
				if ( (count dzn_assignedSquads == 5) && _index == 4 ) then {
					// 2 x 2 + 1 x 1 points
					format ["%1 %2", localize "STR_marker_deploymentText", GET_SQNAME_BY_ID(_index)];
				} else {
					// 3 x 2 points
					format [
						"%1 %2 %3 %4",
						localize "STR_marker_deploymentText",
						GET_SQNAME_BY_ID(_index),					
						localize "STR_marker_deploymentAndText",
						GET_SQNAME_BY_ID(_index + 1)					
					];				
				};
			};
			
			call compile format [
				"'mrk_startPos_%1' setMarkerPos _posASL;
				'mrk_startPos_%1' setMarkerText '%2';",
				_markerId,
				_markerText
			];	
		};	
	
		{
			if (hasInterface && { player == _x }) then {
				_unitPosASL = [
					(_posASL select 0) + _index*1.2,
					(_posASL select 1) + _squadStep - (_index call {if (_this > 1) then { 2.5 } else { 0 }}),
					_posASL select 2
				];
				_x setPosASL _unitPosASL;
				_x setVelocity [0,0,0];
			};
		} forEach (dzn_assignedSquads select _index select 1);	
	};
} forEach dzn_assignedRoles;

// Hide unused markers
for "_i" from 0 to 2 do {
	call compile format [
		"if (((getMarkerPos 'mrk_startPos_%1') select 0 > 500) && ((getMarkerPos 'mrk_startPos_%1') select 1 > 500)) then {
			'mrk_startPos_%1' setMarkerAlpha 1;
		} else {
			'mrk_startPos_%1' setMarkerAlpha 0;
		};
		"
		,_i
	]
};

// Moving CO to the first start pos
if (!isNil "dzn_ra_co") then {
	if (hasInterface && {player == dzn_ra_co} ) then {
		dzn_ra_co setPos [(getMarkerPos "mrk_startPos_0" select 0), (getMarkerPos "mrk_startPos_0" select 1) - 10, 0];
	};
};
