close all
clear

% Add Lib to Path
addpath 'lib'

R = [ 0 0  2
      1 -1 0
    ];

Rh = R; 
Rh(3,:) = 1;

hR = fill(Rh(1,:), Rh(2,:), 'y');
axis equal; grid on; hold on;

Pi = [0, 0];
S = [10, 5];
k = 10;
a = pi/4;

plot(Pi(1), Pi(2), '*b', S(1), S(2), '*m');
axis([-2 17 -2 17])

N = 100;
Dt = 1;
allangle = [];
allv = zeros(N);
P = zeros(N,2);
P(1,:) = Pi;
for n = 1:N
    d = norm(P(n,:) - S);     % (distance to source)
    v = k/(d^2);         % excitatory
    % v = k*d -> inhibitory
    P(n+1,:) = P(n,:) + v*[cos(a); sin(a)]'*Dt;

    allv(n) = v;
    allangle = cat(2, allangle, a);
end

plot(P(:,1), P(:,2), '.r');
for n=1:height(P)
    T = transl(P(n,:)') * rotat(allangle(n));
    nR = T * Rh;
    hR.XData = nR(1,:); hR.YData = nR(2,:);
    pause(0.05);
end



