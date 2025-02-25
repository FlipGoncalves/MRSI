close all
clear

axis equal;
axis ([ -6 6 -3 6 -6 6]);
hold on; 
grid on;
xlabel('X'); 
ylabel('Y');
zlabel('Z');

L1 = 2;
L2 = 1;
L3 = 1;

DH = [
    0 L1 0 0
    0 L2 0 0
    0 L3 0 0
];

P1 = [2 -1];
P2 = [2 2.5];

phi = 0;

Qi = invkinRRR(P1(1), P1(2), phi, L1, L2, L3);
Qf = invkinRRR(P2(1), P2(2), phi, L1, L2, L3);

QQ = [Qi(:,1) Qf(:,1)];

[H,h,P,AAA] = InitRobot(QQ, 50, DH);    
pause;                                 
AnimateRobot(H,AAA,P,h,0.05,1);


