%% GetAxisInfo
% manually select two axis(open axis and closed axis) and get the
% coordinates of each ends of the axis.

%% Show the Image
imshow('bkg.png');
hold on;

%% Prompt the coordinates
% Warning : always select left-most location
% Closed Axis
axis_c = zeros(2,2);
axis_c(1,:) = ginput(1);
scatter(axis_c(1,1),axis_c(1,2),'w*');
axis_c(2,:) = ginput(1);
scatter(axis_c(2,1),axis_c(2,2),'w*');
line(axis_c(:,1), axis_c(:,2),'Color','w');

% Open Axis
axis_o = zeros(2,2);
axis_o(1,:) = ginput(1);
scatter(axis_o(1,1),axis_o(1,2),'w*');
axis_o(2,:) = ginput(1);
scatter(axis_o(2,1),axis_o(2,2),'w*');
line(axis_o(:,1), axis_o(:,2),'Color','w');
