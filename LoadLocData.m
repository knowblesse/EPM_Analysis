%% LoadLocData
% Load location.csv file exported from ANY-MAZE
% 2018 Knowblesse
%% Load Data
% [filename, pathname] = uigetfile('.csv','Load EPM location file from ANYMAZE');
filename = 'EPM - Test 2.csv';
pathname = 'data\';

fileID = fopen([pathname,filename],'r');

formatSpec = '%s%f%f%f%f%f%f%f';
dataArray = textscan(fileID,formatSpec, 'Delimiter', ',', 'ReturnOnError',false, 'HeaderLines',1);

fid = fclose(fileID);

clearvars fileID formatSpec filename pathname fid

%% Parse Data
Timestamps = zeros(numel(dataArray{1}),1);
for i = 1 : numel(dataArray{1})
    Timestamps(i) = str2double(dataArray{1}{i}(1)) * 3600 ...
                    +str2double(dataArray{1}{i}(3:4)) * 60 ...
                    +str2double(dataArray{1}{i}(6:7)) ...
                    +str2double(dataArray{1}{i}(9:11))/1000;
end
clearvars i
XY = [dataArray{2},dataArray{3}];
if isnan(XY(1,1))
    XY(1,1) = XY(2,1);
    XY(1,2) = XY(2,2);
end
Plane = [dataArray{4}, dataArray{5}, dataArray{6}, dataArray{7}, dataArray{8}];

clearvars dataArray
