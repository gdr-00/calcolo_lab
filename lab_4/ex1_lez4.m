x=linspace(0,1);

f = @(x) exp(x)-2+x; %funzione anonima

figure(1);
plot(x, f(x))

fprintf('%1.0f\n', sign(f(0)*f(1)))

[x,xall,iter] = bisezione(f, 0, 1, 10e-8, 10e6);

x1 = 0.4428544010023885;

figure(2);
semilogy(linspace(0,1, iter), (abs(x1-xall)/abs(x1)))