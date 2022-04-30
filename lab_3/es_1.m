clear all

x = linspace(0, 1, 100);

f = @(x)exp(x).*((x.^2)+1);
figure(10)
plot(x, f(x), 'Marker', '*', "Color", [0 0.4470 0.7410])
hold on
plot(x, function_es_1(x), "Marker","+","Color", [0.4940 0.1840 0.5560])
hold off
%prova script 2
string = PlotAsIWant(x, @function_es_1, 1, 'titolo fig', '--k','titolo fig salvata', 'eps' , 1)