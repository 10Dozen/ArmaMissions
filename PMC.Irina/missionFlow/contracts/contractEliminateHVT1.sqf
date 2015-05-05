//	********************************
//		CONTACT: Eliminate HVT 1
// 	--------------------------------
//		Reward:	3000
//		Contact person: JAbraham
//		Overview:
//			Blow up crates
//	********************************

waitUntil { !isNil "dzn_taskControl_taskList" };

// Task settings
private ["_contractName","_contractText","_dynaiZone","_reward","_realReward","_task","_taskName"];

if (isNil "EliminateHVT1") exitWith { call compile "hint 'No task exists'" };
_task = EliminateHVT1;
_taskName = "EliminateHVT1";
_dynaiZone = "zone_hvt";

_reward = 5000;
_realReward = _reward;

_contractName = "Eliminate HVT (1)";
_contractText = format [
	"<font color='#3DB4DB' size='24'><marker name='%1'>Eliminate HVT (1)</marker></font><br />		
	<br />Reward: %2$
	<br />Contact: John Abraham (jabraham1977@aim.com)
	<br /><br /><font color='#F09E1A' size='18'>Objective:</font>
	<br /><br />Eliminate high valuable target.
	<br /><br /><font color='#F09E1A' size='18'>Mission:</font>
	<br /><br />You should eliminate one person at the facility.
	<br />My customer wants this work to be done quick.
	<br /><br />                     <font color='#B0E84F' size='15'>
	<execute expression='call dzn_task_EliminateHVT1_accept'>ACCEPT OFFER</execute>
	</font>
	"
	,_taskName,_reward
];

// ******** Wait for Availability **********

[] spawn {
	sleep 15;
	[ "EliminateHVT1", "available" ] call dzn_taskControl_fnc_updateTaskStatus;
};

// ******** Processing Task ********
waitUntil { ["EliminateHVT1", "available"] call dzn_taskControl_fnc_checkTaskStatus };

if (local player) then {
	// Create task
	dzn_task_EliminateHVT1_accept = {
		if ( ["EliminateHVT1", "available"] call dzn_taskControl_fnc_checkTaskStatus ) then {			
			[ "EliminateHVT1", "accepted" ] call dzn_taskControl_fnc_updateTaskStatus;
		};		
	};
	
	[_contractName,_contractText,_task,_taskName,_reward,_realReward] spawn dzn_taskControl_fnc_processTask;	
};

// ************ Activate Task **************
waitUntil { ["EliminateHVT1", "accepted"] call dzn_taskControl_fnc_checkTaskStatus };
_dynaiZone spawn {	
	(call compile _this) call dzn_fnc_dynai_activateZone;
};



if (isServer || isDedicated) then {
	waitUntil { ["EliminateHVT1", "completed"] call dzn_taskControl_fnc_checkTaskStatus };	
	_reward call dzn_pmc_modifyCash;
};
