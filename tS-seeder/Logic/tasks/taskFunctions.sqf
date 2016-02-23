dzn_task_list = [
	[0,	["SAD Weapon Cache", "SADCache"]]
	,[1,	["SAD Insurgent Camp", "SADCamp"]]
];

dzn_task_range = [
	[0, 0]
	,[1, 1500]
	,[2, 4000]
	,[3, 8000]
];

dzn_fnc_getTaskById = {
	[dzn_task_list, _this] call dzn_fnc_getValueByKey
};
dzn_fnc_getTaskByRange = {
	[dzn_task_range, _this] call dzn_fnc_getValueByKey
};


//
//	**********************
//	TASK MANAGER	
//	**********************

dzn_fnc_TaskManager_init = {
	if (isNil "TaskManager_NewTask") then { TaskManager_NewTask = false; };
	if (isNil "TaskManager_CompleteReport") then { TaskManager_CompleteReport = [];  };	
	
	if (isNil "taskPage") then {
		taskPage = "taskPage";
		player createDiarySubject [taskPage, "Rapier Mission Reports"];		
		
		if (!isNil "TaskManager_FullReportList" && {!(TaskManager_FullReportList isEqualTo [])}) then {
			{
				_x call dzn_fnc_TaskManager_report;
			} forEach TaskManager_FullReportList;
		};
		
		"TaskManager_CompleteReport" addPublicVariableEventHandler {
			TaskManager_CompleteReport call dzn_fnc_TaskManager_report;
		};
	};
	
	["hq_service", "HQ", { [] spawn dzn_fnc_requestTask; }, {true}] call dzn_fnc_addRadioService;
	"TaskManager_NewTask" addPublicVariableEventHandler {		
		if (TaskManager_NewTask) then { call dzn_fnc_TaskManager_runTask; };
	};
	
	if !(isServer) exitWith {};
	TaskManager_FullReportList = [];
	publicVariable "TaskManager_FullReportList";
	
	// @ActiveExist, @Type, @Presets, @TaskID
	missionNamespace setVariable [
		"dzn_taskManager"
		,  [ false, nil, nil, nil ]
		, true
	];	
	
	"TaskManager_NewTask" addPublicVariableEventHandler {		
		if (TaskManager_NewTask) then {
			call dzn_fnc_TaskManager_runTask;
		};
	};	
};

//	**********************
dzn_fnc_TaskManager_setProperty = {
	// [@Property, @Value] call dzn_fnc_TaskManager_setProperty
	params["_prop","_val"];
	private "_id";
	
	_id = switch (_prop) do {
		case "active": { 0 };
		case "type": { 1 };
		case "presets": { 2 };
		case "task": { 3 };
		case "info": { 4 };		
	};
	
	(missionNamespace getVariable "dzn_taskManager") set [_id, _val];
	missionNamespace setVariable ["dzn_taskManager", missionNamespace getVariable "dzn_taskManager", true];
};

dzn_fnc_TaskManager_getProperty = {
	// @Property call dzn_fnc_TaskManager_getProperty
	params["_prop"];
	private "_id";	
	_id = switch (_prop) do {
		case "active": { 0 };
		case "type": { 1 };
		case "presets": { 2 };
		case "task": { 3 };
		case "info": { 4 };
	};
	(missionNamespace getVariable "dzn_taskManager") select _id
};

dzn_fnc_TaskManager_isTaskActive = {
	"active" call dzn_fnc_TaskManager_getProperty
};

dzn_fnc_TaskManager_taskType = {
	"type" call dzn_fnc_TaskManager_getProperty
};

dzn_fnc_TaskManager_create = {
	// [@TaskType, @Presets] call dzn_fnc_TaskManager_create
	params["_taskType","_presets"];
	missionNamespace setVariable [
		"dzn_taskManager"
		, [ true, _taskType, _presets, nil, nil ]
		, true
	];	
	TaskManager_NewTask = true;
	publicVariableServer "TaskManager_NewTask";
	[] spawn {
		sleep 8;
		call  dzn_fnc_TaskManager_runTask;
	};
};

dzn_fnc_TaskManager_runTask = {
	[
		"presets" call dzn_fnc_TaskManager_getProperty
		, true
	] execVM format [
		"Logic\tasks\%1\task.sqf"
		, ((call dzn_fnc_TaskManager_taskType) call dzn_fnc_getTaskById) select 1
	];
};

dzn_fnc_TaskManager_report = {
	
	// [ 0@TaskNameId, 1@ResultId, 2@AlliedText, 3@HostilesText, 4@Notes, 5@TaskDisplayName, 6@TaskDesc, 7@TaskId ]
	private["_rVal","_title","_resultLabel","_taskDesc","_alliedForces","_hostileForces","_notes"];
	_rVal = if (isNil {_this}) then { TaskManager_CompleteReport } else { _this };	
	_title = _rVal select 5;
	_resultLabel = switch (_rVal select 1) do {
		case 0: { "Completed" };
		case 1: { "Partially Completed" };
		case 2: { "Not completed" };
		case 3: { "Cancelled" };				
	};	
	_alliedForces = _rVal select 2;
	_hostileForces = _rVal select 3;
	_notes = _rVal select 4;
	_taskDesc = _rVal select 6;
	
	player createDiaryRecord [
		taskPage
		, [
			_title
			, format [
				"<font color='#A0DB65'>Task:</font> %1
				<br /><font color='#A0DB65'>Result:</font> %2
				<br />----------------------
				<br /><font color='#A0DB65'>Allied Forces:</font> %3
				<br /><font color='#A0DB65'>Hostile Forces:</font> %4
				<br />----------------------
				<br /><font color='#A0DB65'>Notes:</font><br />%5"
				,_taskDesc
				,_resultLabel
				,if (typeName _alliedForces == "STRING") then { _alliedForces } else { "" }
				,if (typeName _hostileForces == "STRING") then { _hostileForces } else { "" }
				,if (typeName _notes == "STRING") then { _notes } else { "" }
			]
		]
	];
	
	_resultLabel = switch (_rVal select 1) do {
		case 0: { "SUCCEEDED" };
		case 1: { "SUCCEEDED" };		
		case 2: { "FAILED" };
		case 3: { "CANCELED" };				
	};
	[_rVal select 7, _resultLabel,true] spawn BIS_fnc_taskSetState;
};



