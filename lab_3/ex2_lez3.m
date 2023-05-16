clear all;
clc;

p = 4.999999999995*10^4;
q=10^(-2); sol_esatta= 10^(-7);

c = -p+sqrt(p^2+q);
c1= q/(p+sqrt(p^2+q));

err = abs(c-sol_esatta)/abs(sol_esatta);
err1= abs(c1-sol_esatta)/abs(sol_esatta);

fprintf('\n\t [ALG.1]: %10.19f', c)
fprintf('\n\t [ALG.2]: %10.19f', c1)

fprintf('\n\t [REl.ERR.1]: %2.2e', err)
fprintf('\n\t [REl.ERR.2]: %2.2e\n', err1)