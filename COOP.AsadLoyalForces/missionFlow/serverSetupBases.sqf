// Creates vehicle, ammoboxes and other stuff on marked bases

private["_bases"];
_bases = dzn_base_fobs + dzn_base_outposts;

{
  _spots = synchronizedObjects _x;

} forEach _bases; 
