close all
clear

P = [0.5   0.5  1    0    -1    -0.5  -0.5
     0     2    2    3    2     2     0
     0     0    0    0    0     0     0
     1     1    1    1    1     1     1
    ];

h = fill3(P(1,:), P(2,:), P(3,:), 'y');

view(120,30);
axis equal;
axis([-10 10 -10 10 -10 10]);
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;
hold on;

vector = [
    0   0   4     0    0   0
    0   0   0   -pi/2  0   0
    0   0   5     0    0   0
    0   0   0     0   pi/2 0];

Pn = P;
Tbefore = eye(4);
for i = 1:size(vector,1)
    Tbefore = animate(h,P,Tbefore,vector(i,:),50);
end

