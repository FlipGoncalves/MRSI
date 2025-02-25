close

P1 = [-1 0]';
P2 = [1 0]';
P3 = [0 2]';
A1 = [P1 P2 P3];

fill(A1(1,:), A1(2,:), 'y');

v = [5 0]';
A2 = A1 + v;

hold on;
fill(A2(1,:), A2(2,:), 'b');
axis equal;
axis([-10 10 -10 10]);
grid on;