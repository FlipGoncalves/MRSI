clear
close

L1 = 2;
L2 = 1;

DH = [0 L1 0 0
      0 L2 0 0];

MCii = [ L1/2   L2/2
         0      0
         0      0  ];

mm = [3 2]';

Fe = [0 0 0]';
Me = [0 0 0]';

g = [0 -10 0]';

[FF, MM] = RobotStatics(DH, MCii, mm, Fe, Me, g);


