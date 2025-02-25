clear
close all

axis equal;
axis([-1 10 -1 10 -1 10]);
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;
view(120,30)
hold on;

[P,F] = seixos3();
h = patch('Vertices',P(1:3,:)','Faces',F,'FaceColor','g');

line([0,0]', [0,0]', [0,10]')
line([0,10]', [0,0]', [0,0]')
line([0,0]', [0,10]', [0,0]')

NN = 10;
T(:,:,:,1) = mtrans(0,0,linspace(0,5,NN)); 
T(:,:,:,2) = mrotx(linspace(0,-pi/2,NN)); 
T(:,:,:,3) = mtrans(0,0,linspace(0,5,NN)); 
T(:,:,:,4) = mroty(linspace(0,pi/2,NN)); 
T(:,:,:,5) = mtrans(0,0,linspace(0,5,NN)); 
T(:,:,:,6) = mrotx(linspace(0,-pi/2,NN)); 
T(:,:,:,7) = mtrans(0,0,linspace(0,5,NN)); 
T(:,:,:,8) = mroty(linspace(0,pi/2,NN));
T(:,:,:,9) = mtrans(0,0,linspace(0,5,NN)); 
T(:,:,:,10) = mrotx(linspace(0,-pi/2,NN)); 

order = [1 1 1 1 1 1 1 1 1 1];
Tcurr = eye(4);

pause();
for n=1:size(T,4)
    Tcurr = manimate(h, P, Tcurr, T(:,:,:,n) , order(n));
    pause(0.1);
end



