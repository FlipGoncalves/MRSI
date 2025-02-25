close all
clear

% Add Lib to Path
addpath 'lib'

%% 2a
ST = 200;
r = 1;
L = 4;
Dt = 0.1;

w1 = 1;
aw2 = 1;
w3 = 1;

axis_ = [[0 20 -6 6]; [-3 3 0 5.3]; [-1 1 -1 1]];

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

    for n = 1:ST
        [Vx, Vy, w] = localvels(t, r, L, w1, aw2, w3);
        R = orm(th(n));
        W = inv(R) * [Vx Vy w]';
        th(n+1) = th(n) + W(3) * Dt;
        P(:,n+1) = P(:,n) + W(1:2) * Dt;
        plot(P(1,n), P(2,n), ".r")
    end
end

%% 2b e 2c
ST = 400;
r = 1;
L = 4;
Dt = 0.1;

axis_ = [[0 12 0 10]; [0 45 0 35]];

w3 = 0;
for t=1:2
    figure;
    axis equal; grid on; hold on;
    axis(axis_(t,:))

    P0 = [0 0]';
    th0 = 0;

    P = zeros(2, ST);
    th = zeros(1, ST);
    P(:,1) = P0;
    th(1) = th0;

    for n = 1:ST
        if t == 1
            w1 = 2*exp(-5*n/ST);
            aw2 = 2*exp(-n/ST);
        else
            w1 = 2;
            aw2 = sin(10*n*pi/ST);
        end
        [Vx, Vy, w] = localvels(t, r, L, w1, aw2, w3);
        R = orm(th(n));
        W = inv(R) * [Vx Vy w]';
        th(n+1) = th(n) + W(3) * Dt;
        P(:,n+1) = P(:,n) + W(1:2) * Dt;
        plot(P(1,n), P(2,n), ".r")
    end
end


%% 2d
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
end
