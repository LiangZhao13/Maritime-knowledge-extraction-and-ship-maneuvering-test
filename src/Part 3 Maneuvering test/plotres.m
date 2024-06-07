clear 
clc
close all
% % 
% figure('Position',[500 10 1000 600],'Renderer','zbuffer');
% g = geoaxes(Basemap="satellite");
% 
% box on
% set(gca,'linewidth',1);
% set(gca,'FontName','Times New Roman', 'FontSize',16)
% title('AIS trajectory', 'FontName','Times New Roman',  'FontSize',20, 'FontWeight', 'bold');
% g.LatitudeLabel.String = 'Latitude';
% g.LongitudeLabel.String = 'Longitude';
% g.TickLabelFormat = "-dd";
% hold on
% data = importdata('WP.csv');
% WP=data.data;
% WP(:, 1) = [];
% geoplot(g,WP(:,2),WP(:,1),...,
%          Color='r', Marker= 'o', LineWidth=1, Parent=g)
% hold on 

% legend('AIS trajectory', ...
%     'FontSize', 12,'FontName','Times New Roman', 'FontWeight', 'bold')
% 

[U, chi, chi_d,chi_hat, omega_chi, omega_chi_d,t,u, v,r,psi,beta, x, y, delta_d, delta]  = vcload('data_5_filtered.mat');
t = t./3600/24;


% SATELLITE IMAGE

figure('Position',[500 10 1000 600],'Renderer','zbuffer');
g = geoaxes(Basemap="satellite");
box on
set(gca,'linewidth',1);
set(gca,'FontName','Times New Roman', 'FontSize',16)
title('Tracking results', 'FontName','Times New Roman',  'FontSize',20, 'FontWeight', 'bold');
g.LatitudeLabel.String = 'Latitude';
g.LongitudeLabel.String = 'Longitude';
g.TickLabelFormat = "-dd";
hold on
data = importdata('WP2.csv');
WP=data.data;
WP(:, 1) = [];
WP = flip(WP);
geoplot(g,WP(1:202,2),WP(1:202,1),...,
         Color='g', Marker= 'o', LineWidth=1, Parent=g)
hold on
traj = local2ll([x y], 'WP2.csv');
% geoplot(g,traj(:,1),traj(:,2),...,
%          Color='r', LineWidth=1.5, Parent=g)
geoplot(traj(:, 1), traj(:, 2), 'r-', 'lineWidth', 1.5); 
hold on
% [U, chi, chi_d, omega_chi,t,u, v,w,phi,theta,beta, x, y, propeller, thrust] = vcload('revised_data_4_filtered.mat');
% traj = local2ll([x y]);
% geoplot(traj(:, 1), traj(:, 2), 'r-', 'lineWidth', 1.5); 
hold on 

legend('AIS points', 'Our model',...
    'FontSize', 12,'FontName','Times New Roman', 'FontWeight', 'bold')
savefig('results\results 5\tracking.fig')



figure('Position',[500 10 600 500],'Renderer','zbuffer');
g = geoaxes(Basemap="satellite");
box on
set(gca,'linewidth',1);
set(gca,'FontName','Times New Roman', 'FontSize',12)
title('Model ship trajectory', 'FontName','Times New Roman',  'FontSize',16, 'FontWeight', 'bold');
g.LatitudeLabel.String = 'Latitude';
g.LongitudeLabel.String = 'Longitude';
g.TickLabelFormat = "-dd";
hold on
data = importdata('WP2.csv');
WP=data.data;
WP(:, 1) = [];
WP = flip(WP);
geoplot(g,WP(:,2),WP(:,1),...,
         Color='g', Marker= 'o', LineWidth=1, Parent=g)
hold on
traj = local2ll([x y], 'WP2.csv');

geoplot(traj(:, 1), traj(:, 2), 'r-', 'lineWidth', 1.5); 
hold on
% [U, chi, chi_d, omega_chi,t,u, v,w,phi,theta,beta, x, y, propeller, thrust] = vcload('revised_data_2_filtered.mat');
% traj = local2ll([x y]);
% geoplot(traj(:, 1), traj(:, 2), 'r-', 'lineWidth', 1.5); 
hold on 

legend('AIS points', 'Ship trajectory',...
    'FontSize', 12,'FontName','Times New Roman', 'FontWeight', 'bold')
savefig('results\results 5\zoomin.fig')

