function [] = qPlot(q)
% QPLOT This function plots the quaternion q.
%   This function plots the vector components of q and color codes the 
%   vector based on the scalar component. The orientation of rows & 
%   columns doesn't matter as the function handles any orientation.
% Inputs:
%   q   :   Quaternion
%
% Author: Walter Livingston
    sz = size(q);
    if sz(1) == 1 || sz(1) > 4; q = q'; end

    % (TODO) Optional parameters for font size, color, etc.

    lim = [-0.5, 0.5];
    figure();
    hold('on'); view(3); grid on;
    title('Quaternion Plot');
    xlabel('X-Axis'); ylabel('Y-Axis'); zlabel('Z-Axis');
    xlim(lim); ylim(lim); zlim(lim);
    cmap = colormap('winter');
    zmap = linspace(min(q(1,:)), max(q(1,:)), length(cmap));
    clim([min(q(1,:)), max(q(1,:))]);
    cb = colorbar;
    cb.Label.String = "Scalar Component (w)";
    for k = 2:sz(2)
        color = interp1(zmap, cmap, q(1,k-1));
        quiver3(0, 0, 0, q(2,k-1), q(3,k-1), q(4,k-1), q(1,k), 'Color', color);
    end
end

