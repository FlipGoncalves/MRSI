clear 
close

L1 = 3;
L2 = 2;

A = [4 0]';
B = [-3 1]';

invA = invkinRR(A(1), A(2), L1, L2);
invB = invkinRR(B(1), B(2), L1, L2);

elbow = 1;

N = 100;
dq = (invB(:,elbow) - invA(:,elbow))/N;
init = invA(:,elbow);

subplot(1,2,1);
hold on;
grid on;

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

DH = [
    0  L1  0  0
    0  L2  0  0
];

NN = N;
QQ = [invA(:,elbow) invB(:,elbow)];
jtype = [0 0];

subplot(1,2,2);
hold on;
grid on;
axis([-5 5 -5 5]);

[H,h,P,AAA] = InitRobot(QQ, NN, DH, jtype, 0.75);
pause();
while 1
    AnimateRobot(H, AAA, P, h, 0.02, 1);
end


