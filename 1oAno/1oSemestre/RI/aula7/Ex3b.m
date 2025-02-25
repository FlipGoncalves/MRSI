close all
clear

% Link lengths
L1 = 4; 
L2 = 2;

 % Base DH matrix
DH = [
    0 L1 0 0
    0 L2 0 0
];

% Starting configuration
Qi = invkinRR ( 4 , 0 , L1 , L2 );
% Ending configuration
Qf = invkinRR ( -2 , 2 , L1 , L2 );

% Use redundancy 1
QQ =[ Qi(: ,1) Qf(: ,1)];

axis equal;
axis ([ -6 6 -3 6 -6 6]);
hold on; 
grid on;
xlabel('X'); 
ylabel('Y');
zlabel('Z');

[H ,h ,P , AAA ]= InitRobot ( QQ ,50 , DH );

AnimateRobot(H, AAA, P, h, 0.05, 1);

