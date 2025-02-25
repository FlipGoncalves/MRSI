close all
clear

      % th    l   d al
DH = [ -pi/4  1   0 0;
        pi/2  1.5 0 0;
       -pi/3  0.5 0 0;
     ];

AA = Tlinks(DH);
Org = LinkOrigins(AA);

% Org = 0  0.7071 1.7678 2.2507
%       0 -0.7071 0.3536 0.2241
%       0  0      0      0

[P, F] = seixos3(0.5);

h = DrawLinks(Org);
H = DrawFrames(AA, P, F);