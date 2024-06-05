function [q0] = qInverse(q)
% QINVERSE This function finds inverse of the quaternion q.
%   This function finds the inverse of a quaternion as defined by Hamilton. 
%   The orientation of rows & columns doesn't matter as the function 
%   handles any orientation.
% Inputs:
%   q   :   Quaternion
% Outputs:
%   q0  :   Inverse of the Input Quaternion q
%
% Author: Walter Livingston
    sz = size(q);
    rotFlag = false;
    if sz(1) == 1 || sz(1) > 4
        rotFlag = true;
        q = q'; 
    end

    q0 = qConj(q)./(qNorm(q).^2);

    if rotFlag; q0 = q0'; end
end

