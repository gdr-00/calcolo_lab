clear all;
clc;

delta = [0.1 0.01 0.005 0.0025];
x = zeros(4, 100);
x(1, :) = linspace(1-delta(1), 1+delta(1));
x(2, :) = linspace(1-delta(2), 1+delta(2));
x(3, :) = linspace(1-delta(3), 1+delta(3));
x(4, :) = linspace(1-delta(4), 1+delta(4));

for i = 1:4
    figure(i);
    hold on;
    plot(x(i, :), y1(x(i, :)), '--r')
    plot(x(i, :), y2(x(i, :)), '-b')
    hold off;
end

% Si nota che andando a scomporre in polinomio l'errore viene amplificato a
% causa delle sottrazioni che eseguite tra termini molto vicini in termini 
% relativi portano all'amplificazione dell'errore di calcolo

function y = y1(x)
    y = (1-x).^6;
end

function y = y2(x)
    y = x.^6 - 6.*x.^5 + 15.*x.^4 - 20.*x.^3 + 15.*x.^2 - 6.*x + 1;
end