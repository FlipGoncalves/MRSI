clear
close

L1 = 3;
L2 = 2;
A = [2 0];
B = [-4 2];

N = 100;

invA = invkinRR(A(1), A(2), L1, L2);
invB = invkinRR(B(1), B(2), L1, L2);

t0 = 0;
tf = 4;

Av = [0; 0];
Bv = [0; 0];

[QQ, t] = PolyTrajV(invA(:,2), invB(:,2), Av, Bv, N, t0, tf);

DH = [
    0  L1  0  0
    0  L2  0  0
];

jType = [0 0];

subplot(1,2,1);
plot(t, rad2deg(QQ(1,:)), t, rad2deg(QQ(2,:)));
legend("theta1", "theta2");

subplot(1,2,2);
hold on;
axis equal;
axis([-5 5 -5 5]);
grid on;

[H, h, P, AAA] = InitRobot(QQ, 1, DH, jType, 0.2);
while true
    AnimateRobot(H, AAA, P, h, 0.02, 1);
end


