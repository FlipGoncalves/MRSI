QA = [1 3 -2]';
QB = [4 0 -4]';
QC = [3 5 0]';
QD = [6 -1 3]';

N = 3;

LinAB = LinspaceVect(QA,QB,N);
LinBC = LinspaceVect(QB,QC,N);
LinCD = LinspaceVect(QC,QD,N);

MMQ = [LinAB(:,1:end-1) LinBC(:,1:end-1) LinCD];

hold on;
plot(MMQ(1,:));
plot(MMQ(2,:));
plot(MMQ(3,:));