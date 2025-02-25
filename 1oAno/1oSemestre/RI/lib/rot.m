function rotMat = rot(angle)
    %ROT Provides 2D rotation matrix for given angle (degrees)
    
    angleRad = angle*pi/180;
    rotMat = [
        cos(angleRad) -sin(angleRad)
        sin(angleRad) cos(angleRad)];
end

