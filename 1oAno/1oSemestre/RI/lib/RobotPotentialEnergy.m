function P = RobotPotentialEnergy(MDH, mm, MCii, g)
    % MCii - matrix of vectors of COMs on their referencials
    % mm - masses (Nx1)
    % MDH - robot's Denavit-Hartenberg matrix (Possible Multiple)
    % g - gravity vector (3x1)
    % P - Total Potential Energy

    P = zeros(1, size(MDH, 3));

    for j=1:size(MDH, 3)
        DH = MDH(:,:,j);
        MCA = RobotCOMabs(DH,MCii);
        for i=1:numel(mm)
            P(j) = P(j) - g'*MCA(:,i)*mm(i);
        end
    end
end

