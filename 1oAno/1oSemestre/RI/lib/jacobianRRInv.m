function J = jacobianRRInv(Q,L1,L2)

    q1 = Q(1);
    q2 = Q(2);

    S1 = sin(q1);
    S2 = sin(q2);
    C1 = cos(q1);
    S12 = sin(q1+q2);
    C12 = cos(q1+q2);

    det = L1*L2*S2;

    temp = [
        L2*C12  -L1*C1-L2*C12
        L2*S12  -L1*S1-L2*S12
    ]';

    if det ~= 0
        J = temp/det;
    else
        J = NaN;
    end

end