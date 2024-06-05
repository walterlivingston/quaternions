function [out] = qNorm(q)
% QNORM This function finds the norm of the quaternion q.
%   This function finds the norm of a quaternion. The orientation of rows 
%   & columns doesn't matter as the function handles any orientation.
% Inputs:
%   q   :   Quaternion
% Outputs:
%   out :   Magnitude of the Input Quaternion q
%
% Author: Walter Livingston
    sz = size(q);
    if sz(1) == 1 || sz(1) > 4; q = q'; end
    
    out = sqrt(q(1,:).^2 + q(2,:).^2 + q(3,:).^2 + q(4,:).^2);
end