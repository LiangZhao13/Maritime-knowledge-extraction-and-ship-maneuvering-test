clear 
clc


out = resampleData('data_5.mat');
save revised_data_5.mat out

function out = resampleData(fileName)
data = load(fileName);
out = data.out;

nrows = length(out.U);
sample_t = 100; % sample time = sample_t*0.1 s, in this case, 10 s
out.tout = 0.1:0.1:length(out.U)/10;

new_x = [];
new_y = [];
new_chi = [];
new_chi_d = [];
new_t = [];
new_chi_hat = [];
new_tout = [];
new_U = [];
new_delta_d = [];

new_delta= [];
new_omega_chi = [];
new_omega_chi_d = [];
new_beta = [];

new_psi = [];
new_u = [];
new_v = [];
new_r = [];

for i = 1: sample_t: nrows
    new_beta = [new_beta; out.beta_c(i)];
    new_psi = [new_psi; out.psi(i)];
    new_u = [new_u; out.u(i)];
    new_v = [new_v; out.v(i)];
    new_r = [new_r; out.r(i)];
    new_x= [new_x; out.x(i)];
    new_y= [new_y; out.y(i)];
    new_chi = [new_chi; out.chi(i)];
    new_chi_d = [new_chi_d; out.chi_d(i)];
    new_chi_hat = [new_chi_hat; out.chi_hat(i)];
    new_tout = [new_tout; out.tout(i)];
    new_U = [new_U; out.U(i)];
    new_delta_d = [new_delta_d; out.delta_d(i)];
    new_delta = [new_delta; out.delta_d(i)];
    new_omega_chi = [new_omega_chi; out.omega_chi(i)];
    new_omega_chi_d = [new_omega_chi_d; out.omega_chi_d(i)];
    new_t = [new_t; out.tout(i)];
end
out.x = new_x;
out.y = new_y;
out.chi = new_chi;
out.chi_d = new_chi_d;
out.tout = new_t;
out.chi_hat = new_chi_hat;
out.tout = new_tout;
out.U = new_U;
out.delta_d = new_delta_d;

out.delta = new_delta;
out.omega_chi = new_omega_chi;
out.omega_chi_d = new_omega_chi_d;
out.beta_c = new_beta;

out.psi = new_psi;
out.u = new_u;
out.v = new_v;
out.r = new_r;

end

