dzn_task_tasks = {
	switch (_this) do {
		case 0: { "SADCache" };
	};
};

dzn_task_getDisplayName = {
	switch (_this) do {
		case 0: { ["SAD Weapon Cache", "Search and Destroy Weapon Cache"] };
	};

};

dzn_task_ranges = {
	switch (_this) do {
		case 0: { 0 }; //Anyrange
		case 1: { 1200 }; // Near		
		case 2: { 3000 };// Medium
		case 3: { 6000 };// Far
	};
};

//
//	**********************
//	TASK MANAGER	
//	**********************

dzn_fnc_TaskManager_init = {
	TaskManager_NewTask = false;
	if (isNil "taskPage") then {
		taskPage = "taskPage";
		player createDiarySubject [taskPage, "Rapier Tasks"];
	};
	
	["hq_service", "HQ", { [] spawn dzn_fnc_requestTask; }, {true}] call dzn_fnc_addRadioService;
	
	if !(isServer) exitWith {};	
	
	// @ActiveExist, @Type, @Presets, @TaskID
	missionNamespace setVariable [
		"dzn_taskManager"
		,  [ false, nil, nil, nil ]
		, true
	];	
	
	"TaskManager_NewTask" addPublicVariableEventHandler {		
		if (TaskManager_NewTask) then {
			_taskSettings = missionNamespace getVariable "dzn_taskManager";
			[(_taskSettings select 2), true] call compile preProcessFileLineNumbers format ["Logic\tasks\%1\task.sqf", (_taskSettings select 1) call dzn_task_tasks];	
		} else {
			// End task		
		};
	};	
};

dzn_fnc_TaskManager_setProperty = {
	// [@Property, @Value] call dzn_fnc_TaskManager_setProperty
	params["_prop","_val"];
	private "_id";
	
	_id = switch (_prop) do {
		case "active": { 0 };
		case "type": { 1 };
		case "presets": { 2 };
		case "task": { 3 };	
	};
	
	(missionNamespace getVariable "dzn_taskManager") set [_id, _val];
	missionNamespace setVariable ["dzn_taskManager", missionNamespace getVariable _taskId, true];
}

dzn_fnc_TaskManager_getProperty = {
	// @Property call dzn_fnc_TaskManager_getProperty
	params["_prop"];
	private "_id";	
	_id = switch (_prop) do {
		case "active": { 0 };
		case "type": { 1 };
		case "presets": { 2 };
		case "task": { 3 };	
	};
	(missionNamespace getVariable "dzn_taskManager") select _id
}


dzn_fnc_TaskManager_create = {
	// [@TaskType, @Presets] call dzn_fnc_TaskManager_create
	missionNamespace setVariable [
		"dzn_taskManager"
		, [ true, _this select 0, _this select 1, nil ]
		, true
	];	
	TaskManager_NewTask = true;
	publicVariableServer "TaskManager_NewTask";
};

dzn_fnc_TaskManager_isTaskActive = {
	(missionNamespace getVariable "dzn_taskManager") select 0
};

dzn_fnc_TaskManager_taskType = {
	(missionNamespace getVariable "dzn_taskManager") select 1
};

// TASK CONTROLS
dzn_fnc_requestTask = {
	private["_dialogResult"];
	// If NO Active Task -- show select task dialog
	// If Active task exist already -- show AAR task dialog

	if !( call dzn_fnc_TaskManager_isTaskActive ) then {
		player sideChat "1'6, this is 1'1, requesting new mission. Over.";
		_dialogResult =	[
			"HQ - Request Task",
			[
				["Task", ["SAD Weapon Cache"]]
				,["Location", ["All", "Near", "Medium", "Far"]]
			]
		] call dzn_fnc_ShowChooseDialog;
		if (count _dialogResult == 0) exitWith { player sideChat "1'6, this is 1'1, cancel. Out."; };
		
		_dialogResult call dzn_fnc_selectTask;
	} else {
		player sideChat "1'6, this is 1'1, reporting mission result. Over.";
		_dialogResult =	[
			"HQ - Report Task Result",
			[
				["Task", [ ( (call dzn_fnc_TaskManager_taskType) call dzn_task_getDisplayName ) select 0 ]]
				,["Result", ["Completed", "Parial Completed", "Not completed", "Cancelled"]]
				,["Hostile forces", []]
				,["Allied forces", []]
				,["Notes", []]
			]			
		] call dzn_fnc_ShowChooseDialog;
		if (count _dialogResult == 0) exitWith { player sideChat "1'6, this is 1'1, cancel. Out."; };
		
		_dialogResult call dzn_fnc_cancelTask;
	};
};

