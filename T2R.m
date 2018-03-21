%
function rho = T2R(par);
t = par;
n = sqrt(length(t));
T = zeros(n,n);
k = 0;
for i = 1:n;
    k = k+1;
    T(i,i) = t(k);
    for j = (i+1):n;
        k = k+1;  rt = t(k);
        k = k+1;  it = t(k);
        T(i,j) = rt+1i*it;
    end
end
R = T*T';
rho = R/trace(R);