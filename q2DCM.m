function [DCM] = q2DCM(q)
% Q2DCM This function converts a quaternion q into a DCM.
%   This function converts the input quaternion q into a direction cosine 
%   matrix. The orientation of rows & columns doesn't matter as the 
%   function handles any orientation.
% Inputs:
%   q   :   Quaternion
% Outputs:
%   DCM :   (3x3xN) Direction Cosine Matrix
%
% Author: Walter Livingston
    sz = size(q);
    if sz(1) == 1 || sz(1) > 4; q = q'; end
    
    DCM = [(q(1,:).^2 + q(2,:).^2 - q(3,:).^2 - q(4,:).^2), 2*(q(2,:).*q(3,:) - q(1,:).*q(4,:)), 2*(q(2,:).*q(4,:) + q(1,:).*q(3,:));
           2*(q(2,:).*q(3,:) + q(1,:).*q(4,:)), (q(1,:).^2 - q(2,:).^2 + q(3,:).^2 - q(4,:).^2), 2*(q(3,:).*q(4,:) - q(1,:).*q(2,:));
           2*(q(2,:).*q(4,:) - q(1,:).*q(3,:)), 2*(q(3,:).*q(4,:) + q(1,:).*q(2,:)), (q(1,:).^2 - q(2,:).^2 - q(3,:).^2 + q(4,:).^2)];
end

