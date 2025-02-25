clear
close

L1 = 2;
L2 = 3;

t = [0 0.5 1.2 2.0 2.6 4.0];
N = [50 50 50 50 50];

Points = [
% i  A  B  C  D  f
  4  0  1  4  2 -3
  0  3  4  2  2  3
];

Q = zeros([2, length(Points)]);
for i = 1:length(Points)
    Qi = invkinRR(Points(1,i),Points(2,i),L1,L2);
    Q(:,i) = Qi(:,1);  % cotovelo em baixo
end

[QQ, T] = MultiPolyTrajV(Q, N, t);
[QQ2, T2] = MultiPolyTrajV(Q, N, t, 1);

DH = [
    0  L1  0  0
    0  L2  0  0
];

jType = [0 0];

% com velocidades medias nulas
% subplot(2,2,1);
% plot(T, rad2deg(QQ(1,:)), T, rad2deg(QQ(2,:)));
% legend("theta1", "theta2");
% 
% subplot(2,2,2);
% hold on;
% axis equal;
% axis([-5 5 -5 5]);
% grid on;
% 
% [H, h, P, AAA] = InitRobot(QQ, 1, DH, jType, 0.2);
% AnimateRobot(H, AAA, P, h, 0.02, 1);

% com velocidades intermedias nao nulas
subplot(2,2,3);
plot(T2, rad2deg(QQ2(1,:)), T2, rad2deg(QQ2(2,:)));
legend("theta1", "theta2");

subplot(2,2,4);
hold on;
axis equal;
axis([-5 5 -5 5]);
grid on;

[H, h, P, AAA] = InitRobot(QQ2, 1, DH, jType, 0.2);
AnimateRobot(H, AAA, P, h, 0.02, 1);


