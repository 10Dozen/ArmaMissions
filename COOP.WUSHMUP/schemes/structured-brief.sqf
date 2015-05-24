/*
	CLN: Set Mission Tasks
	
	- Show briefing text
	- Add tasks for a mission

*/

// TASKS
tasks = [];
briefingCreateTasks = {
	{
		_task = _x select 0;
		_taskDesc = _x select 1;
		_taskTitle = _x select 2;
		_taskPointDesc = _x select 3;
		_taskPointPos = _x select 4;
		
		call compile format [
			"plrTask%1 = player createSimpleTask [_task];
			plrTask%1 setSimpleTaskDescription [_taskDesc, _taskTitle, _taskPointDesc];
			plrTask%1 setSimpleTaskDestination _taskPointPos;
			tasks = tasks + [plrTask%1];",
			_forEachIndex
		];
		
	} forEach _this;	
};

_briefingTasks = [
	["INSERTION","Reach insertion point by helicopter","INSERTION","INSERTION POINT", getMarkerPos "mrk_Insert"],
	["OBJ 1: Destroy AA MANPADS", "Eliminate all AA units at the both AA sites","OBJ 1: Destroy AA MANPADS","AA Launch sites", getMarkerPos "mrk_sAA"],
	["OBJ 2: Supress resistance", "Clear camp from guerillas. Take no prisoners.","OBJ 2: Supress resistance","Guerilla's Camp", getMarkerPos "mrk_Camp"],
	["OBJ 3: Destroy cache","Destroy weapon and ammo cache at the camp.","OBJ 3: Destroy cache","Find and Destroy cache", getMarkerPos "mrk_Cache"],
	["OBJ 4: Destroy vehicles", "Destroy all vehicles at the camp","OBJ 4: Destroy vehicles","Destroy all vehicles", getMarkerPos "mrk_Camp"]
];


// BRIEFING
_briefingText = [
	["GOOD MORNING, THIS IS CAPTAIN DALE COOPER", []],
	["I am pleased to welcome you among the super-elite special forces detachment", [], 5],
	["Today you will meet your first exercise and I hope, you will enjoy it", []],
	["Also I am glad to introduce Col. ALEXANDER BRANDON", []],
	["He will oversee this mission", [],6],
	["Now, let's start...", []],
	["MISSION: Neutralize guerilla camp", []],	
	["OBJECTIVE 1: Destroy AA MANPADS", [
		"%1", 
		parseText "<t color='#666666' align='left'>OBJ 1</t><t color='#aaaaaa' align='right'>DESTROY AA MANPADS</t>"
	]],	
	["OBJECTIVE 2: Suppress resistance at camp site", [
		"%1%2%3", 
		[lineBreak,	parseText "<t color='#666666' align='left'>OBJ 2</t><t color='#aaaaaa' align='right'>SUPPRESS  RESISTANCE</t>"]
	]],
	["OBJECTIVE 3: Destroy weapon cache", [
		"%1%2%3%4%5",
		[lineBreak,	parseText "<t color='#666666' align='left'>OBJ 3</t><t color='#aaaaaa' align='right'>DESTROY CACHE</t>"]
	]],
	["OBJECTIVE 4: Destroy all vehicles at camp site", [
		"%1%2%3%4%5%6%7",
		[lineBreak,	parseText "<t color='#666666' align='left'>OBJ 4</t><t color='#aaaaaa' align='right'>DESTROY VEHICLES</t>"]
	]],
	["OBJECTIVE 5: After all objectives will be completed - Return to base", [
		"%1%2%3%4%5%6%7%8%9",
		[lineBreak,	parseText "<t color='#666666' align='left'>OBJ 5</t><t color='#aaaaaa' align='right'>EXTRACTION</t>"]
	]],
	["ROE: Noncombatants are absent. Do not take prisoners.",[
		"%1%2%3%4%5%6%7%8%9%10%11",	
		[lineBreak,	parseText "<t color='#880000' align='left'>ROE</t><t color='#aaaaaa' align='right'>WEAPONS FREE</t>"]
	],6],
	["All weapons and equipment you can get in the chopper.", []],
	["After AAs will be neutralized, fire support from helicopter will be available", [],6],
	["GOOG LUCK!", []]
];

_briefingTaskText = [];

_dzn_brief_startLine = if ( dzn_quickStart > 0 ) then { 6 } else { 0 };
_dzn_bried_endLine = count(_briefingText) - 1;

for "_i" from (_dzn_brief_startLine) to (_dzn_bried_endLine) do {
	_line = _briefingText select _i;

	_time = if (count(_line) == 3) then { _line select 2 } else { 4.5 };
	if ( dzn_quickStart > 0 ) then { _time = 0.5; };
	
	_text = _line select 0;
	_task = _line select 1;
	
	[west, "HQ"] sideChat _text;
	
	if (count(_task) > 0) then {
		if (count(_briefingTaskText) == 0) then {
			_briefingTaskText = _task
		} else {			
			_briefingTaskText set [0, (_task select 0)];
			{
				_briefingTaskText = _briefingTaskText + [_x];
			} forEach (_task select 1);
		};	
	
		hintSilent formatText _briefingTaskText;
	};
	
	if (_i == 7) then { 
		{
			_x setMarkerAlpha 1;
		} forEach (missionMarkers - ["mrk_Extract"] - ["mrk_roadmines"] - ["mrk_roadmines_sign"]);
		
		_briefingTasks call briefingCreateTasks;
	};
	
	sleep _time;
};
