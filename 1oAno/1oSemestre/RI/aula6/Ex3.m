clear
close

N = 100;

L1 = 2;
L2 = 2;
L3 = 1;

Qi = [0 0 0]';
QA = [pi/2 pi/4 -pi/4]';
Qf = [0 -pi/4 pi/4]';

DH = [
    0  0  L1  pi/2
    0  L2  0  0
    0  L3  0  0
];

MQ = [LinspaceVect(Qi, QA, 100), LinspaceVect(QA, Qf, 100), LinspaceVect(Qf, Qi, 100)];
MDH = GenerateMultiDH(DH,MQ);
AAA = CalculateRobotMotion(MDH);

[P, F] = seixos3(0.2);

hold on;
grid on;
axis([-4 4 -4 4 0 4]);
view(60, 30);

AA = Tlinks(DH);
Org = LinkOrigins(AA);
h = DrawLinks(Org);
H = DrawFrames(AA, P, F);

% animate
while 1
    AnimateRobot(H, AAA, P, h, 0.01);
end