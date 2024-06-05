function [eul]=q2Eul(q)
% Q2EUL This function converts a quaternion q into euler angles.
%   This function converts the input quaternion q into euler angles. The 
%   orientation of rows & columns doesn't matter as the function handles 
%   any orientation.
% Inputs:
%   q   :   Quaternion
% Outputs:
%   eul :   (3xN) Vector of Euler Angles (RPY) [radians]
%
% Author: Walter Livingston
    sz = size(q);
    if sz(1) == 1 || sz(1) > 4; q = q'; end

    eul = ...
        [atan2(2*(q(1, :).*q(2, :) + q(3, :).*q(4, :)), 1 - 2*(q(2, :).^2 + q(3, :).^2)); ...
         asin(2*(q(1, :).*q(3, :) - q(2, :).*q(4, :))); ...
         atan2(2*(q(1, :).*q(4, :) + q(2, :).*q(3, :)), 1 - 2*(q(3, :).^2 + q(4, :).^2))];
end