%
function fcst = fcost(par);
global n_exp;
global n_tot;
global Pr;

t = par;
rho = T2R(t);
n = length(Pr);
n_est = n_exp*0;
for i = 1:n;
    n_est(i) = trace(rho*Pr{i})*n_tot;
end
n_sig = (n_est>0);
n_fr = n_est.*(1+n_sig)/2+(1-n_sig);

fcst = sum((n_exp-n_est).^2./n_fr);

