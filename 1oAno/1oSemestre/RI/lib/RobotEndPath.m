function [X, Y, Z] = RobotEndPath(AAA)
    % Returns path performed by robot with given AAA
    % AAA: obtained through CalculateRobotMotion
    % X, Y, Z: vectors of coordinates
    
    vecSize = size(AAA,4);
    
    X = zeros(1, vecSize);
    Y = zeros(1, vecSize);
    Z = zeros(1, vecSize);
    
    for n = 1:size(AAA,4)
        A = eye(4);
        for j = 1:size(AAA,3)
            A = A * AAA(:,:,j,n);
        end
    
        X(n) = A(1,4);
        Y(n) = A(2,4);
        Z(n) = A(3,4);
    end
end

