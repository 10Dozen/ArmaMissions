// *********************************
// TASK SETTINGS
// *********************************
_taskName = "task_SADCamp%1";
_taskSafetyReward = 100;
_taskDisplayName = "Insurgents camp at %1";
_taskDesc = "Find and destroy enemy camp at grid %1.";


// *********************************
// TASK DYNAI UNITS
// *********************************
_taskGroups = [
	[
		, [ceil(random 4), [["I_soldier_F",[],"kit_ins_random"],["I_soldier_F",[],"kit_ins_random"]]]
	]
];

_taskZonesProperties = [
	["RESISTANCE", "randomize", ["LIMITED","SAFE","YELLOW","STAG COLUMN"]]
];

// *********************************
// TASK AVAILABLE PLACES
// *********************************
_positions = [
	[ ['Land_TentA_F', [7550.49,10539.5,0.0108719], [], 0, 'CAN_COLLIDE'],[7550.43,10539.5,105.014],[[0.973165,0.198442,0.116492], [-0.117576,-0.00635562,0.993044]]; ['Land_TentA_F', [7552.66,10535.8,0.0205383], [], 0, 'CAN_COLLIDE'],[7552.58,10535.9,105.495],[[-0.394528,0.902306,-0.173756], [-0.116446,0.138476,0.983496]]; ['Land_TentA_F', [7544.28,10539.9,0.0120621], [], 0, 'CAN_COLLIDE'],[7544.2,10539.9,104.184],[[0.978611,0.141797,0.149044], [-0.145543,-0.0348038,0.988739]]; ['CUP_GuerillaCacheBox_EP1', [7550.1,10536.6,-0.0869141], [], 0, 'CAN_COLLIDE'],[7550.1,10536.6,105.038],[[0.00155529,0.997029,-0.0770123], [-0.371423,0.0720791,0.925662]]]
	, [ ['Land_TentA_F', [7858.06,10750.9,0.0739746], [], 0, 'CAN_COLLIDE'],[7858.1,10750.7,180.898],[[0.384957,-0.860572,-0.333502], [0.0510647,-0.340936,0.938699]]; ['Land_TentA_F', [7866.33,10741.5,0.0673523], [], 0, 'CAN_COLLIDE'],[7866.37,10741.3,177.105],[[0.340555,-0.882915,-0.323239], [0.0619743,-0.321962,0.944722]]; ['Land_TentA_F', [7863.18,10740,0.0684357], [], 0, 'CAN_COLLIDE'],[7863.22,10739.8,176.78],[[0.630657,-0.720754,-0.287726], [0.0543064,-0.328856,0.942817]]; ['CUP_GuerillaCacheBox_EP1', [7861.12,10745.3,-0.0214996], [], 0, 'CAN_COLLIDE'],[7861.12,10745.3,178.775],[[-0.0603151,0.921604,0.383417], [-0.194837,-0.387598,0.901003]]]
	, [ ['Land_TentA_F', [7298.58,12075.7,0.0144653], [], 0, 'CAN_COLLIDE'],[7298.66,12075.8,182.75],[[0.97036,0.190161,-0.149132], [0.140749,0.0569323,0.988407]]; ['Land_TentA_F', [7298.21,12079.5,-0.0070343], [], 0, 'CAN_COLLIDE'],[7298.29,12079.6,182.517],[[-0.373689,0.92751,-0.00907166], [0.156036,0.0725011,0.985087]]; ['Land_TentA_F', [7302.22,12073.6,0.0341644], [], 0, 'CAN_COLLIDE'],[7302.23,12073.8,182.875],[[-0.380968,0.89809,-0.219766], [0.0294266,0.249348,0.967967]]; ['CUP_GuerillaCacheBox_EP1', [7296.65,12078.3,-0.0930023], [], 0, 'CAN_COLLIDE'],[7296.65,12078.3,182.781],[[-0.0663063,0.997796,-0.00245323], [-0.100377,-0.00422412,0.99494]]]
	, [ ['Land_TentA_F', [6878.44,12363.1,0.00361252], [], 0, 'CAN_COLLIDE'],[6878.46,12363.1,40.2719],[[0.978185,0.202049,-0.0482667], [0.0270355,0.106551,0.99394]]; ['Land_TentA_F', [6885.9,12369.2,-0.000682831], [], 0, 'CAN_COLLIDE'],[6885.91,12369.3,39.3919],[[-0.375868,0.924418,-0.0646073], [0.0286928,0.0812959,0.996277]]; ['Land_TentA_F', [6889.2,12363.3,0.00242233], [], 0, 'CAN_COLLIDE'],[6889.2,12363.4,40.0011],[[-0.382169,0.918404,-0.102378], [0.0127122,0.116002,0.993168]]; ['CUP_GuerillaCacheBox_EP1', [6887.6,12367.4,-0.0990868], [], 0, 'CAN_COLLIDE'],[6887.6,12367.4,39.4646],[[-0.0776553,0.994675,-0.0677549], [-0.222409,0.0489641,0.973723]]]
	, [ ['Land_TentA_F', [8179.71,9789.82,-0.00724792], [], 0, 'CAN_COLLIDE'],[8179.69,9789.85,137.575],[[0.97904,0.201428,0.0301377], [-0.0399281,0.0447192,0.998201]]; ['Land_TentA_F', [8179.35,9793.63,-0.00898743], [], 0, 'CAN_COLLIDE'],[8179.32,9793.65,137.388],[[-0.372216,0.926431,-0.0563926], [-0.0399281,0.0447192,0.998201]]; ['Land_TentA_F', [8183.22,9787.92,-0.0111237], [], 0, 'CAN_COLLIDE'],[8183.18,9787.94,137.821],[[-0.394365,0.916867,-0.061898], [-0.0526742,0.0446928,0.997611]]; ['CUP_GuerillaCacheBox_EP1', [8177.09,9792.32,-0.108063], [], 0, 'CAN_COLLIDE'],[8177.09,9792.32,137.291],[[-0.0898229,0.995958,0.000369343], [-0.279687,-0.0255802,0.959751]]]
	, [ ['Land_TentA_F', [8515.92,9657.05,0.0312958], [], 0, 'CAN_COLLIDE'],[8515.98,9656.93,216.731],[[0.580274,-0.783222,-0.223259], [0.101296,-0.202594,0.97401]]; ['Land_TentA_F', [8524.85,9662.37,0.0401154], [], 0, 'CAN_COLLIDE'],[8524.91,9662.23,217.1],[[0.599108,-0.762137,-0.24539], [0.0850077,-0.244203,0.965991]]; ['Land_TentA_F', [8510.66,9664.4,-0.0331421], [], 0, 'CAN_COLLIDE'],[8510.69,9664.3,218.642],[[-0.381968,0.904901,0.187761], [0.0770058,-0.171296,0.982206]]; ['CUP_GuerillaCacheBox_EP1', [8512.44,9655.98,-0.072403], [], 0, 'CAN_COLLIDE'],[8512.44,9655.98,216.812],[[-0.0672479,0.962954,0.261146], [-0.15304,-0.268597,0.951017]]]
	, [ ['Land_TentA_F', [8251.54,9160.91,-0.0138092], [], 0, 'CAN_COLLIDE'],[8251.45,9160.85,170.043],[[0.97174,0.159924,0.173627], [-0.155305,-0.120793,0.980454]]; ['Land_TentA_F', [8253.19,9164.37,-0.0154724], [], 0, 'CAN_COLLIDE'],[8253.09,9164.3,170.733],[[-0.384465,0.921588,0.0534997], [-0.156804,-0.122307,0.980027]]; ['Land_TentA_F', [8247.45,9162.42,-0.0222778], [], 0, 'CAN_COLLIDE'],[8247.32,9162.35,169.437],[[-0.443595,0.89603,0.018834], [-0.200683,-0.119789,0.972305]]; ['CUP_GuerillaCacheBox_EP1', [8255.13,9161.88,-0.0805054], [], 0, 'CAN_COLLIDE'],[8255.13,9161.88,170.755],[[-0.0702927,0.984392,0.16134], [-0.391672,-0.175987,0.903118]]]
	, [ ['Land_TentA_F', [7889.61,8742.19,0.00688171], [], 0, 'CAN_COLLIDE'],[7889.65,8742.25,246.62],[[0.977778,0.197522,-0.0702591], [0.0541205,0.0859545,0.994828]]; ['Land_TentA_F', [7889.96,8734.68,-0.00326538], [], 0, 'CAN_COLLIDE'],[7889.97,8734.71,247.194],[[-0.374568,0.926532,-0.0351676], [0.028754,0.0495182,0.998359]]; ['Land_TentA_F', [7891.9,8738,-0.00289917], [], 0, 'CAN_COLLIDE'],[7891.92,8738.05,246.847],[[-0.377452,0.924183,-0.0584409], [0.0525388,0.0843798,0.995048]]; ['CUP_GuerillaCacheBox_EP1', [7889.03,8738.96,-0.103394], [], 0, 'CAN_COLLIDE'],[7889.03,8738.96,246.833],[[-0.0716955,0.99691,-0.0320888], [-0.190835,0.0178671,0.981459]]]
	, [ ['Land_TentA_F', [7271.62,9085.31,-0.0032196], [], 0, 'CAN_COLLIDE'],[7271.52,9085.17,176.468],[[0.520599,0.796543,0.307403], [-0.170522,-0.255785,0.951576]]; ['Land_TentA_F', [7274.79,9084.71,-0.00944519], [], 0, 'CAN_COLLIDE'],[7274.69,9084.57,176.868],[[0.581096,0.753809,0.306757], [-0.170522,-0.255785,0.951576]]; ['Land_TentA_F', [7279.9,9084.74,0.0404053], [], 0, 'CAN_COLLIDE'],[7279.81,9084.62,177.815],[[0.492789,0.830044,0.261124], [-0.142085,-0.219306,0.965255]]; ['CUP_GuerillaCacheBox_EP1', [7269.09,9080.26,-0.0145569], [], 0, 'CAN_COLLIDE'],[7269.09,9080.26,174.566],[[-0.107378,0.944881,0.309305], [-0.436874,-0.324301,0.839029]]]
	, [ ['Land_TentA_F', [6875.6,9510.43,0.0573273], [], 0, 'CAN_COLLIDE'],[6875.42,9510.45,156.982],[[-0.721127,0.645409,-0.25184], [-0.297605,0.0396799,0.953864]]; ['Land_TentA_F', [6872.13,9515.81,-0.00578308], [], 0, 'CAN_COLLIDE'],[6871.99,9515.87,155.653],[[-0.541999,0.813844,-0.209511], [-0.232329,0.0944806,0.968038]]; ['Land_TentA_F', [6871.25,9508.75,0.0669861], [], 0, 'CAN_COLLIDE'],[6871.05,9508.75,155.632],[[-0.902928,0.286702,-0.320193], [-0.333372,0.00301527,0.942791]]; ['CUP_GuerillaCacheBox_EP1', [6871.33,9512.39,-0.0380859], [], 0, 'CAN_COLLIDE'],[6871.33,9512.39,155.6],[[-0.0887295,0.995969,-0.0131482], [-0.519287,-0.0349901,0.853883]]]
	, [ ['Land_TentA_F', [6304.36,9781.35,-0.00878143], [], 0, 'CAN_COLLIDE'],[6304.36,9781.33,100.454],[[0.983033,0.182603,0.0173937], [-0.00638822,-0.0606863,0.998137]]; ['Land_TentA_F', [6307.29,9788.11,-0.0112381], [], 0, 'CAN_COLLIDE'],[6307.27,9788.07,100.868],[[-0.375902,0.923968,0.0705844], [-0.0127569,-0.0813234,0.996606]]; ['Land_TentA_F', [6312.9,9787.55,-0.0231628], [], 0, 'CAN_COLLIDE'],[6312.88,9787.5,100.886],[[-0.400516,0.915861,0.028031], [-0.0287613,-0.0431426,0.998655]]; ['CUP_GuerillaCacheBox_EP1', [6309.95,9782.63,-0.108261], [], 0, 'CAN_COLLIDE'],[6309.95,9782.63,100.537],[[-0.0707942,0.992161,0.102979], [-0.259357,-0.117996,0.958546]]]
	, [ ['Land_TentA_F', [6883.81,10089.6,0.118767], [], 0, 'CAN_COLLIDE'],[6883.82,10089.7,112.585],[[-0.701441,-0.707115,0.0892705], [0.0190876,0.10657,0.994122]]; ['Land_TentA_F', [6879.74,10093.2,-0.046463], [], 0, 'CAN_COLLIDE'],[6879.76,10093.2,112.174],[[-0.410508,0.908867,-0.073785], [0.0571783,0.106415,0.992676]]; ['Land_TentA_F', [6887.15,10091.3,-0.0175018], [], 0, 'CAN_COLLIDE'],[6887.09,10091.3,112.587],[[-0.405119,0.913631,-0.0340225], [-0.0908226,-0.00318744,0.995862]]; ['CUP_GuerillaCacheBox_EP1', [6889.2,10093.1,-0.0717697], [], 0, 'CAN_COLLIDE'],[6889.2,10093.1,113.016],[[-0.0957002,0.993314,0.0645641], [-0.450922,-0.101086,0.886821]]]
	, [ ['Land_TentA_F', [6459.03,10264.5,-0.0101089], [], 0, 'CAN_COLLIDE'],[6459.02,10264.5,94.0119],[[0.981415,0.188387,0.0365303], [-0.0319725,-0.027177,0.999119]]; ['Land_TentA_F', [6465.79,10267,-0.013855], [], 0, 'CAN_COLLIDE'],[6465.75,10266.9,94.4692],[[-0.378708,0.923369,0.0630037], [-0.0556818,-0.0906821,0.994322]]; ['Land_TentA_F', [6463.2,10264.3,-0.0266571], [], 0, 'CAN_COLLIDE'],[6463.18,10264.3,94.183],[[-0.402528,0.914246,0.0461002], [-0.0271369,-0.0622558,0.997691]]; ['CUP_GuerillaCacheBox_EP1', [6465.28,10262.4,-0.106766], [], 0, 'CAN_COLLIDE'],[6465.28,10262.4,94.0779],[[-0.0600302,0.990249,0.125713], [-0.276531,-0.137509,0.951116]]]
	, [ ['Land_TentA_F', [6039.56,9982.84,-0.00627136], [], 0, 'CAN_COLLIDE'],[6039.55,9982.87,75.0028],[[0.979694,0.199945,0.0148754], [-0.023971,0.0431468,0.998781]]; ['Land_TentA_F', [6042.41,9986.78,-0.00765991], [], 0, 'CAN_COLLIDE'],[6042.39,9986.8,74.8864],[[-0.373147,0.926383,-0.0507456], [-0.0207727,0.0463403,0.99871]]; ['Land_TentA_F', [6043.36,9981.64,0.00167847], [], 0, 'CAN_COLLIDE'],[6043.34,9981.66,75.154],[[-0.391086,0.919044,-0.0490884], [-0.023971,0.0431468,0.998781]]; ['CUP_GuerillaCacheBox_EP1', [6039.15,9985.39,-0.108971], [], 0, 'CAN_COLLIDE'],[6039.15,9985.39,74.8103],[[-0.0775355,0.996983,0.00364533], [-0.265098,-0.0241412,0.963919]]]
	, [ ['Land_TentA_F', [5765.41,9659.51,-0.00354767], [], 0, 'CAN_COLLIDE'],[5765.43,9659.5,95.7246],[[0.981618,0.187217,-0.0370866], [0.0447247,-0.0367388,0.998324]]; ['Land_TentA_F', [5767.38,9661.69,-0.00661469], [], 0, 'CAN_COLLIDE'],[5767.39,9661.67,95.7461],[[-0.372097,0.926551,0.0552027], [0.0367388,-0.0447247,0.998324]]; ['Land_TentA_F', [5769.63,9656.76,-0.0246048], [], 0, 'CAN_COLLIDE'],[5769.62,9656.74,95.4545],[[-0.393779,0.918227,0.0423963], [0.00319624,-0.0447547,0.998993]]; ['CUP_GuerillaCacheBox_EP1', [5769.5,9660.82,-0.109352], [], 0, 'CAN_COLLIDE'],[5769.5,9660.82,95.5808],[[-0.0652016,0.993497,0.0933363], [-0.239599,-0.106386,0.965026]]]
	, [ ['Land_TentA_F', [5446.87,9943.1,0.0129089], [], 0, 'CAN_COLLIDE'],[5446.83,9943.24,80.7714],[[0.972679,0.231525,0.0170607], [-0.0700148,0.222489,0.972418]]; ['Land_TentA_F', [5449.11,9949.17,0.222481], [], 0, 'CAN_COLLIDE'],[5449.15,9949.3,79.9414],[[0.168126,0.960124,-0.223372], [0.0748092,0.213517,0.974071]]; ['Land_TentA_F', [5444.89,9949.07,-0.0337906], [], 0, 'CAN_COLLIDE'],[5444.94,9949.2,80.0296],[[0.95436,0.267897,-0.132018], [0.0748092,0.213517,0.974071]]; ['CUP_GuerillaCacheBox_EP1', [5446.1,9946.54,-0.103302], [], 0, 'CAN_COLLIDE'],[5446.1,9946.54,80.3253],[[-0.0917769,0.995392,-0.0277952], [-0.309907,-0.00202487,0.950765]]]
	, [ ['Land_TentA_F', [4686.79,12509.3,0.00307941], [], 0, 'CAN_COLLIDE'],[4686.83,12509.4,10.6233],[[0.977917,0.193323,-0.0793983], [0.0733477,0.0382683,0.996572]]; ['Land_TentA_F', [4688.02,12514.6,0.00809765], [], 0, 'CAN_COLLIDE'],[4688.08,12514.6,10.285],[[-0.372767,0.927924,-0.00129291], [0.119001,0.049187,0.991675]]; ['Land_TentA_F', [4689.83,12518.4,0.00869083], [], 0, 'CAN_COLLIDE'],[4689.9,12518.4,9.85826],[[-0.817131,0.571933,0.0720418], [0.128304,0.0586081,0.990002]]; ['CUP_GuerillaCacheBox_EP1', [4686.01,12512.5,-0.106679], [], 0, 'CAN_COLLIDE'],[4686.01,12512.5,10.4625],[[-0.067982,0.997625,0.0110866], [-0.172789,-0.0227175,0.984697]]]
	, [ ['Land_TentA_F', [4012.21,12179.4,0.0138817], [], 0, 'CAN_COLLIDE'],[4012.2,12179.5,39.9771],[[-0.648964,0.750824,-0.122921], [-0.00790306,0.154902,0.987898]]; ['Land_TentA_F', [4010.52,12183.9,0.00370026], [], 0, 'CAN_COLLIDE'],[4010.53,12184,39.4551],[[0.163679,0.979546,-0.117038], [0.0349539,0.112805,0.993002]]; ['Land_TentA_F', [4008.94,12177.4,0.013073], [], 0, 'CAN_COLLIDE'],[4008.93,12177.5,40.2506],[[-0.382708,0.912897,-0.141962], [-0.0158235,0.147161,0.988986]]; ['CUP_GuerillaCacheBox_EP1', [4007.98,12183.2,-0.107136], [], 0, 'CAN_COLLIDE'],[4007.98,12183.2,39.4326],[[-0.0759287,0.996866,-0.0222083], [-0.249721,0.00255161,0.968314]]]
	, [ ['Land_TentA_F', [4211.58,10842,-0.00784302], [], 0, 'CAN_COLLIDE'],[4211.56,10842,39.0334],[[0.979422,0.199443,0.0309088], [-0.0383504,0.0335562,0.998701]]; ['Land_TentA_F', [4212.68,10848.3,-0.00931168], [], 0, 'CAN_COLLIDE'],[4212.64,10848.3,38.8203],[[-0.372072,0.926507,-0.0560987], [-0.0431197,0.0431197,0.998139]]; ['Land_TentA_F', [4209.19,10837.4,0.00164413], [], 0, 'CAN_COLLIDE'],[4209.16,10837.4,39.0952],[[-0.394907,0.918034,-0.0355233], [-0.0415548,0.0207777,0.99892]]; ['CUP_GuerillaCacheBox_EP1', [4208.44,10842.9,-0.108929], [], 0, 'CAN_COLLIDE'],[4208.44,10842.9,38.8161],[[-0.079117,0.996793,0.0120408], [-0.278812,-0.0337231,0.959753]]]
	, [ ['Land_TentA_F', [3674.2,10252.2,0.0424538], [], 0, 'CAN_COLLIDE'],[3674.19,10252.2,44.1574],[[0.980758,0.195176,0.00441082], [-0.00799838,0.0175968,0.999813]]; ['Land_TentA_F', [3675.03,10257.1,-0.00839615], [], 0, 'CAN_COLLIDE'],[3675,10257.1,44.0319],[[-0.373668,0.927475,-0.0127792], [-0.00639961,0.011199,0.999917]]; ['Land_TentA_F', [3677.97,10252.1,-0.0160484], [], 0, 'CAN_COLLIDE'],[3677.96,10252.1,44.1353],[[-0.390807,0.920256,-0.0199484], [-0.00959829,0.0175966,0.999799]]; ['CUP_GuerillaCacheBox_EP1', [3672.02,10254.8,-0.110535], [], 0, 'CAN_COLLIDE'],[3672.02,10254.8,43.9675],[[-0.0699192,0.99709,0.0303719], [-0.250194,-0.0470013,0.967054]]]
	, [ ['Land_TentA_F', [2789.75,10064.1,0.00931549], [], 0, 'CAN_COLLIDE'],[2789.8,10064.2,85.8329],[[0.975789,0.195931,-0.097192], [0.0777303,0.104699,0.991462]]; ['Land_TentA_F', [2792.83,10069.5,0.0281143], [], 0, 'CAN_COLLIDE'],[2792.97,10069.6,84.6881],[[-0.361905,0.929226,0.074588], [0.154879,-0.0189653,0.987751]]; ['Land_TentA_F', [2794.25,10063.2,0.0195999], [], 0, 'CAN_COLLIDE'],[2794.18,10063.3,85.6022],[[-0.382679,0.901395,-0.202594], [-0.0939968,0.180161,0.979136]]; ['CUP_GuerillaCacheBox_EP1', [2794,10066.6,-0.0764542], [], 0, 'CAN_COLLIDE'],[2794,10066.6,84.9122],[[-0.100549,0.979876,-0.172429], [-0.305131,0.134585,0.942752]]]
	, [ ['Land_TentA_F', [2764.72,9679.29,0.0142288], [], 0, 'CAN_COLLIDE'],[2764.76,9679.39,90.6632],[[0.975144,0.198461,-0.0985261], [0.0677965,0.156089,0.985414]]; ['Land_TentA_F', [2770.22,9679.25,0.00524139], [], 0, 'CAN_COLLIDE'],[2770.22,9679.34,90.3883],[[-0.377201,0.914727,-0.144892], [-0,0.156449,0.987686]]; ['Land_TentA_F', [2767.68,9685.52,0.0121841], [], 0, 'CAN_COLLIDE'],[2767.76,9685.59,89.6938],[[-0.361676,0.9302,-0.0626028], [0.149114,0.124,0.981014]]; ['CUP_GuerillaCacheBox_EP1', [2770.26,9685.17,-0.0950623], [], 0, 'CAN_COLLIDE'],[2770.26,9685.17,89.3883],[[-0.0766417,0.994453,-0.0720312], [-0.173078,0.0578775,0.983206]]]
	, [ ['Land_TentA_F', [2442.6,9626.67,-0.00485992], [], 0, 'CAN_COLLIDE'],[2442.6,9626.7,120.913],[[0.980187,0.198016,-0.00478456], [-0.00319689,0.0399678,0.999196]]; ['Land_TentA_F', [2444.11,9630.3,0.00263977], [], 0, 'CAN_COLLIDE'],[2444.07,9630.33,120.8],[[-0.373689,0.92751,-0.00907166], [0.156036,0.0725011,0.985087]]; ['Land_TentA_F', [2448.14,9628.77,0.00278473], [], 0, 'CAN_COLLIDE'],[2448.11,9628.81,121.003],[[-0.389643,0.91861,-0.0658262], [-0.0255451,0.0606677,0.997831]]; ['CUP_GuerillaCacheBox_EP1', [2442.36,9629,-0.109474], [], 0, 'CAN_COLLIDE'],[2442.36,9629,120.74],[[-0.0729842,0.997297,0.00844652], [-0.245246,-0.0261553,0.969108]]]
	, [ ['Land_TentA_F', [2180.64,9249.62,0.00393677], [], 0, 'CAN_COLLIDE'],[2180.64,9249.7,176.705],[[0.977812,0.207277,-0.0303217], [0.00317105,0.130083,0.991498]]; ['Land_TentA_F', [2176.61,9251.23,-0.00328064], [], 0, 'CAN_COLLIDE'],[2176.6,9251.27,176.592],[[-0.377364,0.924342,-0.0564719], [0.00319202,0.0622785,0.998054]]; ['Land_TentA_F', [2171.76,9246.55,-0.0118103], [], 0, 'CAN_COLLIDE'],[2171.85,9246.54,177.668],[[-0.344008,0.935108,0.0850352], [0.174808,-0.0251981,0.98428]]; ['CUP_GuerillaCacheBox_EP1', [2181.09,9254.58,-0.0714874], [], 0, 'CAN_COLLIDE'],[2181.09,9254.58,176.034],[[-0.0678465,0.992871,-0.0980016], [-0.251911,0.0779974,0.964602]]]
	, [ ['Land_TentA_F', [3326.15,7513.58,0.00421143], [], 0, 'CAN_COLLIDE'],[3326.18,7513.64,246.684],[[0.977927,0.198565,-0.0650499], [0.0477476,0.0907182,0.994731]]; ['Land_TentA_F', [3334.23,7516.04,-0.0015564], [], 0, 'CAN_COLLIDE'],[3334.18,7516.12,246.363],[[-0.368218,0.917494,-0.150403], [-0.0648514,0.136029,0.98858]]; ['Land_TentA_F', [3334.14,7505.76,0.0211487], [], 0, 'CAN_COLLIDE'],[3334.06,7505.85,247.706],[[-0.386002,0.903852,-0.184536], [-0.116235,0.150791,0.981708]]; ['CUP_GuerillaCacheBox_EP1', [3333.4,7512.73,-0.0939789], [], 0, 'CAN_COLLIDE'],[3333.4,7512.73,246.639],[[-0.0734882,0.993741,-0.0841312], [-0.315056,0.0569063,0.947366]]]
	, [ ['Land_TentA_F', [3266.3,7370.34,0.0162354], [], 0, 'CAN_COLLIDE'],[3266.36,7370.43,277.17],[[0.973047,0.193573,-0.125339], [0.0993227,0.138736,0.985336]]; ['Land_TentA_F', [3271.76,7374.72,0.140289], [], 0, 'CAN_COLLIDE'],[3271.81,7374.84,275.926],[[-0.391621,0.907487,-0.151988], [0.0950891,0.204212,0.974297]]; ['Land_TentA_F', [3271.67,7367.81,0.0277405], [], 0, 'CAN_COLLIDE'],[3271.7,7367.93,277.166],[[-0.378367,0.909491,-0.172236], [0.0624343,0.21072,0.975551]]; ['CUP_GuerillaCacheBox_EP1', [3269.58,7371.54,-0.0799561], [], 0, 'CAN_COLLIDE'],[3269.58,7371.54,276.532],[[-0.0698198,0.978557,-0.193783], [-0.116114,0.184964,0.975862]]]
	, [ ['Land_TentA_F', [4631.78,6817.69,0.0368347], [], 0, 'CAN_COLLIDE'],[4631.93,6817.72,280.241],[[0.94845,0.186028,-0.256584], [0.252069,0.0479438,0.966521]]; ['Land_TentA_F', [4634.31,6821.19,0.0110779], [], 0, 'CAN_COLLIDE'],[4634.39,6821.11,280.167],[[-0.350003,0.918527,0.183863], [0.156519,-0.136175,0.978242]]; ['Land_TentA_F', [4638.52,6816.44,0.0144348], [], 0, 'CAN_COLLIDE'],[4638.6,6816.41,279.05],[[-0.348812,0.931522,0.102943], [0.156253,-0.0505013,0.986425]]; ['CUP_GuerillaCacheBox_EP1', [4634.75,6816.24,-0.0902405], [], 0, 'CAN_COLLIDE'],[4634.75,6816.24,279.548],[[-0.0870164,0.989653,0.114078], [-0.0848381,-0.121458,0.988964]]]
	, [ ['Land_TentA_F', [4702.08,6772.29,0.00698853], [], 0, 'CAN_COLLIDE'],[4702.15,6772.29,264.423],[[0.97036,0.190161,-0.149132], [0.140749,0.0569323,0.988407]]; ['Land_TentA_F', [4700.49,6777.45,-0.00604248], [], 0, 'CAN_COLLIDE'],[4700.5,6777.37,265.021],[[-0.373593,0.915771,0.147623], [0.0300557,-0.147112,0.988663]]; ['Land_TentA_F', [4697.13,6777.98,0.00686646], [], 0, 'CAN_COLLIDE'],[4697.16,6777.9,265.305],[[-0.353728,0.92911,0.107851], [0.151573,-0.0568428,0.98681]]; ['CUP_GuerillaCacheBox_EP1', [4699.78,6774.34,-0.0932617], [], 0, 'CAN_COLLIDE'],[4699.78,6774.34,264.616],[[-0.0683622,0.994895,0.074225], [-0.0896716,-0.0802254,0.992735]]]
	, [ ['Land_TentA_F', [4795.38,7262.55,0.011322], [], 0, 'CAN_COLLIDE'],[4795.44,7262.46,477.499],[[0.97961,0.176462,-0.0960526], [0.0987175,-0.00636511,0.995095]]; ['Land_TentA_F', [4800.86,7263.11,-0.00735474], [], 0, 'CAN_COLLIDE'],[4800.88,7263.1,477.012],[[-0.38465,0.922017,0.0439129], [0.0527072,-0.0255566,0.998283]]; ['Land_TentA_F', [4797.32,7258.57,0.0223083], [], 0, 'CAN_COLLIDE'],[4797.37,7258.47,476.623],[[-0.37378,0.906439,0.196613], [0.0972347,-0.172515,0.980196]]; ['CUP_GuerillaCacheBox_EP1', [4799.98,7259.4,-0.0791931], [], 0, 'CAN_COLLIDE'],[4799.98,7259.4,476.443],[[-0.0613953,0.97232,0.225442], [-0.152077,-0.232343,0.960671]]]
	, [ ['Land_TentA_F', [4277.58,7433.8,-0.0115967], [], 0, 'CAN_COLLIDE'],[4277.44,7433.79,342.481],[[0.950654,0.191219,0.244319], [-0.242016,-0.0356788,0.969616]]; ['Land_TentA_F', [4273.28,7433.83,-0.0123291], [], 0, 'CAN_COLLIDE'],[4273.12,7433.81,341.375],[[-0.360539,0.930752,-0.0609331], [-0.255092,-0.0355554,0.966263]]; ['Land_TentA_F', [4269.94,7431.29,0.189606], [], 0, 'CAN_COLLIDE'],[4269.82,7431.31,340.966],[[-0.416151,0.906844,-0.0667223], [-0.191561,-0.0157026,0.981355]]; ['CUP_GuerillaCacheBox_EP1', [4272,7431.2,-0.0870667], [], 0, 'CAN_COLLIDE'],[4272,7431.2,341.183],[[-0.0821794,0.996165,0.0300103], [-0.432304,-0.0627627,0.899541]]]
	, [ ['Land_TentA_F', [4114.73,7419.07,0.032196], [], 0, 'CAN_COLLIDE'],[4114.81,7419.19,352.681],[[0.966295,0.183865,-0.180185], [0.142684,0.200068,0.969337]]; ['Land_TentA_F', [4117.9,7421.09,0.0509033], [], 0, 'CAN_COLLIDE'],[4118,7421.23,351.756],[[0.891461,0.379133,-0.248105], [0.170299,0.227063,0.958875]]; ['Land_TentA_F', [4114.41,7415.43,0.0465393], [], 0, 'CAN_COLLIDE'],[4114.48,7415.58,353.741],[[0.823117,-0.564792,0.0590625], [0.103174,0.251013,0.96247]]; ['CUP_GuerillaCacheBox_EP1', [4118.27,7416.63,-0.0242615], [], 0, 'CAN_COLLIDE'],[4118.27,7416.63,352.84],[[-0.0983568,0.947598,-0.303946], [-0.0299565,0.302469,0.952688]]]
	, [ ['Land_TentA_F', [4207.58,7615.27,0.0110779], [], 0, 'CAN_COLLIDE'],[4207.53,7615.41,298.019],[[0.971016,0.2361,0.0372221], [-0.0901849,0.217692,0.971842]]; ['Land_TentA_F', [4212.3,7615.05,0.351501], [], 0, 'CAN_COLLIDE'],[4212.25,7615.2,298.778],[[-0.369256,0.895314,-0.249125], [-0.0634908,0.24314,0.967911]]; ['Land_TentA_F', [4209.12,7611.03,0.0306091], [], 0, 'CAN_COLLIDE'],[4209.06,7611.15,299.137],[[-0.379319,0.894045,-0.238329], [-0.0901234,0.220654,0.97118]]; ['CUP_GuerillaCacheBox_EP1', [4210.76,7613.57,-0.0632019], [], 0, 'CAN_COLLIDE'],[4210.76,7613.57,298.682],[[-0.0845724,0.96446,-0.250326], [-0.266492,0.220181,0.938351]]]
	, [ ['Land_TentA_F', [4214.92,7770.4,0.00653076], [], 0, 'CAN_COLLIDE'],[4214.9,7770.51,273.21],[[0.976117,0.217154,-0.00628615], [-0.031519,0.17019,0.984907]]; ['Land_TentA_F', [4218,7775.27,0.00564575], [], 0, 'CAN_COLLIDE'],[4217.98,7775.38,272.43],[[-0.374472,0.911781,-0.168601], [-0.0252119,0.171752,0.984818]]; ['Land_TentA_F', [4212.97,7766.06,0.0152283], [], 0, 'CAN_COLLIDE'],[4212.94,7766.15,273.911],[[-0.383334,0.907427,-0.172139], [-0.0393853,0.170147,0.984631]]; ['CUP_GuerillaCacheBox_EP1', [4213.92,7773.53,-0.0883484], [], 0, 'CAN_COLLIDE'],[4213.92,7773.53,272.583],[[-0.0718226,0.989647,-0.124261], [-0.272641,0.100359,0.956867]]]
	, [ ['Land_TentA_F', [4912.33,8060.09,0.00553894], [], 0, 'CAN_COLLIDE'],[4912.31,8060.19,236.778],[[-0.253421,0.952906,-0.166576], [-0.0252387,0.165626,0.985866]]; ['Land_TentA_F', [4908.02,8062.81,0.0030365], [], 0, 'CAN_COLLIDE'],[4908,8062.9,236.215],[[-0.373906,0.914996,-0.15158], [-0.0252896,0.153315,0.987854]]; ['Land_TentA_F', [4910.29,8056.9,0.0135803], [], 0, 'CAN_COLLIDE'],[4910.26,8056.99,237.269],[[-0.383225,0.909383,-0.161746], [-0.0268211,0.164085,0.986081]]; ['CUP_GuerillaCacheBox_EP1', [4909.34,8060.48,-0.0845184], [], 0, 'CAN_COLLIDE'],[4909.34,8060.48,236.582],[[-0.0759317,0.97854,-0.191553], [-0.203681,0.172835,0.96366]]]
	, [ ['Land_TentA_F', [7484.02,7311.29,0.0072937], [], 0, 'CAN_COLLIDE'],[7484.03,7311.38,261.209],[[0.977323,0.206612,-0.046377], [0.0158199,0.14716,0.988986]]; ['Land_TentA_F', [7487,7314.63,0.0161438], [], 0, 'CAN_COLLIDE'],[7487,7314.73,260.635],[[-0.373689,0.92751,-0.00907166], [0.156036,0.0725011,0.985087]]; ['Land_TentA_F', [7490.94,7308.81,0.0198364], [], 0, 'CAN_COLLIDE'],[7490.88,7308.9,261.89],[[-0.380968,0.89809,-0.219766], [0.0294266,0.249348,0.967967]]; ['CUP_GuerillaCacheBox_EP1', [7484.27,7313.68,-0.091217], [], 0, 'CAN_COLLIDE'],[7484.27,7313.68,260.764],[[-0.0782347,0.990784,-0.110571], [-0.225888,0.090409,0.969949]]]
	, [ ['Land_TentA_F', [7489.92,7409.27,0.00323486], [], 0, 'CAN_COLLIDE'],[7489.92,7409.35,245.049],[[0.978016,0.206345,-0.0301162], [0.00476373,0.122275,0.992485]]; ['Land_TentA_F', [7491.56,7414.03,0.094696], [], 0, 'CAN_COLLIDE'],[7491.56,7414.1,244.522],[[-0.376701,0.919886,-0.109112], [0.011114,0.122269,0.992435]]; ['Land_TentA_F', [7493.55,7405.69,0.0090332], [], 0, 'CAN_COLLIDE'],[7493.54,7405.78,245.489],[[-0.382046,0.914554,-0.132788], [0.00474858,0.145629,0.989328]]; ['CUP_GuerillaCacheBox_EP1', [7490.16,7412.15,-0.0979309], [], 0, 'CAN_COLLIDE'],[7490.16,7412.15,244.604],[[-0.0764718,0.993728,-0.0815849], [-0.228689,0.0621623,0.971513]]]
	, [ ['Land_TentA_F', [7487.9,7578.01,0.0188141], [], 0, 'CAN_COLLIDE'],[7487.84,7578.1,216.059],[[0.972382,0.221676,0.0730269], [-0.10556,0.138647,0.9847]]; ['Land_TentA_F', [7490.55,7585.46,-0.00836182], [], 0, 'CAN_COLLIDE'],[7490.45,7585.51,215.455],[[-0.354727,0.924064,-0.14239], [-0.165036,0.0880184,0.982352]]; ['Land_TentA_F', [7494.39,7578.17,0.00979614], [], 0, 'CAN_COLLIDE'],[7494.27,7578.23,216.85],[[-0.389662,0.904053,-0.175646], [-0.182867,0.110972,0.976855]]; ['CUP_GuerillaCacheBox_EP1', [7489.3,7581.32,-0.0873871], [], 0, 'CAN_COLLIDE'],[7489.3,7581.32,215.751],[[-0.0869372,0.993019,-0.0797152], [-0.369594,0.0421574,0.928236]]]
	, [ ['Land_TentA_F', [7456.9,7692.6,0.00572205], [], 0, 'CAN_COLLIDE'],[7456.88,7692.71,189.958],[[0.975362,0.220449,0.00837164], [-0.047234,0.171614,0.984031]]; ['Land_TentA_F', [7458.8,7697.96,0.024826], [], 0, 'CAN_COLLIDE'],[7458.78,7698.08,189.09],[[-0.373689,0.92751,-0.00907166], [0.156036,0.0725011,0.985087]]; ['Land_TentA_F', [7462.74,7692.15,0.0421448], [], 0, 'CAN_COLLIDE'],[7462.62,7692.24,190.358],[[-0.380968,0.89809,-0.219766], [0.0294266,0.249348,0.967967]]; ['CUP_GuerillaCacheBox_EP1', [7457.03,7696.91,-0.0813751], [], 0, 'CAN_COLLIDE'],[7457.03,7696.91,189.155],[[-0.0767138,0.977733,-0.195329], [-0.229755,0.173299,0.957695]]]
	, [ ['Land_TentA_F', [7489.4,7791.12,0.0155792], [], 0, 'CAN_COLLIDE'],[7489.46,7791.2,178.611],[[0.97273,0.192788,-0.128953], [0.105736,0.126253,0.986347]]; ['Land_TentA_F', [7490.69,7795.85,0.015625], [], 0, 'CAN_COLLIDE'],[7490.74,7795.92,177.863],[[-0.373689,0.92751,-0.00907166], [0.156036,0.0725011,0.985087]]; ['Land_TentA_F', [7496.63,7787.81,0.00559998], [], 0, 'CAN_COLLIDE'],[7496.64,7787.88,178.451],[[-0.378943,0.919719,-0.102567], [0.0396451,0.126865,0.991127]]; ['CUP_GuerillaCacheBox_EP1', [7489.15,7794.74,-0.0840912], [], 0, 'CAN_COLLIDE'],[7489.15,7794.74,178.088],[[-0.0761146,0.985882,-0.14914], [-0.0716415,0.14378,0.987013]]]
];

private _inRangePosition = [];
private _userPos = getPosASL player;
{
	if ([_userPos, (_x select 1), _range] call dzn_fnc_selectByRangeType) then {
		_inRangePosition pushBack _x;	
	};
} forEach _positions;


[
	[_taskName, _taskDisplayName, _taskDesc] 
	, _positions
	, [_taskSafetyReward, _taskGroups, _taskZonesProperties]
]
