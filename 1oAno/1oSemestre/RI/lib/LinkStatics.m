function [F,M] = LinkStatics(m,rC,rL,Fp,Mp,g)
    % Params:
    % m - link mass
    % rC - center of mass vector
    % rL - link extremety vector
    % Fp - force applied by i+1
    % Mp - momentum applied by i+1
    % g - gravity vector
    
    F = Fp + m*g;
    M = Mp + m*cross(rC,g) + cross(rL,Fp);

end

