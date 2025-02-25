clear 
close

L1 = 2;
L2 = 3;
L3 = 1;

A = [3, -1, 0];
B = [-1, 1, 4];

axis equal;
axis([-5 5 -5 5 -3 6]);
view(120,30)
hold on;                    
grid on;                                
xlabel('X');
ylabel('Y');
zlabel('Z');

DH = [
    0  0  L1  pi/2
    0  L2  0  0
    0  L3  0  0
];    

Qi = invkinRRRanthro(A(1),A(2),A(3),L1,L2,L3);
Qf = invkinRRRanthro(B(1),B(2),B(3),L1,L2,L3);
QQ = zeros(height(Qi), 2, size(Qi, 2));

AAA = cell(1, 4);
[H,h,P,AAA{1}] = InitRobot([Qi(:,1) Qf(:,1)], 50, DH);

for i = 1:4
    QQ(:,:,i) = [Qi(:,2) Qf(:,i)];

    MQ = LinspaceVect(QQ(:,1,i), QQ(:,2,i), 50);
    MDH = GenerateMultiDH(DH, MQ);
    AAA{i} = CalculateRobotMotion(MDH);
    
    [x,y,z] = RobotEndPath(AAA{i});
    plot3(x,y,z,'r-');
end


while 1
    for i = 1:length(AAA)
        AnimateRobot(H,AAA{i},P,h,0.02,1);
    end
end






