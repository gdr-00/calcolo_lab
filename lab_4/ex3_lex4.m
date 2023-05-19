clear all;
close all;
clc;

f = @(x) exp(x) - 2 + x;

x = linspace(-2,2,100);

% Plot della funzione f in [-2,2]
figure(1)
plot(x,f(x),'b')

% Inizializzo i valori per il metodo di Newton
x0 = 0;
tol = 1e-8;
max_iter = 500;
Df = @(x) exp(x) + 1;
% Metodo di Newton
[x,xall,iter] = newton(f,Df,x0,tol,max_iter);

% Calcolo errore relativo
sol = 0.442854401002389;
err_rel = abs(xall-sol)/sol;

% Plot in semilogy di err_rel
figure(2)
semilogy(1:iter, err_rel,'ko-','MarkerEdgeColor','m')