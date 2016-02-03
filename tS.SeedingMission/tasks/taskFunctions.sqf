dzn_fnc_selectTask = {
	// ["TaskType", "RangeCategory"] call dzn_fnc_selectTaskPlaceByRange;
	private["_userPos","_rangeLimit","_listOfTasksInRange","_taskPos"];
	params["_type","_range"];
	_presets = call compile preProcessFileLineNumbers format ["tasks/%1/taskSettings.sqf", _type];
	/*
		[
			[_taskName, _taskDisplayName, _taskDesc] 
			, _positions
			, _taskSafetyReward
		]
	*/
	
	_rangeLimit = switch (_range) do {
		case 0: { 0 }; //Anyrange
		case 1: { 1200 }; // Near		
		case 2: { 3000 };// Medium
		case 3: { 6000 };// Far
	};
	
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
	
	if (_listOfTasksInRange isEqualTo []) exitWith { "No task in given range." };
	_taskPos = _listOfTasksInRange call BIS_fnc_selectRandom;
	
	[ _presets select 0, _taskPos, _presets select 2 ]
};


dzn_fnc_createTaskEntity = {
	// [@TaskId, @pos, @radius, @Params] call dzn_fnc_createTaskEntity;
	
	missionNamespace setVariable [
		_this select 0
		, [ 
			["end", false]
			,["state","init"]
			,["composition",[]]
			,["pos", _this select 1]
			,["radius", _this select 2]
		] + _this select 3
		, true
	];
};

dzn_fnc_addObjectsToTask = {
	// [@Task, @Objects] call dzn_fnc_addObjectsToTask

};

dzn_fnc_setTaskState = {
	// [@Task, @State] call dzn_fnc_setTaskState

};

dzn_fnc_endTask = {
	// @Task call dzn_fnc_setTaskState

};

dzn_fnc_clearTaskPos = {
	// @Task call dzn_fnc_clearTaskPos

};

dzn_fnc_getTaskState = {
	// @Task call dzn_fnc_getTaskState

};

dzn_fnc_isTaskEnded= {
	// @Task call dzn_fnc_isTaskEnded

};
