// DIary 
[] spawn {
	player createDiaryRecord ["Diary", ["View Distance", "<font color='#A0DB65'><execute expression='[] call dzn_fnc_addViewDistance;'>INCREASE VIEW DISTANCE</execute>
	<br /><br /><execute expression='[] call dzn_fnc_reduceViewDistance;'>DECREASE VIEW DISTANCE</execute></font>"]];
	player createDiaryRecord ["Diary", ["Note", ""]];

	player createDiaryRecord ["Diary", ["Mission", ""]];
	player createDiaryRecord ["Diary", ["Intel", ""]];

};
