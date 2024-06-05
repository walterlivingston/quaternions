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
    
    DCM = zeros(3,3,sz(2));
    for i = 1:max(sz(2))
            DCM(:,:,i) = [(q(1,i).^2 + q(2,i).^2 - q(3,i).^2 - q(4,i).^2), 2*(q(2,i).*q(3,i) - q(1,i).*q(4,i)), 2*(q(2,i).*q(4,i) + q(1,i).*q(3,i));
                          2*(q(2,i).*q(3,i) + q(1,i).*q(4,i)), (q(1,i).^2 - q(2,i).^2 + q(3,i).^2 - q(4,i).^2), 2*(q(3,i).*q(4,i) - q(1,i).*q(2,i));
                          2*(q(2,i).*q(4,i) - q(1,i).*q(3,i)), 2*(q(3,i).*q(4,i) + q(1,i).*q(2,i)), (q(1,i).^2 - q(2,i).^2 - q(3,i).^2 + q(4,i).^2)];
    end
end

