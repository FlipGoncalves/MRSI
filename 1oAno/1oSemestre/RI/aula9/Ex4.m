clear 
close

L1 = 3;
L2 = 2;

A = [4 0]';
B = [-4 3]';

elbow = 2;

N = 100;
dr = (B - A)/N;

invA = invkinRR(A(1), A(2), L1, L2);

init = invA(:,elbow);

figure;
hold on; grid on;

for i=1:N
    % compute jacobian
    J = jacobianRRInv(init,L1,L2);

    % dq is a variation in the joint space, dr is a variation
    % in the cartesian space
    dq = J * dr;

    % plot new point
    plot(i, dq(1), 'r*');
    plot(i, dq(2), 'b+');

    % increment position
    init = init + dq;
end