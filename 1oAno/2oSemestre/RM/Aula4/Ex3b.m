close all;
clear

% Add Lib to Path
addpath 'lib'

dt = 0.1;
N = 100;

% connect to the smartphone
m = mobiledev;

pause();

pos = zeros(3,N);
ori = zeros(3,N);
for i=2:N
    % get acceleration
    a = m.Acceleration';
    vel = a * dt;
    pos(:,i) = pos(:,i-1) + vel * dt;

    % get angular velocity
    w = m.AngularVelocity';
    ori(:,i) = ori(:,i-1) + w * dt;
end

