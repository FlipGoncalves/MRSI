function MCA = RobotCOMabs(DH,MCii)
    % MCA - matrix of centers of mass in the fixed frame
    % MCii - matrix of vectors of COMs on their referencials
    % DH - robot's Denavit-Hartenberg matrix

    AA = Tlinks(DH);
    Org = LinkOrigins(AA);
    MCL = RobotCOM(DH,MCii);

    MCA = Org(:,1:end-1) + MCL;
end

