clear all
f1 = @(x)((x.^2)-2);
f2 = @(x)((x.^2)-2).^3;
f3 = @(x)((x.^2)-2).^5;

df1 = @(x)(2.*x);
df2 = @(x)(3.*((x.^2)-2).^2).*(2.*x);
df3 = @(x)(5.*((x.^2)-2).^4).*(2.*x);

x = linspace(1, 2, 100);

figure(1)
plot(x, f1(x))
hold on
plot(x, df1(x))
hold off
title("f1 func and derivate")
legend("f1", "df1")

figure(2)
plot(x, f2(x))
hold on
plot(x, df2(x))
hold off
title("f3 func and derivate")
legend("f3", "df3")

figure(3)
plot(x, f3(x))
hold on
plot(x, df3(x))
hold off
title("f5 func and derivate")
legend("f5", "df5")

[zero, res, iterates, flag] = Newton(f1, df1, 2, 10e-8, 100, "s");
[zero2, res2, iterates2, flag2] = Newton(f2, df2, 2, 10e-8, 100, "s");
[zero3, res3, iterates3, flag3] = Newton(f3, df3, 2, 10e-8, 100, "s");


figure(4)
semilogy(abs(f1(iterates(1, :))), "Color", 'b')%modulo dei residui
hold on
semilogy(abs(f2(iterates2(1, :))), "Color", 'g')
semilogy(abs(f3(iterates3(1, :))), "Color", 'r')

semilogy([1+10e-8, abs(iterates(1, 1:end-1)-iterates(1, 2:end))], "Color", 'b', "LineStyle","-.")%modulo dello scarto TODO
semilogy([1+10e-8, abs(iterates2(1, 1:end-1)-iterates2(1, 2:end))], "Color", 'g', "LineStyle","-.")
semilogy([1+10e-8, abs(iterates3(1, 1:end-1)-iterates3(1, 2:end))], "Color", 'r', "LineStyle","-.")

semilogy(abs(sqrt(2)-iterates(1, :)), "Color", 'b', "LineStyle","--") %errore tra zero calcolato e zero al passo n
semilogy(abs(sqrt(2)-iterates2(1, :)), "Color", 'g', "LineStyle","--")
semilogy(abs(sqrt(2)-iterates3(1, :)), "Color", 'r', "LineStyle","--")

legend()

hold off

