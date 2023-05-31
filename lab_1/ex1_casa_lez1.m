
l = linspace(-3, 3, 1000);

f = @(x) cosh(x);

p = @(x) 1 + x.^2/2 + x.^4/24;

abs_err = @(x) abs(f(x)-p(x));

figure(1);
plot(l, f(l), '--k')
hold on
plot(l, p(l), '-b')

figure(2);
plot(l, abs_err(l))

figure(3);
semilogy(l, abs_err(l))