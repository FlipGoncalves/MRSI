function Q = invkinRRRanthro(x,y,z,L1,L2,L3)

    % theta3
    theta3 = acos((x^2 + y^2 + (z-L1)^2 - L2^2 - L3^2)/(2*L2*L3));
    
    if ~isreal(theta3)
        Q = nan(3, 4);
        return
    end
    
    theta3 = [theta3 -theta3];
    
    % theta2
    j = sqrt(L3^2*sin(theta3).^2 + (L3*cos(theta3)+L2).^2 - (z - L1)^2);
    theta2A = 2*atan((L3*cos(theta3) +L2 + j) ./ (L3*sin(theta3) + z - L1));
    theta2B = 2*atan((L3*cos(theta3) +L2 - j) ./ (L3*sin(theta3) + z - L1));
    theta2 = [theta2A, theta2B];

    % theta1
    theta3 = [theta3 theta3];
    k = sign(L3*cos(theta2+theta3) + L2*cos(theta2));
    theta1 = atan2(k*y, k*x);
    
    Q = [theta1; theta2; theta3];

end

