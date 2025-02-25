close all
clear

Py = [0.5   0.5  1    0    -1    -0.5  -0.5
     0     2    2    3    2     2     0
     0     0    0    0    0     0     0
     1     1    1    1    1     1     1
    ];

hy = fill3(Py(1,:), Py(2,:), Py(3,:), 'y');

axis equal;
axis([-5 5 -5 5 -5 5]);
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;
hold on;

Pz = rotz(pi/2)*rotx(pi/2)*Py;
Px = rotz(pi/2)*roty(pi/2)*Py;
hz = fill3(Pz(1,:), Pz(2,:), Pz(3,:), 'r');
hx = fill3(Px(1,:), Px(2,:), Px(3,:), 'b');

N = 300;
a = 20 * pi;
b = 20 * pi / 2;
c = 20 * pi / 3;
for i = linspace(0,1,N)
    Px_ = rotx(a*i) * Px;
    Py_ = roty(b*i) * Py;
    Pz_ = rotz(c*i) * Pz;
    set(hx, 'XData', Px_(1,:), 'YData', Px_(2,:), 'ZData', Px_(3,:));
    set(hy, 'XData', Py_(1,:), 'YData', Py_(2,:), 'ZData', Py_(3,:));
    set(hz, 'XData', Pz_(1,:), 'YData', Pz_(2,:), 'ZData', Pz_(3,:));
    pause(0.05);
end
