% Used for Motion Planning for Mobile Robots
% Thanks to HKUST ELEC 5660 
close all; clc;
addpath 'A_star';

% Environment map in 2D space 
xStart = 8.0;
yStart = 7.0;
xTarget = 45.0;
yTarget = 40.0;
MAX_X = 50;
MAX_Y = 50;
obstacle_ratio = 0.4;
map = obstacle_map(obstacle_ratio,xStart, yStart, xTarget, yTarget, MAX_X, MAX_Y);
%load('Data/map.mat', 'map', 'MAX_X', 'MAX_Y');
% Waypoint Generator Using the A* 
[Path_found,OPEN,path] = A_star_search(map, MAX_X,MAX_Y);

if Path_found == 1
    disp('Path is found!')
else
    disp('Cannot find a path');
end
% visualize the 2D grid map
visualize_map(map, path,OPEN);

save('Data/map.mat', 'map', 'MAX_X', 'MAX_Y');