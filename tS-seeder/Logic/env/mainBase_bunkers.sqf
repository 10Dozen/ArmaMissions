{
	_x spawn dzn_fnc_setEnv;
} forEach [
/* Nort-East*/

[  ['Land_BagBunker_Large_F', [6388.45,11723.7,0.00203705], [], 0, 'CAN_COLLIDE']
,[6387.9,11723.9,100.773]
, [[-0.89073,0.453939,-0.0232267], [-0.0431349,-0.0335497,0.998506]]]


, [  ['Land_HBarrier_5_F', [6381.34,11730.7,-0.144112], [], 0, 'CAN_COLLIDE']
,[6383.27,11729.7,100.536]
, [[0.429148,0.894215,0.127327], [-0.118725,-0.0838989,0.989376]]]


, [  ['Land_HBarrier_5_F', [6378.31,11724.9,-0.0946045], [], 0, 'CAN_COLLIDE']
,[6380.29,11723.9,100.16]
, [[0.435222,0.898963,0.0494742], [-0.0606677,-0.0255438,0.997831]]]


, [  ['Land_BagFence_Long_F', [6380.23,11728.7,-0.140068], [], 0, 'CAN_COLLIDE']
,[6380.16,11728.7,100.275]
, [[-0.907381,0.38685,-0.164337], [-0.192971,-0.0360844,0.980541]]]



/*Nort-WEst*/


, [  ['Land_BagBunker_Large_F', [6336.54,12217,0.0179749], [], 0, 'CAN_COLLIDE']
,[6336.12,12216.6,155.161]
, [[-0.697318,-0.715162,-0.0478589], [-0.0111805,-0.0559099,0.998373]]]


, [  ['Land_HBarrier_5_F', [6327.4,12212.5,-0.219391], [], 0, 'CAN_COLLIDE']
,[6329.01,12214,154.533]
, [[-0.656521,0.753125,-0.0422311], [-0.0986696,-0.0302381,0.994661]]]


, [  ['Land_HBarrier_5_F', [6331.96,12207.9,-0.0623779], [], 0, 'CAN_COLLIDE']
,[6333.6,12209.4,154.606]
, [[-0.691301,0.719744,0.0638061], [0.0239431,-0.0654387,0.997569]]]


,[  ['Land_BagFence_Long_F', [6328.96,12210.8,0.0432739], [], 0, 'CAN_COLLIDE']
,[6328.92,12210.8,154.581]
,[[-0.64951,-0.751797,-0.113747], [-0.098505,-0.0651391,0.993002]]]


/*Sout*/


, [  ['Land_BagBunker_Large_F', [5210.55,10543.3,-0.01651], [], 0, 'CAN_COLLIDE']
,[5210.83,10543.7,123.176]
, [[0.51828,0.854706,0.0293886], [-0.0223907,-0.0207911,0.999533]]]


, [  ['Land_HBarrier_5_F', [5215.33,10546.6,-0.156479], [], 0, 'CAN_COLLIDE']
,[5216.41,10548.5,123.185]
, [[-0.854057,0.516449,-0.0621903], [-0.0907814,-0.0302597,0.995411]]]


, [  ['Land_HBarrier_5_F', [5209.96,10549.8,0.0626373], [], 0, 'CAN_COLLIDE']
,[5211.22,10551.7,122.978]
, [[-0.821378,0.568369,-0.0479042], [-0.0239639,0.0495245,0.998485]]]


, [  ['Land_BagFence_Long_F', [5216.08,10551.8,0.166245], [], 0, 'CAN_COLLIDE']
,[5216.05,10551.8,123.267]
, [[-0.612929,-0.789961,-0.0167174], [-0.0907124,0.0493345,0.994654]]]

];



/*
// Nort-East

_newObject = createVehicle ['Land_BagBunker_Large_F', [6388.45,11723.7,0.00203705], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [6387.9,11723.9,100.773];
 _newObject setVectorDirAndUp [[-0.89073,0.453939,-0.0232267], [-0.0431349,-0.0335497,0.998506]];
_newObject = createVehicle ['Land_HBarrier_5_F', [6381.34,11730.7,-0.144112], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [6383.27,11729.7,100.536];
 _newObject setVectorDirAndUp [[0.429148,0.894215,0.127327], [-0.118725,-0.0838989,0.989376]];
_newObject = createVehicle ['Land_HBarrier_5_F', [6378.31,11724.9,-0.0946045], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [6380.29,11723.9,100.16];
 _newObject setVectorDirAndUp [[0.435222,0.898963,0.0494742], [-0.0606677,-0.0255438,0.997831]];
_newObject = createVehicle ['Land_BagFence_Long_F', [6380.23,11728.7,-0.140068], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [6380.16,11728.7,100.275];
 _newObject setVectorDirAndUp [[-0.907381,0.38685,-0.164337], [-0.192971,-0.0360844,0.980541]];



// Nort-WEst
_newObject = createVehicle ['Land_BagBunker_Large_F', [6336.54,12217,0.0179749], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [6336.12,12216.6,155.161];
 _newObject setVectorDirAndUp [[-0.697318,-0.715162,-0.0478589], [-0.0111805,-0.0559099,0.998373]];
_newObject = createVehicle ['Land_HBarrier_5_F', [6327.4,12212.5,-0.219391], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [6329.01,12214,154.533];
 _newObject setVectorDirAndUp [[-0.656521,0.753125,-0.0422311], [-0.0986696,-0.0302381,0.994661]];
_newObject = createVehicle ['Land_HBarrier_5_F', [6331.96,12207.9,-0.0623779], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [6333.6,12209.4,154.606];
 _newObject setVectorDirAndUp [[-0.691301,0.719744,0.0638061], [0.0239431,-0.0654387,0.997569]];
_newObject = createVehicle ['Land_BagFence_Long_F', [6328.96,12210.8,0.0432739], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [6328.92,12210.8,154.581];
 _newObject setVectorDirAndUp [[-0.64951,-0.751797,-0.113747], [-0.098505,-0.0651391,0.993002]];



// Sout

_newObject = createVehicle ['Land_BagBunker_Large_F', [5210.55,10543.3,-0.01651], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5210.83,10543.7,123.176];
 _newObject setVectorDirAndUp [[0.51828,0.854706,0.0293886], [-0.0223907,-0.0207911,0.999533]];
_newObject = createVehicle ['Land_HBarrier_5_F', [5215.33,10546.6,-0.156479], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5216.41,10548.5,123.185];
 _newObject setVectorDirAndUp [[-0.854057,0.516449,-0.0621903], [-0.0907814,-0.0302597,0.995411]];
_newObject = createVehicle ['Land_HBarrier_5_F', [5209.96,10549.8,0.0626373], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5211.22,10551.7,122.978];
 _newObject setVectorDirAndUp [[-0.821378,0.568369,-0.0479042], [-0.0239639,0.0495245,0.998485]];
_newObject = createVehicle ['Land_BagFence_Long_F', [5216.08,10551.8,0.166245], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5216.05,10551.8,123.267];
 _newObject setVectorDirAndUp [[-0.612929,-0.789961,-0.0167174], [-0.0907124,0.0493345,0.994654]];
*/