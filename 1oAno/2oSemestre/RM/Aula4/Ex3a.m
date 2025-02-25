close all;
clear

% Add Lib to Path
addpath 'lib'

figure;
axis equal; grid on; hold on;
axis([-1 1 -1 1 -1 1])

% Define the vertices of the smartphone
vertices = [0.5 0.5 -0.5 -0.5 0.5 0.5 -0.5 -0.5     % X
            0.8 -0.8 -0.8 0.8 0.8 -0.8 -0.8 0.8     % Y
            0.1 0.1 0.1 0.1 -0.1 -0.1 -0.1 -0.1];   % Z

% Define the faces of the smartphone
faces = [1 2 6 5    % front
         4 3 7 8    % back
         1 4 8 5    % left
         2 3 7 6    % right
         1 2 3 4    % top
         5 6 7 8];  % bottom

% Plot the initial orientation of the model
h = patch('Vertices', vertices', 'Faces', faces, 'FaceColor', 'b');
view(3);

% connect to the smartphone
m = mobiledev;

pause();

while 1
    % get acceleration
    accel = m.Acceleration;
    
    g = accel/norm(accel);
    gx = g(1);
    gy = g(2);
    gz = g(3);
    
    % calculate pitch and roll
    pitch = atan2(-gx, sqrt(gy^2 + gz^2));
    roll = atan2(gy,gz);
    
    R_pitch = roty(pitch);
    R_roll = rotx(roll);

    % Compute rotated vertices
    rotated_vertices = R_roll(1:3,1:3) * R_pitch(1:3,1:3) * vertices;
    
    % Update plot with rotated vertices
    h.Vertices = rotated_vertices';
    pause(0.1);
end