// TASK CONTROLS
dzn_fnc_requestTask = {
	// If NO Active Task -- show select task dialog
	// If Active task exist already -- show AAR task dialog

	if !( call dzn_fnc_TaskManager_isTaskActive ) then {
		player sideChat "1'6, this is 1'1, requesting new mission. Over.";
		private _taskList = [];
		{
			_taskList pushBack (_x select 1 select 0);
		} forEach dzn_task_list;
		
		private _dialogResult =	[
			"HQ - Request Task",
			[
				["Task", _taskList]
				,["Location", ["All", "Near", "Medium", "Far"]]
			]
		] call dzn_fnc_ShowChooseDialog;
		if (count _dialogResult == 0) exitWith { player sideChat "1'6, this is 1'1, cancel. Out."; };		
		_dialogResult call dzn_fnc_selectTask;
	} else {
		player sideChat "1'6, this is 1'1, reporting mission result. Over.";
		private _dialogResult =	[
			"HQ - Report Task Result",
			[
				["Task", [ ("info" call dzn_fnc_TaskManager_getProperty) select 0 ]]
				,["Result", ["Completed", "Partially Completed", "Not completed", "Cancelled"]]
				,["Allied forces", []]
				,["Hostile forces", []]
				,["Notes", []]
			]			
		] call dzn_fnc_ShowChooseDialog;
		if (count _dialogResult == 0) exitWith { player sideChat "1'6, this is 1'1, cancel. Out."; };
		_dialogResult call dzn_fnc_endTask;
	};
};

dzn_fnc_selectByRangeType = {
	// [@Position1, @Position2, @Range] call dzn_fnc_selectByRangeType
	if (_this select 2 == 0) exitWith { true };
	if ((_this select 0) distance2d (_this select 1) <= (_this select 2)) exitWith { true };
	
	false
};

dzn_fnc_selectTask = {
	// ["TaskType", "RangeCategory"] call dzn_fnc_selectTask;
	private["_userPos","_listOfTasksInRange","_taskPos"];
	params["_type","_range"];
	
	private _rangeLimit = _range call dzn_fnc_getTaskByRange;
	/*
		Presets: 
			0 - [0 - Task Name, 1 - Task Display Name, 2 - Task Description
			1 - Allowed Task Presets
			2 - [0 - Task Safety Reward, 1 - Task Dynai Groups, 2 - Task Dynai Properties]
	*/	
	private _presets = [_rangeLimit] call compile preProcessFileLineNumbers format [
		"Logic\tasks\%1\taskSettings.sqf"
		, (_type call dzn_fnc_getTaskById) select 1
	];
	
	if ((_presets select 1) isEqualTo []) exitWith { [west, "HQ"] sideChat "This is 1-6, We have no missions in your area. Out." };
	
	private _taskObjectsPreset = (_presets select 1) call BIS_fnc_selectRandom;
	
	[_type, [ _presets select 0, _taskObjectsPreset, _presets select 2 ], nil ] call dzn_fnc_TaskManager_create;
};

dzn_fnc_endTask = {
	// [ @TaskNameId, @ResultId, @AlliedText,  @HostilesText, @Notes, @TaskDisplayName, @TaskDesc, @TaskId ]
	TaskManager_CompleteReport = _this 
		+ ("info" call dzn_fnc_TaskManager_getProperty)
		+ ["task" call dzn_fnc_TaskManager_getProperty];
	TaskManager_CompleteReport call dzn_fnc_TaskManager_report;
	publicVariable "TaskManager_CompleteReport";
	TaskManager_FullReportList pushBack TaskManager_CompleteReport;
	publicVariable "TaskManager_FullReportList";
	
	missionNamespace setVariable ["dzn_taskManager",  [ false, nil, nil, nil ], true];
	TaskManager_NewTask = false;
	publicVariableServer "TaskManager_NewTask";
};


// TASK ENTITY
dzn_fnc_getDisplayTaskPos = {
	// @RandomizedPos3d = [@Pos3d or @Pos2d, @RandomizeRange] call dzn_fnc_getDisplayTaskPos
	params[ "_pos", "_range" ];
	
	[ 
		(_pos select 0) + round(random(_range)) - round(random(_range))
		, (_pos select 1) + round(random(_range)) - round(random(_range))
		0
	]
};

dzn_fnc_getMapGrid = {
	// @Pos3d or @Pos2d call dzn_fnc_getMapGrid
	// [1234.523, 233.33, 0] 
	private["_mapGrid","_i", "_grid"];
	_mapGrid = "";
	for "_i" from 0 to 1 do {
		_grid = str ( ( round ( (_this select _i) / 10 ) ) );
		while {count _grid < 4} do {
			_grid = format ["0%1", _grid];
		};		
		_mapGrid = if (_mapGrid == "") then { _grid } else { format ["%1 %2", _mapGrid, _grid] };
	};
	
	_mapGrid
};

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
	[_this, "active"] call dzn_fnc_task_getProperty
};

// INIT
waitUntil { !isNil "dzn_dynai_initialized" && { dzn_dynai_initialized  } };
if !(isServer) then { waitUntil { !isNil "dzn_fnc_addRadioService" }; };

call dzn_fnc_TaskManager_init;