%% profile
% speed
figure
set (gcf,'Position',[300,100,600,600]);
subplot(3, 1, 2)
box on;
set(gca,'linewidth',1);
set(gca,'FontName','Times New Roman', 'FontSize',12)
title('Speed','FontName','Times New Roman',  'FontSize',14, 'FontWeight', 'bold')
xlabel('Time (days)',  'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold');
ylabel('U (knots)',  'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold');
hold on
% [v, chi, chi_d, t, x, y, propeller, thrust] = vcload('simulation_proposed_profile.mat');
plot(t, U./0.5144444, 'r', 'lineWidth', 1.5);
hold on
legend('U',  'FontSize',12,'FontWeight', 'bold', 'location', 'Southeast');

% course angle
subplot(311)
box on
set(gca,'linewidth',1);
set(gca,'FontName','Times New Roman', 'FontSize',12)
title('Course command', 'FontName','Times New Roman',  'FontSize',14, 'FontWeight', 'bold');
xlabel('Time (days)',  'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold');
ylabel('\chi (rad)',  'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold');
hold on
plot(t, chi_hat, 'r', 'lineWidth', 1.5);
plot(t, chi_d, 'b', 'lineWidth', 1);
% plot(t, chi_hat, 'g', 'lineWidth', 1);
legend('\chi', '\chi_d','FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold', 'location', 'northeast');

% rudder angle
subplot(313)
box on
set(gca,'linewidth',1);
set(gca,'FontName','Times New Roman', 'FontSize',12)
title('Rudder command', 'FontName','Times New Roman',  'FontSize',14, 'FontWeight', 'bold');
xlabel('Time (days)',  'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold');
ylabel('\delta (rad)',  'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold');
hold on
% beta = mod(pi+beta, 2*pi)- pi;
plot(t, delta, 'r', 'lineWidth', 2);
plot(t, delta_d, 'b', 'lineWidth', 1);
legend('\delta', '\delta_d','FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold', 'location', 'Southeast');
savefig('results\results 5\command.fig')


%% angles
figure
% course rate
set (gcf,'Position',[300,100,600,600]);
subplot(311)
box on
set(gca,'linewidth',1);
set(gca,'FontName','Times New Roman', 'FontSize',12)
title('Course rate', 'FontName','Times New Roman',  'FontSize',14, 'FontWeight', 'bold');
xlabel('Time (days)',  'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold');
ylabel('\omega_\chi (rad/s)',  'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold');
hold on
plot(t, omega_chi, 'r', 'lineWidth', 1.5);
plot(t, omega_chi_d, 'b', 'lineWidth', 1);
legend('\omega_\chi','\omega_\chi_d', 'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold', 'location', 'northeast');

% Psi
subplot(312)
box on
set(gca,'linewidth',1);
set(gca,'FontName','Times New Roman', 'FontSize',12)
title('Heading angle', 'FontName','Times New Roman',  'FontSize',14, 'FontWeight', 'bold');
xlabel('Time (days)',  'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold');
ylabel('\psi (rad)',  'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold');
hold on
plot(t, psi, 'r', 'lineWidth', 1.5);
legend('\psi', 'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold', 'location', 'Northeast');

% crab angle
subplot(313)
box on
set(gca,'linewidth',1);
set(gca,'FontName','Times New Roman', 'FontSize',12)
title('Crab angle', 'FontName','Times New Roman',  'FontSize',14, 'FontWeight', 'bold');
xlabel('Time (days)',  'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold');
ylabel('\beta_c (rad)',  'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold');
hold on
plot(t, beta, 'r', 'lineWidth', 1.5);
legend('\beta_c', 'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold', 'location', 'Northeast');
savefig('results\results 5\angle.fig')

%% linear velocity u,v,w
figure
% u
set (gcf,'Position',[300,100,600,600]);
subplot(3, 1, 1)
box on;
set(gca,'linewidth',1);
set(gca,'FontName','Times New Roman', 'FontSize',12)
title('Surge speed (knots)','FontName','Times New Roman',  'FontSize',14, 'FontWeight', 'bold')
xlabel('Time (days)',  'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold');
ylabel('u (knots)',  'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold');
hold on
% [v, chi, chi_d, t, x, y, propeller, thrust] = vcload('simulation_proposed_profile.mat');
plot(t, u./0.5144444+U/0.51444444, 'r', 'lineWidth', 1.5);
hold on
legend('u',  'FontSize',12,'FontWeight', 'bold', 'location', 'Southeast');

