clear
close

%% Verify RobotCOMabs

L1 = 2;
L2 = 1;

DH = [pi/4 L1 0 0
      -pi/4 L2 0 0];

MCii = [ L1/2   L2/2
         0      0
         0      0  ];

MCA = RobotCOMabs(DH, MCii);

% [ sqrt(2)/2    sqrt(2)+0.5
%   sqrt(2)/2    sqrt(2)
%   0            0           ]

%% Verify RobotPotentialEnergy

L1 = 2;
L2 = 1;

DH = [pi/4 L1 0 0
      -pi/4 L2 0 0];    % DH para a posicao (pi/4 -pi/4)

MCii = [ L1/2   L2/2
         0      0
         0      0  ];

m1 = 3;
m2 = 2;

mm = [m1 m2]';
g = [0 -10 0]';

P = RobotPotentialEnergy(DH, mm, MCii, g)

% 49.4975

%% Verify RobotPotentialEnergy 2

L1 = 2;
L2 = 1.5;

DH = [0 L1 0 0
      0 L2 0 0];

MCii = [ L1/2   L2/2
         0      0
         0      0  ];

m1 = 3;
m2 = 2;

mm = [m1 m2]';
jTypes = [0 0]';
g = [0 -10 0]';

QQ = [0 3/4*pi
      0 pi/4  ];

NN = 50;

t0 = 0;
tf = 2;

Dt = tf / NN;   % intervalo de simulacao

Qv0 = [0 0]';
Qvf = Qv0;

[MQ, tt] = PolyTrajV(QQ(:,1), QQ(:,2), Qv0, Qvf, NN, t0, tf);

MDH = GenerateMultiDH(DH, MQ, jTypes);

P = RobotPotentialEnergy(MDH, mm, MCii, g);

plot(P);

%% Verify AccTlinks

DH = [0 2 0 0
      pi/2 2 0 0
      0 1 0 0];

AAc = AccTlinks(DH);

%% Verify jaconbianGeom

L1 = 2; 
L2 = 1.5; 
Q = [pi/2 -pi/2]';

JA = jacobianRR(Q, L1, L2);

DH = [0 L1 0 0
      0 L2 0 0];

MQ = Q;
jTyp = [0 0]';

JB = jacobianGeom(DH, MQ, jTyp);

% JA = [-2  0
%       1.5 1.5 ]

% JB = [-2  0
%       1.5 1.5
%       0   0
%       0   0
%       0   0
%       1   1  ]


