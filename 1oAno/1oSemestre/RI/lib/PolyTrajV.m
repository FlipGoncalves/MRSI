function [QQ,t] = PolyTrajV(Q0,Qf,Qv0,Qvf,N,t0,tf)
    % Returns 3rd order polinomial trajectories between two configurations
    % with distinct initial and final velocities
    % Returns:
    % QQ: matrix with N columns, each column contains values of joints in the
    % corresponding instant
    % t: vector with corresponding times to the N instants, between t0 and tf
    % Parameters:
    % Q0: vector of joints' initial positions (theta_0)
    % Qf: vector oj joints' final positions (theta_f)
    % Qv0: vector of initial speed of joints (theta'_0)
    % Qvf: vector of final speed of joints (theta'_f)
    % t0: initial instant of trajectory, in seconds
    % tf: final instant of trajectory, in seconds
    % N: number of points to use in trajectory
    
    t = linspace(t0,tf,N);

    a0 = Q0;
    a1 = Qv0;
    a2 = (3/(tf-t0)^2)*(Qf-Q0) - (2/(tf-t0))*Qv0 - (1/(tf-t0))*Qvf;
    a3 = -(2/(tf-t0)^3)*(Qf-Q0) + (1/(tf-t0)^2)*(Qvf+Qv0);
    
    QQ = a0 + a1*(t-t0) + a2*(t-t0).^2 + a3*(t-t0).^3;
end

