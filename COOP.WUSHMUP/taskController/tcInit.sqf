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
"mrk_task" setMarkerText (localize "STR_markerText");

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


// *********** Assigning Squads for Points ******
waitUntil { !isNil "dzn_ra_assignmentComplete" };

if (dzn_assignedSquads isEqualTo []) exitWith {};

private["_toExecute","_posASL","_squadStep","_unitPosASL","_deploymentPoint"];


tc_deploymentAssignment = [];
_toExecute = "";
switch (true) do {
	case (count dzn_assignedSquads < 4): { _toExecute = "tc_deploymentPoints select _forEachIndex"; };
	case (count dzn_assignedSquads > 3): { _toExecute = "tc_deploymentPoints select (floor (_forEachIndex / 2))"; };
};

{
	call compile format [
		"_deploymentPoint = %1;"
		_toExecute
	];
	
	// Assign deployment point for [squadId, object]
	tc_deploymentAssignment pushBack [_x select 0, _deploymentPoint];
	
	// Move units to point
	_posASL = getPosASL _deploymentPoint;
	_squadStep = if (_forEachIndex % 2 == 0) then { 8 } else { 0 };
	
	{
		_unitPosASL = [
			(_posASL select 0) + _forEachIndex*1.2,
			(_posASL select 1) - _squadStep,
			_posASL select 2
		];
		_x setPosASL _unitPosASL;
		_x setVelocity [0,0,0];
	} forEach (_x select 1);
} forEach dzn_assignedSquads;
