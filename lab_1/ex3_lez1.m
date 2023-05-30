f = @(x) sin(x);

l = linspace(0, 2*pi, 2100);
p = @(x) x-(x.^3)/6;

abs_err = @(x) abs(f(x)-p(x));

figure(1);
plot(l, f(l), '--k', l, p(l), '-b')

figure(2);
plot(l, abs_err(l))

figure(3);
semilogy(l, abs_err(l))