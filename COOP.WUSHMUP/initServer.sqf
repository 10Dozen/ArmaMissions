waitUntil { !isNil "dzn_ra_assignmentComplete" };
{ if !(isPlayer _x) then { _x enableSimulation false; _x hideObjectGlobal true; }; } forEach switchableUnits;
{ if !(isPlayer _x) then { _x enableSimulation false; _x hideObjectGlobal true; }; } forEach playableUnits;


// Test
// waitUntil { !isNil "dzn_ra_assignmentComplete" };
// { 
	// if ( !(isPlayer _x) && (side _x == west) && (isNil {_x getVariable "raRole"})) then { 		
		// deleteVehicle _x;
	// };
 // } forEach (entities "CAManBase") ; 
 // {deleteGroup _x;} forEach allGroups;
