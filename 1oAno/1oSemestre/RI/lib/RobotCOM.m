function MCL = RobotCOM(DH,MCii)
    % MCL - matrix of centers of mass (shape = MCii.shape)
    % MCii - matrix of vectors of COMs on their referencials
    % DH - robot's Denavit-Hartenberg matrix

    AA = Tlinks(DH);
    MCL = zeros(3, size(DH, 1));

    A = eye(4);
    for i = 1:size(DH,1)
        A = A*AA(:,:,i);
    	MCL(:,i) = A(1:3,1:3) * MCii(1:3, i);   % operate only the 3 coordinates
    end

end

