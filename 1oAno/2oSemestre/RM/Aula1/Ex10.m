close all
clear

% Add Lib to Path
addpath 'lib'

%              Sn1               Sn2
%               |                 |
R = [ 0 0   0.5 0 2  0  0    0.5  0    % x
      1 1.1 1.1 1 0 -1 -1.1 -1.1 -1    % y
    ];

Rh = [R; ones(1,width(R))];

hR = fill(Rh(1,:), Rh(2,:), 'y');
axis equal; grid on; hold on;
axis([-2 12 -9 9])

% Local Placement of Sensors
TS1 = [1 0 0
       0 1 1
       0 0 1];
TS2 = [1 0  0
       0 1 -1
       0 0  1];
Sn1 = [0  1 1]';     % homog
Sn2 = [0 -1 1]';     % homog

L = 2;            % Distance between wheels
S = [10 5]';      % Source Position
plot(S(1), S(2), '*b')
P = [0 0]';       % Center Position
th = 0;           % Initial Orientation

k = 10;
N = 100;
Dt = 1;

allP = zeros(N,2);
allP(1,:) = P;
allangle = zeros(1,N);
allangle(1) = th;
for n = 1:N
    Sn1c = transl(allP(n,:)) * rotat(allangle(n)) * TS1 * Sn1;
    Sn2c = transl(allP(n,:)) * rotat(allangle(n)) * TS2 * Sn2;
    d1 = norm(Sn1c(1:2) - S);
    d2 = norm(Sn2c(1:2) - S);

    vL = k/d1^2;
    vR = k/d2^2;

    w = (vR - vL)/L;
    v = (vR + vL)/2;

    % vT = vL;
    % vL = vR;
    % vR = vT;

    Dl = v*Dt;
    Dth = w*Dt;
    th = th + Dth;
    allP(n+1,:) = allP(n,:)' + Dl * [cos(th); sin(th)];
    allangle(n+1) = th;
end

plot(allP(:,1), allP(:,2), '.r');
for n=1:height(allP)
    T = transl(allP(n,:)) * rotat(allangle(n));
    nR = T * Rh;
    hR.XData = nR(1,:); hR.YData = nR(2,:);
    pause(0.05);
end



