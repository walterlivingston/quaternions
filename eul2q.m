function [q0] = eul2q(eul)
% EUL2Q This function converts euler angles into a quaternion.
%   This function converts the input vector of euler angles into a 
%   quaternion. The orientation of rows & columns doesn't matter as the 
%   function handles any orientation.
% Inputs:
%   eul :   (3xN) Vector of Euler Angles (RPY) [radians]
% Outputs:
%   q   :   Quaternion
%
% Author: Walter Livingston
% References:
%   - NASA Mission Planning and Analysis Division (July 1977). "Euler Angles, 
%     Quaternions, and Transformation Matrices". NASA. Retrieved 24 May 2021.
    sz = size(eul);
    rotFlag = false;
    if sz(1) == 1 || sz(1) > 3
        rotFlag = true;
        eul = eul';
    end

    ss = sin(eul./2);
    cc = cos(eul./2);
    
    q0 = ...
      [cc(1, :).*cc(2, :).*cc(3, :) + ss(1, :).*ss(2, :).*ss(3, :); ...
       ss(1, :).*cc(2, :).*cc(3, :) - cc(1, :).*ss(2, :).*ss(3, :); ...
       cc(1, :).*ss(2, :).*cc(3, :) + ss(1, :).*cc(2, :).*ss(3, :); ...
       cc(1, :).*cc(2, :).*ss(3, :) - ss(1, :).*ss(2, :).*cc(3, :)];

    if rotFlag; q0 = q0'; end
end

