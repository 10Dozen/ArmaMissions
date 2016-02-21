// Arsenal Box
_newObject = createVehicle ['Land_PaperBox_open_full_F', [5840.97,11355.7,-3.05176], [], 0, 'CAN_COLLIDE'];
_newObject setPosASL [5840.97,11355.7,83.1207];
_newObject setVectorDirAndUp [[0,1,0], [0,0,1]];
arsenalBox = _newObject;


// MASH
_newObject = createVehicle ['CUP_A2_wf_field_hospital_west_ep1', [5878.43,11349.5,0], [], 0, 'CAN_COLLIDE'];
_newObject setPosASL [5875.78,11349.8,83.04];
_newObject setVectorDirAndUp [[0.685108,0.728442,0], [0,0,1]];
_newObject setVariable ["ace_medical_isMedicalFacility",true,true];

// MASH Supplies
_newObject = createVehicle ['ACE_medicalSupplyCrate_advanced', [5875.72,11343.4,-0.0246506], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5875.72,11343.4,83.1065];
 _newObject setVectorDirAndUp [[0.648639,0.761096,9.36996], [-2.48352,8.8545,1]];
_newObject = createVehicle ['ACE_medicalSupplyCrate_advanced', [5876.16,11343.9,-0.0246506], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5876.16,11343.9,83.1065];
 _newObject setVectorDirAndUp [[0.70503,0.709177,4.07096], [-4.88457,-8.84389,1]];
_newObject = createVehicle ['ACE_medicalSupplyCrate_advanced', [5876.48,11344.3,-0.0245895], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5876.48,11344.3,83.1066];
 _newObject setVectorDirAndUp [[0.704773,0.709433,8.89205], [-5.30951,-7.25939,1]];



// New Barracks
_newObject = createVehicle ['Land_i_Barracks_V2_F', [5852.17,11230.7,0], [], 0, 'CAN_COLLIDE'];
_newObject setPosASL [5852.17,11230.7,82.9499];
_newObject setVectorDirAndUp [[0.682706,-0.730693,0], [0,0,1]];

// Hanger Helicopters
_newObject = createVehicle ['RHS_UH60M', [5757.81,11254.3,-0.0332947], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5757.81,11254.3,83.0878];
 _newObject setVectorDirAndUp [[-0.76608,0.642745,-0.000265592], [-0.000200897,0.000173767,1]];

_newObject = createVehicle ['RHS_UH60M', [5801.28,11296.5,-0.0332947], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5801.28,11296.5,83.0878];
 _newObject setVectorDirAndUp [[-0.766092,0.642731,-0.000265246], [-0.000202557,0.000171251,1]];

// Chappel
_newObject = createVehicle ['Land_Chapel_Small_V1_F', [5857.87,11322.8,0.259995], [], 0, 'CAN_COLLIDE'];
_newObject setPosASL [5856.66,11324.3,83.3807];
_newObject setDir 45;
Chapel = _newObject;
publicVariable "Chapel";

 
 // Other stuff
_newObject = createVehicle ['Barrels', [5848.78,11318.3,0.0254898], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5848.78,11318.3,83.1462];
_newObject = createVehicle ['ACE_Wheel', [5845.3,11318,-0.0211258], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5845.3,11318,83.0996];
_newObject = createVehicle ['ACE_Wheel', [5845.44,11321.5,-0.0211258], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5845.44,11321.5,83.0996];
_newObject = createVehicle ['ACE_Wheel', [5846.17,11320.2,-0.0211258], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5846.17,11320.2,83.0996];
_newObject = createVehicle ['ACE_Wheel', [5844.25,11319.1,-0.0211258], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5844.25,11319.1,83.0996]; 
_newObject = createVehicle ['Land_PaperBox_open_full_F', [5858.02,11341,-3.05176], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5858.01,11341,83.1207];
 _newObject setVectorDirAndUp [[-0.744141,-0.668022,0], [0,0,1]];
_newObject = createVehicle ['Land_Pallet_MilBoxes_F', [5856.04,11342.3,-3.05176], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5855.91,11342.3,83.1207];
 _newObject setVectorDirAndUp [[0,1,0], [0,0,1]];
_newObject = createVehicle ['Land_PaperBox_open_empty_F', [5846.66,11353.1,-3.05176], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5846.66,11353.1,83.1207];
 _newObject setVectorDirAndUp [[-0.742779,-0.669537,0], [0,0,1]];
_newObject = createVehicle ['Land_PaperBox_closed_F', [5845.41,11354.4,-3.05176], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5845.42,11354.4,83.1207];
 _newObject setVectorDirAndUp [[-0.636265,-0.771471,0], [0,0,1]];
_newObject = createVehicle ['Land_PaperBox_closed_F', [5844.04,11355.7,-3.05176], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5844.05,11355.7,83.1207];
 _newObject setVectorDirAndUp [[-0.78481,-0.619736,0], [0,0,1]];
_newObject = createVehicle ['Land_HelipadRescue_F', [5854.29,11398.9,0], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5854.29,11398.9,83.04];
 _newObject setVectorDirAndUp [[-0.702107,0.712072,0], [0,0,1]];
 
 _newObject = createVehicle ['Land_HelipadSquare_F', [5882.42,11426.4,0], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5882.42,11426.4,83.04];
 _newObject setVectorDirAndUp [[0.717926,-0.696119,0], [-0,-0,1]];
_newObject = createVehicle ['LOP_TKA_Mi8MT_Cargo', [5882.58,11426.3,-0.468773], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5882.58,11426.3,83.0579];
 _newObject setVectorDirAndUp [[-0.738708,0.670239,0.0713508], [0.0525131,-0.0483069,0.997451]];
_newObject = createVehicle ['RHS_UH60M_MEV2', [5854.41,11397.5,-0.00830078], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5854.41,11397.5,83.0321];
 _newObject setVectorDirAndUp [[-0.627826,0.778353,-0.000265007], [-0.000171444,0.000202184,1]];
_newObject = createVehicle ['Land_HelipadSquare_F', [5909.85,11456.3,0], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5909.85,11456.3,83.04];
 _newObject setVectorDirAndUp [[0.717926,-0.696119,0], [-0,-0,1]];
_newObject = createVehicle ['Land_HelipadSquare_F', [5937.91,11484.7,0], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5937.91,11484.7,83.04];
 _newObject setVectorDirAndUp [[0.717926,-0.696119,0], [-0,-0,1]];
_newObject = createVehicle ['LOP_TKA_Mi24V_AT', [5937.99,11484.5,-0.503876], [], 0, 'CAN_COLLIDE'];
 _newObject setPosASL [5937.99,11484.5,83.0805];
 _newObject setVectorDirAndUp [[-0.657964,0.749898,0.0688161], [0.0453555,-0.0517546,0.997629]];
 
 