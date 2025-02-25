close all
clear

% Add Lib to Path
addpath 'lib'

ST = 400;
r = 1;
L = 4;
Dt = 0.1;

t = 3;

axis_ = [[-45 0 -15 15]; [-3 7 -8 1]];

for i=1:2
    figure;
    axis equal; grid on; hold on;
    axis(axis_(i,:))

    P0 = [0 0]';
    th0 = 0;

    P = zeros(2, ST);
    th = zeros(1, ST);
    P(:,1) = P0;
    th(1) = th0;

    for n = 1:ST
        if i == 1
            w1 = 0;
            aw2 = -1;
            w3 = 1;
        else
            w1 = 1;
            aw2 = 0;
            w3 = 1;
        end
        [Vx, Vy, w] = localvels(t, r, L, w1, aw2, w3);
        R = orm(th(n));
        W = inv(R) * [Vx Vy w]';
        th(n+1) = th(n) + W(3) * Dt;
        P(:,n+1) = P(:,n) + W(1:2) * Dt;
        plot(P(1,n), P(2,n), ".r")
    end
end
