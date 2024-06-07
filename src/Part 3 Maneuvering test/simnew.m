clear 
clc 
close all
data = importdata('WP2.csv');
total_row=size(data.data,1);
WP=data.data;
WP(:, 1) = [];
WP(:, 3) = 0;
WP(:,[1 2])=WP(:,[2 1]);
WP = flip(WP);
geocenter = [WP(1, 1), WP(1, 2), 0];
xyzpoints= lla2enu(WP,geocenter,'flat');
xyzpoints(:, 3) = [];

xyzpoints = xyzpoints(91: 202, :); % 1:37:124:264

% 1:90:202
path = xyzpoints;

scatter(path(:, 1), path(:, 2))
hold on
plot(path(:, 1), path(:, 2))
x_data = path(1:end, 1)';
y_data = path(1:end, 2)';

x1 = x_data(1);
y1 = y_data(1);
x_data = x_data-x1;
y_data = y_data-y1;
psi0 = atan2(x_data(2)-x_data(1),y_data(2)-y_data(1));
out = sim('demoMarinerPathFollowingCourseControl.slx');

out.x = out.x+x1;
out.y = out.y+y1;

out.x = out.x;
out.y = out.y;
time = out.tout;

plot(out.x, out.y, 'r', LineWidth=1);

save data_5.mat out

