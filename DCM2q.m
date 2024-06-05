function [q] = DCM2q(DCM)
% DCM2Q This function converts a DCM into a quaternion.
%   This function converts the input DCM into a quaternion. The 
%   orientation of rows & columns doesn't matter as the function handles 
%   any orientation.
% Inputs:
%   DCM :   (3x3xN) Direction Cosine Matrix
% Outputs:
%   q   :   Quaternion
%
% Author: Walter Livingston
    q(1,:) = sqrt(0.25*(1 + DCM(1,1,:) + DCM(2,2,:) + DCM(3,3)));
    q(2,:) = sqrt(0.25*(1 - DCM(1,1,:) - DCM(2,2,:) + DCM(3,3)));
    q(3,:) = sqrt(0.25*(1 - DCM(1,1,:) + DCM(2,2,:) - DCM(3,3)));
    q(4,:) = sqrt(0.25*(1 + DCM(1,1,:) - DCM(2,2,:) - DCM(3,3)));
end

