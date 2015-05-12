// ********** Set Ups ********************
tc_taskTitle 			= localize "STR_taskTitle";
tc_taskDescription		= localize "STR_taskDescription";


// ********** Choose Task ****************

if (isServer || isDedicated) then {
	private ["_taskList"];
	_taskList = entities "ModuleTaskCreate_F";

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
};

// ********** Set Marker *****************

waitUntil { !isNil "tc_activeTask" && !isNil "tc_completeArea" };

"mrk_task" setMarkerPosLocal (position tc_completeArea);
"mrk_task" setMarkerText (localize "STR_marker_taskText");

"mrk_taskArea" setMarkerPosLocal (position tc_completeArea);
"mrk_taskArea" setMarkerDir (direction tc_completeArea);


// ********* Task Completion *************
{
	if (getPosASL player in tc_completeArea) then {
		[tc_activeTask, "SUCCEEDED", true] call BIS_fnc_taskSetState;
	};
} call KK_fnc_onEachFrame;


// ********* Get Positions For Squad Deployment ***
tc_deploymentPoints = synchronizedObjects tc_activeTaskTrigger;
{
	if (_x isKindOf "ModuleTaskCreate_F") exitWith { tc_deploymentPoints = tc_deploymentPoints - [_x]; };
} forEach tc_deploymentPoints;

if (tc_deploymentPoints isEqualTo []) exitWith { hint "tcIit: No deployment points found!"; };

// *********** Assigning Squads for Points ******
waitUntil { !isNil "dzn_ra_assignmentComplete" };
sleep 2;

if (dzn_assignedSquads isEqualTo []) exitWith {};

private["_getMarkerText","_getPoint","_markerText","_posASL","_squadStep","_unitPosASL","_deploymentPoint"];

tc_deploymentAssignment = [];
_getMarkerText = "";
_getPoint = "";
_getMarkerId = 0;

switch (true) do {
	case (count dzn_assignedSquads < 4): { 
		_getPoint = "tc_deploymentPoints select _forEachIndex"; 
		_getMarkerText = {
			format [
				"%1 %2",
				localize "STR_marker_deploymentText",
				[dzn_squadsMapping, _this] call dzn_fnc_getValueByKey
			];
		};
		_getMarkerId = {_this};
	};
	case (count dzn_assignedSquads > 3): { 
		_getPoint = "tc_deploymentPoints select (floor (_forEachIndex / 2))";
		_getMarkerText = {
			format [
				"%1 %2 %3 %4",
				localize "STR_marker_deploymentText",
				[
					dzn_squadsMapping,
					_this call {
						switch (true) do {
							case (_this in [0,1]): { 0 };
							case (_this in [2,3]): { 2 };
							case (_this in [4,5]): { 4 };
						};
					}
				] call dzn_fnc_getValueByKey,
				localize "STR_marker_deploymentAndText",
				[
					dzn_squadsMapping,
					_this call {
						switch (true) do {
							case (_this in [0,1]): { 1 };
							case (_this in [2,3]): { 3 };
							case (_this in [4,5]): { 5 };
						};
					}
				] call dzn_fnc_getValueByKey
			];
		};
		_getMarkerId = call {
			switch (true) do {
				case (_this in [0,1]): { 0 };
				case (_this in [2,3]): { 1 };
				case (_this in [4,5]): { 2 };
			};
		},
	};
};

{	
	// Assign deployment point for [squadId, object]
	_deploymentPoint = call compile _getPoint;	
	tc_deploymentAssignment pushBack [_x select 0, _deploymentPoint];
	
	// Move units to point
	_posASL = getPosASL _deploymentPoint;
	_squadStep = if (_forEachIndex % 2 == 0) then { 8 } else { 0 };	
	
	_markerText = _forEachIndex call _getMarkerText;
	call compile format [ 
		"'mrk_startPos_%1' setMarkerPos _posASL;
		'mrk_startPos_%1' setMarkerText '%2';",
		_forEachIndex call _getMarkerId,
		_markerText
	];
	
	{
		_unitPosASL = [
			(_posASL select 0) + _forEachIndex*1.2,
			(_posASL select 1) - _squadStep - (_forEachIndex call {if (_this > 1) then { 2.5 } else { 0 }}),
			_posASL select 2
		];
		_x setPosASL _unitPosASL;
		_x setVelocity [0,0,0];
	} forEach (_x select 1);
} forEach dzn_assignedSquads;
