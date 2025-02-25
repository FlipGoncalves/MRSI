L1 = 1; 
L2 = 1;
d3max = 1;
Qi = [0 0 0]';
Qf = [0 60*pi/180 1]';
N = 5;

DH = [
    0     0  L1  pi/2   %   theta1    0    L1     +90º
    pi/2  0   0  pi/2   % theta2+90º  0     0     +90º
    0     0  L2  0      %      0      0   L2+d3    0
];

t = [0, 0, 1];

MDH = GenerateMultiDH(DH, LinspaceVect(Qi, Qf, N), t);

[P, F] = seixos3(0.2);

hold on;
axis equal;

for i = 1:size(MDH, 3)
    AA = Tlinks(MDH(:,:,i));
    Org = LinkOrigins(AA);
    DrawLinks(Org);
    DrawFrames(AA,P,F);
end