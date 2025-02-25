close all
clear

axis equal;
axis ([ -6 6 -3 6 -6 6]);
hold on; 
grid on;
xlabel('X'); 
ylabel('Y');
zlabel('Z');

L1 = 4;
L2 = 2;

DH = [
    0 L1 0 0
    0 L2 0 0
];

P1 = [4 0];
P2 = [-2 2];

Qi = invkinRR(P1(1), P1(2), L1, L2);
Qf = invkinRR(P2(1), P2(2), L1, L2);

MQ_22 = LinspaceVect(Qi(:,2), Qf(:,2), 50);  % Use redundancy 2
MQ_12 = LinspaceVect(Qi(:,1), Qf(:,2), 50);  % Start in redundancy 1, end in 2
MQ_21 = LinspaceVect(Qi(:,2), Qf(:,1), 50);  % Start in redundancy 2, end in 1

MDH_22 = GenerateMultiDH(DH, MQ_22);
MDH_12 = GenerateMultiDH(DH, MQ_12);
MDH_21 = GenerateMultiDH(DH, MQ_21);

AAA_22 = CalculateRobotMotion(MDH_22);
AAA_12 = CalculateRobotMotion(MDH_12);
AAA_21 = CalculateRobotMotion(MDH_21);

[x,y,z] = RobotEndPath(AAA_22);
plot3(x,y,z,'r-');
[x,y,z] = RobotEndPath(AAA_12);
plot3(x,y,z,'g-');
[x,y,z] = RobotEndPath(AAA_21);
plot3(x,y,z,'b-');

% draw robot on initial position
[P, F] = seixos3(0.4);
Org = LinkOrigins(AAA_22(:,:,:,1));
h = DrawLinks(Org);
H = DrawFrames(AAA_22(:,:,:,1), P, F);

AnimateRobot(H, AAA_22, P, h, 0.05, 1);

