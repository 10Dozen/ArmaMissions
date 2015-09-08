
/* *********** This array defines detailed properties of zones ************************** */

#define	INS_FT	[["O_Soldier_F",[],"kit_ins_common"],["O_Soldier_F",[],"kit_ins_common"],["O_Soldier_F",[],"kit_ins_common"],["O_Soldier_F",[],"kit_ins_common"]]
#define	INS_BT	[["O_Soldier_F",[],"kit_ins_common"],["O_Soldier_F",[],"kit_ins_common"]]
#define	INS_SET	["LIMITED","SAFE","YELLOW","COLUMN"]
[
	"zone_ins_patrolArea1",
	"EAST",true,[],[],
	[
	[2, INS_FT],
	[2, INS_BT]
	],
	INS_SET
]
,[
	"zone_ins_patrolArea2",
	"EAST",true,[],[],
	[
	[4, INS_FT],
	[0, INS_BT]
	],
	INS_SET
]
,[
	"zone_ins_patrolArea3",
	"EAST",true,[],[],
	[
	[0, INS_FT],
	[2, INS_BT]
	],
	INS_SET
]
,[
	"zone_ins_patrolHills",
	"EAST",true,[],[],
	[
	[0, INS_FT],
	[2, INS_BT]
	],
	INS_SET
]
,[
	"zone_ins_townGarrison",
	"EAST",true,[],[],
	[
	[3, INS_FT],
	[0, INS_BT]
	],
	INS_SET
]
,[
	"zone_blufor_retreat",	/* Zone Name */
	"WEST",true,	/* Side, isActive */	[],[],
	/* Groups: */
	[
	[/*Group Template #0*/
	/* Groups quantity: */2,
	/*Units*/ [["B_Soldier_F",[],"kit_blufor_common"],["B_Soldier_F",[],"kit_blufor_common"]]]
	],
	/* Behavior: Speed, Behavior, Combat mode, Formation */
	["LIMITED","SAFE","YELLOW","COLUMN"]
]



