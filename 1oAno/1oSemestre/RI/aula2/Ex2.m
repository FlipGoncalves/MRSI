close all
clear

P = [0.5   0.5  1    0    -1    -0.5  -0.5
     0     2    2    3    2     2     0
     0     0    0    0    0     0     0
     1     1    1    1    1     1     1
    ];

h = fill3(P(1,:), P(2,:), P(3,:), 'y');

axis equal;
axis([-5 5 -5 5 -5 5]);
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;
hold on;

P1 = rotz(pi/2)*rotx(pi/2)*P;
P2 = rotz(pi/2)*roty(pi/2)*P;
h1 = fill3(P1(1,:), P1(2,:), P1(3,:), 'r');
h2 = fill3(P2(1,:), P2(2,:), P2(3,:), 'b');