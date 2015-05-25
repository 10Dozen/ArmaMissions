/*
	MisPar:
	
	par_hostileFaction	=	0,1,2
	par_hostileSkill	=	0,1,2
	par_hostileAmount	=	0,1,2,3,4
	par_hostileVehicles	=	0,1,2,3,4


Hostile Force Size (HFS)
Modifier
Hostile Vehicle Level


Few

*/

dzn_hostileInfantryClassname = "O_Soldier_F";
dzn_hostileInfantryKit = "";


/* Main area */
// Infantries
dzn_mainAreaGroups_inf_count = switch (par_hostileAmount) then {
	case 0; case 1: { 1 }; case 2: { 2 }; case 3: { 3 }; case 4: { 4 }
};

dzn_mainAreaGroups_inf_squad = if (par_hostileAmount in [3,4]) then {
	[
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit],
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit],
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit],
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit]
	]
} else {
	[
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit],
		[dzn_hostileInfantryClassname,[],dzn_hostileInfantryKit]
	]
};

// Vehicles

dzn_hostileVehicle_class_Tech = "";
dzn_hostileVehicle_class_Light = "";
dzn_hostileVehicle_class_Medium = "";
dzn_hostileVehicle_class_Heavy = "";

if (par_hostileVehicles == 0) then {
	dzn_mainAreaGroups_veh_count = 0;
} else {
	dzn_mainAreaGroups_veh_count = switch (par_hostileAmount) then {
		case 0; case 1: { 1 }; case 2: { 3 }; case 3: { 4 }; case 4: { 5 }
	};
	
	for "_i" from 0 to par_hostileVehicles do {
	
	
	};
};


/*	dzn_mainAreaGroups_veh_squad


dzn_mainAreaGroups = [
	[
		dzn_mainAreaGroups_inf_count,
		dzn_mainAreaGroups_inf_squad
	]
];


[
	[
		1,
		[
			["ASd","isVehicle",""],
			["O_Soldier_F",[0,"driver"],""],
			["O_Soldier_F",[0,"commander"],""],
			["O_Soldier_F",[0,"gunner"],""]
		]
	],
*/




/* Indoor area */
dzn_indoorAreaGroups_count = switch (par_hostileAmount) then {
	case 0; case 1: { 1 }; case 2; case 3: { 2 }; case 4: { 3 }
};

dzn_indoorAreaGroups =  [
	[
		dzn_indoorAreaGroups_count,
		[
			[dzn_hostileInfantryClassname,["indoors"],dzn_hostileInfantryKit],
			[dzn_hostileInfantryClassname,["indoors"],dzn_hostileInfantryKit],
			[dzn_hostileInfantryClassname,["indoors"],dzn_hostileInfantryKit],
			[dzn_hostileInfantryClassname,["indoors"],dzn_hostileInfantryKit]
		]
	]	
];

/* Reinforcement A */


/* Reinforcement B */
