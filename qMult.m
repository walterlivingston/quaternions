function [q0] = qMult(p, q)
% QMULT This function multiplies two quaternions p & q.
%   This function multiplies two quaternions as defined by Hamilton. The
%   orientation of rows & columns doesn't matter as the function handles any
%   orientation.
% Inputs:
%   p   :   Quaternion
%   q   :   Quaternion
% Outputs:
%   q0  :   Quaternion Product of p & q
%
% Author: Walter Livingston

    szp = size(p);
    szq = size(q);
    [pFlag, qFlag] = deal(false);
    if szp(1) == 1 || szp(1) > 4
        pFlag = true;
        p = p';
    end
    if szq(1) == 1 || szq(1) > 4
        qFlag = true;
        q = q';
    end
    if size(p) ~= size(q); error('Size of p & q must be equal!'); end

    q0 = [p(1,:).*q(1,:) - p(2,:).*q(2,:) - p(3,:).*q(3,:) - p(4,:).*q(4,:);
          p(1,:).*q(2,:) + p(2,:).*q(1,:) + p(3,:).*q(4,:) - p(4,:).*q(3,:);
          p(1,:).*q(3,:) - p(2,:).*q(4,:) + p(3,:).*q(1,:) + p(4,:).*q(1,:);
          p(1,:).*q(4,:) + p(2,:).*q(3,:) - p(3,:).*q(2,:) + p(4,:).*q(2,:)];

    if pFlag && qFlag; q0 = q0'; end
end