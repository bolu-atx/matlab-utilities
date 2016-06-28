% declutter a graph if there's too many data points by performing
% interpolation to reduce the number of points plotted
%
function unclutter(axis_handle, N, min_points, method)
if nargin < 3;min_points = 200;end
if nargin < 4;method = 'spline';end
for i = 1:numel(axis_handle.Children)
    b = axis_handle.Children(i);
    x = b.XData(1:N:end);
    y = b.YData(1:N:end);
    
    % only interpolate if we have more than the minimum required # of data
    % points
    if numel(x) >= min_points 
        x_i = x(1:N:end);
        if method == 'spline'
            y_i = spline(x,y,x_i);
        else
            y_i = interp1(x,y,x_i);
        end
        b.XData = x_i;
        b.YData = y_i;
    end
end
end
