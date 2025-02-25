clear
close

L1 = 1;
L2 = 1;

m1 = 4;
m2 = 4;
M = 2;

DH = [0 L1 0 0
      0 L2 0 0];

MCii = [ L1/2   L2/2
         0      0
         0      0  ];

mm = [m1 m2]';

Fe = [0 0 0]';
Me = [0 0 0]';
g = [0 -10 0]';

A = [2 0]';
B = [-1 0]';

Q1 = invkinRR(A(1), A(2), L1, L2);
Q2 = invkinRR(B(1), B(2), L1, L2);

% Use first redundancy (first column of Q)
MQ = LinspaceVect(Q1(:,1), Q2(:,1), 100);

MDH = GenerateMultiDH(DH,MQ);

[FFF,MMM] = RobotMultiStatics(MDH,MCii,mm,Fe,Me,g);

plot(FFF, rad2deg(MQ(1,:)), MMM, rad2deg(MQ(2,:)));

subplot(1, 2, 1);
hold on;
axis equal;
axis([-3 3 -3 3]);
grid on;

AAA = CalculateRobotMotion(MDH);

[P, F] = seixos3(0.2);

AA = Tlinks(DH);
Org = LinkOrigins(AA);
h = DrawLinks(Org);
H = DrawFrames(AA, P, F);

subplot(1,2,2);
hold on;
axis equal;
axis([-3 3 -3 3]);
grid on;

% animate
AnimateRobot(H, AAA, P, h, 0.02, 1);



