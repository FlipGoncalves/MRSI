clear
close all

axis equal;
axis([-1 10 -1 10 -1 10]);
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;
view(120,30)
hold on;

[P,F] = seixos3();
h = patch('Vertices',P(1:3,:)','Faces',F,'FaceColor','g');

line([0,0]', [0,0]', [0,10]')
line([0,10]', [0,0]', [0,0]')
line([0,0]', [0,10]', [0,0]')

T = eye(4);

T1 = T*trans(0,0,5)*rotx(-pi/2);
P1 = T1*P;
h1 = patch('Vertices',P1(1:3,:)','Faces',F,'FaceColor','b');

T2 = T1*trans(0,0,5)*roty(pi/2);
P2 = T2*P;
h2 = patch('Vertices',P2(1:3,:)','Faces',F,'FaceColor','b');

T3 = T2*trans(0,0,5)*rotx(-pi/2);
P3 = T3*P;
h3 = patch('Vertices',P3(1:3,:)','Faces',F,'FaceColor','b');

T4 = T3*trans(0,0,5)*roty(pi/2);
P4 = T4*P;
h4 = patch('Vertices',P4(1:3,:)','Faces',F,'FaceColor','b');

T5 = T4*trans(0,0,5)*rotx(-pi/2);
P5 = T5*P;
h5 = patch('Vertices',P5(1:3,:)','Faces',F,'FaceColor','b');






