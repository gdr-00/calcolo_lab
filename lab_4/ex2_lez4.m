clear all;
close all;
clc;

f = @(x) sin(x) + x -1;

% Plot con scala di default della funzione f
figure(1)
fplot(f);

% Estremi dell'intervallo contenente lo zero
a = 0; b = 1;

% La funzione di punto fisso relativa ad f
g = @(x) -sin(x) + 1;

x = linspace(a,b,100);

% Plot tra g e la prima bisettrice
figure(2)
plot(x,g(x),'b')
hold on;
plot(x,x,'r')

% Inizializzo i valori
x0 = 0.5;
tol = 1e-8;
max_iter = 500;

% Metodo del punto fisso
[x,xall,iter] = puntofisso(g,x0,tol,max_iter);

sol = 0.510973429388569;
err_rel = abs(sol-xall)/sol;

% Plot in scala semilogy dell'errore relativo
figure(3)
semilogy(1:iter,err_rel,'ko-','MarkerFaceColor','g')