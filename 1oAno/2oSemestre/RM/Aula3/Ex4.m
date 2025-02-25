close all
clear

% Add Lib to Path
addpath 'lib'

L = 0.5;
r = 1;
Dt = 0.01;

P0 = [0 0]';
P1 = [3 2]';
P2 = [5 1]';
P3 = [2 -2]';

figure;
axis equal; grid on; hold on;
axis([-0.5 6 -3 3])

type = 1;
[Rob, h] = DrawRobot(type);
Robh = [Rob; ones(1,size(Rob,2))];
Robh = rotat(-pi/2) * Robh;

Points = [P0 P1 P2 P3 P0];
times = [3 4 5 4];
th0 = 0;

for t=1:size(times, 2)
    ST = t/Dt;

    P_now = Points(:,t);
    P_next = Points(:,t+1);

    P = zeros(2, ST*2);
    th = zeros(1, ST*2);
    P(:,1) = P_now;
    th(1) = th0;

    X = P_next(1) - P_now(1);
    Y = P_next(2) - P_now(2);

    [VR, VL] = invkinDDxy(0, 0, L, t, X, Y);
    w1 = VR/r;
    aw2 = VL/r;
    w3 = 0;

    for n = 1:ST
        [Vx, Vy, w] = localvels(type, r, L, aw2, w1, w3);
        R = orm(th(n));
        W = inv(R) * [Vx Vy w]';
        th(n+1) = th(n) + W(3) * Dt;
        P(:,n+1) = P(:,n) + W(1:2) * Dt;
    end

    [VR, VL] = invkinDDxy(X, Y, L, t, 0, 0);
    w1 = VR/r;
    aw2 = VL/r;
    w3 = 0;

    for n = 1:ST
        i = n + ST;
        [Vx, Vy, w] = localvels(type, r, L, aw2, w1, w3);
        R = orm(th(i));
        W = inv(R) * [Vx Vy w]';
        th(i+1) = th(i) + W(3) * Dt;
        P(:,i+1) = P(:,i) + W(1:2) * Dt;
    end

    for i=1:size(P,2)-1
        plot(P(1,i), P(2,i), ".r")
        T = transl(P(:,i+1)) * rotat(th(i));
        nRob = T * Robh;
        h.XData = nRob(1,:);
        h.YData = nRob(2,:);
        pause(1/ST);
    end
end