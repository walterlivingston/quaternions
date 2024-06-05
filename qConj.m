function [q0] = qConj(q)
% QCONJ This function finds the conjugate of the quaternion q.
%   This function finds the norm of a quaternion. The orientation of rows 
%   & columns doesn't matter as the function handles any orientation.
% Inputs:
%   q   :   Quaternion
% Outputs:
%   q0  :   Conjugate of the Input Quaternion q
%
% Author: Walter Livingston
    sz = size(q);
    rotFlag = false;
    if sz(1) == 1 || sz(1) > 4
        rotFlag = true;
        q = q'; 
    end

    q0 = [q(1,:); -q(2:4,:)];

    if rotFlag; q0 = q0'; end
end