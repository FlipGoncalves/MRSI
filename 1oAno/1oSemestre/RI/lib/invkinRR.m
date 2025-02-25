function Q = invkinRR(x,y,L1,L2)
    % returns both solutions to a planar RR robot, each column a solution set

    theta2A = acos((x*x + y*y - L1*L1 - L2*L2) / (2*L1*L2));

    if ~isreal(theta2A)
        Q = NaN(2);
        return
    end

    Q = zeros(2);
    Q(2,:) = [theta2A -theta2A];
    Q(1,:) = atan2( ...
        (y*(L1+L2*cos(Q(2,:))) - x*L2*sin(Q(2,:))), ...
        (x*(L1+L2*cos(Q(2,:))) + y*L2*sin(Q(2,:))) ...
    );
end