% v
subplot(3, 1,2)
box on;
set(gca,'linewidth',1);
set(gca,'FontName','Times New Roman', 'FontSize',12)
title('Sway speed (knots)','FontName','Times New Roman',  'FontSize',14, 'FontWeight', 'bold')
xlabel('Time (days)',  'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold');
ylabel('v (knots)',  'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold');
hold on
% [v, chi, chi_d, t, x, y, propeller, thrust] = vcload('simulation_proposed_profile.mat');
plot(t, v./0.5144444, 'r', 'lineWidth', 1.5);
hold on
legend('v',  'FontSize',12,'FontWeight', 'bold', 'location', 'Southeast');


subplot(3, 1, 3)
box on;
set(gca,'linewidth',1);
set(gca,'FontName','Times New Roman', 'FontSize',12)
title('Yaw rate (rad/s)','FontName','Times New Roman',  'FontSize',14, 'FontWeight', 'bold')
xlabel('Time (days)',  'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold');
ylabel('r (rad/s)',  'FontSize',12,'FontName','Times New Roman', 'FontWeight', 'bold');
hold on
% [v, chi, chi_d, t, x, y, propeller, thrust] = vcload('simulation_proposed_profile.mat');
plot(t, r, 'r', 'lineWidth', 1.5);
hold on
legend('r',  'FontSize',12,'FontWeight', 'bold', 'location', 'Southeast');
savefig('results\results 5\velocity.fig')




%% subrouting funcions


function [U, chi, chi_d,chi_hat, omega_chi, omega_chi_d,t,u, v,r,psi,beta, x, y, delta_d, delta] = vcload(filename)
data = load(filename);
out = data.out;
U = out.U;
U(1) = 0;
% t = 0.1:0.1:length(U)/10;
t = out.tout;
chi = calculateChi(out.chi, t);
chi_d = calculateChi(out.chi_d, t);
chi_hat = out.chi_hat;
x = out.x;
y = out.y;
delta_d = out.delta_d;
delta = out.delta;
u = out.u; 
v = out.v;
r = out.r;
psi = out.psi;

beta = out.beta_c;
omega_chi = out.omega_chi;
omega_chi_d = out.omega_chi_d;
% cooridanate change, chi is originally based on the north axis
% we need to change it to east axis

function chi = calculateChi(chi, t)
% for i = 1:length(t)
%     if chi(i) < -pi
%         chi(i) = 2*pi + chi(i);
%     elseif chi(i) > pi
%         chi(i) = chi(i) - 2*pi;
%     end
% end
% for i = 1:length(chi)
%     if (0< chi(i)) && (chi(i) <= pi/2)
%         chi(i) = pi/2 - chi(i);
%     elseif (pi/2 < chi(i))&& (chi(i)<= pi)
%         chi(i) = -(chi(i)-pi/2);
%         continue
%     elseif (-pi/2 < chi(i))&& (chi(i) <= 0)
%         chi(i) = -chi(i) + pi/2;
%         continue
%     elseif (-pi < chi(i))&& (chi(i)<= -pi/2)
%         chi(i) = -(3/2*pi + chi(i));
%         continue
%     end
% end
end

function Thrust = CalThrust(propeller)
    Thrust = zeros(2,length(propeller));
    k_pos = 0.02216/2;                      % Positive Bollard, one propeller 
    k_neg = 0.01289/2;                      % Negative Bollard, one propeller 
    n_max =  sqrt((0.5*24.4 * 9.81)/k_pos);    % maximum propeller rev. (rad/s)
    n_min = -sqrt((0.5*13.6 * 9.81)/k_neg);    % minimum propeller rev. (rad/s)
    n = propeller';
    for k = 1:length(propeller)
        for i = 1:1:2
            if n(i, k) > n_max              % saturation, physical limits
               n(i, k) = n_max; 
            elseif n(i, k) < n_min
               n(i, k) = n_min; 
           end
    
           if n(i, k) > 0                          
             Thrust(i, k) = k_pos * n(i, k)*abs(n(i, k));    % positive thrust (N) 
           else
             Thrust(i, k) = k_neg * n(i, k)*abs(n(i, k));    % negative thrust (N) 
           end
        end
    end
    Thrust = Thrust';    
end

end

function waypointLLA = local2ll(path, filename)
    
    data = importdata(filename);
    WP=data.data;
    WP(:, 1) = [];
    WP(:, 3) = 0;
    WP(:,[1 2])=WP(:,[2 1]);
    WP = flip(WP);
    geocenter = [WP(1, 1), WP(1, 2), 0];
    altitude = 0*ones(size(path,1),1);
    localENU = [path(:,1) path(:,2) altitude];
    waypointLLA = enu2lla(localENU,geocenter,"flat");
end
