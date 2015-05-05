//	********************************
//		CONTACT: BLOWJOBS1
// 	--------------------------------
//		Reward:	3000
//		Contact person: JAbraham
//		Overview:
//			Blow up crates
//	********************************

waitUntil { !isNil "dzn_taskControl_taskList" };

// Task settings
private ["_contractName","_contractText","_dynaiZone","_reward","_realReward","_task","_taskName"];

if (isNil "Blowjobs1") exitWith { call compile "hint 'No task exists'" };
_task = Blowjobs1;
_taskName = "Blowjobs1";
_dynaiZone = "zone_bj";

_reward = 3500;
_realReward = _reward;

_contractName = "Blowjobs (1)";
_contractText = format [
	"<font color='#3DB4DB' size='24'><marker name='%1'>Blowjobs (1)</marker></font><br />		
	<br />Reward: %2$
	<br />Contact: John Abraham (jabraham1977@aim.com)
	<br /><br /><font color='#F09E1A' size='18'>Objective:</font>
	<br /><br />Blow up 4 cargo crates.
	<br /><br /><font color='#F09E1A' size='18'>Mission:</font>
	<br /><br />There are 4 cargo crates with equipment shipped from third world country. I supose this equipment - weapons - will be given to insurgents from north Altis.
	<br />My customer wants to destroy this equipment as fast as it possible.
	<br />Crates are shipped to facility near here and well-guarded by M.E.R.C.
	<br /><br />                     <font color='#B0E84F' size='15'>
	<execute expression='call dzn_task_Blowjobs1_accept'>ACCEPT OFFER</execute>
	</font>
	"
	,_taskName,_reward
];

[] spawn {
	sleep 5;
	[ "Blowjobs1", "available" ] call dzn_taskControl_fnc_updateTaskStatus;
};

// Processing Task
waitUntil { ["Blowjobs1", "available"] call dzn_taskControl_fnc_checkTaskStatus };

if (local player) then {
	// Create task
	dzn_task_Blowjobs1_accept = {
		if ( ["Blowjobs1", "available"] call dzn_taskControl_fnc_checkTaskStatus ) then {			
			[ "Blowjobs1", "accepted" ] call dzn_taskControl_fnc_updateTaskStatus;			
		};		
	};
	
	[_contractName,_contractText,_task,_taskName,_reward,_realReward] spawn dzn_taskControl_fnc_processTask
};

// ************ Activate Task **************
waitUntil { ["EliminateHVT1", "accepted"] call dzn_taskControl_fnc_checkTaskStatus };
_dynaiZone spawn {	
	(call compile _this) call dzn_fnc_dynai_activateZone;
};


if (isServer || isDedicated) then {
	waitUntil { ["Blowjobs1", "completed"] call dzn_taskControl_fnc_checkTaskStatus };	
	_reward call dzn_pmc_modifyCash;
};
