L1 = 3;
L2 = 2;

DH = [
    0  L1  0  0
    0  L2  0  0
];

p1 = [4;0];
p2 = [-1;1];

Q1 = invkinRR(p1(1), p1(2), L1, L2);
Q2 = invkinRR(p2(1), p2(2), L1, L2);

% Use first redundancy (first column of Q)
MQ = LinspaceVect(Q1(:,1), Q2(:,1), 100);

MDH = GenerateMultiDH(DH,MQ);
AAA = CalculateRobotMotion(MDH);

[P, F] = seixos3(0.2);

hold on;
grid on;
axis([-4 4 -4 4]);

AA = Tlinks(DH);
Org = LinkOrigins(AA);
h = DrawLinks(Org);
H = DrawFrames(AA, P, F);

% animate
AnimateRobot(H, AAA, P, h, 0.02, 1);

