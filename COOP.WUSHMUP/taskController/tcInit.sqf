// ********** Set Ups ********************
tc_taskTitle 			= localize "STR_taskTitle";
tc_taskDescription		= localize "STR_taskDescription";


// ********** Choose Task ****************

if (isServer || isDedicated) then {
	private ["_taskList"];
	_taskList = entities "ModuleTaskCreate_F";

	tc_activeTaskModule = _taskList call BIS_fnc_selectRandom;
	tc_completeArea = [(synchronizedObjects tc_activeTaskModule select 0), false] call dzn_fnc_convertTriggerToLocation;	
	
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

[] spawn {
	
};

