// if (player == leader group player) then {
	// player addAction ["<t color='#AA3122'>Set Rallypoint</t>", {
		// dzn_rallypoint setPosATL (player modelToWorld [0, +3, 0]);
		// "respawn_west" setMarkerPos (getPosASL dzn_rallypoint);
	// }];
// };


player addEventHandler ["Killed", {
	pmc_accountCash = pmc_accountCash - 3000;
	publicVariable "pmc_accountCash";
}];

dzn_getCurrentBalance = {
	if (pmc_accountCash > 0) then {
		hint parseText format ["<t color='#99CC00'>%1 $</t>", pmc_accountCash];
	} else {
		hint parseText format ["<t color='#CC3300'>%1 $</t>", pmc_accountCash];
	};
};

dzn_getAccountInfo = {
	hint parseText format ["ACCOUNT  #414ce-860b96c-331
	<br />Expires: 10/2025
	<br />Owner: John Doe
	<br />Balance: %1
	",
	pmc_accountCash
	];
};

player createDiarySubject ["Bank Account","Bank Account"];
player createDiaryRecord [
	"Bank Account", 
	[
		"Current balance", 
		"<font size='22'>BANK ACCOUNT #414ce-860b96c-331</font>
		<br /><font color='#B0E84F' size='15'><execute expression='call dzn_getCurrentBalance'>CHECK CURRENT BALANCE</execute></font>
		<br /><font color='#B0E84F' size='15'><execute expression='call dzn_getAccountInfo'>CHECK ACCOUNT INFO</execute></font>"
	]
];



/*

// Tasks
player spawn {
	waitUntil { !isNil "task_bj1_accepted" };
	player createDiaryRecord [
		"Contracts", 
		[
			"Blowjobs (1)", 
			"<font color='#FFFFFF' size='20'>       CONTRACT ACCEPTED</font>
			<br />			
			<font color='#FF4444' size='15'>
			<execute expression='call dzn_task_bj1_accept'>       DECLINE OFFER</execute>
			</font>
			<br /> _____________________________________"
		]
	];
	
	waitUntil { !isNil "task_bj1"};
	waitUntil { task_bj1 };
	player createDiaryRecord [
		"Contracts", 
		[
			"Blowjobs (1)", 
			"<font color='#B0E84F' size='20'>       CONTRACT COMPLETED</font>
			<br /> _____________________________________"
		]
	];
	
	for "_i" from 0 to round(random 4) do {
	hint parseText "<t size='1.3' color='#B0E84F'>CONTRACT COMPLETED</t><br /><br />Contract: Blowjobs (1)<br />Reward: 3000$<br /><br />Waiting for bank transfer.";
	sleep 0.8;
	hint parseText "<t size='1.3' color='#B0E84F'>CONTRACT COMPLETED</t><br /><br />Contract: Blowjobs (1)<br />Reward: 3000$<br /><br />Waiting for bank transfer..";
	sleep 0.8;
	hint parseText "<t size='1.3' color='#B0E84F'>CONTRACT COMPLETED</t><br /><br />Contract: Blowjobs (1)<br />Reward: 3000$<br /><br />Waiting for bank transfer...";
	sleep 0.8;
	};
	
	hint parseText "<t size='1.3' color='#B0E84F'>CONTRACT COMPLETED</t><br /><br />Contract: Blowjobs (1)<br />Reward: 3000$<br /><br /><t size='1.3' color='#B0E84F'>Payment transfered</t>";
};


dzn_task_bj1_accept = {
	if (isNil "task_bj1_accepted") then {
		task_bj1_accepted = true;
		publicVariable "task_bj1_accepted";
	};
};
if (isNil "task_bj1_accepted") then {
player createDiarySubject ["Contracts","Contracts"];
player createDiaryRecord [
	"Contracts", 
	[
		"Blowjobs (1)", 
		"<font color='#3DB4DB' size='24'>Blowjobs (1)</font><br />		
		<br />Reward: 3000$
		<br />Contact: John Abraham (jabraham1977@aim.com)
		<br /><br /><font color='#F09E1A' size='18'>Objective:</font>
		<br /><br />Blow up 4 cargo crates.
		<br /><br /><font color='#F09E1A' size='18'>Mission:</font>
		<br /><br />There are 4 cargo crates with equipment shipped from third world country. I supose this equipment - weapons - will be given to insurgents from north Altis.
		<br />My customer wants to destroy this equipment as fast as it possible.
		<br />Crates are shipped to facility near here and well-guarded by M.E.R.C.
		<br /><br />		
		<font color='#B0E84F' size='15'>
		<execute expression='call dzn_task_bj1_accept'>ACCEPT OFFER</execute>
		</font>
		"
	]
];
};

*/
