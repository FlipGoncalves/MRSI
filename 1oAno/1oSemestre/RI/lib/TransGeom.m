function M = TransGeom(x, y, alpha)
    %TRANSGEOM Returns homogeneous 2D transformation
    % M - return matrix
    % x - x translation
    % y - y translation
    % a - angle of rotation, in degrees

    alpha = alpha*pi/180;
    M = [cos(alpha) -sin(alpha) x
        sin(alpha) cos(alpha) y
        0 0 1];
end
