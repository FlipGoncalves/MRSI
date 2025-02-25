function Q = invkinSCARA(x,y,z,phi,LA,LB,LC,LD)

    % theta 1 and theta 2
    Q12 = invkinRR(x,y,LB,LC);

    % d3
    d3 = LA - LD - z;

    % theta 4
    Q4 = Q12(1,:)-Q12(2,:)-phi;

    Q = [Q12; [d3 d3]; Q4];

end

