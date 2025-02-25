clear
close

L1 = 3;
L2 = 2;

Pinit = [3 1]';
C = [2 1]';
r = 1;

N = 100;

teta = 0:2*pi/N:2*pi;
x = C(1) + r*cos(teta);
y = C(2) + r*sin(teta);
dr = diff([x; y]');

elbow = 2;
invP = invkinRR(Pinit(1), Pinit(2), L1, L2);
init = invP(:,elbow);

figure;
hold on; grid on;

for i=1:N
    % compute inverse jacobian
    J = jacobianRRInv(init,L1,L2);

    dq = J * dr(i,:)';

    % plot new point
    plot(i, dq(1), 'r*');
    plot(i, dq(2), 'b+');

    % increment position
    init = init + dq;
end
