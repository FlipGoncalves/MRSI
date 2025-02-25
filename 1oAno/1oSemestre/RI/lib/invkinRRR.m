function Q = invkinRRR(x,y,phi,L1,L2,L3)
    % Returns inverse kinematics of planar RRR robot
    
    Pwx = x - L3*cos(phi);
    Pwy = y - L3*sin(phi);
    
    QA = invkinRR(Pwx, Pwy, L1, L2);
    
    q3 = phi - sum(QA);
    Q = [QA; q3];
end

