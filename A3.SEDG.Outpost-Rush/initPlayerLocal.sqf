// DIary 
[] spawn {
	player createDiaryRecord ["Diary", ["View Distance", "<font color='#A0DB65'><execute expression='[] call dzn_fnc_addViewDistance;'>INCREASE VIEW DISTANCE</execute>
	<br /><br /><execute expression='[] call dzn_fnc_reduceViewDistance;'>DECREASE VIEW DISTANCE</execute></font>"]];
	player createDiaryRecord ["Diary", ["Note", ""]];

	player createDiaryRecord ["Diary", ["Mission", "You need to find positions of enemy outposts in region and capture it.<br />Enemy surely expects us, so reinforcements may be quick. Also be prepared of heavy weapons and patrols near the outposts."]];
	player createDiaryRecord ["Diary", ["Intel", "Enemy placed a number of outpost somewhere in region to contol roads and area. We need to know how strong they are and, if it's possible, capture these outposts."]];

};
