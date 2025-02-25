close all;
clear

% Add Lib to Path
addpath 'lib'

B = [0 5];
P = [2 0];
th0 = 50*pi/180;

V = 2;
w = 0;
dt = 0.2;
t = 5;

plot(B(1), B(2), 'r.', 'MarkerSize', 20)
axis equal; grid on; hold on;
axis([0 10 0 10])

x(1) = P(1);
y(1) = P(2);
plot(x(1), y(1), 'ob')

alpha = pi - th0 + atan2(B(2)-P(2), B(1)-P(1));

L2(1) = 0;
beta(1) = th0;

error = 1;
N = t / dt;
for n=2:N
    % odometry
    x(n) = x(n-1) + V*dt*cos(th0);
    y(n) = y(n-1) + V*dt*sin(th0);
    plot(x(n), y(n), 'ob')

    % localization
    Pn = [x(n) y(n)];
    beta = pi - getbdir(B, Pn, th0, error);
    L1 = norm(Pn - P);
    L2 = L1 * sin(alpha) / sin(alpha + beta);
    
    xl = B(1) + L2*cos(th0-beta);
    yl = B(2) + L2*sin(th0-beta);
    plot(xl, yl, '*r')
end




