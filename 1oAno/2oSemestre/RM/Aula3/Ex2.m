close all
clear

% Add Lib to Path
addpath 'lib'

L = 0.5;
t = 5;
r = 0.1;
Dt = 0.01;

P0 = [0 0]';
th0 = 0;
w = 0;

ST = t/Dt;

P = zeros(2, ST);
th = zeros(1, ST);
P(:,1) = P0;
th(1) = th0;

ori = pi/6;

figure;
axis equal; grid on; hold on;
axis([-0.5 3 -0.5 2])

type = 1;
[Rob, h] = DrawRobot(type);
Robh = [Rob; ones(1,size(Rob,2))];
Robh = rotat(-pi/2) * Robh;

X = 2;
Y = 0;

[VR, VL] = invkinDD(X, Y, ori, L, t);
w1 = VR/r;
aw2 = VL/r;
w3 = 0;

for n = 1:ST
    [Vx, Vy, w] = localvels(type, r, L, aw2, w1, w3);
    R = orm(th(n));
    W = inv(R) * [Vx Vy w]';
    th(n+1) = th(n) + W(3) * Dt;
    P(:,n+1) = P(:,n) + W(1:2) * Dt;
    plot(P(1,n), P(2,n), ".r")
end

for i=1:size(P,2)-1
    dr = P(:,i+1) - P(:,i);
    T = transl(P(:,i+1)) * rotat(th(i));
    nRob = T * Robh;
    h.XData = nRob(1,:);
    h.YData = nRob(2,:);
    pause(1/ST);
end
