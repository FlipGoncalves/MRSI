close all
clear

% Add Lib to Path
addpath 'lib'

ST = 600;
r = 1;
L = 4;
Dt = 0.1;

axis_ = [[-3 4 0 6]; [-10 50 0 55]; [-4 10 -8 4]];

for t=1:3
    figure;
    axis equal; grid on; hold on;
    axis(axis_(t,:))

    P0 = [0 0]';
    th0 = 0;

    P = zeros(2, ST);
    th = zeros(1, ST);
    P(:,1) = P0;
    th(1) = th0;
    s = 0.01;
    if t == 2
        s = 0.1;
    end

    [Rob, h] = DrawRobot(t, s);
    Robh = [Rob; ones(1,size(Rob,2))];
    Robh = rotat(-pi/2) * Robh;

    for n = 1:ST
        w1 = 2*sin(n*pi/ST);
        aw2 = 0.25*sin(2*n*pi/ST);
        w3 = sin(n*pi/ST);
        if t == 1
            [Vx, Vy, w] = localvels(t, r, L, aw2, w1, w3);
        else
            [Vx, Vy, w] = localvels(t, r, L, w1, aw2, w3);
        end
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
        pause(1/ST/Dt);
    end
end
