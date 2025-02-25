close all
clear

% Add Lib to Path
addpath 'lib'

figure;
axis equal; grid on; hold on;
axis([-0.1 0.6 0 0.7])

wheel_d = 0.20;
wheel_s = 0.60;
pulses = 2048;
n = 1;

R = [0,223,446,669,892,1115,1338,1561,1784,2007,2230,2453,2676,2899,3122,3345,3568,3791,4014,4237,4460,4683];
L = [0,120,240,360,480, 600, 720, 840, 960, 810, 750, 690, 630, 570, 510, 450, 621, 873,1125,1377,1629,1881];

k = (pi * wheel_d) / (n * pulses);

theta = zeros(1, size(R, 2));
pos_x = zeros(1, size(R, 2));
pos_y = zeros(1, size(R, 2));

% considering it starts at (0,0,0)
for i=2:size(R, 2)
    deltaL = (L(i) - L(i-1)) * k;
    deltaR = (R(i) - R(i-1)) * k;

    theta_i = (deltaR - deltaL) / wheel_s;
    l_i = (deltaR + deltaL) / 2;

    theta(i) = theta(i-1) + theta_i;
    pos_x(i) = pos_x(i-1) + l_i * cos(theta(i));
    pos_y(i) = pos_y(i-1) + l_i * sin(theta(i));
end

title("x=" + round(pos_x(end), 2) + "; y=" + round(pos_y(end), 2) + "; theta=" + round(theta(end) * 180 / pi))
plot(pos_x, pos_y)