function J = jacobianRR(Q,L1,L2)

    q1 = Q(1);
    q2 = Q(2);

    S1 = sin(q1);
    C1 = cos(q1);
    S12 = sin(q1+q2);
    C12 = cos(q1+q2);

    J = [
        -L1*S1-L2*S12  -L2*S12
         L1*C1+L2*C12   L2*C12
    ];

end