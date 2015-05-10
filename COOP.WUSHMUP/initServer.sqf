{ if !(isPlayer _x) then { _x enableSimulation false; _x hideObjectGlobal true; }; } forEach switchableUnits;
{ if !(isPlayer _x) then { _x enableSimulation false; _x hideObjectGlobal true; }; } forEach playableUnits;