dzn_fnc_selectTask = {
	// ["TaskType", "RangeCategory"] call dzn_fnc_selectTask;
	private["_userPos","_rangeLimit","_listOfTasksInRange","_taskPos"];
	params["_type","_range"];
	
	_presets = call compile preProcessFileLineNumbers format ["Logic\tasks\%1\taskSettings.sqf", _type call dzn_task_tasks];
	_rangeLimit = _range call dzn_task_ranges;
	
	_userPos = getPosASL player;
	_listOfTasksInRange = [];
	if (_rangeLimit == 0) then {
		_listOfTasksInRange = _presets select 1;
	} else {		
		{		
			if (_userPos distance2d (_x select 0) <= _rangeLimit) then {
				_listOfTasksInRange	pushBack _x;
			};		
		} forEach (_presets select 1);
	};
	
	if (_listOfTasksInRange isEqualTo []) exitWith { [west, "HQ"] sideChat "This is 1-6, We have no missions in your area. Out." };
	
	_taskPos = _listOfTasksInRange call BIS_fnc_selectRandom;
	
	[_type, [ _presets select 0, _taskPos, _presets select 2 ], nil ] call dzn_fnc_TaskManager_create;
};

dzn_fnc_cancelTask = {	
	missionNamespace setVariable ["dzn_taskManager",  [ false, nil, nil, nil ], true];
	TaskManager_NewTask = false;
	publicVariableServer "TaskManager_NewTask";
};


// TASK ENTITY
dzn_fnc_createTaskSimpleLocation = {
	// @Location = [@Pos, @Radius, (@Direction), (@IsSquare)] call dzn_fnc_createTaskSimpleLocation
	private["_loc"];
	params["_pos","_size", ["_dir", 0], ["_isSquare",false]];
	
	_loc = createLocation ["Name", _pos, _size, _size];
	_loc setDirection _dir;
	if (_isSquare) then { _loc setRectangular true; };
	
	_loc
};

dzn_fnc_task_create = {
	// [@TaskId, @Location] call dzn_fnc_task_create;	
	
	// @TaskID, [ @TaskState, @TaskActive, @TaskLocation, @TaskObjects, @TaskItem, @TaskDynaiZone ]
	missionNamespace setVariable [
		_this select 0
		, [ "incomplete", true, _this select 1, [], nil, nil ]
		, true
	];
};

dzn_fnc_task_setProperty = {
	// [@TaskId, @Property, @Value] call dzn_fnc_task_setProperty
	params["_taskId", "_prop", "_val"];
	private "_id";
	_id = switch (_prop) do {
		case "state": { 0 };
		case "active": { 1 };
		case "location": { 2 };
		case "objects": { 3 };
	};
	
	(missionNamespace getVariable _taskId) set [_id, _val];
	missionNamespace setVariable [_taskId, missionNamespace getVariable _taskId, true];
};

// [ @TaskState, @TaskActive, @TaskLocation, @TaskObjects, @TaskItem, @TaskDynaiZone ]
dzn_fnc_task_getProperty = {
	// [@TaskId, @Property] call dzn_fnc_task_getProperty	
	params["_taskId", "_prop"];
	private "_id";
	_id = switch (_prop) do {
		case "state": { 0 };
		case "active": { 1 };
		case "location": { 2 };
		case "objects": { 3 };
	};

	(missionNamespace getVariable _taskId) select _id
};

dzn_fnc_task_setState = {
	// [@TaskId, @State] call dzn_fnc_task_setState;
	[_this select 0, "state", _this select 1] call dzn_fnc_task_setProperty;
};

dzn_fnc_task_state = {
	// @TaskId call dzn_fnc_task_state;	
	[_this select 0, "state"] call dzn_fnc_task_getProperty
};

dzn_fnc_task_active = {
	// @TaskId call dzn_fnc_task_end;	
	[_this select 0, "active"] call dzn_fnc_task_getProperty
};


// INIT
waitUntil { !isNil "dzn_dynai_initialized" && { dzn_dynai_initialized  } };
call dzn_fnc_TaskManager_init;
