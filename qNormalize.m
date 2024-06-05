function [q0] = qNormalize(q)
% QNORMALIZE This function normalizes the quaternion q.
%   This function normalizes the input quaternion q by dividing the 
%   components of the quaternion by its norm. The orientation of rows & 
%   columns doesn't matter as the function handles any orientation.
% Inputs:
%   q   :   Quaternion
% Outputs:
%   q0  :   Normalized Input Quaternion q
%
% Author: Walter Livingston
    sz = size(q);
    rotFlag = false;
    if sz(1) == 1 || sz(1) > 4
        rotFlag = true;
        q = q'; 
    end

    quatNorm = qNorm(q);
    q0 = q./quatNorm;
    
    if rotFlag; q0 = q0'; end
end