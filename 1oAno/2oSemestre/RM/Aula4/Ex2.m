close all
clear

% Add Lib to Path
addpath 'lib'

figure;
axis equal; grid on; hold on;
axis([0 3 -0.8 1.2])

wheel_d = 0.20;
wheel_s = 0.80;
pulses = 1024;
steering = 1;
n = 1;

S = [0,219,442,674,875,1113,1350,1520,1744,2001,2214,2440,2723,2934,3127,3399,3594,3860,4080,4321,4533,4701];
alpha = [0, 0, 5, 5, 8, 8, 10, 10, 10, 12, 10, 7, 6, 3, -4, -8, -10, -12, -14, -12, -10, -8];

k = (pi * wheel_d) / (n * pulses);

theta = zeros(1, size(S, 2));
pos_x = zeros(1, size(S, 2));
pos_y = zeros(1, size(S, 2));

% considering it starts at (0,0,0)
for i=2:size(S, 2)
    Vi = (S(i) - S(i-1)) * k;
    thetai = alpha(i) * pi / 180 * steering;
    theta(i) = theta(i-1) + (Vi / wheel_s) * sin(thetai);
    pos_x(i) = pos_x(i-1) + Vi * cos(thetai) * cos(theta(i));
    pos_y(i) = pos_y(i-1) + Vi * cos(thetai) * sin(theta(i));
end

title("x=" + round(pos_x(end), 2) + "; y=" + round(pos_y(end), 2) + "; theta=" + round(theta(end) * 180 / pi))
plot(pos_x, pos_y)
