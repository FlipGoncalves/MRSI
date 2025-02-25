clear
close

N = 100;

LA = 4;
LB = 3;
LC = 3;
LD = 0.1;

DH = [
      0   0  LA  pi
      0  LB   0   0   % virtual joint
      0  LC   0   0
      0   0   0   0
      0  LD   0   0
];

[P, F] = seixos3(0.5);

hold on;
grid on;
axis([-2 8 -2 8 0 4]);
view(60, 30);

AA = Tlinks(DH);
Org = LinkOrigins(AA);
h = DrawLinks(Org);
H = DrawFrames(AA, P, F);