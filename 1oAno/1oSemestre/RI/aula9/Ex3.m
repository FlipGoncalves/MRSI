close
clear

L1 = 3;
L2 = 2;

A = [4 0]';
B = [-3 1]';

invA = invkinRR(A(1), A(2), L1, L2);
invB = invkinRR(B(1), B(2), L1, L2);

% the difference is here: now the angle is positive and the linspace goes
% from a positive angle to another positive angle, thus doing the
% trajectory along the positive y axis
invB(1,2) = invB(1,2) + 2*pi;

elbow = 2;

N = 100;
dq = (invB(:,elbow) - invA(:,elbow))/N;
init = invA(:,elbow);

figure;
hold on; grid on;

for i=1:N
    % compute jacobian
    J = jacobianRR(init,L1,L2);

    % dq is a variation in the joint space, dr is a variation
    % in the cartesian space
    dr = J * dq;

    % plot new point
    plot(i, dr(1), 'r*');
    plot(i, dr(2), 'b+');

    % increment position
    init = init + dq;
end