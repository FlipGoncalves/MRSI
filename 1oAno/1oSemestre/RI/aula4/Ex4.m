close all
clear

DH_RR = [
    0  3  0  0
    0  2  0  0
];

DH_RRR = [
    0  3  0  0
    0  2  0  0
    0  2  0  0
];

DH_RR3D = [
    0  0  3  pi/2
    0  2  0  0
];

DH_RRA = [
    0  0  3  pi/2
    0  2  0  0
    0  2  0  0
];

%% RR

AA_RR = Tlinks(DH_RR);
Org_RR = LinkOrigins(AA_RR);

[P_RR, F_RR] = seixos3(0.5);

h_RR = DrawLinks(Org_RR);
H_RR = DrawFrames(AA_RR, P_RR, F_RR);

%% RRR

AA_RRR = Tlinks(DH_RRR);
Org_RRR = LinkOrigins(AA_RRR);

[P_RRR, F_RRR] = seixos3(0.5);

h_RRR = DrawLinks(Org_RRR);
H_RRR = DrawFrames(AA_RRR, P_RRR, F_RRR);

%% RR a 3D

AA_RR3D = Tlinks(DH_RR3D);
Org_RR3D = LinkOrigins(AA_RR3D);

[P_RR3D, F_RR3D] = seixos3(0.5);

h_RR3D = DrawLinks(Org_RR3D);
H_RR3D = DrawFrames(AA_RR3D, P_RR3D, F_RR3D);

%% RRR antropomórfico

AA_RRA = Tlinks(DH_RRA);
Org_RRA = LinkOrigins(AA_RRA);

[P_RRA, F_RRA] = seixos3(0.5);

h_RRA = DrawLinks(Org_RRA);
H_RRA = DrawFrames(AA_RRA, P_RRA, F_RRA);
