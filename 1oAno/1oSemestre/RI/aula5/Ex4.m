L1 = 2; 
L2 = 1;
Qi = [0 0]';
Qf = [60*pi/180 60*pi/180]';
N = 7;

DH = [0 L1 0 0
      0 L2 0 0];

MDH = GenerateMultiDH(DH, LinspaceVect(Qi, Qf, N));

[P, F] = seixos3(0.2);

hold on;
axis equal;

for i = 1:size(MDH, 3)
    AA = Tlinks(MDH(:,:,i));
    Org = LinkOrigins(AA);
    DrawLinks(Org);
    DrawFrames(AA,P,F);
end