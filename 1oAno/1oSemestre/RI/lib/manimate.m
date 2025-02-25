function Tfinal = manimate(h,P, Tcurr, Tset, ord)
% Animates a transformation on a set of points P
% h - object's graphic handle
% P - object's point matrix in homogeneous format
% Tcurr - transformation matrix of object's initial position
% Tset - hipermatrix of transformations with all successive steps
% ord - 1 for post-multiplication (local) or 0 for pre-multiplication (global) 
% Tfinal - matrix with objects final position after movement

if nargin < 5
    ord = 1;
end

for i = 1:size(Tset, 3)
    if ord
        T = Tcurr*Tset(:,:,i);
    else
        T = Tset(:,:,i)*Tcurr;
    end

    Pn = T*P;
    h.Vertices = Pn(1:3,:)';
    pause(0.05);
end
Tfinal = T;
end

