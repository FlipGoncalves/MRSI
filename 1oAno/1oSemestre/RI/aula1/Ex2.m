close

P1 = [-1 0]';
P2 = [1 0]';
P3 = [0 2]';
A1 = [P1 P2 P3];

fill(A1(1,:), A1(2,:), 'y');

v = [5 0]';
A2 = A1 + v;

hold on;
fill(A2(1,:), A2(2,:), 'r');

A3 = rot(50) * A2;
fill(A3(1,:), A3(2,:), 'b');

axis equal;
axis([-10 10 -10 10]);
grid on;

N = 10;
for i=linspace(50,350,50)
    A4 = rot(i) * A2;
    set(fill(A4(1,:), A4(2,:), 'c'));
    pause(0.2);
end