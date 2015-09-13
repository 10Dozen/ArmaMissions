enableSaving [false,false];
tf_no_auto_long_range_radio = true;

// [@IsEditModeOn?, @Delay] execVM "dzn_gear\dzn_gear_init.sqf";
// 0 @IsEditModeOn?: true or false - Edit mode activation,
// 1 @Delay: NUMBER - script call delay (where 0 - is mission start). If not passed - runs without delay (before mission start);
[false] execVM "dzn_gear\dzn_gear_init.sqf";

[] execVM "dzn_dynai\dzn_dynai_init.sqf";