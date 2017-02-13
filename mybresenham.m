function [ freex, freey ] = mybresenham( x1, y1, x2, y2 )
%   Caculate Bresenham points between start point (x1, y1) and end point (x2, y2).
%   Start point included in the Bresenham points end point will not.
delta_x = x2 - x1;
delta_y = y2 - y1;
freex = [];
freey = [];

if abs(delta_x) > abs(delta_y) % X is the Driving Axis
    m = abs(delta_y / delta_x);
    epsilon = m - 1;
    j = y1;
    i = x1;
    while i ~= x2 % use while statement instead of for statement, enabling using one statement to cover the two cases of from x1 to x2-1
        freex = [freex; i];
        freey = [freey; j];
        if epsilon >= 0
            j = j + sign(delta_y);
            epsilon = epsilon - 1;
        end
        i = i + sign(delta_x);
        epsilon = epsilon + m;
    end
else % Y is the Driving Axis
    m = abs(delta_x / delta_y);
    epsilon = m - 1;
    j = x1;
    i = y1;
    while i ~= y2
        freex = [freex; j];
        freey = [freey; i];
        if epsilon >= 0
            j = j +sign(delta_x);
            epsilon = epsilon - 1;
        end
        i = i + sign(delta_y);
        epsilon = epsilon + m;
    end
end

end

