clear
clc


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
xyzpoints = xyzpoints(1:202, :);
path = xyzpoints;


data = load('revised_data_5.mat');
out = data.out;
x = out.x;
y = out.y;


Destination = path(end, :);
for i = 1:length(x)
    currentPosition = [x(i), y(i)];
    if norm(currentPosition - Destination) <= 70
        filterPoint = i;
        break
    end
end

out.x(filterPoint:end) = [];
out.y(filterPoint:end) = [];
out.chi(filterPoint:end) = [];
out.chi_d(filterPoint:end) = [];
out.chi_hat(filterPoint:end)=[];
out.omega_chi(filterPoint:end) = [];
out.omega_chi_d(filterPoint:end) = [];
out.delta_d(filterPoint:end, :) = [];
out.delta(filterPoint:end) = [];
out.U(filterPoint:end) = [];
out.beta_c(filterPoint:end) = [];
out.psi(filterPoint:end) = [];
out.tout(filterPoint:end) = [];
out.u(filterPoint:end) = [];
out.v(filterPoint:end) = [];
out.r(filterPoint:end) = [];


save data_5_filtered.mat