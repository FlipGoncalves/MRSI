function [QQ,t] = MultiPolyTrajV(Q,N,tt,inter)
    % Returns multiple polinomial trajectory between two postures with null
    % initial and final velocities, and passing through intermediate points
    % Returns:
    % QQ - matrix were each column has joint values for corresponding instant
    % t - vector of time instants for each column of QQ
    % Parameters:
    % Q - matrix with initial, intermediate and final joint values
    % tt - vector of final instants of each via point
    % N - vector of number of points to use in each sub-trajectory
    
    V = zeros(size(Q));

    % calcular vel. intermedias
    if nargin > 3 && inter == 1
        for i=2:size(Q,2)-1
            dq1 = (Q(i) - Q(i-1)) / (tt(i) - tt(i-1));    % vel. no anterior
            dq2 = (Q(i+1) - Q(i)) / (tt(i+1) - tt(i));    % vel. no posterior
    
            m = (sign(dq1) == sign(dq2));

            V(m,i) = (dq1(m) + dq2(m)) / 2;
        end
    end

    QQ = []; t = [];
    
    for i = 1:size(Q,2)-1
        Qi = Q(:,i);
        Qf = Q(:,i+1);
        Vi = V(i);
        Vf = V(i+1);
        t0 = tt(i);
        tf = tt(i+1);
        [q, ttt] = PolyTrajV(Qi,Qf,Vi,Vf,N(i),t0,tf);
        QQ = [QQ q];
        t = [t ttt];
    end
end
