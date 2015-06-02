// ********** Set Ups ********************
tc_taskTitle 			= localize "STR_taskTitle";
tc_taskDescription		= localize "STR_taskDescription";

// ***************************************
// ********** Server Side ****************
// ***************************************

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
	tc_deploymentPoints = synchronizedObjects tc_activeTaskTrigger;
	{
		if (_x isKindOf "ModuleTaskSetState_F") exitWith { tc_deploymentPoints = tc_deploymentPoints - [_x]; };
	} forEach tc_deploymentPoints;

	if (tc_deploymentPoints isEqualTo []) exitWith { hint "tcIit: No deployment points found!"; };
	publicVariable "tc_deploymentPoints";



// *********** Assigning Squads for Points ******
waitUntil { !isNil "dzn_ra_assignmentComplete" && !isNil "tc_deploymentPoints" };
sleep 2;

if (dzn_assignedSquads isEqualTo []) exitWith {};

private[
	"_getMarkerText","_getPoint","_markerId","_markerText",
	"_posASL","_squadStep","_unitPosASL","_deploymentPoint"
];

tc_deploymentAssignment = [];
_getMarkerText = "";
_getPoint = "";
_getMarkerId = 0;
dzn_tc_markersInitialPositions = [];
for "_i" from 0 to 2 do {
	dzn_tc_markersInitialPositions = dzn_tc_markersInitialPositions + [ call compile format ["getMarkerPos 'mrk_startPos_%1'",_i] ];
};
publicVariable "dzn_tc_markersInitialPositions";

switch (true) do {
	case (count dzn_assignedSquads < 4): { 
		_getPoint = "tc_deploymentPoints select _forEachIndex"; 		
		_getMarkerId = {_this};
	};
	case (count dzn_assignedSquads > 3): { 
		_getPoint = "tc_deploymentPoints select (floor (_forEachIndex / 2))";
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

{	
	// Assign deployment point for [squadId, object]
	_deploymentPoint = call compile _getPoint;	
	
	
	// Move units to point
	_posASL = getPosASL _deploymentPoint;
	
	_markerId = _forEachIndex call _getMarkerId;
	
	if (markerText (format ["mrk_startPos_%1", _markerId]) == "") then {		
		_markerText = if ( count dzn_assignedSquads < 4 ) then {
			// 3 x 1 points
			format ["%1 %2", localize "STR_marker_deploymentText", GET_SQNAME_BY_ID(_forEachIndex)];
		} else {
			if ( (count dzn_assignedSquads == 5) && _forEachIndex == 4 ) then {
				// 2 x 2 + 1 x 1 points
				format ["%1 %2", localize "STR_marker_deploymentText", GET_SQNAME_BY_ID(_forEachIndex)];
			} else {
				// 3 x 2 points
				format [
					"%1 %2 %3 %4",
					localize "STR_marker_deploymentText",
					GET_SQNAME_BY_ID(_forEachIndex),					
					localize "STR_marker_deploymentAndText",
					GET_SQNAME_BY_ID(_forEachIndex + 1)					
				];				
			};
		};
		
		call compile format [
			"'mrk_startPos_%1' setMarkerPos _posASL;
			'mrk_startPos_%1' setMarkerText '%2';",
			_markerId,
			_markerText
		];	
		
		tc_deploymentAssignment pushBack [_x select 0, _deploymentPoint, format ["mrk_startPos_%1", _markerId], _markerText];
	};	
} forEach dzn_assignedSquads;

publicVariable "tc_deploymentAssignment";


};

// ***************************************
// ************* Client Side *************
// ***************************************

if (hasInterface) then {
	// ********** Set Marker *****************

	waitUntil {!isNil "tc_activeTaskTrigger" && time > 0 };
	
	if (isNil "tc_completeArea") then { tc_completeArea = [tc_activeTaskTrigger, false] call dzn_fnc_convertTriggerToLocation; };
	
	"mrk_task" setMarkerPosLocal (position tc_completeArea);
	"mrk_task" setMarkerText (localize "STR_marker_taskText");

	"mrk_taskArea" setMarkerPosLocal (position tc_completeArea);
	"mrk_taskArea" setMarkerDir (direction tc_completeArea);

	waitUntil { !isNil "tc_deploymentAssignment" };

	{
		// @Squad, @Point, @Marker, @MarkerText
		_squadOnPointId = 0;
		
		_unitPosASL = [];
		_posASL = _x select 1;		
		_squad = [dzn_assignedSquads, _x select 0] call dzn_fnc_getValueByKey;
		
		{
			_unitPosASL = [
				(_posASL select 0) + _forEachIndex*1.2,
				(_posASL select 1) + _squadOnPointId*8 - (_forEachIndex call {if (_this > 1) then { 2.5 } else { 0 }}),
				_posASL select 2
			];		
		} forEach _squad;
		
		
		player setPosASL _unitPosASL;
		player setVelocity [0,0,0];
	} forEach tc_deploymentAssignment;
	
	
	
	
	
	// Hide unused markers
	for "_i" from 0 to 2 do {
		call compile format [
			"if ((getMarkerPos 'mrk_startPos_%1') in dzn_tc_markersInitialPositions) then {
				'mrk_startPos_%1' setMarkerAlpha 0;
			}
			"
			,_i
		]
	};

	// Moving CO to the first start pos
	if (!isNil "dzn_ra_co" && { player == dzn_ra_co } ) then {		
		dzn_ra_co setPos [(getMarkerPos "mrk_startPos_0" select 0), (getMarkerPos "mrk_startPos_0" select 1) - 10, 0];
	};

};
