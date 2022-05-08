clear all

%f = @(x)((x.^2)-2);
f = @(x)((x.^2)-2).^3;
x = 1:0.0001:2;
figure(1)
plot(x, f(x), "LineStyle","-.", "Color", "k")
hold on
plot([1 2], [0 0], "LineStyle","-", "Color", "k")
hold off

[zero, res, wres, iterates, flag] = Bisezione(f, 1, 2, 10e-12, 'm');

fprintf('Last aprox of sol: %1.4f\n Last residual val: %1.4f\n Last weighted residual val: %1.4f\n Flag: %s\n', zero, res, wres, flag)

figure(2)
semilogy(abs(sqrt(2)-iterates(1, :)), "Color", 'b') %errore tra zero calcolato e zero al passo n
hold on
semilogy(abs(f(iterates(1, :))), "Color", 'r')%residui
hold off

%df = @(x)(2.*x);

%figure(3)
%semilogy(iterates(1, :), 1./abs(sqrt(2)-iterates(1, :)), "Color", "b")
%hold on
%semilogy(iterates(1, :), 1./abs(f(iterates(1, :))), "Color", "g")
%plot([1.2 1.5],1/(df(sqrt(2))) , "Color", "r","LineStyle","--")
%hold off