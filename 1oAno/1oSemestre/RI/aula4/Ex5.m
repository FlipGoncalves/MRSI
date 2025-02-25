close all
clear

DH = [
     0     0  3  0
     pi/4  3  0  0
    -pi/4  2  0  0
];

AA = Tlinks(DH);
Org = LinkOrigins(AA);

[P, F] = seixos3(0.5);

h = DrawLinks(Org);
H = DrawFrames(AA, P, F);