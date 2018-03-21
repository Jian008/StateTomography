% This is the code to reconstruct the state density based on measurements
clc
close all
clear all
warning off;
global n_exp;  % the experimental counting data 
global n_tot;
global Pr;

E = [1 0; 0 1]; X = [0 1; 1 0]; Y = [0 -1i; 1i 0]; Z = [1 0; 0 -1];
S{1} = X; S{2} = Y; S{3} = Z; S{4} = E;
hl = [1; 0]; vl = [0; 1]; dl = [1; 1]/sqrt(2); al = [1; -1]/sqrt(2);
lc = [1; 1i]/sqrt(2); rc = [1; -1]/sqrt(2);
Pr{1} = hl*hl'; Pr{2} = vl*vl'; Pr{3} = dl*dl'; Pr{4} = lc*lc'; 

st = '*+xo#';
NN = 10^4;
rho0 = RandomDensityMatrix(2);
for i = 1:4;
    p(i) = trace(rho0*Pr{i});
end
%%%
n_exp = poissrnd(p*NN); % the experiment data should be input 
n_tot = n_exp(1)+n_exp(2);
par0 = rand(1,4);
rho1 = T2R(par0);
[trace(rho0),trace(rho0*rho0)];
[par,val] = fminunc(@fcost,par0);
rho = T2R(par);
fid = real(trace(sqrtm(sqrtm(rho0)*rho*sqrtm(rho))));
