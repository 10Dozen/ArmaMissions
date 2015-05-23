//	********************************
//		CONTACT: Cleansweep 1
// 	--------------------------------
//		Reward:	7500
//		Contact person: JAbraham
//		Overview:
//			Eliminate
//	********************************

waitUntil { !isNil "dzn_taskControl_taskList" };

// Task settings
private ["_contractName","_contractText","_dynaiZone","_reward","_realReward","_task","_taskName"];

if (isNil "Cleansweep1") exitWith { call compile "hint 'No task exists'" };
_task = Cleansweep1;
_taskName = "Cleansweep1";
_dynaiZone = "zone_cs";

_reward = 7500;
_realReward = _reward;

_contractName = "Cleansweep (1)";
_contractText = format [
	"<font color='#3DB4DB' size='24'><marker name='%1'>Cleansweep (1)</marker></font><br />		
	<br />Reward: %2$
	<br />Contact: John Abraham (jabraham1977@aim.com)
	<br /><br /><font color='#F09E1A' size='18'>Objective:</font>
	<br /><br />Clear area from hostile precense
	<br /><br /><font color='#F09E1A' size='18'>Mission:</font>
	<br /><br />You should complete cleansweep mission at given area.
	<br />My customer wants this work to be done quick.
	<br /><br />                     <font color='#B0E84F' size='15'>
	<execute expression='str(%1) call dzn_taskControl_fnc_accept'>ACCEPT OFFER</execute>
	</font>
	"
	,_taskName,_reward
];

// ******** Wait for Availability **********

_taskName spawn {
	sleep 15;
	[ _this, "available" ] call dzn_taskControl_fnc_updateTaskStatus;
};

// ******** Processing Task ********
waitUntil { [ _taskName, "available"] call dzn_taskControl_fnc_checkTaskStatus };

if (local player) then {
	[_contractName,_contractText,_task,_taskName,_reward,_realReward] spawn dzn_taskControl_fnc_processTask;	
};

// ************ Activate Task **************
waitUntil { [ _taskName, "accepted"] call dzn_taskControl_fnc_checkTaskStatus };
_dynaiZone spawn {	
	(call compile _this) call dzn_fnc_dynai_activateZone;
};



if (isServer || isDedicated) then {
	waitUntil { [ _taskName, "completed"] call dzn_taskControl_fnc_checkTaskStatus };	
	_reward call dzn_pmc_modifyCash;
};
