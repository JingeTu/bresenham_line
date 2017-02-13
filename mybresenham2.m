function [ freex, freey ] = mybresenham2( x1, y1, x2, y2 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
delta_x = x2 - x1;
delta_y = y2 - y1;
freex = [];
freey = [];
if abs(delta_x) > abs(delta_y) % X Axis is the Driving Axis
    j = y1;
    epsilon_bar = abs(delta_y) - abs(delta_x);
    i = x1;
    while i ~= x2
        freex = [freex; i];
        freey = [freey; j];
        if epsilon_bar >= 0
            j = j + sign(delta_y);
            epsilon_bar = epsilon_bar - abs(delta_x);
        end
        i = i + sign(delta_x);
        epsilon_bar = epsilon_bar + abs(delta_y);
    end
else % Y Axis is the Driving Axis
    j = x1;
    epsilon_bar = abs(delta_x) - abs(delta_y);
    i = y1;
    while i ~= y2
        freex = [freex; j];
        freey = [freey; i];
        if epsilon_bar >= 0
            j = j + sign(delta_x);
            epsilon_bar = epsilon_bar - abs(delta_y);
        end
        i = i + sign(delta_y);
        epsilon_bar = epsilon_bar + abs(delta_x);
    end
end

end

