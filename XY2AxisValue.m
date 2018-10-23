function axisValue = XY2AxisValue(XY, axis_c, axis_o)
% Convert XY coordinates to Close axis and Open axis coordinate
axisValue = [(XY-axis_c(1,:)) * (axis_c(2,:)-axis_c(1,:))' ./ norm(axis_c(2,:) - axis_c(1,:))^2,...
             (XY-axis_o(1,:)) * (axis_o(2,:)-axis_o(1,:))' ./ norm(axis_o(2,:) - axis_o(1,:))^2];  
end