close all
clear

P1 = [-1 0 0 1]';
P2 = [1 0 0 1]';
P3 = [0 2 0 1]';
A1 = [P1 P2 P3];

h = fill3(A1(1,:), A1(2,:), A1(3,:), 'y');

axis equal;
axis([-5 5 -5 5 -5 5]);
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;

a = 4*pi;
for i=linspace(0,a,100)
    A2 = rotx(i) * A1;
    set(h, 'XData', A2(1,:), 'YData', A2(2,:), 'ZData', A2(3,:));
    pause(0.05);
end