function [pFinal] = animate(h,P, pInitial, D, N)
% Animates a transformation on a set of points P
% h - object's graphic handle
% P - object's point matrix in homogeneous format
% pInitial - transformation matrix of object's initial position
% D - vector of increments to the object's local referential
% formated as [x,y,z,phi,teta,psi]
% N - number of animation steps
% pFinal - matrix with objects final position after movement
    
    for i = linspace(0,1,N)
        Di = D*i;
        M = trans(Di(1),Di(2),Di(3))*rotx(Di(4))*roty(Di(5))*rotz(Di(6));
        T = pInitial*M;
        Pn = T*P;
        set(h, 'XData', Pn(1,:), ...
            'YData', Pn(2,:), ...
            'ZData', Pn(3,:));
        pause(0.05);
    end
    pFinal = T;
end