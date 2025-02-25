clear 
close

axis equal;
axis([-5 5 -5 5 -3 6]);
view(120,30)
hold on;                    
grid on;                                
xlabel('X');
ylabel('Y');
zlabel('Z');

LA = 3;
LB = 3;
LC = 2;
LD = 0.5;

DH = [
      0   0  LA  pi/2
      0  LB   0  pi/2
      0  LC   0   0
      0   0   0   0
      0   0  LD   0
];   

PP = [  0 -2 0 0
        2 -2 0 0
        4  0 0 0
        2  2 0 0
        0  2 0 0
];

N = 30;

for pos = 1:size(PP, 1)-1
    init = PP(pos,:);
    dest = PP(pos+1,:);

    Qi = invkinSCARA(init(1),init(2),init(3),init(4),LA,LB,LC,LD);
    Qf = invkinSCARA(dest(1),dest(2),dest(3),dest(4),LA,LB,LC,LD);
    QQ = [Qi(:,1) Qf(:,1)];
    QQ = [QQ(1,:); zeros(1, size(QQ, 2)); QQ(2:end,:)];

    [H,h,P,AAA] = InitRobot(QQ, N, DH, [0 0 0 1 0]', 0.2);
    
    [x,y,z] = RobotEndPath(AAA);
    plot3(x,y,z,'r-');

    AnimateRobot(H,AAA,P,h,0.02,1);
end









