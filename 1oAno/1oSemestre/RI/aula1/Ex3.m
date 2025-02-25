close

P1 = [-1 0]';
P2 = [1 0]';
P3 = [0 2]';
A1 = [P1 P2 P3];

N = 50;

h = fill(A1(1,:), A1(2,:), 'c');
axis equal;
axis([-10 10 -10 10]);
grid on;

A1h = [A1; 1 1 1]; % homogeneous coords

u1 = [3 4]';
for i = linspace(0,1,N)
    uStep = u1 * i;
    An = TransGeom(uStep(1), uStep(2), 0)*A1h;
    set(h, 'XData', An(1,:), 'YData', An(2,:));
    pause(0.05);
end

A1h = An;
alpha = 80;
for i = linspace(0,1,N)
    alphaStep = alpha * i;
    An = TransGeom(0, 0, alphaStep)*A1h;
    set(h, 'XData', An(1,:), 'YData', An(2,:));
    pause(0.05);
end

A1h = An;
u2 = [2 -5]';
for i = linspace(0,1,N)
    uStep = u2 * i;
    An = TransGeom(uStep(1), uStep(2), 0)*A1h;
    set(h, 'XData', An(1,:), 'YData', An(2,:));
    pause(0.05);
end
