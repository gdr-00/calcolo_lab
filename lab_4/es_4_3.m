clear all

f = @(x)((x.^2)-2);
x = 1:0.001:2;
figure(1)
plot(x, f(x), "LineStyle","-.", "Color", "k")
hold on
plot([1 2], [0 0], "LineStyle","-", "Color", "k")
hold off

[zero, res, wres, iterates] = Bisezione(f, 1, 2, 10e-12, 'm');

fprintf(['Last aprox of sol: %1.4f' ...
    '\nLast residual val: %1.4f' ...
    '\nLast weighted residual val: %1.4f\n', zero, res, wres])

figure(2)
semilogx(iterates(1, :))