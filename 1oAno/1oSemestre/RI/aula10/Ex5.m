close;
clear;

L1 = 3;
L2 = 2;

% RR planar
DH = [
    0 L1 0 0
    0 L2 0 0
];

x0 = 2;
y0 = 1;
r = 1.5;

piLin = linspace(0,2*pi,250);
x = x0 + cos(piLin)*r;
y = y0 + sin(piLin)*r;
dr = [diff(x); diff(y)]';

QA = invkinRR(4.5,1,L1,L2);
init = QA(:,1);

QQ = zeros(2, 200);
QQ(:,1) = init;

for i = 1:length(x)-1
    dq = jacobianRRInv(init,L1,L2) * dr(i,:)';
    init = init + dq;
    QQ(:,i+1) = init;
end

hold on;
axis equal;
axis([-5 5 -5 5]);
grid on;

[H,h,P,AAA] = InitRobot(QQ,1,DH,[0 0],0.2);
AnimateRobot(H,AAA,P,h,0.02,1);